Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D632C810D
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 10:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgK3Ja6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 04:30:58 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:48182 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgK3Jax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 04:30:53 -0500
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id EB98E421109;
        Mon, 30 Nov 2020 09:30:05 +0000 (UTC)
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
        (Authenticated sender: cengiz@kernel.wtf)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B5BC51BF210;
        Mon, 30 Nov 2020 09:28:57 +0000 (UTC)
From:   Cengiz Can <cengiz@kernel.wtf>
To:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cengiz Can <cengiz@kernel.wtf>
Subject: [PATCH] media: vidtv: fix read after free
Date:   Mon, 30 Nov 2020 12:28:26 +0300
Message-Id: <20201130092825.28532-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

`vidtv_channel_si_destroy` function has a call to
    `vidtv_psi_pat_table_destroy` that frees Program Association Table.

However it is followed by a loop that iterates over the count of Program
Map Tables. This obviously accesses an invalid memory.

Eliminate this by making a copy of num_pmt before free'ing Program
Association Table and loop on it instead.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 8ad6c0744d36..4af39a8786a7 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -503,10 +503,13 @@ int vidtv_channel_si_init(struct vidtv_mux *m)
 void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
 	u32 i;
+	u16 num_pmt;
+
+	num_pmt = m->si.pat->num_pmt;
 
 	vidtv_psi_pat_table_destroy(m->si.pat);
 
-	for (i = 0; i < m->si.pat->num_pmt; ++i)
+	for (i = 0; i < num_pmt; ++i)
 		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
 
 	kfree(m->si.pmt_secs);
-- 
2.29.2


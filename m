Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36A82C66D7
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgK0N2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:28:35 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48379 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgK0N2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:28:34 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kidnc-0008F8-FQ; Fri, 27 Nov 2020 13:28:32 +0000
From:   Colin King <colin.king@canonical.com>
To:     "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: vidtv: fix a read from an object after it has been freed
Date:   Fri, 27 Nov 2020 13:28:32 +0000
Message-Id: <20201127132832.15239-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the call to vidtv_psi_pat_table_destroy frees the object
m->si.pat however m->si.pat->num_pmt is being accessed after the
free.  Fix this by destroying m->si.pat after the m->si.pmt_secs[]
objects have been freed.

Addresses-Coverity: ("Read from pointer after free")
Fixes: 039b7caed173 ("media: vidtv: add a PID entry for the NIT table")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index 8ad6c0744d36..7838e6272712 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -504,11 +504,11 @@ void vidtv_channel_si_destroy(struct vidtv_mux *m)
 {
 	u32 i;
 
-	vidtv_psi_pat_table_destroy(m->si.pat);
-
 	for (i = 0; i < m->si.pat->num_pmt; ++i)
 		vidtv_psi_pmt_table_destroy(m->si.pmt_secs[i]);
 
+	vidtv_psi_pat_table_destroy(m->si.pat);
+
 	kfree(m->si.pmt_secs);
 	vidtv_psi_sdt_table_destroy(m->si.sdt);
 	vidtv_psi_nit_table_destroy(m->si.nit);
-- 
2.29.2


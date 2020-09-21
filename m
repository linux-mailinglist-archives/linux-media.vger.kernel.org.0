Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2224C2722E7
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgIULo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:44:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5220B2145D;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=P7WGZP6A+ChGkmdwEOLUV49/gCzQmkxBCRXqvrWdFsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BA+eGFVIc/mERvkd6q8l1Q2xr66LsJArtCikh3MB65YpknzN8OOkSQRra0tFfKeyd
         4yjTSyelHjbeldaknYliBBa4Fl1xbi6MjYmPgfdMzc5PVFQ2LZlhf9FQbpjcBuIwdB
         SvsxQ9UVt6C7STGTlDm2DUh1CFY/9PDXU1UCCSZo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEV-0004V6-WB; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/9] media: vidtv: simplify PCR logic to get jiffies
Date:   Mon, 21 Sep 2020 13:43:38 +0200
Message-Id: <f82934ace40f53346310af731a354b28118281ce.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to have a check when setting timing.past_jiffies,
as we can simply do the initialization earlier at vidtv_mux_init().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index 43b13aa3a8bc..6a3123c51cc4 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -100,11 +100,7 @@ static void vidtv_mux_update_clk(struct vidtv_mux *m)
 	/* call this at every thread iteration */
 	u64 elapsed_time;
 
-	/* this will not hold a value yet if we have just started */
-	m->timing.past_jiffies = m->timing.current_jiffies ?
-				 m->timing.current_jiffies :
-				 get_jiffies_64();
-
+	m->timing.past_jiffies = m->timing.current_jiffies;
 	m->timing.current_jiffies = get_jiffies_64();
 
 	elapsed_time = jiffies_to_usecs(m->timing.current_jiffies -
@@ -449,6 +445,7 @@ struct vidtv_mux *vidtv_mux_init(struct dvb_frontend *fe,
 	m->pcr_pid = args.pcr_pid;
 	m->transport_stream_id = args.transport_stream_id;
 	m->priv = args.priv;
+	m->timing.current_jiffies = get_jiffies_64();
 
 	if (args.channels)
 		m->channels = args.channels;
-- 
2.26.2


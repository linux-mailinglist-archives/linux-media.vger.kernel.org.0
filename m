Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C372C239A
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbgKXLGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:06:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:33626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731911AbgKXLGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:31 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE7212076B;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=kXtk9K9yAiPnSdLWAKHJSOrEjH0updRultC40wsPkKE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=y9uII6tuQ2VBmUUW9/zOG8yWeMNig2nBe1meDWZ1V+N51/VI/AOl9oMf5+xnVYmL6
         kzmWfcjRVPrT086LMFeL122/pDMyGf/DIO2T20EN0mGVK/AO95TFzd80EME7Lwt8Li
         p8zvOBQPgHWgNExG/uXAUX4C5j96ZjI/zMr7lPRM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZl-Rn; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 10/31] media: vidtv: remove some unused functions
Date:   Tue, 24 Nov 2020 12:06:06 +0100
Message-Id: <b97f84bac798157e3cadafe5fbedc10e4121fe4c.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, there's no need to access the length of some
tables. So, drop the unused functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 35 --------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 375e01480d3d..341af312ad56 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -89,41 +89,6 @@ static void vidtv_psi_update_version_num(struct vidtv_psi_table_header *h)
 	h->version++;
 }
 
-static u16
-vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
-{
-	u16 mask;
-	u16 ret;
-
-	mask = GENMASK(11, 0);
-
-	ret = be16_to_cpu(s->bitfield) & mask;
-	return ret;
-}
-
-static u16
-vidtv_psi_pmt_stream_get_desc_loop_len(struct vidtv_psi_table_pmt_stream *s)
-{
-	u16 mask;
-	u16 ret;
-
-	mask = GENMASK(9, 0);
-
-	ret = be16_to_cpu(s->bitfield2) & mask;
-	return ret;
-}
-
-static u16 vidtv_psi_pmt_get_desc_loop_len(struct vidtv_psi_table_pmt *p)
-{
-	u16 mask;
-	u16 ret;
-
-	mask = GENMASK(9, 0);
-
-	ret = be16_to_cpu(p->bitfield2) & mask;
-	return ret;
-}
-
 static u16 vidtv_psi_get_sec_len(struct vidtv_psi_table_header *h)
 {
 	u16 mask;
-- 
2.28.0


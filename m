Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EF126D820
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgIQJvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:50030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgIQJvk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:51:40 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFB9420770;
        Thu, 17 Sep 2020 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600336300;
        bh=n/YC7eduiIDbX7VkSmjnb6JIV2ngNISfBPKt+AOGhwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c/XzRXpGa+5OM2aNLaRb0xZWrWCQVEEPJhkjkdmu9KrB6OU2S/CJJizJO4Jhcpzhx
         QKnWxuNNVF0UgQhyL5mZ//PhEl3uvvc8bJ62xxUTC+WWHkn6Psubq76a4F04QTKYrm
         Cai7VWlWNvOGblqfSmcGP03kFumZj0U54hy+2rs8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kIqZl-0055pB-9Q; Thu, 17 Sep 2020 11:51:37 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: vidtv: remove an impossible condition
Date:   Thu, 17 Sep 2020 11:51:36 +0200
Message-Id: <1f1dffea21b43217658ed11c4b43da2b512ae9f3.1600336293.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <87e2446460f3feed58c89954529151645b959b19.1600336293.git.mchehab+huawei@kernel.org>
References: <87e2446460f3feed58c89954529151645b959b19.1600336293.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by smatch:

	drivers/media/test-drivers/vidtv/vidtv_psi.c:93 vidtv_psi_update_version_num() warn: impossible condition '(h->version > 32) => (0-31 > 32)'

h_version is declared as:

		u8  version:5;

Meaning that its value ranges from 0 to 31. Incrementing 31 on such
data will overflow to zero, as expected.

So, just drop the uneeded overflow check.

While here, use "foo++" instead of "++foo", as this is a much
more common pattern.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index b8b638244b1d..8cdf645b4fdd 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -89,9 +89,7 @@ static inline u32 dvb_crc32(u32 crc, u8 *data, u32 len)
 
 static void vidtv_psi_update_version_num(struct vidtv_psi_table_header *h)
 {
-	++h->version;
-	if (h->version > MAX_VERSION_NUM)
-		h->version = 0;
+	h->version++;
 }
 
 static inline u16 vidtv_psi_sdt_serv_get_desc_loop_len(struct vidtv_psi_table_sdt_service *s)
-- 
2.26.2


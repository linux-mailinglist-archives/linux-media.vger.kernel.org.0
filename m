Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C3A3DAFC2
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 01:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhG2XSA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 19:18:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhG2XSA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 19:18:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 991B260F46;
        Thu, 29 Jul 2021 23:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627600676;
        bh=eLhWlByByA0Yc4wkJEjt4npcpC34h5H2IwUrHGl3WF8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxnjwSFhxE+LGrvQjJXu1JjMXfgG9odBIa+zGM0bMqfKmkQ1m83B8X7POcFquUihk
         sm3D0BwEfnm840DJoptNpC6+01gNVD2O87j1twTLtjCdiimW2hRugvY8lZRbn6kqMW
         cAKZ/bnl4WS/t9lvPdr2fR7nvgGGWoV0JLKCg6nu0ky2bQ/xkc80sSdwctuBj3K/qW
         HIgzi8qFpX8IDyCvHtt587J6OK8TDWiwdh5Hk+QFy/JSwwyWyHatxrI7+IIZNQ2ASi
         PDy63+zmWxelauRbR4zDVpVUIX1E6XMA5HIy39ggNDGwN4MXNRUqj22D8CWi7LV0CC
         NdF7o6tm6Pg+w==
Date:   Thu, 29 Jul 2021 18:20:28 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 1/2][next] media: staging/intel-ipu3: css: Fix wrong size
 comparison
Message-ID: <19339bd9b40f224cbd80a8f6bd990750fcf2d446.1627600430.git.gustavoars@kernel.org>
References: <cover.1627600430.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627600430.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a wrong comparison of the total size of the loaded firmware
css->fw->size with the size of a pointer to struct imgu_fw_header.

Fix this by using the right operand 'struct imgu_fw_header' for
sizeof, instead of 'struct imgu_fw_header *'

Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/staging/media/ipu3/ipu3-css-fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 45aff76198e2..ab021afff954 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -124,7 +124,7 @@ int imgu_css_fw_init(struct imgu_css *css)
 	/* Check and display fw header info */
 
 	css->fwp = (struct imgu_fw_header *)css->fw->data;
-	if (css->fw->size < sizeof(struct imgu_fw_header *) ||
+	if (css->fw->size < sizeof(struct imgu_fw_header) ||
 	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
 		goto bad_fw;
 	if (sizeof(struct imgu_fw_bi_file_h) +
-- 
2.27.0


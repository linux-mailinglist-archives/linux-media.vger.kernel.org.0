Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64343DAFC4
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 01:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbhG2XUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 19:20:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:44976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229975AbhG2XUM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 19:20:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9056760C40;
        Thu, 29 Jul 2021 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627600808;
        bh=pMtsokc+ndNjg/6npoelU7EHgkJ/JVkmNGh9tksS8JQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RCS8dMSRS4V+z71xOZGTagLPGbWPl+X7H1jAnCV6OqgV4ytNGIqoMpurT8rWTJ7Ic
         PCb406pHtI2x8GOnFf87s0yKbaqyuYmr6VtveamlPCc50gCJjZfNAQnzFnuzW4MTPt
         S39QB3HwzElypgvekkfQEGjsQOYdp6HNgIlT5R+ltHVXshM18KnHrBllNxBuG58tq3
         qrLDEecXbR+ickmqt8c+hAfnAXDS5rU+tFU/M/ILX9YWZ+3+8jO3Ra1byjgJRl0bFH
         KZvaMV4FzNaVBKk0kyrpXqee8uGlfc2DXwHjikg6xqGgEZcsaEVI2JMHEM0ya7rmAA
         v4VncQ/4o3kow==
Date:   Thu, 29 Jul 2021 18:22:40 -0500
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
Subject: [PATCH 2/2][next] media: staging/intel-ipu3: css: Replace
 one-element array and use struct_size() helper
Message-ID: <8db90c8f5124bbeab20af9c1314439da8f033184.1627600430.git.gustavoars@kernel.org>
References: <cover.1627600430.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1627600430.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use “flexible array members”[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Replace a one-element array with a flexible-array member in struct
imgu_fw_header and use the struct_size() helper.

This also helps with the ongoing efforts to globally enable
-Warray-bounds and get us closer to being able to tighten the
FORTIFY_SOURCE routines on memcpy().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.10/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/79
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/staging/media/ipu3/ipu3-css-fw.c | 5 ++---
 drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index ab021afff954..3b7df1128840 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -127,9 +127,8 @@ int imgu_css_fw_init(struct imgu_css *css)
 	if (css->fw->size < sizeof(struct imgu_fw_header) ||
 	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
 		goto bad_fw;
-	if (sizeof(struct imgu_fw_bi_file_h) +
-	    css->fwp->file_header.binary_nr * sizeof(struct imgu_fw_info) >
-	    css->fw->size)
+	if (struct_size(css->fwp, binary_header,
+			css->fwp->file_header.binary_nr) > css->fw->size)
 		goto bad_fw;
 
 	dev_info(dev, "loaded firmware version %.64s, %u binaries, %zu bytes\n",
diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 3c078f15a295..c0bc57fd678a 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
 
 struct imgu_fw_header {
 	struct imgu_fw_bi_file_h file_header;
-	struct imgu_fw_info binary_header[1];	/* binary_nr items */
+	struct imgu_fw_info binary_header[];	/* binary_nr items */
 };
 
 /******************* Firmware functions *******************/
-- 
2.27.0


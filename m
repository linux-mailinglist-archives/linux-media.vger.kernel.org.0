Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8333DB83F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 14:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238809AbhG3MHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 08:07:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238804AbhG3MHQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 08:07:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3307360C41;
        Fri, 30 Jul 2021 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627646832;
        bh=ApOBTQ8PTH21zHn50z+zaDwWcp2TaGB8koeuLY0/XmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZOMFHIzw16y3LhPxjoI628FhsyujZuwy1W5sb2TfHXzH1OzKQxMdkilJC9H/ypm6X
         EYicGdiL54rEhMXwHZRHxWL+lcetOVuHThiN3fWwA/m30FLa3WMLr8ozVqOYYc4ynC
         dJxDFyQhMS2z2wXTpFYx87kCjW891z0o3aZrWSGT5fGInv2xzsU1lzkvBJYkGMpu5w
         rVb47DNwU1KWoNbZt6IVyvWpYhLzVgPjSaKi4prKkD0F2GshNkXFXikbEKRq/Db87x
         AGUcr8bN89Uzdn8afEevKlckiI5nwEGWIAccMLNCWbO8ab9c0AIa9zaGajhSifVpoN
         3fp/RgwaMw3vQ==
Date:   Fri, 30 Jul 2021 07:09:44 -0500
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
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2 2/2] media: staging/intel-ipu3: css: Use the struct_size()
 helper
Message-ID: <4da2e05ea7b19a729859d2c34aa2b17a970422e8.1627646101.git.gustavoars@kernel.org>
References: <cover.1627646101.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627646101.git.gustavoars@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make use of the struct_size() helper instead of an open-coded version.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Move the replacement of one-element array with a flexible-array
   member to patch 1 of the series and update changelog text,
   accordingly.

 drivers/staging/media/ipu3/ipu3-css-fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 630cb5186b48..b9c850fc9fe4 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -127,9 +127,8 @@ int imgu_css_fw_init(struct imgu_css *css)
 	if (css->fw->size <= sizeof(struct imgu_fw_header) ||
 	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
 		goto bad_fw;
-	if (sizeof(struct imgu_fw_bi_file_h) +
-	    css->fwp->file_header.binary_nr * sizeof(struct imgu_fw_info) >
-	    css->fw->size)
+	if (struct_size(css->fwp, binary_header,
+			css->fwp->file_header.binary_nr) > css->fw->size)
 		goto bad_fw;
 
 	dev_info(dev, "loaded firmware version %.64s, %u binaries, %zu bytes\n",
-- 
2.27.0


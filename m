Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4AE260F74
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgIHKPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:15:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728676AbgIHKMc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:12:32 -0400
Received: from mail.kernel.org (ip5f5ad5ce.dynamic.kabel-deutschland.de [95.90.213.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE6052177B;
        Tue,  8 Sep 2020 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599559951;
        bh=vW65TbwI8SwZiwFXgxSf5xZsxuSUgeC5F1theLDAloE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XOTKlvG5RcCQyQUg8lIy9/a/rI0DPNURl0LHFw87QllN/YnsnO1dSvU2sO5+vmnIZ
         yibeTs10ffagpvTOkXTtm1U9VSw1fqKzjSDLLfq9i8xvyBnfy6OIksjg2FNmjuSAfv
         wdaHeNeoG8dk0Vo5jCikWEnmkGJywKXPyHnl9mIE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kFac1-00B3qb-1w; Tue, 08 Sep 2020 12:12:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] media: atomisp: get rid of some cleanup leftovers
Date:   Tue,  8 Sep 2020 12:12:22 +0200
Message-Id: <1e7968e715e23b90ab4994b32301a6cf4faffca8.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code that used to check for ISP2400/2401 version were
using the revision number in order to decide wheather
version should be used. With the new version, the code
doesn't need to check anymore for ISP version.

Fixes: ca133c395f2f ("media: atomisp: improve device detection code")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 8c1d5a3b8f45..304857bffc6a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1429,7 +1429,6 @@ atomisp_load_firmware(struct atomisp_device *isp)
  */
 static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	unsigned int a0_max_id = 0;
 	const char *name;
 	const char *product;
 
@@ -1437,11 +1436,9 @@ static bool is_valid_device(struct pci_dev *pdev, const struct pci_device_id *id
 
 	switch (id->device & ATOMISP_PCI_DEVICE_SOC_MASK) {
 	case ATOMISP_PCI_DEVICE_SOC_MRFLD:
-		a0_max_id = ATOMISP_PCI_REV_MRFLD_A0_MAX;
 		name = "Merrifield";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_BYT:
-		a0_max_id = ATOMISP_PCI_REV_BYT_A0_MAX;
 		name = "Baytrail";
 		break;
 	case ATOMISP_PCI_DEVICE_SOC_ANN:
-- 
2.26.2


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286002251A6
	for <lists+linux-media@lfdr.de>; Sun, 19 Jul 2020 13:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgGSLex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 07:34:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgGSLex (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 07:34:53 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E75B920734;
        Sun, 19 Jul 2020 11:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595158492;
        bh=uVWHh1TqjC+xE6xa1USm9QdMA2OAnJSw/OW+SY+sf7w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=leDcwIaInJFE/EUWPaKZz04R6jjvPKM03rxtvj7Cfb1MtYX61gSqt4Xk7Z7NcI02c
         0mcuTuMLTjqyTbbYeKS49HSITMSemNVTaEBlfNPajwJzeqovBPawWCClYbF4nGeym5
         XQCF86PWCwpNb/7aCIND+boDi6Gi4hmIpAOVZieI=
Date:   Sun, 19 Jul 2020 13:34:48 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: fix mask and shift operation on
 ISPSSPM0
Message-ID: <20200719133448.481cffc5@coco.lan>
In-Reply-To: <20200716145138.1708693-1-colin.king@canonical.com>
References: <20200716145138.1708693-1-colin.king@canonical.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 16 Jul 2020 15:51:38 +0100
Colin King <colin.king@canonical.com> escreveu:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check on bits 25:24 on ISPSSPM0 is always 0 because
> the mask and shift operations are incorrect. Fix this by shifting
> by MRFLD_ISPSSPM0_ISPSSS_OFFSET (24 bits right) and then masking
> with RFLD_ISPSSPM0_ISPSSC_MASK (0x03) to get the appropriate 2 bits
> to check.
> 
> Addresses-Coverity: ("Operands don't affect result")
> Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

With this patch, we can revert this one too (patch enclosed):

	d0213061a501 ("media: atomisp: fix mask and shift operation on ISPSSPM0")

I tested it already: the IUNIT power on/off code is working properly
after both patches.

Thanks,
Mauro

-
[PATCH] Revert "media: atomisp: keep the ISP powered on when setting it"

changeset d0213061a501 ("media: atomisp: fix mask and shift operation on ISPSSPM0")
solved the existing issue with the IUNIT power on code.

So, the driver can now use the right code again.

This reverts commit 95d1f398c4dc3f55e9007c89452ccc16301205fc.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index e31195816b2d..a000a1e316f7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -766,17 +766,13 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_down(struct atomisp_device *isp)
 {
-	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
-//	return atomisp_mrfld_power(isp, false);
+	return atomisp_mrfld_power(isp, false);
 }
 
 /* Workaround for pmu_nc_set_power_state not ready in MRFLD */
 int atomisp_mrfld_power_up(struct atomisp_device *isp)
 {
-	return 0;
-// FIXME: at least with ISP2401, the code below causes the driver to break
-//	return atomisp_mrfld_power(isp, true);
+	return atomisp_mrfld_power(isp, true);
 }
 
 int atomisp_runtime_suspend(struct device *dev)



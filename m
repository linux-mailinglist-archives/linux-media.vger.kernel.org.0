Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7026319950F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbgCaLMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 07:12:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730598AbgCaLMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 07:12:14 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5599721655;
        Tue, 31 Mar 2020 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585653133;
        bh=DALzt/FJfquJVMbS1+ZsDlPO6AUGLZN1JoXKZscQY/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y1K5Yd+H3KLgver58wNIGGRtc6/neEUwv2clYcYzpXFIIXMfuGGJWzeXIRfxirqQf
         n/UmTbR/imLXyhXCev1zJKD5xk/IGD5WaDHWSamtGyergBZZjztrnDa8PYODrgmErt
         M/xYxmXabMEPSDnXj851GQzZhyQPTB6BLPxMGGok=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJEoV-002bqv-FE; Tue, 31 Mar 2020 13:12:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 14/33] media: Kconfig: simplify some dependencies
Date:   Tue, 31 Mar 2020 13:11:50 +0200
Message-Id: <9b0c6c97a54e471e3d773256cd42fbc0e53ee368.1585651678.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585651678.git.mchehab+huawei@kernel.org>
References: <cover.1585651678.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

both DVB_CORE and VIDEO_DEV already depends on MEDIA_SUPPORT,
as they're below an if block.

So, remove this double dependency.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index dc0cc42d48ad..f6763d02f1be 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -125,7 +125,6 @@ source "drivers/media/mc/Kconfig"
 
 config VIDEO_DEV
 	tristate
-	depends on MEDIA_SUPPORT
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
 
 config VIDEO_V4L2_SUBDEV_API
@@ -146,7 +145,6 @@ source "drivers/media/v4l2-core/Kconfig"
 
 config DVB_CORE
 	tristate
-	depends on MEDIA_SUPPORT
 	depends on MEDIA_DIGITAL_TV_SUPPORT
 	depends on (I2C || I2C=n)
 	default y
-- 
2.25.1


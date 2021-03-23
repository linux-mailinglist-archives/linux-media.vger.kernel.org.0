Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B9C345A1A
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCWIxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:53:06 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:49701 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229500AbhCWIwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:52:36 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Ocm7luxcEUzyrOcmAlOqWY; Tue, 23 Mar 2021 09:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616489554; bh=MN9IPHtr+CvDYLsmbD3k+DduvsYrf4T5+K7yrXcAH9M=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pWxA0lC84rWRdyfyXJ17U4FFeKJCVabz0wpY3dP0BdRHpPobGj4XsdIMhvPacJbEN
         IgBacUQHB3jF+hvN2ImDHmvHU0w6RpytQdrdR70S2piiymwSeJvGdX5Rc9tZf8xo8B
         v6hQExWtvEPKdYNAX9EOvieVoq0ljB6+45yykEV4dcPXxiYQmCothawHItwA3RuAIb
         Dwa5hOmgB5NhCT0MKkMpDCqp/yQKKKsjvLoJjGkhU4v7IDYWS11TwW3HYeltWVfG+n
         lLryixSnpFTd63EfW8iGRW7+IKNxrjzJr3ZzCNhf2X3iDrfwsJVZ7mjlrhIlE8FTDJ
         FvYpCHrId9b2w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] exynos-gsc/gsc-core.h: fix kernel-doc warnings
Message-ID: <77fc038c-70c3-b9b9-fc68-21cffac2f53d@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:52:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHbzk39exP4tkf7Gs6BQBoJ4qL+2U8Na9FN/6vyD8h5ID0KNUeWlYf53jhVZ+m01GA+axkOya5dywdL9LbFaw+L2ZkLwcMHMqGpXsQ980QZa5pUy0BsZ
 RWJady7zrTDXAfghCrAWjsZjn7TDFe9F7snHrARgEabmEv3G1Zvw9G42/VTof7q0jDIbrmkNEvEnlulpxDlsDgJmY8rPL95V8FD3xHHB7+GaWVEyCPHrGMW9
 PSOvdnjGEb+08W9D3G9srQtfdVgUHdwANPbGFYruvKFO8cYButfo9zu+s6WLKlMt
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes these kernel-doc warnings:

drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Enum value 'GSC_MIXER' not described in enum 'gsc_datapath'
drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Enum value 'GSC_FIMD' not described in enum 'gsc_datapath'
drivers/media/platform/exynos-gsc/gsc-core.h:76: warning: Excess enum value 'GSC_LOCAL' description in 'gsc_datapath'
drivers/media/platform/exynos-gsc/gsc-core.h:124: warning: Function parameter or member 'color' not described in 'gsc_fmt'
drivers/media/platform/exynos-gsc/gsc-core.h:124: warning: Function parameter or member 'num_comp' not described in 'gsc_fmt'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_max' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_min' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pix_align' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'in_buf_cnt' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'out_buf_cnt' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'sc_up_max' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'sc_down_max' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'poly_sc_down_max' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'pre_sc_down_max' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:297: warning: Function parameter or member 'local_sc_down' not described in 'gsc_variant'
drivers/media/platform/exynos-gsc/gsc-core.h:310: warning: Function parameter or member 'clk_names' not described in 'gsc_driverdata'
drivers/media/platform/exynos-gsc/gsc-core.h:310: warning: Function parameter or member 'num_clocks' not described in 'gsc_driverdata'
drivers/media/platform/exynos-gsc/gsc-core.h:340: warning: Function parameter or member 'num_clocks' not described in 'gsc_dev'
drivers/media/platform/exynos-gsc/gsc-core.h:340: warning: Function parameter or member 'v4l2_dev' not described in 'gsc_dev'
drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'rotation' not described in 'gsc_ctx'
drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'hflip' not described in 'gsc_ctx'
drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'vflip' not described in 'gsc_ctx'
drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'gsc_ctrls' not described in 'gsc_ctx'
drivers/media/platform/exynos-gsc/gsc-core.h:376: warning: Function parameter or member 'out_colorspace' not described in 'gsc_ctx'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/platform/exynos-gsc/gsc-core.h b/drivers/media/platform/exynos-gsc/gsc-core.h
index a2eeb8affe0d..e894e85e84a4 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/exynos-gsc/gsc-core.h
@@ -64,14 +64,11 @@ enum gsc_irq {
  * enum gsc_datapath - the path of data used for G-Scaler
  * @GSC_CAMERA: from camera
  * @GSC_DMA: from/to DMA
- * @GSC_LOCAL: to local path
  * @GSC_WRITEBACK: from FIMD
  */
 enum gsc_datapath {
 	GSC_CAMERA = 0x1,
 	GSC_DMA,
-	GSC_MIXER,
-	GSC_FIMD,
 	GSC_WRITEBACK,
 };

@@ -104,10 +101,11 @@ enum gsc_yuv_fmt {
  * struct gsc_fmt - the driver's internal color format data
  * @mbus_code: Media Bus pixel code, -1 if not applicable
  * @pixelformat: the fourcc code for this format, 0 if not applicable
+ * @color: color encoding
  * @yorder: Y/C order
  * @corder: Chrominance order control
  * @num_planes: number of physically non-contiguous data planes
- * @nr_comp: number of physically contiguous data planes
+ * @num_comp: number of physically contiguous data planes
  * @depth: per plane driver's private 'number of bits per pixel'
  * @flags: flags indicating which operation mode format applies to
  */
@@ -280,7 +278,7 @@ struct gsc_pix_align {
 	u16 target_h;
 };

-/**
+/*
  * struct gsc_variant - G-Scaler variant information
  */
 struct gsc_variant {
@@ -301,6 +299,9 @@ struct gsc_variant {
  *
  * @variant: the variant information for this driver.
  * @num_entities: the number of g-scalers
+ * @clk_names: clock names
+ * @num_clocks: the number of clocks in @clk_names
+ * @num_entities: the number of g-scalers
  */
 struct gsc_driverdata {
 	struct gsc_variant *variant[GSC_MAX_DEVS];
@@ -316,12 +317,14 @@ struct gsc_driverdata {
  * @pdev:	pointer to the G-Scaler platform device
  * @variant:	the IP variant information
  * @id:		G-Scaler device index (0..GSC_MAX_DEVS)
+ * @num_clocks:	number of clocks required for G-Scaler operation
  * @clock:	clocks required for G-Scaler operation
  * @regs:	the mapped hardware registers
  * @irq_queue:	interrupt handler waitqueue
  * @m2m:	memory-to-memory V4L2 device information
  * @state:	flags used to synchronize m2m and capture mode operation
  * @vdev:	video device for G-Scaler instance
+ * @v4l2_dev:	v4l2_device for G-Scaler instance
  */
 struct gsc_dev {
 	spinlock_t			slock;
@@ -348,12 +351,16 @@ struct gsc_dev {
  * @scaler:		image scaler properties
  * @flags:		additional flags for image conversion
  * @state:		flags to keep track of user configuration
+ * @rotation:		rotation
+ * @hflip:		horizontal flip
+ * @vflip:		vertical flip
  * @gsc_dev:		the G-Scaler device this context applies to
  * @m2m_ctx:		memory-to-memory device context
  * @fh:                 v4l2 file handle
  * @ctrl_handler:       v4l2 controls handler
- * @gsc_ctrls		G-Scaler control set
+ * @gsc_ctrls:		G-Scaler control set
  * @ctrls_rdy:          true if the control handler is initialized
+ * @out_colorspace:     the colorspace of the OUTPUT queue
  */
 struct gsc_ctx {
 	struct gsc_frame	s_frame;

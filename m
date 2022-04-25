Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F7150E9F4
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 22:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245153AbiDYUQO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 16:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245146AbiDYUQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 16:16:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBFC1240F3
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 13:13:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D686B496;
        Mon, 25 Apr 2022 22:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650917584;
        bh=j9/h+Lzb9JQyfGPMnzoJXPO4nHAqhL/GoRpG4bxJMsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TKoC0lda7s8K8Md3H4iZCkAGPifICnLhOW6LiAlM/ZtamGLI+CioPIcAr+gCRHgwu
         /qPMOLt2fJO9fcsBZx/g+cSA9iw/cGuwEWmX3E1uFCXSArh6clOuqFnvrL1IBPyZjA
         Sdf2/whLngHebdxKfUad5R9XpGWWvvuiS1Y8Yqu0=
Date:   Mon, 25 Apr 2022 23:13:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 14/21] media: rkisp1: debug: Collect input status by
 sampling ISP_FLAGS_SHD
Message-ID: <YmcAz7TJA+VXoyL4@pendragon.ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-15-laurent.pinchart@ideasonboard.com>
 <YmaBGMrrbt5/v1vO@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmaBGMrrbt5/v1vO@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Mon, Apr 25, 2022 at 01:08:08PM +0200, Ricardo Ribalda wrote:
> Laurent Pinchart wrote:
> 
> > The ISP_FLAGS_SHD register exposes the ISP parallel input signals (data
> > and synchronization) in real time. This can help debugging when the
> > device doesn't output any image. Sample the register 10000 times with a
> > 1µs delay and expose the result through debugfs.
> 
> I think this is quite clever :)

Thank you :-)

> Out of curiosity, how long does reading the debug file takes?

# time cat /sys/kernel/debug/32e10000.isp/input_status
[...]
real    0m 0.03s
user    0m 0.00s
sys     0m 0.02s

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> > ---
> > Changes since v3:
> > 
> > - Fix pm_runtime_get_if_in_use() return value handling
> > 
> > Changes since v2:
> > 
> > - Handle runtime PM
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 54 +++++++++++++++++++
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 ++++
> >  2 files changed, 63 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index 64b33774cbdf..782a696ac587 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -9,9 +9,61 @@
> >   */
> >  
> >  #include <linux/debugfs.h>
> > +#include <linux/delay.h>
> >  #include <linux/device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/seq_file.h>
> >  
> >  #include "rkisp1-common.h"
> > +#include "rkisp1-regs.h"
> > +
> > +#define RKISP1_DEBUG_DATA_COUNT_BINS	32
> > +#define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> > +
> > +static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
> > +{
> > +	struct rkisp1_device *rkisp1 = m->private;
> > +	u16 data_count[RKISP1_DEBUG_DATA_COUNT_BINS] = { };
> > +	unsigned int hsync_count = 0;
> > +	unsigned int vsync_count = 0;
> > +	unsigned int i;
> > +	u32 data;
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> > +	if (ret <= 0)
> > +		return ret ? : -ENODATA;
> > +
> > +	/* Sample the ISP input port status 10000 times with a 1µs interval. */
> > +	for (i = 0; i < 10000; ++i) {
> > +		val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_FLAGS_SHD);
> > +
> > +		data = (val & RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK)
> > +		     >> RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT;
> > +		data_count[data / RKISP1_DEBUG_DATA_COUNT_STEP]++;
> > +
> > +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC)
> > +			hsync_count++;
> > +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC)
> > +			vsync_count++;
> > +
> > +		udelay(1);
> > +	}
> > +
> > +	pm_runtime_put(rkisp1->dev);
> > +
> > +	seq_printf(m, "vsync: %u, hsync: %u\n", vsync_count, hsync_count);
> > +	seq_puts(m, "data:\n");
> > +	for (i = 0; i < ARRAY_SIZE(data_count); ++i)
> > +		seq_printf(m, "- [%04u:%04u]: %u\n",
> > +			   i * RKISP1_DEBUG_DATA_COUNT_STEP,
> > +			   (i + 1) * RKISP1_DEBUG_DATA_COUNT_STEP - 1,
> > +			   data_count[i]);
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
> >  
> >  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  {
> > @@ -42,6 +94,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  			     &debug->frame_drop[RKISP1_MAINPATH]);
> >  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
> >  			     &debug->frame_drop[RKISP1_SELFPATH]);
> > +	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> > +			    &rkisp1_debug_input_status_fops);
> >  }
> >  
> >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > index a93d0127b813..2b322db97252 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > @@ -454,6 +454,15 @@
> >  #define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
> >  #define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
> >  
> > +/* ISP_FLAGS_SHD */
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_SHD		BIT(0)
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_INFORM_SHD	BIT(1)
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_INFORM_FIELD		BIT(2)
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK		GENMASK(27, 16)
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT		16
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC		BIT(30)
> > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC		BIT(31)
> > +
> >  /* AWB */
> >  /* ISP_AWB_PROP */
> >  #define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)

-- 
Regards,

Laurent Pinchart

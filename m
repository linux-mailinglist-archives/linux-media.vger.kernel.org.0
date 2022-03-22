Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00544E3C2E
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 11:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbiCVKKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 06:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbiCVKKo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 06:10:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDE9237CC
        for <linux-media@vger.kernel.org>; Tue, 22 Mar 2022 03:09:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D4019DE;
        Tue, 22 Mar 2022 11:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647943755;
        bh=3mMMvKKuTg8j1tHGxiq6dtyJy+jtrsTSbR4Jo0VK+E0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swDxa3oPdt4SJs/LLEXtBGrgbXB6f+HoUEoGDAqwTirPejy9IuJThpM6nV04w/xfN
         LFaAjHO2RyUUZ8eO8LXDfqM5h5Xfpk/xbXNcYzEsfEoE0iDoSMiaPQItveJmQ6O7Gw
         a++AABWhEBsPWDoZHjoBeAn091Ng5St+6l7LyVn4=
Date:   Tue, 22 Mar 2022 12:08:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 15/17] media: rkisp1: debug: Add debugfs files to dump
 core and ISP registers
Message-ID: <YjmgOrnshghJfMJ2@pendragon.ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-16-laurent.pinchart@ideasonboard.com>
 <20220322052520.qiyf23lo4zuyuxfw@guri>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220322052520.qiyf23lo4zuyuxfw@guri>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Mar 22, 2022 at 07:25:20AM +0200, Dafna Hirschfeld wrote:
> On 19.03.2022 18:30, Laurent Pinchart wrote:
> > It's useful to dumb the value of registers for debugging purpose. Add
> > two debugfs files to dump key core and ISP registers.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > index da3ed0ab697a..97be529a74e8 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > @@ -17,6 +17,70 @@
> >  #include "rkisp1-common.h"
> >  #include "rkisp1-regs.h"
> >  
> > +struct rkisp1_debug_register {
> > +	u32 offset;
> 
> I'd call it 'reg' or 'address' instead of 'offset' since it is really what we call reg

OK, will fix in v4.

> > +	const char * const name;
> > +};
> > +
> > +#define RKISP1_DEBUG_REG(name)	{ RKISP1_CIF_##name, #name }
> > +
> > +static int rkisp1_debug_dump_regs(struct seq_file *m,
> > +				  const struct rkisp1_debug_register *regs)
> > +{
> > +	struct rkisp1_device *rkisp1 = m->private;
> > +	u32 val;
> > +	int ret;
> > +
> > +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> > +	if (ret)
> > +		return ret;
> 
> Same comment as in the data collection patch, should it be
> if (ret <= 0)
> 	return ret;
> ?

Sure.

> > +
> > +	for ( ; regs->name; ++regs) {
> > +		val = rkisp1_read(rkisp1, regs->offset);
> > +		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> > +	}
> > +
> > +	pm_runtime_put(rkisp1->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkisp1_debug_dump_core_regs_show(struct seq_file *m, void *p)
> > +{
> > +	static const struct rkisp1_debug_register registers[] = {
> > +		RKISP1_DEBUG_REG(VI_CCL),
> > +		RKISP1_DEBUG_REG(VI_ICCL),
> > +		RKISP1_DEBUG_REG(VI_IRCL),
> > +		RKISP1_DEBUG_REG(VI_DPCL),
> > +		RKISP1_DEBUG_REG(MI_CTRL),
> > +		RKISP1_DEBUG_REG(MI_BYTE_CNT),
> > +		RKISP1_DEBUG_REG(MI_CTRL_SHD),
> > +		RKISP1_DEBUG_REG(MI_RIS),
> > +		RKISP1_DEBUG_REG(MI_STATUS),
> > +		RKISP1_DEBUG_REG(MI_DMA_CTRL),
> > +		RKISP1_DEBUG_REG(MI_DMA_STATUS),
> > +		{ /* Sentinel */ },
> > +	};
> > +
> > +	return rkisp1_debug_dump_regs(m, registers);
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_core_regs);
> > +
> > +static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
> > +{
> > +	static const struct rkisp1_debug_register registers[] = {
> > +		RKISP1_DEBUG_REG(ISP_CTRL),
> > +		RKISP1_DEBUG_REG(ISP_ACQ_PROP),
> > +		RKISP1_DEBUG_REG(ISP_FLAGS_SHD),
> > +		RKISP1_DEBUG_REG(ISP_RIS),
> > +		RKISP1_DEBUG_REG(ISP_ERR),
> > +		{ /* Sentinel */ },
> > +	};
> > +
> > +	return rkisp1_debug_dump_regs(m, registers);
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
> > +
> >  #define RKISP1_DEBUG_DATA_COUNT_BINS	32
> >  #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> >  
> > @@ -68,6 +132,7 @@ DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
> >  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  {
> >  	struct rkisp1_debug *debug = &rkisp1->debug;
> > +	struct dentry *regs_dir;
> >  
> >  	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
> >  
> > @@ -96,6 +161,13 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> >  			     &debug->frame_drop[RKISP1_SELFPATH]);
> >  	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> >  			    &rkisp1_debug_input_status_fops);
> > +
> > +	regs_dir = debugfs_create_dir("regs", debug->debugfs_dir);
> > +
> > +	debugfs_create_file("core", 0444, regs_dir, rkisp1,
> > +			    &rkisp1_debug_dump_core_regs_fops);
> > +	debugfs_create_file("isp", 0444, regs_dir, rkisp1,
> > +			    &rkisp1_debug_dump_isp_regs_fops);
> >  }
> >  
> >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)

-- 
Regards,

Laurent Pinchart

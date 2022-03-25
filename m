Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81504E7D49
	for <lists+linux-media@lfdr.de>; Sat, 26 Mar 2022 01:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiCYTb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 15:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiCYTbQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 15:31:16 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DF32986C3
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 12:06:04 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id C08543200E60;
        Fri, 25 Mar 2022 14:22:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 25 Mar 2022 14:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=ZQaUt0eCTfYL4u
        8m73mJTEsm09yFeWFLaBKPQ1lqkjA=; b=o139iP8rjeQyQna4QS4rWAjpKEjClX
        U+gE56Bz7w8B5rU5P3HvqKZ1Mv2KI68XZRahUahNLbFw/ua4KXqnKRSge0nOykOr
        fMKmDLZt56tkP4T1qaYkgTEn8OuIvgvhKiNJFIcPoRTLKtRUTwdwjnzOO1IE0c4P
        iWECV3FTZv99/O+JMYwilnaY6MciHuNCDa42rKMDcrZz4cjajIJGFwPdW8SK3UBY
        hxCvqirdM+MrvEZ9GGXTnORbKJmuR0FmXseO51ALX2BEigGsDMzRLamYsgQhtIoe
        CbaIhfpEXoRAJhwXNfL2pLaElOWvco1EJDOVPjYAJoEA4Wkz3lxyO+Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ZQaUt0eCTfYL4u8m73mJTEsm09yFeWFLaBKPQ1lqk
        jA=; b=PpmnFm73cuD/U+3b9pRgdVOBThLK6fVGpHfkTHdCmBZoFevpO76OYr1O5
        qLRwDUl95NwBlS7Mc9kAiZc+aZJpkpT6FlwjSZn6r4U7HHvpC+wy93+Qwusl8fU/
        DLOjQUybuIqV1FMKy7q71Id7YL3dJXSyJUNnyNMvzeDgA+wdZDtzP9JXrrYhvHig
        +9rhFBtxKnVJT1J/5zAAD9b5a9pUQq13HbRWMJ6J5CGdP8FsXAN8FhBwZWW6Fyd0
        ivc42qG3hpqaLo03+y52wVawqdTODAGyYO1dPNvhEyjYCVUg76QmBip75Uvjoe6N
        For/YYUcWXEAxk4nU0auSrq5QMGmA==
X-ME-Sender: <xms:bwg-Ymo5P1yVfscqWQGjQJkgkL830aSNvnI_aLuD5GKZXUqcIRWEBw>
    <xme:bwg-YkrKLja6c0xSz0N3HmUyUr6HVvMeClZH9YMS1u6GFT2Sob-xY8LKXBtjXkDtW
    uewjJKof2k1kD1IOIg>
X-ME-Received: <xmr:bwg-YrP1QruvPg5gWPk6-Jp-uNWDzCkuZ26bqHZkR7bvvRew9B6Lww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeffrghf
    nhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqne
    cuggftrfgrthhtvghrnhepvedtgedugeetueeuueetueefheekuddvgeffgeejffejledv
    ueeigeekkeevveefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:bwg-Yl7bKORqv_OAsg2S0lqau7aGoTCe2we85W7jFAxyyIOj6nwzXg>
    <xmx:bwg-Yl6fZ9WoPYWGXgVPGYrOVGNBT2DpOJyN5zcIo2okgLpJj27u_Q>
    <xmx:bwg-Yljr2-Vs2wsQMfmfA0jfIwdcQNFwW_Ni0js_T7Dw4nmArrgefg>
    <xmx:cAg-Yo3mnP4cDPz2ySTAF_PVZmjZGlEb_-09L4PzxOIHotP4sBFghw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 14:22:38 -0400 (EDT)
Date:   Fri, 25 Mar 2022 21:22:34 +0300
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 14/17] media: rkisp1: debug: Collect input status by
 sampling ISP_FLAGS_SHD
Message-ID: <20220325182234.dba4h4fglqsnj6d2@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-15-laurent.pinchart@ideasonboard.com>
 <20220322035624.mpkrod4g42xgpyfy@guri>
 <YjmJmoIxWcCdyrgl@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YjmJmoIxWcCdyrgl@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22.03.2022 10:32, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Tue, Mar 22, 2022 at 05:56:24AM +0200, Dafna Hirschfeld wrote:
> > On 19.03.2022 18:30, Laurent Pinchart wrote:
> > > The ISP_FLAGS_SHD register exposes the ISP parallel input signals (data
> > > and synchronization) in real time. This can help debugging when the
> > > device doesn't output any image. Sample the register 10000 times with a
> > > 1µs delay and expose the result through debugfs.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 54 +++++++++++++++++++
> > >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 ++++
> > >  2 files changed, 63 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > > index 64b33774cbdf..da3ed0ab697a 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> > > @@ -9,9 +9,61 @@
> > >   */
> > >  
> > >  #include <linux/debugfs.h>
> > > +#include <linux/delay.h>
> > >  #include <linux/device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/seq_file.h>
> > >  
> > >  #include "rkisp1-common.h"
> > > +#include "rkisp1-regs.h"
> > > +
> > > +#define RKISP1_DEBUG_DATA_COUNT_BINS	32
> > > +#define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> > > +
> > > +static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
> > > +{
> > > +	struct rkisp1_device *rkisp1 = m->private;
> > > +	u16 data_count[RKISP1_DEBUG_DATA_COUNT_BINS] = { };
> > 
> > Since this is just a counter, it could be int/short
> 
> Isn't u16 a short already ? Or do you mean using "short" instead of
> "u16" ? That would be functionally equivalent, but I picked u16 to make
> the size explicit, given that it has to hold values up to 10000.

I know that u# types are meant mainly/only to configure hardware, so I
suggested 's/u16/short/' , but I don't really care.

Thanks,
Dafna

> 
> > > +	unsigned int hsync_count = 0;
> > > +	unsigned int vsync_count = 0;
> > > +	unsigned int i;
> > > +	u32 data;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> > > +	if (ret)
> > > +		return ret;
> > 
> > We want to return here if the device is not is use right?
> > If so we should return if (ret <= 0)
> 
> Correct, I'll fix that.
> 
> > > +
> > > +	/* Sample the ISP input port status 10000 times with a 1µs interval. */
> > > +	for (i = 0; i < 10000; ++i) {
> > > +		val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_FLAGS_SHD);
> > > +
> > > +		data = (val & RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK)
> > > +		     >> RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT;
> > 
> > What is this data? the docs only says
> > "state of ISP input port s_data, for test purposes"
> > I guess it indicate somehow the amount of actuall sensor data arrived?
> > Could be nice to add explanation here.
> 
> I'd the 12-bit parallel (pixel) data at the ISP input. I can add a
> comment.
> 
> > > +		data_count[data / RKISP1_DEBUG_DATA_COUNT_STEP]++;
> > > +
> > > +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC)
> > > +			hsync_count++;
> > > +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC)
> > > +			vsync_count++;
> > > +
> > > +		udelay(1);
> > > +	}
> > > +
> > > +	pm_runtime_put(rkisp1->dev);
> > > +
> > > +	seq_printf(m, "vsync: %u, hsync: %u\n", vsync_count, hsync_count);
> > > +	seq_puts(m, "data:\n");
> > > +	for (i = 0; i < ARRAY_SIZE(data_count); ++i)
> > > +		seq_printf(m, "- [%04u:%04u]: %u\n",
> > > +			   i * RKISP1_DEBUG_DATA_COUNT_STEP,
> > > +			   (i + 1) * RKISP1_DEBUG_DATA_COUNT_STEP - 1,
> > > +			   data_count[i]);
> > > +
> > > +	return 0;
> > > +}
> > > +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
> > >  
> > >  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> > >  {
> > > @@ -42,6 +94,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> > >  			     &debug->frame_drop[RKISP1_MAINPATH]);
> > >  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
> > >  			     &debug->frame_drop[RKISP1_SELFPATH]);
> > > +	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> > > +			    &rkisp1_debug_input_status_fops);
> > >  }
> > >  
> > >  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > index 083d92ada73f..447c5f241d69 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > > @@ -454,6 +454,15 @@
> > >  #define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
> > >  #define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
> > >  
> > > +/* ISP_FLAGS_SHD */
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_SHD		BIT(0)
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_INFORM_SHD	BIT(1)
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_INFORM_FIELD		BIT(2)
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK		GENMASK(27, 16)
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT		16
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC		BIT(30)
> > > +#define RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC		BIT(31)
> > > +
> > >  /* AWB */
> > >  /* ISP_AWB_PROP */
> > >  #define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

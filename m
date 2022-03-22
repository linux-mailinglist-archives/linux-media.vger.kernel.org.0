Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43334E37BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 04:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbiCVD6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 23:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbiCVD57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 23:57:59 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D201F60D
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 20:56:32 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 73B005C0211;
        Mon, 21 Mar 2022 23:56:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 21 Mar 2022 23:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; bh=VVytLYcL6neFQX
        wKLn0uT9QJg/z6rvTJgOkOcPKYtck=; b=YvwSJQKm4JoKFHvf8BdepUgrcwtaR6
        Gukv0GO7oaE+1BI3sUj9BlbVWi+WjYrdXUbcFcTObWsJkpZ0bEkUbItWYufeX0lW
        wAbaUByxIoZZloM/y/Rpto4Z2W5j7R+4kpNp6CVujat1ZYg48gm87xLu60e+dh0p
        rteXZgiCmEcvK/16mnlZ5QifioWgfDIVMu1/d0Sz9O0D0NYhcuJhL/pL6D5e/cbZ
        XPr7kc12/FJSUl/TtKKXJkMh6x912w9fH0IuGm1Mwnljnf03sye60tMcURpjowby
        l8roIFr8q4fVlvWHsyDzb4S4R7jV+hcYPbDaI7gJssuTJ/o+V1KFxPKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=VVytLYcL6neFQXwKLn0uT9QJg/z6rvTJgOkOcPKYt
        ck=; b=KK10RsFWJIWYM6hgsTPo0bZmzMGw8Ld0ZDFRyMScLyDi4meGbs1Otayyj
        RSUKiI12sVOpJvKITQdrFbslUUgY0s4gtNXoYFU5EjMpGinqX5K/8BkgrCe/IgL1
        vHKWv7m9uKLiK0xtb/urFKyZlGrKYud2bgOY3MEwJTzLx8UY6M0zp8SJlu+nH370
        iZy1gsn0F+ABnEC5MLZ6+YZhT5HjucihILC8e3lxvi3mttjNrtkl9loiYS+2eTpB
        NZ4A/ZFu7KtyevU19LAWbvQi+R9uqmF+qW3vX4M/Svr/vz7UW7/quwxo7K0Lfupo
        NBGZYWVr/1Hcuamwn4kyQnfKMTIKQ==
X-ME-Sender: <xms:7Ug5YuWGQxqzOphcSN62IDquA69mYtfGa2zyAVgigPT0a1dqdQdBPQ>
    <xme:7Ug5YqlJBBOUl44GZCj7sQhdYShmYp2R9j3S1CrjzWIYbrnOiwRZaLWNqTRH8P1-E
    EaKizmUXFlKhlban04>
X-ME-Received: <xmr:7Ug5YiaLLWCXxdWXnBxI_4k9AFqvgoJByeIPXi0WK3c8nmMK2yGe7Bkbdl6ARJAINlTJE6fs2DyQURvvZKyGo4qU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeevtdegudegteeuueeuteeufeehkeduvdegffegjeffjeelvdeu
    ieegkeekveevfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:7Ug5YlXPU14eQc94XaQz0t8c3_3TNaGzLsacCEONmsNGiU4rXneGLg>
    <xmx:7Ug5YolplYrqg5_XZgYvA7KfFJG93u4Nz91f7BUBh72t-azH8caXNg>
    <xmx:7Ug5YqehodfuhNVx1AvCatT9ZQrERLq8iyZcfYBXkxA2dHcHA82TAg>
    <xmx:7Ug5YpDxGALi1_cxg5arIhpiVo42LMZloTuqOUf9GS7vlJ6klfd5mA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Mar 2022 23:56:27 -0400 (EDT)
Date:   Tue, 22 Mar 2022 05:56:24 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 14/17] media: rkisp1: debug: Collect input status by
 sampling ISP_FLAGS_SHD
Message-ID: <20220322035624.mpkrod4g42xgpyfy@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-15-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220319163100.3083-15-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19.03.2022 18:30, Laurent Pinchart wrote:
> The ISP_FLAGS_SHD register exposes the ISP parallel input signals (data
> and synchronization) in real time. This can help debugging when the
> device doesn't output any image. Sample the register 10000 times with a
> 1µs delay and expose the result through debugfs.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 54 +++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 ++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 64b33774cbdf..da3ed0ab697a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -9,9 +9,61 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/seq_file.h>
>  
>  #include "rkisp1-common.h"
> +#include "rkisp1-regs.h"
> +
> +#define RKISP1_DEBUG_DATA_COUNT_BINS	32
> +#define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> +
> +static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
> +{
> +	struct rkisp1_device *rkisp1 = m->private;
> +	u16 data_count[RKISP1_DEBUG_DATA_COUNT_BINS] = { };

Since this is just a counter, it could be int/short

> +	unsigned int hsync_count = 0;
> +	unsigned int vsync_count = 0;
> +	unsigned int i;
> +	u32 data;
> +	u32 val;
> +	int ret;
> +
> +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> +	if (ret)
> +		return ret;

We want to return here if the device is not is use right?
If so we should return if (ret <= 0)

> +
> +	/* Sample the ISP input port status 10000 times with a 1µs interval. */
> +	for (i = 0; i < 10000; ++i) {
> +		val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_FLAGS_SHD);
> +
> +		data = (val & RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK)
> +		     >> RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT;

What is this data? the docs only says
"state of ISP input port s_data, for test purposes"
I guess it indicate somehow the amount of actuall sensor data arrived?
Could be nice to add explanation here.

Thanks,
Dafna

> +		data_count[data / RKISP1_DEBUG_DATA_COUNT_STEP]++;
> +
> +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC)
> +			hsync_count++;
> +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC)
> +			vsync_count++;
> +
> +		udelay(1);
> +	}
> +
> +	pm_runtime_put(rkisp1->dev);
> +
> +	seq_printf(m, "vsync: %u, hsync: %u\n", vsync_count, hsync_count);
> +	seq_puts(m, "data:\n");
> +	for (i = 0; i < ARRAY_SIZE(data_count); ++i)
> +		seq_printf(m, "- [%04u:%04u]: %u\n",
> +			   i * RKISP1_DEBUG_DATA_COUNT_STEP,
> +			   (i + 1) * RKISP1_DEBUG_DATA_COUNT_STEP - 1,
> +			   data_count[i]);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
>  
>  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  {
> @@ -42,6 +94,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			     &debug->frame_drop[RKISP1_MAINPATH]);
>  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
>  			     &debug->frame_drop[RKISP1_SELFPATH]);
> +	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> +			    &rkisp1_debug_input_status_fops);
>  }
>  
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 083d92ada73f..447c5f241d69 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -454,6 +454,15 @@
>  #define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
>  #define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
>  
> +/* ISP_FLAGS_SHD */
> +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_SHD		BIT(0)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_INFORM_SHD	BIT(1)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_INFORM_FIELD		BIT(2)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK		GENMASK(27, 16)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT		16
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC		BIT(30)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC		BIT(31)
> +
>  /* AWB */
>  /* ISP_AWB_PROP */
>  #define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

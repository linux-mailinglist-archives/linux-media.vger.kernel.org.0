Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011064E387B
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 06:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbiCVF34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 01:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbiCVF3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 01:29:49 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8F31A4
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 22:28:22 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 200045C01CA;
        Tue, 22 Mar 2022 01:28:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 22 Mar 2022 01:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=8jgDpsxqUOQbu2mBIjRlz77k0qMD3rjQK2TxnB
        9T5LU=; b=i6hrsbSp1uWIMWQrdgK2kba1nSyNYlkfY/30Uu7iYWHcZiGq1jZ1c7
        79dFOwbfF/hYc04WeQ7GyvAwibq5r/zURuRF4gC/jSGcFJs1LM+mHS0S/UnQJibO
        mJmmdG3uIGgKqPdfa396sqLBVr7h1jEu4sONZqR7c5RBx7uVp6ct+8H5+lnktc7V
        8e1LA1LJqSWxccVsBC/BdNEHm1KL1L3XsaZxuTYuaPLTXQU28wfUX1U460ureLO1
        EYachiT4R2C4Mp6e50CQ/djf7T+VLgBTMJaFr4CShhXl7am0eFO5J8MemVRsGYW4
        vSBPVtU0rZG/O2YGEy7cEQ6YRlRAIdgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8jgDpsxqUOQbu2mBI
        jRlz77k0qMD3rjQK2TxnB9T5LU=; b=Ym5ougKxSWIe7oU9oq8tLL2RZhbV9oG0W
        aght4EDCjYGXmHAJsTjqJU62BE34eEWBXKnIdYRcsxLbZNYjSSqSeW0EfvcX9U6v
        IG2iTWoISocCgPejXgNM1eeErjXp/+AlwS9R3hL7N+zoZ+M/DCQv/lxvE7AgS47b
        Lsai51d2eufkAiui+a4XVEANxgRX+Jwo5+idpBOTw7rFVuB0e/iOXQruqKqafb9h
        aPrINTlxuCuLrl36HULhi/az50+JFPjyVTJeHh/fJ3n47pu8l8eUTmvi7uHRIa1F
        n30dfOVrfp8LW7BEARTHnFudYSxXj3gSidQPyQxjd/vNMxBfnQJUg==
X-ME-Sender: <xms:dV45YgMQ6Yztp9ufzTsR3nxZpap_gkiFLGDG00grJUG1TkMZFWBGfw>
    <xme:dV45Ym-fWAi0YiDvPIibpZzsKDmAF1OBpKbfxCWq9etkERsosNaxGsqw1NZm-xyHk
    MGKiG2sMTRyHZBF2XA>
X-ME-Received: <xmr:dV45YnT0rWDdFjonpkbmpVbv4UwtxfnG0ge8X1RO1lxtKd-Y0KCgykZ6kFgvuVx7yEqQa8Gp2gvX0tn1PBmir-ze>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:dl45You5hKt-Vl7KPEi9lWivMRGKkOM3ISe5iJgZJX1eesQB3W1_Dg>
    <xmx:dl45YoemnRh7_f7JvM4ax3n9z2AhwDGpsPIVTJcWzpFCUlIJcD-yTQ>
    <xmx:dl45Ys3NFzY9xhENFbpjvadBfvfaUhUgWw-__JusOF4NpGZJzClS7g>
    <xmx:dl45Yn55TImqmDt-eTqWizBaWLqs9_qtpstkLBy6k7NJDnVBipy9iQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 01:28:20 -0400 (EDT)
Date:   Tue, 22 Mar 2022 07:28:18 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 16/17] media: rkisp1: debug: Move resizer register
 dump to debugfs
Message-ID: <20220322052818.f7seus7fd5qdtl6p@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-17-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-17-laurent.pinchart@ideasonboard.com>
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
> The debugfs support already includes support to dump core and ISP
> registers. Move the resizer register dump there too to make the
> userspace interface consistent.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 48 +++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 37 --------------
>  2 files changed, 48 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 97be529a74e8..c89779daf319 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -81,6 +81,50 @@ static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
>  }
>  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
>  
> +#define RKISP1_DEBUG_RSZ_REG_DEC(name) { \
> +	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, false \
> +}
> +
> +#define RKISP1_DEBUG_RSZ_REG_HEX(name) { \
> +	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, true \
> +}
> +
> +static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
> +{
> +	static const struct {
> +		u32 reg;
> +		u32 shadow;
> +		const char * const name;
> +		bool hex;
> +	} registers[] = {
> +		RKISP1_DEBUG_RSZ_REG_HEX(RSZ_CTRL),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HY),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCB),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCR),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VY),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VC),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HY),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HC),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VY),
> +		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VC),
> +		{ /* Sentinel */ },
> +	};
> +
> +	struct rkisp1_resizer *rsz = m->private;
> +	typeof(registers[0]) *reg;
> +	u32 val, shd;
> +
Why here we don't call the pm_runtime_get_if_in_use ?

> +	for (reg = registers; reg->name; ++reg) {
> +		val = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->reg);
> +		shd = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->shadow);
> +		seq_printf(m, reg->hex ? "%14s: 0x%08x/0x%08x\n" : "%14s: %u/%u\n",
> +			   reg->name, val, shd);
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
> +
>  #define RKISP1_DEBUG_DATA_COUNT_BINS	32
>  #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
>  
> @@ -168,6 +212,10 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			    &rkisp1_debug_dump_core_regs_fops);
>  	debugfs_create_file("isp", 0444, regs_dir, rkisp1,
>  			    &rkisp1_debug_dump_isp_regs_fops);
> +	debugfs_create_file("mrsz", 0444, regs_dir, &rkisp1->resizer_devs[0],
> +			    &rkisp1_debug_dump_rsz_regs_fops);
> +	debugfs_create_file("srsz", 0444, regs_dir, &rkisp1->resizer_devs[1],
> +			    &rkisp1_debug_dump_rsz_regs_fops);

s/resizer_devs[0]/resizer_devs[RKISP1_MAINPATH]/
s/resizer_devs[1]/resizer_devs[RKISP1_SELFPATH]/

Thanks,
Dafna

>  }
>  
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index ac1b357a2a3a..1c07985c810d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -203,41 +203,6 @@ static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz)
>   * Resizer hw configs
>   */
>  
> -static void rkisp1_rsz_dump_regs(struct rkisp1_resizer *rsz)
> -{
> -	dev_dbg(rsz->rkisp1->dev,
> -		"RSZ_CTRL 0x%08x/0x%08x\n"
> -		"RSZ_SCALE_HY %d/%d\n"
> -		"RSZ_SCALE_HCB %d/%d\n"
> -		"RSZ_SCALE_HCR %d/%d\n"
> -		"RSZ_SCALE_VY %d/%d\n"
> -		"RSZ_SCALE_VC %d/%d\n"
> -		"RSZ_PHASE_HY %d/%d\n"
> -		"RSZ_PHASE_HC %d/%d\n"
> -		"RSZ_PHASE_VY %d/%d\n"
> -		"RSZ_PHASE_VC %d/%d\n",
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HY),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HY_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCB),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCB_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCR),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCR_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VY),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VY_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VC),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VC_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HY),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HY_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HC),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HC_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VY),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VY_SHD),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VC),
> -		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VC_SHD));
> -}
> -
>  static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
>  				     enum rkisp1_shadow_regs_when when)
>  {
> @@ -386,8 +351,6 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>  
>  	/* set values in the hw */
>  	rkisp1_rsz_config_regs(rsz, &sink_y, &sink_c, &src_y, &src_c, when);
> -
> -	rkisp1_rsz_dump_regs(rsz);
>  }
>  
>  /* ----------------------------------------------------------------------------
> -- 
> Regards,
> 
> Laurent Pinchart
> 

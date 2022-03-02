Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B14CA7F5
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 15:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238213AbiCBO0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 09:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242885AbiCBO0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 09:26:22 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CD0C5DB2
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 06:25:39 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4160F5C0563;
        Wed,  2 Mar 2022 09:25:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 02 Mar 2022 09:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=6ftNplKsZwbKfNPkFoUfJX/ZRhcgiPe/5y0QRo
        OrG94=; b=eLauOT2pSxEgzlM/O3b51PqedGKux2u0XfYVGau/kaZIjb6BLD7QXe
        DXzeXKcVg4fgnuLZlAqyfpqXII03LVfo2I2ZWToX9oTRBFs8sZ3dy4CXHs6t//bE
        dieMGJ5vsH/a41XPgXk/gKq8lCKfpjjL1Fzz4N+tiZTUBoqquIJwiAPS/xnvnHJE
        H02i83sXtDNMtOFv8r/FGsNTmYO4mbLG4I0WqtghXrN6Gjda9/fSD33ajRnFvT4v
        Frq3LsijlhwVPgc0wcvtpXr7A0RNvI03UcEeXXkCfmpQCtyDjYI1RCCFTUX8udJr
        K4JwhL4hBLMZBeup6uP9P7WPgCOMA5Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6ftNplKsZwbKfNPkF
        oUfJX/ZRhcgiPe/5y0QRoOrG94=; b=M16xq+gKzo6LULFZ91F9yiXS+GxdY0tua
        wVE2LHfGCHfucRbM+3i2UOrZzppK9hnPw70t23VrAymA94k1NsgqK+OTBbi128AD
        2v20agQ3YkFLpSCaIZWMMWBSHnTk2K/LY1HKgbbWjNnX3A92Wub4bZFr0TU1u3so
        w5kC9ozLVa4nen4QpwmRgf9GQu38tQGwGgqk3joZudWl5gKiOGly62ssmkCqkrbB
        8vK678NAeEr33++BW6bGcM1/JYxaYzr6IZkFUubgbAYks9ZfAnk1MF38UA859MRt
        urzwR8tT9CVZbVRu5J9rSv416oKAFt0bCvrIlu3eFEluV4GizOQVg==
X-ME-Sender: <xms:Yn4fYu0Jb_dxldNvS3-7EkFhYnPFKCWqcnJkyoM_AMoxOztCuCfaIQ>
    <xme:Yn4fYhFEpBE-Wj7Z3mksBiictqiHzBcCzppSwpv6NOzVw_aH3rfboUqpiGgBHyyju
    PdBknWC-ZrdYKOYom8>
X-ME-Received: <xmr:Yn4fYm6ZJI0wjIh2jeoFooVIxcsOb2ehHZuIO1QKT4iFe2A4GZkO6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Yn4fYv2TuRS5CC04gYrYsQBJJhfbshD4LUF28W7bEGVhZ1wCD2G7cg>
    <xmx:Yn4fYhEVeZ3_eHiDi6Skqpj9j7mCQooZJxiBhTcK8YQcsW27AQasjg>
    <xmx:Yn4fYo_aDYAV-GS5LOAUrLK3PfuC3SBubdEhSWHgG2BHZpngicEk9g>
    <xmx:Y34fYlgtvTgl8dEcfczE0JPthfm3tNdDF2a9X3yQQ4MXqX5T1kAqaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 09:25:36 -0500 (EST)
Date:   Wed, 2 Mar 2022 16:25:23 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/16] media: rkisp1: capture: Initialize entity before
 video device
Message-ID: <20220302142523.pxgetau3pxffqpfc@guri>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
 <20220227160116.18556-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220227160116.18556-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.02.2022 18:01, Laurent Pinchart wrote:
> The media_entity embedded in the video_device needs to be initialized
> before registering the video_device. Do so.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index c95c00a91180..9c11f2b8e5f5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1372,22 +1372,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  
>  	vdev->queue = q;
>  
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> +	if (ret)
> +		return ret;
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		return ret;
> +		goto error;
>  	}
> +
>  	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
>  		  vdev->num);
>  
> -	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> -	if (ret) {
> -		video_unregister_device(vdev);
> -		return ret;
> -	}
> -
>  	return 0;
> +
> +error:
> +	media_entity_cleanup(&vdev->entity);
> +	return ret;
>  }
>  
>  static void
> -- 
> Regards,
> 
> Laurent Pinchart
> 

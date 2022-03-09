Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB034D3704
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbiCIRAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235687AbiCIQ7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:59:48 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4207101F02
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:46:59 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A3AAD32001BB;
        Wed,  9 Mar 2022 11:46:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 09 Mar 2022 11:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=KBcncglZnZdYu4ArmjsjLKxPTGCVQYS1dQ79/t
        wzK+s=; b=JntAIno4LQWoKjOlclaJN5rbd1T3/s6RSyBLqLi9LidZzh+B4fsA5L
        Kkvw8HX32sjtwW+wtA0r47JiNglm0BZ/o92L1oYryIY293HEayWfXio9oQQWf9Vi
        t8Q07CPOOi5zUsjl2JpjxUGzIB4kjaM6ciFzLCzpbBkXYPJsSgyir6uuAHq5ZBMc
        ZUMGzIMxUMhIyE8fWKxycCWpHXsZiJ//NTnfYdNdfMKCnzMZw6mkgypRnxvL1+KK
        TM/11iTItWA1iLJ79vnPmhW2joGtopdM6oa1WfxdbNncXyzTB40f0U56FbxvW44g
        RJAYw54KQn3ZHaPWitNwWzMzrORvSy/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KBcncglZnZdYu4Arm
        jsjLKxPTGCVQYS1dQ79/twzK+s=; b=fDUKq75W8KGStdbUCRgoLZUnr/DAdaeWU
        pgm6+Kr+S++c56yn0lvyyRUemQPylIhqyzHNzs4L3Q3r/w6hHgxjHGt1Alq/7NhG
        wbDIxE8ezeKFPzmDzXlllb7rhcGCriUam1X47MONXn8q75r2vW2st00daHBH3j4W
        aiK2wYs4Oa5FiQstSRzT2LOZNy8eYYb5HzOHIiQds8+7bdE7c3Z+W3gu10/3j0VL
        7jkUpL/oOGYg0ntDkjw+d0iqU/6qfwT+7KXXPC1ZAFHd7kI32ZHullBUkrTrtc/7
        YWb1J0hPJ194aGPEVhgA3BQq9dQPRkwhhyr4b8bvElrp146DTbWNQ==
X-ME-Sender: <xms:19koYkoD2m0PFFyXGujYPBW_4a9Zgf_mAWOjwrWdzpg5E-MdggeYPg>
    <xme:19koYqr-9SC4IouFY0vK_1I4bZKQIIYkd9Z4pV9Pwr-iKliZL4QCkeRXteDbe6e_M
    Le__3nOfQSIzuEnEjI>
X-ME-Received: <xmr:19koYpOCojOO50-92p6nQjh1MNcgBf3-luzroTXSA6vO5BeAKW9wiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:19koYr4W6RtkzyTT1AJQvLGvUOtmpqQGSh8vpn9HIx-xPkaItVIAXw>
    <xmx:19koYj4nGURzQhHcxtr1voOOng4wdsdcPGXc2zVknjItarlyN13_PA>
    <xmx:19koYrgFBgqOlirK5ErjRv2nObBlkggpR2IJZQtL0Cw54SMikTSUHw>
    <xmx:19koYm3dXHw8xXbUk0JPlaeV--DVelodc-bHuYCie56BO-M6wutEMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Mar 2022 11:45:58 -0500 (EST)
Date:   Wed, 9 Mar 2022 18:45:55 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 03/17] media: rkisp1: isp: Fix and simplify
 (un)registration
Message-ID: <20220309164555.asaobof3rknw6vaw@guri>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304171925.1592-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04.03.2022 19:19, Laurent Pinchart wrote:
> The rkisp1_isp_register() and rkisp1_isp_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_isp_unregister() and
> safe to be called on an unregistered isp subdev to prepare for
> simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c |  4 ++--
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
>  2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 96a7e6c0a622..eedf4bb1c74c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1371,14 +1371,14 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
>  			"vb2 queue init failed (err=%d)\n", ret);
> -		return ret;
> +		goto error;
>  	}
>  
>  	vdev->queue = q;
>  
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		return ret;
> +		goto error;

I think these two chunks belong to previous patch?

Thanks,
Dafna

>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2a35bf24e54e..f84e53b60ee1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1090,29 +1090,35 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
>  	mutex_init(&isp->ops_lock);
>  	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
>  	if (ret) {
>  		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
>  
>  	rkisp1_isp_init_config(sd, &state);
> +
>  	return 0;
>  
> -err_cleanup_media_entity:
> +error:
>  	media_entity_cleanup(&sd->entity);
> -
> +	mutex_destroy(&isp->ops_lock);
> +	isp->sd.flags = 0;
>  	return ret;
>  }
>  
>  void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>  {
> -	struct v4l2_subdev *sd = &rkisp1->isp.sd;
> +	struct rkisp1_isp *isp = &rkisp1->isp;
>  
> -	v4l2_device_unregister_subdev(sd);
> -	media_entity_cleanup(&sd->entity);
> +	if (!isp->sd.flags)
> +		return;
> +
> +	v4l2_device_unregister_subdev(&isp->sd);
> +	media_entity_cleanup(&isp->sd.entity);
> +	mutex_destroy(&isp->ops_lock);
>  }
>  
>  /* ----------------------------------------------------------------------------
> -- 
> Regards,
> 
> Laurent Pinchart
> 

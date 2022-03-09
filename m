Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A5F4D37CF
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235989AbiCIRB7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbiCIRBw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:01:52 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70992160FE4
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:49:53 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 869503201E88;
        Wed,  9 Mar 2022 11:49:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 09 Mar 2022 11:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=ajJcFNT9kvVGRVb35GoeQGaLTl/fgyA0mExoJp
        17Mcg=; b=Ed+UoUJF+2+ZLXg2/MPSRBVQQh0k1zkAH237jI/x5MiLNxuNY+ooQw
        rQ9jeJMXedyk/ATNofHGnkMEN9QrU56aEi8l7FGVZ6Amss5E46TSeXTqha5c8H7E
        OZ6NRdNzX/UPD1H7OaVWP6Pm7wV+R45IyRlO96ltqA/943JKeoUSIIMfZ/Bf+Cwe
        FpTJApiSFm6eXVgEYKoGXsgalen7YUjyuk+z9eXPJ/LJUQOiUntPlI+PYX5R3FiZ
        DlV5o0gQtbmsCjESnKixt6zpyZNM0nhaVSDq0QmEsFHmKDzt4G3oLMMveoope45L
        h+xgOhdohEjjwRMNX9+dySt72GTapSyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ajJcFNT9kvVGRVb35
        GoeQGaLTl/fgyA0mExoJp17Mcg=; b=NzKBEOOwZ88nzU6ESuwRSD6Y0n3AlHIOI
        gWKWpMOshcsYOYPcAaZXCCiKYBy4Rsx+k9C1jPIuFoGYb2BjqeZeYgGxjZZbcZWP
        DUiofVUAHUu3SzE37xSo4Ilq09v28YzsLvWrH1ddajormpADu07wNhfe4Cuk4jJn
        E5eC93EPet8QZyeGoTs2Vo8ZIHz/moNVnOd6SzG6YutQGiiwyL8S0zcX2SkLR387
        FKYmwbXs7UKUZX7fzBGdVnC/4/vRGoFDHKlI8P/Q4vuIsExE8K28xYrw0+/GrWud
        c4TrVUG11EgET34HayVfES9RC9XJy+UQrxphCGhNhls1GR+Mf51GA==
X-ME-Sender: <xms:r9ooYlgPv1jIbxuEjzB5JxQZbNkuE1EWAhKfhcV1RO2gBNZrKbHGeQ>
    <xme:r9ooYqC0OC7a9_y5oFJ6Hp0u4548zr_TuYYh9aJdYi0KhtD19wQcbFjyju0IdCMZ4
    3I-gLmSAq5XXGUOw_Q>
X-ME-Received: <xmr:r9ooYlEATdsiSY_HCbxD7nF_UNUmvwxT4lPPe0fWZVWMC3XKtD-IrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddukedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:r9ooYqRUoVvPHAtEpN_bISySBhBsQs7_4TceArSpqzDVG6znarILTA>
    <xmx:r9ooYiwmMHHZfZYQWcDDb148Ga9k7uAa0yPu3pIyAwUEUutNSURjfA>
    <xmx:r9ooYg5lQk32SDfK1VyZUE_vpuN2T46vTVMuWEeN7Hse3zf0m7-h0w>
    <xmx:sNooYstOuSui1dyjzKtGfoRSZ4x412fUZeGwS8YXUCoOtEyV-EUCog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Mar 2022 11:49:49 -0500 (EST)
Date:   Wed, 9 Mar 2022 18:49:46 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 04/17] media: rkisp1: resizer: Fix and simplify
 (un)registration
Message-ID: <20220309164946.non2nvqjckwdtqem@guri>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
 <20220304171925.1592-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220304171925.1592-5-laurent.pinchart@ideasonboard.com>
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
> The rkisp1_rsz_register() and rkisp1_rsz_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_rsz_unregister() and
> rkisp1_resizer_devs_unregister() safe to be called on an unregistered
> resizer subdev to prepare for simplification of error handling at probe
> time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
> Changes since v1:
> 
> - Reset rsz->rkisp1 in rkisp1_resizer_devs_register()
> ---
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 2070f4b06705..df2beee1be99 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -782,8 +782,12 @@ static const struct v4l2_subdev_ops rkisp1_rsz_ops = {
>  
>  static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
>  {
> +	if (!rsz->rkisp1)
> +		return;
> +
>  	v4l2_device_unregister_subdev(&rsz->sd);
>  	media_entity_cleanup(&rsz->sd.entity);
> +	mutex_destroy(&rsz->ops_lock);
>  }
>  
>  static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
> @@ -821,47 +825,43 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>  	mutex_init(&rsz->ops_lock);
>  	ret = media_entity_pads_init(&sd->entity, RKISP1_RSZ_PAD_MAX, pads);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = v4l2_device_register_subdev(&rsz->rkisp1->v4l2_dev, sd);
>  	if (ret) {
>  		dev_err(sd->dev, "Failed to register resizer subdev\n");
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
>  
>  	rkisp1_rsz_init_config(sd, &state);
>  	return 0;
>  
> -err_cleanup_media_entity:
> +error:
>  	media_entity_cleanup(&sd->entity);
> -
> +	mutex_destroy(&rsz->ops_lock);
>  	return ret;
>  }
>  
>  int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
>  {
> -	struct rkisp1_resizer *rsz;
> -	unsigned int i, j;
> +	unsigned int i;
>  	int ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
> -		rsz = &rkisp1->resizer_devs[i];
> +		struct rkisp1_resizer *rsz = &rkisp1->resizer_devs[i];
> +
>  		rsz->rkisp1 = rkisp1;
>  		rsz->id = i;
> +
>  		ret = rkisp1_rsz_register(rsz);
> -		if (ret)
> -			goto err_unreg_resizer_devs;
> +		if (ret) {
> +			rsz->rkisp1 = NULL;
> +			rkisp1_resizer_devs_unregister(rkisp1);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> -
> -err_unreg_resizer_devs:
> -	for (j = 0; j < i; j++) {
> -		rsz = &rkisp1->resizer_devs[j];
> -		rkisp1_rsz_unregister(rsz);
> -	}
> -
> -	return ret;
>  }
>  
>  void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1)
> -- 
> Regards,
> 
> Laurent Pinchart
> 

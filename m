Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856494CAE8B
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 20:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbiCBTVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 14:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbiCBTVq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 14:21:46 -0500
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495E1CA713
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 11:21:03 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 54A2F32007BE;
        Wed,  2 Mar 2022 14:12:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 02 Mar 2022 14:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=jF+xM1odG6ryj/CKdmPsgMKMxwNdniEfHlSiVR
        Tc66w=; b=lOavyL16LfrZKRLg+ZFhQsas7sMRTO47rfk+kWUZp1PAJd3I0XuJ8L
        jWaIMK0Xi46U5o+LaDnYbNbPZAnh6zn2Os/iheijU09k8PgwoLytEK9kzWs6JUMr
        zapAYCfz3U062VEebEziriAQZmMRx3nl2mHVOhb+k7EzI1FTkVKoQd0NFNtxGZGy
        vg6OOTk0cjblFCQu7jtwW+9jPUpijrxa60DainbXL/2+ORVvT1MfRBVnKG5qXRf1
        MIjieWFVxoVU8seHcvJqTC4l4TvnFOEIt4ECeKHHKo7SSeYHqqGJ0I10kFqpcS3Q
        q3skQh+GWpGdCA4THBEm9WmiD4Ty9/nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jF+xM1odG6ryj/CKd
        mPsgMKMxwNdniEfHlSiVRTc66w=; b=LGvNG2qq+glmvk6PcvFTjA4sG+pSA8yoO
        bkItIxkSvrantNa56aoYlBu3avB8MgduKXQBIEOfXfjOgwYcNxhHA9m4cILbTBRT
        XGHNbZq0DKETdDdZa3etH7Ujc0JFSoHNBuJDMBAchYAUXtwLdTNckPWD27AxuXza
        pcGSzeaNzZKsPPGUdb+MXB1o6L+SSix9JsEchrdHm+RYO8SNNYAwkFodkcj4MhYe
        8BjwSbAYPJsfF3C86CDgQ6fsM5+clgqwq4ngqug8KI9MD22oi0alv4uXAmWBwQru
        jvwFXMrLxIQSDwcpbVEyoASgQgsPUslvjWeBaZdP4f9PFNPDMLMAQ==
X-ME-Sender: <xms:rcEfYljTOJJI30lQhD2SA3rBrFrfHH7RSlRzPmIrmCpWNpo8gAGHqw>
    <xme:rcEfYqAoKb1XF9H0JAe8hWvmgWh9Dd6rY0ozAbWYYmps_b2Kp59y_LTbrK0lD0Kjg
    PkrD8q700YicKUGN2c>
X-ME-Received: <xmr:rcEfYlFk5q8mmr4mzqLv-HywW6OHHqeykAzCrpVnAFLRwoXLdbMZBhaQodPq6Fzl8eWsn0EZ1sBegQxXXBrWEll->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepffgrfhhn
    rgcujfhirhhstghhfhgvlhguuceouggrfhhnrgesfhgrshhtmhgrihhlrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeffledvudejgfeitedvleevteduueekkedtjedvgedvgfduleet
    ffeujedvveekieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegurghfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:rcEfYqToyOCpNUvbjDbEcdjau8RNtZvnpwC0JwxUMWRvLd23b0Z-Zw>
    <xmx:rcEfYiwqAiIR-5GBqUDlocXeJ_Ef1vND5lBwIi8WxphyxWPrKV80rQ>
    <xmx:rcEfYg4ZRvZZKBLu3Sf7HPo3YzR52ya4iZ9yI6OrKS0hvw11GjISUQ>
    <xmx:rcEfYstyVV48m6YfWKW-E4SS7cqa_hH5fdch1EwVI_VfRj00q5ob6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 14:12:43 -0500 (EST)
Date:   Wed, 2 Mar 2022 21:12:23 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 04/16] media: rkisp1: resizer: Fix and simplify
 (un)registration
Message-ID: <20220302191223.t2eee4t4jtsk2hl4@guri>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
 <20220227160116.18556-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220227160116.18556-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.02.2022 18:01, Laurent Pinchart wrote:
> The rkisp1_rsz_register() and rkisp1_rsz_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_rsz_unregister() and
> rkisp1_resizer_devs_unregister() safe to be called on an unregistered
> resizer subdev to prepare for simplification of error handling at probe
> time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 2070f4b06705..65ce8d647118 100644
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
> +	rsz->rkisp1 = NULL;
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

same as previous comment, I think it is nice to set rsz->rkisp1 = NULL
here.

Thanks,
Dafna

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

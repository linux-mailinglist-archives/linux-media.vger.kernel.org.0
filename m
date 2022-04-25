Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 824A850DCF6
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbiDYJnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241466AbiDYJme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:42:34 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CF72610B
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:38:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y21so10762550edo.2
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3gLjXtcN0H7/Zjq9kfG/nCI3G6SCX7sxZ+itfKAG7Jk=;
        b=IqvxxmNjUFX97ZlHNX8rTDP6kspD0tXk6NJscD1t9GNfbpLaDd6j84s3YaA3yEJD9+
         4shjvPfgK30qXgGW50nFKK52mPB42kNKKv9JrCJ92/zmltzJonSE8gHarBLv+SwFD4Id
         iwwGvBB3+lf4zdeZ43uOV/sHJJGlwh1FEeY0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3gLjXtcN0H7/Zjq9kfG/nCI3G6SCX7sxZ+itfKAG7Jk=;
        b=QJqbh+w+iQ6W47V1JZOSVjDo2KU3+oGmqMBDxHMkJ/T+R/jnOBtp8Hpw77HF7+VbzW
         wxa5MQOziM2rc6+t+DAkofqT/kW6fFINooW/qcVDmZJxPJZ7TeghNA6FbaV2PmMhKyb0
         ur03/4yW3mQQ2rzAp0ubfcmdcBzkbsjhSWXR2SoexKrkAx9Ah/qulcCwQd5y9fbKe5OB
         c1HP/SFXnjDxAqAT286sRKc/6c1i+Z4A+Y19XmmlFb+oCDhHJxrg/1l9+W5rR+cO0WWL
         YJfoIBJvro5TKrZVB7kHOEUwRFC6XVKl9tntXGU5+kK0b5Df+6Q2xym5aWcXpGoB+WWm
         fD3w==
X-Gm-Message-State: AOAM530bXgyDhhijcjq1J15JDpFj021VbVl64zSo8nDPoAJJbLzbqj24
        bqS+fBZhw0oYRN95WgZ/mflXyn2K4zqZcw==
X-Google-Smtp-Source: ABdhPJy2HsDbPWjU17AyjnBhbjEW6TUaD3DyDVsdBfyAnc7ITrNKC2wGFyMT7NaBVtZtsOxAyOGWxw==
X-Received: by 2002:a05:6402:2809:b0:423:e123:5e40 with SMTP id h9-20020a056402280900b00423e1235e40mr17966760ede.84.1650879480853;
        Mon, 25 Apr 2022 02:38:00 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id s26-20020a1709066c9a00b006f38bea6ddfsm1381772ejr.186.2022.04.25.02.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:38:00 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:37:43 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 04/21] media: rkisp1: resizer: Fix and simplify
 (un)registration
Message-ID: <YmZr5yNANewFWUO/@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The rkisp1_rsz_register() and rkisp1_rsz_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_rsz_unregister() and
> rkisp1_resizer_devs_unregister() safe to be called on an unregistered
> resizer subdev to prepare for simplification of error handling at probe
> time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
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
> 

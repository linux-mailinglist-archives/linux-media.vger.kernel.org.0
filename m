Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33074E37E7
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 05:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbiCVEYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 00:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbiCVEYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 00:24:37 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA3121BB
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 21:23:10 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id B6EEB5C0210;
        Tue, 22 Mar 2022 00:23:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 22 Mar 2022 00:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=YwzxGRkqVyX7PwW+wQV+xFfNIO8H/N8Wm3kMlq
        QTNyE=; b=pb4j2zdG7Iwc5nWKHjcPUrkihwaJ/o6sAlp3xR9GXYOycuskEqkUGt
        n/zQ+5ljufhtCqz8a7UAh8fiQh52Cd0FxJCSKdZaE+aH7dvpInublsYYmnZlxXcA
        RsrX3kNHPVvKiwXwlUfhTFmjYkNEkTOM9ZBcOsPwcgK5C5bZa2qN6dvjnC7WY/jT
        lDFVLYOX2ARUPCKaBWP5a9hQk/zSNwOjq2DZ5TVEcaG5vj5RFn92bBhJM65keL3n
        dMSrcSRK0sd0G5aeUHm4Sja+fI5VNOv+1rPjCxT5ykgo3LaIETersf+bCZr8wYVM
        87I123/jz0jhMqB2oNlSVe6XLHXblilw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YwzxGRkqVyX7PwW+w
        QV+xFfNIO8H/N8Wm3kMlqQTNyE=; b=Yn10HdCx4WcNi2PcRFQtd84jWdI4R3vsM
        Bu/D2ObFWbeNqmgz1wJ1pN2qYL/yxHh6wIozIBATZD4u7azoMhkMBca1TsKG6Ivk
        9MdHvV+DYTWwO5DO1PgGS44BPdLmkVfgSpdwZzhR+wnVRKOSFV4te8+CrzzinjCF
        fPzGF8D482AdyBlnAjij/DO0Qo84NiYuABcOL/mbK/jC3ItSt9pgcJV2jN0zZ40d
        RX5MNqnoowRwOu9H/9s4ATxVwTOiO6lK6y6aGE4RISrR/SLaNjeuu9dHsH+q/bVx
        CI/SzDC/eEE368jJaXdea1Y3jjUMJNEXYyNCnJSm9MQ5GlGqxTcTA==
X-ME-Sender: <xms:LU85YvD86F9vM4yl0FnrDwAaYcER74KEKiPxLIKBz-3C91RTcvYjbA>
    <xme:LU85Ylhuqb7R-K4ulFcQV0A_Ol5W-zgYJRcsL18Bxx3a_aECaU6IdH6zL275jCUCl
    uNUg56ekkPmDkIoIK4>
X-ME-Received: <xmr:LU85Yqljx2fCOGLlsgXwV4ZrWVgyiJ2wZ9pxd9fue4driKzS0ucMf4uFNBmIf-KM-FAlxNyBqnq2pcgulzbQk448>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:LU85YhyxHgYDyUksJpLnUF9CY-sH7vl9WHXyOKN1RS6TydckXPrBDQ>
    <xmx:LU85YkRVRPhCly8slH108xMw9SMpQHHnOqlDpEWcnasL24zmWgjgvg>
    <xmx:LU85YkYCSi3Vv3giFA2qIVYusi8-BGriU2PM5tDKlmDzNbHeIEIyhg>
    <xmx:LU85YpIXfvOAryPgqK8it2HzlZMnSPbgT1awGxWWtVdX8hmHpQImmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 00:23:07 -0400 (EDT)
Date:   Tue, 22 Mar 2022 06:23:05 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v3 03/17] media: rkisp1: isp: Fix and simplify
 (un)registration
Message-ID: <20220322042305.fcriktxrjd4vfbfo@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-4-laurent.pinchart@ideasonboard.com>
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
> The rkisp1_isp_register() and rkisp1_isp_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_isp_unregister() and
> safe to be called on an unregistered isp subdev to prepare for
> simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
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

I remember long ago that Ezequiel suggested removing that
'media_entity_cleanup' since it was never implemented which
indicates there is probably no need for it.

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

We assume no flags means that the device is not registered. This might
stop working if we ever decide to remove the existing flags.
So better "if (!isp->sd.v4l2_dev)" ?

Thanks,
Dafna

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

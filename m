Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2014E37E9
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 05:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbiCVE26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 00:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236363AbiCVE25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 00:28:57 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307EFE36
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 21:27:31 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 98D5A5C01F1;
        Tue, 22 Mar 2022 00:27:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 22 Mar 2022 00:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=PqHUd5owomIzelxDKzbf0e/+f2e+1gCCrGI+eC
        zjIQs=; b=POj6JxTzuV1ESQEX1nyLq/c9BNS73SkyRWbME/cw+EMxbmAOhI+Xx2
        ObfN2gRuVJ11cCt5MuwVTt7ml9Tn9fALp1HzH7M4T1RNGQb6ZQQtVbAWKK0JRvFp
        FH2yiocRq3QKghNqOS27RN6YI2/o4vORYBg9EKg1e94hnoaUPkFzp8ZmMlEsKLOL
        aGPOSrZ/BrUJo5wspE68byanAEtXORYirPu75yNZJNrlRjaixJkblLwNP5jcW/jw
        5C4JHW4oegtxSxund37eqQqtjrpXogJIhzb0KQoUK5U/badLzwCT3SiLllrzW6gO
        uDHPqY34xAmI8Lc5HXxR0boWA8jyC1LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PqHUd5owomIzelxDK
        zbf0e/+f2e+1gCCrGI+eCzjIQs=; b=ZQdFqPHG1HhEmHJqTyI75NRdObQGqgZa4
        N9I/QV4g6ar0Ubahj4JuvJeYB1kHODvdhATWzxTHTb+tkMbEYe1zMt1cI75UNapH
        c6jYtMiKheZqUylmhViDMenQB+xqLcVDjY/QoCBjTAFcbGWgp3d+0nwGF9au6BCJ
        C51ZNnBC/ORQ/b0epd0+P7UKe1b1BDfnZtGtQ4bXJdDyJ9l26mCMXinpZIxcz1TL
        GT9Lv4JoVZpfeFll/suFCCs0mb6gNz0yQ/7HJYaZKSG+xtQGYb3zQd46z+BqYSXo
        0PGujcWjGtmJ0EjjfBSYYEfoYX+uvTF8FmHrLk7ZobbiUXbWcoCaw==
X-ME-Sender: <xms:MVA5Yvbj_y5gLP1AHzc03oWXDey_Ik-Whv_IhQpJVsQfsUXfzADyMw>
    <xme:MVA5YuYvgazr2Lz_HOq9OkdpNihPuS58E0Ovr4lqIb84feQoEvgFoEqseVViImevg
    ijee-6bCLWoplOtFjM>
X-ME-Received: <xmr:MVA5Yh9hchcm67Tul3kHuGCSA6ExkXHiFdvv85XfxF0KcA9j69kb5T21BKbwDub0MkpvLdAiq3Z-0oeSD2rd7OUP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:MVA5YlqgbG7qMfnsPMT5VG6iN5U02q1nbRdS0E6v7ei7e7UauJpv5A>
    <xmx:MVA5YqrmjLfznqXuw5Ex_lF7hxuMOSd3xRMpOEkj4DE2nB_ssWlbww>
    <xmx:MVA5YrSO2U-4OXyIl8ATT3UwR49xm4Z6EYrfUB6YLIImL7LPIO0ptw>
    <xmx:MlA5Yjk2mEoE0LZklaewUXc1QeeKMRG_anuKICBlLpY1JUST6MOYRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 00:27:28 -0400 (EDT)
Date:   Tue, 22 Mar 2022 06:27:26 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/17] media: rkisp1: params: Fix and simplify
 (un)registration
Message-ID: <20220322042726.ifcrbleogwedgebe@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-6-laurent.pinchart@ideasonboard.com>
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
> The rkisp1_params_register() and rkisp1_params_unregister() functions
> don't destroy the mutex (in the error path for the former). Fix this,
> simplify error handling at registration time as media_entity_cleanup()
> can be called on an uninitialized entity, and make
> rkisp1_params_unregister() safe to be called on an unregistered params
> node to prepare for simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c      | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 8f62f09e635f..d41823c861ca 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1844,16 +1844,21 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		return ret;
> +		goto error;
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
> +
>  	return 0;
> -err_cleanup_media_entity:
> +
> +error:
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
> +	params->rkisp1 = NULL;
>  	return ret;
>  }
>  
> @@ -1863,6 +1868,10 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
>  	struct rkisp1_vdev_node *node = &params->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> +	if (!params->rkisp1)
> +		return;
> +

For the capture devices, you did:
       if (!video_is_registered(&cap->vnode.vdev))
               return;
Better be consistend and do the same here and for stats?

Thanks,
Dafna


>  	vb2_video_unregister_device(vdev);
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 

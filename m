Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DF94CAB34
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 18:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237817AbiCBRMG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 12:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243724AbiCBRLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 12:11:49 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEAA79C7B
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 09:10:55 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1868D5C009A;
        Wed,  2 Mar 2022 12:10:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 02 Mar 2022 12:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=MCnmDsnAEWENX1H0+JRWHA5CTuHCIrPes38pmE
        pQoAo=; b=gwIILSC7x4aLWZ4uKzE1nj+ImoAOmymPRlJrQTaKxT2cvMyI1baH4l
        sAI1l/DUqiUzyFyNWozuv9fVtyWfdOjAsSU2bcRwaqucNCIpDENojMK/PiFO77ev
        Ff59vr+NU9qf8PF5Vw1EowL88Y6twh+8LHTlGZbUJVqFcwFxeFFxZsxehy5zFS4l
        eT2rZrTjIn4+xhFqxbcHN9Q9bcZqkzeAlxXQwME4FO8x8lnJh2d+cmtgAQrOD2/x
        KJtNwe2uZpLmyoZob4yTRNwH28gvtKIgyo3ETSrH6p/CeLNjEFAJ4/OH4V98Lz9P
        OEolsRp0IbiOa5cz3BtY5AcSGkMoXsTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MCnmDsnAEWENX1H0+
        JRWHA5CTuHCIrPes38pmEpQoAo=; b=Nn7+jkcFusrILEK3kO5GXT/CvEv405yBu
        TIVrcP6fhBNFj16c2kQyzHRitdrz20OSor0+6qulWjlEut/GzgC7X/ZndxkuVtOr
        RH2vXbybTKYVcd39P0mXI7tvs3kJCTQ9mqQeed1yV1r3kPMlCmi42tRIf8WPHsvR
        MfrW/5okQssPT9kKKKRtbN26jpn8kNgIdWn4OJsXjzTY9RVliNnAs8schO0tOYHI
        8r4Q3nanpSPpKJFqM/0rMzJDpWNlEC6Kp+lRcCeEDKqhjnoDqpSIv+fYc3pFt2ep
        ynKS1FNyjUQCLjpPqAFQOsCNMSW6a9036GrsOCQuTjGO9mXSmbVPw==
X-ME-Sender: <xms:G6UfYgN1cJPxaF-CpBVfUG9EdoUWbJMmeJSB8UPchXM_jwH2yXYp8w>
    <xme:G6UfYm-gvJDb4egttTgqa2b1GKJ-YB0PZiHslQyFAJN5Akim1lv_CIpBh9Xhc_TLk
    sz5mFsYZb22tr_1Blg>
X-ME-Received: <xmr:G6UfYnRhKDj0cSZKohDSWB6d4lQJs1NdMArnstKl1gowubCEyTyw-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:G6UfYosik-SSdWFdrw3hXGQOhhfnb4lWHkwduDmax4FocwkVYrldfQ>
    <xmx:G6UfYodbFiJr4q3b6RYgev6_YFKhr1Hb-sC9PGbmhQ1JTrImHUw0ng>
    <xmx:G6UfYs3eGo19J5x_Idef3pPABCD7PAfOUZ-IVg1VUJpQeLsmW_J95w>
    <xmx:HKUfYn5WSxhZEmxshFn8pcEq4wdEgx8VSusyjyUvkcrJV90J14-KOA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 12:10:49 -0500 (EST)
Date:   Wed, 2 Mar 2022 19:10:40 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/16] media: rkisp1: capture: Fix and simplify
 (un)registration
Message-ID: <20220302171040.bem4jeinzowppzx6@guri>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
 <20220227160116.18556-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220227160116.18556-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27.02.2022 18:01, Laurent Pinchart wrote:
> The rkisp1_register_capture() and rkisp1_unregister_capture() functions
> don't destroy the mutex (in the error path for the former). Fix this and
> make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
> safe to be called on an unregistered capture node to prepare for
> simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 26 ++++++++++---------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 9c11f2b8e5f5..18be7c982db7 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1312,8 +1312,12 @@ static const struct v4l2_file_operations rkisp1_fops = {
>  
>  static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
>  {
> +	if (!cap->rkisp1)
> +		return;
> +
>  	media_entity_cleanup(&cap->vnode.vdev.entity);
>  	vb2_video_unregister_device(&cap->vnode.vdev);
> +	mutex_destroy(&cap->vnode.vlock);
>  }
>  
>  void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
> @@ -1390,6 +1394,8 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  
>  error:
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
> +	cap->rkisp1 = NULL;
>  	return ret;
>  }
>  
> @@ -1425,26 +1431,22 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>  
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
>  {
> -	struct rkisp1_capture *cap;
> -	unsigned int i, j;
> +	unsigned int i;
>  	int ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> +		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> +
>  		rkisp1_capture_init(rkisp1, i);
> -		cap = &rkisp1->capture_devs[i];
>  		cap->rkisp1 = rkisp1;
> +
>  		ret = rkisp1_register_capture(cap);
> -		if (ret)
> -			goto err_unreg_capture_devs;
> +		if (ret) {

I would set 'cap->rkisp1 = NULL' here instead of in rkisp1_register_capture
so that 'rkisp1l' field is set and unset in the same function

thanks,
Dafna

> +			rkisp1_capture_devs_unregister(rkisp1);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
>  
> -err_unreg_capture_devs:
> -	for (j = 0; j < i; j++) {
> -		cap = &rkisp1->capture_devs[j];
> -		rkisp1_unregister_capture(cap);
> -	}
> -
> -	return ret;
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 

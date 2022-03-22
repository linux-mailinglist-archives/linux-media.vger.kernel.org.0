Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F154D4E37D6
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 05:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbiCVEO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 00:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236317AbiCVEO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 00:14:28 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E6A52B3C
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 21:13:01 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 0A6305C00DE;
        Tue, 22 Mar 2022 00:13:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 22 Mar 2022 00:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=vEQSr42CnQBUPKCEub5pbkgSu3hQM6IuMYKUXj
        ZSfOA=; b=omf5Gpc21hgtKBKgxupOrRvO6vkTAs4G5BiYCTFRELPbndx1YlcP3+
        3/cJiv4VydQ+sqSbjfIQdGLziiael2Mv+wuGd1ohuAdZN8cHjZF/Nibg+tvMVHnA
        GDXCst88mpHqByshyLLWedGMSVVTdayObE54x5vOAJOXu69kEuli0Xb0zhNr1o/k
        90XB9QmU7Tkbx33XQGVCmyAWr5ZGyj677DDffQDgJMfpikHHwL9/S+LC3V7T5cK5
        L8I99Y2izHJZGFdPaG6Wn/U0B2yXHSPVC8zuyBeTYZ4Qnj4lRcee/bIovM40PjYH
        QuVhGiKQ7y+L67Xf2chiWVvk4fme11/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vEQSr42CnQBUPKCEu
        b5pbkgSu3hQM6IuMYKUXjZSfOA=; b=ZRY3yz/787epA1/a3xYojUHyGMSrgwPSn
        1se3LMK08iu9I1sfdekHnheEDKGXfVY+WFDQ2QNAnQxFkGZa12DYnfrWfRxXz1O+
        OZHc86DAkCSRNP2vMfiovNm0oiRZzDsG9f9cm4+kjN8wKuPmos+U9VJ6ZojyTKRp
        EnYVfCLpX0J+lJsD4pxpJvRfvkz/ZLJzvqmVbDyvgsO0tnFu4Tlv3m7hKTt2Diy4
        mRwTwPIqJJGQeueMcFso9jHLbWv2ekvJIulL22JxEi0NMfYGNEuX9LUV3C0GVF1B
        N3m1VhuArGkVGxppFGo8gXetYo6BRM4ekIcbEw7QXEDVK226ytC/Q==
X-ME-Sender: <xms:zEw5YuPq4LhTQrZlaUFJx9CRz9Ms24AsShl8d6JiowRuqndWIdou-Q>
    <xme:zEw5Ys8QBnaSnigA0HL8gFvBdxyBTpAg7jgnyXu2GsKWc7CwFpEf6MOmfAamec2dW
    N6TPfwzk_Ivs8hRiSM>
X-ME-Received: <xmr:zEw5YlR646sRmulcdwDDzwuh7Q5JXDK-mF40KnGpc8WLIoWQJwWiLEyJAsTrpnAcp4MXjuEkjKohSTR-eqngQFU2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:zEw5Yuv5FXIX0QaLSgtzGbdjqpVPIOKn17zuwYcTLe2IbrkDwM9uhQ>
    <xmx:zEw5YmdPzLwycITvP2NjqjeBgOLZccfZZMAqNUl420mGDodO1sdF8g>
    <xmx:zEw5Yi31Lvi8ds_mG_TfUlke1hG-c0Tcobhpmbx-TraaycADUREBmw>
    <xmx:zUw5Yl4ZUbR6UcLYCW8X92rnxDDGzZ94bZmHziRiQy8hbNQY-Cf-9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 00:12:59 -0400 (EDT)
Date:   Tue, 22 Mar 2022 06:12:57 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3.1 13/17] media: rkisp1: Compile debugfs support
 conditionally
Message-ID: <20220322041257.5mdj5zc7ajgtteor@guri>
References: <20220319163100.3083-14-laurent.pinchart@ideasonboard.com>
 <20220321124437.12749-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220321124437.12749-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21.03.2022 14:44, Laurent Pinchart wrote:
> When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
> support in. Make it conditional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
> Changes since v3:
> 
> - Fix double mention of rkisp1-debug.o in Makefile
> ---
>  .../media/platform/rockchip/rkisp1/Makefile    | 18 ++++++++++--------
>  .../platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> index 1a39bdcc608e..f7543a82aa10 100644
> --- a/drivers/media/platform/rockchip/rkisp1/Makefile
> +++ b/drivers/media/platform/rockchip/rkisp1/Makefile
> @@ -1,11 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +rockchip-isp1-y := rkisp1-capture.o \
> +		   rkisp1-common.o \
> +		   rkisp1-dev.o \
> +		   rkisp1-isp.o \
> +		   rkisp1-resizer.o \
> +		   rkisp1-stats.o \
> +		   rkisp1-params.o
> +
> +rockchip-isp1-$(CONFIG_DEBUG_FS) += rkisp1-debug.o
> +
>  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
> -rockchip-isp1-objs += 	rkisp1-capture.o \
> -			rkisp1-common.o \
> -			rkisp1-debug.o \
> -			rkisp1-dev.o \
> -			rkisp1-isp.o \
> -			rkisp1-resizer.o \
> -			rkisp1-stats.o \
> -			rkisp1-params.o
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 07a92ed8bdc8..a7ffe2830fa8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -518,7 +518,16 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
>  int rkisp1_params_register(struct rkisp1_device *rkisp1);
>  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>  void rkisp1_debug_init(struct rkisp1_device *rkisp1);
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> +#else
> +static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> +{
> +}
> +static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> +{
> +}
> +#endif
>  
>  #endif /* _RKISP1_COMMON_H */
> -- 
> Regards,
> 
> Laurent Pinchart
> 

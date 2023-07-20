Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B23475A3B2
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 02:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjGTA5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 20:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjGTA5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 20:57:23 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0492101
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 17:57:22 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-56341268f2fso119950a12.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 17:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689814642; x=1690419442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoHtEDrUeDBB6O4dpqwH1+7TO2wrwXezIfRG5JlgQeA=;
        b=HmFTN0EwsP6KRPllj+z4z2bLlOlTq/BZzzaYMsJEsRv9VPqwYghrsiQdsmGZ+ju1Ra
         zC8lIiM9aAqWbNFYdKVZjYVwvt9gSlEz9y9mVETd3tkyZnNxdDv2xRWqgiobP+V0fI5j
         wgLnyXwRMC1FsO2fPNMMYbmtVkYK3lx2HMD70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689814642; x=1690419442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoHtEDrUeDBB6O4dpqwH1+7TO2wrwXezIfRG5JlgQeA=;
        b=ETop/GVuj4FBXy69t0URoMDJ5JiHIW+cjRu4Aw5jZYwnG4PV/ExLfs4RSxmp9rZY2H
         rWqUsvP4FXcrTF7Wzv7bkU0kEN3vjUzlG7fcsS2DsBO8D6rNi+hD5/r8vvL4WtPcwoLj
         pwe24uKd+dhC8GuEC6mTLvuKnwuxzBMUwAj3pYjHjtDBxWDWVJqkwHZgICbfRG0SGdLm
         FQQVVes+CiYULuXnEYeFQKr18Fss4ekQsM8D/8c8nes7F+cnwRXgbYE7kemrTs7ESCpg
         cmDP+3IshyOxIPPLbDvYGbht21ojXPxCqqFFBH2h6geyrwqMlr2S7Z/a3pBqGSxduQt4
         Y7KA==
X-Gm-Message-State: ABy/qLbCd1U6/KWtyWJ3e0MtEfurcw+yz9FKsKJir9leYM15yaDcRp3T
        6AWOH7pHKslZc0nE5ccwZioFsg==
X-Google-Smtp-Source: APBJJlGsN20HjU3kjOqIjW2vhq/ZUqU5m4b6w3IXK5ZmIdaMhUVcZM72TXBPKTPM+HJYkNgFq0kGgw==
X-Received: by 2002:a05:6a20:144f:b0:133:2974:d31a with SMTP id a15-20020a056a20144f00b001332974d31amr4281643pzi.17.1689814641824;
        Wed, 19 Jul 2023 17:57:21 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001b895a9f3acsm4603603plg.224.2023.07.19.17.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:57:21 -0700 (PDT)
Date:   Thu, 20 Jul 2023 09:57:17 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix OOB read
Message-ID: <20230720005717.GD57770@google.com>
References: <20230717-uvc-oob-v1-1-f5b9b4aba3b4@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717-uvc-oob-v1-1-f5b9b4aba3b4@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (23/07/19 12:05), Ricardo Ribalda wrote:
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5e9d3da862dd..5e3af66a2223 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1402,6 +1402,9 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
>  	query_menu->id = id;
>  	query_menu->index = index;
>  
> +	if (index >= UVC_MAX_MENU)
> +		return -EINVAL;

We probably can just do

	if (index >= BITS_PER_TYPE(mapping->menu_mask))
		return -EINVAL;

This should be better than using a hard-coded constant or even
BITS_PER_LONG (which is still a hard-coded constant). Because
BITS_PER_LONG won't get us covered if one day ->menu_mask data
type changes.

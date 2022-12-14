Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBA764C171
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 01:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbiLNAlu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 19:41:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237353AbiLNAl0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 19:41:26 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24B62612C
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 16:40:04 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id js9so5210989pjb.2
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMXSUhRQOxy7tEuvDry5hNPWkTeD3FTVDObnfkaZoqo=;
        b=BH7DsjF/MqmaFEQUpJolgTrbi5A6L62CZdhE1oKhBHXLTPvRwujfy44Po3BKotOOtC
         m/lc9V7LvPlO9oA27wvnJECyKmNVMhwkDkhRN8zaqNeFKRxXQasvUHU7Hpifj4SkNsFB
         T0zfj6yx9b7+7tQuqogJAof91yqJxBGMRoCLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMXSUhRQOxy7tEuvDry5hNPWkTeD3FTVDObnfkaZoqo=;
        b=HtQYQ0QkWeRo6K8AmIngQYtLVz0BuqddYUcl2h/cybP4yca68Y9+jKYK8luDDyvPq5
         dpjvSB2+zN2e9G8V9rPfxmROUi+YrbTusUPhnoB+J5UpUG5qSEzV1JYp0lTPzgCQt+Vs
         wD37he0OzP47VC0FV/1s0vjtKlhnCCzX1LWIo5fPoMjoiY+DeSxhZaWdw4q947m1U8v2
         spXtpV/uptkbGr/YYRC8ZCwmIhzjco3s+UFp8VJoJVeGHIUtrJll5SncRM8a1WxWjKhg
         QuN18E7vncxv5ZbfVspYkslIG8TUYp597NkSsxe8a4K01BCze7OQN7b6QFH7tB9mA0Gv
         j1Gw==
X-Gm-Message-State: ANoB5pm5rtCqe5HhZ9/JXgwNjrAL/LU8rIYJ4F+lz1p7RuFIZB1Q0Vx6
        6WIEPUXiqXSAcHxlfzHx248+Vw==
X-Google-Smtp-Source: AA0mqf4kSqVg4gnsl8RkfCPeORprvNaEXNUCBQeC70AsH6pnDWedTQ4tO9+n5cA43Z/m7cZ/ZT23ug==
X-Received: by 2002:a17:902:d483:b0:189:ced9:a5ea with SMTP id c3-20020a170902d48300b00189ced9a5eamr29138799plg.27.1670978404367;
        Tue, 13 Dec 2022 16:40:04 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id w1-20020a170902e88100b00186a2444a43sm510077plg.27.2022.12.13.16.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 16:40:03 -0800 (PST)
Date:   Wed, 14 Dec 2022 09:39:58 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Max Staudt <mstaudt@google.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: uvcvideo: Do not alloc dev->status
Message-ID: <Y5kbXt5lUqUiCmCi@google.com>
References: <20221212-uvc-race-v2-0-54496cc3b8ab@chromium.org>
 <20221212-uvc-race-v2-2-54496cc3b8ab@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212-uvc-race-v2-2-54496cc3b8ab@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/13 15:35), Ricardo Ribalda wrote:
[..]
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -559,7 +559,7 @@ struct uvc_device {
>  	/* Status Interrupt Endpoint */
>  	struct usb_host_endpoint *int_ep;
>  	struct urb *int_urb;
> -	u8 *status;
> +	u8 status[UVC_MAX_STATUS_SIZE];

Can we use `struct uvc_control_status status;` instead of open-coding it?
Seems that this is what the code wants anyway:

	struct uvc_control_status *status =
				(struct uvc_control_status *)dev->status;

And then we can drop casts in uvc_status_complete().

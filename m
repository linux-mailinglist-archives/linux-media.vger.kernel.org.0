Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF460649816
	for <lists+linux-media@lfdr.de>; Mon, 12 Dec 2022 03:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiLLC7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Dec 2022 21:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbiLLC7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Dec 2022 21:59:23 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8368AB7EC
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 18:59:22 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id 142so7282595pga.1
        for <linux-media@vger.kernel.org>; Sun, 11 Dec 2022 18:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghZng+o7vrNyoICK5o/wsHSFT0RaK0uhwurbgOlYZ8s=;
        b=MNSTJDVIVxo8AXBGEODjmtGRSGD2BlQ4HuNV5cV9ODJWFRmnm6F4CdDm8CieM5D3zy
         CI7Qj+FRQBypRJDU/3wEH2yrpyHvM4yQettEuiVwMHGTYlxYSpJoyNbLGG3lXt8Dqe8R
         j0lBUUS+QXjfomft7MQnsT+VIAzmjnZ0rLn7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghZng+o7vrNyoICK5o/wsHSFT0RaK0uhwurbgOlYZ8s=;
        b=shGNYsWUSJz2eo34OeIQIhcD5w05EjpK9jtaVnU1sij8q9Ys1XnYuwL7e9mjaqTAvE
         uQQNymLQlGNSsa8oMtQv+IgL/VH9l2ar0h9sjhz3HdeV2OsP41+OlhO7bhJRwewfxOkF
         n2PT8kKj3o3kpDHQWgCQmm9Y/dzDF9TsqIIOFk28OHKg6THWmaORFz4shsAd34CO2P0r
         8JoVA+2daUVW/g0ZeorI/Aoh01YmAiAS27y249kmfRE3l1MmY+KLlnynMZ7qC9X20tai
         xxRkxFlUD1XOIM8fgIz0zq00XJw/S5N+mGTJduk50Fy7hFfC2x/UIOUDm7P2dFTQiRLp
         Ucsg==
X-Gm-Message-State: ANoB5pkv5RB0HqWYN9hwQGPVWWD+aX8PRMZx9b5nH+mtDZLAjhlkjynZ
        MpAgTyczrKd+s/2iof9TMmoPVg==
X-Google-Smtp-Source: AA0mqf45/p+n2cziOEfpI9VnZ1uCMCBZJoBKEWaWDHXt1AYgzZmqWsa/VO/v8T9hwOrOi+xmZ/HQ5A==
X-Received: by 2002:a62:7b97:0:b0:577:151d:122e with SMTP id w145-20020a627b97000000b00577151d122emr15229565pfc.18.1670813962038;
        Sun, 11 Dec 2022 18:59:22 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id 69-20020a621648000000b0057630286100sm4591381pfw.164.2022.12.11.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 18:59:21 -0800 (PST)
Date:   Mon, 12 Dec 2022 11:59:16 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Tomasz Figa <tfiga@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, Max Staudt <mstaudt@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 2/2] media: uvcvideo: Do power management granularly
Message-ID: <Y5aZBHAdNDy6hsEg@google.com>
References: <20220920-resend-powersave-v5-0-692e6df6c1e2@chromium.org>
 <20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/12/06 15:06), Ricardo Ribalda wrote:
> 
> Instead of suspending/resume the USB device at open()/close(), do it
> when the device is actually used.
> 
> This way we can reduce the power consumption when a service is holding
> the video device and leaving it in an idle state.
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Reviewed-by: Max Staudt <mstaudt@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

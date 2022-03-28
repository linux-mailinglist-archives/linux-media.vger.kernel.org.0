Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F824E9BB0
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 17:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240233AbiC1Pyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 11:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240061AbiC1Pyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 11:54:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C0E228
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 08:52:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7DD62F7;
        Mon, 28 Mar 2022 17:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648482773;
        bh=lIHoTHna7yaloNIjpJVgDdUXIYsP91OzXvUq+fiYukA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TKGQFUAcDEXTnM4l6+yCFMgUcn1y5N7U6EcTwgxKsXpXxV69TygH+Ps8HOkR6c5hW
         qw1wcmT0yAq/HF4fmfPl4mIGsNjPAhfO3bN0NcXNipja5PuFSZzr6ajogAwg9VivU/
         wOQjcBmjexTGk/gLaE9mZ+NsIkFd4lHRt0SHFxXY=
Date:   Mon, 28 Mar 2022 18:52:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] media-ctl: Add MEDIA_BUS_FMT_JPEG_1X8
Message-ID: <YkHZ0uP5uLNOP2Wh@pendragon.ideasonboard.com>
References: <20220328135628.96966-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220328135628.96966-1-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 28, 2022 at 03:56:28PM +0200, Jacopo Mondi wrote:
> Add the "JPEG" identifier to enable setting MEDIA_BUS_FMT_JPEG_1X8
> media bus code.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  utils/media-ctl/libv4l2subdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> index eb9e1cc43b7e..0f9ccc0a1552 100644
> --- a/utils/media-ctl/libv4l2subdev.c
> +++ b/utils/media-ctl/libv4l2subdev.c
> @@ -1084,6 +1084,7 @@ static const struct {
>  	{ "RBG24", MEDIA_BUS_FMT_RBG888_1X24 },
>  	{ "RGB32", MEDIA_BUS_FMT_RGB888_1X32_PADHI },
>  	{ "ARGB32", MEDIA_BUS_FMT_ARGB8888_1X32 },
> +	{ "JPEG", MEDIA_BUS_FMT_JPEG_1X8 },

I've just realized that media-ctl already supports JPEG, with the
"JPEG_1X8" format name. It looks like adding a shorter name isn't
needed.

>  };
> 
>  const char *v4l2_subdev_pixelcode_to_string(enum v4l2_mbus_pixelcode code)

-- 
Regards,

Laurent Pinchart

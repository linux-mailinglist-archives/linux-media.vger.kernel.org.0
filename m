Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A33E2C00
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 15:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhHFNzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 09:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbhHFNzU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 09:55:20 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5A8C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Aug 2021 06:55:05 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: daniels)
        with ESMTPSA id 396251F44A76
Message-ID: <08df38bda028bde4d566b89fae266d0e9f424cd6.camel@collabora.com>
Subject: Re: [PATCH v3 3/4] media: Add NV12_4L4 tiled format
From:   Daniel Stone <daniels@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        kernel@collabora.com
In-Reply-To: <20210805024752.8755-4-ezequiel@collabora.com>
References: <20210805024752.8755-1-ezequiel@collabora.com>
         <20210805024752.8755-4-ezequiel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Fri, 06 Aug 2021 13:42:47 +0100
User-Agent: Evolution 3.40.3 (by Flathub.org) 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-08-04 at 23:47 -0300, Ezequiel Garcia wrote:
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -275,6 +275,9 @@ const struct v4l2_format_info
> *v4l2_format_info(u32 format)
>                 { .format = V4L2_PIX_FMT_YUV422P, .pixel_enc =
> V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1,
> 1, 0 }, .hdiv = 2, .vdiv = 1 },
>                 { .format = V4L2_PIX_FMT_GREY,    .pixel_enc =
> V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0,
> 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  
> +               /* Tiled YUV formats */
> +               { .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc =
> V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2,
> 0, 0 }, .hdiv = 2, .vdiv = 2 },

Still no movement on modifiers, I guess ... :(

Cheers,
Daniel


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 259041BE3D2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 18:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgD2Q1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 12:27:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2Q1o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 12:27:44 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 651352076B;
        Wed, 29 Apr 2020 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588177664;
        bh=eh/IvFPQ0/dhBqxFJsWXSuX5dJOIuA7wn7RrZfWWTyo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eL0/l3i2bAMKLXeB6g3tu+tF4VoMOD4Nxy4P18oBgmjbm7LVBmuweqaW77GEZlY04
         S1+nBle1qW6Iz3P6VNsgRvQ3HcCZkscAbhEjwTcWFIm4xghDQowsvKvasqLq6tYi7j
         dwn4xJza25Go94WYwEeFzbVfhuyMnrGCGOL+VOvw=
Date:   Wed, 29 Apr 2020 18:27:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8.1 3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support
 MC-centric devices
Message-ID: <20200429182739.274ce451@coco.lan>
In-Reply-To: <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
References: <20200421135743.1381930-4-niklas.soderlund+renesas@ragnatech.se>
        <20200424134331.22271-1-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 24 Apr 2020 16:43:31 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> The VIDIOC_ENUM_FMT ioctl enumerates all formats supported by a video
> node. For MC-centric devices, its behaviour has always been ill-defined,
> with drivers implementing one of the following behaviours:
> 

...

The patch itself is OK. However, there's a change you did at the
documentation that it is unrelated. 

See below.

> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 8ca6ab701e4a..a987debc7654 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -48,10 +48,21 @@ one until ``EINVAL`` is returned. If applicable, drivers shall return
>  formats in preference order, where preferred formats are returned before
>  (that is, with lower ``index`` value) less-preferred formats.
>  
> -.. note::
> -   After switching input or output the list of enumerated image
> -   formats may be different.

Why are you dropping this note?

This basically reverts this changeset:

  commit 93828d6438081649e81b8681df9bf6ad5d691650
  Author: Hans Verkuil <hans.verkuil@cisco.com>
  Date:   Mon Sep 3 09:37:18 2012 -0300

    [media] DocBook: make the G/S/TRY_FMT specification more strict
    
    - S/TRY_FMT should always succeed, unless an invalid type field is passed in.
    - TRY_FMT should give the same result as S_FMT, all other things being equal.
    - ENUMFMT may return different formats for different inputs or outputs.
    This was decided during the 2012 Media Workshop.
    
    Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
    Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
    Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

As far as I remember, from our 2012 discussions, some drivers may change 
the enumerated image formats when some ioctls like VIDIOC_S_INPUT and
VIDIOC_S_OUTPUT ioctls are used. I also vaguely remember that 90 and 270
degrees rotation would equally affect it.

Perhaps, the removal was just some mistake. If so, please re-submit
another patch without it.

Otherwise, if are there any good reasons for such change, and it won't
cause any API regressions, please place it on a separate patch, clearly
that.

... Or, maybe you felt that it won't make sense for MC-centric devices.
On such case, please improve the note stating it on a way that it would
be understandable on both MC-centric and bridge-centrid drivers. 

Thanks,
Mauro

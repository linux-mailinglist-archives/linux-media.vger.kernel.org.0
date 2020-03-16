Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F56187661
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 00:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732973AbgCPXwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 19:52:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42496 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732873AbgCPXwC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 19:52:02 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BF22F9;
        Tue, 17 Mar 2020 00:51:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584402719;
        bh=ah838C6kO7EjMOpuhkiD9DrsPers0LMY1pfngi2hEdY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U8aUYMCq9h/nChsnhklWlLUgMCrrfFG0maNU8rHxDNvQU+N2z4yiQxDJbQTobo7Xj
         AKc0EDZ8oaynkud9M1XP48NBa0qt8s6q3iFDnC95JV6CaQPBwxm3cb0A0v5LiJ6D8E
         qlJrpd5HErSUGXcvCbRJh5u4bwXItR1qZE0XpeT8=
Date:   Tue, 17 Mar 2020 01:51:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, mchehab@kernel.org
Subject: Re: [PATCH] media: doc-rst: in the RGB formats table add '-' in
 undefined bits
Message-ID: <20200316235154.GY4732@pendragon.ideasonboard.com>
References: <20200316155626.20272-1-dafna.hirschfeld@collabora.com>
 <8acdc0fe-7657-a65b-ab8c-f84419701c1a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8acdc0fe-7657-a65b-ab8c-f84419701c1a@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Mon, Mar 16, 2020 at 05:31:25PM +0100, Dafna Hirschfeld wrote:
> hi, adding suggested-by
> 
> On 16.03.20 16:56, Dafna Hirschfeld wrote:
> > In the table of the RGB formats, add an explicit '-' signs
> > to cells that contain undefined bits.
> > This makes it more clear how many bits and bytes are used
> > for each format.
> > 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > ---
> >   Documentation/media/uapi/v4l/pixfmt-rgb.rst | 136 ++++++++++----------
> >   1 file changed, 68 insertions(+), 68 deletions(-)
> > 
> > diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > index 4ce305cc45da..e4adac7f2e4c 100644
> > --- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
> > @@ -128,10 +128,10 @@ next to each other in memory.
> >         - b\ :sub:`1`
> >         - b\ :sub:`0`
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >         - r\ :sub:`3`
> >         - r\ :sub:`2`
> >         - r\ :sub:`1`
> > @@ -169,10 +169,10 @@ next to each other in memory.
> >         - b\ :sub:`2`
> >         - b\ :sub:`1`
> >         - b\ :sub:`0`
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >   
> >         - r\ :sub:`3`
> >         - r\ :sub:`2`
> > @@ -220,10 +220,10 @@ next to each other in memory.
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >         - b\ :sub:`3`
> >         - b\ :sub:`2`
> >         - b\ :sub:`1`
> > @@ -261,10 +261,10 @@ next to each other in memory.
> >         - r\ :sub:`2`
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >   
> >         - b\ :sub:`3`
> >         - b\ :sub:`2`
> > @@ -312,7 +312,7 @@ next to each other in memory.
> >         - b\ :sub:`1`
> >         - b\ :sub:`0`
> >   
> > -      -
> > +      - `-`
> >         - r\ :sub:`4`
> >         - r\ :sub:`3`
> >         - r\ :sub:`2`
> > @@ -356,7 +356,7 @@ next to each other in memory.
> >         - b\ :sub:`2`
> >         - b\ :sub:`1`
> >         - b\ :sub:`0`
> > -      -
> > +      - `-`
> >   
> >         - r\ :sub:`4`
> >         - r\ :sub:`3`
> > @@ -404,7 +404,7 @@ next to each other in memory.
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> >   
> > -      -
> > +      - `-`
> >         - b\ :sub:`4`
> >         - b\ :sub:`3`
> >         - b\ :sub:`2`
> > @@ -448,7 +448,7 @@ next to each other in memory.
> >         - r\ :sub:`2`
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> > -      -
> > +      - `-`
> >   
> >         - b\ :sub:`4`
> >         - b\ :sub:`3`
> > @@ -510,7 +510,7 @@ next to each other in memory.
> >         - ``V4L2_PIX_FMT_XRGB555X``
> >         - 'XR15' | (1 << 31)
> >   
> > -      -
> > +      - `-`
> >         - r\ :sub:`4`
> >         - r\ :sub:`3`
> >         - r\ :sub:`2`
> > @@ -640,21 +640,21 @@ next to each other in memory.
> >   
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >       * .. _V4L2-PIX-FMT-ABGR32:
> >   
> >         - ``V4L2_PIX_FMT_ABGR32``
> > @@ -727,14 +727,14 @@ next to each other in memory.
> >         - r\ :sub:`1`
> >         - r\ :sub:`0`
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >       * .. _V4L2-PIX-FMT-BGRA32:
> >   
> >         - ``V4L2_PIX_FMT_BGRA32``
> > @@ -780,14 +780,14 @@ next to each other in memory.
> >         - ``V4L2_PIX_FMT_BGRX32``
> >         - 'RX24'
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >   
> >         - b\ :sub:`7`
> >         - b\ :sub:`6`
> > @@ -887,14 +887,14 @@ next to each other in memory.
> >         - b\ :sub:`1`
> >         - b\ :sub:`0`
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >       * .. _V4L2-PIX-FMT-ARGB32:
> >   
> >         - ``V4L2_PIX_FMT_ARGB32``
> > @@ -940,14 +940,14 @@ next to each other in memory.
> >         - ``V4L2_PIX_FMT_XRGB32``
> >         - 'BX24'
> >   
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > -      -
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> > +      - `-`
> >   
> >         - r\ :sub:`7`
> >         - r\ :sub:`6`
> > 

-- 
Regards,

Laurent Pinchart

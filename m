Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E8318685E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730431AbgCPKAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:00:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730399AbgCPKAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:00:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61A46A3B;
        Mon, 16 Mar 2020 11:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584352842;
        bh=MhKFBXr7qX2BbApNO78j8Sdn8/qcNYJHxKWov/TsZRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VHwx2pQ4h74PyW1eF8NVWYVZkcEDTDLaHnCHZj1/7a8Z7T6g7Cp9VgQEKPUWZ4LRe
         XK/zRmg0JLkbIZh7djhvx0DZZvgy96SywFrgqWfWPru1s7OvccQQy46S0tpr0HHkeX
         njDIbE3dy+V1u6RA0doIjahOm+RXJoBrWrd+tZbs=
Date:   Mon, 16 Mar 2020 12:00:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH] media: v4l2-common: Add BGR666 to v4l2_format_info
Message-ID: <20200316100036.GR4732@pendragon.ideasonboard.com>
References: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
 <20200316072214.GA16123@pendragon.ideasonboard.com>
 <31efd58f-1ab1-d3d0-e4b9-ea9072e608fa@collabora.com>
 <20200316081516.GK4732@pendragon.ideasonboard.com>
 <401a9aca-f61f-d818-28dc-0e4cf7c2ac20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <401a9aca-f61f-d818-28dc-0e4cf7c2ac20@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Mar 16, 2020 at 09:59:56AM +0100, Dafna Hirschfeld wrote:
> On 16.03.20 09:15, Laurent Pinchart wrote:
> > On Mon, Mar 16, 2020 at 09:07:16AM +0100, Dafna Hirschfeld wrote:
> >> On 16.03.20 08:22, Laurent Pinchart wrote:
> >>> On Mon, Mar 16, 2020 at 08:01:23AM +0100, Dafna Hirschfeld wrote:
> >>>> Add V4L2_PIX_FMT_BGR666 to the format table.
> >>>>
> >>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>> ---
> >>>> Hi,
> >>>> BGR66 is needed for the rkisp1 driver.
> >>>> Currently it crashes since the call to
> >>>> v4l2_format_info returns NULL.
> >>>>
> >>>>    drivers/media/v4l2-core/v4l2-common.c | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >>>> index d0e5ebc736f9..d7f82b2aa22f 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-common.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >>>> @@ -253,6 +253,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >>>>    		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>>>    		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>>>    		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>>> +		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>>
> >>> Isn't BGR666 stored in 3 bytes per pixel ?
> >>
> >> Hi, I also discussed it with Helen. From the documentation we
> >> understood that it uses 4 bytes and the last one is empty.
> >> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/pixfmt-rgb.html
> > 
> > Would you then also understand V4L2_PIX_FMT_RGB565 to use 4 bytes with
> > the last 2 bytes empty ? :-)
>
> hmm, the formats between BGR24 and XRGB32 in the docs table have vertical lines crossing all 4 bytes so we understood that they are all 4 bytes. Isn't it?
> Format RGB565 doesn't have does vertical lines on the last two bytes which means it uses 2. At least that is what we understood.

I stand corrected, looking at the drivers implementing
V4L2_PIX_FMT_BGR666, they all handle it as a 32bpp format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > I agree that the documentation is somehow ambiguous and should be fixed.
> > Patches are welcome ;-)

I think adding explicit '-' or 'x' in the cells that contain "don't
care" bits would help avoiding confusion.

> >>>>    
> >>>>    		/* YUV packed formats */
> >>>>    		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },

-- 
Regards,

Laurent Pinchart

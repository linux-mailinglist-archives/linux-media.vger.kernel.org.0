Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD8931B393
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 01:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBOAYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 19:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhBOAYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 19:24:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC28C061574
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 16:24:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55F3D9E6;
        Mon, 15 Feb 2021 01:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613348649;
        bh=xH/WkbsPteP8D1eww7ab3OYH4VXf/kBKXlVNmwiGd8w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R7DajorDeaUvh1HLSyfs+QM8D2ZRnX6JjVxxZQ5xq91NQA5MJO1hRdbUwZZyOVGkf
         q+nsCOEuiigXNnbox577uy9JW+MW0+iSvw7mku4uYHL6ubnvYs6Ww3rWR2o1lCz2Wm
         b84j+eD3dH9o8Qu+VedW3je6nYJPoVrmG59yKBWU=
Date:   Mon, 15 Feb 2021 02:23:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
Message-ID: <YCm/ELi8LX8uJGp1@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
 <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com>
 <CAOMZO5CkT1i3TMhC=VuZ4c3B6VnKX7jDj6wYON9VLMyQdDODKA@mail.gmail.com>
 <X/kCmomKdjh3Yepp@pendragon.ideasonboard.com>
 <CAOMZO5A42C4A58WjjHmRV4NVCVxiwKeCjsibSsC=FgLgD8o79Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5A42C4A58WjjHmRV4NVCVxiwKeCjsibSsC=FgLgD8o79Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

Sorry for the late reply.

On Fri, Jan 08, 2021 at 10:47:15PM -0300, Fabio Estevam wrote:
> On Fri, Jan 8, 2021 at 10:11 PM Laurent Pinchart wrote:
> >
> > Ah of course, I should have mentioned that, sorry. Without the legacy
> > video node API, the pipeline has to be configured with the MC API and
> > the V4L2 subdev userspace API before starting the stream.
> 
> The current method I use is:
> 
> media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_2X8/320x240 field:none]"

I think this is good. The output of 'media-ctl -p' would help
double-checking.

> # gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink

Here you need to specify the format and size for the V4L2 device. I
think the following should do (I haven't tested it though and I'm no
gstreamer expert).

gst-launch-1.0 -v \
	v4l2src device=/dev/video1 ! \
	video/x-raw,format=UYVY,width=320,height=240 ! \
	v4l2convert ! \
	fbdevsink

> Could you please let me know what is the correct way I should do with
> the MC API?

-- 
Regards,

Laurent Pinchart

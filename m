Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA12E18662A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 09:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgCPIPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 04:15:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729975AbgCPIPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 04:15:22 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 127322D6;
        Mon, 16 Mar 2020 09:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584346521;
        bh=ciL3L2cwCyQdU943fFeykGhQ5qsTzJJD+R5MrKQcvbw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D4LYrOFjwQne9bGk2PvRCJj+OCJFSgcPPgxDgyfZyNvKjeWAUjCfZuLFW2hhJb1Xn
         sGssIeCC8gb/qc0j/6Wnwb8xOgGbGzRfaJAzEqAPq2G2WCJqgSQwgxPkP5MRssSNaA
         JGSls43Vhx1lyuDGbcxKtVn7KoQPm8S66ZnqWqUk=
Date:   Mon, 16 Mar 2020 10:15:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH] media: v4l2-common: Add BGR666 to v4l2_format_info
Message-ID: <20200316081516.GK4732@pendragon.ideasonboard.com>
References: <20200316070123.2434-1-dafna.hirschfeld@collabora.com>
 <20200316072214.GA16123@pendragon.ideasonboard.com>
 <31efd58f-1ab1-d3d0-e4b9-ea9072e608fa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31efd58f-1ab1-d3d0-e4b9-ea9072e608fa@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Mon, Mar 16, 2020 at 09:07:16AM +0100, Dafna Hirschfeld wrote:
> On 16.03.20 08:22, Laurent Pinchart wrote:
> > On Mon, Mar 16, 2020 at 08:01:23AM +0100, Dafna Hirschfeld wrote:
> >> Add V4L2_PIX_FMT_BGR666 to the format table.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >> Hi,
> >> BGR66 is needed for the rkisp1 driver.
> >> Currently it crashes since the call to
> >> v4l2_format_info returns NULL.
> >>
> >>   drivers/media/v4l2-core/v4l2-common.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> >> index d0e5ebc736f9..d7f82b2aa22f 100644
> >> --- a/drivers/media/v4l2-core/v4l2-common.c
> >> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >> @@ -253,6 +253,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
> >>   		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_RGB565,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >>   		{ .format = V4L2_PIX_FMT_RGB555,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> >> +		{ .format = V4L2_PIX_FMT_BGR666,  .pixel_enc = V4L2_PIXEL_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> > 
> > Isn't BGR666 stored in 3 bytes per pixel ?
>
> Hi, I also discussed it with Helen. From the documentation we
> understood that it uses 4 bytes and the last one is empty.
> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/pixfmt-rgb.html

Would you then also understand V4L2_PIX_FMT_RGB565 to use 4 bytes with
the last 2 bytes empty ? :-)

I agree that the documentation is somehow ambiguous and should be fixed.
Patches are welcome ;-)

> >>   
> >>   		/* YUV packed formats */
> >>   		{ .format = V4L2_PIX_FMT_YUYV,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },

-- 
Regards,

Laurent Pinchart

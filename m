Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A2F30261A
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 15:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbhAYOKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 09:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729255AbhAYOIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 09:08:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BB6C0613D6;
        Mon, 25 Jan 2021 06:08:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BFC6331;
        Mon, 25 Jan 2021 15:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611583680;
        bh=sjCWCuGQ91U+T/0nFlj+7MX712ur5d08TWXtqlvD9Xs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=capaosn0vDWFRiSnaj/PgDHhjjCNdRyMHGfJ1C5bC0PpylOK8672d0hQWb67KHpYr
         uFG8Pjl3xnehIVZafMYKWi3Hhs2OtCnwXLczhIHEvOAThLd8jxYltjHhrnLqt+kY10
         L1mxh6zCIRRAoBb6/60Onp9daHe3kYpxEO26GdR8=
Date:   Mon, 25 Jan 2021 16:07:41 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info
Message-ID: <YA7QrYiUjb6BD8cK@pendragon.ideasonboard.com>
References: <20210122182723.327438-1-helen.koike@collabora.com>
 <YAvyu6AvEmZy6WRq@pendragon.ideasonboard.com>
 <7f650d51-d419-53cc-0ad1-b241a10ab801@collabora.com>
 <9468d3e1-ac8b-8de7-5632-1da9119c992e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9468d3e1-ac8b-8de7-5632-1da9119c992e@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Mon, Jan 25, 2021 at 11:02:01AM -0300, Helen Koike wrote:
> On 1/25/21 10:57 AM, Helen Koike wrote:
> > On 1/23/21 6:56 AM, Laurent Pinchart wrote:
> >> On Fri, Jan 22, 2021 at 03:27:23PM -0300, Helen Koike wrote:
> >>> YUV 4:4:4 is not subsampled, fix this in the docs.
> >>>
> >>> Fixes: da785536e007 ("media: doc: pixfmt-yuv: Move all semi-planar YUV formats to common file")
> >>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>> ---
> >>>  Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >>> index 7d4d39201a3f..bcb4ef24c334 100644
> >>> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> >>> @@ -396,8 +396,8 @@ number of lines as the luma plane.
> >>>  NV24 and NV42
> >>>  -------------
> >>>  
> >>> -Semi-planar YUV 4:4:4 formats. The chroma plane is subsampled by 2 in the
> >>> -horizontal direction. Chroma lines contain half the number of pixels and the
> >>> +Semi-planar YUV 4:4:4 formats. No sub-sampling.
> >>
> >> "The chroma plane is not subsampled." ?
> > 
> > Ack.
> > 
> >>> +Chroma lines contain the same number of pixels and the
> >>>  same number of bytes as luma lines, and the chroma plane contains the same
> >>>  number of lines as the luma plane.
> >>
> >> That's not quite right, the chroma lines contain twice the number of
> >> pixels and bytes, as there's one Cb and one Cr value in the chroma line
> >> for each Y value in the luma line.
> 
> Actually, it is the same number o pixels, but twice the number o bytes.
> Since a trio (YCbCr) compose a pixel.
> 
> At least this is how I understand comparing the logic of the text description
> of NV16 YUV4:2:2.

You're right, my bad.

> >> Maybe the text could be reflowed ?
> > 
> > Ack.
> > 
> > I'll submit v2 updating the text.

-- 
Regards,

Laurent Pinchart

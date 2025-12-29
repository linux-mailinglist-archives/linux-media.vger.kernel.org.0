Return-Path: <linux-media+bounces-49633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8DCE64DA
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 10:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF8943000DF9
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 09:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA4826FD97;
	Mon, 29 Dec 2025 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mZSPq8pk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2526461F
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767001034; cv=none; b=nLYvH8QtD6Tj45ZK5J2DqSnMZNeazSNNI6LtdhJgXkIyqD+kMAG9BL0taMIRZudZ8bBmmc7uWmgYGQ3AxJpC2kB1aQJsVyTHfsyKOVN2rnnGRb9hd/JxtYjgfhdPx4Jb+nTIyhJLfGsqI+OWZl97/mtthqNs3Tgv2HhzZu7tbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767001034; c=relaxed/simple;
	bh=iiTyTHpXPYEndjzGHWqSYS9dxXxQrEbuAAreYJLJSp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKHzJ/1HpQhJdygHoo1hfcEQCuwcCa6MA3+KQbvkoh2CHDza7myEyt/+vjZ6G5d9b40HZd9ukhdRlp/ZzP7/SztkRutXSq3dtpVfEihM9U/r2G7VL+/YWzLc0u7gWYZ0DPN31Q7N92RYzqpBuPUcWM3gxDUUZeTdj6oKob5LmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mZSPq8pk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 52E6C766;
	Mon, 29 Dec 2025 10:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767001012;
	bh=iiTyTHpXPYEndjzGHWqSYS9dxXxQrEbuAAreYJLJSp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZSPq8pkOAJyInLSDvogjmCxnAKa5GQqW9QG+JCT6iFG0wS9YG7rDehRbKcoZv7lV
	 d5nzWl1zoS5NsQTKhAmFKquHaW9a95qWtIo4E6Ko4pmMw8WsmqUI7Qbleax2lGoNGT
	 9rfozqoE+VzcEjdmhGUFlQDeTYb+2rlXR0JjlxEo=
Date: Mon, 29 Dec 2025 11:36:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oliver Collyer <ovcollyer@mac.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Message-ID: <20251229093651.GA6598@pendragon.ideasonboard.com>
References: <20251227104858.GC4094@pendragon.ideasonboard.com>
 <80A19C25-C42F-4FBF-AA12-B8F230F8734E@mac.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80A19C25-C42F-4FBF-AA12-B8F230F8734E@mac.com>

Hi Oliver,

On Mon, Dec 29, 2025 at 06:38:25AM +0000, Oliver Collyer wrote:
> Hi Laurent
> 
> Thank you for that, I understand; I would probably use the web patch
> submission method if there was a next time - however, do I need to
> submit this patch again or are we good?

I can fix the commit message if you provide the correct link.

> > On 27 Dec 2025, at 10:49, Laurent Pinchart wrote:
> > 
> > ﻿Hi Oliver,
> > 
> >> On Fri, Dec 26, 2025 at 10:26:50PM +0000, Oliver Collyer wrote:
> >> Hello Laurent
> >> 
> >> Please find attached the relevant output from ‘lsusb -v’ for the device.
> > 
> > Thank you.
> > 
> >> I’m not sure what is wrong with my email setup or what exactly you’re
> >> seeing but I’ll try and figure it out, sorry!
> > 
> > Something somewhere replaced the message ID in the Link: trailer with
> > "[email protected]":
> > 
> > Link: https://lore.kernel.org/linux-media/[email protected]/
> > 
> > The vger.kernel.org server doesn't do that, so it must be on your side.
> > Given that you seem to have used git-send-email (based on the "X-Mailer:
> > git-send-email 2.43.0" mail header in your patch), I assume it must have
> > happened somewhere on icloud. I don't know if the behaviour can be
> > configured, if not you may need to consider switching to a different
> > e-mail provider that doesn't mangle with the content of patches. Another
> > option would be to submit patches using the b4 web submission endpoint,
> > see https://b4.docs.kernel.org/en/latest/contributor/send.html.
> > 
> > [snip]
> > 
> >>>> On 26 Dec 2025, at 20:42, Laurent Pinchart wrote:
> >>> On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
> >>>> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
> >>>> uvcvideo driver. This format is exposed by USB capture devices such as
> >>>> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.
> >>> 
> >>> Could you pelase provide the 'lsusb -v' output for that device ?
> >>> 
> >>>> P010 stores 10-bit Y and interleaved UV samples in 16-bit little-endian
> >>>> words, with data in the upper 10 bits and zeros in the lower 6 bits.
> >>>> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
> >>>> 
> >>>> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
> >>>> ("media: Add P010 video format").
> >>>> 
> >>>> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
> >>>> 
> >>>> Link: https://lore.kernel.org/linux-media/[email protected]/
> >>> 
> >>> Please fix your e-mail setup to avoid this.
> >>> 
> >>>> Link: https://github.com/awawa-dev/P010_for_V4L2
> >>>> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
> >>>> ---
> >>>> drivers/media/common/uvc.c       | 4 ++++
> >>>> drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
> >>>> include/linux/usb/uvc.h          | 3 +++
> >>>> 3 files changed, 10 insertions(+)
> >>>> 
> >>>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> >>>> --- a/include/linux/usb/uvc.h
> >>>> +++ b/include/linux/usb/uvc.h
> >>>> @@ -109,6 +109,9 @@
> >>>> #define UVC_GUID_FORMAT_M420 \
> >>>>    { 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
> >>>>     0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >>>> +#define UVC_GUID_FORMAT_P010 \
> >>>> +    { 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
> >>>> +     0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >>>> 
> >>>> #define UVC_GUID_FORMAT_H264 \
> >>>>    { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> >>>> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> >>>> --- a/drivers/media/common/uvc.c
> >>>> +++ b/drivers/media/common/uvc.c
> >>>> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >>>>        .guid        = UVC_GUID_FORMAT_M420,
> >>>>        .fcc        = V4L2_PIX_FMT_M420,
> >>>>    },
> >>>> +    {
> >>>> +        .guid        = UVC_GUID_FORMAT_P010,
> >>>> +        .fcc        = V4L2_PIX_FMT_P010,
> >>>> +    },
> >>>>    {
> >>>>        .guid        = UVC_GUID_FORMAT_UYVY,
> >>>>        .fcc        = V4L2_PIX_FMT_UYVY,
> >>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >>>> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
> >>>>    case V4L2_PIX_FMT_M420:
> >>>>        return frame->wWidth;
> >>>> 
> >>>> +    case V4L2_PIX_FMT_P010:
> >>>> +        return frame->wWidth * 2;
> >>>> +
> >>>>    default:
> >>>>        return format->bpp * frame->wWidth / 8;
> >>>>    }

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-49586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89229CDF82F
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B10C4300ACFA
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 10:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B61C24A06A;
	Sat, 27 Dec 2025 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K5GbzvLB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65F487BE
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832559; cv=none; b=iLPJy16fQG26qMqkg6c9JfEh5UHTE3oHTP687sonI2TYAGdzp9/8q+LnazDN+PSl2s9EiRgZHl+M+bolsg95ivMrDbWf8XH2yvlhqmVgI6QGWvN391i/fR6IezKfjFQtmgzVy37Bx2DfdUzW4dbWiuz+s8OBHOfufJDUwLljSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832559; c=relaxed/simple;
	bh=U4CWAwybJxVEqyFj5d8Z98mHFSUw5M8z0cpsak4zav8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hzzxscro6oE8aIcSC5aZvtdX/t0yFexBFnyl37jbQNrKJfHd2gz/DPv4lZb9aPpIOonXT0eOOAah3vZvot8YzwE4I2T1/VAyRovJGNCKBA7oj2e8KTnKxTKpDF1Is9HGHQ5czqblhUvRSc0DSpz/NicaqYoW1dllo+F0nnl3hrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K5GbzvLB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B4EAA10D;
	Sat, 27 Dec 2025 11:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766832540;
	bh=U4CWAwybJxVEqyFj5d8Z98mHFSUw5M8z0cpsak4zav8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5GbzvLBXp1NwKw82Ao42/RNFy9Ol5zaHy/yZkcy1k7pAoHVz64YovKlB7T6EYTfj
	 ZZINBnartV19a0Bjf/6mFtLG2kviHpFvr6WJ3aLT1Rax8R9SDbWO76Ofz6Ebeq527c
	 XawWEHpkgl4QnFDfXQSMdwq4pR6GX0qI5i6H2a+U=
Date: Sat, 27 Dec 2025 12:48:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oliver Collyer <ovcollyer@mac.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Add support for P010 pixel format
Message-ID: <20251227104858.GC4094@pendragon.ideasonboard.com>
References: <25886965-BB9A-4AFB-BEBA-E845B6CAB43A@mac.com>
 <20251226065718.95504-1-ovcollyer@mac.com>
 <20251226204201.GA4094@pendragon.ideasonboard.com>
 <F9865198-1EA7-4FFE-9FE3-A631A9D2E10A@mac.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F9865198-1EA7-4FFE-9FE3-A631A9D2E10A@mac.com>

Hi Oliver,

On Fri, Dec 26, 2025 at 10:26:50PM +0000, Oliver Collyer wrote:
> Hello Laurent
> 
> Please find attached the relevant output from ‘lsusb -v’ for the device.

Thank you.

> I’m not sure what is wrong with my email setup or what exactly you’re
> seeing but I’ll try and figure it out, sorry!

Something somewhere replaced the message ID in the Link: trailer with
"[email protected]":

Link: https://lore.kernel.org/linux-media/[email protected]/

The vger.kernel.org server doesn't do that, so it must be on your side.
Given that you seem to have used git-send-email (based on the "X-Mailer:
git-send-email 2.43.0" mail header in your patch), I assume it must have
happened somewhere on icloud. I don't know if the behaviour can be
configured, if not you may need to consider switching to a different
e-mail provider that doesn't mangle with the content of patches. Another
option would be to submit patches using the b4 web submission endpoint,
see https://b4.docs.kernel.org/en/latest/contributor/send.html.

[snip]

> > On 26 Dec 2025, at 20:42, Laurent Pinchart wrote:
> > On Fri, Dec 26, 2025 at 06:57:18AM +0000, Oliver Collyer wrote:
> >> Add support for the P010 (10-bit Y/UV 4:2:0) pixel format to the
> >> uvcvideo driver. This format is exposed by USB capture devices such as
> >> the Magewell USB Capture HDMI 4K Pro when capturing HDR10 content.
> > 
> > Could you pelase provide the 'lsusb -v' output for that device ?
> > 
> >> P010 stores 10-bit Y and interleaved UV samples in 16-bit little-endian
> >> words, with data in the upper 10 bits and zeros in the lower 6 bits.
> >> This requires 2 bytes per sample, so bytesperline is wWidth * 2.
> >> 
> >> V4L2_PIX_FMT_P010 was added to the V4L2 core in commit 5374d8fb75f3
> >> ("media: Add P010 video format").
> >> 
> >> Based on the community DKMS patch from awawa-dev/P010_for_V4L2.
> >> 
> >> Link: https://lore.kernel.org/linux-media/[email protected]/
> > 
> > Please fix your e-mail setup to avoid this.
> > 
> >> Link: https://github.com/awawa-dev/P010_for_V4L2
> >> Signed-off-by: Oliver Collyer <ovcollyer@mac.com>
> >> ---
> >> drivers/media/common/uvc.c       | 4 ++++
> >> drivers/media/usb/uvc/uvc_v4l2.c | 3 +++
> >> include/linux/usb/uvc.h          | 3 +++
> >> 3 files changed, 10 insertions(+)
> >> 
> >> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> >> --- a/include/linux/usb/uvc.h
> >> +++ b/include/linux/usb/uvc.h
> >> @@ -109,6 +109,9 @@
> >> #define UVC_GUID_FORMAT_M420 \
> >> 	{ 'M',  '4',  '2',  '0', 0x00, 0x00, 0x10, 0x00, \
> >> 	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >> +#define UVC_GUID_FORMAT_P010 \
> >> +	{ 'P',  '0',  '1',  '0', 0x00, 0x00, 0x10, 0x00, \
> >> +	 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >> 
> >> #define UVC_GUID_FORMAT_H264 \
> >> 	{ 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> >> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> >> --- a/drivers/media/common/uvc.c
> >> +++ b/drivers/media/common/uvc.c
> >> @@ -40,6 +40,10 @@ static const struct uvc_format_desc uvc_fmts[] = {
> >> 		.guid		= UVC_GUID_FORMAT_M420,
> >> 		.fcc		= V4L2_PIX_FMT_M420,
> >> 	},
> >> +	{
> >> +		.guid		= UVC_GUID_FORMAT_P010,
> >> +		.fcc		= V4L2_PIX_FMT_P010,
> >> +	},
> >> 	{
> >> 		.guid		= UVC_GUID_FORMAT_UYVY,
> >> 		.fcc		= V4L2_PIX_FMT_UYVY,
> >> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> >> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> >> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> >> @@ -235,6 +235,9 @@ static u32 uvc_v4l2_get_bytesperline(const struct uvc_format *format,
> >> 	case V4L2_PIX_FMT_M420:
> >> 		return frame->wWidth;
> >> 
> >> +	case V4L2_PIX_FMT_P010:
> >> +		return frame->wWidth * 2;
> >> +
> >> 	default:
> >> 		return format->bpp * frame->wWidth / 8;
> >> 	}

-- 
Regards,

Laurent Pinchart


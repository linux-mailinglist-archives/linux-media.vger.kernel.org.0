Return-Path: <linux-media+bounces-27633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8542A50037
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4688174FFF
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BC724BC14;
	Wed,  5 Mar 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z5QI6nQu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FD24A050;
	Wed,  5 Mar 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180331; cv=none; b=Va1whWMs78U4CRbLeAaJs64jql9dRi8VCpjXQf8kS+3YZNtAraMX9/Zmqdi4lDUobzI69zdRS+UIxXhotjIguk5GSjrUiBaCHo7f9Dvcg2TMoLF5jjCDCucO+9OKiOzbMM8wRgz6TNNiIEQQCm4f1gYNzICBzlSUSQWIbaZAE18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180331; c=relaxed/simple;
	bh=snliCsDPTTk2KnOn4QOAc1BAaok3Yakz9rge7Oo2jpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CD/6dAKYtJF1v3T9ADr1A9VNXErtgAibcKZBTdfHhyhkau93W2kCj8JSN/nIf4NelVYA53rkB927wflSv7luKqWVyLGWvS1pN4T47sLliD4rJMWPdcxM4m5jp/SJBX5HsKxfl5dMsyezsV4moKch2faUyTIOlcJ2PsYQe2utrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z5QI6nQu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13EBBE29;
	Wed,  5 Mar 2025 14:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1741180235;
	bh=snliCsDPTTk2KnOn4QOAc1BAaok3Yakz9rge7Oo2jpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5QI6nQulsRME7jSEkhyJAM2n4kUUNxHNWowOcNTCa2eG/vXHN5rih0QbdLu1Tez7
	 8E0Z4bBV+tE/t6WB18uCm0s4qxpQw4LNfzgm23LaEBbA2aKSRBEXMRwOCQdJOGt+mP
	 lh3XXBw2mFE/qiEI4bXaus413HLW8ySqF12rzyMU=
Date: Wed, 5 Mar 2025 15:11:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Enable full UVC metadata for all devices
Message-ID: <20250305131145.GC31618@pendragon.ideasonboard.com>
References: <20250226-uvc-metadata-v1-1-6cd6fe5ec2cb@chromium.org>
 <c6ab8640-d96c-4a71-929a-a4ad6bb2647d@redhat.com>
 <20250303151346.GC32048@pendragon.ideasonboard.com>
 <1436dc95-68a6-456d-ab5d-117c7791ec48@redhat.com>
 <20250303161059.GA23684@pendragon.ideasonboard.com>
 <CANiDSCux1whD3yF+mPayajU6imE4t8yjtzeAjrpLPhqyLRc4OA@mail.gmail.com>
 <2897ce12-bb32-4445-b7ed-0a835e089f03@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2897ce12-bb32-4445-b7ed-0a835e089f03@redhat.com>

On Wed, Mar 05, 2025 at 02:03:58PM +0100, Hans de Goede wrote:
> On 3-Mar-25 5:22 PM, Ricardo Ribalda wrote:
> > On Mon, 3 Mar 2025 at 17:11, Laurent Pinchart wrote:
> >> On Mon, Mar 03, 2025 at 04:43:50PM +0100, Hans de Goede wrote:
> >>> On 3-Mar-25 16:13, Laurent Pinchart wrote:
> >>>> On Mon, Mar 03, 2025 at 03:47:51PM +0100, Hans de Goede wrote:
> >>>>> On 26-Feb-25 14:00, Ricardo Ribalda wrote:
> >>>>>> The UVC driver provides two metadata types V4L2_META_FMT_UVC, and
> >>>>>> V4L2_META_FMT_D4XX. The only difference between the two of them is that
> >>>>>> V4L2_META_FMT_UVC only copies PTS, SCR, size and flags, and
> >>>>>> V4L2_META_FMT_D4XX copies the whole metadata section.
> >>>>>>
> >>>>>> Now we only enable V4L2_META_FMT_D4XX for the Intel D4xx family of
> >>>>>> devices, but it is useful for any device where vendors include other
> >>>>>> metadata, such as the one described by Microsoft:
> >>>>>> - https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> >>>>>>
> >>>>>> This patch removes the UVC_INFO_META macro and enables
> >>>>>> V4L2_META_FMT_D4XX for every device. It also updates the documentation
> >>>>>> to reflect the change.
> >>>>>>
> >>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>>
> >>>>> Thanks, patch looks good to me:
> >>>>>
> >>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >>>>
> >>>> I don't quite agree, sorry.
> >>>>
> >>>> The reason why the current mechanism has been implemented this way is to
> >>>> ensure we have documentation for the metadata format of devices that
> >>>> expose metadata to userspace.
> >>>>
> >>>> If you want to expose the MS metadata, you can create a new metadata
> >>>> format for that, and enable it on devices that implement it.
> >>>
> >>> Looking at the long list of quirks this removes just for the D4xx
> >>> cameras I do not believe that having quirked based relaying of
> >>> which metadata fmt is used to userspace is something which scales
> >>> on the long term. Given the large amount of different UVC cameras
> >>> I really think we should move the USB VID:PID -> metadata format
> >>> mapping out of the kernel.
> >>
> >> If we can find a solution to ensure the metadata format gets documented,
> >> sure.
> > 
> > MS default metadata is already documented:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/mf-capture-metadata
> > 
> > I would not worry too much about vendors abusing the metadata for
> > custom magic if that is your concern.
> > This would not work with Windows default driver, and that is what most
> > camera modules are tested against.
> > 
> >> When it comes to the MS metadata format, if I recall correctly, Ricardo
> >> said there's an XU with a known GUID to detect the metadata format. We
> >> therefore wouldn't need quirks.
> > 
> > There is MXSU control 	
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> > But not all the vendors use it.
> 
> Right so I actually already checked:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5
> 
> yesterday before my udev hwdb suggestion I was wondering if there was a way
> to just get if MSmetadata was used from the camera itself. What I found was this:
> 
> "UVC metadata is opt-in. Every IHV/OEM that needs metadata support must be enabled through a custom INF file."
> 
> which lead me to the udev + hwdb suggestion.
> 
> It is good to know that some cameras have a a way to fet this from a known XU GUID,
> but the official way seems to be to have per camera info in .inf files. So for Linux
> that would translate to having a list of vid:pid combinations somewhere.
> 
> The question then becomes where do we put the vid:pid list and IMHO hwdb is much
> better (easier to maintain / update) then hardcoding this in the kernel.

Additional questions: where do we store documentation for the metadata
format, how do we convey what format is supported to applications, and
how do we enable metadata capture when a device is listed in the DB ?

-- 
Regards,

Laurent Pinchart


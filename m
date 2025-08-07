Return-Path: <linux-media+bounces-39008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC886B1D423
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0561687CE
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 08:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38EC24BCF5;
	Thu,  7 Aug 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HzjIGpx/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ADB1442F4;
	Thu,  7 Aug 2025 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554467; cv=none; b=L4anREavWwVQ6qDoB5T59mVm5m190rLtkXSDATTnueJjgb9As/mU5vj4/KgCTSCKuLD1GTjs6AwSnFY2PYDhZy2viYYXqk/eRCR1DK29Uy7HOtIROimULtNbVPAsB8D1JCrMPX1DjfTvxaHV+G0mv60BAUn1H49+IlyXIpYGwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554467; c=relaxed/simple;
	bh=ss7D3gvEVCdb21Yn3aX6Pv5/jr3E1C1emoZLPQrYWfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLTMU0VbDnagNaiuoZgOvM74LfABiGMFQw6frRw4/NUzI5cNqiIExbf1jEG5Qp6XD/w+F1/zXYvJxzJ3NCNWPU/ZU3mPB1VuWps3xRsBYfvSSs8s8+l+nSVICztZfScL7dRnVrftzZmPaCXGtg1u1qlWH43nbGRWsmgy6oABy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HzjIGpx/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BCF46416A;
	Thu,  7 Aug 2025 10:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754554413;
	bh=ss7D3gvEVCdb21Yn3aX6Pv5/jr3E1C1emoZLPQrYWfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzjIGpx/x6DdNzwiUruZTfS9GOzGv23n9ORsWKx/gO+PS2ThQcnRNpfpwDxYO+dTJ
	 AZne6JlRIOPxSHaSVByl8WGIIjtgNN4PxlQZbss0KgDKJdg7+pBV50FBU4W/vLKr3I
	 cUMB57++xFLm1W/JViAlYOHimFKR4s+Kd5ZdsjBo=
Date: Thu, 7 Aug 2025 11:14:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Imene Jaziri <imenjazirii18@gmail.com>, linux-media@vger.kernel.org,
	hansg@kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
Message-ID: <20250807081408.GB11583@pendragon.ideasonboard.com>
References: <20250801145326.28560-1-imenjazirii18@gmail.com>
 <20250801150430.GC4906@pendragon.ideasonboard.com>
 <452a1263-2ec3-4174-9082-078445e67637@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <452a1263-2ec3-4174-9082-078445e67637@foss.st.com>

Hi Benjamin,

(CC'ing Shuah)

On Thu, Aug 07, 2025 at 09:53:41AM +0200, Benjamin Mugnier wrote:
> On 8/1/25 17:04, Laurent Pinchart wrote:
> > On Fri, Aug 01, 2025 at 03:53:26PM +0100, Imene Jaziri wrote:
> >> Add a pr_info() in the uvc_probe function to trace when the
> >> uvcvideo driver is loaded. This is for learning purposes.
> > 
> > What part of the learning instructions you are following instructed you
> > to submit this patch to kernel mailing lists ? We are regularly spammed
> > by similar patches, which indicates the instructions are not clear
> > enough.
> > 
> 
> I got curious too. It comes from the Linux Foundation training LFD103
> [1]. Chapter 8 describes this patch pretty much, and chapter 9 describes
> how to send the patch, but with a warning not to do so :
> 
>   [...]
>   At this time, you can run:
> 
>   git format-patch -1 <commit ID> --to=maintainer1 --to=maintainer2
> --cc=maillist1 --cc=maillist2
> 
>   This will generate a patch.
> 
>   Important Note:
>   Please note that this is just an example. Don’t send this patch upstream.
> 
>   You can revert this commit now.
> 
>   Please refer to the Select the recipients for your patch section in
> the Submitting patches: the essential guide to getting your code into
> the kernel document.
> 
>   When you have your own patch ready for submittal, you can follow this
> example process to generate the patch and send it upstream using the
> following command:
> 
>   git send-email <patch_file>
>   [...]

Imene provided me with that information in private.

> Looking at it I guess it's pretty easy to miss the note.

Yes, reading the text, I really can't blame the people training the
course for missing it. It's a bit like if a mushroom foraging book said

- go pick those red mushrooms with white dots on the cap in the forest
- cut them in pieces, pan-fry them with butter
- add a couple of eggs, salt and pepper to make an omelette
- the dish is ready ! enjoy your meal !
- you won't be eating that, it's poisonous. throw it away

:-)

> Maybe
> requesting to add '--dry-run' to the git send-email command could be a
> simple fix to prevent from copy/pasting ?

I've contacted Shuah, who told me she updated the training material.
Hopefully we'll soon stop getting such patches.

> [1] https://training.linuxfoundation.org/training/a-beginners-guide-to-linux-kernel-development-lfd103/

I wonder why the training materials are not public, given that the
training is free of charge. Did I miss something, or does the LF
encourage people to develop free software, but won't eat their own
dogfood and publish their materials under open licenses ?

> >> Signed-off-by: Imene Jaziri <imenjazirii18@gmail.com>
> >> ---
> >>  drivers/media/usb/uvc/uvc_driver.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> >> index da24a655ab68..4e5d1d636640 100644
> >> --- a/drivers/media/usb/uvc/uvc_driver.c
> >> +++ b/drivers/media/usb/uvc/uvc_driver.c
> >> @@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,
> >>  		(const struct uvc_device_info *)id->driver_info;
> >>  	int function;
> >>  	int ret;
> >> -
> >>  	/* Allocate memory for the device and initialize it. */
> >>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >>  	if (dev == NULL)
> >> @@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,
> >>  	dev->info = info ? info : &uvc_quirk_none;
> >>  	dev->quirks = uvc_quirks_param == -1
> >>  		    ? dev->info->quirks : uvc_quirks_param;
> >> -
> >> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
> >>  	if (id->idVendor && id->idProduct)
> >>  		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
> >>  			udev->devpath, id->idVendor, id->idProduct);

-- 
Regards,

Laurent Pinchart


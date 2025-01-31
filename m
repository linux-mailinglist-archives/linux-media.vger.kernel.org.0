Return-Path: <linux-media+bounces-25493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F2A24134
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673C4188321B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9962F1E9B02;
	Fri, 31 Jan 2025 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZDaTxFRA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471D1335C7
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342654; cv=none; b=hd+WM2pXSFq0h4p8o6/cFdrRiLwHmbuArrp3DmnXTtoI6+w0cUj5ZDplIAWUOJyvaHtuOtBJJxVsaxyevRgPg9AfIRch/zSjbJsD06VaqdK0JztN9oc2wYWzy9D4ujVDsrwcHAdJJ78GbNcA9xswlrPZS9h0sKHX/I3QqS80MFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342654; c=relaxed/simple;
	bh=4+cej/G/FhsGZl1oqrlWcdGJV5Ye0PybAXjTew2Y+uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AseH2BAKT+rWVdm3iXv6Ztdq7ew2ckwqhuoCBY159gp55LNUM0/6NdjgYxQYj6yLMzLlCH9fGVZEmLIJPrYTuDSo/V2fjv/5ghZBIueSgNAOfs3Jtw/D60FkkjwOsfWQT2jImIerRRVOZK9h+6Vemh7U4NtzEEAhsTeIzZScu5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZDaTxFRA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08418465;
	Fri, 31 Jan 2025 17:56:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738342581;
	bh=4+cej/G/FhsGZl1oqrlWcdGJV5Ye0PybAXjTew2Y+uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDaTxFRA3Ql4yyX7PVGWBBxSQirRWbv79m0YJUs3Nl6ml1IW+hXVDfLdPWgpOdWTy
	 IW1pGbVpI3xMdoz1ECrtFRbDnQfqqtJvBlnmeSlADj6xvvD1TO0iGZZcmC/+8eZ3pv
	 PJxTuIkQIizfHFIh4tzm1wAQkqn+oR1z872fH9PM=
Date: Fri, 31 Jan 2025 18:57:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>,
	kernel-dev@igalia.com,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
Message-ID: <20250131165727.GF26841@pendragon.ideasonboard.com>
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com>
 <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
 <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
 <6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
 <CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
 <20250131150618.6987c1c7@foz.lan>
 <50a8cdc0-39eb-4dd1-8f96-b333ec323b92@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50a8cdc0-39eb-4dd1-8f96-b333ec323b92@redhat.com>

On Fri, Jan 31, 2025 at 05:38:54PM +0100, Hans de Goede wrote:
> On 31-Jan-25 15:06, Mauro Carvalho Chehab wrote:
> > Em Fri, 31 Jan 2025 12:17:25 +0100 Ricardo Ribalda escreveu:
> >> On Fri, 31 Jan 2025 at 12:12, Hans de Goede wrote:
> >>> On 31-Jan-25 11:04 AM, Ricardo Ribalda wrote:  
> >>>> Hi Hans  
> >>>
> >>> Which Hans, me or Hans Verkuil?  Since this needs to go out
> >>> through a fixed pull-request I think it would be best if
> >>> Hans Verkuil picks up the revert directly in the fixes
> >>> branch ?  
> >>
> >> Whoever started in v4l2 later needs to change their name :P.
> >>
> >> I was thinking about you this time :)
> >>
> >>>> We are seeing a spike of reports with the signature:
> >>>>
> >>>> "Found multiple Units with ID XX"
> >>>>
> >>>> Could you take a look at this patch? I agree with Thadeu that the best
> >>>> strategy is to land the revert asap and when the storm disappears work
> >>>> on a different solution.  
> >>>
> >>> Ack, Fedora is getting some bug reports about this too. Since both
> >>> you (Ricardo) and Laurant seemed to be on top of this I didn't take
> >>> a closer look yet. But this definitely is hitting users and we
> >>> need to fix this.
> >>>
> >>> Since we still don't have a fix yet we really should revert the commit
> >>> causing this problem ASAP.  
> >>
> >> Hans (Verkuil) if Hans (de Goede) adds a Reviewed-by or a Acked-by,
> >> could you take this patch to the media-committers/fixes branch ?
> > 
> > I can pick it as well. From what I got, Hans de Goede is also ok
> > with such change.
> 
> Yes I have just replied to the revert patch with my reviewed-by. Mauro
> if you can pick this up and send it to Linus soon(ish) that would be
> great.
> 
> Can you also please add a Cc: stable@vger.kernel.org tag while
> merging it?  This will need to be backported to kernels which have
> the troublesome commit.

I was planning to send a fixes pull request for this once -rc1 comes out
(so basically on Monday). As we're in the middle of the merge window,
the patch couldn't be merged right away.

I'm also fine if Mauro picks it up, that's easier for me. If it hasn't
been merged in the fixes branch on Monday, I'll send the pull request.

-- 
Regards,

Laurent Pinchart


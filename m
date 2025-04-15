Return-Path: <linux-media+bounces-30213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C1A8949E
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F4417C057
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3261B2798EB;
	Tue, 15 Apr 2025 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rHNpmnDP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3410F2
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701273; cv=none; b=a+QCAHR3sCKIubUv+h3luGqeXE5P/XBc5oahv9dOcQDh+AOaKaJyhemft7Vh0b0m+R7Kv5noWOV8cC05n6Kr0KsvgsudMTYKCaW9AO9A78vNOkNxwXLAs3UhE+yHdmQToiaHt27zXmdLQu0oW6v0kS6BVPQNYeokKpLKuNvpvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701273; c=relaxed/simple;
	bh=RlNC8B6cGd2hwb+OgGrp6CD1wrQri1/mDQ2D75ODVsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG0c+S94LRHR8YxFXTHcwBXHEZpWglf4Q7Am1cIHc0yNXlA10dST1UD+GrCFJShq9nqL/a7+PoFujIBKO+YzUsXUseGJJ3clfdCyqJLgFHS5ToeZhZs6/L5C6kvwPcB+LxJ+mfJMDTse9gzokqu18t1Cu2NE6wUmUoYbb8Rf69Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rHNpmnDP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 397A9725;
	Tue, 15 Apr 2025 09:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701147;
	bh=RlNC8B6cGd2hwb+OgGrp6CD1wrQri1/mDQ2D75ODVsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHNpmnDPazFQQ5FUE7k0H3d8reELBa6F7JzDt+e9Dq92iYzoMdq1dJ9sSpP14vVF1
	 G8d4JdZyTlZf/PXZPMu/kQETNRGhM2dYfcFGyqI+zygwebnTy5YzUbXul+HcPU4gcJ
	 4bREZ/eR4uU9NKLS7Ke+725Vrobi+6IL1/XUxZ0k=
Date: Tue, 15 Apr 2025 10:14:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415071427.GE15367@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <2ff6c67b-7a1a-463a-8f57-8886fc66fbae@ti>
 <96d33047-fe50-4b12-94cd-42573a239996@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <96d33047-fe50-4b12-94cd-42573a239996@ti.com>

Hello Devarsh,

On Tue, Apr 15, 2025 at 12:34:14PM +0530, Devarsh Thakkar wrote:
> ++linux-media, libcamera-devel.
> 
> Hi Laurent,
> 
> On 07/04/25 20:50, Devarsh Thakkar wrote:
> > Hi Laurent.
> > 
> > Thanks a lot for organizing this.
> > 
> > On 25/03/25 15:57, Laurent Pinchart wrote:
> >> Hello everybody,
> >>
> >> Another year, another libcamera workshop. After the previous editions in
> >> Paris, Brussels and Vienna, we will organize the next workshop in Nice
> >> on Friday the 16th of May. The event will be hosted by Embedded Recipes
> >> ([1]) as part of their workshops day ([2]).
> >>
> >> This year, our workshop will be colocated with the Pipewire workshop on
> >> the same day and at the same venue (but a different room), to facilitate
> >> discussions about topics that span libcamera and Pipewire. The Linux
> >> Media Summit will also be organized in a nearby location on Tuesday the
> >> 13th ([3]).
> >>
> >> If you would like to attend, please register your interest by replying
> >> to this e-mail, and indicate if you have any discussion topics you would
> >> like to include in the schedule. We will draft and circulate an agenda
> >> in the next few weeks after receiving topic proposals. If registrations
> >> exceed our capacity, priority will be given based on topic submissions.
> > 
> > I am very much interested to attend libcamera workshop in-person this time.
> > 
> > Could you please let me know if it's possible to register me and if you 
> > require any additional details ?
> 
> Thank you for organizing this. As shared above, I'd be interested to 
> attend this in-person. Could you please let me know if it would be 
> possible to register me so that I can plan accordingly ?

I have added you to the attendees list. There is not additional
requirement, except for showing up on the day of the workshop :-) We
will share practical details closer to the event.

-- 
Regards,

Laurent Pinchart


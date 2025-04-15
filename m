Return-Path: <linux-media+bounces-30215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2111A894B4
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F04F16D88E
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694332797A0;
	Tue, 15 Apr 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VvKEgh1E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4899921171C
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701442; cv=none; b=eIftUs/JcNSrIMT+o28USzOuLJ/R/roT2/fm8Pfj9m5eOJKWsNHMUD8JFihIS5zz4gSS0nXuIec6W3eKDS1whhu6/5vnZ5DOtVIHEV983Alahi62b8uomdbUVSKkh9doKbB1zADB+DFVZIGBg1cWxyipxZJaqU1+KlvfNcD70qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701442; c=relaxed/simple;
	bh=NW+WB3mVZDcF4TVyGmdgXbTII3bXJ6yjZv2I5rTaK4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGuNRCCYRUs/P0ngXcU9BqXwLFVLUlzUlwRC+LAXvyKuokF3He5dBAoqtuvEd6fotmoBk1rVxih+7Ynw/z6qYm6OhudIpa0J1zy7ipP6wdlFAReZGPaGUrMCbx6OXGX3XfxddjXgabk7l0BcVSPUa5U33xeheaDeu5SnYy0ldQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VvKEgh1E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82453725;
	Tue, 15 Apr 2025 09:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701317;
	bh=NW+WB3mVZDcF4TVyGmdgXbTII3bXJ6yjZv2I5rTaK4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvKEgh1EO+heNfJUl476hxX+vzRILJ446QRh71FLEV1VxHD7uycxzo7uRNlHiC1OD
	 GmTl/wqAiKwZTguXT3DZnfztFSX3fWxF6oY1mXcEMuSNkLaxFX6PxtTfVir87ls4JO
	 KaAH0FEqqkLAaOARDrhEf+2UlQmvEnlm1VKztfNc=
Date: Tue, 15 Apr 2025 10:17:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415071718.GG15367@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <329e52ca-774d-41b3-8ca1-71009176888c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <329e52ca-774d-41b3-8ca1-71009176888c@redhat.com>

Hi Hans,

On Tue, Mar 25, 2025 at 01:03:39PM +0100, Hans de Goede wrote:
> On 25-Mar-25 11:27 AM, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > Another year, another libcamera workshop. After the previous editions in
> > Paris, Brussels and Vienna, we will organize the next workshop in Nice
> > on Friday the 16th of May. The event will be hosted by Embedded Recipes
> > ([1]) as part of their workshops day ([2]).
> > 
> > This year, our workshop will be colocated with the Pipewire workshop on
> > the same day and at the same venue (but a different room), to facilitate
> > discussions about topics that span libcamera and Pipewire. The Linux
> > Media Summit will also be organized in a nearby location on Tuesday the
> > 13th ([3]).
> > 
> > If you would like to attend, please register your interest by replying
> > to this e-mail, and indicate if you have any discussion topics you would
> > like to include in the schedule. We will draft and circulate an agenda
> > in the next few weeks after receiving topic proposals. If registrations
> > exceed our capacity, priority will be given based on topic submissions.
> 
> I will be in Nice and I would like to attend.

I realized I haven't replied to acknowledge your registration, so here's
the official confirmation. We will be happy to see you in Nice. Thank
you for submitting discussion topics, we will publish the agenda draft
close to the event.

> 2 topics which I would like to see discussed:
> 
> 1. software ISP status + future plans
> 
> 2. using a single IPA with multiple pipelines.
> Specifically atm my WIP atomisp pipeline-handler is re-using
> the software-ISP sw stats + the software ISP "simple" IPA and
> another candidate is using swstats + the simple IPA in the
> uvc pipeline-handler to add autofocus to e.g. the logitech
> quickcam 9000, which has a controllable focus but requires
> the driver to do autofocus in software.
> 
> Note this is not really a big topic, so maybe we can find
> some time before then to discuss this on the list.

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-30703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3FFA967E2
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48B7F189EAA6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D43127C87D;
	Tue, 22 Apr 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iI4FD+/Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BE277817
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321987; cv=none; b=H9QUC4m7IyWhJzcxnMj6rv4ukYoPbhjpegjUvezfcyMi1FrDLEd4F6i5/VCVVTZKwsBxsX33wMwl0b9loIY190B6VsXZ0mh4WFZB9ZSWJ+vePGCkWUKZhp97iXweg8Tvt+DVKH51i1uVgTT+VnP0CZAib/D2KB5EkPuh5H0cKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321987; c=relaxed/simple;
	bh=jYhEzc6D2EPTDaopeWOLpRwyh3bJ4/nrYXFMpS2RYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TooVKQqMb70cS7r/Op24tYiIiPbOsyScBN7++Efna/NB8qSz1a5CHLZaB7M7BmTNflmZYdx7p3QAAlUGCLMVX53f3iLRMr6IC+4dhHolbp9nnMi1gQl2oi5mYKIhmNljdqFMQkdwYj/ppCXMkl1tS8A6G6J4exH0REvgmldgtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iI4FD+/Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D66E666;
	Tue, 22 Apr 2025 13:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745321855;
	bh=jYhEzc6D2EPTDaopeWOLpRwyh3bJ4/nrYXFMpS2RYt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iI4FD+/QtE1kTm2OjKavuIerIgxkEpTPqz2J0RSUsHTFPJrnG0vMc0EJreYmQeJi+
	 kCfm+DIra4UlSfIHnedmcDRkFzMzBzc139z4TDBeijrDDqjzVl17YUe7IcgOQvvnBz
	 WWp+2ugfBFqR5PKY7EuzCIeRMC4SGoxwrr+mjIRg=
Date: Tue, 22 Apr 2025 14:39:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250422113940.GB329@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <751ee8b7-8758-4a98-8b3d-eb91f1f90b99@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <751ee8b7-8758-4a98-8b3d-eb91f1f90b99@foss.st.com>

Hi Benjamin,

On Tue, Apr 22, 2025 at 12:57:37PM +0200, Benjamin Mugnier wrote:
> On 3/25/25 11:27, Laurent Pinchart wrote:
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
> If it's not too late I'd like to attend to the libcamera workshop too :)
> Unfortunately I didn't dive in libcamera yet to talk about a specific
> topic. We plan to support ST sensors in libcamera, and this is a great
> opportunity for me to see libcamera's evolution.
> 
> Thanks a lot.

It's not too late, you're now on the attendees list. I'll be happy to
see you there.

-- 
Regards,

Laurent Pinchart


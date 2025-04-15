Return-Path: <linux-media+bounces-30214-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C2A894A2
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D541686E5
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFE2798FE;
	Tue, 15 Apr 2025 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZJXlA/d4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF83275875
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701313; cv=none; b=gWSqZe9zIKDel0M+WF/D63dwoC/bi2SPmf4jh2wlPC1uUqHrPMuB/WVXz77ShZ+Mi17bUIeu005dzBFlJN0Svp96H1WFLmZ4Vn/AKQFSviM/2+0CoTv4gRYDyi0MWgYuUzsr47Oy/2u6+/mwfmsNfMgu3ugXTtDC9L98NMW3f38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701313; c=relaxed/simple;
	bh=dhqOTcioj5wGjz4lM8V0ASGyKRSHJGbtFguQjGUArVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVzsiSNyJwNx0wsZxLXll57j2bbT6NeLFjI6iR/L2GtzJ25cHBpmhz8bpZq4Wp5XPh1pFNmKb3lUgihMZ9O3D4ZDLWF9vpitvQdGZqxLu6UdJpKCS12k+dLCDCCZD9btFJhAfl61RO5BPQnfbbhT0WdXRzlnD7OIQHy1WZkSN/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZJXlA/d4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 387D6725;
	Tue, 15 Apr 2025 09:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701188;
	bh=dhqOTcioj5wGjz4lM8V0ASGyKRSHJGbtFguQjGUArVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJXlA/d4ceKAUyw5PczWsLbUEXAF+m4Vticzy3svw5lym/GLuVLPW4GPffMPl2FIe
	 g9SzUZER0O7eHLvq4QUIdtUaGhQGR3nkSemV2UmmJ8fYI3xQtvmKpie7I/vdBiwtqd
	 iq/XPJOZ9o79+R+hD3ssfoGt/T3AaBXIhqwWLlak=
Date: Tue, 15 Apr 2025 10:15:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415071509.GF15367@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <20250408053114.GA3734987@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408053114.GA3734987@ragnatech.se>

Hi Niklas,

On Tue, Apr 08, 2025 at 07:31:14AM +0200, Niklas Söderlund wrote:
> On 2025-03-25 12:27:50 +0200, Laurent Pinchart wrote:
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
> If there are still seats available I would like to attend.

I have added you to the attendees list. I'm looking forward to seeing
you in Nice.

> > The event will be free of charge for attendees.
> > 
> > [1] https://embedded-recipes.org/2025/
> > [2] https://embedded-recipes.org/2025/workshops/
> > [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart


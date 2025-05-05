Return-Path: <linux-media+bounces-31728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 460A5AA99DE
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 18:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE48017DBF1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 16:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC87F26A0DD;
	Mon,  5 May 2025 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vKAdgtDq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61B19D8A7
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464242; cv=none; b=RE1p+tj4phhC7qBPTd86a6ZkPBeiQa9ilX9S1ToShYap5Bvhd2yhwgBln2Jz3cWz9uDhiwx3q5UxJZq5C7BxLXThXAcklislMGXTr3hPlmOsaWbAv1Q31EJrYINS18WDhLObKRGkcnYcezHYVB7BsdsH2uc9rQtQat8OFdiUWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464242; c=relaxed/simple;
	bh=SEQUvJmDpbyIJcYzLPTgKE0zpnnK/RUUA6FgdO2hdwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV+N5yaaUC0uHIEoWpeHWfH1ncDIRTIwLBC8OZ30eEFRLqpXvXauBHGiwsxOmA+mvLvQI+j3XFpIpgqauv1RvHU92CxzfiEA27awD6c0XgaAqC/ovHVT23izBIi25iegpb/hHsfwyCPk2xTh9ohOWTKPIupZGnLSxyrwY5vqmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vKAdgtDq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.146.221.246])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C319A6DE;
	Mon,  5 May 2025 18:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746464225;
	bh=SEQUvJmDpbyIJcYzLPTgKE0zpnnK/RUUA6FgdO2hdwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKAdgtDqKAapMIyYeA4deLa5PMyi77Pv33e84pWXlaIYsHTMdqBr3xD3iB8KRh4EZ
	 bh9G2Z7opfQ/4c33RdTgsC1dBhQLIGoy5IEgpZ9TZ8T/RpGwH0xWkrBxALI58X2J4h
	 BiPF/0D2zH3ImyBKzgG6r+n+grye4IPypczIVak4=
Date: Mon, 5 May 2025 18:57:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250505165704.GB30153@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <87selj5dl6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87selj5dl6.fsf@kernel.org>

Hi Mattijs,

On Mon, May 05, 2025 at 04:36:37PM +0200, Mattijs Korpershoek wrote:
> On mar., mars 25, 2025 at 12:27, Laurent Pinchart wrote:
> 
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
> I don't know if there is any room left, but if there is a spot left, I'd
> like to attend the libcamera workshop.
> 
> I'm sorry to be this late, my travel plans have been a bit difficult.

You're now on the attendees list.

> > The event will be free of charge for attendees.
> >
> > [1] https://embedded-recipes.org/2025/
> > [2] https://embedded-recipes.org/2025/workshops/
> > [3] https://lore.kernel.org/r/044f2fa6-a245-4ae5-b9de-7a2e8831ccd6@xs4all.nl

-- 
Regards,

Laurent Pinchart


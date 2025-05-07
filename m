Return-Path: <linux-media+bounces-31943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A750AADB52
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A731687F4
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC03230BE1;
	Wed,  7 May 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BKqZZRik"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEF9235341
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609559; cv=none; b=sl38iHIqR0ETCeNFb87sLfKK74uiySnD+0D4KuBstbJh2C1I/f0Q0Z0R5xpozk0Ywf0upkxoIby6hEIzWzKICx5DoTMo6tteKTMiUDERByPRcEgRSkzfzQz6h0M5du1laLUG2Q3/+oYGTbB6WtyBgdlQeRLcXJErpJKFqxmfL4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609559; c=relaxed/simple;
	bh=5jCG/sCx4Lv0+KdjN0x+rTNEAy19aXZjcJQ+aDmM1qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B14ikLCffa9lZDufPtDfFjLnbDLN4JbuvGSv1ZkDi67bceKKxo7wYDMB5V17Dw5wssAUmr6j/knbzNYa800FtWfNJe7kEQkTT1BEuRFHBFzDL53z67R1V+WTamqcFc9VTLMEGJg4WXKoqjcuTdfGg/Ayggn8x+kklSSDj/FunrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BKqZZRik; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A86F7455;
	Wed,  7 May 2025 11:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746609544;
	bh=5jCG/sCx4Lv0+KdjN0x+rTNEAy19aXZjcJQ+aDmM1qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKqZZRik+BTLAIRbZrXpT4Lm2nb+sjGm5aCIxM/Wq0fjrXuzRP0r6LcEFsQ4aOTc8
	 kqUTRNSfMQi4TYhQkmRsoquXbv2wZ+eUz9FD16G45ZPkLvyHaaq3VkxTk86shwASp1
	 HNJB8JWQcXj/Qp/Q1cZsldoud0LR/iPxwVwHGIGM=
Date: Wed, 7 May 2025 11:19:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250507091907.GC11152@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <20250507102844.0fa7f798@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507102844.0fa7f798@foz.lan>

Hi Mauro,

On Wed, May 07, 2025 at 10:28:55AM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 25 Mar 2025 12:27:50 +0200 Laurent Pinchart escreveu:
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
> Hi Laurent,
> 
> I'm also interested on attending it.

You're now on the attendees list. We will share logistics details at the
beginning of next week.

-- 
Regards,

Laurent Pinchart


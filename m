Return-Path: <linux-media+bounces-10875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D308BCEF3
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D70728168F
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7AB768E1;
	Mon,  6 May 2024 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="qlAV/ZPO"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA874BF8
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715002338; cv=none; b=b/GDyal4XKfAGo2KDzRkQq+byHoEtugYfHgMZNLLC7Bsn3Go4B147DKWes9EQm/3Ki+ZqCAdIyEGWG3f9SssBZY57WF3Djnl8mMDbFX3IbMmomGgwhZpbwKxIOe0gAFCHeFl/QZc6b1k3Mktcf85C/TM5bJr/DcoHUHxDEjNY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715002338; c=relaxed/simple;
	bh=YUVeOkEffwSanAcKqJ1yyzLfBixOP8DxrqwKgUpZ+FM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsRBN6OdXCdIDn9hmzRmeYtg7d7rhBJjJaH8Nh5UdsencaFlC30p6agZmldRsOe9rQacUJQTtmsF55AmmLUEviUc//M8GM9inWwLZFpcYkQAH+85Qw+R7/6hovo5w/eNbLsAEYyzw2eo3OKHGkWxRIZrDapGj+Qy+zZKHQwucR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=qlAV/ZPO; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1715002327; bh=YUVeOkEffwSanAcKqJ1yyzLfBixOP8DxrqwKgUpZ+FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlAV/ZPOOYQrTFfknqFTa0gc5mBQg9IhaQck9srQ5123EfeT/M4s1WKUKUjh6sY1n
	 6E6r2Jh/kx2+J8CTL9/+oKAlOrlbwTKuOuO74v6aFIkbWKlGqJIEVjtzgPnpMAb3kt
	 q35XxVtuKvhvsQvZdgFb5Mryun5dFqNiBIKwdoUoQBI0qwlLneLCQ5kFAt1mBehRwN
	 5ynv7vAlCJmqtYr4xw7aI1aNB3YtZUrwBZ5M62RBLji1UwvyPxudoN6YKxyukaKpRf
	 xe2ZaokFpM3t93cKV418y9v/JP7BNUOs83KX5BAbeFElfsskDhjGJWIew8xzsuF1e2
	 zRiJVAuIcgrhA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 81A901000C2; Mon,  6 May 2024 14:32:07 +0100 (BST)
Date: Mon, 6 May 2024 14:32:07 +0100
From: Sean Young <sean@mess.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <Zjjb1-DFhSYx9HU7@gofer.mess.org>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>

On Mon, May 06, 2024 at 01:33:32PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> We will organize another Media Summit on Monday September 16th to coincide with
> the Open Source Summit Europe in Vienna:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue.
> 
> Location:
> 
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> 
> The meeting room can hold 18 people and has video conferencing support (MS Teams).
> 
> That said, I want to keep remote participation to a minimum. This yearly summit is meant
> for active media developers to meet up face-to-face and to discuss media subsystem issues.
> But if you are an active media developer, but are not able to attend in person, then this
> is an option.
> 
> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> It would be very much appreciated if you can also add a guesstimate of the time
> you need for your topic.

So I've been working away on new tooling for infrared and it's nearing
completion. I'd like to talk about:

 - What it is and what it can do (love to hear any feedback of course)
 - Where is should be hosted? (I hope gitlab fdo, who do I ask)
 - What needs to be in place for a release?
 - This tool replaces ir-ctl and ir-keytable. How we phase them out?

I hope we can do this in 30 minutes and I should be able to attend in person.

Alternatively we can also discuss this over email so I don't want to bump
more important things.


Sean


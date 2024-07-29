Return-Path: <linux-media+bounces-15447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79A793F3F4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 179971C21E0F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54935145FE1;
	Mon, 29 Jul 2024 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t7Ow13s1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F414430E
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252190; cv=none; b=oKM56KKp9MGOyu9xVXIyCfD3306yYmLjLID+rXgWfArk3p2z/0f8M+romZcid3h+2Gpbp9+j5ZkaXCTcF6xNOT5BeYlXCkJAHP5xnedTSTHb3zA6lkGmAI9etWw46juu4kVwEgT106NFoOiBx5xJh2XOI2it1Jd4GZ4chfYJ2YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252190; c=relaxed/simple;
	bh=BZaIxBs4mLeb4GJCMaETNOaJOfIP9S+pFc1+nM55U1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcdjYpVi6UC0FGrjUcDQfHVYhNj1UgYHJDXAsQ9sfxCQAUOqWbQem/6gy4Y4jOKoAIWv/pZl/2lJV5Om2sfLbW6F+tkT+qVtpCO1aBEQASpworRRTbhGv5klErYqLO5Yytcjj4BsAk6tLYXYPsqama/FpJb7GD/n2DuD1foyrgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t7Ow13s1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4541229;
	Mon, 29 Jul 2024 13:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722252136;
	bh=BZaIxBs4mLeb4GJCMaETNOaJOfIP9S+pFc1+nM55U1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7Ow13s19sp80ew7qy3NMH8NSbM7UU8E3aGyAxyMIWswa5OiJp8gPI6DB0DXY0bmH
	 fI78Ibm4XMQcLwIBPlGw9lAeMWjCmPIpFmAq2jePPlABJ/xFc42BelpfkD/G2yxEXO
	 o9BYD9qHUpr1d7jsi5gCxzWRNmBorhtQdw1U1Hmg=
Date: Mon, 29 Jul 2024 14:22:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
Message-ID: <20240729112239.GJ2320@pendragon.ideasonboard.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729090042.GA2725@pendragon.ideasonboard.com>

On Mon, Jul 29, 2024 at 12:00:42PM +0300, Laurent Pinchart wrote:
> Hello everybody,
> 
> Following the success of our workshop in Brussels in February, we would
> like to host another event in September.
> 
> We have evaluated different options, and opted for week 38 in Vienna.
> The city will host during that week the Linux Media Summit (Monday the
> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
> the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
> [3]), and we expect that co-locating with those events will ease travel
> for attendees of the libcamera workshop.
> 
> The week is already busy with camera-related events on Monday with the
> Linux Media Summit, and on Thursday afternoon with the Complex Camera
> micro-conference at LPC ([4]). We have therefore selected Tuesday the
> 17th for libcamera.
> 
> To help us plan the venue, could you please register your interest by
> replying to this e-mail, either publicly, or in private to Kieran and me
> ? The event will be free of charge for attendees.
> 
> Please also let us know if you have any preferred discussion topics you
> would like to include. We will draft and circulate an agenda in the next
> few weeks.
> 
> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
> [2] https://events.linuxfoundation.org/open-source-summit-europe/
> [3] https://lpc.events/
> [4] https://lpc.events/event/18/sessions/193/

The last link is wrong, it should be

[4] https://lpc.events/event/18/sessions/204/

-- 
Regards,

Laurent Pinchart


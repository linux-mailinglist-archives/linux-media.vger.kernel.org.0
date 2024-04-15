Return-Path: <linux-media+bounces-9312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA48A49A0
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 10:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EB31C2090B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C082C85D;
	Mon, 15 Apr 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UHGg/hpi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEB2C6B6
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713168023; cv=none; b=JO8f0IQOZOWEUrgS1C0mfvH41UyhSRhM5kSDzWrr+6OZmOeba9I5HXYEvShOtz09HIZXc6JGyk8tsj2P8P09TUr0xOt9u779+CMwjRiMtyAeB5343tp6mwtJ/j2lPzJkngDI8B2JSgGTYDM/8WroEznQ23PRquQdXoR6EOG55+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713168023; c=relaxed/simple;
	bh=+z0Yx3wORK6lNvZPzpjJOodd1ysjeNpD0stsgdnAHBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYe4cgGXhFAxAajsIOsXzcLhJy7OXvGkYZqi8spUncKIAKj28jYcVXpFGjSAWO0P0XK+9+D6VSmtJylGBvPVvdAFweLW2z8OvKhbErVyyXENc2qIQjUVji3UX3oBTk3x4QvsI+06K7dPHMn56BGpC1vk9lyshg15ScqddVzAh7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UHGg/hpi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FF6F5B2;
	Mon, 15 Apr 2024 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713167974;
	bh=+z0Yx3wORK6lNvZPzpjJOodd1ysjeNpD0stsgdnAHBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHGg/hpiWVhOXSya2C33JNiLzMslNXrz6t8bvOgxDfq3j9rUZY6/xW2aP8++wSij2
	 UE+Ey0uiN1WMGiZQz2v64VeMHyEGE8cF9A4v0/0QWJCei+j003LhJ2MmBL2WvRerO3
	 YntZ6TzYo8Qrm8KJnleq2acD3GN+x65IFsJZf7CY=
Date: Mon, 15 Apr 2024 11:00:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ritesh sonawane <riteshsonawane1372@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: Fwd: Help with uvcvideo
Message-ID: <20240415080012.GC25078@pendragon.ideasonboard.com>
References: <CALqtLOVAdrdv6VhVBwYvMePjoyVU4h-G-mDkMMEJ2_7CsDtRMQ@mail.gmail.com>
 <CALqtLOXXQhFfXqTvsT5xvE8_tiPSW61Br7jh_318qo9yHsZT_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALqtLOXXQhFfXqTvsT5xvE8_tiPSW61Br7jh_318qo9yHsZT_A@mail.gmail.com>

Hi Ritesh,

On Mon, Apr 15, 2024 at 09:52:36AM +0530, ritesh sonawane wrote:
> 
> Hey I need help with my webcam, unable to use it on linux but working
> fine on windows, sharing the dmesg output and device info P.F.A for
> it. I use fedora 39 with i3.

Could you send me the output of 'lsusb -v -d 2bdf:0280' (running as root
if possible) ?

-- 
Regards,

Laurent Pinchart


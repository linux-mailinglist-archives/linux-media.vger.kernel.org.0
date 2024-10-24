Return-Path: <linux-media+bounces-20275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CD89AF503
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 00:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A803A282065
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 22:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242E0217306;
	Thu, 24 Oct 2024 22:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Sb9Vcgox"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2B22B667;
	Thu, 24 Oct 2024 22:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807286; cv=none; b=P9oguglbQ3eG1o9uZBAhjpz1ztSu/84NLFvliaYRirt9w3wPw2Cm9ASqjkunbE2iyXV+YtlwFeM7voYWXmq+dGciypVt8Ro0Nf8Efh5qaKFOW/80wmQeLlC3veWAgil5fyMA3SKqCMt3oQP5CnSaeE/RcytvRw0D0S2pAvkqI5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807286; c=relaxed/simple;
	bh=TpHokdDbswJcDEGd+z0nywK4mmghuNOgsf96KkefTw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PYRP+zlLu5jDuINbL3XofohIlZvBHnsTzDIccQi6vQoWiDgm3nnLkS38gFN+VHe+GSaC2do0sYAEEKUl6uh3lAg7XJFL5Fkb+qFbKwbf6w9dUDWrKKHxDCbZihLq7R9S8vIfMkAI4qpK297xKIoU9YuYhQOEyHad+BAO9SpzgUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Sb9Vcgox; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C20EF42C06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729807283; bh=5kvdP0fgHRwttD0xtIaXBwGPeuzuLlMMH2uldl8sirA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sb9VcgoxllcG9dhiULHw/ZrPvpOX7mlUoaFMtV6oCyc1aE/bBvhX0yeeuNc2AO9FA
	 vSm5aA5HpcOLb6RXR9Lp5pQitBxMHlzKExsJuteaylIILD88l0jN4THNfws6Wpy0oD
	 grkotpNOzFOSnj7aMWN+pcEGzNYVg/xTtedi8EHkFcnqGsh0rPlpEtJYr5dn1M0rOY
	 YQCgMn97l9YNcZnOboyJ253Rnb73aEmQ8LV7miyv4PjNWE/4LA+c2SA6yM+dejpv/W
	 JhKepbOOMYwFb0jA7CzrO0y+EBVwSFpf38ljPp3rytZptY1AeVW3UWGH1ccPAQ2NfE
	 Z45hFqTDpr1jg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C20EF42C06;
	Thu, 24 Oct 2024 22:01:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
 kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Subject: Re: [PATCH RFC v2 0/3] Documentation: Debugging guide
In-Reply-To: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
Date: Thu, 24 Oct 2024 16:01:22 -0600
Message-ID: <87frol2ma5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> The RFC contains:
> - a general debugging guide split into debugging for driver developers and
>   debugging from userspace
> - a new summary page for all media related documentation. This is inspired by
>   other subsystems, which first of all allows a user to find the subsystem
>   under the subsystems page and secondly eases general navigation through the
>   documentation that is sprinkled onto multiple places.
> - a guide on how to debug code in the media subsystem, which points to the
>   parts of the general documentation and adds own routines.

I've just begun to take a look at this, apologies for taking so long.

Overall:

- I have been trying to reduce the number of top-level directories under
  Documentation/, and this adds two more.  Can we avoid that?  Let's
  start in that direction by putting your debugging guide inside
  Documentation/process, please.

- If we *must* create a separate "media" directory, please make it
  devices/media.  My plan is to move most of the device-specific
  documentation under Documentation/devices, making it match the source
  layout; I just haven't summoned up the energy to start the slog of
  actually doing it.

  But it would be nice to avoid that altogether here.  If we create
  Documentation/process/debugging/, it should be able to hold both your
  general and media-specific guides, and perhaps other
  subsystem-specific guides could eventually land there as well.

- Please adhere to the 80-column limit for written text.  It really does
  make a difference for people reading it.

Thanks,

jon


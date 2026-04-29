Return-Path: <linux-media+bounces-60032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JHqD0aS8mlhsgEAu9opvQ
	(envelope-from <linux-media+bounces-60032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:20:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA53449B539
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1208430387BB
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 23:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE633349B0D;
	Wed, 29 Apr 2026 23:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IAFYv/i2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F939C004
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777504766; cv=none; b=M2jDvYLsgHQacDtSFRlRrg9/zstFAwnotoXJkJjailCWJXv+nwwIodZzNlgbt2Vo/gHDx3t9l99uscA2jYpn0Vb/+jh217vH8USU1odj+2eqo4Ye1MGHnRiNpbXQVKDmOFmuTcmnzLsYEWOCpEt+Bwm/j6vI3k7yZT318Z9C23g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777504766; c=relaxed/simple;
	bh=UlZlXUdtTvCtsSFxLuTbWYh4/QJ5j0KE5PJbl7AaM1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJB2sh1N+kHaX3XUhDUomw6URVyjfo3xm6sTakmuulWWvp7XtYP+wR3XuuUIyVtZqnJMgcgsqBS3AzyZZ9DN89/Xt291tXPyQ8IipdjlvezFw79i/+tyXo9tDbTuAc1DrjpY11k1FChgUTk7BunqrnZDPCQUI5zgfoW+zeXVs8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IAFYv/i2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3DC946F;
	Thu, 30 Apr 2026 01:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777504658;
	bh=UlZlXUdtTvCtsSFxLuTbWYh4/QJ5j0KE5PJbl7AaM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAFYv/i2kS4LToCabfnjjb9JV34366jjXYe4Q4yMOMDTaCQnD3qdz+fI9XL19Sb/T
	 LYznFrZXYwNV2x7ABrfKpMcmvq+rYumX9IHU9+yXSlmltJ/CtIHS7fWbU7o0sfX2+C
	 icaLNUBYnxGpiWnkAF2WUrCjpZ/f5XwUEX0Cdpsg=
Date: Thu, 30 Apr 2026 02:19:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
Message-ID: <20260429231920.GA214235@killaraus.ideasonboard.com>
References: <20260315221126.GA520505@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260315221126.GA520505@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: AA53449B539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-60032-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,embedded-recipes.org:url,openstreetmap.org:url,killaraus.ideasonboard.com:mid]

Hello,

A reminder for those who haven't expressed their interest yet: we still
have room available, but will have to confirm the number of attendees by
the end of the week to organize catering. Secure your seat now if you
don't want to miss on the snacks :-)

If you will likely attend but have no received a final green light from
your company, a tentative answer helps us better than no answer.

On Mon, Mar 16, 2026 at 12:11:26AM +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> With spring approaching (at least in the northern hemisphere), it is
> time to announce the next libcamera workshop. After four stops in four
> different countries, we will pause our journey through Europe by
> extending last year's stay in Nice for one more edition.
> 
> The workshop will be organized by Ideas on Board at the Radisson Blu
> Hotel Nice ([1]) on Friday the 29th of May. It will be the perfect
> occasion to meet face to face with the libcamera community and to
> discuss the project's roadmap together. The event will be free of charge
> for attendees.
> 
> We will be part of the "Embedded Week in Nice" ([2]), a week-long event
> that extends the Embedded Recipes conference ([3]) for extra
> embedded-related fun. As last year, communities we cooperate with will
> be present. In addition to the PipeWire Hackfest, this edition will
> bring the Display Next Hackfest to the French Riviera, and the Linux
> Media Summit will also be organized in a nearby location on Tuesday the
> 26th ([4]).
> 
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule. We will draft and circulate an agenda
> after receiving topic proposals. If registrations exceed our capacity,
> priority will be given based on topic submissions.
> 
> [1] https://www.openstreetmap.org/relation/5130684
> [2] https://embedded-recipes.org/2026/colo/
> [3] https://embedded-recipes.org/2026/
> [4] https://lore.kernel.org/linux-media/92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org

-- 
Regards,

Laurent Pinchart


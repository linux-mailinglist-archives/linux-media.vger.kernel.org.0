Return-Path: <linux-media+bounces-28765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5D0A71268
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 09:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BD823BAA38
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB6B1A4E9D;
	Wed, 26 Mar 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LTlridCr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567AD1A2557
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742976824; cv=none; b=tLD/M+1Cj6jEUWlrxTl9agvAVvcNsvrzou2LEv4oq4N7+YJOOVfHZSGtSSnY9OcORDRRfNTkdOSPtWDOj32cb3LWQfE8bJKzt9Chg9kqihwypK4ELlsUCmXrYDMa1kN0cNwf5cosSq3f8SAIibvRtQ/UzkPiW0beYqG+wAROTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742976824; c=relaxed/simple;
	bh=TTYf1MPgWzA6AN3h9XqFDLPCvKYsJcaTWFF+JZjs3vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkfS2MNAwYArkn0ezc5SBXBcv/6RvfyW3H1Zs6QVt6TecnIBQgNLOSsoKS6R+u86Wqyvze2sST6PQKaaCVBZogpv9Xi2E2Btf6HADoRuTXAz9N/vrydHOOoU8uQ461mLDQ8mrrDNOqqA3A1IDwSMXYpLHS8nX79dPvK+XyUkhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LTlridCr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:153:f9b8:5024:faa2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C60F475;
	Wed, 26 Mar 2025 09:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742976711;
	bh=TTYf1MPgWzA6AN3h9XqFDLPCvKYsJcaTWFF+JZjs3vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTlridCr7135gksaYY2ZYPzuJzY6fsMOvH0dAg6zCKitq3qE5R0tisnSdIZnzLpRr
	 TsJ06iM4dccl5/nwUxyaKoO48Z4YhUJ94zlsXlJ3bxVZv2lNUbwQPAmEYbBLT7aTyi
	 2+xfUt3tCbpC23FVzpHZs0/s80dtaJNecV/IFgKw=
Date: Wed, 26 Mar 2025 09:13:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <6by25cpfspvgcejsq663vvq6y5po2mau7r7z6p4ux6wqiwgv5p@vyxpbzwpsrhh>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <aec691edc21205dead06f4ce76ad225662ee60dd.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aec691edc21205dead06f4ce76ad225662ee60dd.camel@ndufresne.ca>

Hi Nicolas

On Tue, Mar 25, 2025 at 02:12:16PM -0400, Nicolas Dufresne wrote:
> Hello,
>
> Le mardi 25 mars 2025 à 12:27 +0200, Laurent Pinchart a écrit :
> > If you would like to attend, please register your interest by replying
> > to this e-mail, and indicate if you have any discussion topics you would
> > like to include in the schedule.
>
> I'll be happy to participate. Topic, nothing big, maybe we can spend 20
> min, I can share an update on the state of the GStreamer support, and
> what is missing, and I'd ask for feedback to complete and prioritized
> that part.
>
> I'm also interested in an update from Jacopo around multi-context MC, I

Indeed, it was something I'm planning to propose as a discussion topic
for linux-media and I was specifically looking at discussing this with
you. Do you plan to attend linux-media, or should we set some time
aside outside of the meeting ?

> don't feel to dive into sensor configuration, its pretty clear this is
> what it is and will be exposed as-is through the abstractions such are
> Gst (I'll make patch as soon as I have the time).

Thanks, looking forward to it

>
> regards,
> Nicolas
>


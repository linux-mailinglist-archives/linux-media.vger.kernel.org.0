Return-Path: <linux-media+bounces-30217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF86A894C4
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A3E93B7619
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758362798F9;
	Tue, 15 Apr 2025 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gkTcmpO0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D56D2798FD
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701627; cv=none; b=fQUK4T5quRI/o7iyxZL2jUP4924CpuuRpbyK2RoL30pq3CLIxtgd7GA13o2/WAIXlo66BimauMitysivYJfSvy8qSM6psn7+oTwQsbkj/orZJha3kEaod17daHcd9mbQ35GPjioS9XI6x/xmX8zFMrOrK5Bp3TCZ6bgPWw0S+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701627; c=relaxed/simple;
	bh=p1S/06ZXQ4T3FfMbOpZo0XfqPyy/e3TmV6YjL21NGw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OempVGIciKD7jFiglydsrgMjQ5UebsC2fz5x2Uj6EXVaq4YKhqJW2pjlIn2HeqQIFxAeMytk1j7nnz7povQoIGG/q5h3CpTFyxk3fSzhet49bS2Ng5XjLLT8PkbC4Cj9m1Y/8P2zpHf4OvnQSckwX4gcxbpdvcFt3BPbKF/Yr3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gkTcmpO0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D5B1725;
	Tue, 15 Apr 2025 09:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744701502;
	bh=p1S/06ZXQ4T3FfMbOpZo0XfqPyy/e3TmV6YjL21NGw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkTcmpO0oqx7MRV+FKate1eRmJ8HMV1/bnyK0GE9MwCINb46VTOt84SP8+c3kkfcK
	 Xkkw6kGGojPy1w0Yo0a1OiG64ScthibVHXtgxFJ2ryJ/ZB0bL5ad82FnE1MJerjjqW
	 TSQItLgih3zqHRXVEtDAXit+fQPmq7w9u7W5px5s=
Date: Tue, 15 Apr 2025 10:20:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250415072023.GI15367@pendragon.ideasonboard.com>
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

Hi Nicolas,

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

I realized I haven't replied to acknowledge your registration, so here's
the official confirmation. We will be happy to see you and Naush in
Nice. Thank you for submitting discussion topics, we will publish the
agenda draft close to the event.

> I'm also interested in an update from Jacopo around multi-context MC, I
> don't feel to dive into sensor configuration, its pretty clear this is
> what it is and will be exposed as-is through the abstractions such are
> Gst (I'll make patch as soon as I have the time).

As Jacopo mentioned, I expect the API to be discussed as part of the
Linux media summit on Tuesday. The implications for libcamera can be
further discussed during the libcamera workshop.

-- 
Regards,

Laurent Pinchart


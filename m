Return-Path: <linux-media+bounces-12998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7C904D15
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B541284345
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C732916B72C;
	Wed, 12 Jun 2024 07:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NXjjoIci"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE551369AF
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178416; cv=none; b=WgKgcq6aB/zE9Hq7bGhwZ5C6zNnHpsk4sf4ker46qNK9GOyijyDN3rAga0yFv96FgWQvqGy4d+9mO4TmvzAS2zyswBbux8egU9uWvK3RisqrJz85ofM7ruSaV0g8pSMy1SBGg1bREBDM1iOjIMD19JJZ8q+dpbAHMlnNTq1Ud1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178416; c=relaxed/simple;
	bh=Smug/T2v3MTknOa7hC/KjXYC3Ezrj6nB7QwhhAtmq7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAeWav3V+uD+HV3eNtSRF62JJVDCKH43wNA6s/wgTNxx1z/Yx4r8NsrxK8RpnSzzvkKqjOIndGvRo8ZhDeO+ObMu9izVbH9MtQLpxjfK3AgtkdWIV/gciU3vPbc8eVMt2At9aWkT7p99HCHUmQZDSfhkVjYWLj/S/f5Scg3F2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NXjjoIci; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81AA54D0;
	Wed, 12 Jun 2024 09:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718178399;
	bh=Smug/T2v3MTknOa7hC/KjXYC3Ezrj6nB7QwhhAtmq7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXjjoIciowBMRCH6EnKcsvmn/sPOIRW1YPboNdLVsgcGcVlwFA+LJcZi/qy8Zne04
	 NEw0F0OzBU8JXNOGH/A2EvcRwqAKgooIoubX3/vwWpXdGceUeAttM++h7pvvr6x2VX
	 daoN5gLH/H+pqjKEGSR4twqINGsbNxcmAgZlA1qY=
Date: Wed, 12 Jun 2024 10:46:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612074632.GB28989@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>

Hi Tomasz,

On Wed, Jun 12, 2024 at 01:12:29PM +0900, Tomasz Figa wrote:
> On Wed, May 15, 2024 at 1:19 AM Daniel Almeida wrote:
> >
> > Hi Hans, all,
> >
> > I’d like to attend in person and discuss the use of Rust in the subsystem, especially in light of [0] and [1].
> >
> > Please note that these are new submissions that are unrelated with what was discussed last year.
> >
> > 30 minutes will do.
> >
> > [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@collabora.com/
> > [1] https://lwn.net/Articles/970565
> 
> Somewhat related to the topic: I see potential for a quite big
> redesign of the videobuf2 framework going forward and recently with
> more Rust adoption I'm starting to think it could benefit from being
> implemented in Rust, since we would have to rewrite it quite a bit
> anyway. Especially since it's a part of the subsystem that has to deal
> with memory management, object lifetime and asynchronousness quite a
> lot and we had a history of issues there. So it could be interesting
> to hear everyone's thoughts.

More than the language choice, what picked my interest here is why you
htink vb2 should be rewritten. Do you have a high-level overview
document that explains the rationale and what you think the new vb2
should look like ?

> That said, I wouldn't be able to travel this time unfortunately, so it
> would be nice if we could arrange this topic in a time slot friendly
> for remote attendance from Japan. Also +Hidenori Kobayashi from my
> team who would also be interested in joining remotely.

-- 
Regards,

Laurent Pinchart


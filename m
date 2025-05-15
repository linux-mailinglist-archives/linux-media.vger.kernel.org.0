Return-Path: <linux-media+bounces-32556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E341AB7F63
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF3851BA3883
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 07:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989D7281537;
	Thu, 15 May 2025 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="taM4NM1m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2D1FDA89
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295717; cv=none; b=i3n9RCd6pe8gVvjfmd7zcYQt+guuleC8eOWGusqgrQ8Oqcm25Hlak8Kp266evAa2UQTF0q9HIxpagGwvq0ny4v2VU4EGLw+GNmzIUl1Xbrgk1DkYWLlNZQNpKLaMYp39GPKSUz6OerExVu7cIaWtqN//ai2F70BSBTmtZ1DYdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295717; c=relaxed/simple;
	bh=EI2+mALs/JK5Bd79hAppCXDoC1MqEyk4tbajx//VRFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYQQyIdU22Cf/8Pv1HjZVCLmTt+R20YlIrbm74+OBSJiiDYB5BnNNH8F0HohX0iLuC+nXvS5hiDnBfGzLmBAv2a4ludhVjeFyBFfbzbFugtWq1Uj8OlpbozqBXD8WFxVJoNxc3REY3WPRyR9L3/Bp3O4ldU0YynQGJDYBIx/DqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=taM4NM1m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (mob-5-91-186-66.net.vodafone.it [5.91.186.66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D704725;
	Thu, 15 May 2025 09:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747295694;
	bh=EI2+mALs/JK5Bd79hAppCXDoC1MqEyk4tbajx//VRFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taM4NM1mm/oYQBc70yv1karSKO6eW4suh5S7Q0eR1XOnLXgPVC19MvnjGBpUUI1OP
	 fwvtMD52I65TMktlKSdrAjcC9XGH7hWHV2ZTO9HwIFCRNpSr9E15VCeozUFo6FeH1Z
	 nNk97NYKMnd/iGn+32HFFW36T/ln3TwtSbxOeZkY=
Date: Thu, 15 May 2025 09:55:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andrej Gardijan <andrej.gardijan@tuta.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jerry Wu <jerry.w.hu@intel.com>,
	Jesper =?utf-8?Q?Taxb=C3=B8l?= <jesper@taxboel.dk>,
	Josuah Demangeon <me@josuah.net>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Naush Patuck <naush@raspberrypi.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Ricardo Ribalda <ricardo.ribalda@gmail.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Will Robertson <w.robertson@cairnwater.com>,
	Libcamera Devel <libcamera-devel@lists.libcamera.org>,
	Linux Media <linux-media@vger.kernel.org>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Logistics and agenda
Message-ID: <20250515075500.GO23592@pendragon.ideasonboard.com>
References: <20250512154445.GA4523@pendragon.ideasonboard.com>
 <CAFEp6-3OCQ-if8ET52vdNg+OrQR281Ad=egOEtzsSLqPWiZY+Q@mail.gmail.com>
 <OQHs1_r--w-9@tuta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OQHs1_r--w-9@tuta.com>

Hi Andrej,

On Thu, May 15, 2025 at 09:37:08AM +0200, Andrej Gardijan wrote:
> Hi everyone,
> 
> sorry but I'll have to skip the workshop.
> Maybe someone could fill my spot?

Sorry to hear you won't be able to join. We have a few people who
expressed interest in joining, so we'll fill your seat easily.

> May 14, 2025, 10:31 by loic.poulain@oss.qualcomm.com:
> > On Mon, May 12, 2025 at 5:45 PM Laurent Pinchart wrote:
> >>
> >> Hello everybody,
> >>
> >> I'm looking forward to seeing you all on Friday the 16th of May for the
> >> libcamera workshop. Here is the first agenda draft, along with logistic
> >> information for on-site and remote attendees.
> >>
> >> As all workshop agendas, this is tentative and we will adjust the exact
> >> timing depending on how the discussions progress.
> >>
> >> 09:00 - 09:10  Welcome and agenda bashing
> >> 09:10 - 09:40  Software ISP status and future plans (Hans de Goede)
> >> 09:40 - 10:00  Slowing down the soft ISP CPU implementation (Laurent Pinchart)
> >> 10:00 - 10:30  Using a single IPA with multiple pipeline handlers (Hans de Goede)
> >> 10:30 - 11:00  Break
> >> 11:00 - 11:45  Bayer reprocessing (David Plowman)
> >> 11:45 - 12:30  Startup frames (David Plowman)
> >> 12:30 - 13:30  Lunch
> >> 13:30 - 14:00  State of gstreamer support (Nicolas Dufresne)
> >> 14:00 - 14:30  Multi-context support (Nicolas Dufresne)
> >> 14:30 - 15:30  Per frame control (David Plowman)
> >> 15:30 - 16:00  Break
> >> 16:00 - 16:45  libcamera on Zephyr (Josuah Demangeon)
> >> 16:45 - 17:15  The importance of libcamera to WildCamera
> >> 17:15 - 17:45  TBD
> >
> > Sorry, I'm late to the party as I missed the earlier announcement, do
> > you still have a seat available?

-- 
Regards,

Laurent Pinchart


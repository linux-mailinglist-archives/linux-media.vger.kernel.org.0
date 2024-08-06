Return-Path: <linux-media+bounces-15838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A5948D90
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 13:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 028821F24FDB
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 11:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970E71BF323;
	Tue,  6 Aug 2024 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="IQ76/Bdq"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633513B2AC
	for <linux-media@vger.kernel.org>; Tue,  6 Aug 2024 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943242; cv=pass; b=S1KtvVRNNeKv5CvPKT77o3AAwXNA538I8LOdz/wLsYbUGyoK2bDtqWN6+CwGfiHbbkDc9qdPFRhUO+pN4VJt+YbV4XjMsmPpa2C3tBDT1EkGb4gERJHzowI8VPrpldHoZ5jkxn1oBgqKfzuZbdqog/K6lZ31zlvg3VO8UVdq0xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943242; c=relaxed/simple;
	bh=r2S+R6S8A2srYM4MuDesq2YPDeI0O7rotKju5TmkaIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUFzfqGAqvU1IIcv7x11iLybP02gXzgGzRZHA0VTiliQedE1yiZVp3oOsPFYUFZc07bLj3OmzEmVzIhYj08qPlTu3wHeehrwUaI6UR0vG5etHQhzISMg20mLjEeV/cXbunulvG+Zyg7IZf5Tb0iMKUjmgr7NRDPFojdjxxTpPXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=IQ76/Bdq; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WdW7p2Rcpz49PsT;
	Tue,  6 Aug 2024 14:20:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722943238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd1vHOqy3k5apqZ6mcZUT2tgI/HceU0Zf6LDCBSED4E=;
	b=IQ76/BdqfmfCZHRVqBZT0OlnqUngZnUT11PesjK+GbjMS97DHmXM7JhuVrWL+RV+DK8uK1
	fkjL0t8mrgfzPaf5RtvKHxKdOZnpNe7XPr+xulPtmn8Wgyq4MBuSIxfPQshb/oHMoD8kOA
	ZHK30d8eaKR4UuOIjbAq5Hbd7wg+kdK5TL1ZeHHmkFJUN4RaylsTLkfKrV++T9sP/vAR9f
	jXeMX0ji0BEawRFHMS8EBnHw0Bg02LrjaTbGH8nYt6ZBqlxE2yFv6jZacPJOBb02vGU0DR
	6bJbUH0m4eqAEbofzofNKeY+aklB9qVhZB6Pr0LpVFo5Hl9HvaOdwBmHTovhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722943238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rd1vHOqy3k5apqZ6mcZUT2tgI/HceU0Zf6LDCBSED4E=;
	b=jpAfwF27imEjHp9mWw2RgR8/nF9fe/DJX+F++v6zDqU1EvAGELfKAx6ikb2WjruacRW3mD
	RJk4xFFU7EEDFDlqq/RYjodUP/r8GtJgizY8llEdvaBPlmvAM8itjZbYFpJ0gVQgr+B+jV
	IGxcjbLyeEPks71Ek7v4ncvy5fSkeQQ7ME+TxJq6qdpfp+XTyiDiUHsZDMOxz7I+BW38ez
	S5b0Rt3o/5CoBb3SxxjJOJDZpfAoyAlRXlMeGc5kRdI6bQCday0O+7gwiP2pVmxNUUMUzt
	gbdHFZ5eESbU6nRvpZA5wsVDIvUwuLcpOM8tlOy5V9cyZdzsMVefOLStpAE+Jw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722943238; a=rsa-sha256;
	cv=none;
	b=NkyO6oZuxdHGR8VLSM5B7Q0BiSgDH+tpScYXphwcvfR6RNMFaZRP2PyaNv+Eb9uqvPNy0y
	cU61yS/hG8p3TvisFlrhL5TtlOSYLA3g8GvV+X/SbLnpmL8WnM5RwE/8aHTDQh6leHm9Tl
	jUSpgvk4e+pwopUFLhgfEs52YlFz/QdIYQtgLW87MbODsWKk1EcA2zP/QfQd/oO/fwRvfo
	AHMeHkJvZ6wLGIkQRALGZpweNGZyVdLZfJvMHZ7wZgjUZ0cQgEu8HSh/XOur/BlDXwKeQa
	hmnVlQluAiMKRTNDuMNkGYHIGStK0hERC8BCEBZJ4IZINjfsNk7DdBCKN0Ihkg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1BC8F634C93;
	Tue,  6 Aug 2024 14:20:37 +0300 (EEST)
Date: Tue, 6 Aug 2024 11:20:36 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v7 01/12] media: uapi: rkisp1-config: Add extensible
 params format
Message-ID: <ZrIHBLZ-dhVxwkBi@valkosipuli.retiisi.eu>
References: <20240724085004.82694-2-jacopo.mondi@ideasonboard.com>
 <782e20b3-6a4d-45fb-bcee-b3e92fa16719@xs4all.nl>
 <20240730121845.GJ1552@pendragon.ideasonboard.com>
 <719befce-a50a-4128-b8f5-82bff009c361@xs4all.nl>
 <mge3iac6oh7wxqgppxyy47oghw7rgtp7jun36hnjvxkwgw7yv2@2gw6qym7mczm>
 <40bf283c-7d6f-4864-a90c-a765b52dc264@xs4all.nl>
 <zpi7xc6wpefzud2sq4ab7rc6fpdzbgowygew7a7u3j7tikrxfm@q2gvsac4yqoc>
 <20240806090623.GB21319@pendragon.ideasonboard.com>
 <4vw5k4ha5zqvavsyz33sy25r4q547xiik27y37rhmjcowks277@pm5dqzixtydw>
 <20240806093222.GE32045@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806093222.GE32045@pendragon.ideasonboard.com>

Hi Laurent, Jacopo,

On Tue, Aug 06, 2024 at 12:32:22PM +0300, Laurent Pinchart wrote:
> On Tue, Aug 06, 2024 at 11:16:05AM +0200, Jacopo Mondi wrote:
> > On Tue, Aug 06, 2024 at 12:06:23PM GMT, Laurent Pinchart wrote:
> > > On Tue, Aug 06, 2024 at 10:24:20AM +0200, Jacopo Mondi wrote:
> > > > On Tue, Aug 06, 2024 at 10:17:02AM GMT, Hans Verkuil wrote:
> > > > > For compound control (which have similar problems) I have quite strict
> > > > > requirements: the structure layout may not contain any holes, and I require (and
> > > > > test) that any reserved/padding fields at set to 0 by the driver and that it is
> > > > > documented that userspace sets it to 0 as well.
> > > > >
> > > > > My recommendation for public APIs that effectively return data structures
> > > > > is to:
> > > > >
> > > > > 1) ensure the layout is the same for 32 and 64 bit code,
> > >
> > > Yes, that's very important.
> > >
> > > > > 2) there are no holes, instead use reserved[] arrays instead,
> > >
> > > Fine with me.
> > 
> > Do we all agree I can't change the existing types, and we'll have to
> > live with holes ?
> 
> We may be able to change the existing structures, but that would be a
> separate patch, outside of the scope of this series.

I'd say "we can" as long as it doesn't affect the memory layout of the
interface structs.

-- 
Kind regards,

Sakari Ailus


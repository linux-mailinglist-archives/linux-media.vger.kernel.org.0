Return-Path: <linux-media+bounces-19412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7B99A081
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 11:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A9D1C22F89
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 09:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67642141B1;
	Fri, 11 Oct 2024 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tF5r1vt2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7E1F9415;
	Fri, 11 Oct 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728640485; cv=none; b=jKySVIICw/2l7KnmWIHwstKnaG2YPcvMJTr6NMVM6AFg1GYZIxH+b03UU1ud5n8VvKoA0PI9+OmBcftEC5gHSJ9wAJ+ArHBMxMjxlqGOABZpvxtoulT+A+nfs46aRn8KfjcNzzJ8AoOL353ycj2zEy6h71M8V8C9Hnm30zzboao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728640485; c=relaxed/simple;
	bh=2yzsA2kRa2zo2Cn1nrydw7a45oeTg8jRlG9l+3Lnrg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXjPu+OQAry7XRQAksobwDxcvSmWhCGn1i02cQI7150/UhJSch13WL2ZlJxvT7Azjro5TW3QGR16045gR4AHEdOiYic7Zh84gf08Wn41dD0MjcgtBxYWIXrhE7SBedpANVH/fzPuarypoE0fhi7MyWNPZSTU6J3OUG/sCv+HD/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tF5r1vt2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CB0C4CEC3;
	Fri, 11 Oct 2024 09:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728640484;
	bh=2yzsA2kRa2zo2Cn1nrydw7a45oeTg8jRlG9l+3Lnrg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tF5r1vt2su0vXxMcyDcyDnVwc+UsUya2qLP0ekw8jvaJrZgai8eeKary/RGfvVvyu
	 ZAfA8Pk3pRONxVGf2zFcBevpyCEEIVdXKNrezJXMZrdNvo6n9n00N7RTIxY0AAWM07
	 PVjb0GFbsaREptWAgkdTwAowPVKmZ0PkHCGNipvhdY3UQdy4Ihu0rxTTDv1j0Q5Skx
	 JlSQf00NdTg8jDj7cQV0nY8NnAhal1/w65Z4tpOvuF70UkhcZ0Bhl7PBluq5Wur+N/
	 NxVY0R1mZTxd6DIAtgn/aKvD6NILyqOICmG9C1BoqgHK7ui9sNNq3KotiGtkR+qWDS
	 c7gCuCjBh4XoQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1szCME-000000005Qx-3UaV;
	Fri, 11 Oct 2024 11:54:50 +0200
Date: Fri, 11 Oct 2024 11:54:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: camss NULL-deref on power on with 6.12-rc2
Message-ID: <Zwj16uJxNGoPoVe-@hovoldconsulting.com>
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
 <d394fb33-2fe4-4a5a-b6fa-7f5598aede9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d394fb33-2fe4-4a5a-b6fa-7f5598aede9b@linaro.org>

On Fri, Oct 11, 2024 at 10:41:30AM +0100, Bryan O'Donoghue wrote:
> On 11/10/2024 10:33, Johan Hovold wrote:

> > This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
> > kernel on the Lenovo ThinkPad X13s.
> > 
> > I booted the same kernel another 50 times without hitting it again it so
> > it may not be a regression, but simply an older, hard to hit bug.
> > 
> > Hopefully you can figure out what went wrong from just staring at the
> > oops and code.

> > [    5.657860] ov5675 24-0010: failed to get HW configuration: -517
> 
> So this caused it, I guess the sensor failed to power up.

The probe deferral may be involved, but we see this deferral all the
time without things blowing up (and the driver should be able to handle
that).

> You've booted 50 times in a row and hit a corner case where the sensor 
> didn't power up leading to a NULL deference.
> 
> So, two bugs I'd say.
> 
> - What is the cirumcstance where the sensor doesn't power up

Not sure what is causing it, but I have seen boots where this message
shows up 5-6 times, which may indeed indicate that something is off. If
this was just a provider not having probed yet, driver core should
generally prevent the sensor from from probing until the resources (e.g.
clocks) are available.

> - What's the NULL either entity * or entity->pad I'd say.
> 
> <snip>
> > [    6.594915] Call trace:
> > [    6.594915]  camss_find_sensor+0x20/0x74 [qcom_camss]
> Hmm, not sure looking at what we have.
> 
>                  pad = &entity->pads[0];
>                  if (!(pad->flags & MEDIA_PAD_FL_SINK))
>                          return NULL;
> 
> Is pad guaranteed after entity->pads[0] ?
> We dereference it like its guaranteed.
> 
> Anyway thanks for the report, should be enough start digging.

Thanks.

Johan


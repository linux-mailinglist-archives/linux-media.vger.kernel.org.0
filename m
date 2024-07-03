Return-Path: <linux-media+bounces-14592-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD192648B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 17:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D618B28E207
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 15:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3347181B8E;
	Wed,  3 Jul 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXCAsBIU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34B181303;
	Wed,  3 Jul 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019539; cv=none; b=tMPKa0ItBLQh34Of7/u0tQxWQCzEjPIEKeOIqXSlUEO+l7sw+Oj1aX9KlTySPx2Tw1b+u/9tEMhizltDfQhF4djV4tojucpuXmHYYeU9uKwsUNBaVHRRwzs2gw93iSLAq49X6InaggnsVeWl5vR85hpMZEUA6YjttyuJZCSoMy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019539; c=relaxed/simple;
	bh=X7KkvROHIZA5v9Zh3iho8Licbn39MdZ8YXDxuNJ7XNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mr4MZyE8rakay/QVEeVMlG9xtmVUh255vfDybpXOZlNVKGwvpaZQ6VA/H61gz//8tQOlTWpJ2u5pAQNkCJoqqG2+q9WPrC2czlW4PRlYuu7L2zDZPhWmNNlgqz2QKGjO+cGwvR7ekDtig32Cqi36FaEL2XoNI1NZp89rG9LE5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXCAsBIU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F003BC4AF07;
	Wed,  3 Jul 2024 15:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720019539;
	bh=X7KkvROHIZA5v9Zh3iho8Licbn39MdZ8YXDxuNJ7XNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eXCAsBIUhDx0hcDVysxLYy5n+y6OVoNK2yCqIwkvUMFHllmycXBNmIh5g9K0d5Jzx
	 pEw53/h+aLERGlcSTAJ9vBivIKAZCftospMarzWY7qfdvHaYEgGXeQl82ckuzr5V8O
	 RsXRdiFq2RnOJEuyK086iPJ22ZZEOTATphJetELAprXUGaJLGbZ3kTHGqnr4ATDjsR
	 Q7XExUKE4mLRw/ERiptmE1VC856nOTEq7aJapdF5VFkIT40LvDiUMIO2g49NtUchvk
	 agXKi0TIEyDDLActlWlhGL2ifBSg+EmC1kYIh+RV4RxGQdtIqKyojx5VgNEXraOxni
	 3ztTsdXrdL/pA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sP1eZ-000000005vS-2e43;
	Wed, 03 Jul 2024 17:12:16 +0200
Date: Wed, 3 Jul 2024 17:12:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Failure to stop CAMSS stream (sc8280xp)
Message-ID: <ZoVqT0jzro8s4NUC@hovoldconsulting.com>
References: <ZoVNHOTI0PKMNt4_@hovoldconsulting.com>
 <49b2504f-e5ab-4ea9-aefb-bc9c7f71f5fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49b2504f-e5ab-4ea9-aefb-bc9c7f71f5fc@linaro.org>

On Wed, Jul 03, 2024 at 03:30:09PM +0100, Bryan O'Donoghue wrote:
> On 03/07/2024 14:07, Johan Hovold wrote:
> > Is this a known issue with CAMSS or is something missing in the sc8280xp
> > integration?
> 
> A known issue on my end,

Ok, good. Do you know already if this is a generic CAMSS issue or
something with the sc8280xp integration? I believe I heard someone
saying that they had seen something similar on other Qualcomm platforms.

> I also want to root cause intermittent sensor 
> startup failure, before switching on the sensor upstream for more common 
> use.

> > The issue was there with 6.9 as well so it's not a (recent) regression.
> > 
> > Probing the camera sometimes, but infrequently, also fails with:
> > 
> > 	qcom-camss ac5a000.camss: Failed to power up pipeline: -13
> 
> Yes this. If you recall on the pm8010 I had mentioned to you about a 
> wait-time to startup the regulator - thinking it was the regulator 
> causing this error.
> 
> More likely the GPIO reset polarity or delay needs to be tweaked in the 
> sensor driver.

Ok. Seems to happen quite rarely here. I have also seen a probe deferral
warning (which should be suppressed if it's legit) that may or may not
be related:

	ov5675 24-0010: failed to get HW configuration: -517

> > and I'm seeing the following warning on every boot:
> > 
> > 	i2c-qcom-cci ac4c000.cci: Found 19200000 cci clk rate while 37500000 was expected
> 
> That's hanging around for quite a long time 19.2 MHz is a perfectly 
> valid clock, useless error message.

Ok, but please do something to get rid of this warning as well. With
too much noise in the logs, people may fail to notice real issues.

Johan


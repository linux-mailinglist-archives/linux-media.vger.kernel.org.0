Return-Path: <linux-media+bounces-37425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921FB00D7B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A126587726
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92942FD893;
	Thu, 10 Jul 2025 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vDzI8Zl/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94C2192EF;
	Thu, 10 Jul 2025 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181577; cv=none; b=ZDJUWKSyCayH5MTDXPhlgF/SX4SSq+mFHCiJ8yrvBlbPefFpmNcTqE8qEHn0h4JWRY53K0KjkYr4+Ols/GMl90il5JQH0s/n89qC1THlT8LqwQsyf2MoQCCLttNcGKtUIfAZ8ykHxgAgHzQ5EMhCNvwhpZIy29PKRunytu89x9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181577; c=relaxed/simple;
	bh=CfcPRmoFAMjFRyAkPPFdasZ3nhHhA1KXUkeG5VnTHkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwx7cptloOBH5UN6J9TQe8J5giDlxYl9nMCGaCQuOPVYqS1uFceZOu0/tL/P0W8zhVxOjpWTCfuK0jE8U4dvpCICg0SYrJwFVKGNw9LfaS3gzV/45um+DZ/jozZ8oQPWPjrHlFzVJRr9R63y0KOHMJJjoOPNypgUNP1UaXqqxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vDzI8Zl/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9BBC5EFE;
	Thu, 10 Jul 2025 23:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752181533;
	bh=CfcPRmoFAMjFRyAkPPFdasZ3nhHhA1KXUkeG5VnTHkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDzI8Zl/qmYpg2UEjRQwjX2NARAzSgUOmMN9VxhM0JoRx4A7GQ5o7LpvVgeJWVeez
	 2zDr0aSD3iNv437mwGuPdjxM891t5084u82fi0hHoxO1o7ata0A7XSGvZqWGIlEPX2
	 hfiOVvBPfnCOacv3xnDAdtXxZ/f1doPRmeGWKwt8=
Date: Fri, 11 Jul 2025 00:05:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Message-ID: <20250710210532.GE22436@pendragon.ideasonboard.com>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
 <20250710131107.69017-2-hardevsinh.palaniya@siliconsignals.io>
 <43023f6f-2a02-4c5c-8f45-66ff7df1e8ad@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43023f6f-2a02-4c5c-8f45-66ff7df1e8ad@kernel.org>

On Thu, Jul 10, 2025 at 03:35:51PM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2025 15:10, Hardevsinh Palaniya wrote:
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - avdd-supply
> > +  - dovdd-supply
> > +  - dvdd-supply
> > +  - port
> 
> Now  I looked at your driver and the code clearly says that GPIOs are
> not optional.
> 
> You really need to sync the binding in the driver. They cannot define
> completely different ABI.

I couldn't have said it in a clearer way.

For the GPIOs, I recommend making them optional in the driver, as GPIOs
are not always connected in all designs (unless of course we're dealing
with a GPIO whose control from the SoC is absolutely mandatory to make
the device work at all, but that doesn't seem to be the case here).

-- 
Regards,

Laurent Pinchart


Return-Path: <linux-media+bounces-25632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9BA26ED5
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 10:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D993A67D8
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 09:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA40E207E17;
	Tue,  4 Feb 2025 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIZpZ6gW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85020125D;
	Tue,  4 Feb 2025 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662762; cv=none; b=FDjXBgs0LkZdH2JbDU8i6V4/53t0zy1OhsHW8t/DZ90WksAC7PyaUk2K/7e+ymMaJoamVcUkJUZsPeSKMy9cWXCgGJK5/ISS/NyYIITjujZ2sIbBUiXAOyXalCkUqcKxqc33hzBM5ttQYSfzVJi6Z2DglE8G9RwolFZMp0vOoaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662762; c=relaxed/simple;
	bh=sL+mkXg7FnHmtiZaUZowPBUhk793HDWBJswbvkrXNmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg1cnC2UWRgnUIAclUVJVs7CDHoj1BJIQ7KqG7cdfvBnZS40IqDpmFqitguFO7fN07aG9a6HCof+kRebcyou16yXLyPQfzTvBhrtzjfjBh4L1te3Vt9suV9fXw5twN4Bk7cIKSq6LdWYTwaw2W4lawWPkrkVxZOGTlDNmxEzAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIZpZ6gW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902D4C4CEDF;
	Tue,  4 Feb 2025 09:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738662761;
	bh=sL+mkXg7FnHmtiZaUZowPBUhk793HDWBJswbvkrXNmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIZpZ6gWxUwLKihVjI8ddPY6GPWZEwgPgFQabJvYB6+4q9mlkCDR1QzmJXYPD5opC
	 4gOKTuycPUUvTJh6kp+MpQL5hEjhit1x9gurH7SU2YHonvdayWxx+eiJwvx7czMJIT
	 vyPNhqFioFYDCxXzGJ/8HEP7Lvoklz1bFZOVO12Y9ams6dWMsUSd4VHLqDBg/XPAkN
	 lmZZKPzr7T1zvHyTgWuMesaErr2V2pRH643l3keBBsEOv7dx7zJfFhIgivzh/nyHdP
	 JTvD1aOiPjw7DwLp/tbJ5L/pcDmBRWBUG6C7X6NGFTyxXZGr+mglqwyvXfNGSxkEe6
	 unSmiv5S4M+jQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfFbp-000000008Lj-3YI1;
	Tue, 04 Feb 2025 10:52:45 +0100
Date: Tue, 4 Feb 2025 10:52:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <Z6HjbXZsR9QmXxKy@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <Z6CApNuSlPGvVL2k@hovoldconsulting.com>
 <fhqlt5xsz7yyrbnvhnovt66gzldjjbitpeznlvxztobdxmjnuw@d4avd5fq3muh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fhqlt5xsz7yyrbnvhnovt66gzldjjbitpeznlvxztobdxmjnuw@d4avd5fq3muh>

On Mon, Feb 03, 2025 at 05:37:28PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 09:39:00AM +0100, Johan Hovold wrote:
> > On Fri, Jan 10, 2025 at 08:01:21PM +0200, Dmitry Baryshkov wrote:

> > > Also as venus and iris drivers are not completely
> > > equivalent wrt supported platforms, distributions will have to select
> > > whether to disable support for older platforms or for new platforms:
> > > Kconfig dependency will make it impossible to enable support for both
> > > kinds.
> > 
> > You shouldn't have both enabled. The only reason for keeping support
> > for the same hardware in both drivers is that the iris support is
> > incomplete and considered experimental. No one should enable that except
> > for development and evaluation purposes until the driver is up to par.
> > And then you drop support from the old driver along with the config
> > option.
> 
> That's the plan. This modparam is a temporal thing for transition
> period. And yes, as a developers / platform enablers we want to be able
> to have a quick turnaround between drivers.
> 
> Please stop forcing your decisions on other people. The Linux kernel and
> its development process has always been about providing a possibility,
> not a policy.

That's just not true. The rule is to not have two drivers for the same
hardware (even if we very rarely have accepted some well-motivated
exceptions).

I understand that you may have an unorthodox view of this as you work on
the MSM DRM driver, but hiding incomplete and broken code behind module
parameters so that you can game the upstreaming process (e.g. like you
did for the eDP PSR feature) is simply not a model that anyone should
follow.

Johan


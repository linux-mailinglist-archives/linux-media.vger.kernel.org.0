Return-Path: <linux-media+bounces-25646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C21A276A4
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 17:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0941883D57
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6053B215184;
	Tue,  4 Feb 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgKJ1p4D"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D4AD2D;
	Tue,  4 Feb 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684827; cv=none; b=GSZPwBgbPAtUfmoEsUJbOSpnoYmNbN7XNY+ROScBsjmWAwXafdDFA9sjvUo54bxcGt7ENIxPBOJXzb72GGd34hG7BkIUU5ZMKRGwzzg1xotvvmDfldDB0JAYy62QMuEUdtyp/fSBHDQ9MBh+jLSf4y9j4cAa1Opj9SSTA78JW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684827; c=relaxed/simple;
	bh=Y5jRzQ9prbbWhoH9ZFvlpRlFbPAwHmYS/b/imvrO3B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyXz199LETfooyj0NuXNLR16KfaAQtKt1PaLZWCWHe6g+HGVY8oml01PSE4+x0GOq/xi0EHYDBR8+Qq8fZ5IU6uVtKOXU0UHc2dQgYcL7cfnrRbngrb2XD71RHQ1L46+P/bziBMIHInYaTaCCgE5i0yMs5WA7VSUNxeRzpnJ2DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgKJ1p4D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23F7C4CEE2;
	Tue,  4 Feb 2025 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738684827;
	bh=Y5jRzQ9prbbWhoH9ZFvlpRlFbPAwHmYS/b/imvrO3B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgKJ1p4DWdQ/7V/H0JpcZiu5V5bmcchaIxxsHltZ1YAHkqf3utApMvvupeXW2s6i0
	 tAHjmyrudZoWoz8x3yV8iXKd6HIXH9E3bDOcnyV3rxRHsvdCF4DsrQfMPeIvTr1j8m
	 7DcjVhhdEf3ZvFOCnxjLNpVRw2cJbmTj01n6cLGVTsMJ9vxI0DhQ5Yqm54tV61My9/
	 YqJzUwRyF/tRmZRjy0mxo/MsgF1/WrZBPZFIg+A1hcPdjhmvt7gp1WMvyjloYhJx6J
	 Tl0AWNfvZtsrRq9gq0DR1pph6Ml2bfRCOGH4NlNSU9SGL1O8KXWt1saVyzXDluFlID
	 ureXtr+Aox9HA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfLLj-000000000S9-0vQw;
	Tue, 04 Feb 2025 17:00:31 +0100
Date: Tue, 4 Feb 2025 17:00:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	neil.armstrong@linaro.org, nicolas@ndufresne.ca,
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
	lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6I5nx2Wt3bbBmSI@hovoldconsulting.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
 <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>

On Tue, Feb 04, 2025 at 04:55:58PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 10:31:49AM +0100, Johan Hovold wrote:
> > On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> > > > On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:

> > And we're still waiting to hear the answers to all of Hans' questions. I
> > still haven't seen anyone explaining why any of this is needed. You
> > could have just continued letting Venus support 8250 so presumably there
> > is some benefit in using Iris instead. Which? And is that potential
> > benefit important enough to not just wait until Iris is up to par
> > feature wise?
> 
> Because that's exactly opposite of what Iris developers are trying to
> do: SM8250 and SM8550 belong to two different generations of the FW
> interface. By supporting both of them in the Iris driver the developers
> can verify that the internal driver abstractions are good enough. It has
> been discussed in one of the threads (or in telcos) related to the first
> iterations of this driver. We definitely don't want to end up in Venus
> situation, where the abstractions were added afterwards and in some
> cases they are not the best ones.

Ok, but as I've said a number of times already, information like this
needs to be included in the cover letter and commit message of what is
posted to the list.

Maintainers and reviewers obviously have no idea what you discussed in
some internal teleconference and can't be expected to remember or dig
this out from some old email thread either.

> The plan is to use sm8250 as a "bridge" between two drivers, verifying
> that they are on par during development, then drop sm8250 from Venus
> driver. Then move sc7280 support too, drop all HFD_VERSION_6XX support
> from Venus, cleanup the remnants.

Ok, but venus would still remain for some older hardware? It's just the
"hfi gen1" ones that would move to the iris eventually?

> I think most of that information should have been a part of the main
> Iris series. If it is not, please comment there, so that those commit
> messages can be updated.

Unfortunately it was not, which I also pointed in my comments to the
Iris series.

> > I'm sure you have some answers, but you need to provide them as part of
> > the series.

> > Unbinding and rebinding drivers is not part of any normal work flow
> > expect possibly during development. And a developer can easily compare
> > Venus and Iris for 8250 without a module parameter too.
> 
> Yes, we are talking about development. And yes, modparam helps. If you'd
> like to do two separate kernel builds, that's fine.

Please just motivate why you think this is needed as part of the
submission. And make sure that the implementation is sane (e.g. not some
random probe defer indefinitely thing).

Like I said, having two drivers for the same hardware is normally not
something that is acceptable, and this would need to be a transitional
thing as we both agree. One way to guarantee that is to not expose it to
regular users until it is ready (e.g. a Kconfig hidden behind
CONFIG_EXPERT or similar). Otherwise, I fear you'll end up supporting
both forever (with at least one of them bitrotting behind that module
parameter over time).

Johan


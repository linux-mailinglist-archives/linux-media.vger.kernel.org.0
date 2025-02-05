Return-Path: <linux-media+bounces-25671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8386A28594
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 09:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97A2C1886A23
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A443322A1E4;
	Wed,  5 Feb 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzMIDa9N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F024F20E004;
	Wed,  5 Feb 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744240; cv=none; b=DTZmnlnpTKN3ozu+S1Ic0V/5tjqnBsM8StDy5lZmCOT/ftSP9w5BbW0fk5FDQa1Gl9d+pEvDMrMjzoxXTR/CQYNvRImhNYAlXwRllVlX74tWxGemWD4Y8p0EqZ9BCJTyCBBiXzeStTrZ0zEpCQKy0bxeJJ7DFgBZqi9tcHD6+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744240; c=relaxed/simple;
	bh=BAeQkOipvrJpo8BJ7v2PB1Gs5G+nzczTlfJtspomTf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdTagi7r8BYXDX7fdomMCh97ZLjGWM9b23NosTTOBNcVaiaEXb1BEczlcw+MIKlkIpDG+cdO0Xs2OnCO5wHgTYjG3y7wxFvsoBD5ws3Hd7rndIXZSjgzVZOfohHFxwht+CR+J+5IWBHuTV2bvAummQzvFZXB9bMN9WGUN1roghY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzMIDa9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511CDC4CED1;
	Wed,  5 Feb 2025 08:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744239;
	bh=BAeQkOipvrJpo8BJ7v2PB1Gs5G+nzczTlfJtspomTf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzMIDa9NNlHBWX10J9SI0j4NX434uZJ6mAkx6FLRfprYurjv5wfXdIBqaWeoG1Ud4
	 hhz0jhCGk5vjEMI9NqumYpN430t9u/zXg11PPhlBzU3pCTxAn9qREnonlpzrHMsb2l
	 N/iRTVQ5FCLv5Z6l7AsJMrd5xtXzGmPetrOXGLs/OnXeCOA7BIlvaOJUtGt0KVdx4v
	 C7Qpd6DTUIoNfpoE2upRYPx7iXiQdPPL7eU05bulSMcblFjQqpxI+2bAQ4pbtJIEt+
	 z1m1PX9zbyLxm8c7iaZFfYrfRtMcwdvOcBxCVq2rSP+cV6iQRAQO09Td33d0kgiqJ0
	 qjNDMZ87HRt8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfanz-000000008CI-1jTm;
	Wed, 05 Feb 2025 09:30:44 +0100
Date: Wed, 5 Feb 2025 09:30:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, quic_vgarodia@quicinc.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	p.zabel@pengutronix.de, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	neil.armstrong@linaro.org, nicolas@ndufresne.ca,
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
	lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6MhsxskgbFX3dFd@hovoldconsulting.com>
References: <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
 <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>
 <Z6I5nx2Wt3bbBmSI@hovoldconsulting.com>
 <ilqfs6miq55ahyxjnhniv4k654vstfugmpswo5wld2ncgxxcx3@vsbr4bdl7y64>
 <69dc3c64-e0b7-a453-a73b-6a3c9dbded7d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69dc3c64-e0b7-a453-a73b-6a3c9dbded7d@quicinc.com>

On Wed, Feb 05, 2025 at 11:47:12AM +0530, Dikshita Agarwal wrote:
> On 2/5/2025 4:39 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 05:00:31PM +0100, Johan Hovold wrote:
> >> On Tue, Feb 04, 2025 at 04:55:58PM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Feb 04, 2025 at 10:31:49AM +0100, Johan Hovold wrote:

> >>>> Unbinding and rebinding drivers is not part of any normal work flow
> >>>> expect possibly during development. And a developer can easily compare
> >>>> Venus and Iris for 8250 without a module parameter too.
> >>>
> >>> Yes, we are talking about development. And yes, modparam helps. If you'd
> >>> like to do two separate kernel builds, that's fine.
> >>
> >> Please just motivate why you think this is needed as part of the
> >> submission. And make sure that the implementation is sane (e.g. not some
> >> random probe defer indefinitely thing).
> >>
> >> Like I said, having two drivers for the same hardware is normally not
> >> something that is acceptable, and this would need to be a transitional
> >> thing as we both agree. One way to guarantee that is to not expose it to
> >> regular users until it is ready (e.g. a Kconfig hidden behind
> >> CONFIG_EXPERT or similar). Otherwise, I fear you'll end up supporting
> >> both forever (with at least one of them bitrotting behind that module
> >> parameter over time).
> > 
> > I think I'm fine with hiding IRIS behind CONFIG_EXPERT, might be a good
> > idea.

I was only thinking about the (experimental) support for hardware
already supported by venus (i.e. initially 8250) and possibly the
module parameter if you think that is essential.

I can imagine the feature set becoming non-overlapping overtime so that
you end up with some users depending on venus and some depending on iris
for the same hardware if you expose iris support prematurely.

> Are you suggesting to add a dependency on CONFIG_EXPERT for IRIS driver?
> Something like:
> config VIDEO_QCOM_IRIS
>         tristate "Qualcomm iris V4L2 decoder driver"
>         depends on EXPERT
> 
> This will impact the enablement of iris driver on SM8550 as well.

Right, it would, and that is not necessarily right.

> And will this also be needed to be captured in cover letter?

Yes, whatever solution you end up with need to be described and
motivated in the cover letter (and commit messages) so that the
reasoning can be evaluated.

Johan


Return-Path: <linux-media+bounces-25648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB3A2770E
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 17:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1F013A593D
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3A02153D0;
	Tue,  4 Feb 2025 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSlRTa8s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741D188583;
	Tue,  4 Feb 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738686175; cv=none; b=M2w4n6EHPgN3f072dR46Ok07NXrpQf33tBf4F7FNm4DyRwCqbfgpsZypVf3rfVURi+o79qGIxklLw8Xrqa8zoTNNfgSusJ7ODEXPr0lnRTzI1QXPr+nK83ZHRg5veOain5ZkOwTFEiWIUczqGoZIGykHTOrRne0ncZZIgVvmjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738686175; c=relaxed/simple;
	bh=3KpIyangA6PEtye0Ld8RUAFMhnSs7WIDzCNzrAOqBxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5CrVjJ/FJEoF93MdfSIBrN9bHw40IKMlI1+/YQhGnuuDZnu+x5CyKlVFO3hXTRzDHjJZHkZPg1Qu75JCDr+M0R0yLF2gFhf9atc8JBY1z2t6NIVytF/WdjIciJok1tur2+KN4o9GJRxZe/bfgFnFxUwtKYF0WrJQ3wNdBRDtEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSlRTa8s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DA7C4CEDF;
	Tue,  4 Feb 2025 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738686174;
	bh=3KpIyangA6PEtye0Ld8RUAFMhnSs7WIDzCNzrAOqBxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSlRTa8ssyBKpLmDlLO96dxLI9S/XOvge8hf7HsR170E3N4mPsmom/XrPPiT3xfWE
	 i1Q3LQ7kuLItYCn7Epf/9U17fKtsL5ifaCL+2RKC5W+Q10t13Vcg2G46difH/4VEI6
	 ilQTlBUEFKAt4vF4BfPGCaLiYkh7APgwSynxDbqNzrz8txUiA+M70Hm0U+rQHFreDI
	 yHW3B4M0FTA0yKmwtRVk1efogp3ySiZ8p2xQt9EKphHq07sNWB1WaEljOAkPi67Tmg
	 QjOjS9XiBo3Mv4sGRJbuTOlBUVCDMOCHa2hnHBdYln05MtFfZZRMjYe8mm10VdhJnF
	 JtMKBWL57/+1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfLhT-0000000012r-2Vfi;
	Tue, 04 Feb 2025 17:22:59 +0100
Date: Tue, 4 Feb 2025 17:22:59 +0100
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
Message-ID: <Z6I-4w8R5Hk1QYgG@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <Z6CApNuSlPGvVL2k@hovoldconsulting.com>
 <fhqlt5xsz7yyrbnvhnovt66gzldjjbitpeznlvxztobdxmjnuw@d4avd5fq3muh>
 <Z6HjbXZsR9QmXxKy@hovoldconsulting.com>
 <uc2rve7hqf4mmvobinaxzf5qncglysfeg2lbxmxvxapsewhgxh@2ppf757u352g>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uc2rve7hqf4mmvobinaxzf5qncglysfeg2lbxmxvxapsewhgxh@2ppf757u352g>

On Tue, Feb 04, 2025 at 05:35:26PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 10:52:45AM +0100, Johan Hovold wrote:

> > That's just not true. The rule is to not have two drivers for the same
> > hardware (even if we very rarely have accepted some well-motivated
> > exceptions).
> > 
> > I understand that you may have an unorthodox view of this as you work on
> > the MSM DRM driver, but hiding incomplete and broken code behind module
> > parameters so that you can game the upstreaming process (e.g. like you
> > did for the eDP PSR feature) is simply not a model that anyone should
> > follow.
> 
> Let me point you the aic7xxx story, we had, if my memory is correct,
> three drivers working with the same hardware at some point, during
> transition period.

As I also mentioned, there have been exceptions to the rule.

> Regarding eDP PSR. It wasn't my implementation, so that's not correct
> comparison.

Sure, but that module parameter is still there two years later, the
functionality is still incomplete and from what I've heard has since
also bitrotted (psr_enabled).

Done right and enabled by default this feature would have been very
useful giving, for example, users of the X13s a 2 h battery boost.
Instead, as expected, no one cares about fixing the code after it was
"mainlined" or runs the bits that did work often enough to detect when
it breaks further. Everyone loses.

> MDP5 -> DPU migration is mine and yes, it is implemented in
> this way as we can trigger CI jobs having a single kernel, as developers
> we can switch between MDP5 and DPU drivers in a quick way, etc.

I don't know the backstory there, but at least the commit message didn't
mention anything about a plan to transition from one to the other.

Johan


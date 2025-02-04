Return-Path: <linux-media+bounces-25647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D61A276C4
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 17:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4CC165338
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 16:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430E7215198;
	Tue,  4 Feb 2025 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xemi6QOf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEDF2147F7;
	Tue,  4 Feb 2025 16:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685106; cv=none; b=mfljcpKbzDLMQdxtbgI4NQgVENTshTr4veAwVWH3+oq6DrBI2iQMxglXrupyqsFeVjmoqh86gQyNS4hm4wonegicFsDWDs7tWlQbdX4Bt6QTzBXwMC1Q4Pt4iFhJzQZ46sUSrHirjjDCiaJAE0MIAKb/omH18ls0f35TQC4YLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685106; c=relaxed/simple;
	bh=5Ftg2etPT379GFpPIDw35S1UtArOZ/VXVn3JYr30GVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxTTktacSHraN5jHMvVICK6z/+rTpKsPl+XxLXkUS0vHbTkWv5mDncvzuwbbczgPyfLuc/sFXi2FTanSN91gaEsB7YDLlIVzeXy3/EdUl1uKvEZsWTkY9l1Xqar/S1FXFhdovNtHYBQJJuXanKcRGZRmQozx/0kbNCz0Dz2+eXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xemi6QOf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE734C4CEDF;
	Tue,  4 Feb 2025 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685105;
	bh=5Ftg2etPT379GFpPIDw35S1UtArOZ/VXVn3JYr30GVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xemi6QOf74CkswMFfsUuXpPkrkXTR87Ogrpu4pWvsPmHb7aTiqB6C1GELwAVWwGGg
	 6WDMDEEiq8z+QQZgUUaekdhP0qzuUKii3EUaA9QmD7IHXv6stAbjUtGpzbAY9p7Vwu
	 izNpvuRe7mw3VtOpHDJshwBT/bZKziqGiTvddP0mqIs4LAX0JPygs8JiifHSLQEWKR
	 9Agc8bYODKI3pJGBIyoEDg3i23hWnM+C5laeY99qtsFFvwsgXHkZkAuxLBokRlKVS0
	 m7/2BJ9GtG9ufR4gA8Yr8XMFATvq3pe4r1VKqGTztWAt3za2GvO+PhlMriR8KLKTVU
	 a8zpsSPL3wLDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfLQD-000000000Z8-3mGz;
	Tue, 04 Feb 2025 17:05:09 +0100
Date: Tue, 4 Feb 2025 17:05:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
	bryan.odonoghue@linaro.org, neil.armstrong@linaro.org,
	nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
	stefan.schmidt@linaro.org, lujianhua000@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6I6tUa9W0jBbfqf@hovoldconsulting.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
 <812c4f61-724c-cee8-b7c9-a799ade0631c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <812c4f61-724c-cee8-b7c9-a799ade0631c@quicinc.com>

On Tue, Feb 04, 2025 at 08:38:56PM +0530, Vikash Garodia wrote:
> On 2/4/2025 3:01 PM, Johan Hovold wrote:

> > And we're still waiting to hear the answers to all of Hans' questions. I
> > still haven't seen anyone explaining why any of this is needed. You
> > could have just continued letting Venus support 8250 so presumably there
> > is some benefit in using Iris instead. Which? And is that potential
> > benefit important enough to not just wait until Iris is up to par
> > feature wise?

> They are documented in this RFC [1] as comments, and would be added in v10 as we
> conclude the ongoing discussion to handle 2 drivers during the transition phase.

Ah, I forgot about the comment. Most of that should probably go in the
cover letter and commit messages of v10 instead (and with a more
condensed comment in the code), but it does indeed seem to provide some
answers.

> [1]
> https://patchwork.kernel.org/project/linux-media/patch/20250128080429.3911091-2-quic_dikshita@quicinc.com/

Johan


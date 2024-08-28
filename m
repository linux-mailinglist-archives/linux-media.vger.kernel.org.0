Return-Path: <linux-media+bounces-17001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0805F9624CA
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B763A285986
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7F816C873;
	Wed, 28 Aug 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0FTAnkuq"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB8142E6F;
	Wed, 28 Aug 2024 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840613; cv=none; b=a9R7QH3FLPL7sCqXo+OA5+3ZhDD3zBBHdykTLIZRgWK+elxD8EVC+0QRuQnuI9kweOQYuZNL3XxOz6Iyde52ED49xJW1IPtjJ8HqIRlH5ZSFH3SXXhBW5xM2s9iPOp30m7Lrmo0gXiVIpvJl0n+nKJnH6WUQhsmxo5IVdzdcgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840613; c=relaxed/simple;
	bh=v4mNzuXWMR5xVj/YDdlp+dtthC0549x9mum6fXktL+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=le8HoVbKT10dg9YNoPWSCmSy0Yu81ltcBikYGORRNgVXqTsCZmKQicQFcaY9A2TynAJqoO9PbvquIK4CAjn2vM3cu1dgurZYIlTtY6yO/07gvStgP5cUtkVo6cI2ByAu4GFt5mM1ENG8xtjhaa1og8X/YKYAiWBfRaMGs/+6NPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0FTAnkuq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aFQK/ZLIDbeLUcGWGrZVvPLgm/ml3PTfZm4/e+yiKXc=; b=0FTAnkuq+zHry0MHA3HaPY0gHg
	jEqvz5OWzxRwj3v6Bpvrz99N2hOXjox1zDzA+fsuX30tst99rscyOChpM2vRkYIGhksA9fPbUfoX4
	5luES/5Ns6CW1i0Jy84FETYYSuDCsFuMlC9naAXZh2a4XwffugZa+mlRCZ/QjAarmXET0L9vT+0hP
	87JAr8GgjJ6y+vX6H8mULY4q/2eWV78eU3R2rHm45R8NovJ5p0qS+XoKgLi6A4pQuxZ7lMWMn7HnO
	sXtlJTCdbtJOPVAjvsd+B28qHqvkZzMyZvZnf4Co0u2Dbb7qqo/pq8eyZkrpWx0tqxN9DFCCAlupW
	RD06O70g==;
Received: from i5e8616cd.versanet.de ([94.134.22.205] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sjFpo-0004U0-GI; Wed, 28 Aug 2024 12:23:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Alex Bee <knaerzche@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-media@vger.kernel.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: (subset) [PATCH 0/3] Add VPU support for RK3128
Date: Wed, 28 Aug 2024 12:24:38 +0200
Message-ID: <14376251.lVVuGzaMjS@diego>
In-Reply-To: <8a5f1856-823b-4cf7-a9fa-1dc6b9b54cd2@gmail.com>
References:
 <20240523185633.71355-1-knaerzche@gmail.com>
 <171690893336.1899981.5081114224300578276.b4-ty@sntech.de>
 <8a5f1856-823b-4cf7-a9fa-1dc6b9b54cd2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Sonntag, 4. August 2024, 18:42:13 CEST schrieb Alex Bee:
> Hi Heiko
> 
> Am 28.05.24 um 17:09 schrieb Heiko Stuebner:
> > On Thu, 23 May 2024 20:56:30 +0200, Alex Bee wrote:
> >> Similar to most Rockchip SoCs RK312x have hantro G1 based decoder and a
> >> hantro H1 based encoder with attached iommu.
> >>
> >> The existing drivers can be used as-is.
> >>
> >> Fluster scores:
> >>    - FFmpeg:
> >>      - H.264: 127/135
> >>      - VP8:    59/61
> >>    - GStreamer:
> >>      - H.264: 129/135
> >>      - VP8:    59/61
> >>
> >> [...]
> > Applied, thanks!
> >
> > [2/3] soc: rockchip: grf: Set RK3128's vpu main clock
> >        commit: b465223129f951d110e633a305085bd8430d7df0
> I just noticed this patch didn't make it in 6.11-rc1. While it's not really
> important for this patch as the media mainainters didn't manage to apply
> the vpu bindings patch for 6.11 anyways, it looks like all commits of your
> v6.11-armsoc/drivers aren't merged. I still haven't fully understand how
> the SoC tree *really* works, but I couldn't find a PR for this branch [0].

That was me actually forgetting that branch :-( .

With the rk3128 vpu-binding getting merged today, I just moved that
onwards to 6.12 too. I guess this time I shouln't forget ;-)


Heiko




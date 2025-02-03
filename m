Return-Path: <linux-media+bounces-25533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFBDA254B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE38188455B
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8586C1863E;
	Mon,  3 Feb 2025 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0cLxay6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55E1FC114;
	Mon,  3 Feb 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572201; cv=none; b=t3miJMqt+W5kQPzM4tiPJvwFr1H8HhtLm9QIBvlPjUwUPqfEpaTBKJjVWLOm6UWCJrhlaLwB1jnQWcFP0tDyTx3NSebScB03cF0IqaTMlXDF29JeOtnItjZNsyTbwdWwRiDgk340i0JpWvTlz0DVZH2dTNFT9tdJcQep6elR/Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572201; c=relaxed/simple;
	bh=FwAUacQljcRZFF1xn1SPGI9pnq7pl2aJpEklQbzKrpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc6tv1HbdoZoTvzuAXgy3qxCKIbSxVcBP6HhBHTF7mUY4R8M+gofcULgEiKUNChqBTBV7wq7BqeA0Q8waocePsq5JjmDF+WUAEvt4MxZcOIfvP1GZbWLtQitFtC+9cDAPKFSlewjmByqCZ7nUfNkNWvVsjkvSpCIIu6OYXOCQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0cLxay6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F56C4CED2;
	Mon,  3 Feb 2025 08:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738572201;
	bh=FwAUacQljcRZFF1xn1SPGI9pnq7pl2aJpEklQbzKrpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0cLxay68+wcUcOaB5u70pr54xWiiBRliaGDFPenjvefwsxm4WejrQS60RvrSgunQ
	 x5zv2KiOMPjiahxLsnkif7BbPuWnEN3CThF2crQOxjEffEq/rqthvZMi2H13SiZX6r
	 il+uujWR8DYTJaucNXxZTMfMMX0nW9RbN4liywSx0BMmjrFFyB4JY4SezEZxTH1rl3
	 FlZHQKhAJXRqzLwxlAP2/jcKY1qRPk7MxGOfv5DQSAn1R53CeYI4UPA9avojfe86w9
	 B2rN6pG2+kVgq7F3TDPviDA7l2DzOR0+rYL1wScr3mD2c1xRf0IUFDubB8GjJLFop9
	 sCsFUdT5jIudw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tes3A-000000006dj-32tz;
	Mon, 03 Feb 2025 09:43:24 +0100
Date: Mon, 3 Feb 2025 09:43:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Stefan Schmidt <stefan.schmidt@linaro.org>
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
Message-ID: <Z6CBrMus4SdSG9oF@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <Z3_kLJ6Oy6m9D_wU@hovoldconsulting.com>
 <CAEvtbuvHUF6tEiFOUUtqLh5hHf_Us+yA6TwtcmokM26v+QBLgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEvtbuvHUF6tEiFOUUtqLh5hHf_Us+yA6TwtcmokM26v+QBLgg@mail.gmail.com>

On Wed, Jan 22, 2025 at 04:34:51PM +0100, Stefan Schmidt wrote:
> On Thu, 9 Jan 2025 at 15:58, Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Dec 12, 2024 at 05:21:22PM +0530, Dikshita Agarwal wrote:

> > > Introduce support for Qualcomm new video acceleration hardware i.e.
> > > iris, used for video stream decoding.
> >
> > > Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> > > be unstable!" is seen during bootup.  It doesn't impact any video
> > > usecase and is currently under discussion.
> >
> > This could be an indication that some resources are not described
> > correctly and could potentially require both binding and driver changes
> > to address.
> >
> > This is also something which could cause trouble later (e.g. during
> > suspend) even if you manage to get the clock running after boot.
> >
> > Generally, you should not be introducing any new warnings; they are
> > there to let you know that something is wrong.
> >
> > Where is this issue being discussed?
> >
> > I think we at least need a public analysis and understanding of the
> > problem before merging this.
> 
> Taniya Das proposed a patchset to reconfigure PLL in the clk-alpha-pll
> which allows the videocc-sm8550 driver to configure it correctly.
> https://lore.kernel.org/linux-arm-msm/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/T/
> 
> I tested the Iris driver with this patchset and I am no longer seeing
> the Lucid PLL latch failed warning.

Thanks for the pointer. Please make sure to reference this series (and
summarise the underlying issue) when resending this series.

Judging from a quick look the approach taken there seems like a bit of a
hack so it may not get merged in its current form. IIUC fixing the PLL
issue properly may depend on adding support for multiple power domains
to the clock drivers.

Johan


Return-Path: <linux-media+bounces-9700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD68A97E8
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 12:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 541371C20492
	for <lists+linux-media@lfdr.de>; Thu, 18 Apr 2024 10:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23C315E5CA;
	Thu, 18 Apr 2024 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M6E1BxnR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3615DBD8;
	Thu, 18 Apr 2024 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713437602; cv=none; b=Q/vFqW0iUQ+wCW/qEpvmynOc8+nDRlB9FG999dbtFUdD0E+KGsgENpbFZOkVzJOGM3Js+RiEOdgJUfYSCrL6oH4MvMc4sxen3uD7WrE4ZH98B4Fd122RWkhq0eLU24Xu4dhXrm6cWMYlgyOhTBdyOYREz7BB1LzOGitZ3ehmt+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713437602; c=relaxed/simple;
	bh=y44ptJ3mDFUWxmkBcurUdX8DIYAovhjAxSbpW9R/eNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBvX7QokVICKIa9GvRbG85F3P2lclry895nFjdGP8RgYW00b8vFIl8ZqtkVdyVAuEOakeeFfncsJQDPV2SyM1b2Q7QyKCKTCTNqcVfU2Z8e75DehNcEZk+dQ9q3qeA4dkGN2zGAbkUfqoZ1W3IlX0IPUVkHZA5HxoJdYHI2ZfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M6E1BxnR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9034827;
	Thu, 18 Apr 2024 12:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713437549;
	bh=y44ptJ3mDFUWxmkBcurUdX8DIYAovhjAxSbpW9R/eNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6E1BxnRdcjsS4JSj03zg7VJHuDZPXJ+ccXs0PNg0Q6+F9PZypIPKnmHsM7+MY+QG
	 i4OWslc7wfgQ8vqT7fK1OBDEdeUb+3KXLPbYZy4/Py4vKtQ7bl65D6tTnVXUuYzsgG
	 Q/FjedEb+g0AcsE72tr78ry7U9NTypqT9lt5kX70=
Date: Thu, 18 Apr 2024 13:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
Message-ID: <20240418105310.GV12561@pendragon.ideasonboard.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
 <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>

Hi Ricardo,

On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > In my opinion, it's better to just ignore old warnings.
> >
> > I agree. Whatever checkers we enable, whatever code we test, there will
> > always be false positives. A CI system needs to be able to ignore those
> > false positives and only warn about new issues.
> 
> We already have support for that:
> https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

Those are manually written filters. Would it be possible to reduce the
manual step to flagging something as a false positive, and have a
machine build the filters ?

> But it would be great if those lists were as small as possible:
> 
> - If we have a lot of warnings, two error messages can be combined and
> will scape the filters
> eg:
> print(AAAA);
> print(BBBB);
> > AABBBAAB
> 
> - The filters might hide new errors if they are too broad
> 
> 
> Most of the patches in this series are simple and make a nicer code:
> Eg the non return minmax() ,
> Other patches show real integer overflows.
> 
> Now that the patches are ready, let's bite the bullet and try to
> reduce our technical debt.
> 
> > > When code is new the warnings are going to be mostly correct.  The
> > > original author is there and knows what the code does.  Someone has
> > > the hardware ready to test any changes.  High value, low burden.
> > >
> > > When the code is old only the false positives are left.  No one is
> > > testing the code.  It's low value, high burden.
> > >
> > > Plus it puts static checker authors in a difficult place because now
> > > people have to work around our mistakes.  It creates animosity.
> > >
> > > Now we have to hold ourselves to a much higher standard for false
> > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > Drokin has told me previously that I spend too much time trying to
> > > silence false positives instead of working on new code.  He's has a
> > > point which is that actually we have limited amount of time and we have
> > > to make choices about what's the most useful thing we can do.
> > >
> > > So what I do and what the zero day bot does is we look at warnings one
> > > time and we re-review old warnings whenever a file is changed.
> > >
> > > Kernel developers are very good at addressing static checker warnings
> > > and fixing the real issues...  People sometimes ask me to create a
> > > database of warnings which I have reviewed but the answer is that
> > > anything old can be ignored.  As I write this, I've had a thought that
> > > instead of a database of false positives maybe we should record a
> > > database of real bugs to ensure that the fixes for anything real is
> > > applied.

-- 
Regards,

Laurent Pinchart


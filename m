Return-Path: <linux-media+bounces-13126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38890905F88
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 02:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93ABAB224DB
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 00:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE24B652;
	Thu, 13 Jun 2024 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FwXPUSvW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB2237C;
	Thu, 13 Jun 2024 00:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718237156; cv=none; b=WrOPFcnAda4GisamcWVZvgb5MpuuZ3t5Kjjpziz+rlmrb0mM4eUy1tWLljvNHiXuJgyUZYW20mSzmYrarV8LykmZHAlShQPvFqn2geWZ47acwsIdG9xNSe2QwJ6qsQNkyJMrTbgJDCNNwJ/Eqar0NEN91df67wxo/bK28T1/XuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718237156; c=relaxed/simple;
	bh=LyIhlSiU9zms9Jq6SWfnbAsKlxdZw4+/KwF9352sHTY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=IEMzkdS6sy5XtcRJlE7hSDgI1O/WEl4Z3PMLqvvm86zkJ9/7omBBaNpLRQkricDMs8O5tiFf6QBbsjdlDExoYpANyezHR3gPkHPJqDyCYuqwdUs2Mr1flZCJFrXGIuu8yzbz72mt/9SxfInrkZIAhFnarsEoTesIDm7rReKaKf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FwXPUSvW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B34084CF;
	Thu, 13 Jun 2024 02:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718237137;
	bh=LyIhlSiU9zms9Jq6SWfnbAsKlxdZw4+/KwF9352sHTY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FwXPUSvWiXUazK7DEGkvRf0HY5wqzfYeiI6bYiS+dLfNMyQKK8famyXXoP5livdzX
	 T7TVgbrIuiF2lfjP4FATiND5v8os2zxuoMu5xzp4qmE82HYFr06p/tiwX2JgkjNF1k
	 X7Z3sH2Tdyx8GB/P2JxWv+XFdtOkXfS0WTQgDDJs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
References: <20240612012019.19078-1-zhi.mao@mediatek.com> <20240612012019.19078-3-zhi.mao@mediatek.com> <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com> <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: heiko@sntech.de <heiko@sntech.de>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>, laurent.pinchart+renesas@ideasonboard.com <laurent.pinchart+renesas@ideasonboard.com>, yunkec@chromium.org <yunkec@chromium.org>, linux-mediatek@lists.infradead.org <linux-mediatek@lists.infradead.org>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, hdegoede@redhat.com <hdegoede@redhat.com>, bingbu.cao@intel.com <bingbu.cao@intel.com>, paul.elder@ideasonboard.com <paul.elder@ideasonboard.com>, devicetree@vger.kernel.org <devicetree@vger.kernel.org>, andy.shevchenko@gmail.com <andy.shevchenko@gmail.com>, Yaya Chang =?utf-8?b?5by16ZuF5riF?= <Yaya.Chang@mediatek.com>, Shengnan Wang =?utf-8?b?546L5Zyj55S3?= <shengnan.wang@mediatek.com>, p.zabel@pengutronix.de <p.zabel@pengutronix.de>, alain.volmat@foss.st.com <alain.volmat@foss.st.com>, sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>, tomi.valkeinen@ideasonboard.com <tomi.valkeinen@ideasonboard.com>, 10572168@qq.com
  <10572168@qq.com>, hverkuil-cisco@xs4all.nl <hverkuil-cisco@xs4all.nl>, linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>, matthias.bgg@gmail.com <matthias.bgg@gmail.com>, mehdi.djait@bootlin.com <mehdi.djait@bootlin.com>
To: Zhi Mao =?utf-8?b?5q+b5pm6?= <zhi.mao@mediatek.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org, dongchun.zhu@mediatek.com
Date: Thu, 13 Jun 2024 01:05:49 +0100
Message-ID: <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Zhi,

Also - Cc: Dongchun Zhu <dongchun.zhu@mediatek.com> who is listed as the
DW9768 VCM driver author...

Quoting Zhi Mao (=E6=AF=9B=E6=99=BA) (2024-06-12 12:13:40)
> Hi Angelo,
>=20
> Thanks for your review.
>=20
> On Wed, 2024-06-12 at 09:07 +0200, AngeloGioacchino Del Regno wrote:
> > Il 12/06/24 03:20, Zhi Mao ha scritto:
> > > Add a V4L2 sub-device driver for Giantec GT97xx VCM.
> > >=20
> > > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> >=20
> > Hello Zhi,
> >=20
> > I fail to see why would you need to upstream this new driver instead
> > of
> > simply adding the IC_INFO_REG to the already existing (and more
> > featureful)
> > dw9768 driver, which also seems to support the Giantec GT9769 VCM.

Even more so especially as
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/i2c/dw9768.c
already directly supports the compatible strings added by this driver -
surely we don't want multiple (near identical) drivers matching the same
compatible string?

> >=20
>=20
> Our project uses Giantec VCM hardware.=20
> For detailed vendor information, please visit: (
> https://en.giantec-semi.com/yqmd/164).=20
> The VCM datasheet we are referencing is provided by Giantec.=20
> Currently, the relationship between Giantec VCM and Dongwoon VCM is
> unclear, but Dongwoon seems to be another manufacturer of VCM
> hardware.=20
>=20
> From the perspective of software driver development and maintenance, it
> makes sense for each vendor's hardware should have its own software
> driver.

Personally, I don't think so. If two vendors make identical parts, we
shouldn't have two identical drivers.

I still have plans to refactor VCM drivers if I get some spare-time(tm)
as almost each driver does the same identical task. They're all just
copies of the boilerplate.  That seems like something we should reduce,
not increase.

--
Kieran


> So, I upstream a new VCM driver for Giantec.
>=20
> > Cheers,
> > Angelo


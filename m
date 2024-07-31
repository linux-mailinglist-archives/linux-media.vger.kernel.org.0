Return-Path: <linux-media+bounces-15645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0494315C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 15:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 645061F22103
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 13:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A061B29C6;
	Wed, 31 Jul 2024 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MAMVHZj3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862EC1A7F7F;
	Wed, 31 Jul 2024 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433888; cv=none; b=CIaD7PGxjvIxR+rrMl47iL5btDpyn2i277Uby20c9zJJ3VjoFaN4mwzDGxZuzDMRs/dKGxGfLcA/bwgJ07K0h6OkyOWdbZzhQlNnpB0rNKGbExJC9ZWFRN2xIDsBmYQqbZXE6RotgIDvQevKzUf6E6sSlILe6U4j/dFM0S9N0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433888; c=relaxed/simple;
	bh=xpw6F7XSh7e3ShH1slcaKE1e0vMjHFOJ5tOhmnzsnBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRKJPZTYdpBN8JuyyZe5iSwfjS5jDPWG5mQ7BODL2kMZx1BlMqHL1DfqNfUDbm0QXemEbICWv/wNKhnHJZgRi2hoN1eag+abh1wAaAvyZmmwXzRUPGTj+6F1IBnZwOvT7NhB2uDexFicPOKoiF4G1yAUUK455MktQc93gy79XJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MAMVHZj3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8822F85;
	Wed, 31 Jul 2024 15:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722433836;
	bh=xpw6F7XSh7e3ShH1slcaKE1e0vMjHFOJ5tOhmnzsnBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAMVHZj3PrsxK4q8G25hetinqKao+Hx7PUY/cPDME1vWAvnDF8YD5F8SHyOure/hF
	 8hHUs4nq9FOq56V8IQ35NAApiQ6oF2MawjnrtHbsHkES+ysUfU2tAaYo8kQqkkT+pR
	 zQa+qiLM2XJJwfNBxjGSXJfR+tf0J2KY7TFk0nmM=
Date: Wed, 31 Jul 2024 16:51:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Message-ID: <20240731135103.GE12477@pendragon.ideasonboard.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
 <20240730132931.GM1552@pendragon.ideasonboard.com>
 <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>

On Wed, Jul 31, 2024 at 03:33:59PM +0200, Julien Stephan wrote:
> Le mar. 30 juil. 2024 à 15:29, Laurent Pinchart a écrit :
> [...]
> > > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, DPHY_MODE, 0 /* 4D1C*/);
> >
> > As this is a V4L2 driver, I'm pretty sure someone will ask for
> >
> >                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
> >                                   DPHY_MODE, 0 /* 4D1C*/);
> >
> > I wouldn't care too much about going slightly over 80 characters, but
> > getting close to 100 where lines could be wrapped without hindering
> > readability will likely upset some people. Same in other places where
> > applicable.
> 
> Hi Laurent,
> 
> On an early version of this series, Angelo asked me to un-wrap lines
> that can fit into 100 chars...
> Both are fine for me, we just need to agree on something here ....

For new V4L2 drivers I have a preference for a soft 80 columns limit,
but I don't insist too much usually. Some other V4L2 core developers do
insist more.

> [...]
> > > +     /* Configure timestamp */
> > > +     writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
> >
> > Can we have a mtk_seninf_input_write(), the same way we have
> > mtk_seninf_mux_write() ? Same for writes to priv->base below, with a
> > mtk_seninf_write() inline function.
> 
> ... and here :) In an early review Angelo also  asked me to remove
> these accessors.
> 
> I can add them back and reduce line chars if needed.

With my V4L2 hat, trying to achieve some level of consistency between
drivers in the subsystem, I'd like to have wrappers around writel() and
readl(). Angelo, I hope you don't mind my overruling you in this case.

-- 
Regards,

Laurent Pinchart


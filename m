Return-Path: <linux-media+bounces-33664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E9AC9065
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8D311883E9A
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C43227EBF;
	Fri, 30 May 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fS7CR5L4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B317921517C;
	Fri, 30 May 2025 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612310; cv=none; b=JYOGMswRlRMyJ8VfIdZ1hhtnmHyEAARPRBLJCoOuJjI7xuKn3eg1b4aVH1467rXGSGSNCb2JyUPWJJIa/VFf485L/vHfHryg46G46g9ZKIFS4NI7yk7rJd+frs3FzybJiEdQ/mfJiqBd4vIWEEjx5a++JXGhm4tZP1Ch9qZ50nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612310; c=relaxed/simple;
	bh=okfO53B1MuctCihtZiKCNsiS2kQIh+Mos6rbOD+jj8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doT5GyW6Za1k5TC48tlXVlhePDTDoBgStGZlFjcTVWHG9QBeiOKYeGHoZNe2OyNx0U8YnqKBQhMoaMXOfjFzq/O+wAi4TI1wKyLI1yPKzlrtRoi+w4xJij7+5u/zmalHSlwA0Nex1O5Qrty45/9smiXfkyauAljIhGlPfKbQXOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fS7CR5L4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E526B89A;
	Fri, 30 May 2025 15:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748612279;
	bh=okfO53B1MuctCihtZiKCNsiS2kQIh+Mos6rbOD+jj8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS7CR5L4Ri4EdInT3VKvDyb4ZXdL/n+8OpunXXsCmRhOXqrkJ6Q5//0GsYph7dK8l
	 kEMESAjHk2eGNgfCRLFyQDSLpN39BLQFipBgjTOVnFrq4VlqqRPy8qE2hNNkmOume6
	 pHhpqq783sFSsnRku5ADvJcGbzyCvA8LKu5xMOv8=
Date: Fri, 30 May 2025 16:38:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	ALOK TIWARI <alok.a.tiwari@oracle.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
Message-ID: <20250530133820.GC18205@pendragon.ideasonboard.com>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
 <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com>
 <20250511200333.GA2365307@ragnatech.se>
 <CAMuHMdUbMRBFV-7hDMQ3-UKAhzfbGM5yZJz05aGAHpOKZ5eKcQ@mail.gmail.com>
 <20250512084843.GE2365307@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512084843.GE2365307@ragnatech.se>

On Mon, May 12, 2025 at 10:48:43AM +0200, Niklas Söderlund wrote:
> On 2025-05-12 09:37:48 +0200, Geert Uytterhoeven wrote:
> > On Sun, 11 May 2025 at 22:03, Niklas Söderlund wrote:
> > > On 2025-05-12 00:37:09 +0530, ALOK TIWARI wrote:
> > > > On 11-05-2025 23:17, Niklas Söderlund wrote:
> > > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0404);
> > > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x040c);
> > > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x0414);
> > > > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0x041c);
> > 
> >  [...]
> > 
> > > > Instead of manually writing each call, it could use a loop ?
> > > >
> > > > for (int i = 0x0404; i <= 0x07fc; i += 0x08) {
> > > >     rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, i);
> > >
> > > Unfortunately the values are not all sequential, see the progression
> > > 0x061c -> 0x0623 and 0x071c -> 0x0723 for example.
> > >
> > > > or if values are not strictly sequential, iterating over the array.
> > > > static const u16 register_values[]= {0x0404, 0x040c, 0x0414 etc,,}
> > > > rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG,
> > > > register_values[i]);
> > >
> > > I agree with you, a array of values would make this look a tad less
> > > silly and would reduce the number of lines. I considered this while
> > > writing it but opted for this. My reason was as most of the register
> > > writes needed to setup the PHY are not documented in the docs I have and
> > > I wanted to keep the driver as close to the table of magic values I have
> > > to make it easy to compare driver and the limited documentation.
> > >
> > > I guess it's really a matter of style. I have no real strong opinion, if
> > > people think an array would be nicer I have no issue switching to that.
> > 
> > Have you looked at the impact on kernel size?
> 
> That is a good point, I'm sure an array would reduce the kernel size. I 
> could possibly even craft a few clever loops to to generate the values 
> as they are almost sequential. As these are magic values I had opted to 
> keep it close to the docs, but seems people prefere something else. Will 
> change this and send new version.

I recommend an array of values. That will significantly reduce the size,
while keeping the code easy to compare with the documentation. We can
try to be more clever than that in a separate patch if desired.

-- 
Regards,

Laurent Pinchart


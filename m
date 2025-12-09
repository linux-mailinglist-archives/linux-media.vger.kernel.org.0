Return-Path: <linux-media+bounces-48468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A38CAFDE9
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 13:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 526933010E26
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612483218A6;
	Tue,  9 Dec 2025 12:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JaJBj2PN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208A28CF42;
	Tue,  9 Dec 2025 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282011; cv=none; b=DQ9YMSSPm29dAHNMAcYcWfyDS2SA8nEH07JCaGZgqFZwZfD7yvmG8/P5IYjok2xz/FvquVv0NjbN83vH4ULdOG1EhjASlMoirlO/3iO0FJFZ7IiZtD7yGzgpcKv+asOgPri0atb2WuxX333jCC2xDKn7EAdta1WYLkpHgNLluNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282011; c=relaxed/simple;
	bh=Wfzvf4SfA+dZX+wTPJwevOS9BDPLIu5wLsr/P3PyK28=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dD+pMSlD2FZ3MNhLN+kyfgH04gPHobm3W2kMSwaC+gmIA3TdlF3Fij6WHybMg7Xqmm0JtnVr5E+oPVxzI5eHE3JHtXCixB+nnZjfp2vTiXmdRkJox1fB39+rSZ4VnvBFLcFgk7IJkESDrdYPPLxG28z6cJMn2TCgWnXBOz172QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JaJBj2PN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:3dca:74fd:8a0a:9c63:1c11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D730B667;
	Tue,  9 Dec 2025 13:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765282004;
	bh=Wfzvf4SfA+dZX+wTPJwevOS9BDPLIu5wLsr/P3PyK28=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JaJBj2PNv4OeRqDCuUeBhSJ1V3yJKgS35tk5UPa1+ZQZk7KiKbxcb/m4PqInL7Cau
	 ESSlldDCw5HpKp+1hsDCP81Vmn8dOmfCWneCW0Kndbu0ocXzuJyCTqDiuhOZZjE0IP
	 yd35PMG0oQSbCgPFA7w4CCTfrQYlRNTc2OSOz+VI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4854792f-e682-4291-89c4-c0139a6c24bc@ideasonboard.com>
References: <20251112115459.2479225-1-r-donadkar@ti.com> <20251112115459.2479225-14-r-donadkar@ti.com> <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com> <719ee15a-92fd-4597-b25e-196f4a906a5a@ti.com> <176527657688.20066.3405220622225469005@freya> <4854792f-e682-4291-89c4-c0139a6c24bc@ideasonboard.com>
Subject: Re: [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 09 Dec 2025 17:36:39 +0530
Message-ID: <176528199956.20066.17866034505160159556@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Quoting Tomi Valkeinen (2025-12-09 17:22:08)
> Hi,
>=20
> On 09/12/2025 12:36, Jai Luthra wrote:
> > Hi Rishikesh,
> >=20
> > Quoting Rishikesh Donadkar (2025-12-09 15:38:33)
> >>
> >> On 01/12/25 18:33, Tomi Valkeinen wrote:
> >>> Hi,
> >>
> >>
> >> Hi Tomi,
> >>
> >> Thank you for the review !
> >>
> >>>
> >>> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> >>>> From: Jai Luthra <j-luthra@ti.com>
> >>>>
> >>>> Each CSI2 stream can be multiplexed into 4 independent streams, each
> >>> Well, that's not true, at least generally speaking (there can be more
> >>> than 4). Is that specific to TI hardware?
> >>
> >>
> >> Yes, The commit message talks about how TI CSI does the multiplexing o=
f=20
> >> CSI stream from the sensor into 4 streams as show in the Figure 12-388=
=20
> >> in AM62A TRM[1]. I will modify the commit message to mention that this=
=20
> >> is TI CSI specific.
> >=20
> > Figure 12-388 shows the internal pixel stream coming from Cadence to
> > different hardware blocks like TI's Shim (DMA) and VP0 (ISP) and VP1. I
> > don't see that being related to CSI2 VC/DT support, which is handled by=
 the
> > Shim using different DMA contexts and channels.
> >=20
> > In the TRM, under 12.6.1.1.1 CSI_RX_IF Features, I see:
> >  * Compliant to MIPI CSI v1.3
> >  * Supports up to 16 virtual channels per input (partial MIPI CSI v2.0 =
feature)
> >=20
> > So 16 VCs is supported by TI's CSI pipeline, despite it being MIPI CSI2
> > v1.3 compliant otherwise. I think I might have been confused with DS90U=
B960
> > while writing this commit message originally, which strictly supports a
> > maximum of 4 VCs.
> >=20
> > Secondly, even with just CSI2 v1.0 compliant source, this could
> > theoretically handle 8 "streams" of data with 4 different VCs x 2 data
> > types each. So please update the paragraph in next revision.
> Where does the "8" come from? Do we have 8 context registers, to which
> we program the VC + DT filter?

Indeed, 8 was just an example. The hardware can support upto 32
combinations, as that is the total number of DMA contexts available.

Thanks,
    Jai

>=20
> Also, it could as well be 8 streams, all with VC 0, but each different
> DT (probably unlikely scenario =3D). But I just want to highlight that VC
> is not the "stream". The "stream" is the VC+DT tuple.
>=20
>  Tomi
>


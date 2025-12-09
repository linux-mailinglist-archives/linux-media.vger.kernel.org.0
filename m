Return-Path: <linux-media+bounces-48464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B15CAFA8E
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 11:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 792C930303A4
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A915B2F5496;
	Tue,  9 Dec 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IF7lHoCB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CE2C08DC;
	Tue,  9 Dec 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765276600; cv=none; b=GypQeeGA4vO06kl4/H9gw75oAcjWHEeeH5KztTSFw4fyTTsP2wpBpl80JtcSD9D6OCegJoR6apn1BRp+8JP6hxDURFcAssPx9k50Mrj+muyjyNBogTh/pq/OmV6NNNGh6d5kyHJmocHXb0Rx1z8ylYbRCFFlqrgiA6LQ/BN+veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765276600; c=relaxed/simple;
	bh=xahUIlaehVh5FxxfTPdwDxMO0j0MxgfWUvmLAcXksMs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VzcmLc2hyMalXaE+ouQWNLBuuqwR3gfoECpFfu9qqJASY+7K6iv9Mmn+XnA3guZAesWs669MqfyCwdbqx0R0pj/px46XxFTwvT2V82kgx66f6dCbvCIhx+7Ustq+mkSZFTW55dzzvhjJfTPgmnxA7m7cOOH6Sqzfoewvme17bZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IF7lHoCB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:3dca:74fd:8a0a:9c63:1c11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4C4E89A;
	Tue,  9 Dec 2025 11:34:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765276443;
	bh=xahUIlaehVh5FxxfTPdwDxMO0j0MxgfWUvmLAcXksMs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IF7lHoCBINGUw91elaq/7JG9ch89ucyRlwOgI/55MSLa0QEsV+IJ8VJqABKvGzQST
	 GCOYtmlOklAW1XyOzF0ovRN3FQ2KOcisoIED618NV0fjJNC1FYcBCO6bAU3reCC8iq
	 EQn/7bDJ/MdFRcemLXdfdLrJt1g86r70ObdTiHzk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <719ee15a-92fd-4597-b25e-196f4a906a5a@ti.com>
References: <20251112115459.2479225-1-r-donadkar@ti.com> <20251112115459.2479225-14-r-donadkar@ti.com> <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com> <719ee15a-92fd-4597-b25e-196f4a906a5a@ti.com>
Subject: Re: [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 09 Dec 2025 16:06:16 +0530
Message-ID: <176527657688.20066.3405220622225469005@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Rishikesh,

Quoting Rishikesh Donadkar (2025-12-09 15:38:33)
>=20
> On 01/12/25 18:33, Tomi Valkeinen wrote:
> > Hi,
>=20
>=20
> Hi Tomi,
>=20
> Thank you for the review !
>=20
> >
> > On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> >> From: Jai Luthra <j-luthra@ti.com>
> >>
> >> Each CSI2 stream can be multiplexed into 4 independent streams, each
> > Well, that's not true, at least generally speaking (there can be more
> > than 4). Is that specific to TI hardware?
>=20
>=20
> Yes, The commit message talks about how TI CSI does the multiplexing of=20
> CSI stream from the sensor into 4 streams as show in the Figure 12-388=20
> in AM62A TRM[1]. I will modify the commit message to mention that this=20
> is TI CSI specific.

Figure 12-388 shows the internal pixel stream coming from Cadence to
different hardware blocks like TI's Shim (DMA) and VP0 (ISP) and VP1. I
don't see that being related to CSI2 VC/DT support, which is handled by the
Shim using different DMA contexts and channels.

In the TRM, under 12.6.1.1.1 CSI_RX_IF Features, I see:
 * Compliant to MIPI CSI v1.3
 * Supports up to 16 virtual channels per input (partial MIPI CSI v2.0 feat=
ure)

So 16 VCs is supported by TI's CSI pipeline, despite it being MIPI CSI2
v1.3 compliant otherwise. I think I might have been confused with DS90UB960
while writing this commit message originally, which strictly supports a
maximum of 4 VCs.

Secondly, even with just CSI2 v1.0 compliant source, this could
theoretically handle 8 "streams" of data with 4 different VCs x 2 data
types each. So please update the paragraph in next revision.

Thanks,
    Jai

>=20
>=20
> [1]:=20
> https://www.ti.com/lit/ug/spruj16c/spruj16c.pdf?ts=3D1765273774405&ref_ur=
l=3Dhttps%253A%252F%252Fwww.ti.com%252Fproduct%252FAM62A7
>=20
>=20
> >
> >> identified by its virtual channel number and data type. The incoming
> >> data from these streams can be filtered on the basis of either the
> >> virtual channel or the data type.
> >>
> >> To capture this multiplexed stream, the application needs to tell
> >> the driver how it wants to route the data. It needs to specify
> >> which context should process which stream. This is done via the
> >> new routing APIs.
> >>
> >> Add ioctls to accept routing information from the application and save
> >> that in the driver. This can be used when starting streaming on a
> >> context to determine which route and consequently which virtual channel
> >> it should process.
> >>
> >> De-assert the pixel interface reset on first start_streaming() and ass=
ert
> >> it on the last stop_streaming().
> >>
> >> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> >> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> >> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> >> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> >> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> >> ---
> >>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 224 ++++++++++++++--=
--
> >>   1 file changed, 179 insertions(+), 45 deletions(-)

[snip]


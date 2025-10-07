Return-Path: <linux-media+bounces-43836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC3BC1437
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596643BEC93
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 11:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA922DC336;
	Tue,  7 Oct 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RvnpCRIB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEC35972;
	Tue,  7 Oct 2025 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837958; cv=none; b=sNzd0aASk/iwIt4eBNP0Q9Z0xg3yeeFCEz23BMs3rhBdWs747FotMzIIAexybTqGbkQiE2kszRLbssQqG3TzAdJjnHJHJcRDBDIrQChnItP8PxFyAZSfEunwd+sodVtreivTa7YHYqCmvayEVkCk+s3UvN6Tpn8Il7PCoIguxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837958; c=relaxed/simple;
	bh=2AJflxKtq5+v/023pQVHuifTumNDGfX1QboKFC1H4FU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OIvIzqPSRL0HTBHm42YOGn7/4JxOdua8rlDLrjibFHf68Q/tzd84CcN+0R6ElJeCrSoyDapAN7Xi9buvT18xxUb3OQJr2eAwVgPqCQQdPMkQDJXCFhm78VwJAvxL1iLSuQjWIa1iMS63UyipBn/f5TlJpoutCT/+FfPB4E4xc0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RvnpCRIB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:b33c:92a2:e532:1826:f0a3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21363669;
	Tue,  7 Oct 2025 13:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759837854;
	bh=2AJflxKtq5+v/023pQVHuifTumNDGfX1QboKFC1H4FU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RvnpCRIBN+6SjgAtNl6l0INcZPkGtNBUIKyRveCE3j0hGKx4f6kGbakDhkxMySU18
	 6DlIiNWg0tnHE+0bK1hykgW6u/RE15anNDIEnhy/SMoM4Pt1SOFKhFylS6ySWldHtO
	 37/Fnwu+TDbxNALcv14a2zvCrWWp0PqIviNSiAEM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4534a09b-7eef-4e61-835a-c70d07df3416@ideasonboard.com>
References: <20250911102832.1583440-1-r-donadkar@ti.com> <20250911102832.1583440-12-r-donadkar@ti.com> <4534a09b-7eef-4e61-835a-c70d07df3416@ideasonboard.com>
Subject: Re: [PATCH v7 11/16] media: ti: j721e-csi2rx: add multistream support
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Tue, 07 Oct 2025 17:22:22 +0530
Message-ID: <175983794202.36451.17500767517117494893@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Tomi,

Quoting Tomi Valkeinen (2025-09-25 17:47:38)
> Hi,
>=20
> On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> > From: Jai Luthra <j-luthra@ti.com>
> >=20
> > Each CSI2 stream can be multiplexed into 4 independent streams, each
> > identified by its virtual channel number. To capture this multiplexed
>=20
> The split can also be done with the datatype. I don't see it supported
> in the driver, but afaics the HW supports it. Was there a reason not to
> support DT filtering? I would think it would be very simple addition.
>=20

I believe DT filtering should work as-is with the current driver, given we
program the SHIM DMACNTX register with the correct datatype depending upon
the v4l2 format of the video node.

So if there is multi-stream source with two different datatypes, it should
be possible to route it to different video devices and it "just" works. But
I agree that it would be good if it can be tested once, and this commit
message can mention that both VC and DT based filtering is supported.

Rishikesh, would you be able to use an IMX219 to test capturing embedded
data and frame data?

>  Tomi
>=20

Thanks,
    Jai

> > stream, the application needs to tell the driver how it wants to route
> > the data. It needs to specify which context should process which stream.
> > This is done via the new routing APIs.
> >=20
> > Add ioctls to accept routing information from the application and save
> > that in the driver. This can be used when starting streaming on a
> > context to determine which route and consequently which virtual channel
> > it should process.
> >=20
> > Support the new enable_stream()/disable_stream() APIs in the subdev
> > instead of s_stream() hook.
> >=20
> > De-assert the pixel interface reset on first start_streaming() and asse=
rt
> > it on the last stop_streaming().
> >=20
> > Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

[snip]


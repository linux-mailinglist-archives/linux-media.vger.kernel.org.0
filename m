Return-Path: <linux-media+bounces-14315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5098291BB90
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BDDA28391C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B77152E00;
	Fri, 28 Jun 2024 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ls8yHE2m"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1531CD32;
	Fri, 28 Jun 2024 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567340; cv=none; b=KM9p74mfUpVbJqxhIj5fZ9yiUltowGuTyx4GvzJ1Bj4IzbAdQEov12KIkEt9rhs654V7yNwbrdVvfuKvvS7iQXXLQjxYKURevQleGjSWy0+VafAwyca2++halnYW/+YkxfyGT9FtZzbFeXM7CKAhcZg+ZU8vht3Sz7sdWSDjESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567340; c=relaxed/simple;
	bh=hjiIfz72Bk2cugfGhtbE90kF7F6N0LOlLITfx0DKqA4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vA7LVzJL7xsMuOkHngOpIgkF2RdGjX336cvMuRZrfCL5wrUSkhXx1O2XeG4F+qtTJv2omlXLv6x2dXaFJ+sbdiOcV0u92DT5kCA9PmowH8JqnNEr3HLC+JdVEZY+Y68yjNVa5h3eMsqxJQpeEY9d1U/3qNaZE4Qbz7BfKpDOofM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ls8yHE2m; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45S9ZMMu039653;
	Fri, 28 Jun 2024 04:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719567322;
	bh=nU2b9U9/eq2O0U7zidGrCy9Ko1KMfa4NRadBXwQEG88=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ls8yHE2moWAnON2B7c2RgkCmsDV3Z7ZdO+x1570Uwkdbt0kiysX+lBaSzUa0SXaLf
	 9O/qjXtjqmWK4w2kj4OBhaVcNUyjO0pKPApUbg31JgbngCtoSKuHCqyazeh9AyKyEM
	 rAfs+wEzuu+9aAKhvVyrnRyPPJWXZSpIFl3a3KG0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45S9ZMl6128979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 04:35:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 04:35:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 04:35:22 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45S9ZLUr104010;
	Fri, 28 Jun 2024 04:35:22 -0500
Date: Fri, 28 Jun 2024 15:05:21 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
Subject: Re: Re: [PATCH v2 00/13] media: cadence,ti: CSI2RX Multistream
 Support
Message-ID: <kge5gelwwiukrupotdjiaj6rr2yxplumnhh5q4jjak3nyp35td@ctwvefoevxzx>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <99fda0f2-57e9-4b37-a848-b7781f3b1dd7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <99fda0f2-57e9-4b37-a848-b7781f3b1dd7@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Tomi,

On Jun 28, 2024 at 11:26:59 +0300, Tomi Valkeinen wrote:
> Hi Jai,
> 
> On 27/06/2024 16:09, Jai Luthra wrote:
> > This series adds multi-stream support for Cadence CSI2RX and TI CSI2RX
> > Shim drivers.
> > 
> > PATCH 1:	Runtime Power Management for Cadence CSI2RX
> > PATCH 2-7:	Support multiple DMA contexts/video nodes in TI CSI2RX
> > PATCH 8-9:	Use get_frame_desc to propagate virtual channel information
> > 		across Cadence and TI CSI-RX subdevs
> > PATCH 10-12:	Use new multi-stream APIs across the drivers to support
> > 		multiplexed cameras from sources like UB960 (FPDLink)
> > PATCH 13:	Optimize stream on by submitting all queued buffers to DMA
> > 
> > This applies on top of today's linux-next (next-20240626)

This series is based on top of next-20240626 

> > (also tested rebase with media_stage.git master)
> > 
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> > Changes in v2:
> > 
> > - Change the multi-camera capture architecture to be similar to that of
> >    Tomi's RPi5 FE series, where the driver will wait for userspace to
> >    start streaming on all "actively routed" video nodes before starting
> >    streaming on the source. This simplifies things a lot from the HW
> >    perspective, which might run into deadlocks due to a shared FIFO
> >    between multiple DMA channels.
> > 
> > - Drop a few fixes that were posted separately and are already merged
> > - Fix dtschema warnings reported by Rob on [02/13]
> > - Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
> > - Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
> >    streaming
> > - Only allow single-streams to be routed to the source pads (linked to
> >    video nodes) of the j721e-csi2rx device
> > - Squash the patches marked "SQUASH" in the v1 RFC series
> > 
> > - Link to RFC (v1):
> >    https://lore.kernel.org/r/20240222-multistream-v1-0-1837ed916eeb@ti.com
> > 
> > ---
> > Jai Luthra (8):
> >        dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
> >        media: ti: j721e-csi2rx: separate out device and context
> >        media: ti: j721e-csi2rx: add a subdev for the core device
> >        media: ti: j721e-csi2rx: add support for processing virtual channels
> >        media: cadence: csi2rx: Use new enable stream APIs
> >        media: cadence: csi2rx: Enable multi-stream support
> >        media: ti: j721e-csi2rx: add multistream support
> >        media: ti: j721e-csi2rx: Submit all available buffers
> > 
> > Jayshri Pawar (1):
> >        media: cadence: csi2rx: Support runtime PM
> > 
> > Pratyush Yadav (4):
> >        media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
> >        media: ti: j721e-csi2rx: allocate DMA channel based on context index
> >        media: ti: j721e-csi2rx: get number of contexts from device tree
> >        media: cadence: csi2rx: add get_frame_desc wrapper
> > 
> >   .../bindings/media/ti,j721e-csi2rx-shim.yaml       |  39 +-
> >   drivers/media/platform/cadence/cdns-csi2rx.c       | 440 +++++++++--
> >   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 879 ++++++++++++++++-----
> >   3 files changed, 1071 insertions(+), 287 deletions(-)
> > ---
> > base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> > change-id: 20240221-multistream-fbba6ffe47a3
> 
> You have based this series on top of your private branch. Don't do that.
> Base on top of a kernel tag, or a commonly known tree (linux-media-stage for
> example), and preferably mention the base in the cover letter.

The base commit SHA populated by b4 is the same as next-20240626 as 
mentioned above

https://gitlab.com/linux-kernel/linux-next/-/commits/df9574a57d02b265322e77fb8628d4d33641dda9

I chose to not use media-stage as the base, but this series applies 
cleanly (and compiles) on top of that as well.

> 
> Your private branch contains e.g. dtsos needed for testing. If you have such
> a branch, you should point to it in the cover letter as it's valuable for
> reviewers/testers.

Ah my bad, I missed mentioning my github branch that can be used for 
testing the content of this series. It contains some DTSOs and defconfig 
updates, along with support for FPDLink/V3Link sensors.

https://github.com/jailuthra/linux/commits/b4/multistream/

> 
> Only base on top of a private branch if your patches compile-time depend on
> something from there, and in that case point to the branch and mention this
> dependency clearly in the cover letter.

Makes sense, will take extra care to mention the dependencies and base 
branch from next version.

> 
>  Tomi
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145


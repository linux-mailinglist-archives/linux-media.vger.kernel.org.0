Return-Path: <linux-media+bounces-14318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3A91BBAC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 11:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D591F20583
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60499154C1E;
	Fri, 28 Jun 2024 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QTjSEDDE"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30877154425;
	Fri, 28 Jun 2024 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567587; cv=none; b=NT1wdblry8GNFc8X3uCohMcOyJVXOc1txqO8R+QnRfJ96RgSUGHRXJQNMsZ4lrSo9qIMMbt6pivtGG4/BCn84qp7Kk7HlBTOp67tjLtKqHALZqaojd6j3xBOyqjloM29HmVWJlKevSrUe6wwPBm2TbWBTiFOxhNBOdxM5GR3sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567587; c=relaxed/simple;
	bh=t6PurMvqR/fpUYh7hBSPTO+ukCOVSRpbo/q/jCMS4Go=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtGsicBjET5VhOZTpxIjPtj3jviLppqy3Iy88fObvIAxkqv1J5M5tW0l584h97p0NA4DrFZpH8t5Z5Mts/XKAMPWzNO3zaj6yEbkXQ4wE6p2YySw6odOYUtbXsAqypL4Mz5vWF8c+N/rIeymwapTMaqU0eiqg6LuKghO0LoHFto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QTjSEDDE; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45S9dX9o041607;
	Fri, 28 Jun 2024 04:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719567573;
	bh=bSIQdKBiysCVr4wDlIxYANPg+PoACdNWhot1vosao3w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QTjSEDDEXnbUc6S3gHpXFiRvIHEpMu/RJ9Rmf+WBI1GbLA3ZkU7i8OH4scCwKZNxL
	 O4MHMZH+g3s2T8K+S6cQf5ZOFWKZMLfSn2sIcILEgmDihdo8a8+f3beeMVTYqIDm2t
	 /cFBfHMmbwFye1o0bYL8Tz+If2zzavZgW0TeTKjQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45S9dXgM014967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 04:39:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 04:39:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 04:39:33 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45S9dWfW096898;
	Fri, 28 Jun 2024 04:39:32 -0500
Date: Fri, 28 Jun 2024 15:09:31 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
	<conor+dt@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH v2 01/13] media:
 cadence: csi2rx: Support runtime PM
Message-ID: <5nlxmwidnplo3xkahdev7o4hl45lxouirixexjhwx5ttgvuqcz@ctcjbgmr2man>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
 <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
 <ZQ0PR01MB1302B36DDCE078AF2D16E935F2D02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1302B36DDCE078AF2D16E935F2D02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Changhuang,

On Jun 28, 2024 at 08:45:06 +0000, Changhuang Liang wrote:
> Hi Tomi,
> 
> [...]
> > > +static int csi2rx_suspend(struct device *dev) {
> > > +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> > > +
> > > +	mutex_lock(&csi2rx->lock);
> > > +	if (csi2rx->count)
> > > +		csi2rx_stop(csi2rx);
> > > +	mutex_unlock(&csi2rx->lock);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int csi2rx_resume(struct device *dev) {
> > > +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
> > > +
> > > +	mutex_lock(&csi2rx->lock);
> > > +	if (csi2rx->count)
> > > +		csi2rx_start(csi2rx);
> > > +	mutex_unlock(&csi2rx->lock);
> > > +	return 0;
> > > +}
> > > +
> > 
> > I don't think this looks correct. Afaik the runtime suspend/resume is not called
> > on system suspend/resume. You could change the SET_RUNTIME_PM_OPS to
> > use the same callbacks for runtime and system suspend, but I think that's a
> > bad idea. Runtime suspend is not supposed to turn off the streaming. The
> > driver is supposed to turn off the streaming, then call runtime_put, which
> > would result in runtime suspend callback getting called.
> > 
> 
> I implemented system suspend/resume based on this patch, I feel good about it.
> 
> https://lore.kernel.org/all/20240326031237.25331-1-changhuang.liang@starfivetech.com/

Thanks for carrying this patch in your series.

I think Tomi's point still holds - only the system suspend hook should 
try to stop/start the CSI2RX device.

Runtime PM hooks are usually only called when there are no users, so no 
active streams.

> 
> Regards,
> Changhuang

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145


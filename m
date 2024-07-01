Return-Path: <linux-media+bounces-14444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22B91D967
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15206B225F6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 07:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBF07D08D;
	Mon,  1 Jul 2024 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZoJYrPVD"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E1C144;
	Mon,  1 Jul 2024 07:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820221; cv=none; b=TwML8fKDNrvQPWfZf/23a80XFjvA7flsP4fxkNQAjOKY6unfzOyVkL7Bfd3ofpqjlH+SklxqNYofTAWAJuwm8ZIaiarOT3mLpbk+hOsgcZqNUvbq7qCvqddnDMXcRepCEIixiLCjN6DUGjRWKFSodHW0yrPWlUm1rDDxPyVlNkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820221; c=relaxed/simple;
	bh=NI7kKOKAxIzXPc98JeIqYjrK5D/m1y4D12ZcB1Wqa0s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwmGYGqGWip+fyPsFfvDMYWXpzzapQlEfSv8iQ7ytzWCFOyZQeDIqXrEZp/j/UuhqyEPPQhEGumPsypeEk7YMOlJTafPIuND0I3W5O155JDvVBgocmlFnaUsO2EY5k+zEmt4QTe8MhUpaN03i2F9KDYU0oNZwKQEBWsVzP3OgGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZoJYrPVD; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4617noxU092095;
	Mon, 1 Jul 2024 02:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719820190;
	bh=vYIW1wdja3ERssve91wxwxFxBbrN1XnluQPmgD8VHlM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZoJYrPVD1RGMCQFxmKFgdNN4YWao2NyEdILgF+AKAWts1zQVa8P+y+TUIXijg+8Pp
	 0mjHnwfSJxHx2uR5hbx7zlxnO6khAP3HQ4u7hs/IPVZNKToH7Dv5+SytbbAYVASmMg
	 2X2fKQIdAN5GVwoYoJEcZjk8H5W2kuA79N7eiNJQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4617noNd012371
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2024 02:49:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 Jul 2024 02:49:49 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 Jul 2024 02:49:50 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4617nneu042482;
	Mon, 1 Jul 2024 02:49:49 -0500
Date: Mon, 1 Jul 2024 13:19:48 +0530
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
Subject: Re: Re: [PATCH v2 02/13] dt-bindings: media: ti,j721e-csi2rx-shim:
 Support 32 dma chans
Message-ID: <4hel57zfigs6sxq5pdmahun3zyxhg56pl2hor5r4dgpwkv4if2@fo5rdfrlq45l>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-2-6ae96c54c1c3@ti.com>
 <e0269aab-1cea-453c-9bc7-305ebf446115@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e0269aab-1cea-453c-9bc7-305ebf446115@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Thanks for the review.

On Jun 28, 2024 at 13:42:01 +0300, Tomi Valkeinen wrote:
> On 27/06/2024 16:09, Jai Luthra wrote:
> > The CSI2RX SHIM IP can support a maximum of 32x DMA channels.
> > 
> > These can be used to split incoming "streams" of data on the CSI-RX
> > port, distinguished by MIPI Virtual Channel (or Data Type), into
> > different locations in memory (/dev/videoX nodes).
> 
> Usually you shouldn't talk about Linux specifics in DT bindings. The DT
> bindings are only about the HW, and the OS doesn't matter. It doesn't really
> matter much, but I'd just leave out the mention to /dev/videoX.

My bad, will drop the reference to /dev/videoX in next revision.

> 
> > Actual number of DMA channels reserved is different for each SoC
> > integrating this IP, but a maximum of 32x channels are always available
> > in this IP's register space, so set minimum as 1 and maximum as 32.
> 
> So in the SoC's dts file you will set the number of channels to the maximum
> supported by that SoC? I guess that's fine.
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>  Tomi
> 
> [...] 
> 

-- 
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145


Return-Path: <linux-media+bounces-20864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467159BC73A
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F060F1F2204F
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CBF31FE105;
	Tue,  5 Nov 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vobLQDZD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9B282F1;
	Tue,  5 Nov 2024 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730792751; cv=none; b=GAiNM+hdcQcsJEiFs544eldSgcEgjU0d+IohASORghm7IwwKH8l8SZDbS+rWveSRTNDapBcA2v/Qk4ZCdwPkRhgwOl4yjbdT1j69NjQ9cmAKlSdIEt2bgypvzzqutPNuCF1SEdKiiaWoh1cFymhxfDmgBILYZwWQ9SFoFkCmqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730792751; c=relaxed/simple;
	bh=OaJnEkldqb8hP8lRpM/kenSEByCjXILbSKGWf1lsdc8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Odpyglh8XL58m5F7Drlms+OS56ui4gBZOx+H0ttlKjMqdoZD8VrW6v//LRURGvkZnQ9smVE86CgPThBOjd6GMr3lsN9ypphduwrFury2/dEhKnnFYAO6ZrnaHjNn5CWSkeRUi8AxBnqGEmrkJVzRR6gxe5oj8PVBLwVvAy9xGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vobLQDZD; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5135JP023435;
	Tue, 5 Nov 2024 08:45:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=agzLPwjtyIVcmji+qBbiwXvd
	NNXbwTGcuXy/vqd4v6s=; b=vobLQDZD2qNGcCFGeAPMOcHK1jX8XoKA7p8EXbY1
	K7TkP1GZ/Fzwiy/clo5SiJKmvNeb6qiX5w3W/3e6ZxBG5qODvF508afDzJqHD0tc
	LrZOPaZCFE1c5SaMzhYqES3dZrBn9vofv553ZFRnQS0xauUrqqIzPwRPjQqPDTwM
	2TFw89arm5o/X1LQUrsIa5ef3G6WKEr5GgMiCKtPDE37F6dV44I/iz6CCoH7ovF4
	WReqn0nR6pjMgPzFrpiKjDzG2XmdLvpaQS1IUYr85eACNf7eihE0WiTBETdLCZjE
	HzZrLAXv6VNCjPoCp3MgE4NBdxP1P3ov4vc1JBNSX2blBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rmc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:45:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA23B40047;
	Tue,  5 Nov 2024 08:44:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DA3824F7A7;
	Tue,  5 Nov 2024 08:43:23 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:43:22 +0100
Date: Tue, 5 Nov 2024 08:43:21 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 12/15] dt-bindings: media: addition of stm32mp25
 compatible of DCMIPP
Message-ID: <20241105074321.GB1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
 <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:41:59PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:14PM +0200, Alain Volmat wrote:
> > Addition of the stm32mp25 compatible for the DCMIPP.
> 
> "Add"
> See submitting patches.

Commit message corrected in the v2.

> 
> > The stm32mp25 distinguish with the stm32mp13 by the fact that:
> >  - supports also csi inputs in addition to parallel inputs
> >  - requires an addition csi clock to be present
> > 
> > The commit also adds access-controllers, an optional property that
> 
> "Add", see submitting patches.

Here as well.

> 
> > allows a peripheral to refer to one or more domain access controller(s).
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
> >  1 file changed, 47 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > index 87731f3ce7bd..bda28fef0b78 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > @@ -10,9 +10,40 @@ maintainers:
> >    - Hugues Fruchet <hugues.fruchet@foss.st.com>
> >    - Alain Volmat <alain.volmat@foss.st.com>
> >  
> > +allOf:
> 
> Please put allOf: like in example schema, so after required:.

Done in v2.

> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> 
> Best regards,
> Krzysztof
> 


Return-Path: <linux-media+bounces-23374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E979F0A17
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 11:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 044E9188C9D8
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E531C3BF7;
	Fri, 13 Dec 2024 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="V59d/Tca"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0801C3BF6;
	Fri, 13 Dec 2024 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087121; cv=none; b=lP0MqB1O5Jwa5TCyWogzD9vn5VrlvUb2dSXxsJJoH8d2euIorJ6u4s5n2fVSxcDHSmpa2ppHIVHPL6qsUhilQ2ZsGtfz+aL6CJMx/Gvs9kBJn6DtmvIQrphLBWmpTtc5Y54Xi0wE7zpUb2aoszFF5yeVKhOrBUW6/hmxR13AjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087121; c=relaxed/simple;
	bh=r4zbm/BqPSCBaXCpv0C7xvbJT3mWEUSTLgIjjGccWhQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6hi0yHBv0XrmYof4RgTsPk7gMzr77r/HHMcEQfWVrsy6yoG+BnnmMXZ34ylDJ6DN1s3N1ibhQd5E8GcQ2USZU14VMDdyRvp2iI0acuKUPVlYTlPe1i6AcxYNKKhv9jWHP1FbiXx4J058mYrIYfbVvzdJKr1XZUEunC0Tnj7wio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=V59d/Tca; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAW5Gf002214;
	Fri, 13 Dec 2024 11:51:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	G5uSC3BK+YvGUsKSKx/YNrD4AlAFZtoOKclTkZr6p54=; b=V59d/Tcak9U2dgRH
	IieiSNH5E9xkRhqCZH3nlT4/henx+nxTNXz4bglJg5tdoBYQs5nEMOhEAe0Zszq8
	mev4UqwhRvA5G2uSm+THWcdqbkuELoqDsTb83kCYc9RqkbowUg1vPnKVJJfgtcwe
	tIGMNxFh+U23kxQp1U1o3B0d/3ae+idNFqs85362zq3BZVamCxiwvctJV9iMomP+
	+/5TGY7nLZL0k44sSR/4D1pA66lXhlKIXOQejNNmjKMfY+x+a418pD6J7XToKZeV
	EEqn0RsO+wpR1U0X5jbe06mfIBz83J3Q/JYzlBdoBhMya+eaifghcKKP3XkNGATA
	BK3MZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj75wr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:51:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D82F40056;
	Fri, 13 Dec 2024 11:50:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C4BA268D8B;
	Fri, 13 Dec 2024 11:49:30 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 11:49:29 +0100
Date: Fri, 13 Dec 2024 11:49:24 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: repair file entry in MEDIA DRIVERS FOR
 STM32 - CSI
Message-ID: <20241213104924.GA3662210@gnbcxd0016.gnb.st.com>
References: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Lukas,

Indeed, thank you for the fix.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

On Fri, Dec 13, 2024 at 07:00:11AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
> adds a new driver at drivers/media/platform/st/stm32/stm32-csi.c, but
> creates a new MAINTAINERS section MEDIA DRIVERS FOR STM32 - CSI with a file
> entry pointing to drivers/media/platform/stm32/stm32-csi.c. Note that the
> file entry is missing the ‘st’ directory in its path.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference. Repair this file entry in MEDIA DRIVERS FOR STM32 - CSI.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bff3d35f80b5..230b7a4ee95f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14551,7 +14551,7 @@ L:	linux-media@vger.kernel.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
> -F:	drivers/media/platform/stm32/stm32-csi.c
> +F:	drivers/media/platform/st/stm32/stm32-csi.c
>  
>  MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP
>  M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
> -- 
> 2.47.1
> 


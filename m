Return-Path: <linux-media+bounces-14675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE58928690
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 12:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB62128750A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 10:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A205914901C;
	Fri,  5 Jul 2024 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bnyhiSE+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DA148FE4;
	Fri,  5 Jul 2024 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720174609; cv=none; b=jo0c2qEjNsD5FWWjACGr/YQNP2P66z8tNu4bNOpuey7pD8Fc3RRW1Aykbdvt4zCvk8mXuUvXuTIz22Y2Cxm9WTaO78cOLDcnK9jEu+q8E7yjlxK0aSyfpcNTN6xAT4i5D977+GY40bJ2lwcmqpQwDdovvnpKf+WrbBPK9tqASNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720174609; c=relaxed/simple;
	bh=N/EOLPBboZay1gD4O1r9B+Fx9evNmEYapQpBDMYSqrQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/3cgMahyZW873Ls8iGaLIm1pnE9hYa9OY2Q9uo3V6c7OVH2U3rQcAqYXgDcpiAJ9wSWW5IQvy9wg/+UC4SL4zVg19Q42JG6ER4vHJFWH9rrF5HVJVk3uRE2cm0j84fFZ44jvEUQyDN9Z/YsO7y1SOUnFBQer5EnQwByfFuSBzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bnyhiSE+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4658DGY1003029;
	Fri, 5 Jul 2024 12:16:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=AU9ya2EmjL7f6PRwR8NRDfqo
	EmUnZunGxzD7XLPBGBs=; b=bnyhiSE+QYmF3tQt695vMdn0f6fkli3DP/ivuOW+
	o24J4TNDbRkA27LLFyQovbrXoWXdgTtQ4a6n+N7AbQy1kFRMCKI3R+Rco0dyOnIe
	aypdVsO96BdW/Qsa7Va25jAwd8rQJuyGor/0/+FDJzz/WYibEuESvF5+3a6nHiT7
	mE8u/s5Py7DZEVpWVMuJrUXP+qL7zvH8pENOJVf5HA+ZXCCA589mk3qxn5yq+Ifi
	Gh7B63/uw8f086sEyJFUVW2ojol6+a0wtJAkdLbHHZWAD9UzuNle+w/zml4Iaz0s
	kmGJCQsL2uzQOPpu8U5WrzFMccwcO10JvwrfQDmOHTMiww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 405u9suwqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 12:16:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A47ED40049;
	Fri,  5 Jul 2024 12:16:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE37B220B41;
	Fri,  5 Jul 2024 12:15:49 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 12:15:49 +0200
Date: Fri, 5 Jul 2024 12:15:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet
	<hugues.fruchet@st.com>,
        Linux Stable <stable@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: stm32: dcmipp: correct error handling in,
 dcmipp_create_subdevs
Message-ID: <20240705101544.GA3926404@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hugues Fruchet <hugues.fruchet@st.com>,
	Linux Stable <stable@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	linux-arm-kernel@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
References: <2dea6faf-53f6-461a-809b-ec572357ad07@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2dea6faf-53f6-461a-809b-ec572357ad07@xs4all.nl>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_06,2024-07-03_01,2024-05-17_01

Hi Hans,

On Wed, Jul 03, 2024 at 01:59:16PM +0200, Hans Verkuil wrote:
> From: Alain Volmat <alain.volmat@foss.st.com>
> 
> Correct error handling within the dcmipp_create_subdevs by properly
> decrementing the i counter when releasing the subdevs.
> 
> Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil: correct the indices: it's [i], not [i - 1].]
> ---
> The original patch would cause a crash due to the incorrect indices in the
> statement after the while. Since 'i' can now become 0, so i - 1 would be a
> negative index access, which was obviously not the intention.
> 
> I reverted the patch once I noticed this (better to hang in an infinite
> loop than to crash), but I want to get a proper fix in. Rather than
> waiting for that, I decided to just take the original patch from Alain, with
> just the indices fixed.

sorry for the delay and this error within the patch.

Thanks a lot Hans and Sakari for noticing it and fixing it.

Alain

> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 4acc3b90d03a..7f771ea49b78 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -202,8 +202,8 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  	return 0;
> 
>  err_init_entity:
> -	while (i > 0)
> -		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
> +	while (i-- > 0)
> +		dcmipp->pipe_cfg->ents[i].release(dcmipp->entity[i]);
>  	return ret;
>  }
> 
> -- 
> 2.43.0
> 


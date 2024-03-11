Return-Path: <linux-media+bounces-6859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 867338786CD
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 18:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A5E1C214FA
	for <lists+linux-media@lfdr.de>; Mon, 11 Mar 2024 17:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E95D52F7D;
	Mon, 11 Mar 2024 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="N5RQs48/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1534D9E6
	for <linux-media@vger.kernel.org>; Mon, 11 Mar 2024 17:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179797; cv=none; b=Xq8s15w5+TGjbwRkjYVRiJkvanLrvDZC2RhJxVQ5ymuiK1tbTSQgI0s+H5ThnuYhE0nWWDQRb6eCytPQ2/jUBdyEGFrk8a7K+nYJtdYKcoFFQDRltyuhwYO4U1PjpZAtIIXJpVjY7VRtxR93wSTiinj9g5f3Rm6/RGg7A24AXEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179797; c=relaxed/simple;
	bh=IliRhLwv+VPsKwkOl2VUGZLLLgWpEQvd7Ekh93vPz9U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8tW6L4Ysadi3HsrMR8+yEMqJ+nJiDBMoQNVncNi8NCcv3V209dwO4CKNFF1o/33EnSecBs9gB2RfbLrjCxvGKpC1xjBA7m6SzjDfgrjY+v4HSVm8b48hLl0JTp8Epo1NmsWhqpyd6/1Qak/RILsX/bo0m3E+mwP62SqwIjU+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=N5RQs48/; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BBTHgA031821;
	Mon, 11 Mar 2024 18:55:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	selector1; bh=NQG+2qhjNjjYXPhRwsqUC5kmwQUxn53pvpUv3WEV40M=; b=N5
	RQs48/N6jDwH5C8ioEjmzE3xw/uhDcWeKMKxrdmbfMUWsxm2DuUoV+Y+pG/QCg0z
	aC3SCZibf00/yODCjOQeInIt+k0QsvltTrQL7Dt7CU+UORWwGghYXmqAhVJQ9+wD
	/sGEiY4vxe7ajGQggmtesaqWiSuRW9EO+TMsvPm2W6e7y3XjNcsFJMaay1U7fU0G
	byuX77weaCLtKovuG7gJD6PgfUCByKt7St3OwmII7scNN2WgEpqivWwPO8kCAAgF
	IK56X4/4lqCiudXiBJVioFpqY9C3n4f/yz64aTYn3blF/ihP9etXtS3xxB4l0Otl
	1eAB8RqHT37tovMYwJpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wrfhfh8mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:55:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C15C840044;
	Mon, 11 Mar 2024 18:55:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 885B42967F6;
	Mon, 11 Mar 2024 18:55:13 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 18:55:13 +0100
Date: Mon, 11 Mar 2024 18:55:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 4/5] media: stm32-dcmipp: Convert to platform remove
 callback returning void
Message-ID: <20240311175442.GA109372@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <cover.1708692946.git.u.kleine-koenig@pengutronix.de>
 <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e85adb3c2f11fc10e5a18bb341c5af8b35c4d88.1708692946.git.u.kleine-koenig@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02

Hi Uwe,

thank you for your patch.

On Fri, Feb 23, 2024 at 01:59:07PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 32c6619be9a2..bce821eb71ce 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -517,7 +517,7 @@ static int dcmipp_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dcmipp_remove(struct platform_device *pdev)
> +static void dcmipp_remove(struct platform_device *pdev)
>  {
>  	struct dcmipp_device *dcmipp = platform_get_drvdata(pdev);
>  	unsigned int i;
> @@ -534,8 +534,6 @@ static int dcmipp_remove(struct platform_device *pdev)
>  	media_device_cleanup(&dcmipp->mdev);
>  
>  	v4l2_device_unregister(&dcmipp->v4l2_dev);
> -
> -	return 0;
>  }
>  
>  static int dcmipp_runtime_suspend(struct device *dev)
> @@ -588,7 +586,7 @@ static const struct dev_pm_ops dcmipp_pm_ops = {
>  
>  static struct platform_driver dcmipp_pdrv = {
>  	.probe		= dcmipp_probe,
> -	.remove		= dcmipp_remove,
> +	.remove_new	= dcmipp_remove,
>  	.driver		= {
>  		.name	= DCMIPP_PDEV_NAME,
>  		.of_match_table = dcmipp_of_match,
> -- 
> 2.43.0
> 

Regards,
Alain


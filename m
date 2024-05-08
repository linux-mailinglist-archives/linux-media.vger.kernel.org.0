Return-Path: <linux-media+bounces-11148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D08BFF03
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 15:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7154F1F2177B
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8041384FDD;
	Wed,  8 May 2024 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6TCZG6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87918028;
	Wed,  8 May 2024 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715175591; cv=none; b=dVYeFRODDwLdGpZRSIQ06D62Jk9AJRJ598nhSMOX8HcKsasgbIGEkQiOgH1/8F3Lz8eq3m7FH9c9/ZBXnwtoZRBVcEokBMq6qLs7vHIgq/l99HESVMl5PAqIjqfpHXq8nyKHIIHS1YHf/9xykDW8sML8boDvyJQrEiyOXlFOgeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715175591; c=relaxed/simple;
	bh=+4mjUPRGu8rEcxRCr+bwaMPY4L/e/50XYw0ytJcPW24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hk4X74DP8QwR/bpRtPOdru64K/iJiw4Z4cq3K6G81M1tNDNzed23Ov2wyx2cs0EjfvtUD9t6jN9z//OHi0IrX1JnTSjNTq881mipuOkDRpjnmtuYVOdF8Ypy99TOhFLmcm/HtjmKJeqJVdwYY4iGlBgDNZaFxZqI5VJPRrqlCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6TCZG6B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448C4pL2027553;
	Wed, 8 May 2024 13:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wKeLlCIS6z6USbPc1tcShn9JMagwjdg4h4REuaQSD5k=; b=F6
	TCZG6BrESB2xr3bIGdWk1rVZqThELqeDLU+fuHJCIcR9i9meEXTkIrPUFjX74ic7
	kFtNkuOikDTUsuPhtjHHsk4b+rO7msm9Bod/4/OcnNIr58liYcMDW3gbs0mKGI43
	OgPnV9n836hF9F+Rsa+4/KtDiq8ol+jqR7qYhkCt0rtlocEw73T/slYCbp2ieS33
	Rnnfb6VFaO2+NZgweQPm/5KxzRWqU5Wx2xyIfYFgbHlJJVX1814bF8qpBct4koqp
	prgY2NHnd+iChYkrfZDZ0DtVPtPMHTolELKiClSrXfFt7Ee9dxSTYihV4UncpL/+
	pH5OqloUc6AtSrFO1e1w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y0930r7qu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 13:38:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448DcLGO004343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 13:38:21 GMT
Received: from [10.251.44.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 06:38:19 -0700
Message-ID: <a506816a-cbcb-467e-83b8-11ba9a1b1a90@quicinc.com>
Date: Wed, 8 May 2024 16:38:16 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Fix imx42 exposure control
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva
	<quic_mkrastev@quicinc.com>,
        Daniele Alessandrelli
	<daniele.alessandrelli@intel.com>
CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v1-1-4b3a9426bde8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lV0DLyB1s0LpomtxH6ReqLigHxtgqKEq
X-Proofpoint-ORIG-GUID: lV0DLyB1s0LpomtxH6ReqLigHxtgqKEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=917 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080096

Hi Bryan,

Thanks for fixing this.

We have also found this issue during our internal testing but somehow
was not posted upstream...

On 5/7/2024 1:33 AM, Bryan O'Donoghue wrote:
> Currently we have the following algorithm to calculate what value should be
> written to the exposure control of imx412.
> 
> lpfr = imx412->vblank + imx412->cur_mode->height;
> shutter = lpfr - exposure;
> 
> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
> decreasing as the requested exposure value from user-space goes up.
> 
> e.g.
> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
> 
> This behaviour results in the image having less exposure as the requested
> exposure value from user-space increases.
> 
> Other sensor drivers such as ov5675, imx218, hid556 and others take the
> requested exposure value and directly.
> 
> Take the example of the above cited sensor drivers and directly apply the
> requested exposure value from user-space. The 'lpfr' variable still
> functions as before but the 'shutter' variable can be dispensed with as a
> result.
> 
> Once done a similar run of the test application requesting higher exposure
> looks like this, with 'exp' written directly to the sensor.
> 
> [  133.207884] imx412 20-001a: Received exp 1608, analog gain 0
> [  133.207899] imx412 20-001a: Set exp 1608, analog gain 0, lpfr 3546
> [  133.905309] imx412 20-001a: Received exp 2844, analog gain 100
> [  133.905344] imx412 20-001a: Set exp 2844, analog gain 100, lpfr 3546
> [  134.241705] imx412 20-001a: Received exp 3524, analog gain 110
> [  134.241775] imx412 20-001a: Set exp 3524, analog gain 110, lpfr 3546
> 
> The result is then setting the sensor exposure to lower values results in
> darker, less exposure images and vice versa with higher exposure values.
> 
> Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5/imx577
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Using libcamera/SoftISP on a Qualcomm RB5 with the imx577 sensor I found
> that unlike on other platforms such as the Lenovo x13s/ov5675 the image was
> constantly getting darker and darker.
> 
> At first I assumed a bug in SoftISP but, looking into the code it appeared
> SoftISP was requesting higher and higher exposure values which resulted in
> the image getting progressively darker.
> 
> To my mind the software contract between user-space and kernel should be
> increasing exposure requests always meant higher exposure but, to be
> certain I asked around on IRC.
> 
> Those polled agreed in principle that the software contract was consistent
> across sensors.
> 
> Looking at the range of imx sensors, it appears this particular error has
> been replicated a number of times but, I haven't so far really drilled into
> each sensor.

As far as i know this issue is only for this imx sensor driver.
The sensor driver for imx412 was submitted along with imx335 and imx334,
maybe after all the reworking this was missed.
Our apologies for that.
imx334 and imx335 are using shutter for setting the exposure from where
this calculation is taken.

However imx412 uses number of lines for exposure.

Reviewed-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>

~Gjorgji


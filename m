Return-Path: <linux-media+bounces-51087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C1D3BD70
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 03:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9582B3007F08
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 02:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEE42749ED;
	Tue, 20 Jan 2026 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gyE6R5L8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWGduUD1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AF1552FD
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768875302; cv=none; b=XAeve3yO8arEyWVwTGl0PJetynTEaYJs5Jcc+XylfweDlVEVGLbw9PNS/AOrCC9HEzBj/E5t30fdIZ90cg09M0BcvlAO0BFmyuySMry7SSwT6x1tI8n8LxMBqxiKRgZCL5lrG7KdQegVOqftHW1338pbi8REdyykXxasz2UTYNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768875302; c=relaxed/simple;
	bh=7AMoies8b5WAS6Vw85hPYsiXtDNKJgeu4VMFghMNZ/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lg9HbFXuQNejkUk3QxFUs13uZx7pu/K+SvjwpMDiQOfTcVksctvVl8TWXkcrVxVRznplHjzONwF1RkLb3gnaxppSc331IuSJ2B+J3qfldEv3BKFGOySD0s0qpv0WIf4P28qVyNuV6jS9icB2LDJwpjnAaiZgmyyxHfQrZLmuYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gyE6R5L8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWGduUD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K17xCH3365643
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+uEkCWtN9XfkOoUqLRgz5msAsC2IeOofQ31u+XDWCM=; b=gyE6R5L8EEroSUm8
	g3z82rOMGdGPFYTLYxCKkTyrO9MrMcv0jACSk1LqCgFprZHlZlk+DR6RIdNmcK9h
	HLmpYUkt4jKaRbFQkiSSCjRANs12p63KOEyUzosvfTJIO7kSCSdjBNtqq9DpYQ0/
	UHkS8KTaK17n8sP8XnCpn82IEIvNJyA2fCzCL5zM0D0Apz4p9Cc98abb7MznRvfm
	N7/Eb1H6gPOlvqzi9kT911sGJyIPRmjZ5e60m96M008rgNeeRMegTQLQ5cvJVZGf
	olyAVQPwuzMmWohAf/k+cB2hy2PEbZB4KRg6IVDkBKecwER+H/tuN+9vSP1VbSHp
	zptVLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb0497-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:15:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a316ede50so105587456d6.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 18:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768875299; x=1769480099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+uEkCWtN9XfkOoUqLRgz5msAsC2IeOofQ31u+XDWCM=;
        b=IWGduUD1zEC9LGmH9tG/3fDw7y4xlIXxIo+yPQuwiMFHxbPpbpdhyenJSjQIinxpp6
         VBVlmJ4R3DVCisX7XJV9oJzbIjsySCfdKfqY6qoCHrP9b6mMu1L+py/mHvN+jAiZ7f2s
         E7CYhg11XMHzQOs9TezP5rUJ74QaQJoqSe9aXapy1CXa6tc0xdAgYtxdD8gFvrXlSntB
         Xx0kR2ZVFVt6TpysYKWYqEAuoUR88Pak5tN0sQGkj2bKxn+wujNfAFbAkl6XtqBfIWNp
         Vt5LlENkqrc0Iu6g8YocFwjFSq00iYbI38YfkDRFQQLiFzOhh7edCh7o4i+h+0roZJqB
         rY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768875299; x=1769480099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+uEkCWtN9XfkOoUqLRgz5msAsC2IeOofQ31u+XDWCM=;
        b=SD28MxXVz9f33m4b4vzJE3TdKjz9VebcJvfUfEN26XDtl1NnGwKfbdLidpo+k9VKb4
         XeSe/6spVKWDXh5VtMCtt5793FtcIxYVPv1OlPbpT4VNJ7E/PDH8Dn9nD3XRjJ3zUS42
         6HUFzsSqazZxrXr474lgQqMKOfVshHkV82MhdpMIS/cVmJwIage+0SldcL7k9FfGwE5H
         dkYOYvwWRXLA2PbI9N6X8BLyUGtuLC7HH3d57JJs9dx7tmeDrAMmvZ+kDNhyFN2gpGzn
         y+dSmNUvPXd3xTaChsVVAhe7hOPR3l368DZSxVkZU+8m6bCacPBjEuy4TSBTgLqMW4+9
         oUzg==
X-Forwarded-Encrypted: i=1; AJvYcCX9yRBXEmxYhcSmotuHWsTtAywkvRS8spFmr0ezCPtOv2Ki9VYXFaR11GVNJykjsqxf544y0/iIMwBuKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5cIshr6Id6hBbAP/o3qhE+1rfd4ztGzCTYNEaqyKR94DjM7w
	79gTk6O9IgmciTD/vCuLymSKyobxE0wf0t0/kBNuFjoIPV5EYql1QqQ6gCFYxpnikGYQsDAf6Mn
	id5dwzQ0IIXF30iwycVHU6RpH927WWl6pFMWGCpTdYom/cKEGGa4Yvf7fNJN5SnbiFNswr4EQRa
	39
X-Gm-Gg: AZuq6aIM8wHei4lt9k9TrA+uVqRZ1L7B6WqPPIhfY97zoCVbNtei0kuS/BbjK0lXtKh
	ibZ+hokBlbcxQpVpDpT69qfBuRH/GV1x5PxUOt+PTl3gg91nFGuh9uu4bgQxSofW+yMimjQ4jYa
	xwLBAPFvsdi1KpC/75GRb2gzqNuFVz6fnGkrhLQC0xgz7Cpl3DDVX6Gl6x53JRJtpjovEcG8Xco
	Xxz8Wf3UhfLA6GCibqlj3gKgVUkOXA3RUlmC0pCXvoAQem9MLXCKYtNSmy0BVadK04F01UcxCHa
	7mAFqn1k4Vdm1bIxXk7Pi5PIpHz7i3bNbSSkguwj7IlD4BVAi6EEBbDXrgixs2qyu3Ajc4EGgV6
	/QxZhL5MrwWFfTE3+9ScU3OeBvIdQZEfqjgO+UUhKHnd0Iaz21FhXGPLXAbKDwgBDkCL09IXA3w
	==
X-Received: by 2002:a05:6214:202b:b0:890:8285:e1a3 with SMTP id 6a1803df08f44-8942dde44dcmr179823726d6.63.1768875299477;
        Mon, 19 Jan 2026 18:14:59 -0800 (PST)
X-Received: by 2002:a05:6214:202b:b0:890:8285:e1a3 with SMTP id 6a1803df08f44-8942dde44dcmr179823536d6.63.1768875299056;
        Mon, 19 Jan 2026 18:14:59 -0800 (PST)
Received: from [10.111.175.103] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad74esm93062466d6.26.2026.01.19.18.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 18:14:58 -0800 (PST)
Message-ID: <81b142d6-7d81-47cd-85ab-c34851f4029f@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:14:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: i2c: imx412: fix sensor power-on timing
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
 <20260119-imx412-v3-1-8b46929af773@oss.qualcomm.com>
 <aW4W5C6hkNIkzH70@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aW4W5C6hkNIkzH70@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bAyZihsS94PUzPTnhyH7VIWNq5BQ-Pp7
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696ee524 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1bpdYG-PCl1tXHyfpj4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bAyZihsS94PUzPTnhyH7VIWNq5BQ-Pp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAxNyBTYWx0ZWRfX8XrLkIS0sA6K
 91vMUCjZFXAkghyMoS96ik7zqOuhvVw3+MBWgM+l0GfxVK71zAVQrm3mf/smuVKLCZ9S5saXs5/
 w7IlNcny97HCYPYSGQ6U469yc74PJ5Hs5392bwaabzd2Jowi9n0o49aNI6NY/D+mLhFCL/N0QiM
 ZuNeDLbbutfsJYyQdG8dKe4Gp09TOJeH592lgB3z0UsmddKCBVBDxek5q8TBXOawSalKcEsOAoF
 Xl86eo8SwsZ6AkeCm2Ua0lWaLbYOJuVXutiUurg7yRJN2JJnGC5KUnNC0mhUeX8zQ6rGcHttUbK
 eYdb9N2RcIKkHsthBhnhd+NBCrYfnDdh0p5zYmTZXjgFiO/Q2mO+8m2+eO5FdxwZYu+H1n156/R
 jr4iVJU2w9JBiJNtH4CRcVC/SsxgvlJZqwwAIcSujK8vZNF5n7s6vJJbXfOfh9l++IiAldWBZ4e
 +6hpO6NDo5DauvwzFwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200017

Hi Sakari,

On 1/19/2026 7:35 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Mon, Jan 19, 2026 at 06:15:01PM +0800, Wenmeng Liu wrote:
>> Assert the reset GPIO at the start of power-on, enable regulators and the
>> clock, then deassert reset. This avoids a mismatch where the first
>> power-up (when the reset GPIO defaults deasserted) differs from subsequent
>> cycles.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/i2c/imx412.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
>> index b3826f80354703b17b416dc233854da3f5736e38..ebc2fb706442365f541540bf4ce9d307d42e0061 100644
>> --- a/drivers/media/i2c/imx412.c
>> +++ b/drivers/media/i2c/imx412.c
>> @@ -1022,6 +1022,8 @@ static int imx412_power_on(struct device *dev)
>>   	struct imx412 *imx412 = to_imx412(sd);
>>   	int ret;
>>   
>> +	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
> 
> I'd assert reset in probe() so you can drop this line.

Sure, will update the patch.

Thanks,
Wenmeng



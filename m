Return-Path: <linux-media+bounces-31374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 288C1AA4539
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1124A7563
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB54217659;
	Wed, 30 Apr 2025 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="L1UTAJqh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AFB2FB2;
	Wed, 30 Apr 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001523; cv=none; b=Q7gQE+IZpR+vI4Fk01aHZB6L+pI8rnn7zXmEaMR1cvJYKINJ32JmZULh4Dcs4tKuIMNgF+Xi0OoiOq4YBuM7pi8JWB2WIjZLRBW39g1vBYHUsGj8Rk6B519AfMw7iwlTYaqoVSyj4+h4Ugunf21dVGBSMkp7TiyEDUb09rs0yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001523; c=relaxed/simple;
	bh=xl2PC/u/acKBiCM9v6IH+o5HldOBBnBmnBHN3O2JYik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C3/gZCHUYjBCTLnyzheeSad/S7TwuSeD1xfnmq6JFpqwR6T4K+Vc4qOI1Ktu3/3OMecYYlkZCjq0D7GjTF1TKtynk6NG+a2U2u7KzHMLttJeEee+J7jtFBAUA5xj/mx1v5PpPClPfHKrCFUtRDsvBBx51T7hBaaDJ38hCQRrEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=L1UTAJqh; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U7CCF5005514;
	Wed, 30 Apr 2025 10:25:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	g96VULOJgTP+rXSvs0fblxCYj+Zob3SZLDsy/ja+mSo=; b=L1UTAJqhDQjAXriu
	QIYM35A9Zsx4nRUU8b8up4/5WDEt/s5wEG+dLtFTOix1mK11mcRWLNFMoOMhFOLp
	Kb+gYm8+e1gURB6NA79a+wtPKOlq679CMutcPZeqhO1xEq84Elc69C/0a0A8yvMc
	LgMpPDYwAxM1nMHaDvHNRj2eqZFhIXtx406/0wOhQvWw/5eWtt6Pc2n6RYetK/DJ
	IDb2E3GhSBSOhxl6atvQbF0I0DxyVR94rni9bkmUlw1FAmrFnOKHuF9/39a3mp1L
	903vzHPo6dk4n7aUjm6dugoSWptW6hFN3f3/ORPjkfhnMfSbiz6ygqqfRTpuYGJ5
	SJ3+BQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tphy93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 10:25:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 02D7940048;
	Wed, 30 Apr 2025 10:23:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5267B922644;
	Wed, 30 Apr 2025 10:23:24 +0200 (CEST)
Received: from [10.252.1.18] (10.252.1.18) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 10:23:23 +0200
Message-ID: <622301ae-0973-4cdb-936c-3152afdbfb46@foss.st.com>
Date: Wed, 30 Apr 2025 10:23:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for ST VD55G1 camera sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407-b4-vd55g1-v6-0-1850f18b1f24@foss.st.com>
 <20250407-b4-vd55g1-v6-2-1850f18b1f24@foss.st.com>
 <aBCxpuppB6L-Ft2c@kekkonen.localdomain>
 <70f7bc9b-4533-4c8e-a792-aad9a0b7a6d4@foss.st.com>
 <aBC_gx8vFNWLacgB@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aBC_gx8vFNWLacgB@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01

Hi Sakari,

On 4/29/25 14:01, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Tue, Apr 29, 2025 at 01:29:39PM +0200, Benjamin Mugnier wrote:
>>>> +static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
>>>> +				 struct fwnode_handle *endpoint)
>>>> +{
>>>> +	struct i2c_client *client = sensor->i2c_client;
>>>> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>>>> +	u8 n_lanes;
>>>> +	int ret;
>>>> +
>>>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
>>>> +	if (ret)
>>>> +		return -EINVAL;
>>>> +
>>>> +	/* Check lanes number */
>>>> +	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
>>>> +	if (n_lanes != 1) {
>>>> +		dev_err(&client->dev, "Sensor only supports 1 lane, found %d\n",
>>>> +			n_lanes);
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	/* Clock lane must be first */
>>>> +	if (ep.bus.mipi_csi2.clock_lane != 0) {
>>>> +		dev_err(&client->dev, "Clock lane must be mapped to lane 0\n");
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	/* Handle polarities in sensor configuration */
>>>> +	sensor->oif_ctrl = (ep.bus.mipi_csi2.lane_polarities[0] << 3) |
>>>> +			   (ep.bus.mipi_csi2.lane_polarities[1] << 6);
>>>> +
>>>> +	/* Check the link frequency set in device tree */
>>>> +	if (!ep.nr_of_link_frequencies) {
>>>> +		dev_err(&client->dev, "link-frequency property not found in DT\n");
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>> +	}
>>>> +	if (ep.nr_of_link_frequencies != 1) {
>>>> +		dev_err(&client->dev, "Multiple link frequencies not supported\n");
>>>> +		ret = -EINVAL;
>>>> +		goto done;
>>>
>>> Please check the link frequency matches with what the driver supports,
>>> using e.g. v4l2_link_freq_to_bitmap().
>>>
>>
>> Are you referring to checks performed in in vd55g1_prepare_clock_tree()
>> ? Keep in mind it will change a bit with Laurent's comments though.
>> The sensor supports a range of frequencies therefore I chose to check it
>> manually instead of v4l2_link_freq_to_bitmap().
> 
> Ok, that's fine then. But please check this results to the frequency that
> was requested, currently it may be off AFAIR.
> 

As far as I understand it should be fine in v7, could you have a look
once sent ?

>>>> +	ret = v4l2_async_register_subdev(&sensor->sd);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "async subdev register failed %d\n", ret);
>>>> +		goto err_subdev;
>>>> +	}
>>>
>>> Aren't you missing:
>>>
>>> 	pm_runtime_put_autosuspend(dev);
>>>
>>> here?
>>>
>>
>> Thank you. I'll add it to the pm_runtime block above.
>> I also noticed I miss the pm_runtime_dont_use_autosuspend() call in
>> err_power_off. I'll add that too.
> 
> Ack, sounds good.
> 

-- 
Regards,
Benjamin


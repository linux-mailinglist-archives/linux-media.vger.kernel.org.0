Return-Path: <linux-media+bounces-31641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0200AA7A58
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 21:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816C41B668BD
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 19:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF5A1F419A;
	Fri,  2 May 2025 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LHHGPW1L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B861A5B87;
	Fri,  2 May 2025 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746214976; cv=none; b=kpH43NkJWqMeBCAzif/dWbaM4ftb681xinLNiRFGjsrnnM/PAGutyLLqZptoWR8rTrj3lhndiHDkwQOx4gquWsxweDOBLIgAwjHNOKZ88wJCUUWu996BVvgd0wloDaD7qEZT10Obcchqtma6HIxX9kv9Od1QbZAY5pu3PgVWsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746214976; c=relaxed/simple;
	bh=lHxaPE1V/iBb0Ob2a47aF8gBCnU0EX+sS1hy2Zzqhxc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=FXxpwF6BxSdc6AoGsUm9tz+F0IVW/d9I0zvP/OpvvyYi+R3giGDf2gvRfrJzPO4vgKMPoCJCOY8ECcO0I78WJHMqIiICqg7iSW1NwEEJoTWelXioAqQU5W/CszjBEWeYhyB0U0jjUA9/pbNztHfz2evlRLz+AROc9vDdWugAemE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LHHGPW1L; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542A2XW0004552;
	Fri, 2 May 2025 21:42:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZBSQ/MFbMMoLpjs5IbY8opKOJCgMFn19DU9Uv51GkJk=; b=LHHGPW1LicnvmNoO
	Sz+C6YDsl7Z89HXN6/qoA3TsKM+qLXJb4bn3ZYdsj3tsufWXJhdGO2lpCh57gZdu
	vXnXXPySKu3bIa21c7zW0O5B7/eq2FHFvt+suJeaNo7cunPvWzLuN3Bho9r1pPxM
	Oz+gWJzRFwpskkOpFhJsil+A2P1RPkH6IIWw70szTGsweHPZzCSr6k6jHgh8+lIc
	B+Wf4sF3HCtgVXOE32R7GvqhpgosGLzvvLi5a+N6RT6/nsDSyLOHKWCGVKBXVGSq
	DH9aST1vWcmNjpGAXpBu6ENByu1DR9lkvvUCqu7myg0L7kdZ5rMo9wIv1wsHFPjD
	j2EoxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmc9re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 21:42:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B09674002D;
	Fri,  2 May 2025 21:41:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94BBDA6041B;
	Fri,  2 May 2025 21:39:28 +0200 (CEST)
Received: from [10.252.136.96] (10.252.136.96) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 21:39:28 +0200
Message-ID: <4c8a1359-e7e3-4e1c-a159-e761ed749712@foss.st.com>
Date: Fri, 2 May 2025 21:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomm.merciai@gmail.com>
References: <20250427193050.23088-1-sylvain.petinot@foss.st.com>
 <20250427193050.23088-3-sylvain.petinot@foss.st.com>
 <aBCosy0h83UMNvSI@kekkonen.localdomain>
 <f496004b-8301-4f7b-85cc-f2f82bc94060@foss.st.com>
 <aBPzucFjWvN8crSs@kekkonen.localdomain>
Content-Language: en-US
In-Reply-To: <aBPzucFjWvN8crSs@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01

Hi Sakari,

Le 02/05/2025 à 00:20, Sakari Ailus a écrit :
> Hi Sylvain,
> 
> On Wed, Apr 30, 2025 at 04:19:14PM +0200, Sylvain Petinot wrote:
>>>> +static int vd56g3_subdev_init(struct vd56g3 *sensor)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	/* Init remaining sub device ops */
>>>> +	sensor->sd.internal_ops = &vd56g3_internal_ops;
>>>> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> +	sensor->sd.entity.ops = &vd56g3_subdev_entity_ops;
>>>> +
>>>> +	/* Init source pad */
>>>> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>>>> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>>> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>>>> +	if (ret) {
>>>> +		dev_err(sensor->dev, "Failed to init media entity : %d", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/* Init controls */
>>>> +	ret = vd56g3_init_controls(sensor);
>>>> +	if (ret) {
>>>> +		dev_err(sensor->dev, "Controls initialization failed %d", ret);
>>>> +		goto err_media;
>>>> +	}
>>>> +
>>>> +	/* Init vd56g3 struct : default resolution + raw8 */
>>>> +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
>>>> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
>>>> +	if (ret) {
>>>> +		dev_err(sensor->dev, "subdev init error: %d", ret);
>>>> +		goto err_ctrls;
>>>> +	}
>>>> +
>>>> +	return vd56g3_update_controls(sensor);
>>>
>>> You're not holding the control handler's lock in the above call.
>>
>> If your comment is related to the fact that 'vd56g3_update_controls() can
>> fail and that we do not free control handler not cleanup media entity, it's
>> fixed in V7.
> 
> It's not. The access to the control handler is serialised by a mutex and
> you're not holding that mutex whilst calling vd56g3_update_controls() here.
> The same issue exists in accessing sub-device state.
> 

I'm sorry, I missed that ...
That should be better with something like :

	state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
	ret = vd56g3_update_controls(sensor);
	v4l2_subdev_unlock_state(state);

I'll prepare and push a V8.

> ...
> 
>>>> +	ret = vd56g3_parse_dt(sensor);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "Failed to parse Device Tree.");
>>>
>>> No need for the trailing dot in these messages. Same elsewhere.
>>
>> You're right, Fixed in V7.
>> I took the opportunity to harmonize the error messages (Capital letter, no
>> space before ':', no trailing dot, missing '\n').
> 
> Ack, sounds good!
> 

-- 
Sylvain



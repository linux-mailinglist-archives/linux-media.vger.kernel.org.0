Return-Path: <linux-media+bounces-49394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F220CD83D5
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30656301296B
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63F42F6935;
	Tue, 23 Dec 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KB5aPTCB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIprOB4P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECA202C5C
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470767; cv=none; b=AaJsJpxxgffChtXr6l/FPv+Yu998niiaBdbV28AMKTjNX8b8+jHO+P1TsNDIZbrmEQdzozB3NpShmynW7fYOfgoa+1ujBimneIUoGKyiYb+VW8LDRMXTrzWWxRgr8gPpQP7U+8ECr9TQwWZjn3FlW/jMucm3g2Hqpvc6SHdlIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470767; c=relaxed/simple;
	bh=ZsdSICv+2xC/3NbVQh/iSbgFFZdNKg9ZqpRKyBo+Xi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AR72xjPU/pPlJLcAoNYLz5kQH2kNI0fLsY/j5A19701xoBNlkXLi0sZVTFhFNY/DHLyb2rVfoT8PcgS9aBVClrnHPUA3U5rc19naM7unnZCkeM00uOlsOOurzkvX3TbRhB3WcvuY5/mHhGkMhdgKzbcmjqbTTmNR7a0/mnSOHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KB5aPTCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIprOB4P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMKDpbZ2115394
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 06:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YG00h7DMLFKYHMMioGzh6se0vDVRvxk9MiUWHt+Cdi4=; b=KB5aPTCBzAZ6Ocu3
	nfEYZ/JHgfe66jYHSnsWY8INg2CcXIc+8ebY5/LRUp/91Qi2TbUmJoqkV+/1RSDB
	sSq8qLUJc/XVrRd6lepq1Gzn9fA+KcRrvsHqmOLYnhFjsdvB4rJdA2wqXajE5LiC
	VSpT624WwbgRHPpSU9Cvfgkd1qXsto2ZvfCU1MD1tKuCajeMlIsQOIT+haVyfT4b
	ebSSDjORcWKabs2XqJRE9CQHJTxTFoRkG/r73yVBjZjryOY7ekqs495kBg8doXLR
	R7pxGDCcD2+YxHTKkXBJkrT4vYSeyG0GJBJ8Rz41IBfN3ctWp0gypZ3/c3J0CmCX
	BvNfug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudhhvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 06:19:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so1784262585a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 22:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766470764; x=1767075564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YG00h7DMLFKYHMMioGzh6se0vDVRvxk9MiUWHt+Cdi4=;
        b=EIprOB4P9oa8fud957FivVZFDoMR3i02GKqn1UYS+ghQfk89+rTFHJLuMW3GeVi6YQ
         vkXs7AVwT8DiHGIh4JRin0OJmwa6ffPO3w0mluaOtVE8CrNGhYsUriOzH4gUQW0dWgrK
         iluRetZujPwWq//xqNkXXYMVlIKj29dwV0vLLRYeN2KDI41FVgRm3qj/38BYsyNvqhVm
         y+jJ0UQMB7mEG6UAHFWV7x4pjHUA1WcB+cbl7vkhDPiXJIf03ngjhd8Joy+OHXElAabA
         BYkqUthCw0DXOBpSWjN9sEHudxb9eKbu4lm4qoNt903qtv9AfBpP6ggquWfO73OEm76a
         Qwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470764; x=1767075564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YG00h7DMLFKYHMMioGzh6se0vDVRvxk9MiUWHt+Cdi4=;
        b=UyJcJbuqyYTIPbzIjMEaBLD7sh2aflsOUASs9ZMoD7VB+yNeL85hHgyOtoN5rC5AfE
         3VA7oBBHBCnKEGI4EHFw3B8cI+MHjz11A0Dbgpp54X93ccKE7WTTmwBb7mQd/BXlRNwY
         x3X+hAitx8Fes++C+zl8EbeUWhcDmy/iY2SK9gOuI5pHnvWRb+z8kHLo/Fyc1KN6e+Xj
         3HI9yNZZFgRHq2uoxLJv/WxBYwOcDcN+dduo227+s3gtXlQ8nbCqF5pdZJ7kKc+0rg2q
         Wyamu9LbLDT0KFru00myaVd2I03CEPDyBITyQLJ0kuBbMl1HXGnURZ6ZlEH53xz2O+Yr
         S8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCX9dKkDvabNhypdBA+RqJMYb9Tg2z2h8rC+8Cw9Xb2X2TIZS9ULRnMLzw4z/nBuSrMNFjEYK1vFFudOaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyhJG3kixBaLHpkTuze0kB7Og2mclwnKL2OjourzpIaa5MO3/
	NC2oP+1HqrmJWeib3szEoL+lp7+i4+GIS7a6pzgBFXYoS1Dwsc6cdU/mF9owdVdoZ0/HR/YRJH8
	PYjWLNxsC4XhqH80Zvd27ww0BmQDa+4tUkkKcbuSa9o1PjOMgZmwkskXbDaZcesgN4A==
X-Gm-Gg: AY/fxX7kknYBKqeXMVfyXyaOvxpkyDveOPbqggwpAO+490IYCUl6Ecuw+/Uf8nHSLV+
	MhYe+afmI63QjOuvwOisJYAwwUGa9HjdoDmXA+zame8Rm8F4KelDdULoJDJnKj0UshDjpBYGDXS
	kVFtp9BadrlsLBf7W4TN9ukw1/VRzE+qEAW6U68N4H0lHc/dEXZePkDpvyghtB21MP8vdrCld8x
	ZnY1pL2vyNiL2WZuPhY5ckiX7iS6S3ULHIn//KllAcUi1lX45Y4+/gvHcmNCu+R4dpJvRrMt1fR
	2DmKNeHGYzGIoo17bWURnMFxo2SVHFmywmOZ85qPd6GU21MPL0ezgEiMH+qJbba7uoe4rgZ8d5I
	tfXeTnz/X+7ucqHtyTNIKPNQLhRcgAQYbANzZF7b1teDdXl/hFgN/w7l5eSrznca7XBgKblofYA
	==
X-Received: by 2002:a05:620a:4726:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c08fbbbf2fmr2120920685a.35.1766470763656;
        Mon, 22 Dec 2025 22:19:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhKPyP8NjuiEvVwDteIDjwoxyq25xmJVZAy78YRrNoMvkacee1w1j5XXRq2Hc/UwrZGYtMdQ==
X-Received: by 2002:a05:620a:4726:b0:8b6:1877:3689 with SMTP id af79cd13be357-8c08fbbbf2fmr2120918085a.35.1766470763063;
        Mon, 22 Dec 2025 22:19:23 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44fe52sm98529406d6.45.2025.12.22.22.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 22:19:22 -0800 (PST)
Message-ID: <88bcd810-872e-4705-91c0-df2a35f4a3b9@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 14:19:18 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain>
 <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
 <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com>
 <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
 <CAPY8ntDAiJcJiixo2mTqcb898UC3AR-+NVPFPS6EtrGoEWKewg@mail.gmail.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <CAPY8ntDAiJcJiixo2mTqcb898UC3AR-+NVPFPS6EtrGoEWKewg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a346c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mracZNplAAAA:8 a=rL1dbJK0AAAA:8 a=EUspDBNiAAAA:8
 a=wZOUHB2QMR90tg45zx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=PluzFxL0rV-y9CnNSXcG:22 a=xbW4NaJqf-hZ9Pon6mAK:22
X-Proofpoint-GUID: 9ltMJpUySD80V5SH_im6xSX5PC-4fyZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1MSBTYWx0ZWRfX23LyfKVKvIi4
 DIL4mEnHV2ACOU/dMtCfLqgIgA1uxsCBbo10d9EgCWdLXwriGfsDasmZjRH+FnvX2B+r2LOV+5s
 toXztQS1TzHMizXVMDXI/2NmJjeSAHoyhXRmAo8diQi36EHf5ZqcB8NAtBPF6G+01C/MasKv4OV
 337hyLckAeeQFr6qrT9DeePePlrxBJeSNdKjyLD3pVE8ZfAjhFfk0V90K1IBfoNx/nRLAz6U+03
 O9omDwZLH441Xb/ud239hxxMyzF8ELCZxk2JfFD/UZkEvVyRWmUQiapPRZSQxsbrYmvzbzIDCbK
 kfC4RtdU77X+yTKf6ltY3Il4+EKyPdkfD7WfF/ckRJgu9mekW+08AWBFquakdeiDqmx8wqx0PZv
 k5ZooIAS9KUkMQ3eeJfGmJ04AQb43pnnk36osFer4U0w79S8Lg7H7fDA5Kzk+4NS4rvB7KgvjNW
 l1gX1wOKG3q1XORe4jg==
X-Proofpoint-ORIG-GUID: 9ltMJpUySD80V5SH_im6xSX5PC-4fyZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230051



On 12/22/2025 10:16 PM, Dave Stevenson wrote:
> Hi Wenmeng
> 
> On Mon, 22 Dec 2025 at 12:20, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 12/22/2025 8:11 PM, Dave Stevenson wrote:
>>> Hi Wenmeng & Sakari
>>>
>>> On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>>
>>>>>>
>>>>>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>>>>>> configured in the current driver. Increase the wait time after power-on
>>>>>> to ensure proper initialization.
>>>>>
>>>>> Is this somehow specific to the Arducam module? If so, what's there in the
>>>>> module that requires this?
>>>>>
>>>>
>>>>
>>>> Yes, This issue occurred on the Arducam 22-pin IMX577 module.
>>>> I have tried changing the sequence of regulator, reset, and clock, and
>>>> found that this module must wait a sufficient amount of time after reset
>>>> before registers can be written (10 ms is a safe duration). This issue
>>>> did not occur when using other IMX577 modules.
>>>
>>> Is it the probe that fails, or starting streaming?
>>>
>>> Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
>>> an official datasheet, so do correct the following if that has any
>>> updates.
>>> Section 7-2-2 on page 30 for the startup sequence.
>>>
>>> The sequence is meant to be regulators, INCK, and then XCLR. The
>>> driver does XCLR before clock, so that would appear to be wrong.
>>>
>>> It also states that T6 as the time from XCLR to being able to read the
>>> version register is min 0.6ms, but T7 as the time before you can send
>>> "Streaming Commmand" is min 8ms "To complete reading all parameters
>>> from NVM".
>>> That would be a difference between probe and start_streaming, although
>>> admittedly sending the mode and control setup I2C commands will take
>>> up some of that time.
>>>
>>> Plausibly the other set of modules don't have the NVM programmed and
>>> hence they are ready sooner. Either way I'd say that does mean the
>>> driver currently isn't following the defined power up sequence, and
>>> the patch looks reasonable for IMX577.
>>> However as this is a shared driver does IMX412 have this restriction
>>> too? I can't find a datasheet for that one to check. For the sake of
>>> ~9ms it's not going to make a huge difference though.
>>>
>>>     Dave
>>>
>>> [1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).pdf
>>>
>>
>> Hi Dave,
>>
>> this issue appears in the write register when streamon
>> imx412_write_regs.  poweron->streamon.
>>
>> static int imx412_start_streaming(struct imx412 *imx412)
>> {
>>           const struct imx412_reg_list *reg_list;
>>           int ret;
>>
>>           /* Write sensor mode registers */
>>           reg_list = &imx412->cur_mode->reg_list;
>>           ret = imx412_write_regs(imx412, reg_list->regs,
>>                                   reg_list->num_of_regs);
>>           if (ret) {
>>                   dev_err(imx412->dev, "fail to write initial registers\n");
>>                   return ret;
>>           }
>>
>>           /* Setup handler will write actual exposure and gain */
>>           ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
>>           if (ret) {
>>                   dev_err(imx412->dev, "fail to setup handler\n");
>>                   return ret;
>>           }
>>
>>           /* Delay is required before streaming*/
>>           usleep_range(7400, 8000);
>>
>>           /* Start streaming */
>>           ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>>                                  1, IMX412_MODE_STREAMING);
>>           if (ret) {
>>                   dev_err(imx412->dev, "fail to start streaming\n");
>>                   return ret;
>>           }
>>
>>           return 0;
>> }
>>   > but T7 as the time before you can send "Streaming Commmand" is min 8ms "
>> I think the usleep_range(7400, 8000) represents the 8ms duration
>> required by T7.
> 
> I'd missed that one.
> If you've delayed for 10-12ms between coming out of reset and sending
> the first command, then does the Arducam module still require another
> 8ms here, or can that be removed as you've already complied with T7?
> 
> Have you asked Arducam as to why their module takes longer? I can't
> find an IMX577 module listed on their product pages so presumably it's
> discontinued. There are a few links for a Luxonis Oak DepthAI board
> [1] which is made by Arducam and is using IMX577, so is it that one?
> Generally I've not encountered an issue with Arducam adding any weird
> delay circuits on their sensor boards.
> 
>    Dave
> 
> [1] https://shop.luxonis.com/products/oak-ffc-imx577-m12
> 
>> Thanks,
>> Wenmeng
>>
>>

Hi Dave,

Based on my testing, moving usleep_range(7400, 8000); to the beginning 
of the imx412_start_streaming function allows the Arducam IMX577 module 
to work properly. In contrast, other IMX577 sensors do not require this 
delay. I believe this corresponds to the T7 timing requirement. I have 
not yet confirmed this with Arducam, and I plan to compare once I 
receive another type Arducam IMX577 sensor.

Thanks,
Wenmeng



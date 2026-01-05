Return-Path: <linux-media+bounces-49884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5ACF25AC
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 09:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64A56304BD0C
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 08:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145430E84B;
	Mon,  5 Jan 2026 08:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aS5lVBgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDWy09G6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DFA30DEB9
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767600880; cv=none; b=E+RaDDM4o8kewPtoH+SVNq1015MaTjnU0/EwLWwJRVjyXh8MaefiZayfZBmb6hAgV8/Z+apWHDpIcHE1aY5xfQhhu9YKJLWEULc0XILVuuB3FwoN8ui7JLRcgpgwtnpaSoIX93GGPi2hUH/gbmTpBvsL8CIXm7hO4mE0UtmrXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767600880; c=relaxed/simple;
	bh=TYY6BNSDQsgSuMCgB1bD+vqO5W39ptBJmrv2adHFBRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poth3vrZKUwUHixZmOsBlC+JfOyvAiAwi8P+pTdNlIkBouk/kP/rso8sQNQh75b6w5p+qs+TqRMyYAGvpuMTL+FRrgzCL4VMZkEOqMK6LYKVTwBQ874rjn426c0OZhvU/C4c89EpbDjo8JR/lTV19ydK8QoxShnsmxti8EuoAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aS5lVBgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDWy09G6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Mnf8j1113132
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 08:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phzZUdczsGAzJ2VTKu0mS32y13KkKxQihXQMekfoVrU=; b=aS5lVBgU2jyjm/IE
	gJahBDjEI8F2gXJpzfKvy5+Wnn63UbslIPI0TpnmLkJ6yJ23fPam1XIHa2Ty00Ff
	CzTQGg0Ptw3WrEIdUbzQqYc5BF2EzsLrbP+ed0+Thivc1Z/PfzWjp4TE+BtbjHGC
	78qhKKBg+wSF+eAWjDKD3fWIrtR/twM4rkB8iIuc8xB2ekC0zHmr89JABNbMXJb+
	FJoD/tTEMjseRgyczUS+/fpNaxoUB8xZc29mCYCCEp4MMc9Fc66LOmHAbCvEQlfQ
	Dl6mizIsOCEKqsKqOMMOWo+fg9RQGlfMY+SHIvH87BrqoLkgiBTQNOmMPEmB6We8
	tDDZ6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hbntw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 08:14:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c35a72a116so394081285a.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 00:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767600868; x=1768205668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phzZUdczsGAzJ2VTKu0mS32y13KkKxQihXQMekfoVrU=;
        b=TDWy09G6VZWZ1qtzhNzNf2/xQg5ZVkgw+lTosAKJ50Lyd85QjKmUMf5j0CCcyKmMP5
         5+8AJZL8y9wdvYCP5fsMCfIdGEP4iZ4n/3mdByLUCSjzHmAFhVHPH4+s+SRuGwQ3TS+H
         AfdGoJdeD3wXbmZV+fsV/OwyOzFGUvKjczK0c59Q/nbw+T3KLZ/8orH7mUjNabp6PLIJ
         +LaR0oSK1uOGGfYdbWD5pXORmNe03SjW4zcWlvmk3tauFRVpInlut5466B8JVWiQ5MR1
         LoQzN6sb0eAw4fgOtaRRfhcjLSNyhT8pLEfXIzG4Ws/MH0lHaCEpUzdzkE6MvKnGP/95
         ggpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767600868; x=1768205668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phzZUdczsGAzJ2VTKu0mS32y13KkKxQihXQMekfoVrU=;
        b=VTFZcV3jZebhF3DJdvgQ1ybPOIwfir9VfRf/wZGoHvtui7iZG1WZVKt5SYGdpUIBuW
         rqzYu0c8dTKimath+6AVbREMcAQrtB3vwsBmSpDbw92Wc4hHdrDHieRqSWfTwN5C9Y7u
         B87OkOBW1ou5UYP3+IlCk0MeVldFvB1B2gD2dIp5a8ReuheVx9Z/1MfEpWrzKtmY8Ab9
         N4ZF7mL1VbuzC3jTFlp800hMwCgL1t/KzZKMCo877lAOeyewA82FzqYXTfVdW3RpuOCt
         w0E96i3gxOlGctj+u4kJZTds1MWSPBCbYsXDIDfN7g+Z3XzLKI/QJfQpJiGFGIwY+KVj
         Vspw==
X-Forwarded-Encrypted: i=1; AJvYcCXHDPBnQxmvGMuK5mCxkgFbU5pUo0DCRNWpXIR3lWepCaY9wt0G3iu12+fsquxWP5ej3ore2AK4w3CAxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ZSaSY8+aUBlq1Lb9grhCB6xLlSLYgFVeZMpeERdxLuFe1lbo
	sfw3o9t+f+W624+ydiIuuyCVlqCTM3pvdyssz8IGLpP5kUrg2kYlmFUIslKbBnGytFs5gs9qoFv
	TXUVpl0/CN/qqXWxjU+RxeQcS7gv8fpM7BXsXuby+WwkdmrlvW9a1KdX6aayD9xeiig==
X-Gm-Gg: AY/fxX5Y2qTrTdDQiUTVaQUFtp2nQvvZ2KDabyQj2jzgkqwF0jEoz4UVCzpAGgmWiF7
	rk/uB1j32d4594dOz54JgaepBIby2VoetUyKDIBnttkth2HvRY9NkzMwQ3dZOGjZuHkokYxUGx3
	LXzq05K3WS1tBM4+RjTnxffcjb++Ofh6K7GfJFG888Mk8fBuAIf9LTLL8qIHwHL/dCjkFD5j8QX
	m261iU+WSHvWb8kTRc4Fv2tBlTTObuRSHMvYtYicd0Eg8f0NC8SHgsxrGdnzsvcmWKWDWanSDlb
	q7HTvdDnjl/H+eMbzLjwHLFH+f2RGRi2sveFF1heUaNRJj/RmqlkhbolOF6Sp5aJRhceglRzEvI
	XFFwEJon0f9aFdI27ZdUVgyuvD9rkSzAAnh+9xYWs0ai3AXHXz3oCHsFovgdcuDj8/l/VfKmN
X-Received: by 2002:a05:622a:5912:b0:4f1:8412:46e9 with SMTP id d75a77b69052e-4f4abcf6815mr684003551cf.16.1767600868228;
        Mon, 05 Jan 2026 00:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8cxSP7wU2d3C/OWNPNHpSnTaGxucl0xLQE6eh8k4RCRNqDywhXyIz7QesYuRmn36sn1u57Q==
X-Received: by 2002:a05:622a:5912:b0:4f1:8412:46e9 with SMTP id d75a77b69052e-4f4abcf6815mr684003371cf.16.1767600867656;
        Mon, 05 Jan 2026 00:14:27 -0800 (PST)
Received: from [10.38.247.225] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66865asm364865021cf.31.2026.01.05.00.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 00:14:27 -0800 (PST)
Message-ID: <b2cf8a59-a8bc-405c-8b7e-78805d0b4502@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 16:14:21 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx412: Extend the power-on waiting time
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
References: <20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com>
 <aUkLKECix4vohyTB@kekkonen.localdomain>
 <bbf6dbc9-42b5-4dd6-9346-c8f38e460709@oss.qualcomm.com>
 <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com>
 <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
 <CAPY8ntDAiJcJiixo2mTqcb898UC3AR-+NVPFPS6EtrGoEWKewg@mail.gmail.com>
 <88bcd810-872e-4705-91c0-df2a35f4a3b9@oss.qualcomm.com>
 <aVO4oX2I-FEuR4WS@kekkonen.localdomain>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <aVO4oX2I-FEuR4WS@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3MiBTYWx0ZWRfX8jNmXj6+Pc74
 pWRLA03+69d4QPVtcF0m4sGPEBOZ9QYfhLiOLmTnpSig13GzJEOrc+GMjadfO+DqWBtpjsS4LHA
 C6TyZEbmR65afkD5PjnE4/ISD83shGcJgRR0wKwsFxhAKJ0z3PutUJG0zhH+G6RWL9uENgiUUe1
 w0QTP11j5Y47aUxyXuGBylF5af6jrgxIdsqVcOsE1WC8g4ryVXuksWkGtI5LANHwZ2gv/TOkem0
 yiwl+6qPQLGCukQswLvFXjJRYtM3zRf8pq9M7Yl1L9OW8HXqLAQmE4TZhCQUowhRWwoiArTe0VY
 pK7NYrg2JCF/E4T2bvPel0bZoXcwGL8UAb34IbY3+WKzyYzcuj09t1fIdBiMuNCdyc/6sB3BFGF
 FL4GzJZCk7dzi4rpxjsdzZOXGJKuQgX9i6RpdS+pbXRQ12KeBRpwmyF+ERpaeS1z92/B/2BpXXL
 SOeaTo6eu0+5kse9gzA==
X-Proofpoint-GUID: pHGZVbbK3CramExB4xMSZvF6QiY85dzv
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695b72e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mracZNplAAAA:8 a=rL1dbJK0AAAA:8 a=0plRyFmWAAAA:8
 a=KtRVGM7OAAAA:8 a=EUspDBNiAAAA:8 a=F5uwWvBdR0jjad105IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ct7v8gV3xnkA:10 a=CgqesQyPL7wA:10 a=Bv5VFBYUiN4A:10
 a=ph6XRQtNn88A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=PluzFxL0rV-y9CnNSXcG:22
 a=xbW4NaJqf-hZ9Pon6mAK:22 a=4tO_KGIOfzmgBqjB6OKc:22 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-ORIG-GUID: pHGZVbbK3CramExB4xMSZvF6QiY85dzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050072



On 12/30/2025 7:33 PM, Sakari Ailus wrote:
> Hi Wenmeng,
> 
> On Tue, Dec 23, 2025 at 02:19:18PM +0800, Wenmeng Liu wrote:
>>
>>
>> On 12/22/2025 10:16 PM, Dave Stevenson wrote:
>>> Hi Wenmeng
>>>
>>> On Mon, 22 Dec 2025 at 12:20, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/22/2025 8:11 PM, Dave Stevenson wrote:
>>>>> Hi Wenmeng & Sakari
>>>>>
>>>>> On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>>>
>>>>>>>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>>>>>>>> configured in the current driver. Increase the wait time after power-on
>>>>>>>> to ensure proper initialization.
>>>>>>>
>>>>>>> Is this somehow specific to the Arducam module? If so, what's there in the
>>>>>>> module that requires this?
>>>>>>>
>>>>>>
>>>>>>
>>>>>> Yes, This issue occurred on the Arducam 22-pin IMX577 module.
>>>>>> I have tried changing the sequence of regulator, reset, and clock, and
>>>>>> found that this module must wait a sufficient amount of time after reset
>>>>>> before registers can be written (10 ms is a safe duration). This issue
>>>>>> did not occur when using other IMX577 modules.
>>>>>
>>>>> Is it the probe that fails, or starting streaming?
>>>>>
>>>>> Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
>>>>> an official datasheet, so do correct the following if that has any
>>>>> updates.
>>>>> Section 7-2-2 on page 30 for the startup sequence.
>>>>>
>>>>> The sequence is meant to be regulators, INCK, and then XCLR. The
>>>>> driver does XCLR before clock, so that would appear to be wrong.
>>>>>
>>>>> It also states that T6 as the time from XCLR to being able to read the
>>>>> version register is min 0.6ms, but T7 as the time before you can send
>>>>> "Streaming Commmand" is min 8ms "To complete reading all parameters
>>>>> from NVM".
>>>>> That would be a difference between probe and start_streaming, although
>>>>> admittedly sending the mode and control setup I2C commands will take
>>>>> up some of that time.
>>>>>
>>>>> Plausibly the other set of modules don't have the NVM programmed and
>>>>> hence they are ready sooner. Either way I'd say that does mean the
>>>>> driver currently isn't following the defined power up sequence, and
>>>>> the patch looks reasonable for IMX577.
>>>>> However as this is a shared driver does IMX412 have this restriction
>>>>> too? I can't find a datasheet for that one to check. For the sake of
>>>>> ~9ms it's not going to make a huge difference though.
>>>>>
>>>>>      Dave
>>>>>
>>>>> [1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).pdf
>>>>>
>>>>
>>>> Hi Dave,
>>>>
>>>> this issue appears in the write register when streamon
>>>> imx412_write_regs.  poweron->streamon.
>>>>
>>>> static int imx412_start_streaming(struct imx412 *imx412)
>>>> {
>>>>            const struct imx412_reg_list *reg_list;
>>>>            int ret;
>>>>
>>>>            /* Write sensor mode registers */
>>>>            reg_list = &imx412->cur_mode->reg_list;
>>>>            ret = imx412_write_regs(imx412, reg_list->regs,
>>>>                                    reg_list->num_of_regs);
>>>>            if (ret) {
>>>>                    dev_err(imx412->dev, "fail to write initial registers\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>>            /* Setup handler will write actual exposure and gain */
>>>>            ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
>>>>            if (ret) {
>>>>                    dev_err(imx412->dev, "fail to setup handler\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>>            /* Delay is required before streaming*/
>>>>            usleep_range(7400, 8000);
>>>>
>>>>            /* Start streaming */
>>>>            ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>>>>                                   1, IMX412_MODE_STREAMING);
>>>>            if (ret) {
>>>>                    dev_err(imx412->dev, "fail to start streaming\n");
>>>>                    return ret;
>>>>            }
>>>>
>>>>            return 0;
>>>> }
>>>>    > but T7 as the time before you can send "Streaming Commmand" is min 8ms "
>>>> I think the usleep_range(7400, 8000) represents the 8ms duration
>>>> required by T7.
>>>
>>> I'd missed that one.
>>> If you've delayed for 10-12ms between coming out of reset and sending
>>> the first command, then does the Arducam module still require another
>>> 8ms here, or can that be removed as you've already complied with T7?
>>>
>>> Have you asked Arducam as to why their module takes longer? I can't
>>> find an IMX577 module listed on their product pages so presumably it's
>>> discontinued. There are a few links for a Luxonis Oak DepthAI board
>>> [1] which is made by Arducam and is using IMX577, so is it that one?
>>> Generally I've not encountered an issue with Arducam adding any weird
>>> delay circuits on their sensor boards.
>>>
>>>     Dave
>>>
>>> [1] https://shop.luxonis.com/products/oak-ffc-imx577-m12
>>>
>>>> Thanks,
>>>> Wenmeng
>>>>
>>>>
>>
>> Hi Dave,
>>
>> Based on my testing, moving usleep_range(7400, 8000); to the beginning of
>> the imx412_start_streaming function allows the Arducam IMX577 module to work
>> properly. In contrast, other IMX577 sensors do not require this delay. I
>> believe this corresponds to the T7 timing requirement. I have not yet
>> confirmed this with Arducam, and I plan to compare once I receive another
>> type Arducam IMX577 sensor.
> 
> Thanks for investigating this.
> 
> Have you checked how long it actually takes elsewhere (where the sensor
> works) before the mode related registers are written (and when they start
> being written) on systems where it actually works? As I²C writes require
> sleeping and depend on a process getting scheduled a large number of times,
> this might play a role here.
> 
> These patches might be useful in sensor drivers at large (but won't address
> this problem)
> <URL:https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/pm-resume-delay>.
> 

Hi Sakari,

Based on my testing, it takes about 6.5ms before the registers become 
writable. I believe this is not a CCI issue, because I have tested 
multiple platforms and only the Arducam 22-pin IMX577 shows this 
problem. This delay seems to correspond to the time required for T7. I 
made the following changes and ran multiple tests, and this approach 
works fine:

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 459cca36493e..5be698863653 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -798,6 +798,9 @@ static int imx412_start_streaming(struct imx412 *imx412)
         const struct imx412_reg_list *reg_list;
         int ret;

+       /* Delay is required before streaming*/
+       usleep_range(7400, 8000);
+
         /* Write sensor mode registers */
         reg_list = &imx412->cur_mode->reg_list;
         ret = imx412_write_regs(imx412, reg_list->regs,
@@ -814,9 +817,6 @@ static int imx412_start_streaming(struct imx412 *imx412)
                 return ret;
         }

-       /* Delay is required before streaming*/
-       usleep_range(7400, 8000);
-
         /* Start streaming */
         ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
                                1, IMX412_MODE_STREAMING);


 From the perspective of the spec timing, I believe the above 
modification to the delay position is an acceptable change. What do you 
think?

sensor link:
https://www.arducam.com/arducam-imx577-mini-camera-module-for-qualcomm-rb3g2.html
https://www.arducam.com/arducam-imx477-camera-module-for-depthai-oak-b0369.html

Thanks,
Wenmeng




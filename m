Return-Path: <linux-media+bounces-49347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C35CD5F65
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C160300E46B
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 12:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6612B261B92;
	Mon, 22 Dec 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWcddcus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQThJ9xn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D425DB12
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766406022; cv=none; b=gOhqyTZMiCBOJOhjSlAnbI3f5n1Gndpc5Yst41gc0n2F3GhN51ypg+Haik8DNbRW2yFCikW0oyVe/bp7wEkyLq4bWZldaPTBd94BjdkZ4XF7N5OirldUTlvMXVlVywb2abBARBwVK2/TWR2w87pvckixXxjS37OyBqTWLknLQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766406022; c=relaxed/simple;
	bh=hSElS2Uef737tKo1ukU7U73Lo6PKCWfh7WYv2HtyUvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9ZXABF6kDIuzAPedLsYpv9RPWry5mobrG4qtp1LoZs8tbjhjJpXcZpZHYrapyrAg2A1WKkrq30VIzzCdf+9R3XqfhPW2N3ldwDioWLpjT0fZ6J5XSry+EfptGpwnbV1hGWe9J6i3LnSmN89xQZmqTdSWUj4FlC4lSELvctIkTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWcddcus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQThJ9xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM9YoxI1603486
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 12:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJQIrCMs11fewhHop9y7z5hixbp3AMEX4Y+bMI41S/s=; b=FWcddcusVCzgy6z4
	xo8iKh2XfBttARsSTwwIAqpHUgIoQaqW0Qg4p3KIdZnb5GtZvBo4/OA2/9ueFopQ
	GGUDsVpg+GeOvvKyFGgUtiN9Yy/CeGSqPre63oSejKZ57QneQAHVXN9apLzPT52M
	PrH4a99SLSgXdnUWO4G8DXVD3cdq+u2d7xzYjsPp0beT8s2kygsN3OFXuclCY104
	5RjZ17N6GqbhyjuiMmuDX4qVEBnCdPLXDikoV+bdMDz7woamiP6na4SHYtAsvv//
	JJwneAdCd61p+g66eqUENFk3CAVwLrjs+l+4BLZN2Jlhdj2XVJyVhKLQIP9S3qY4
	os3Pfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwre6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 12:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so1301902485a.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 04:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766406019; x=1767010819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJQIrCMs11fewhHop9y7z5hixbp3AMEX4Y+bMI41S/s=;
        b=JQThJ9xnrpBke89cR+7edXsx0/WdTcnqJTpcIRGSHZQa8lXoXpvlq/nVNFZSx1QYgf
         r1+rA49OnNJ6dHDwoBxRkqwOpyDqD4927aHc1BwtCcEq/xCiK2FnwINDnnPd225swpdh
         nBqlxhZKUow9123AtEOI/qhTk6i5firItDjBMOnVAMd5Of2/Y2iclMf1N7K0Q78b947Q
         4VITA6JK5iT+Y7QbXUk50en/IgyuE6Ua3sfQ6unHMk07NZBs5hzZYPVXC2GrlJAxxQNd
         6PWiLVVqrE0KS0GIkkuaXilvyeU+s5V6/XsX1TjOhW+uQLlTSfDUCZHTe82LhClZXvxu
         yKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766406019; x=1767010819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJQIrCMs11fewhHop9y7z5hixbp3AMEX4Y+bMI41S/s=;
        b=GfUojSaPEGhWrWCfvob3W4xjvjhf8V3OJ0uEBt/fdUDJjFrG0x9Yl3DkaPJ3VFCCCT
         C0+NwFaGw+Hep4D73l69QpXi9VJMOPjA7GxmKH0imdvppph0JJhH5UnwBTwjqjbiF+KY
         i4RcZnXv+fA21SPozOfp1t86khlaXfby49bY+d89TVkkF/SitJDgy/mHtT4p2xXmi849
         9z3VJZTaUGb3WZCJRbOn9M6475kafRTs9sfvkLpsbMKqD4rEI5h9ir59crDTn5MqsY7R
         DQ4322IXl9shdw8w55uqnvyTZAzl+f87M5u9r+kHa2voWMU4WbCpkrRyrct0+kTDiSNz
         NLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCUl+MHK0LbM80VoHLeCCiuP+c35UumA+p9jwTteHhYjae8XTvfi6Sic9S6JT7OOGzLRE3pZiMizPOcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyituh9iUDmkZjbAUwNtTrSG1nxlmhDTcA961l7ZmSDx3eVC3gL
	tNAObwH2ZsLQP2KxCuGOKoh/slHfcTZ9es39bJWXirF8GcFeaMROZtW+QNsGrY9+GZZ7zaxSHxH
	Yjadyvv9d0xaQbgaXoKHA2o9Rq8FnyO1ivkKjvhT/k1Kk5zljTwhqGRfTOtPxxQDKgg==
X-Gm-Gg: AY/fxX651NXxigagrB0CTkS/tVsn0Q+FUwCuGX89hME5bW0M1/H26NZSGZpp5ys2bxa
	/bHliDEvDNdtva1hIckLGIEoT5zZkDXZAGvgPy0tXhHw9LOkosuVRn1HK5AdOehQvN/iVK37nr6
	Cl0lV/mZdAx3KawJfK7OtlttJjm0nI+UtzqsYA14R2dfUTahclhfphrCIiNEzuME+lS1vAJXoqy
	QGJzyiIPT9Nm1J87s4ExPt0dLsDjtjHOZ6nrNpGh8hx+0iF8fd4xfULgmbycRrrpuVyV/VAMoA3
	9jOc8pqyBwv5FUJg2w3boB9l8Z7cVR4KFQU5fpl5oux5og1GV+ZrthxS/v5s3GKWwubPySlWlo4
	uMHKrUOA9mviznLoMMrEwt5kK6yw/1QJIbv/mrhYxks0tZZPJz/TWOK2GRzWVwO8pCpWGp+A0
X-Received: by 2002:a05:620a:4103:b0:8b2:ef70:64ec with SMTP id af79cd13be357-8c08fa9c487mr1722509485a.46.1766406019213;
        Mon, 22 Dec 2025 04:20:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQb1rkOfJwW+v57bqcbsQE9rLJRlp8FkBKkuKfcCc/ztidRVYCikkRcV8YtppifkTkEcQOGQ==
X-Received: by 2002:a05:620a:4103:b0:8b2:ef70:64ec with SMTP id af79cd13be357-8c08fa9c487mr1722506385a.46.1766406018794;
        Mon, 22 Dec 2025 04:20:18 -0800 (PST)
Received: from [10.38.247.176] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783a81sm815854985a.9.2025.12.22.04.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 04:20:18 -0800 (PST)
Message-ID: <ffa7b849-51da-42f7-be1d-c3c7e1903e6e@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 20:20:14 +0800
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
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <CAPY8ntD9GO_Y13K=Ko5kxz-o1edaocJP=Ns50rUheJP0iJ9fNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69493783 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mracZNplAAAA:8 a=EUspDBNiAAAA:8
 a=KQlso0h61xnv56-FdG0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=PluzFxL0rV-y9CnNSXcG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExMSBTYWx0ZWRfX3sEcYYu+RGwR
 gyMfFOAXMlnQmNC7ASnr+XlkxZ1VpuSKEURPGAhGsX+NSLazA/Xj9XW3fmXLdmLg1wKWR5nQRB6
 hvbWKH+i/Le8XLMpGzFcYyHJ0W8vpA1zq7pKuw8DDPtVGdITgNHP1Amr7IKsjJEYhMSJrerp3mI
 //Lwt6OPPTM7g7/Z1t+Uas5XWE5+H6969jpKaCCMLfxB190TBJdkmkflEC2AnXwKj0wq4aXFOSH
 iCt1sfnnigZLyPl5tWc7wz3BxMy+0MTXB5Si+lsVCzW2OLQ9hqwGOeIpivcuCe+i3TNYwkHJSCK
 7DULNHidsdIEt17aQuvvvQAJuLVRJaox7UDIoQVw3qOvKw2XIXZN2uCmVvVN8NIthGvTVjzGHFP
 2SQRP2yqcq6pRRy49fVlDOAD0Fi5ZmRSqIVixYvPhEoyfQJHEuoINvAnxp+10Qh6D42Am9Izgxd
 Qmsf7SNVnBewsMwz71Q==
X-Proofpoint-GUID: SNkZN3UhDRb16GA2nUsbVvaP5mHaW1PO
X-Proofpoint-ORIG-GUID: SNkZN3UhDRb16GA2nUsbVvaP5mHaW1PO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220111



On 12/22/2025 8:11 PM, Dave Stevenson wrote:
> Hi Wenmeng & Sakari
> 
> On Mon, 22 Dec 2025 at 09:35, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> wrote:
>>
>>
>>
>>
>>>>
>>>> The Arducam IMX577 module requires a longer reset time than the 1000µs
>>>> configured in the current driver. Increase the wait time after power-on
>>>> to ensure proper initialization.
>>>
>>> Is this somehow specific to the Arducam module? If so, what's there in the
>>> module that requires this?
>>>
>>
>>
>> Yes, This issue occurred on the Arducam 22-pin IMX577 module.
>> I have tried changing the sequence of regulator, reset, and clock, and
>> found that this module must wait a sufficient amount of time after reset
>> before registers can be written (10 ms is a safe duration). This issue
>> did not occur when using other IMX577 modules.
> 
> Is it the probe that fails, or starting streaming?
> 
> Google has found me a datasheet for IMX577 at [1]. I'm hoping you have
> an official datasheet, so do correct the following if that has any
> updates.
> Section 7-2-2 on page 30 for the startup sequence.
> 
> The sequence is meant to be regulators, INCK, and then XCLR. The
> driver does XCLR before clock, so that would appear to be wrong.
> 
> It also states that T6 as the time from XCLR to being able to read the
> version register is min 0.6ms, but T7 as the time before you can send
> "Streaming Commmand" is min 8ms "To complete reading all parameters
> from NVM".
> That would be a difference between probe and start_streaming, although
> admittedly sending the mode and control setup I2C commands will take
> up some of that time.
> 
> Plausibly the other set of modules don't have the NVM programmed and
> hence they are ready sooner. Either way I'd say that does mean the
> driver currently isn't following the defined power up sequence, and
> the patch looks reasonable for IMX577.
> However as this is a shared driver does IMX412 have this restriction
> too? I can't find a datasheet for that one to check. For the sake of
> ~9ms it's not going to make a huge difference though.
> 
>    Dave
> 
> [1] https://en.sunnywale.com/uploadfile/2021/1222/IMX577-AACK-C(Awin).pdf
> 

Hi Dave,

this issue appears in the write register when streamon 
imx412_write_regs.  poweron->streamon.

static int imx412_start_streaming(struct imx412 *imx412)
{
         const struct imx412_reg_list *reg_list;
         int ret;

         /* Write sensor mode registers */
         reg_list = &imx412->cur_mode->reg_list;
         ret = imx412_write_regs(imx412, reg_list->regs,
                                 reg_list->num_of_regs);
         if (ret) {
                 dev_err(imx412->dev, "fail to write initial registers\n");
                 return ret;
         }

         /* Setup handler will write actual exposure and gain */
         ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
         if (ret) {
                 dev_err(imx412->dev, "fail to setup handler\n");
                 return ret;
         }

         /* Delay is required before streaming*/
         usleep_range(7400, 8000);

         /* Start streaming */
         ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
                                1, IMX412_MODE_STREAMING);
         if (ret) {
                 dev_err(imx412->dev, "fail to start streaming\n");
                 return ret;
         }

         return 0;
}
 > but T7 as the time before you can send "Streaming Commmand" is min 8ms "
I think the usleep_range(7400, 8000) represents the 8ms duration 
required by T7.

Thanks,
Wenmeng




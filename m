Return-Path: <linux-media+bounces-44061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F31BC841F
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 11:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE9034F7D07
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B947F2C0F68;
	Thu,  9 Oct 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTAlmZbQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3801212568
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001578; cv=none; b=bEYjoggQgQrSh1T3TKHXmXnJDtu++jZnzN3t6oDzAiCC0cjzrhdgt+SubfNPsu55kbIp/VHrb9V53M2JoIRukJNM4Yyxew44blY6/N7HXH/U2i4L8DtjZTmONfBopaz1BvA6ObfpY89w6IQTd1iph3h/neidzAx0fTxgkpxHOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001578; c=relaxed/simple;
	bh=rL2huFCoecuT5szCUTmVqW1ZGomFSlEpfa9WmNVvulI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9z7dbGqH0TyxHxuWOmccdN/PqZ3k8MReF9vEKF2S5TxtYzFf8hayj+OwKLQUDSYgUUE66z/dyE4P6IHfzsGkElhBDGddlbQlJweSYiklkqMalGm8nbifxQYfw8YLHbewJ2oJB3VfYkfnV2fP4OG6JIpimRpVfU67r5LUgo+83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTAlmZbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EhdC022547
	for <linux-media@vger.kernel.org>; Thu, 9 Oct 2025 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3s2fVbPRluI7eDHiaLG3gvuhMixD8+CyT+KTHVqigFY=; b=pTAlmZbQptxQFEKv
	8jRisGHCORuqRmA9o2/5JouEE+y8ybJ9itpSvdmP0hmhqGTJ3BUrT1iWKbXsxzIJ
	hJSRjIumHn6lK0+X1FZRRT1ipls/dnj13KJkpB9oKEHMzRD3fNopCTGbXbQTkXeZ
	5PayGovQS1QYVvR2HPV1ePEVwhpRh/Q3cwwMu6ZUONAUVg2QRahH0XR7p7EtxXrF
	LXI7/wAayVO900/G/VK7QT/sJoVILIIf6tDy8o8xe+iU3HxIOZFO5YG92tUVYziG
	dVjEdGn3oz9yV3IwyfO8/xmxFf13yOyk7pmnnwIMsQy/pprlzLoTwuIvmnbhkToc
	evvTgg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sj6ty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 09:19:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bb67409e1so2063666d6.0
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 02:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001574; x=1760606374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s2fVbPRluI7eDHiaLG3gvuhMixD8+CyT+KTHVqigFY=;
        b=kpKwpYYrxnRfL84v5tycoDyABz5BUK2bf6ROxk2+nxtAFsA4C8X5PpHOcsyOeQDKRH
         2dSRwrNlzwq8JEAxV1OCbDJEHe8ExbTOYuqMOma/wkO7cbxKK+96nURwRUhJ76cBuEpj
         CyDPjdP6xrJgMccD7Q98diXBg7NtLL+aEw8iAREv6zmyEZHLicTdO3k9MRbMCRb/eNzo
         p7sZi2qTUPvrVs8XkvBMPize19RjENM5MfMRSBRY3fH27uOghUhnQRozuypu0kmeqmo0
         T2dhLbzp1cPZug4Y/+3jo2D2R0R/4yNmdTnJTt3WQeiFZNXNrqhuukdYmhb1OnViecBP
         XtPg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+r4GgOBIhaejhDg0Z8ee6Q/ZVmj87IzHSijakpI/QR+RepdxuX7cUJMqYbym4PhIAXr8wKo890jmFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0nzETxAnS82NWaBbzTBrrM+3F8c0r8ZKyB5NYmnGJA/8u56w
	s8DzEZX+mqL4McY7DfKShQhywaYk20HIMCyRJeMvsqNxsztx+fSp+KoPRdZRfZYLTq8FPK+jouj
	bIQKIzuNa5ClAbpVs8m1hC3a5St6CWKTgte1DCyBVrdpGtvVVjhK3ATSGLNIfAt8E6w==
X-Gm-Gg: ASbGnctYfoOdHR0wE2/9zuKdxfubft9C7I5heafTQslovqpiJel8BNC25vbMXhm/Iw0
	BGE0Zy9LVLtOK257rhUoRdl6ArElr/hzzYuuDL9OK4JqWORQCwv9QpGys2Op7wd8IPHJySGgWxc
	dVVOmkJ6yBMj27fg8A9aEwKs9ioAT5HwcRfeMBEqvNHmgbFtGS/8ecvYYJI50yzvi4m48eAVTUB
	skeAXEXtXP7SFAz7NT0pREZQm7CuM/p3yyz3tEYYNMpbHpVb/9e8jgP3ADg1/vHoiI8yXowq+Tj
	VfDGFes4dB4TGpbT/eOw2URzyw9YpT4OB4ZCyiZ90sSmoEuPIDmYk2GNNOaC4DPA7eZozyohODt
	xT+XGOiy3FmHCCXWtF5AfG+7C/no=
X-Received: by 2002:a05:6214:20ca:b0:78d:8226:756b with SMTP id 6a1803df08f44-87b2ef6cfbamr57118316d6.5.1760001574287;
        Thu, 09 Oct 2025 02:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2A1qU6LGjzQ74Et+6jXPQ4yzYwrsyoGAKooxWn5Jtt1h+1kAwu/8fhUl8mDlFd2X7Bmfg6Q==
X-Received: by 2002:a05:6214:20ca:b0:78d:8226:756b with SMTP id 6a1803df08f44-87b2ef6cfbamr57118096d6.5.1760001573829;
        Thu, 09 Oct 2025 02:19:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4106c60sm1931662a12.43.2025.10.09.02.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:19:33 -0700 (PDT)
Message-ID: <1118c126-4332-4f9b-afb8-d3da4fa7fa87@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 11:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: enable support for SC7280 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <20251008-iris-sc7280-v1-8-def050ba5e1f@oss.qualcomm.com>
 <3f1979d4-1438-4c9d-99db-d97a09c5c35b@oss.qualcomm.com>
 <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <gdui5coiazt5ynuz6c6mr5slau33vuewr55vx53m5zzyi537at@cs7dbgirijuw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GFEHXyMAjyPa569AwviXHlm3nJOI18vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5BZbC1TjetgZ
 3FyB/d83RcMPlPx9QzSnHlHfJ87OdpiAk2V+gi0Ya/sETsV5aos4t75uutP1DVfqfdFDdXUOoJB
 Xbq6vcqmpiwp+uiTsupLUL5jwIPD74UAp/a+OxrDYnFa8IhJNeDopWtR0K7TcRay9m+3tKDTPcC
 dn9KgcUprhGUnE3GPnl9bal7fUcCCMjZeb5zPxvluQOuMC1JAzUD+JkMbONozbGT9sis8V0sXEr
 O+qPsIIrQnm2DAuAZNLV4xOE4PfF2vnMdLY8UupZcHOD+WEKyRtQv+5t2u2aTTRlkGcIVmPym0I
 q2ve0uDPSHhvEzt/R65q27FRKmxXvhsEA0MnXDZcxMAOwhw1W1UzXUcOEq3qyHkx7s5uvrNdwmK
 O9TgJEs3myaOlmSX2Jkka9JPscIFgA==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e77e27 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=LpQP-O61AAAA:8 a=4qWUmPOJchojXs7f-_4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: GFEHXyMAjyPa569AwviXHlm3nJOI18vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 9:25 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 10:26:02AM +0200, Konrad Dybcio wrote:
>> On 10/8/25 6:33 AM, Dmitry Baryshkov wrote:
>>> As a part of migrating code from the old Venus driver to the new Iris
>>> one, add support for the SC7280 platform. It is very similar to SM8250,
>>> but it (currently) uses no reset controls (there is an optional
>>> GCC-generated reset, it will be added later) and no AON registers
>>> region. The Venus driver names this platform "IRIS2_1", so the ops in
>>
>> Which we've learnt in the past is "IRIS2, 1-pipe"
> 
> Well, I'm open for better suggestions. iris_vpu2_no_aon_ops?

[...]

>>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>> +
>>> +disable_power:
>>> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
>>
>> ..for this line
> 
> Not only. You missed the absense of AON_WRAPPER_MVP_NOC_LPI_CONTROL /
> AON_WRAPPER_MVP_NOC_LPI_STATUS. Which in theory can become a flag in
> iris_platform_data.
> 
>>
>> but this could be added to that one instead, since both clk APIs and the
>> Iris wrappers around it are happy to consume a null pointer (funnily
>> enough this one returns !void and is never checked)
>>
>> similar story for other func additions
> 
> In fact, initially I had them merged, but then I couldn't find an
> elegant way to handle AON regs. I can squash them back, if that's the
> consensus. Any idea regarding AON regs?

Digging in techpack/video, I found:

commit c543f70aca8d40c593b8ad342d42e913a422c552
Author: Priyanka Gujjula <pgujjula@codeaurora.org>
Date:   Fri Feb 14 13:38:31 2020 +0530

    msm: vidc: Skip AON register programming for lagoon
    
    AON register programming is used to set NOC to low
    power mode during IRIS2 power off sequence. However
    AON register memory map is not applicable and hence
    skipping AON register programming for lagoon.
    
    Change-Id: Ib63248d118ed9fecfa5fa87925e8f69625dc1ba8
    Signed-off-by: Priyanka Gujjula <pgujjula@codeaurora.org>


lagoon being a downstream codename of the aforementioned sm6350

Meaning yeah it's bus topology.. so I think an if-statement within
a common flow would be what we want here..

perhaps

if (core->iris_platform_data->num_vpp_pipe == 1)

just like venus and downstream do for the most part, and kick the
can down the road.. In an unlikely event someone decides to implement
IRIS2_1 on a brand new SoC, we can delay our worries..

Konrad


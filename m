Return-Path: <linux-media+bounces-51960-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPPDHWJHgGkE5gIAu9opvQ
	(envelope-from <linux-media+bounces-51960-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:42:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A8C8E6A
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 07:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3707830028CB
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 06:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E46F3019DC;
	Mon,  2 Feb 2026 06:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdelO55l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTFdeXQD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97813302742
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014533; cv=none; b=JJhurfqGv3HnIjXmFE9HKsgSLz4xqtzIRS+txbvR0dF91YmIRiOud8oIGoLCy6iP1fu+YpIVIi0oNAsCLctIGda4OvwJ/32KjTzC/ja/3+xkVHsZIZGsxDzT6UfAQLKKEDJVh+rpXATyP09ZVIaXTKFTKw7f3W/LzBJbiESWFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014533; c=relaxed/simple;
	bh=Gxcr6Ryt1GGLj7poKUsgvffkF0vTzZkOcx1nBB/94R0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EiMxKa36bX2Ynggq8H+BaQRBX00U3sqeOB4wVccb8mISerleC5AtZHDpeHxWyOskTRVeu32F3RGlEkpHFwgKQRU9tSmRYo/+PB6ilLHZDsXT7H9oqu5E3KtzplorySH7/RTBdHvhFZOxyaNAu+4NICLtbYMF3Rg/NeMAZNi8FdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdelO55l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTFdeXQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NjTVo1371952
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 06:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=; b=TdelO55ld4R5b3a0
	QqAOmrDl2L3OeXHBpGGYKCYzQqtUhSu0uEue8Ef5ZkyU2addRNirAe4ReMbj7T4Z
	FEyd7+bn4wC9j64olhvkwXqnOWPOF1OkS0FvvHhwxJazWTyqewybeBBOFU4mkJtz
	Mo7cM/kzva/0yLDyQxZ9xUiC22NIokB/gAI/v/LuoM4qCR+m8lQEixRkM9pMBK4H
	4b3rKJoW1QSGUkhyQo6lbGNz0ViozoyFCHBzGOAAyfIhOXF2l+Zc3didgqVeEO//
	d0Lt/lM3/KaZVjOnP6nDCw2U2p3XTitmSszlx/wkvbD0vm47PQlGq9lcskCXx/J0
	wMbJQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0v9fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 06:42:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so55058655ad.2
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014530; x=1770619330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=;
        b=eTFdeXQDdsmHOkHopdqLA31r3PUCH6m/5vOnhOdmncC+Qoy/TOmqL9uCVr4bil3zZb
         x0cpQ/H0nhrtdG7nypKD7UWaaEb4egs1t+VsuT9CkQqCV37OAIE8ppyFEgAP9IF1osZU
         Ewlr3VS/yOYnVSb0WDgPQHMLJ08Vb9ZbeXztYYnZ4qtM/UrlLH8shfc5pLWlGlEd+pwA
         lp8kGi5FHfctoogqDd0T36UfZ/tRLUkVTgSrlwlG3LLlCqYJOhnlxu0IGTst/J0t0Nei
         jxLQNfDLY3Ow1Gnfjd8LYcBFNBIBx2WZOzBdR0PPrfcimn2FkA1YtzT1eefpXl5zmznq
         PB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014530; x=1770619330;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=;
        b=p3/ix4X9p1cRtClEdp5eeFSLGy5UxVKq0P9J9V3nqL7X4tLroji+8UfyZxhGHxWxje
         MjNKidX99Z5l4DVOJR7821kBj5/i9jm87t3R9DSIhmsE9u8hWrl+s8Lt23LEHQvFewRv
         /q4gD5rMhjRonLoliAU/lOGaGvHRGtBXD/cfgdXj94EBVfbGHvVBqn8UyzTg9cFTPBXj
         tYOh8irQTai1/rEz18xzffx/tyFJJn1pFI612vftESluE0VTU7GchWgpWA6E8+kOWjzu
         M0O+gqxYeosB/yr1GgwaMQlvLuzhm7QqD0dlOKX4pyBjZDQnyvq8rhLSWqnC4S3cFZOg
         GAOw==
X-Gm-Message-State: AOJu0Yx9P6RcNrQXxzlCL3b5VMH3rrvocFJlOo7pSD/8wF53p0c69z1X
	LKPCQ8H731tfbRO+/mOxObnrzgypqE+2qO1hIDOdxLdRfflmrFNrVLUvXm+W1l4pu8UZSnM4hTJ
	zP5CsUx5RERZ+sSS7R8X4jkDrnK+Zpfx+TXcy61JbnyVLeAUNLwvUX+0e5V1ok4tifw==
X-Gm-Gg: AZuq6aIddO+PYzVJwbWb7jlYSeuh2qdLcKi3YGg2c1EwZH2F865SSUKDLO0SlUdqaM9
	6AoTuYZNySYvZCsZb3e8y5P/LpimgII53n7+A4xcRgkyy6e3wdboU0mKl+rsfltGGkxG7PdgTMq
	xX7HdxHysSztbcFiHOzjg6gF1BsM58B9H0J3S3MENxff53E+/6mu6cXd4nLbaCDCTBAVPiFdRLP
	4XP/B6ihWJdSTPxlG0qSD2vAO1rvgdn263DVhNvdjgbxJLAJVENzRsA9J43iu7QC8J3fMRXtFzB
	t2vU1H+SIOShpsBkdZsHRV0+qgCU9p1ZiHnQpYZfjnqdGPlCDeksvyooIb9DoQC/4q/E/kz7xXT
	8iuDXPhuUQyWleP+imviC8e/RiLWOoJ13jc6LTZz3Sw==
X-Received: by 2002:a17:903:138a:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a8d803821fmr111018595ad.32.1770014529967;
        Sun, 01 Feb 2026 22:42:09 -0800 (PST)
X-Received: by 2002:a17:903:138a:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a8d803821fmr111018335ad.32.1770014529376;
        Sun, 01 Feb 2026 22:42:09 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm131347415ad.3.2026.02.01.22.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:42:08 -0800 (PST)
Message-ID: <249f2097-8676-4fcb-8570-1ec8c0e946fa@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:12:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
 Iris drivers
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NiBTYWx0ZWRfX+6ghN/gYsTon
 Z+eqsldTL5ICzPDQ8IqhjOJrsZ0O4UtaKGmezQgpT8eTVqVucdD47ffsnQEqM8yhyjwS4W+wEiU
 EgiQLg5NlUDpuraONqxvnT3O6J895UixoXnOl+bMogFO1OXyyNj8gIDNaNI/it62BipW+oYdvTG
 J/Hc2YPTz43lKUAlnK4xlLSQZ6BQKozS8ae3vjC8sHrZkDyXmxq7qa7MZQ9BW4y2TKq3Q25p9op
 x1rRJvHM6NyE2cVblcx/rHRREkZ10ADVpjuzOGldd198KCnjAMsOWwlaWL6OesWJs48k2BFx63E
 kikQuYHa1bw9uqltCi4kEY6n4xymdt2+x2sxxA7IORcYQfGl4WGjvVejTnCXqnZ9qU6WkjGqyGt
 Ga1RScLMXck9rIG6kv4pUVeSNqD4WlGwlcFsGIkYJ0ghSLN6cRCT04Kx6I17tvtBv9IKLqdRfXU
 pDlkaojt59KONlXjnKg==
X-Proofpoint-ORIG-GUID: kX5tQNevapy-sLDNVyGmF12yQi02KZ9b
X-Proofpoint-GUID: kX5tQNevapy-sLDNVyGmF12yQi02KZ9b
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=69804742 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qzIaaMEuUFiKcPSDxBUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-51960-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A22A8C8E6A
X-Rspamd-Action: no action


On 2/2/2026 12:00 PM, Vikash Garodia wrote:
> 
> On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
>> As the Venus and Iris drivers are close to the "feature parity" for the
>> common platforms (SC7280, SM8250), in order to get more attention to
>> squashing bugs from the Iris driver, flip the switch and default to the
>> Iris driver if both are enabled. The Iris driver has several
>> regressions, but hopefully they can be fixed through the development
>> cycle by the respective team. Also it is better to fail the test than
>> crash the device (which Venus driver does a lot).
>>
>> Note: then intention is to land this in 6.21, which might let us to
>> drop those platforms from the Venus driver in 6.22+.
>>
>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>> device (RB5).
> 
> Fluster results for SC7280 is regressing, which we were discussing in 
> earlier version of this series, need to be fixed. All tests were failing 
> but one for h265 decode.

I see the patch (#4/5) to increase the size, please add the fluster 
report on sc7280.

> 
> Regards,
> Vikash
> 



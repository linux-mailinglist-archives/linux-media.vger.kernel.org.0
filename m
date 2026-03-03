Return-Path: <linux-media+bounces-54406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NNmKhhsp2mxhQAAu9opvQ
	(envelope-from <linux-media+bounces-54406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:17:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97E1F84FC
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D6203044646
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548DC317146;
	Tue,  3 Mar 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+sXld4Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvLsK9mn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB626C38C
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772579855; cv=none; b=PFvzO/W6olsvT74gk0DTllwaXGpz3Sqn5bYcyfcOVHvd7iaRsGNjjHWQW/x1YWyNHiMgMUvGWsOUIX844xX0DylxApPRscPb7wDygWg4fd7ot/VbfXAfurp0hTfIIShGl9z6d+TONS1u+2vzVxnPhZuJjSljIcQpNL9AzuqlxXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772579855; c=relaxed/simple;
	bh=tDEBTkYi4cDBBqHaieoyEMokcL2GlTp28tmpfGIdQI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYi4awyy3eo/XEwo4MeP0j4BRZyHp76tFhYjPR0G+VtiAKSGyJM6HGlv2zyEsus9WWKHJ/iaCzj4YEt+xLrHBoOUYzfnMjZTOFfyWINaRK88ZX56gBW/POzdU5Mamw2UwLrhYELo+HMQ+jpXeu1uuqWazSj8S/kuhH31om/JKxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+sXld4Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvLsK9mn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0XhC3708865
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 23:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/pl0pm3Bd+CM66/M4SPYsQpdYEpO39Z9/Nij6zifh0=; b=O+sXld4QeeFObnvZ
	bH7VeTQPXIIVpSo3ZjIwElgFO/FaYXNzgMLwT3krD9N5p+FIcBLPRrtHJ7S8v0ai
	UoYUH4FowNUO9FNHI6uVpEc6azGAYJZbhXhPfHgOaNd7cMY5oBCIaSX1Gl2WiU8N
	tCDkUjf+A0JeI7uEeSLWtWKdasAqSWSoaP7jSsFFBdFE7G8y/N8GBj24zzmNMtAX
	aca2Kyy2+jKVQLB17NFlLrtg8QC1LtiqNj9ADX8qLd+4rA9wn7vah3mXQi8ctXkv
	Y29xBuWc1xuX+3vuKhNQZlcoY7E90hbJmC4cdrDuG2e2rpBtyJWywuuIyf5Jt1Dk
	AVMdDQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm3fw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 23:17:33 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd4ce8dc3so27730765eec.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 15:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772579853; x=1773184653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/pl0pm3Bd+CM66/M4SPYsQpdYEpO39Z9/Nij6zifh0=;
        b=bvLsK9mnnNNe9/fv7+X3DjITsXxvwMH+PFOnf+s3YodbWyT+f/UtaHgpp0dvQQtXjw
         3tkEhqOZNr3XfqXK5m5yIFJw5uxXPq7Pcad+Z9kfcnc4A5ecvYcI8sIvX2KowYO2Mtk9
         IfCObdhJxFln83Z4omXS9VDOBNcdHTgQ+Cn2xjhSzMuwI/A3JBRjca23LIQsnKjwo6xo
         jMvOr1ixVRnt4MhEGzRq3YWGYdR+aORTty+Vne2Bog/8rFyAWcsAu9/uRyret0MkVd3+
         4eek01ST7o4OzRdU3kiktmjJg4rUtVo5i8Rs0i3mTZL1bC8iDv0dC+BUbbcdn99fi/AW
         //wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772579853; x=1773184653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/pl0pm3Bd+CM66/M4SPYsQpdYEpO39Z9/Nij6zifh0=;
        b=u/LpONXn7SG3HF+JFZ9aYTsEM1vPwX/AmU6R3Knu5zOD6ECYGBWLZu6oSu2yIQAV0j
         r3vFTKQt2lVZtHrdqMQkmhTUg3nCcBZsh9gQPI1WnjI9f2OutRA2+QQZd/wHznvRLcc7
         QrCLJrTHWKc8WdHypvgCekLwQbXDK7aKzMYFNaH9wOJlJb1aD6LCX6R04MVDn39r3GmY
         H8EGwnlWO9VYqa3ynEFtGh6ASdV23IpkaeSdttpg9IMuDsDhlraD46NYE7NB/CP7RSeQ
         hVvi2MxztmEM28fUgknZoqhkqBUfw9KxgCLo6sBbrVdbgZwj1Jh/lf27FABqVxpwQxl3
         YddA==
X-Forwarded-Encrypted: i=1; AJvYcCUxbx82i982PbzFU03NOT71JKW/5NJF5sdPw96k5Agb4iw2lWxkCOtMt7mLMJLjc8WP0Latblc8rgKGIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM75uU35Kg8PgSqeh3WMRW3c7byaaYfdqfY59t1Ykw6TymkOR/
	t0xGrU8H+gQyt5Bb2s8MtLH0HZN1J9zJ1Umujanjp83kq9EUcO8/BwLXSQMV8Ju4XFuD0Lf+tIf
	96MpCzOJpNDTW3KEA7L5Ma5gz53MEqeJ9m4WmYFwk1WTUK81w4CLC/mWyOCkbeoCS4w==
X-Gm-Gg: ATEYQzzk/uRFuaacWR4U3fuH7TUIRCjjY/gHlF18HlP88I2+1TMVBYnA1BRRFApwLg6
	zib0wxBTjQKE+4T4DwetagEg4Cd4FWCW8py2G5wdo9awyNJz8TKp9hohZQI+eeUxAsTpkybYXk3
	BO97Ov0Ibav8+bwxaNHSpEJi49+lAopi4NZJUMTKSzuqBUsPnLlF6dEek+oH/u91/cOLTRqLlyP
	UuI2MR38sWKwoOiSTUBJR2cYplWIrGHxsElYft8l6IcwRSqhkL4D2kWaeXw1svkllN8z0ga202l
	s0llrxsq4jG+orEshbjanRwdEl5tJagpoGqgVStjpiHRbSwu9SDG6C3cDST9098T1G2Zv7YEXDF
	KqWSEM0xFj0wRsru8pfK96H+/DNnoG3sR+A5gwX8sNyjfamKl9JvmrwyiKRD8/2jZjtkkwEjHBP
	iD
X-Received: by 2002:a05:7300:e12a:b0:2be:ca4:e119 with SMTP id 5a478bee46e88-2be311c8626mr6553eec.30.1772579853139;
        Tue, 03 Mar 2026 15:17:33 -0800 (PST)
X-Received: by 2002:a05:7300:e12a:b0:2be:ca4:e119 with SMTP id 5a478bee46e88-2be311c8626mr6539eec.30.1772579852539;
        Tue, 03 Mar 2026 15:17:32 -0800 (PST)
Received: from [10.62.37.55] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2f0d1849sm411313eec.28.2026.03.03.15.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 15:17:32 -0800 (PST)
Message-ID: <f031acf1-9a03-42f9-b61f-b6fa6bf9100b@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:17:31 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
 <4440a3a8-7281-4bea-bb84-7a9d19ef7ce9@oss.qualcomm.com>
 <2a1155bd-7dc5-4ed8-b1eb-ddfa483c75ca@oss.qualcomm.com>
 <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <4fea7117-ebd3-4279-9973-3ac4f2a78835@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o7jzc4FQEyVaurgUyaIx7lWlAjhBick2
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a76c0d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=w7-7VXPaYEwSs5UKW_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: o7jzc4FQEyVaurgUyaIx7lWlAjhBick2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5MiBTYWx0ZWRfX6Xc3wworODjo
 PAHPvx8mpiQ65NtGuFTNdqHTeCvWyBsIQugQzB60LhPeiXaD5SobkLufrsR1csT5dvm52bnVwfM
 KCKrl9f6Jfw3ebe9LENmzHMBWu0dAs6OCK23M5JzBBYJYFe7OFFOY4uWCVGt24mHK64JC4KuVBQ
 OVQrb/czkJHysy70YMO2Vu/Kx6a6rew0lS3I1FwaEPwHbLNKIDxHBRwHTG5uHH/GAHUeuqbmpcG
 BAp2PypkwkD71LVbbUAiIwUMWohGcSU6+/tGiOLxdj9p/q48MK0mGDIHxGOwS0lGj1LGJHe0cT0
 iRQGUPrpbDPT2BJN8ln7OpdRB61wHjjdBVTAF/qqU9NoivgDo8tB2Udy2gKndzOri1/ks/8WO2T
 NTIJU9KkXwRK3xmzDiiN5pE5xPwKRLAUleQzwJi74T25ncy7utDsLq5o7TP+ep5QfnXxdf6v1v8
 lokD5SADJZiddhZMQpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030192
X-Rspamd-Queue-Id: 2C97E1F84FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54406-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/3/2026 2:53 PM, Bryan O'Donoghue wrote:
> On 03/03/2026 18:58, Vijay Kumar Tumati wrote:
>>>> - TITAN_TOP_GDSC
>>>> - MXC
>>>> - MMCX
>>>> - MXA - first time I've heard of this rail, from memory I don't 
>>>> remember
>>>>          having seen this in ipcat when I could do so.
>>> MCX and MMCX are comminly required power domains across the PHYs but 
>>> a subset of PHYs have the dependency on MXA.
>> Actually, it's a bit more complicated on this target as 
>> cam_cc_cphy_rx_clk_src also depends on MXA, which means all the CBCs 
>> connected this RCG do as well.
> 
> Right but that's something to model in the clock-controller then not the 
> PHY.
> 
> i.e. if a clock depends on MXA then the clock controller should 
> represent that dependency - not the PHY that depends on the clock.
> 
> camcc on hamoa looks like this
> 
>                  camcc: clock-controller@ade0000 {
>                          compatible = "qcom,x1e80100-camcc";
>                          reg = <0 0x0ade0000 0 0x20000>;
>                          clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>                                   <&bi_tcxo_div2>,
>                                   <&bi_tcxo_ao_div2>,
>                                   <&sleep_clk>;
>                          power-domains = <&rpmhpd RPMHPD_MXC>,
>                                          <&rpmhpd RPMHPD_MMCX>;
>                          required-opps = <&rpmhpd_opp_low_svs>,
>                                          <&rpmhpd_opp_low_svs>;
>                          #clock-cells = <1>;
>                          #reset-cells = <1>;
>                          #power-domain-cells = <1>;
>                  };
> 
> So... we may need to add MXA here, probably do based on what you've said 
> but I believe TITAN_TOP_GDSC is the only power-domain we need to list 
> for the PHYs themselves, as what you've described above is a clock power 
> dependency which we basically already capture in the clock controller - 
> absent the MXA - which is apparently always on...
> 
> Sidenote, is MXA required for videocc too ?
> 
>                  videocc: clock-controller@aaf0000 {
>                          compatible = "qcom,x1e80100-videocc";
>                          reg = <0 0x0aaf0000 0 0x10000>;
>                          clocks = <&bi_tcxo_div2>,
>                                   <&gcc GCC_VIDEO_AHB_CLK>;
>                          power-domains = <&rpmhpd RPMHPD_MMCX>,
>                                          <&rpmhpd RPMHPD_MXC>;
>                          required-opps = <&rpmhpd_opp_low_svs>,
>                                          <&rpmhpd_opp_low_svs>;
>                          #clock-cells = <1>;
>                          #reset-cells = <1>;
>                          #power-domain-cells = <1>;
>                  };
> 
> ---
> bod
Well, the current upstream clock driver (at least for CAMCC) enables 
these power domains at the min level but they do not scale them. So even 
if we add MXA in the camcc device, they won't be scaled per the PHY core 
clocks. For example, if you are running PHY at TURBO, the power supplies 
may still be at the min level or scaled individually according to the 
requests from other sub systems. If we need this to be controlled from 
the clock driver directly, we will need multiple performance states for 
the TOP GDSC.However, this GDSC enables all the clocks in Titan, each 
with it's own voltage rail connections, so a bit complicated but can be 
discussed with the clock driver team.

Sorry, I do not know about videocc.

Thanks,
Vijay.


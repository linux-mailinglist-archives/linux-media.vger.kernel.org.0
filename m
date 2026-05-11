Return-Path: <linux-media+bounces-61040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKxDM/M9AWq7SgEAu9opvQ
	(envelope-from <linux-media+bounces-61040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 04:24:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF35072C5
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 04:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C9CD3006F2A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 02:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF4626E173;
	Mon, 11 May 2026 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXA8KIRd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsNtZ05B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BA52236FD
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466289; cv=none; b=Y1wZxx2TLi7r2Sf797nHYjE0GyFlTNGXWbzbZyWbqCUuVYgVI69aCihSakWh9lEYMxGLewz/o+MSUqsQANozXi9S+EPQawvSrkzEs+RcnktU/2oTnIF+8+eEy2EdhOhIZPBSptP5kYuiAthy2eagIwALzz7BV8Nn4qqHZBdSF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466289; c=relaxed/simple;
	bh=z/Oc9IGzqdgqt96PWJXKU1AhRYn4A/ccjjjMOkRN2Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxYjh0X3r6gELfgijH5obxAgIyzIJLv1bY8lNdUf2cH9l346l2fc53LgJ4QiTFELwWvPQrnem4hSPFeeRJpQyOevSMu1ZWL/iM1WK2Aswsvqj0dSpUMqvbD2ICaBB3riPwISc2HtDIcWH/MMJlZuFU/ozfrwAGTkMCBfscxOvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXA8KIRd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsNtZ05B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ANi4Ui278785
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=VXA8KIRdowG6Ps/f
	8zv0HVMzFMIYzuxxUOkhukFSFNHVQn9Y+kXeWGGtumsMTHHwFO8xGMF2Z0vQRGfh
	Nw0OhfDZWAe/F/N3/a0auPLxWPJq0yy6pFojTg52SXyttklbyZNwOx35VvYw42zk
	atPXPg9O1GbNJt1diMqlv/cCIhkMbNBbIgg4yxaXus7cdAtsu8YIx0aZW7FaW1mL
	zznfWgwuJZ7BoIOr1vhRkb+6unfTHtDSb7zWeDSBnlfiDirQsxeQQEQ+m2iSfKrW
	rCVmnKVmDTPWU20Zafee8J758wnULpxJCUELtLCBiouS3tO3RcvP6uz7IgJORWWX
	IEQHxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy435v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:24:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8bcb482b185so59053326d6.0
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778466284; x=1779071084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=gsNtZ05BtCjwHhgDdKkv1JYdWZXf3vzy304PjCWDfBtmxMd+igXrWmY1m630LWu7Xv
         jBHbUOkG6nDCTo9H9F9tmHopxXwlK9hS9Gha+oUGjNZBXEFgbNpBOMWX9RvwFMD18OJN
         E1jVepOvyUXC/5voN60xam+wVxUDrmT7kBU2jIqvrWbpU80EczuFMiP6UgPdcJRjTLkJ
         Q+Hx2ZhI34RFMdK2phSfKAyh9kbbu4g+h4mTDqUhCrVBfMFt5+tv/cBDyNasZo5ilpYN
         OXAVUfzcpFphPpdqHseMyaNlpQtqNlGAxgK4GB0xoxtsubLq5b00dtubKQyJOwc3Xd9J
         AyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466284; x=1779071084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=cuxWgwvTBq+YC6Y7MaiP+vmaPMLUiZ393hE+3W90UwMvz/1kYaSlwa3QgAQhWXxlKI
         N4LjeK6c5fsCnU8be1M2RSi/SAa3U/8vaXaP7aY8/x+A9dItTX9Vtf+Y4y0nMMg57ajb
         L+nWliO5VA7/BpwmTJf37aJIF/5lvdaakqONOr48IG7/SYqQOqhgvltVqXySw9CIueWX
         UdtNEY8Q29Rroim0g0gdvN9TXz1z/kMaUF9gbhVoyg47jNm1itSb3cmKY1+wOsLfLxXp
         yA9YA4FK1ts5UDKyU0HPg+SsekUGSC9lKxGjP/AczU2EoSg7toicSWUTylvFeD5FSELG
         YEfg==
X-Forwarded-Encrypted: i=1; AFNElJ/40XqIZs6Ajd3L4kzjeKBrV6sckfJyrATuMssuOnsuRXA7FY66kVR3edmonxOM4pYy7VFpRcm1i6bm9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9YEXOoSzUREza/rSIRyv/bAHEkGvXqE5hJUvX65Sj1xYaCVaR
	YcjMvIAvXifi/chmHkHDOyk7mfIcYY3+gl6TXvuUs1D7GnjDPCZYNfbqU+Mw9dxGvjMFIAjtxnE
	kSpeanJWCtTD2hFfZQJann6PLHsIS2s5naIm2MC1ViIHrBjjSvI+LLBgXp7eC5MM1CA==
X-Gm-Gg: Acq92OECdcWThpQ/313Ik4R+ObbcXF1soEtaIpO6hsF5l6iRwAP8DTFesC5AhczNhaL
	E3ddPO+DDZDVU6yv9dNhnKY3sNZQJ2tGNrttbry+nAnya8M0lCKMFxstct6xv+Dum3fZLS8yc8l
	k7V7DJW8p4tLAq9bayz62IOBSxN/QSLNvDcdFqO5BwSxwQ5VhAu4wNTccUhH69SLdnK84o2oSTM
	4Q8if7jj9a0YpRB429GgJ33VIKT4ObGZ0IPmWB8IQikx24bpPFyKeGeDEOzC/+kR48SiPTCXE4E
	hj2u0EFQKQNaK3Ik+fekG+bR9vztUL5d116u/J6dQhdUBOJU82IcCgsE3E8D+RvJNWWk3aDzAqE
	pTNpfX/jjbEBgeeuGLpZ2RCc1BAizXOEJOQgU4aWI9iLGIgkvPTDYAJn4bpnz/ulhPTTrLFmZ6H
	YWPmKYXV4=
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776786d6.41.1778466284599;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776556d6.41.1778466284094;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
Received: from [10.38.243.40] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e73dsm300484716d6.42.2026.05.10.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:24:43 -0700 (PDT)
Message-ID: <1d6b4182-7cef-4c00-a655-095c0388a038@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:24:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
 <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a013ded cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmDLwImcmQvp-VwJOJ8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rooXktswoYSimOFGakKhqFCvsonw0Yep
X-Proofpoint-GUID: rooXktswoYSimOFGakKhqFCvsonw0Yep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyMSBTYWx0ZWRfX8yg4Pk0aAbis
 ZW7NIV80PD18abuM03qQ/Gy0cStIokRod5CKpZQyOCTT+SePll1W9b5gmI0z1rqwC+T1yOQlTeF
 J6Q3RPE/i88911DFoEAE/eLNYdngEHMIQSzVBLEhMZylBoCG4QHDYCmxVwhWWhU5eSl7IEdjd3g
 gtj8ukqKoNPdC9e/7WPJKdeqJsFZ8DkvamTBeWlUqwIn0haCq7NPm9LEEIXEyH0hIExO6TzP1Cr
 NLEpxQum/qtijCK66NmzbHNr/Z9n9un12HCd0nSWM2ak9H6vfii6rHhKLhEDI+ds0LknFNtMmW3
 ROw/61iU/mz6/hV+ZpNilZzNthFKR+Iu8sxHUnC0Y0DSP3OtWXolHX+jWNi+vPXw8Qyxxoe2Pkq
 p65OIlHL9E9FBj9BOYWQSwG5EqaB0bgbrx03G5GzhlJgue8LOeOP3ItWkzem50PiRwYl5rDRm4Z
 rFMXHMmFqHNlYJSFLAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110021
X-Rspamd-Queue-Id: 49FF35072C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61040-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 10:23 PM, Bryan O'Donoghue wrote:
> On 08/05/2026 12:40, Wenmeng Liu wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> 4 x CSIPHY
>> 2 x CSID
>> 2 x CSID Lite
>> 2 x IFE
>> 2 x IFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> I'll repost my working version with the PHY stuff so I'd kind of 
> appreciate you not posting an old version here, just wait for it to land.
> 
> ---
> bod

If we are able to designate the old version as a candidate, and should 
the new version continue to encounter substantial resistance, we can 
provide a functional version.

Thanks,
Wenmeng


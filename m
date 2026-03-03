Return-Path: <linux-media+bounces-54308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KCbCMK2pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:24:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 703421EC98D
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC32303E2CD
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA847395D97;
	Tue,  3 Mar 2026 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eppOPCUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dP3HccxL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45917375AD8
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533359; cv=none; b=GuxcxXjSLRBG2wNoSf0WY9xD479bWJWTQ+8PYOLntiaBUBwghHV21obRl2DMoTuvKU/pwoFS5cvTWzf0bbb4uPT/SMWQNnCv9b8uiUucBZNgjtPW3W+WPu+9H1qVXHR2IZC1Or2ggjM63LdzoSjP7+SPe48jlggrLHiedwzQAJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533359; c=relaxed/simple;
	bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENXyHWiAIDTinf61BH3zf0k9IsTk/mvqhY8eaB60nrcbghMC9HoPN+hp1DVlY/HzPihRyt8Ee+ay4t/dEwsInwZY67tB88HpMq/0xMvLcHPTCq7O+BqLx44y0VafJKUy0DJNOEnnwyJ2r0CBuVkc79Ff+VSO/3ZJz7lgydXhL5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eppOPCUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dP3HccxL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nGht3349578
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 10:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=; b=eppOPCUxZfrgrBdf
	PcJOFZYfEvc9pXXmVKXCdsKXSUeYcJyuL1+B23i3pFkGR4aXJmwqDavXNeIsuthd
	4NnGNJEm4598saqLbQSoGqOU9NohcedljTSIudsJ+mANc7g5E9UDIM8IlJ2Wc11c
	+7b6gOvmVjHUPOGzn4GKVziixThbb/FnVVR/S8C72P3pREp5LMtPHkgL+oq9Yyxm
	YvcPVdNa/JxhpKxR1Isp1gbSLOEQGmpi/CY3HfBmOUisByyCAzhjiPFsUo0x92YJ
	Q7/aPiqfy7lXJxxl45Jx0wGapHoGZLkKbMpexFe7x0OkTMgBoWBNJyAKSWTHu848
	8mbKSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsacty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 10:22:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb399597fbso373537385a.3
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772533356; x=1773138156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=dP3HccxLuTecx9KWt4Tni7D8wcpf+T3E+spvhT+gmOYhu6ZsYjxisVEpNqprpCq/Ws
         OzzgQub3nMtcBnBB8XIVI/WsHCLp33Eq8koQIcMvWjKGwYD7bDvdQrjmoE95ENGm4E2y
         KaqvCgLm7Q6LVOb4vnQjuF2HqS5bhcEjBwySS/dwgl3biCUx2Syy4nFCyaWgyvtHtN8n
         9DsHmOQryW2hjx1ZIavFHhHuS6N3Aicna4pVV9HXnKTeKwxNVBgjsyLn2qX70+1DY/fn
         gIVCDLfuxWD8RzLczIAxV61GMA6Dvo4V3XjXYiGLXSsfRpPHiAH6hfpvntKcsaNyp1gU
         11wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533356; x=1773138156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp4JzzebzKmENzHs2wBTVHycLWXBIoLkaRQ/pc/I+z8=;
        b=s2n7Te9rTagISIJiVAFuBtb/Q5trWRqezR89JftlHOheud9TwTzfvG8fYZG+IpjhXI
         JgDD9L23NdBFS/s2pl7MjNp9Bm47WWX/iCvlVN+hL7EznWxBU0LuR/nhVMnuvSx1y/Iw
         gF4q386HY5R2c/5s/wQL9otf7+5cWcuovob7TrZ/Ei5kc4Tt78NXTOUcKXZGWMlfqX7Y
         gWDC5pV8ic1GysF7NEXb5cRtFG0FeJ4I70SIW79mcVe6DaMrz8icKTa7WyJ4oDvebozF
         0Xc7H1UuYfffCwnYZ2pzzCqqHx0kWqwKFFqCy1loQuPt8GTfIWUgBb4KeAEr9o5PRg6o
         39lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrmcm8qTm+WCETooZ/k7524jdjjf4/uGnG5EM4CdQo15W64A78eJjTNDQfx0efjLqs6Do0FTfIrH/yJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeRI2iDPNr4urLy98loSCx5LxNiCsy4cpdZLpp3ws0oXERJQi
	LXSolASmd32lw+SIdYzIaGUXYwlw3olKpv/k5ZxaQXpmODXt7VLgQTFtT4ZzEiKLGCa8qNKMSvP
	nbGdjwl62Km72NNKIV+x/fhQM2TWTy9EWSZE3uNDve6LPX/T9pxLzS74uhvcJV/Em8Q==
X-Gm-Gg: ATEYQzxd0ockaaK8Axb/eiK4wkSZqU2QyDLd4Ak/Z9KWNjxk2Si3YoEp9tv6ykAX9rG
	JdF2SzD/JlrTYJ1n0W+3uS9p3i112GO9g/2ylhMPdBfjNbUTZV8RzYxiOvhBYFJVHHYWQSOFJW8
	/Mt+kuf6erspqO554ImeiKtJKvXhopDbvtjTXjIhzfe0xSMP2jcd362UvYI3X0OOVMOcv/lpYJE
	1IOkNqHhVqNg+7HMR2euHBXCofbMn9eYK6XRW6nn/aEV2kuzd69wquE+8mW8U8psmohMzEJlIa+
	k0I5PIhd37T5XUIWvEHtU9oH755OEUzhUMQZU3DJEb29taC70Ep12eWGCW56xRoZIenS4x9zGRl
	3qPCDWrUSCL2zGZwx14aLjSNw306h/WwkOp7Bva8Ia3WH1K0kny8nEHyD/MMT1ut/0fa7y67/M8
	vZvJE=
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595220185a.6.1772533356436;
        Tue, 03 Mar 2026 02:22:36 -0800 (PST)
X-Received: by 2002:a05:620a:f0c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8cbc8ef8d68mr1595217685a.6.1772533355995;
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666c9sm554838366b.39.2026.03.03.02.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:22:35 -0800 (PST)
Message-ID: <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DGDnZtUPeVdC-notsJ4l2679ElBc9luX
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6b66d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=-y82mbY2qW1znAYjJDkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DGDnZtUPeVdC-notsJ4l2679ElBc9luX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3OSBTYWx0ZWRfX+apxLIVp2Iqj
 nKOeJ08YL9KUd4ryUwwONQlSSDZ8wbgwXRqph5OtYpYGIziD3OAVoiYSSOK1d6ya1HvkYDnMiXy
 VC45fW3Xl95gHrJHjPdfgWwZIkIu8aP6cGVfknCsWeNShyJWul8NtPvZF+XkEVMhUfJI/uk8n/s
 zaYBLUaipN09He6CczyOl2pbbGnD8hBK4WKyoql9Lf7avnNjUQ/Kyc39cqqvkKYOEXGLw2e4q6Y
 QGTNjmVqqiatBB91vNlStPecW8+HMT1QRl2gGZYd1cAvZ+0GeE0V6zrVO8EEfrxi3Q+f/z0ZIKJ
 FRSl7Mbk/l4h3uITwOHXZanD38dXyIONuJgTphye4tg+sPQPFXyvhmfezn+AyPG4/hHqjW/10os
 3NldTyIKDr0sAePiioxdv/OUE01TgWNzs0H/QmLVjI0Ounh4TsHX+us+9xW/krWfEphVNfeMzI0
 r3rQbKjWvtlwsq98j0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030079
X-Rspamd-Queue-Id: 703421EC98D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54308-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[ixit.cz,linaro.org,kernel.org,gmail.com,fairphone.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/3/26 11:00 AM, David Heidelberg wrote:
> On 03/03/2026 10:55, Bryan O'Donoghue wrote:
>> On 01/03/2026 00:51, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> These values should improve C-PHY behaviour. Should match most recent
>>> Qualcomm code.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
>>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/ drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index 5482fb5163e17..c612192ee727a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>>>   /* 3 entries: 3 lanes (C-PHY) */
>>>   static const struct
>>>   csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>> -    {0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>> @@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
>>>       {0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> -    {0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>       {0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>>       {0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>>>
>>
>> Squash down and Co-developed-by

Suggested-by, perhaps

Co-developed-by usually reflects pair programming and requires a s-o-b,
and that carries legal meaning.

Konrad


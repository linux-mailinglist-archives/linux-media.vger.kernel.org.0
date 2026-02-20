Return-Path: <linux-media+bounces-53123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNKoDiAqmGlqBwMAu9opvQ
	(envelope-from <linux-media+bounces-53123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 10:32:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B3166464
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 10:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7C0F300F14A
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EC41DFF7;
	Fri, 20 Feb 2026 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3C90aUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5rA1AOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4452D23BC
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579933; cv=none; b=gGs55eNqejQVOI7wdrMO72XE2anu7/oFDTMj67qkM2fCR/5z9KflUGdAUSMYlF1R5RoJ0lCk/60Zoo0uQpDz7sRv0tev81E0+SS2PO8UVTqzmwA/He/5xSijTEvauxt6zqsgw8ikeMdoHyO2mtGeUWafNhjvraefkkEoKFuJvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579933; c=relaxed/simple;
	bh=+OvWxB+kMwfJQg+lCH5KQ3OIueF7OVMyiJhERFaGPAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BftvUNsZkwTl8BwlB/C6Wn3G28ZGk0101dLJRU2nNIXdtm3DOdaQ8uKVES/forIIT9NC5H+oHpNxhjsHvtR4hobmMo2QdNPQPtDWEs3/MMZZWEQEJyVe0sokUlA5qYyPD14hj6f8c9iOs0pOTaCY4jCcyeH25m1lQGyQ3xtuxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3C90aUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5rA1AOO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rovg2552567
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 09:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lH/3INPpgiCDQOXSNEoYxZZM1w9orbfpu5lq0v5SWwU=; b=D3C90aUcywQ6HHGJ
	b0Lu0RP+hI06uoRq9Rdljm9qgF3sQkoz7T46mgWzkARmBo+J7jmQiohXm3uqcJfD
	HxSTSRCfzeVNyq6VObvUs07pLUDCL+MCvKUGxv42g0wLutTNTZE4F08hMmVGRbDd
	cikI+Qf/9i/hdS37bzPpCjq0JsdU15ZMxgAGdyzdSggapyCryzgR9uT45UOyb7rU
	sc5CChAPJgx18iGukyIgekTuaOefI8gldFElRqBVdDY2MYGC1ICGWr2uVPAMD9EA
	VuxKbBcApG1VNn/4RVU8we7zm9dT6oPfRTa3oBhIxgoRcSe1RQuyyfrinAs0Infe
	OFe1TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t0kaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 09:32:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so169343685a.3
        for <linux-media@vger.kernel.org>; Fri, 20 Feb 2026 01:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771579929; x=1772184729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lH/3INPpgiCDQOXSNEoYxZZM1w9orbfpu5lq0v5SWwU=;
        b=b5rA1AOOnLNJhyA5/nfS4N9IMHzYIBs75jtdw1z9R5a5J5noZeH63LPOtcBMMZLcf7
         kWejwTSO+PvKGoYTToriwSODLzKv5t91oiELQsHsbG/Rv5kMY2MFAfp90YFZefjsgs4b
         wWTLjVOoJhwnCdOAIxxUfzUPIy8CpEWV9HSKnU9iWOTdum+0I9ynN0WBO/iQrbzBIFFD
         XDjz43C1VXMC/h/fqN/qvJ0Q6tVMaJZ2Lkq5o6EeyQ7AX+EchU2O1E4Pf8krh0qwBHr3
         vpkBLgT2piP8qRLg1iao/YQviPlf6Gvlx1nDDDQ/BeRHRD/V1Jd64jEyYnLeEgLb1eKP
         VY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579929; x=1772184729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH/3INPpgiCDQOXSNEoYxZZM1w9orbfpu5lq0v5SWwU=;
        b=lIV62Ql5jJTKMjcBktQoGBOK5FLEx7WdbdJz5fq9zUpMeza0sOpyWgltN2L6mBZYXc
         ITdJg9vTEgmojqy6/hpqQ1gI0io/OBEp7sjrzFo4ZNT/8bvIYdGRDHZkrJYm4lEcBBH1
         o3sT1H+nJBRFgzOEL/B8K1a1rX6VnykqcuqQ65h4sQTNnfPPxvwImip3g7NLvErJ/tWm
         OVimS01umITKVVqvCa9fnoE3kNp9Lcd3oDMSwoH4ooD3JAS/5F57Aw1X91A+b/B7FfLK
         QSS7ddyMUCjz5mi4tyd3oK+8bRAJm3bOHiDvIkggPFBmdVas9FPqHjh859CoBt986nKW
         azJg==
X-Forwarded-Encrypted: i=1; AJvYcCV1f2GwkDNxspj5Hk8xxHemEuSYLRpAvpFXt8DeESnwYfPum8i83bESbDzg3LQbyNIU3Hslpqz2AfXI4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NpNm39aJMpQ4IQYFiRp6+hEai0pzvyV+mm15fKn2iG23ds1F
	sMKp8FRpl2VH/sLIEW+oCya6SfXi7GGVIrcl9GClJUeQ2Fon/2mpXRXRcCLtTwsK8VBwKC4HyFv
	jvykJVp53iuT+MuO5x1qe1Ay1fWSpbiwtEx0BuiUPHDv8XC6cG5Ue9Eu292933rj0vQ==
X-Gm-Gg: AZuq6aJ0jHd1IoyX4GeI1lK+WNUFO9PViAqGh5u3seeoydjM1AqQL1tY4bY+r8Mf3vO
	yiPBvA4RaIbx78t9MahIVpB0vKobm0uka+DIGbfj0xZlWfcE3BCbvJlhk9oGz5lTs22pNJv7E6L
	Ls5suaV/A2zLvGhrJn7lQ8Nmv2VKcxssoj8wgvx1ApawoeR7m2wTHDplJwO9lz5zabpirtrR3TI
	IVDkWLIXjQzBFQMSx83LRAhSjsPzQc8fbsGcfpZyTiMQT3+OGUBz3EVZLjqlKcHARNVyvZoMHrF
	8+qchTmYPagRtUpe8VtwTVsNyytV9Zyk7aUrKnsCqpMjY7DngIByo/B0jE9NZWXLWz7zlJDo3Bu
	zWuzZ0Vkj1XYhHlgYYjeQ3rEZ8j517sj3D3WINqUqoQiGbw4oWAaLKVMMJzmbtfGisiUYATx795
	oj7kE=
X-Received: by 2002:a05:620a:4488:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cb408e4698mr2299192185a.10.1771579928997;
        Fri, 20 Feb 2026 01:32:08 -0800 (PST)
X-Received: by 2002:a05:620a:4488:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cb408e4698mr2299189885a.10.1771579928565;
        Fri, 20 Feb 2026 01:32:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627fa7sm672749466b.38.2026.02.20.01.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:32:08 -0800 (PST)
Message-ID: <ab6e2693-339f-4923-8775-1bdc226fa63e@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:32:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
 <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
 <CAFEp6-3N43h3azYxokEwvTdv3de9L5ytXJuaG7bbim9_px464g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3N43h3azYxokEwvTdv3de9L5ytXJuaG7bbim9_px464g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GVqvDdsvdLB-5JWf3ruPkGxDhk3GJGbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4MiBTYWx0ZWRfX0PWZtua3jMPD
 HUchtS9lS0XyQ6uPDFMq7aNmA1IK/Dq/6ytuLgu2HxJsiJbgk/hhdylbIeii9IfJuj2wJ9PNoTL
 9wnxbjrp9chHU3W1vkcEdXA3suirEewvbXbvEXVv3dIzrA1uO2POq5/RzMMESTy59HBGdhQVOlI
 DWnHYz9YkeeQir4YLiA5YJ8104L2a+LDD/xeh46zwb09jURWRaHUPIt+iu6HMYZjTrJpzg0j0L/
 a4+Fbcf3OXZWoG7Zw/cMxU9ax26TDWSKbAL4YB/EpJDCdaUFBUjvKZjXlRJ/joI7Q2bvQNOKbxr
 vLsasPG3v+rzj0Ct4Tk2jS+OtC/MTenZVktnGyXUIhQf1hAtS7YE+w8UlZwaI+sc8gm4fYd5Dyd
 TXQ0N4e+8yMelcmNlOP5rTBeCpHeZD0v2Gpt7NZTL7vNRp4CpG/dRB+x+xXvOOfEmYIbQB2djeA
 Ws419Lj2wtef6NXV62g==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=69982a1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=zoCx_Qtg3WR2KzWFUi4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GVqvDdsvdLB-5JWf3ruPkGxDhk3GJGbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53123-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A36B3166464
X-Rspamd-Action: no action

On 2/19/26 8:49 PM, Loic Poulain wrote:
> On Thu, Feb 19, 2026 at 4:43 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/19/26 4:27 PM, Loic Poulain wrote:
>>> Add support for CSID to PIX interface.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---

[...]

>>> +{
>>> +     struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
>>> +     const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>>> +                                                                csid->res->formats->nformats,
>>> +                                                                input_format->code);
>>> +     u32 val;
>>> +
>>> +     val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
>>> +     val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
>>
>> no vc/dt_id?
> 
> In CAMSS, each CSI‑2 Virtual Channel (VC) is statically tied to a
> specific RDI instance: VC0 → RDI0, VC1 → RDI1, VC2 → RDI2. VC0
> typically carries the main image stream, while the higher-numbered
> channels are *usually* used for embedded or metadata streams that
> don't require pixel processing. This is why we select VC0 for the PIX
> path, as it reliably covers the vast majority of use cases.
> 
> Achieving more flexible or dynamic VC selection would require
> decoupling the current VC-to‑RDI association and restructuring how the
> CAMSS pipeline represents and routes CSI‑2 streams. This would be a
> non‑trivial architectural change, touching both the CSID routing logic
> and how VFE input paths are modeled.
> 
> The DT_ID is a per‑VC, 2‑bit identifier that we currently assign to
> uniquely represent or map a given data type. At the moment, all CSID
> drivers simply use DT_ID = VC_ID, meaning each RDI/VC instance
> implicitly handles a different data type. For the PIX path, we keep
> DT_ID = 0, matching the RDI0/VC0 stream. Ideally, DT_ID allocation
> should be based on the actual data type rather than tied to the VC
> number, but that belongs to a separate series.

OK, let's maybe write the vc and dt_id == 0 explicitly then

Konrad


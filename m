Return-Path: <linux-media+bounces-61562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKdLIAg8BWpNTgIAu9opvQ
	(envelope-from <linux-media+bounces-61562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:05:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0C53D3F5
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 05:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC133043502
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 03:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3E0311C15;
	Thu, 14 May 2026 03:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLYatpBt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ag+MiWhp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE8F2D876B
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727923; cv=none; b=mAKTUJYvRv23b5nW9RzjzzhkqFN698/EsVuHPhC+8Fsli2orEfOu5WXGDT00cHmO3p/lHWagIsMGc/cEPuCAGqtWN4RVJnr+j2vQYi1gslVA7U59WxckqVGKFJWOflxE7zA/PtBs7ysd0p1u3UtVz2/JBXoS9bJUxQlWH6w97O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727923; c=relaxed/simple;
	bh=GhnqVwGAUzXklgWYGPSjoIVm/BxPlZtdjSbNzxexg/I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eHMvpMa+98uvByIXXSyK5SfCJuzN7UmkhUKg+AUigv+bljkL468HXNL9XNTWtDk9EpUN1g+sHViyuOyFD4y3L5FTh38KhG+00vcaq+G0tKXf2+GErkly8TooP+1dfrNGBTxwLXT70RfxW5jMdfghuAIKDDaZtEB0goFcLALfLmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLYatpBt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ag+MiWhp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0RLwg2888312
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=; b=DLYatpBtV3MIxOuA
	pQ0KxBgF4BYmmcrFM0mqHud6KhmLBy5vDU0Y1DQXW3yDBBSEtQJmkzO7RsdOVa4W
	/KwyceWTimXqCO5ZqgmoocyyIkuP0hP5mNNWNtbcK7ePiw7iX6b2FqkTF4FhPaMY
	NRrqBnyG3VGw+vyj/n/ovk4WLzXUM7CWITLEogKTWKtTnh6r4E9Cx2PAd3xBXLGR
	1QvbVTKMaWlNkz1aH+gBspnVLfCg49sxP/QdfqnNcXLxrWJ7oTlob1ld/2JzvF8d
	CcGgBSCDatTu+K+NvXwkurkd+gyD9rl4hG8y6AZrInynuSHkcnVbWVjfPd4Zdfo9
	dYx44Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gku0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:05:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so2605498a91.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778727921; x=1779332721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=;
        b=ag+MiWhpr1n66AGvLKsr2UM0c06lYTuoCKIj/Q8fKPkYCwwud0s7/NydbW8IKwaCSp
         a+gX9YRIjSfftuU1zPN1w60xdhBndipBVfeB6RtaU4tMXiePuoTWfmyfUNtqIS1z2C9+
         t4T7NqOz2kGexukumxIvtNcWUVa/4SNEXQvGagTyrje8B5CJ/UWnhxLepOX0VBjagJqE
         bysuiOATwaE6jbemDyOaEomJ9wovwjveu/QH6nriE7NBuavB36peyOarVVgAvPthLc9H
         YW4fVcV+juIGc6qJ9czWI5DmiMv1RI6aAu1gSLoR/mnIvF8BE9RZllxB+T9nyxsUKuzL
         EyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778727921; x=1779332721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtABQQt2nTIKgkqgHnSu7+DB1puRLKU/SwnvugbIasE=;
        b=MNNq1F1EZ6uHhJo0GxskNU4cATA0ZPTQgQFqHnB3O++LiwvA8mUwJvskXyOd+XXCCL
         1tmlDUtaCs7SeJM5rT0xZ1egI56OJ7AoYZqZS8U7za9ur4O2D5GTvvc1tn+yjnpTtxAD
         8k7ukN4LGJSBdTpG4V3Gn+UxlwEN1gbXB0uuX0IfrMtcRawdQu+6k/LnZSARVXxy4SYD
         s5iHdqY10YVvMP72O0Oy7yQ1BKCxVwJy5AvZy8ws2MMnxioehwddnetLEXvxAtKbzPlT
         zZ9mL3sv6TCVtsNDkvpbxsE0BFPnVue76HiEQpaNJu0keCmjHy000ldYmxzGuwoT4Qgo
         Zyag==
X-Forwarded-Encrypted: i=1; AFNElJ+i4DKVLiKUxdexQ+lB9aE1NaO2OpRcIFjibWl8pl204bPYojEa3GFAMcT1Hzj58cRGDBv1LidfiSSeVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tWn96wsOdcj+a0R7LAf3szwGlKN0VN+x0WSdQsWcsSF/vpRY
	JR0Y2J6DQyrXrV34dFvMRahOE3nhixOZZkkzOOdq8bo/b9CDhGpB5X+up3bCB1Ks28Bg4CIaZIH
	NcHQiRvr7W7Sf3Q2yaiHohcOgCURiJID0k6oqqvCDwsy3JaZXBgHDN8/0sV7mw00Ffg==
X-Gm-Gg: Acq92OFkvMr9gXkox4Bn361BlEJjMoviiDmnRg8VqyiGJNoTLuoba9rWOEN4lJ/5k9q
	zIgVPenY6U5avyOpI6pJe6Wdxr1FhgPuaR8lA0+HkV7MvdwRkbL9dKVJaEonOYOTGkIs2AnfkYh
	eGjbt8W1TlIjKVR3YYMQzjZHVNJQIjggSQ6/S+693HDhoZzHS65Y0ZUlo4WV/gHa4QDYw70X11H
	buH6f9l/JAHQtE7dM2F9lnJzxF2DlZbrRtUlodNwusPAiQbk67rO04Y9WJlGeiAxfWMmELVHtvo
	8rkWvwgvAky2Glm6yhjHDKJydD1fogvP1Ofpxb+YwUMai1Ud9M0lqjKaydq/6aU21coEPGoRzmu
	uG5egO+ZSPIJ6jwV/XlYR06/33N7piParvoKEW1DtkbeTzGezo9RWkbb6Mv6tV11xf2k3nK4bb2
	94+jbOpwc/g0cWzhcP
X-Received: by 2002:a17:90b:5628:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-368f77c87d1mr5487055a91.3.1778727921016;
        Wed, 13 May 2026 20:05:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5628:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-368f77c87d1mr5487020a91.3.1778727920438;
        Wed, 13 May 2026 20:05:20 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf4d940sm4346167a91.7.2026.05.13.20.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:05:19 -0700 (PDT)
Message-ID: <dd1ac800-5cba-4fde-a1c2-45dbd2c8d033@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:05:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: qcom: iris: Add hierarchical coding support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-4-4954e3b4df84@oss.qualcomm.com>
 <5kza7mdcjvzhfr32azt67fzsz2kqfxzywofqf75chv5otv4tns@4csfz5fd27yb>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <5kza7mdcjvzhfr32azt67fzsz2kqfxzywofqf75chv5otv4tns@4csfz5fd27yb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zzbH6Nag1mN7Y69GbTnJw_2Cw1hx-N6F
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a053bf1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qFeY41BV5J4peOxgSkYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: zzbH6Nag1mN7Y69GbTnJw_2Cw1hx-N6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNyBTYWx0ZWRfX/c9qNvuP85ih
 Bu8M5TIQtqz3glnwBn2syq1iZGCi6YPtvzn/nTA3TNKwk1YackUCjRBmEu39Q8nAWtCoH0hSwwS
 R81w0mpsP1ZP7GijqiAsS/Dxs1ARiM8cGnrhNtN1tlA4bd5/D5Kz7uD3AN+OphlTu7o/YdGYmqN
 CzvvxjT2yyFzsXbRuCmVSn262AZT+runnwW8qYqYsQlEIN1FmR1kUS5EyMY5LSS+REYSJH3Hd0S
 nawIxpCBijBeVTlveedPpIvskdRyZsE966Scu8ypmhgcjVDif5Pz0wNy+MxUU8QPjlldacrWgsk
 MruffFS7h6rVm9h1j6n9Tib3fToWScyuT+w3NYjeQ4NjeXzIKDaxq5ht5XDNsL9Z2SKPVfWBaZW
 7AeMRQ+Nu4ztyjEjqhr6ZC2+MUcmDpRwMexhBBBEAIFzR7+SBugE3adaGfe+z7R9/vPcme6ThZp
 hprEUIq35W4TtZGHOBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140027
X-Rspamd-Queue-Id: DAB0C53D3F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61562-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 19:07, Dmitry Baryshkov wrote:
>> -int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +int iris_set_bitrate_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>> +{
>> +	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
>> +	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>> +	u32 bitrate = inst->fw_caps[cap_id].value;
>> +	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>> +	struct hfi_bitrate hfi_val;
>> +	u32 max_bitrate;
>> +
>> +	if (!(inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) && cap_id != BITRATE)
>> +		return -EINVAL;
> 
> Why do you need this check?
> 
>> +
>> +	if (inst->codec == V4L2_PIX_FMT_HEVC) {

Both bitrate and layer bitrate are set and passed to the firmware using 
this API (iris_set_bitrate_gen1), so I need to distinguish whether the 
client has set the layer bitrate.

-- 
Best Regards,
Wangao



Return-Path: <linux-media+bounces-52648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLb5JMW2jWl96AAAu9opvQ
	(envelope-from <linux-media+bounces-52648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:17:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892612CEAD
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43F0F30AC95B
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 11:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE618344DB8;
	Thu, 12 Feb 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSZALmOz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E74w3dEO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F230D29E11D
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894984; cv=none; b=embaOrVlSMibGo/sRka7mcEWpawmSljqBFbZUDfKr5MW89JxG5yi/IwEiUYraSgtHOAkNFWJK+Ug/x6/+q516+QXhLo81Khb108irQZgiwwkwUojJH+eQsgLPfdxfBrNRXKMyvgP8ywPfqSQF7lF3euM5U38Aapa+PIDWVwKve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894984; c=relaxed/simple;
	bh=K+EcnrhdmLiQKi9r5V/gzJrnPgzyZ/cfOXg0C9WV33k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjzbdrmuC60t/4BtZFSYEs9sxgsnty5e2DcKbQI322nGU+NKffwITAVrWZyL30iUppJfkoBC4CsYb/DE79qIzvJXEP3xCTUyQAIvJqrTGTPliT/08mmnC81+645xzJfWrTfrwuzyYJIOe0uosAwGtjLp1A55lMsvYhpYWtFD/BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSZALmOz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E74w3dEO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAlird2545139
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 11:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5K9YjFShuMcHa0PLjdTNzDkm6yAqgg1AgaHhLg+Xb9M=; b=ZSZALmOz2edboGZY
	4NqMLzDJ7FFY8qR3HfbTIcSuBQtjIIUofP6ufXXxCGXyWr3ZnUA+E3/yc/CJgP+v
	yBxeL23ag5egKWDuXS63+O0/5lxfx+dliprUdoBPTki0nukeK0DHVJ5NZkDCxpsk
	Z/1zVICg5ro4c2lYXkZXU9Hij3/0PbJ8o14xFx3sIKw5PuqtKhTKVby62L2sUrxp
	8Z/2WhgNosKBwoMeHm0lN86s46VyAUTsNy9LymKE2xooBl0sEDBpOCmKZRAOvOdR
	YUwY3zCQblQDR4h4HxQlDDFi0eGBrPRQfJF7GJkBy02+CwketsQHr6qxkcD1FX26
	mTa6hw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wtpk212-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 11:16:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a9638b0422so34739325ad.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 03:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770894980; x=1771499780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5K9YjFShuMcHa0PLjdTNzDkm6yAqgg1AgaHhLg+Xb9M=;
        b=E74w3dEODb0hzGfqrKHwte+wVoDcMf92Ouo/8EbtBXsMAHBopT1Hf9GLpcpjWmlovE
         crMq3oQrWRUJEvvkk88LoJOb9I5+Q4nbj9YoxjzBaq4tkrd2B5ZmMHzqYc4d6r7MGFqM
         GuSbNpn8QsE6hBcMKR3zn1hx9Xl4nOhU50jvZ/owAmmeS/ccTTjr7DQQxlv89by4Wc3v
         n/P1S/FV25lcWH8lLUR8o5pd3aR16gK9K8C2RHKBaNSwGc88g2XT+nCs8nmPFMt0SNt7
         Kb8Fr4EED3RY0Vzppf4FvL7Bn94RBxKYLfP/IXh/sPEIPcRFkiqScTgcNj+1yGobNjei
         NCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894980; x=1771499780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5K9YjFShuMcHa0PLjdTNzDkm6yAqgg1AgaHhLg+Xb9M=;
        b=u246v8JR5mHR+V9PTBdUt/CQyUn+cUscV1aO2kGNxC/zt3uCcQ/4A8JrCPuqLYF8IB
         d+SNvJw9q+KIN59EiLiX80op0LO9q51PS6cJ31Sl70Yp6ZEXD+wVTwL28Mc7mExITRw+
         SLKNWOiaetEjHIQjTb7nA6p+mOCUd91R+4lEqNKQXQaVHRZc7PeK1CgH6cposlNJJ7Ea
         RS93qRdp25Cr/fA4uGKF3Bru2/TFcqCjoQErdXUizTYrNsuY+1pKtw3SKs0Z5sOKjTFs
         EfiMPBt0j/SA5iOt50ldfD5TgnROlHGwjIBHyDVLl+sGK0VJ+FWjhHd6iMtluEcdGvoA
         8WGw==
X-Forwarded-Encrypted: i=1; AJvYcCVbLssom4bK3udbpuBSvrgxw8xIODTFBFA46LZ+Yiy8UxSYXdlMDFkSqnvIafyJgidUkp3hn1yhC3Y8vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3f+IaDLJqqgwYCe4LZNOciWMiZmHmTarFpoo7AVpy/Db4ifW
	RUIMvzIW9BulxrXmfCrreDRyQf6NHdBE/pchKzbmcYDzw9ZE9BKkvBk/A27YLf2ts/SLv7qxomY
	lr2VQ1iZXp98jYpbB2eh4Sh6E3UuduFhUYXq7eu+BA9jjl/Wzxb/piF/NieItqf1Z/A==
X-Gm-Gg: AZuq6aKAm0vslke/jMWdY51hsMFB6JtMMv5Qcy03PYi8EoG+zZGW2E4px6ZzjYyXGWf
	B74x1OxzxENy50CtnyOk3wkDxeLC0BBk/Jgu6Zuc9T9XWgltSmy8lm3CFHZepiRQbTTEx0J0ufC
	/y+tGdsPNIv3P+sepXv0e/Bl8iYayWcbIPpOtSZpV7rAKyo0I3gDbKtXWWtAX4kNBhf2E59BFCR
	bk09Buerljcn/LZ1I7rZNCok4C9X6kH/IWhjS/gR5Ups8LlKLac9hdDJhfrjf6Urm1UfKkfKsD8
	eC5Ak6LZ5RgCREqgGsI3ZeJ9Hxe48i+xrHQTx8nR/IAza4BxK2GFLrPTkrOJhppUfJebsgE/G2C
	hfKOScxNnDAbnZTINCVhsE3n6cVNUJaky0/qZs/sf5JkuKHWWAln1Bw==
X-Received: by 2002:a17:903:15cf:b0:2aa:df82:ed7a with SMTP id d9443c01a7336-2ab39c8cd0cmr26501045ad.58.1770894980323;
        Thu, 12 Feb 2026 03:16:20 -0800 (PST)
X-Received: by 2002:a17:903:15cf:b0:2aa:df82:ed7a with SMTP id d9443c01a7336-2ab39c8cd0cmr26500795ad.58.1770894979780;
        Thu, 12 Feb 2026 03:16:19 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997a660sm52371265ad.64.2026.02.12.03.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:16:19 -0800 (PST)
Message-ID: <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:46:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=baxmkePB c=1 sm=1 tr=0 ts=698db685 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=VDDfqcjMpRzOalc4LhIaOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=7y-AjjASQrn7PQsgydUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TKqDwF_EN82zE5jPeZMZ2xLfyLfJ-4nS
X-Proofpoint-ORIG-GUID: TKqDwF_EN82zE5jPeZMZ2xLfyLfJ-4nS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4NCBTYWx0ZWRfXyE4m6RqL/6pZ
 r+F3/in0mmSQP99XDi+BGrJt5MO3R2RFTCGHut8b2ZyepktU84qUrpXvuxeELjzMi1BdrMxLLp9
 4LgqTDJJ31PWTm/85W0N1nonR48VCy0GBD5Uf0j76JysFqh4HTwcq2CVtU6ETdutXx54yPPzZDV
 ZXz20iQDn4Hcqtzo5gQzeE6ZJXBIuh7TKwm1G392RG9l67MR8ci2JiKgEx0oSofoaRGMdRr6d5u
 5Y/rr1SfeTJ3rQkU3wYQWmcf6Kt/A895Ei4xidnLth/Fv7YO5oD0WxfXeQ4xBbzvp0hawNUbDa4
 eU9AgNCEMQvyDaWD2cbogJKx9Srb5GFDFbRFg8XTyI2S7GprWMkI+BzP432FX5KZWZbfhqXa8Y7
 WLAvvn0Q2y8ir1ahMG1dTY92a4MpjkOsQh+0llYVLMOP83srg+cnc+Skfcs8ktcLrwp0mT3M90o
 +c9ObLtwxsu1ziedBqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52648-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1892612CEAD
X-Rspamd-Action: no action



On 2/9/2026 6:05 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 09, 2026 at 05:04:48PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
>>> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>>>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>>>> opt‑in by specifying a Gen2 image through the Device Tree
>>>> 'firmware-name' property.
>>>>
>>>> Based on this property and the availability of the referenced
>>>> firmware binary, the driver selects the appropriate HFI generation and
>>>> updates its platform data accordingly. Boards that do not
>>>> specify a Gen2 firmware, or where the firmware is not present,
>>>> automatically fall back to Gen1.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +int iris_update_platform_data(struct iris_core *core)
>>>> +{
>>>> +	const char *fwname = NULL;
>>>> +	const struct firmware *fw;
>>>> +	int ret;
>>>> +
>>>> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
>>>> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>>>> +					    &fwname);
>>>> +		if (ret)
>>>> +			return 0;
>>>> +
>>>> +		if (strstr(fwname, "gen2")) {
>>>> +			ret = request_firmware(&fw, fwname, core->dev);
>>>> +			if (ret) {
>>>> +				dev_err(core->dev, "Specified firmware is not present\n");
>>>> +				return ret;
>>>
>>> This is fragile - if someone names names their gen1 firmware something like
>>> "myproduct_gen2_vidfw.mbn", it's going to match..
>>>
>>> Could we instead do something like the explicit format checks in
>>> venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
>>> of the binary?
>>>
>>
>> I agree that checking for "gen2" as a substring in the firmware name is not
>> reliable. Unfortunately, we cannot
>> usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
>> probe the contents of the binary here, because Gen1 vs Gen2 have
>> incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
>> vice‑versa) isn’t viable in this path.
> 
> Can't we perform Gen2 query on Gen1 firmware, get the error and act
> accordingly? Or, better, perform Gen1 query on Gen2 firmware, receive
> the error from the firmware and act? In the end, your team is handling
> the firmware. If you want to support both interfaces, it should be a
> runtime check rather than filename matching.
> 
>>
>> To avoid accidental matches, I can switch to an exact filename match
>> instead. That way, only the specific Gen2 image (for example
>> "qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
> 
> How do you detect that for the OEM-signed firmware, which can have
> random name?
> 
>> want to use Gen2 can opt in by naming the firmware accordingly.

I Explored on suggested alternative approaches and seeing some limitation
with the both of them:

1. Detecting Gen1/Gen2 by scanning the firmware blob (fw->data)
It is possible to parse QC_IMAGE_VERSION_STRING from the .mbn and  extract
the version string. The issues with this approach :

- the version string has no explicit marker that identifies Gen1 vs Gen2.

- This prefix is not a formal ABI, and it is not consistent across SoCs.
Each SoC family uses different naming patterns in the version string.

Example : For SC7280 Gen1 we currently see:
QC_IMAGE_VERSION_STRING=video-firmware.1.0-<hash> while SM8250 has
QC_IMAGE_VERSION_STRING=VIDEO.VPU.1.0-00119-<>

So the driver would need SoC‑specific string‑matching rules, which is hard
to maintain if we are looking for a design to address all available SOCs.
	
2. Booting the firmware and querying it via an HFI system property
Issues with this approach :

- Gen1 and Gen2 use different HFI protocol formats (different packet
layouts, IDs, and message structures). There is no unified HFI message that
both generations can safely accept.

- The HFI protocol provides no version marker in any packet header.
The firmware does not know whether it is being talked to with Gen1‑style
packets or Gen2‑style packets. The driver simply typecasts the memory
buffer into a Gen1 or Gen2 packet type — the firmware has no concept of
“wrong HFI generation”. So it cannot return a dedicated error indicating
“incompatible HFI interface”.


Thanks,
Dikshita

>>
>> Thanks,
>> Dikshita
>>
>>> Konrad
> 


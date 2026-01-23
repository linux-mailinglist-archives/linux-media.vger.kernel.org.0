Return-Path: <linux-media+bounces-51439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DMTOn3Ac2mjyQAAu9opvQ
	(envelope-from <linux-media+bounces-51439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 19:39:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDE979B76
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 19:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ED04302688C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 18:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E90F299949;
	Fri, 23 Jan 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFg5oP5U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dX9wHEOk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652FA26A0B9
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769193577; cv=none; b=hwL2VEwbNgUyPxh5A5qglSLJi5qM9TMSUMbU2gJWEseTDTGU45WizmX2jjuuzhVOUZnieHmqmuYLHvQ6hujWLyXU0sWqnVO3lSWy+8TykCe+ebxCU7lo/+vrndHo7vFCvukItq76X4RDfbfkS9BUznZKoui+Iwdb6LGZcuxtFDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769193577; c=relaxed/simple;
	bh=dWUSDx6yQpSmxocokAXVUSl6a4+Sm1JcgGV5Yp41fag=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BBlSLdIAnEt/KwbqBT+FpJkOKq4UDQCt/Twf+PRzoqj+sa+rV8ljNyMUbdu4lyg4XWadyu6O8QAw1DSeowCRV5NIscmqj6A0jrub14XcEJi/845PsZgXyY99LPNfU+/t0Fk9SPZtXHaprpgu0KrtFunurEb/nY/BQ22Um+UYNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFg5oP5U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dX9wHEOk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NCJc832910302
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 18:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=; b=jFg5oP5U6UDsh5Z0
	Xv8cN6Ca0I+er40gTdFvB/kNcKqXEbIO7/HvrDn4Jd2xQG+QI7uzcz9lq7zwk7Rs
	TzQBXu3RNSvb7+Q+tmRDYeM265OgLyt3HSScLaSevk0TQY4svqbMsw42yM6bVQi1
	2EPkwNuG0BC9KcOAHw77JBtgy/gd3hJ4XOsfFj9TDkINNuCJ5rHWXiAFAY3CoCaL
	VWsPtzceS6tt/hRIdh3OXRtkSlom9Eldb0NPTbM4S2/XjGFtehTPJoGBv0v+91WJ
	NMBxDUcwG+DS52y+KmJ9Xy9vftMbbXx909umDk0blJ6/eJ1LJe/YrAlLjWaOTb2N
	VBw17Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1urpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 18:39:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b72277cffeso350731eec.3
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769193574; x=1769798374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=;
        b=dX9wHEOkMLh39D4izwyvzrq6IRliFSkIqkRnoz72OSs/KJ9yPSz5DXZsUt+pRnTglZ
         A9gaQBD2RusKFdiLFFNNQNhMRRE3Ed/Wb6dotucfoMZ9qVQ5BFjjye+Zz7ViJ7OFVk5J
         ZZWkwohbrcQihiloVUBm27wNbuslmoOcV3bbH+cv9U1ORIJQ3d7minM5k9lbpvOl8f8b
         lecQuuruDTW9FEliURfTzXAUVHAP1fl9DruNXl97l0WMz0PU9as5DzpMCz/A5PV4UEh/
         XklQ+41tZ7i7OBw6FBndzDD7lOKS/SYTd3LDznlRCB0OcGbW3V06DRP0cV8JUZI0mMMh
         OalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769193574; x=1769798374;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lA5GnhOpz8Pt4vFmJAqiP24gAHIYFFppamhnY2ROAQ=;
        b=o3zCrP/iUJyjvxUHDiqd1spF2Wntl+w/I46PMjGEQW+20ZS6hPAcFwiDlxFthepF41
         xy48e7Ao1wOb7tebUZenTfGz73Jre7jlqh1fBhACjNSNf/iY74Sfje1s+YoJRkbRd+S4
         328B0fMVMfALrzWmq9L6WaPhKYQCroQbY/IOCdbMY22K6Z1PK/UEQ8ItsTmgpumu/OLJ
         txyi+/JKopvu8+tKAlZnR8+02/TR/N63UDoVhcwjLBAxm6GJhf8ZZDMFH7eJvXD30You
         K/6/dNfoQ+X4ZGs7joC9Sc61itt1JjmqK2yz8/H93jf6BArA3dQM3rh55wLuSialvY1o
         ztkQ==
X-Gm-Message-State: AOJu0YzKIykpTsD0g/alhwmG5StU2KqMR3sE4z8Xd26sCL54DAX/piG/
	sgD7DfmO8nVLmuiEaYTne0eVk/2u7MApGu1YMRfHFs+EgkZG8ah7EmXgdiCFp8uOX7ZaxaeLIFy
	IhROsp8BgUongiE7yaKrGC/m/Zg79V9pPtsa9Xa9crgF9jDgIuEre0VHXTjc83T4SMHv5pduPJD
	Pa
X-Gm-Gg: AZuq6aK1lsck6mHfNpWNhdzFQ1qAdBF5jzIRyKxJtj8EEj1Zi6mTzDbI6PmrX2gii4j
	ZlnippAoJ4qUHpYe8EbktUzUkpUMN44KyUJV+dO+tQsrZQIGnuLBUPnRDxcYN3W8sPIRSU4KEA9
	Y5KR1UcS5SgO4GRqFYkwmWVKURyDkNRTS9a6AdZ5UvhDTiqElxtv/EKSgu4fjy6LSV3hUfb0LJe
	Yrqt/k6bIX6je3MgJ01BSqNYJZJ9IyvXDMpZo8rnbbhKoJXFdP9Uq74plpG3dD7z8QX1TNzfA5q
	5x96zPH6XFEAKWXvjP3LaidMkxnsaMaqpX7TLch2xftsuGy1xq7fnJgWDQpBTOyBev8Gjfgd4GP
	fkRaAoa/YEV2fnOHCaGlp/f5p+U/cmZ047nMpXI9+PGtBR6vTqgdEJQrizDQUGyOrh+cFzA==
X-Received: by 2002:a05:7022:987:b0:11a:344f:7a74 with SMTP id a92af1059eb24-1247dbff619mr905925c88.3.1769193572143;
        Fri, 23 Jan 2026 10:39:32 -0800 (PST)
X-Received: by 2002:a05:7022:987:b0:11a:344f:7a74 with SMTP id a92af1059eb24-1247dbff619mr905901c88.3.1769193569734;
        Fri, 23 Jan 2026 10:39:29 -0800 (PST)
Received: from [10.110.62.4] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa22707sm3974176eec.29.2026.01.23.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 10:39:29 -0800 (PST)
Message-ID: <99d6bc60-7f27-4221-83ba-b9bc14a9b3e2@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 10:39:28 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
 <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
 <6b5746cd16edf589fca79e2e6f8cf7f706309815.camel@ndufresne.ca>
 <0232a3fc-8774-4540-a718-eddb1d89e6d2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0232a3fc-8774-4540-a718-eddb1d89e6d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EkxTjxGo8Ok-YtY9DNg6qSaKRFOh2_Gf
X-Proofpoint-ORIG-GUID: EkxTjxGo8Ok-YtY9DNg6qSaKRFOh2_Gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0MSBTYWx0ZWRfX0EqZccMkdR12
 FsDcxipTL2ukmreXFJbxwlMyo5kklaF02WSBjvvy4vVVHZohGt5eFLLxQO2QVmn27mZlOkPzvln
 xfs6xf74n1GTXxz+q1vhwFRZNX81hsVAG1uE4RQGraR5T3EKY+UbHvUBXZYoZ/wIieZh8C+uN5x
 9OGzoqeCWxjazI3l4XmRr4Sk+bqi6Bpj29WacLAHY9fX92fbTKfJaCbdFrQ67GMMmMT05GAHrqh
 IfBV7fQr03l41DsIaoIDtL4rBB4p7AVOWvFAOoRiT9fPElznY1iyzZEG0I2QU1ocvhriXEGnNle
 MGmVbS+w5UzNfuzh18lXz4nYWxjRRqJ9DxdSIfbJMGKUtEbvcZwYpOoBavZmQeC47QdFo+T7Wdi
 fs+AKuSayDRvHJPju65RwDhaZAND/XH9+4puGEukh3rpH1QhPHBoeaedqqye2vB6b13tsk+lC5w
 WSZ9DM5WRg+6mK9p6xw==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=6973c067 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zBYVM8QCAAAA:8 a=Dy9dXtnXAAAA:8 a=JsNoqYpyAAAA:8
 a=tf5jizbvQTEfMRR51aQA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pqcTjcuDZwkA:10 a=1JuLLl_Xj_IA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=ArXkYGXkE6hBHcUMFODu:22 a=7b_YKI4FLZevj963FIVU:22
 a=2FlLF0J1BH4NsEBlSY-u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vulkan.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ubicast.tv:url];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51439-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5EDE979B76
X-Rspamd-Action: no action


On 1/15/2026 4:38 PM, Deepa Guthyappa Madivalara wrote:
>
> On 1/15/2026 5:42 AM, Nicolas Dufresne wrote:
>> Hi,
>>
>> Le mercredi 14 janvier 2026 à 14:14 -0800, Deepa Guthyappa Madivalara 
>> a écrit
>>
>>
>> [...]
>>
>>> Thanks for the quick comments.
>>> Qp map for can be too much data to be sent from user space to firmware
>>> via control per frame.
>>> Ex: Avc has mbsize as 16 and the max mbpf iris driver supports is 
>>> 8192x4352.
>>> This would mean 136kb of data (8bit Qp) needs to be transferred for 
>>> each
>>> frame in worst case.
>>> While are still evaluating Qp map option, due to firmware performance
>>> issues we are
>>> gravitating more towards rectangle ROI.
>>> I am not sure if we will need to support the Qp map in the future.
>> Have you read how this is implemented in Vulkan and D3D12 ? Please 
>> have a read:
>>
>> - Vulkan Video, see quantizationMapTexelSize [0]
>> - D3D, see QPMapRegionPixelsSize [1]
>>
>> [0] 
>> https://docs.vulkan.org/features/latest/features/proposals/VK_KHR_video_encode_quantization_map.html
>> [1] 
>> https://microsoft.github.io/DirectX-Specs/d3d/D3D12_Video_Encoding_Texture_QPMap_DirtyMap_MotionVectors.html
>>
>> Note that D3D also support dirty regions (what you call ROI in this 
>> proposal),
>> with no limits, since these are translated into map by drivers (its a 
>> software
>> feature on top) and motion search hints, that one seems rare.
>>
>> I'm not against having ROI in our API, its common in older chips 
>> designs, but
>> its clearly going away in the long run since most fixed hardware 
>> impose very low
>> region count, which is not usable for modern application. ROI it 
>> trivial to
>> implement on top of QP maps.
>>
>> A typical use case for that is to use lightweight AI or traditional 
>> CV to locate
>> most relevant portion of a video. The result is more like a heat map, 
>> not a set
>> of rectangles. Then we roughly map that in a low granularity QPMap 
>> before
>> encoding. This allow maintaining very low bandwidth, while preserving 
>> the
>> information needed for the heavier processing in the cloud. I'm 
>> including one of
>> the many example of that, this is a talk from Spiideo [2].
>>
>> [2] 
>> https://gstconf.ubicast.tv/videos/region-based-compression-in-gstreamer/
>>
>>
>> regards,
>> Nicolas
> Thank you for the detailed information. I reviewed the documentation
> and agree with your assessment. I am following up with my team to 
> explore this further.
>
> Thanks,
> Deepa
Hi Nicolas,

Thanks for the references. I was able to go through these and speak to
the teams internally. Here is the understandings and proposal for ROI.

To support rectangle QP, userspace will set compound control and
driver will convert this rectangle QP data to firmware understandable QP 
format
(similar to MB based QP format) and send it to firmware.

To support MB based QP, we need more inputs on how we can send 136KB
QP data eg. 8kUHD frame (one byte QP per 16x16MB) from GST / Userspace to
video driver. Can we send using compound control or any other alternate 
approaches
available?

Thanks
Deepa


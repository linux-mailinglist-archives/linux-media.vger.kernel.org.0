Return-Path: <linux-media+bounces-61517-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEpOJiLTBGp3PgIAu9opvQ
	(envelope-from <linux-media+bounces-61517-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91E53A187
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 415CC30BACD4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 19:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D383B5851;
	Wed, 13 May 2026 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPzCX65S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OgE6iBYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E93AFAE2
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700209; cv=none; b=nQK0TBj2UJg68z3WU9phZUjmfmOp5GvBofC/btQcxEL6hMUUxvsaAw7rLL5FHlRisnflgnrPIM91SysjlwvIvhVsBdW0iSdPJCyHpBuDu3OYCo8nhwQ2TR3qc4B97GayhOTXoPkWyIpAtPK3VP51ZtM9RPkQqI/WRzRLM84wlr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700209; c=relaxed/simple;
	bh=pzzhWuZCMRdaooryeMgm8vAFAtutADwyTwYiwruqciw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS9p+/2KkuKRq0ZuuK9Mmn5WAJLhhtQ1lRh5+HulxGt66T9BpFF+bxmF9rP+lU/CcGmFiOoDMEeZQ6HZXhnLIB/Rxq09+d1+LBLeCNF47h0A0ROj3MVRvbCuklXGbqhx8LSCKQIi9Lem+93BBJ7xPMvfNxwABybNpaifUu00I0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPzCX65S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgE6iBYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAw242524398
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9W+d1XMEmCq/odsQSepbOYGXHGkxm8V3ZwUbDeKHeEk=; b=lPzCX65STI1eFrcb
	bvIwHK7ntKoDXYaiyplUbM4+7qLw00wLAGB+R1O7+Sys74B18FVeXFEuGTn/kar7
	H90L+usBzgS7qXlWPbuSq9J0zuGVSeSeisRI126f6bI8i4u/4MXOHFVku+JcCOKd
	66se1nOb+fg9k3KdSvz1rHQqDKNdRGzD9vVB5WKcG4I1mCSGWkmonD5+qYuYGb+M
	rQjYzQa3EXnVAEenDGpeo8kIg5aScTH2zl5jt1+0mhWgFwSAP+xZbF2sLed8FaJh
	IQ1TmM2hQYFsiQNPoXEkUUKMXi8iEI647REuBKq07p/doBQTmf8Bz0ygsTfBpbIm
	f+6icg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgtgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 19:23:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so8951077b3a.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778700206; x=1779305006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9W+d1XMEmCq/odsQSepbOYGXHGkxm8V3ZwUbDeKHeEk=;
        b=OgE6iBYkRakP07ZHfy9s6aQPjHzjHoR96pyGf6D5WXvRRMAiTnB0uS6764q19L01hE
         h4J8+izwwzNarUldIRfvAzqga1weTQjtHMbPTEp9OeLugYfIG96oFNJIfr6ORrKoeXEg
         wJZclfuQ1RVu+lMuOMYwvtdNLqixCCCa1aZX4DFlputpYZaLQ8KzkvF3MOTj/Nqr0ovj
         mMxpDWnXi+wqht22ztUyNaU4/heYmNhXU/kyqk+NzhoD2afc0avOIdeXj6b0v9obf5ZM
         jVVqHw8fwThHTDTUY2YtycSCOucrZKlilBA0bFsMdrw0hPc6Cpr3zwcRD/ioP4TdJNtH
         u49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700206; x=1779305006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9W+d1XMEmCq/odsQSepbOYGXHGkxm8V3ZwUbDeKHeEk=;
        b=Q0tV4b2RBI4NqfQ+D6qyNUhvhiavyhybxSOPO725a0JXLvO9wwEf66E6DjMwDlxS9o
         v4fUDl359/kooCUjxm4Hgsq5b81ZUwX3tzidT3PHWUmcSt+fzO2vCDwv7PhDs+bdOPUM
         Ql5qZH+Xz+Kj6srDUgGOcT71oW7UXNS1eJcy9BXg6nYTw1jCMrDoWj7keiVwShhSfzvW
         JyIM5Z5DZUl63f24D+ibO+2uRHOmlUuvTDnbAp3gR84QClr/lgVVxBB1Ug4vOD8RoN5P
         0CgoVayC4FSA9O/erIlfiC4Je2U2oVte9K/hHBjj/tKiUhv2v3qlOFi/7NNYcAVEBeDr
         pRLg==
X-Forwarded-Encrypted: i=1; AFNElJ8g0bIHOn5mRHJ4p2k5D575pp2r4XzPby0maSVePOqhKtCp07MI++Fc51paIpn4YLPounf0ip/qsydf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhuujQWVNkti3EnjQoMk3DH3KFepBvVIweJ3s3eHuWYLkiCbI
	Zm9TyY2QiafWOk1J4yrPx5zXAqudG2Vl9zGxBAWQfDgtF1FCcbNMD6RtIxZucWBeIihG5GdiyoU
	yllZ+exa6ri/aHq1rh6B6UQcXM75y1qtpDqwgkr2QYkIJaW0tN5OwcZ42ACRffKnpGw==
X-Gm-Gg: Acq92OHEXWiKnf9H+Xi0NxGFZc7NvD+p0oGRVLwsd8ZFPrb8blCedpX/Wq4Yibbcugv
	wHsmw0GFivI/+Nv6SrkIRAXDu8dj4VxnYDpRiJTr3F3aOxJ9IGQBv0xQ+/3GGQWaT/5kBWTPTj+
	0goNhBtLB+tpF0OWNVXAeDGQpurR3AhmZA80bNblNGofXHzEhBKCC9obzOXO0xDZciCKW2x29rN
	6XZZOt0AyhWgkKCUNFQ7Let2iMSYLFQUd3GgpMc7Fy377c+n5roh7KogXA+isdSrEjwONLHoCbX
	yVSoeKazQVGJq9h8NltuonTdoM1ECnNxDjIzKy+4zT+yllTGfXG0Zw3g/uSpZdq90bLG3AoYSY9
	jcdSOeJop1bUByi2JEcjuF5XyEUUg+KwQ4H6+uL96qlNVgnIzk1cd91Hhg/S7bJc=
X-Received: by 2002:a05:6a00:32c4:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-83f042b916emr4914575b3a.41.1778700205551;
        Wed, 13 May 2026 12:23:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c4:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-83f042b916emr4914525b3a.41.1778700204914;
        Wed, 13 May 2026 12:23:24 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7809esm314509b3a.44.2026.05.13.12.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:23:24 -0700 (PDT)
Message-ID: <b9d69082-2a76-db71-365f-b8867ba692f5@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:53:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 11/14] media: iris: Add support to select core for dual
 core platforms
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
 <qodaq4xoi6whna4phhrfbdfanfm43y7vmg4qxjuke5m3qgxozn@h2ot2a7w36xh>
 <a9658e1e-70ed-0c30-28d9-28966242a4eb@oss.qualcomm.com>
 <uujvaqpr72vmdl7w6kjh4xggci4pnhfwukatdj2x63hewfhawa@muzebwimx4oi>
 <fa2eb472-92f9-9bf0-be62-93a88785b405@oss.qualcomm.com>
 <urpdhb6svgprfvo3drmpr5pusy4vjqf3hom3vtvf6kket3fqcw@lrad6xcrbzex>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <urpdhb6svgprfvo3drmpr5pusy4vjqf3hom3vtvf6kket3fqcw@lrad6xcrbzex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jPpe0-trTMUznc10VkQX_fpcyYywtWAW
X-Proofpoint-ORIG-GUID: jPpe0-trTMUznc10VkQX_fpcyYywtWAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE5MSBTYWx0ZWRfXxMcIE8H01LaF
 7Vte/6eiVJ7VT63Oobz+UPl+1zVxv44R4KWBVyEagk8917u0dzD8H14hKij4+Yvqx4Dqstw84jv
 qajQEFlDQOxe0wW4vfzXSXA17o4d3LJEX4PrwmsP3ttI9UFu8Ua137WOuQLEYsUliOyZD6+ctF1
 LopHEfCLtjUYC9Ma7/mtoF6FAaPeFHalEvsrEP7oFA1Zrk4HA4jIqQx9yV2Xk2wNHRS0KAg+d+Q
 v6Ep3J94h2ywSuPdrs5v+tVoF9JQDj/bKcUEtkyBSek6Zjn3UCsuJj9l9vlSkMJXsnAZ4wIvtXU
 6qGLVVCzgmsmX15eG9ZMN1deyz22UL5STvm+JphK5CGzcrj2WwWeD20hdZEvF93uUndIoKd3Sj1
 N+6F2n4x/WTl1vyvRD5xfYLCLXLdEewxE5yU+DmswKVzuLtXVlutj9ggEa/6/647xGhvIKErx4c
 QBVSeUWG2xpb5RT9olw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04cfae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ajyc9N5q4Y8mAeJsAi0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130191
X-Rspamd-Queue-Id: 0F91E53A187
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61517-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/14/2026 12:40 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 12:25:58AM +0530, Vishnu Reddy wrote:
>> On 5/13/2026 7:21 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 11, 2026 at 09:42:43PM +0530, Vishnu Reddy wrote:
>>>> On 5/9/2026 2:30 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, May 09, 2026 at 12:30:00AM +0530, Vishnu Reddy wrote:
>>>>>> On platforms with dual vcodec cores, select the hardware core for a
>>>>>> session based on current load. Assign the session to vcodec0 if its
>>>>>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
>>>>>> the selected core to firmware using the new HFI_PROP_CORE_ID property.
>>>>>>
>>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
>>>>>>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
>>>>>>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
>>>>>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>>>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
>>>>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>>>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>>>>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>>>>  drivers/media/platform/qcom/iris/iris_power.c      | 11 ++--
>>>>>>  drivers/media/platform/qcom/iris/iris_utils.c      | 75 ++++++++++++++++------
>>>>>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
>>>>>>  12 files changed, 113 insertions(+), 23 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
>>>>>> index 7f1c7fe144f7..3b3fc482e194 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>>>>>> @@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>>>>>>  	inst->metadata_idx++;
>>>>>>  }
>>>>>>  
>>>>>> +int iris_set_core_id(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>>>>>> +
>>>>>> +	if (!inst->core->iris_platform_data->dual_core)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	return hfi_ops->session_set_core_id(inst, inst->core_id);
>>>>>> +}
>>>>>> +
>>>>>>  int iris_process_streamon_input(struct iris_inst *inst)
>>>>>>  {
>>>>>>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
>>>>>> index b2a27b781c9a..34e32c60f768 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_common.h
>>>>>> @@ -11,6 +11,7 @@ struct iris_buffer;
>>>>>>  
>>>>>>  int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
>>>>>>  void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
>>>>>> +int iris_set_core_id(struct iris_inst *inst);
>>>>>>  int iris_process_streamon_input(struct iris_inst *inst);
>>>>>>  int iris_process_streamon_output(struct iris_inst *inst);
>>>>>>  int iris_session_streamoff(struct iris_inst *inst, u32 plane);
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>>>>>> index b396c8cf595e..54a8649841e4 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>>>>>> @@ -30,6 +30,11 @@ enum domain_type {
>>>>>>  	DECODER	= BIT(1),
>>>>>>  };
>>>>>>  
>>>>>> +enum iris_vcodec_core_id {
>>>>>> +	IRIS_VCODEC0 = 1,
>>>>>> +	IRIS_VCODEC1,
>>>>>> +};
>>>>>> +
>>>>>>  /**
>>>>>>   * struct iris_core - holds core parameters valid for all instances
>>>>>>   *
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>>>> index 3edb5ae582b4..fbaf852a6b99 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>>>>>> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
>>>>>>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
>>>>>>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>>>>>>  	int (*session_close)(struct iris_inst *inst);
>>>>>> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
>>>>>>  };
>>>>>>  
>>>>>>  struct iris_hfi_response_ops {
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>>>> index 30bfd90d423b..9d9fae587297 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>>>> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>>>>>>  					inst_hfi_gen2->packet->size);
>>>>>>  }
>>>>>>  
>>>>>> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
>>>>>> +{
>>>>>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>>>>> +	u32 payload = core_id;
>>>>>> +
>>>>>> +	iris_hfi_gen2_packet_session_command(inst,
>>>>>> +					     HFI_PROP_CORE_ID,
>>>>>> +					     HFI_HOST_FLAGS_NONE,
>>>>>> +					     HFI_PORT_NONE,
>>>>>> +					     inst->session_id,
>>>>>> +					     HFI_PAYLOAD_U32,
>>>>>> +					     &payload,
>>>>>> +					     sizeof(u32));
>>>>>> +
>>>>>> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>>>>>> +					inst_hfi_gen2->packet->size);
>>>>>> +}
>>>>>> +
>>>>>>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>>>>>  	.sys_init = iris_hfi_gen2_sys_init,
>>>>>>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
>>>>>> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>>>>>  	.session_drain = iris_hfi_gen2_session_drain,
>>>>>>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>>>>>>  	.session_close = iris_hfi_gen2_session_close,
>>>>>> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
>>>>>>  };
>>>>>>  
>>>>>>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>>>> index cecf771c55dd..600e9dc07669 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>>>>>> @@ -56,6 +56,7 @@
>>>>>>  #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
>>>>>>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>>>>>>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
>>>>>> +#define HFI_PROP_CORE_ID			0x030001a9
>>>>>>  
>>>>>>  enum hfi_rate_control {
>>>>>>  	HFI_RC_VBR_CFR		= 0x00000000,
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>>>>>> index 16965150f427..dd341ca5be57 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>>>>> @@ -37,6 +37,7 @@ struct iris_fmt {
>>>>>>   *
>>>>>>   * @list: used for attach an instance to the core
>>>>>>   * @core: pointer to core structure
>>>>>> + * @core_id: specifies the hardware core on which the session runs
>>>>>>   * @session_id: id of current video session
>>>>>>   * @ctx_q_lock: lock to serialize queues related ioctls
>>>>>>   * @lock: lock to seralise forward and reverse threads
>>>>>> @@ -79,6 +80,7 @@ struct iris_fmt {
>>>>>>  struct iris_inst {
>>>>>>  	struct list_head		list;
>>>>>>  	struct iris_core		*core;
>>>>>> +	u32				core_id;
>>>>>>  	u32				session_id;
>>>>>>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>>>>>>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> index 8995136ad29e..502d7099085c 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> @@ -258,6 +258,7 @@ struct iris_platform_data {
>>>>>>  	const struct tz_cp_config *tz_cp_config_data;
>>>>>>  	u32 tz_cp_config_data_size;
>>>>>>  	u32 core_arch;
>>>>>> +	bool dual_core;
>>>>>>  	u32 hw_response_timeout;
>>>>>>  	struct ubwc_config_data *ubwc_config;
>>>>>>  	u32 num_vpp_pipe;
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
>>>>>> index 91aa21d4070e..b72ce5b596b8 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_power.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_power.c
>>>>>> @@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
>>>>>>  
>>>>>>  static int iris_set_clocks(struct iris_inst *inst)
>>>>>>  {
>>>>>> +	u64 vcodec0_freq = 0, vcodec1_freq = 0;
>>>>>>  	struct iris_core *core = inst->core;
>>>>>>  	struct iris_inst *instance;
>>>>>> -	u64 freq = 0;
>>>>>>  	int ret;
>>>>>>  
>>>>>>  	mutex_lock(&core->lock);
>>>>>> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
>>>>>>  		if (!instance->max_input_data_size)
>>>>>>  			continue;
>>>>>>  
>>>>>> -		freq += instance->power.min_freq;
>>>>>> +		if (instance->core_id == IRIS_VCODEC0)
>>>>>> +			vcodec0_freq += instance->power.min_freq;
>>>>>> +		else
>>>>>> +			vcodec1_freq += instance->power.min_freq;
>>>>>>  	}
>>>>>>  
>>>>>> -	core->power.clk_freq = freq;
>>>>>> -	ret = iris_opp_set_rate(core->dev, freq);
>>>>>> +	core->power.clk_freq = max(vcodec0_freq, vcodec1_freq);
>>>>>> +	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
>>>>>>  	mutex_unlock(&core->lock);
>>>>>>  
>>>>>>  	return ret;
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>>>>>> index cfc5b576ec56..da8a89d3dd41 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>>>>>> @@ -90,40 +90,79 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>>>>>>  	return NULL;
>>>>>>  }
>>>>>>  
>>>>>> -int iris_check_core_mbpf(struct iris_inst *inst)
>>>>>> +static u32 iris_get_mbps(struct iris_inst *inst)
>>>>>>  {
>>>>>> -	struct iris_core *core = inst->core;
>>>>>> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
>>>>>> +
>>>>>> +	return iris_get_mbpf(inst) * fps;
>>>>>> +}
>>>>>> +
>>>>>> +static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
>>>>>> +{
>>>>>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>>>>>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
>>>>>> +	u32 max_session_cnt = platform_data->max_session_count;
>>>>>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
>>>>>> +	bool dual_core = platform_data->dual_core;
>>>>> num_cores
>>>> A num_cores field would require updating all platform data entries. For two
>>> I was thinking about adding num_cores to platform_data and to iris_inst
>>> (or iris_core) and setting it to 1 if the value is unset in
>>> platform_data.
>>>
>>> A better option would be to move all these multi-core functions to a
>>> separate file.
>> Thanks for your point, Adding num_cores to platform_data makes sense if the
>> number of cores grows beyond two. For now, since we only handle single and
>> dual core, the current logic feels simpler and sufficient to cover both cases.
>> Happy to adopt the num_cores approach in the future if we have any platform
>> with more than dual core.
> Again, an alternative approach is to get all the platform specifics into
> the corresponding iris_vpuXX.c file.

Are you suggesting moving this function to the corresponding iris_vpuXX.c file
and hooking it into the platform-specific ops?

>>>> cores, a simple boolean flag feels sufficient here.
>>>>
>>>>>> +	u32 core0_load = 0, core1_load = 0;
>>>>>> +	bool select_core0, select_core1;
>>>>>>  	struct iris_inst *instance;
>>>>>> -	u32 total_mbpf = 0;
>>>>>> +	u32 load, new_load;
>>>>>>  
>>>>>> -	mutex_lock(&core->lock);
>>>>>> -	list_for_each_entry(instance, &core->instances, list)
>>>>>> -		total_mbpf += iris_get_mbpf(instance);
>>>>>> -	mutex_unlock(&core->lock);
>>>>>> +	inst->core_id = 0;
>>>>>>  
>>>>>> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
>>>>>> +	list_for_each_entry(instance, &inst->core->instances, list) {
>>>>>> +		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
>>>>>> +
>>>>>> +		if (instance->core_id == IRIS_VCODEC0) {
>>>>>> +			core0_load += load;
>>>>>> +			core0_session_cnt++;
>>>>>> +		} else if (instance->core_id == IRIS_VCODEC1) {
>>>>>> +			core1_load += load;
>>>>>> +			core1_session_cnt++;
>>>>> Arrays, please.
>>>> Since we only have two cores, explicit variables feel cleaner and easier to
>>>> read than arrays.
>>>>
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
>>>>>> +
>>>>>> +	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
>>>>>> +	select_core1 = dual_core && core1_load + new_load <= max_load &&
>>>>>> +		     core1_session_cnt < max_session_cnt;
>>>>>> +
>>>>>> +	if (select_core0 && select_core1)
>>>>>> +		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
>>>>>> +	else if (select_core0)
>>>>>> +		inst->core_id = IRIS_VCODEC0;
>>>>>> +	else if (select_core1)
>>>>>> +		inst->core_id = IRIS_VCODEC1;
>>>>>> +	else
>>>>>>  		return -ENOMEM;
>>>>>>  
>>>>>>  	return 0;
>>>>>>  }
>>>>>>  
>>>>>> -int iris_check_core_mbps(struct iris_inst *inst)
>>>>>> +int iris_check_core_mbpf(struct iris_inst *inst)
>>>>>>  {
>>>>>>  	struct iris_core *core = inst->core;
>>>>>> -	struct iris_inst *instance;
>>>>>> -	u32 total_mbps = 0, fps = 0;
>>>>>> +	int ret;
>>>>>>  
>>>>>>  	mutex_lock(&core->lock);
>>>>>> -	list_for_each_entry(instance, &core->instances, list) {
>>>>>> -		fps = max(instance->frame_rate, instance->operating_rate);
>>>>>> -		total_mbps += iris_get_mbpf(instance) * fps;
>>>>>> -	}
>>>>>> +	ret = iris_check_and_assign_core(inst, true);
>>>>>>  	mutex_unlock(&core->lock);
>>>>>>  
>>>>>> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
>>>>>> -		return -ENOMEM;
>>>>>> +	return ret;
>>>>>> +}
>>>>>>  
>>>>>> -	return 0;
>>>>>> +int iris_check_core_mbps(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	struct iris_core *core = inst->core;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	mutex_lock(&core->lock);
>>>>>> +	ret = iris_check_and_assign_core(inst, false);
>>>>>> +	mutex_unlock(&core->lock);
>>>>>> +
>>>>>> +	return ret;
>>>>>>  }
>>>>>>  
>>>>>>  bool is_rotation_90_or_270(struct iris_inst *inst)
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>> index bf0b8400996e..5a05f7d65501 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>> @@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>>>>>>  	if (ret)
>>>>>>  		goto error;
>>>>>>  
>>>>>> +	ret = iris_set_core_id(inst);
>>>>>> +	if (ret)
>>>>>> +		goto error;
>>>>>> +
>>>>>>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>>>>>>  		if (inst->domain == DECODER)
>>>>>>  			ret = iris_vdec_streamon_input(inst);
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> index 5eb1786b0737..a1ce3cd524a3 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> @@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
>>>>>>  
>>>>>>  static void iris_add_session(struct iris_inst *inst)
>>>>>>  {
>>>>>> +	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
>>>>>>  	struct iris_core *core = inst->core;
>>>>>>  	struct iris_inst *iter;
>>>>>>  	u32 count = 0;
>>>>>>  
>>>>>> +	if (inst->core->iris_platform_data->dual_core)
>>>>>> +		max_session_count *= 2;
>>>>> max_session_count *= num_cores.
>>>>>
>>>>>> +
>>>>>>  	mutex_lock(&core->lock);
>>>>>>  
>>>>>>  	list_for_each_entry(iter, &core->instances, list)
>>>>>>  		count++;
>>>>>>  
>>>>>> -	if (count < core->iris_platform_data->max_session_count)
>>>>>> +	if (count < max_session_count)
>>>>>>  		list_add_tail(&inst->list, &core->instances);
>>>>>>  
>>>>>>  	mutex_unlock(&core->lock);
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>


Return-Path: <linux-media+bounces-52103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABzoHpHTgWmlKQMAu9opvQ
	(envelope-from <linux-media+bounces-52103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:53:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6AD7F9D
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 11:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72B40308A2E2
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 10:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F57032860C;
	Tue,  3 Feb 2026 10:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WejfX0w3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfliVhyi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773A321434
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115944; cv=none; b=Sh0kHgXrPgsPp6v2hP/ffoby1aGLCSaotXijVq1eVB1DGPm4ggz3dLM8DomWHUrd4jSeutzJ2VgGI3pIHFFUqfv+epR+8gapTMrYU6i4p03AuAwSBpce0kPSIWFv7O2lmHt0qjQy87QspE+Ss1V9dn2fDHm0jAQDVMnH5Ut9Vyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115944; c=relaxed/simple;
	bh=9EMYvPZqjZKZwYRTfzKedruF/ZAlbUnamAO8TWQfVM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijpkHWh4ygjO+uC+7CRMh+eEnSU4nBajeY3qLXkU28AvHGjLqlb8Lu5Pf2HVeohPX9/tqK3P5LpIGVDcugqjvhln+v0pxOITWwQNH/SPIovFbSb3dPUImMTKtyKFVy/q47hDFyicweH+xYepm5Oxc8lY3vbanyzMdVbml9HPKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WejfX0w3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfliVhyi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61362xIl3916029
	for <linux-media@vger.kernel.org>; Tue, 3 Feb 2026 10:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K65sB3uDjDvfV29tZMSsnqctzd2/c+oSofRl8ktT8Wg=; b=WejfX0w3iULE/QDX
	44VoFCNbdbWdpxAVcLHEt6DvgZPV5HKKlQFgJb3chngY2Gtjd4syMC3wXfhmRAl3
	kk2zlD/QmIHwFB7dOv/VrDZiRfBOX+7bxDYZsB8kLVeil5HrRbyXRUeutRdL4k0+
	P0G75mKkgayRcrN/6g+pw793w+vlxufAx+iFkvoqi8TFJK40hV8UgIgsH07ZjHTb
	rQCk24yUco5SWJ+JqkY2JzAOOVEjKSXTjRM0SEFff3P3/v6CJWEK42J529fU/u5y
	QKP+449qaI53yDbEe+I8M03zZnsI38jC1ebVWC3xKom3NHHog1JSrJaNMrKKkPEY
	JkMhoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmm20w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 10:52:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8f8c81d02so28834075ad.2
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 02:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770115934; x=1770720734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K65sB3uDjDvfV29tZMSsnqctzd2/c+oSofRl8ktT8Wg=;
        b=UfliVhyipg6+yqeh3vUyGmat8VzHTn/hwqITdd4AUs115S1FudIdKRIxgOu/N39dal
         BwJ2uCTqDfOQebak7if302rebsZ8ChrX/QZAU8xfd+pfwKVIy1nneXhBNdBIPcq8xQuM
         YSxhj/eVHgip6NF7eT7LrPBWq2Vyo3we3oppBSZmp+EwGs51CU3uWZ3AjW0DuxmVQipC
         ReyAYosBZOiUXjdwjADaMrR8KXrjLv1uadu3V6k/+s/6ghm1Tl9QUtxu3Pedcf6qOnEv
         ZrrBCLewwZsCvgRtDaBGVzswJXua27IMI65I5JbSojQ6RLsF3VB7aDTZ82m7QCA6wAoR
         9dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115934; x=1770720734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K65sB3uDjDvfV29tZMSsnqctzd2/c+oSofRl8ktT8Wg=;
        b=ZcCH+8opUKUuBWrWNud3JyQPfNTPWn46JBQpxzqWG+Blz1YYcWJAeROlxgVsyxLast
         LYQ4i/KztVqPSVq+aLpSbgZBUJ17mv4+qh42Ncg9RzNAYBlJv2MpPQ5pCQMlUq2LpQCY
         ++zoarnTnSA2Wwu+mHtPOrS3fRDjQJaJk6UKzHpT0jt7LAknnlygmxpaHlye8QZ/iLT5
         RlHOzBdZz+6/YMWSDKEyyqaNAP5T82Rsue7EPOfCH+XasOeeTgUk+IEjoGzeIu9QT+FW
         4JWYWWpuFUNQAr1Kny8b77CL6XFw0sO9Yag5d6CKGb5zEhoKxb0b+vDXUQqw9oQyz2Hx
         UG1A==
X-Forwarded-Encrypted: i=1; AJvYcCWLEKeh51EZi61oHwLk1H1EocqRvLSwv0l+s+WGjxpDs7qfx29y4zy09QO20IEyBt+HZ5A/Qy/2keGuAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+ZIh9Mvv9nEXwpRHNYidY/nWsnmLugjCWCzXAYT0NSIyz/EJ
	r4Z416y6yXxzWyhdBZfbAA8DoTTYGE+snq4n2pgbwfzUSMarm2CRskysQGTwNIgKXQ9ZSckvIDQ
	CpS7HHXgZke5GDvlSe8WHfsSkhhIkGUVn6+XaBcI6GH0fMXkTK5d7mO3RDR539Md33A==
X-Gm-Gg: AZuq6aIUeosbGaplg1+8BrD7Qt0WqkP3afdGdGyPgLlJPP25JY9XPR186QuwmcjjGQW
	lmREoS9KRjuYorSG2jzjsWsl1/a6p+NYKcjba+fu+7zIzY9MkOhOI7BtFPZBW21KAFlGOnG0zfj
	kU1av+bnZOx4TinoRLIqOy+flFqlcW3iOaBYhRBEuFT+sCDJvdBcunYk6i10Ei95MtVDBkgnq5M
	nsq8SoSw3QvP3sNkQrcLVEBrN5i6mkVVye6trNup7Xfyvl7bMklJbcnPG8O2XDco1NDJdaYNjyE
	8+VRuxYkA6Ok2979QqZ1gkK760h0vxtZ4tOvdgQe91Pj/u+mXK5b3JXhmqrbePAXszzQPYt71dp
	dh5EgZCjrZGj4rX9aVD/mNvb1VJlsF4zeRYHUBEANBcwO
X-Received: by 2002:a17:902:f68b:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2a90e8b56e0mr69719695ad.23.1770115933935;
        Tue, 03 Feb 2026 02:52:13 -0800 (PST)
X-Received: by 2002:a17:902:f68b:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2a90e8b56e0mr69719495ad.23.1770115933413;
        Tue, 03 Feb 2026 02:52:13 -0800 (PST)
Received: from [10.219.57.109] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b415b01sm170144145ad.40.2026.02.03.02.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:52:13 -0800 (PST)
Message-ID: <d67b33b1-392e-4689-9a67-48c1099bdc80@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 16:22:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] of/iommu: add multi-map support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-3-e2646246bfc1@oss.qualcomm.com>
 <c3c38745-2bc0-4573-92d3-f5035d651ca1@linaro.org>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <c3c38745-2bc0-4573-92d3-f5035d651ca1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981d35f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bdoIAPvoR7LDK81EK4wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GNfOyelU76ZS7woGHQinDow42UiNyhgv
X-Proofpoint-ORIG-GUID: GNfOyelU76ZS7woGHQinDow42UiNyhgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4NiBTYWx0ZWRfXwD169PbAUvfX
 ZGJpHKfWeQ0XVmANn+fJNun5pjcdIINNgXVbYmTclcdbYw+kNXY3lt1VYMSnjlirX4PqNy7ZN17
 rxzidSVzQW5f+DiUhfU6bTUjmrDyDWj1K2cJyJbeUXX2ZoV3rfyoNzZqZDTxXDlE6wL20azNLlY
 n/m/725bGV7AQ+YZOlYcqvt16hAYNlUlmtHD0tUF6TsLftqvjsrEftRfSG0zWeEyYZASdjAiZ1M
 hMAj8P1qXjU2sN+Wcbx9PoKZSSCtWGeQit/vowHPEGHU4vBH1sVbJizfPXmGKYQ6ADa3Jq00h5h
 Am2s2hmLVvDI7fb2kejA2+UJ8LQUKNHgeJ0siTITfxc3doVs65gIYS26Y1/IakjrIksxUlxhYHN
 lw7x3sAWkoFHDD2vo9D/+AKN9F1gbCG2wtv5lO0ROUTdUfJMfPJpc9zgb4tihYfm4Wwv+G9o5FO
 6dydtkzc0MGaZD0hDSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52103-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,arg.map_args.np:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFB6AD7F9D
X-Rspamd-Action: no action



On 2/2/2026 8:27 PM, Bryan O'Donoghue wrote:
> On 26/01/2026 12:25, Vikash Garodia wrote:
>> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>>
>> When multiple mappings are present for an input id, linux matches just
>> the first one. There is a usecase[1] where all the mappings are to be
>> maintained in parallel for an iommu-map entry of a same input id.
>>
>> Whether multi-map is needed is reported by the callers through the
>> callback function passed, which is called for every input id match.
>>
>> Since the requirement in the usecase[1] is for platform devices, not
>> sure if it is really clean to maintain this decision on the bus type at
>> the of_iommu layer or further to be from the respective
>> iommu_driver->impl_ops().
>>
>> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
>>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 36 ++++++++++++++++++++++++++++--------
>>   drivers/of/base.c        | 38 ++++++++++++++++++++++++++++----------
>>   include/linux/of.h       |  6 ++++++
>>   3 files changed, 62 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 768eaddf927b0700b2497b08ea21611b1a1b5688..067bb2298973671e1eaf01bb2ea52df3d2a52a44 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/slab.h>
>>   #include <linux/fsl/mc.h>
>> +#include <linux/platform_device.h>
>>     #include "iommu-priv.h"
>>   @@ -41,22 +42,41 @@ static int of_iommu_xlate(struct device *dev,
>>       return ret;
>>   }
>>   +/*
>> + * Callback to be called from of_map_id(), that tells if
>> + * all the mappings for an input id to be maintained in
>> + * parallel. Should this decission be from further layers,
>> + * iommu_driver->impl_ops?
>> + */
>> +static int of_iommu_configure_cb(struct of_map_id_arg *arg)
>> +{
>> +    struct of_phandle_args *iommu_spec = &arg->map_args;
>> +    struct device *dev = arg->dev;
>> +    int err;
>> +
>> +    err = of_iommu_xlate(dev, iommu_spec);
>> +    of_node_put(iommu_spec->np);
>> +
>> +    /* !iommu_spec->np may be from the bypassed translations */
>> +    if (!err)
>> +        err = (!arg->multi_map || !iommu_spec->np) ? 0 : -EAGAIN;
>> +
>> +    return err;
>> +}
>> +
>>   static int of_iommu_configure_dev_id(struct device_node *master_np,
>>                        struct device *dev,
>>                        const u32 *id)
>>   {
>>       struct of_map_id_arg arg = {
>>           .map_args = {},
>> +        .cb = of_iommu_configure_cb,
>> +        .dev = dev,
>> +        /* Should this be pushed to iommu_driver->impl_ops? */
>> +        .multi_map = dev_is_platform(dev),
>>       };
>> -    int err;
>> -
>> -    err = of_map_iommu_id(master_np, *id, &arg);
>> -    if (err)
>> -        return err;
>>   -    err = of_iommu_xlate(dev, &arg.map_args);
>> -    of_node_put(arg.map_args.np);
>> -    return err;
>> +    return of_map_iommu_id(master_np, *id, &arg);
>>   }
>>     static int of_iommu_configure_dev(struct device_node *master_np,
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 606bef4f90e7d13bae4f7b0c45acd1755ad89826..a1c3c5954ec7e8eb3753c8fd782a1570f9eb9c17 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -2122,14 +2122,21 @@ static bool of_check_bad_map(const __be32 *map, int len)
>>       return true;
>>   }
>>   -static int of_map_id_fill_output(struct of_map_id_arg *arg,
>> -                 struct device_node *phandle_node, u32 id_or_offset,
>> -                 const __be32 *out_base, u32 cells,
>> -                 bool bypass)
>> +/*
>> + * Fill the id_out and target for the of_map_id() caller. Also
>> + * call the callback passed to the of_map_id() as part of the arg
>> + * that decides if to continue further search.
>> + */
>> +static int of_map_id_fill_arg(struct of_map_id_arg *arg,
>> +                  struct device_node *phandle_node, u32 id_or_offset,
>> +                  const __be32 *out_base, u32 cells,
>> +                  bool bypass, bool *multi_id_map)
>>   {
>> +    int ret;
>> +
>>       if (bypass) {
>>           arg->map_args.args[0] = id_or_offset;
>> -        return 0;
>> +        goto output;
>>       }
>>         if (arg->map_args.np)
>> @@ -2145,7 +2152,14 @@ static int of_map_id_fill_output(struct of_map_id_arg *arg,
>>         arg->map_args.args_count = cells;
>>   -    return 0;
>> +output:
>> +    /* pass the output for the callback, callers may further decide */
>> +    ret =  arg->cb ? arg->cb(arg) : 0;
>> +
>> +    if (multi_id_map && ret == -EAGAIN)
>> +        *multi_id_map = true;
>> +
>> +    return ret;
>>   }
>>     /**
>> @@ -2179,6 +2193,7 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>       int map_bytes, map_len, offset = 0;
>>       bool bad_map = false;
>>       const __be32 *map = NULL;
>> +    bool multi_id_map = false;
>>         if (!np || !map_name || !arg)
>>           return -EINVAL;
>> @@ -2264,23 +2279,26 @@ int of_map_id(const struct device_node *np, u32 id, const char *map_name,
>>           if (masked_id < id_base || id_off >= id_len)
>>               continue;
>>   -        ret = of_map_id_fill_output(arg, phandle_node, id_off, out_base, cells, false);
>> +        ret = of_map_id_fill_arg(arg, phandle_node, id_off, out_base,
>> +                     cells, false, &multi_id_map);
>>           if (ret == -EAGAIN)
>>               continue;
>>             pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
>>               np, map_name, map_mask, id_base, be32_to_cpup(out_base),
>>               id_len, id, id_off + be32_to_cpup(out_base));
>> -        return 0;
>> +        return ret;
>>       }
>>   +    if (multi_id_map)
>> +        return 0;
>> +
>>       pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
>>           id, arg->map_args.np  ? arg->map_args.np : NULL);
>>     bypass_translation:
>>       /* Bypasses translation */
>> -    return of_map_id_fill_output(arg, NULL, id, 0, 0, true);
>> -
>> +    return of_map_id_fill_arg(arg, NULL, id, 0, 0, true, NULL);
>>   err_map_len:
>>       pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
>>       return -EINVAL;
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 9efa6f93712c6024f05476f9fd39f3294f942ec1..abab73a76682351f5635c1127a6c899917525050 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -25,6 +25,9 @@
>>   typedef u32 phandle;
>>   typedef u32 ihandle;
>>   +struct of_map_id_arg;
>> +typedef int (*of_map_id_cb)(struct of_map_id_arg *arg);
>> +
>>   struct property {
>>       char    *name;
>>       int    length;
>> @@ -76,6 +79,9 @@ struct of_phandle_args {
>>     struct of_map_id_arg {
>>       struct of_phandle_args map_args;
>> +    of_map_id_cb cb;
>> +    struct device *dev;
>> +    bool multi_map;
>>   };
>>     struct of_phandle_iterator {
>>
> 
> I think at a minimum this and the previous patch should be separated into its/their own series ∵ you really require this to be applied before proceeding on with the rest of the submission.
> 
> Get these two patches through iommu@lists.linux.dev in isolation and then submit the driver changes to consume.
> 
> ---
> bod

Sure, I’ll split the first two patches into a seperate series and submit them.

Thanks,
Vijay


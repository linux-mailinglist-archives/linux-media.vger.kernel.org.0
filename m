Return-Path: <linux-media+bounces-59026-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PijLv9P4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59026-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:21:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98E41C853
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 588C530AB737
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3809A2FE07D;
	Fri, 17 Apr 2026 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEHa0pWc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i499Izi7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5892EBBA9
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439204; cv=none; b=MYGBd2LUyOCM92IkBEArTIIAIHhor/62Cu59YaYr1z/9WFEDQQHrpHh+3dD5yuKR+TDnH0BlVnqlwc6sF50u3MDmhbcEZEckhhdrzcPMWn5r+klgR+0cuOh5rn5yKc+82cpTT5UZoeV5INzzEN2xuivTdPiwnZShToPZGS82rdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439204; c=relaxed/simple;
	bh=94H9O5bKpZJFIum9FyBi6L/m0YdYgTBfbD+IuzK2avE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F1OdBGpAWdpRpE+B1YGbV35ovif+laGrki9cz3QQ7UjWW6/TX5q/mklcMDdygDaRY1FILZI7fRgHhvSP1CIhWBeiV7vR8DhA3rjRrw0gtHyWYY+JBVXrbgv/hs7++sYUJN+SCzJzYFuiMKxsT4NNPM/crG4+NmsZYtgogN53iHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEHa0pWc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i499Izi7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8nsgm3100254
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Wig1FYIP1zNSkQ75Q9iE46JSnYQwQ+jz+kMS2CZwmk=; b=MEHa0pWcmt4NO+oF
	XIOI8kb+L/JodJtIBeDcElJu/+MpF8jpLDR0GlNqqApUe2eJajsKAq8JeaYtNJxg
	H/wN4Nt7BSzlq10yeH4HIALqtTsivmqxDZUgf8/bVaap8KD+DQXenT/t32cTdh4/
	s06CZFhAe+4OsroOecp6k++stVG3vDYZ2pwcGOPs7DndR7ccnKcgdYg2HNsfJ4/i
	vauSf8nkMEm5yS5MzHOpsHJ2uKxuXC2iOVY8XbEAHNt4A42yvyPbvtjNURUSUxaY
	ntoxZgsbt7aGdKmi3iMIkZaI3HSXN0pSu0Rw3DaZEdtgeVZAEQ5hsTyX05sPD94g
	TtjIKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu1afx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:19:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7948640854so452315a12.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439195; x=1777043995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Wig1FYIP1zNSkQ75Q9iE46JSnYQwQ+jz+kMS2CZwmk=;
        b=i499Izi7N7Yfi5ruR0x8skwnH6FTBmH55tL2qO44mestcvP5Mefs9TRqq3t2fHSWdw
         3zu2Pxf+moHHMa3YItYLMC9JOQ3DBzRIbUrc+vr/wxVAIwKFvGBGVBDB39IKJgpyqaE8
         w9+LNJCANK0J9/LaRWxlu0s9NhqHPgzjpC1Z8Xbvlwz72W+cffoJN+3xPIxqKNtE+ep8
         cJK42URutRU9kevpDyml5i+UuMErbW4vixMnnBjrJ0eq1w1IaaHImyNnZteHkU+jFWYj
         TaFPJIq9ZtKKcHsV7btPlZjJ/RYrxv7whJS+c8qmpb6Zgtimcyah3cdVTM8lWXYDGiqU
         yFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439195; x=1777043995;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wig1FYIP1zNSkQ75Q9iE46JSnYQwQ+jz+kMS2CZwmk=;
        b=LU/5qeyyuh7lHHaNdLO9lx8JiZLaY5MWhz6DL55kT7VhlqUu6NAF40mBkgEDHlwsYR
         pUazFK70/oPA+qf00fnKGOfoq+MxXTFA4gQDXS/1K4KQ0S5WvBo32G8WPrK6UqZWK777
         pXbUY7ITSZvdRQTm11H7wiwj7wmaXOTc9Lwaqb34ip+Az291wDFX0MXCDU+CaImpDeA9
         i531VWSgiVmiggefefGS/GPYKGODJ19DvBFFvrcFEEI+gmFxI28mKwc/Vq+IVrZScWKq
         7XHgzqf26oRHhPNwuF9PZkTUQ5eikGm6MEboH/RzyNX5PXd90OXXIpX4FvGihEuY48fp
         9IFw==
X-Forwarded-Encrypted: i=1; AFNElJ8zzmK5uDyAQ79Fy9I9IM9e0FYHxFA5LxbvgvjCICgnmC0d8ftYKFQxPd1GoTeXtd1AInT+EEXe+bleXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz8571II89WjChHbPwlmpeDWLfDPQO4CD8HafBj44TsYxn7kz5
	eKjw/Efd23Gqk2AxuZFKa/pbvdQkEFIh/XHsDZfLdxdUdK1mzdpivrgm/wFKjvxr68KkplfOtKY
	liUpgTomNLOrG3gDGhD/dZ4ecQ8v8LUEeZHLSlY/pqzSPLK0IIes/H8Mp5BX+SeoNtg==
X-Gm-Gg: AeBDievmT3KwubG0GJvCFegXQSjQISJvfbnhWPzoXUGAnbAh78WaVlUMJh8kb2JCzoR
	alGnllEJV79faz1wvN3QPySPfXIGd/OjfYMU7XvLcLpD1feamQLtK9fD+IlR2wKvy1YiQ7zHFU8
	1+YZlPSuLFymC349S8VtRCzdPdFBCwtrdnpMLI8NqI92v0mKbQAUkVJuw8aPMJsX0kUGXUjoIud
	/0AsJ154WeBlV4AGXEk5cNtanJ5nONZ7NkbELfEK0hNHnUkMgxDYFr2YlMHF7ImcdEYCpo/XthG
	7SmsJCaCdSCJVhjl9Wys4mv6PUp/RuLz5jloNuSNZKgDqE6tZ62PY6NQC/w2WT/CFNV0pnUcRZN
	6hV0VBu4TO5rtU/mNiwWPy5GkN5AYjBhfk/BDnMuQTGHC3F2QRF2pwx6uUkgZVIZt
X-Received: by 2002:a05:6a20:4326:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a08d8f5c50mr4016403637.40.1776439194896;
        Fri, 17 Apr 2026 08:19:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:398:b178:a53f with SMTP id adf61e73a8af0-3a08d8f5c50mr4016360637.40.1776439194246;
        Fri, 17 Apr 2026 08:19:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebcc9easm3096856b3a.39.2026.04.17.08.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:19:53 -0700 (PDT)
Message-ID: <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:49:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
Content-Language: en-US
In-Reply-To: <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e24f9b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JgkdHvVJu_VE_hPiJvkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: hvxM8DUMk0R-eRAqh6KrttgnURM7DG6S
X-Proofpoint-ORIG-GUID: hvxM8DUMk0R-eRAqh6KrttgnURM7DG6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NCBTYWx0ZWRfX1aMOR0UMVU0j
 sakqXnbcgXjlSkMW36fCPk6nK2YKbB/Q+H4OjZJ6r7ASCYuDDVYWMAhC/1N/0mVo9IHWdUNRRgQ
 74nccDkiKj5nSfgFRwI/JqAXNJvfO1Co2XEJtC3ZNcW1XM2JDiMQMFm/yn12LX/vSbS0G2HtoLx
 Jcv0vuYCVc22oqiWII8rSsGbotPxMcfJDBLgxnIJk/dCT1tS8cJ3gk/+F0OiXK6bOqpkJSkBJej
 X0MkdYSNvYCKwKSvaG1hXy+UX+Ih3KHha5FcObEdGp0A9IQZLb9Eo10d3Qb7wxUHyQDydiAUYG7
 /i+e5ovhAwtWxAUu8yUfEGeA0HrzqAyyjFhUKhxB53CMICZERFjBw3iwup/PuZxK3fF9P2CA1CJ
 uNawUc8n4vetH0aRi/KWjdN5QDIHQbubm7feOGsDbPdk97crdNi1e5GkeSwpKp8r3cBZ9QwMffg
 CNznHJENV0CSdxRmt1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170154
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
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59026-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D98E41C853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>
>> Add a helper function to allocate and register context bank (CB) device
>> on the iris vpu bus. The function ID associated with the CB is specified
>> from the platform data, allowing the bus dma_configure callback to apply
>> correct stream ID mapping when device is registered.
>>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>> index 773f6548370a..a25e0f2e9d26 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/devfreq.h>
>>   #include <linux/interconnect.h>
>> +#include <linux/iris_vpu_bus.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>   
>>   	return 0;
>>   }
>> +
>> +static void iris_release_cb_dev(struct device *dev)
>> +{
>> +	kfree(dev);
>> +}
>> +
>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
> Please move into the bus code and make it generic enough.
Do you suggest to add a wrapper to pass the varying inputs to the 
generic bus, something like this
struct device* create_and_register_device(dma_mask, parent_dev, 
*release, dev_name,...)
>> +{
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = kzalloc_obj(*dev);
>> +	if (!dev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	dev->release = iris_release_cb_dev;
>> +	dev->bus = &iris_vpu_bus_type;
>> +	dev->parent = core->dev;
>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>> +	dev->dma_mask = &dev->coherent_dma_mask;
> Would you also need to set the of_node? See
> device_set_of_node_from_dev()

It might be needed for FastRPC as they are following sub node approach, 
Iris does not need.
>> +
>> +	dev_set_name(dev, "%s", name);
>> +	dev_set_drvdata(dev, (void *)f_id);
>> +
>> +	ret = device_register(dev);
>> +	if (ret) {
>> +		put_device(dev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return dev;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>> index 6bfbd2dc6db0..4a494627ff23 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
>>   
>>   #endif
>>
>> -- 
>> 2.34.1
>>


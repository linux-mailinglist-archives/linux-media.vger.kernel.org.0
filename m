Return-Path: <linux-media+bounces-53770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIYoOJ/8oWl4yAQAu9opvQ
	(envelope-from <linux-media+bounces-53770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:20:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B881BD897
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 21:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 263A6303B4F5
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 20:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E501B472788;
	Fri, 27 Feb 2026 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mfe39U9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bX8opyTW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A644E021
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772223616; cv=none; b=WRSKN9bdh3sjQmnOmixAeYGYtX0b0Sc2AuhkkUXEJM/dQZW5Pr4EwuRR10kZBIWa4rRLeyzhFSBbwx4A/EAlfPAZXX/luvffMmz17A+6LYUs9V4Sjff+AC1+bfUeHxqumr1vEoqug2CnRU9hfYJIibYdoSdGulmMmdDFKOyCd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772223616; c=relaxed/simple;
	bh=FBmB65ZR6FLpe0HVMpiGqSaBqOAHyPDX+8BuUBGYyOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7Ux+qng/3M/MG0fR+D6ZoQ5t9arLf5wSioX8DIXNfh6S7lGNHHGQZBcTOVEUQcXYWQP00GsHmWCwOWZ5jrBhviuDJJdJC4R+jj5jKAtmdcMmccnxJmy+HLn0gDRh0bs59EWwL5djK2FsMJJ0Lyj5aij6F4Ir/RCXUH3IvQrWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mfe39U9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bX8opyTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RIlqbw3732995
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGiDm6ebljp9qXydqpfXfVbT
	dKbyp0ytFgVM6MJ3YlQ=; b=Mfe39U9ImLHGWd27MPJxyMT+/s3ByGkJ3yEb11Pw
	H+Wt6KsRRECCSULJ2iW0ShEnXkRfkw4FoLhkF+xaHXZhb96K7mZ2S4jAXWumCYDz
	STPRfGXwlRC1m6SUxBe0I9HwG6hXlL1vObm9MQJppcW/lUWEvRUjGQ9hqHVo6CUb
	9VbjY6FwBL8IAzeTW9xyQf9xs8AuE4BT+Fqm8bLYyc26vYNLS5VrW1Op3KQd9Hb/
	AwW0dIKhNMYz2dHMkLPugZ5sva7V3/cSradPNrKHh2Sju9ddIGryKET5p73++Xmq
	qsb6c3kpF3k+A9hURvSKhmBs3Y+ABZdUBuNjpnHqXykTjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckgv508n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 20:20:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so1873611785a.1
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 12:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772223613; x=1772828413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGiDm6ebljp9qXydqpfXfVbTdKbyp0ytFgVM6MJ3YlQ=;
        b=bX8opyTWs+wVSIIO0jJfTSt+uGuiaTHUR2xyaDimPBPgRwQ5FiSGjBBp+AAz40DM7o
         I/2VmS2uufVvidDGakBKGMRPrOQGhcJHviJGQXXlWDWunuUG1y7G3mwRJ4C5dIZy7Pwt
         AGdrVFVVfoC+sH827MzYcuw5iXtPG50XzRrFITgiQpTC4K1bNQRsn8t/dQOkYrtx9SU/
         EhYRUeAe+lwReeXHOWeddt2pcuFXRkthFd/Z/Dg2zB3n82bj/qTimJ4kGYKhFh350g7/
         7Z+nK0NSIojgpL1C3hPIFRDJVAJ7U4P6hGEiJ1sxuhCKZ16a68+Arw7zt4kQgar9HM8y
         uPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223613; x=1772828413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGiDm6ebljp9qXydqpfXfVbTdKbyp0ytFgVM6MJ3YlQ=;
        b=hnXLPU5iyk47jSnviQkWYlxPUjcZ8Zh6MSrRdyzBJur8elx9aIFeAgE6hvN0Iq6wM/
         GzC32jP+bxuq1lt/gD2+EuER2gV+Es8U9wyB67f9Jorn+kYhbWKZjTkp7mHGHErr5PIP
         VMdajYI7MUquFnOWAI6SbpyHHWonSwJL4UD/SFGXG4jozwfVYiPv3Hf6Mhxd7xvXzwu0
         p6mmSUmMJwS6mT0OfnNq6253ORJqy2yEC2Q3g/6CNIGGUjtWEgyv2M7hIc3h10NdqjSp
         yJGF3u3Lw8Bj+YUlIdjZ/7dX3UQEp/Vdy/yI/jMcUEblzf1c439ie7up4Vbx8zmykvre
         wLTg==
X-Forwarded-Encrypted: i=1; AJvYcCURzyAGZY/catDyVDzzWKCgsSkxb3YoUKj91Lj+8m4D0O4z3JqAPEGmbPuoGFpy5Nxe/LCywungp1F9Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4JiWiq0PASKhYSKd/S4/I+Y0Vd/L28tckTlOKMdIIubSdlx+y
	Cd3wIc66Iviq6iepyu8iOl1LRzipCay2MnUMZpKSRuqdOzfrNoy4ErQy+Ilnc1NaQJVzZMp+eZO
	Le9OKOzLBLKdcEXVpC/vEM2npS1/WhkeRsQJNk6Zm2WndZUMVhSE97t5RNWWu3PlcHA==
X-Gm-Gg: ATEYQzzuX54HGQYy2F1MioooNVmJCMlN2PKLiSSPetbBHmMJNeR7daFotswwRjN/bYD
	35rfToPBD2Alb5qv9SbEsftWDU6gfiN7xWK6XXK+u9qaA58X7dW0P2ovqfrli135eMGtU+7acdd
	wxxff53ANQcrm+5+nX27l2mm3yalLZVQl0239dFzoYJFaNB8TbJhgWIkvUK6/0iAbYwHS7kvU1k
	5AQ+fhPBB8T19kCyOaIQh2BYH0P67nZaCFf9ZHKjIcWbKNMZI15YrIXG5c28MRYAGNxdLa+cxeO
	L8Qzcn5ib8yI+wQDgXAiD+QH447sOlD27i6CrYFn5vWKThc9knbaOzlrZric+kDisBvUYnXFEmm
	f0Ms/m6//SqRewx2u+IOUImA6QBkbwU0U4Hjax+yqurJbjHoYLyj+r8/d/op033L6O6L2/pWDu1
	Vlw8zoI3NmijctKKKXn7pNokXpTrcMDMNst4k=
X-Received: by 2002:a05:620a:458a:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cbc8d70e78mr517166085a.3.1772223612929;
        Fri, 27 Feb 2026 12:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:458a:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cbc8d70e78mr517159985a.3.1772223612376;
        Fri, 27 Feb 2026 12:20:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd1240sm153008e87.13.2026.02.27.12.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:20:11 -0800 (PST)
Date: Fri, 27 Feb 2026 22:20:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 4/7] media: iris: add context bank devices using
 iommu-map
Message-ID: <rzi7qmzsofocwcqxhsqz3f3tl4ahqnwn34of6qcc54odpben5d@7okuqabxgdqh>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-kaanapali-iris-v2-4-850043ac3933@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3OCBTYWx0ZWRfX8Dhskonry0sb
 jbUOLJuOV+ltLoGpwfdKi1w8ACWScT7wXAQnUUE3bpum+cJpHDmH7AWLxBnxvcFr0jjPq9cOdbs
 UoLZu1VaqPH5kQzs1ZDkVoEvANwgv1lkgmfLayenBGNUsIm5NeTeI4hyNw/iQoZkEO0N5emLU6z
 /EvewW5fs25UwuYoxusaxDjnqvnTTtvu1XfJZcUC3SiNSJ65MK87cIrakucnq4k9m+M0B4wueQH
 FxduOWrqS8wd78lbyO/D4+JQUEfWmnPEf5zSyeOJRB7iWEjczOo0vKx2McUoL6EgWAGdNSIXoaB
 MkJ58mCrRT/6tnvz1EEvYvOq81rtop/2saJREiOib7HwhhQA2asx4N+TPAkN+1C8VEfgWMU1Wo+
 g6LJTtoUrAkK2I04ESecz3djkCTpx8W+SHuY56s2NLnSSZrjR0dkRNfAPtlisoYzcupwhiO74nH
 3DtBuBey9iK6NvIOT/Q==
X-Proofpoint-GUID: VGnzOUpaf7_3BYL57cWLzodganUDmeds
X-Proofpoint-ORIG-GUID: VGnzOUpaf7_3BYL57cWLzodganUDmeds
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69a1fc7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IUwINCKwprHYATZVL1cA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53770-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24B881BD897
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:41:20PM +0530, Vikash Garodia wrote:
> Introduce different context banks(CB) and the associated buffer region.
> Different stream IDs from VPU would be associated to one of these CB.
> Multiple CBs are needed to increase the IOVA for the video usecases like
> higher concurrent sessions.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      | 18 +++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 60 ++++++++++++++++++++--
>  drivers/media/platform/qcom/iris/iris_resources.c  | 36 +++++++++++++
>  drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>  4 files changed, 111 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..03c50d6e54853fca34d7d32f65d09eb80945fcdd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -204,6 +204,22 @@ struct icc_vote_data {
>  	u32 fps;
>  };
>  
> +enum iris_buffer_region {
> +	IRIS_BITSTREAM_REGION		= BIT(0),
> +	IRIS_NON_PIXEL_REGION		= BIT(1),
> +	IRIS_PIXEL_REGION		= BIT(2),
> +	IRIS_SECURE_BITSTREAM_REGION	= BIT(3),
> +	IRIS_SECURE_NON_PIXEL_REGION	= BIT(4),
> +	IRIS_SECURE_PIXEL_REGION	= BIT(5),

Can a context bank belong to multiple regions at the same time?

> +};
> +
> +struct iris_context_bank {
> +	struct device *dev;

Separate data and the actual device. Define a wrapper around struct
device for the actual runtime usage.

> +	const char *name;
> +	const u32 f_id;
> +	const enum iris_buffer_region region;
> +};
> +
>  enum platform_pm_domain_type {
>  	IRIS_CTRL_POWER_DOMAIN,
>  	IRIS_HW_POWER_DOMAIN,
> @@ -246,6 +262,8 @@ struct iris_platform_data {
>  	u32 inst_fw_caps_enc_size;
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
> +	struct iris_context_bank *cb_data;
> +	u32 cb_data_size;

Do they differ from platform to platform? Mark them as const, it should
be data only.

>  	u32 core_arch;
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..557adb038328a75510591d91569819abc0b7b1c9 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -123,6 +123,49 @@ static int iris_init_resets(struct iris_core *core)
>  				     core->iris_platform_data->controller_rst_tbl_size);
>  }
>  
> +static void iris_destroy_child_device(struct iris_context_bank *cb)
> +{
> +	struct device *dev = cb->dev;
> +
> +	if (dev)
> +		device_unregister(dev);
> +
> +	cb->dev = NULL;
> +}
> +
> +static void iris_deinit_context_bank_devices(struct iris_core *core)
> +{
> +	struct iris_context_bank *cb;
> +	int i;
> +
> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> +		cb = &core->iris_platform_data->cb_data[i];
> +		iris_destroy_child_device(cb);
> +	}
> +}
> +
> +static int iris_init_context_bank_devices(struct iris_core *core)
> +{
> +	struct iris_context_bank *cb;
> +	int ret, i;
> +
> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
> +		cb = &core->iris_platform_data->cb_data[i];
> +
> +		ret = iris_create_child_device_and_map(core, cb);
> +		if (ret)
> +			goto err_deinit_cb;
> +	}
> +
> +	return 0;
> +
> +err_deinit_cb:
> +	while (i-- > 0)
> +		iris_destroy_child_device(&core->iris_platform_data->cb_data[i]);
> +
> +	return ret;
> +}
> +
>  static int iris_init_resources(struct iris_core *core)
>  {
>  	int ret;
> @@ -193,6 +236,7 @@ static void iris_remove(struct platform_device *pdev)
>  		return;
>  
>  	iris_core_deinit(core);
> +	iris_deinit_context_bank_devices(core);
>  
>  	video_unregister_device(core->vdev_dec);
>  	video_unregister_device(core->vdev_enc);
> @@ -275,12 +319,18 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, core);
>  
> -	dma_mask = core->iris_platform_data->dma_mask;
> -
> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
> +	ret = iris_init_context_bank_devices(core);
>  	if (ret)
>  		goto err_vdev_unreg_enc;
>  
> +	dma_mask = core->iris_platform_data->dma_mask;
> +
> +	if (device_iommu_mapped(core->dev)) {
> +		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
> +		if (ret)
> +			goto err_deinit_cb;
> +	}
> +
>  	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>  	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>  
> @@ -288,10 +338,12 @@ static int iris_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(core->dev);
>  	ret = devm_pm_runtime_enable(core->dev);
>  	if (ret)
> -		goto err_vdev_unreg_enc;
> +		goto err_deinit_cb;
>  
>  	return 0;
>  
> +err_deinit_cb:
> +	iris_deinit_context_bank_devices(core);
>  err_vdev_unreg_enc:
>  	video_unregister_device(core->vdev_enc);
>  err_vdev_unreg_dec:
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a257b8ae7332242544266cbbd61a9..be58e8620086d0f82c2c2bda29247483f5c56d79 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/devfreq.h>
>  #include <linux/interconnect.h>
> +#include <linux/iris_vpu_bus.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
> @@ -141,3 +142,38 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>  
>  	return 0;
>  }
> +
> +static void iris_device_release(struct device *dev)
> +{
> +	dev_set_drvdata(dev, NULL);
> +	kfree(dev);
> +}
> +
> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	dev = kzalloc_obj(*dev);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->release = iris_device_release;
> +	dev->bus = &iris_vpu_bus_type;
> +	dev->parent = core->dev;
> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	dev_set_name(dev, "%s", cb->name);
> +	dev_set_drvdata(dev, cb);
> +
> +	ret = device_register(dev);
> +	if (ret) {
> +		put_device(dev);
> +		return ret;
> +	}
> +
> +	cb->dev = dev;
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>  int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>  int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
> +int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry


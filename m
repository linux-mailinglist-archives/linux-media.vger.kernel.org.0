Return-Path: <linux-media+bounces-46251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707AC2FB86
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 08:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 592BE3BF281
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 07:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F98F30F941;
	Tue,  4 Nov 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRy98av+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nvd2W9qj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABA30F947
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242536; cv=none; b=SVRb4QW0A3GWpeKrIVBywquj0cGSvNxBTPrRm98zehNuejWt+6+0bvLWrDBze3mRtyzZ9PVHfRh+joxADTD2pTRJA6RkGX7MiRBWSwLw5+SLY6YgJL/4kRvJACBDS7yCRtqCak2EPXPy5EZMmp3+xfS6TZYkcGp1RrsvP7I8a9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242536; c=relaxed/simple;
	bh=GPfBHlhTxc0E2ivc+NZyZNkNlQB/Qp9Uzf7GzN+XDO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cw5ayYsgTo1mds7GAgneVNkf+/PJ97S+EqsPfpaJLzJT3B58MYS9FI715NF3zcov5ezM7xTMhQCj4h9zlSxCGvBaiV5JVQKKVyvg3HSMrZyEj3siHdOzuBAJkUHJ7pWqc0zhjewXOlSJqG5vYemslPSvRif2KTfTqd+1HfUvUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRy98av+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nvd2W9qj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43BTAY3667725
	for <linux-media@vger.kernel.org>; Tue, 4 Nov 2025 07:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=; b=YRy98av+ZH4Ti0iR
	aXc/q1YgaP9Q/DZv0SqxGTTjdmlkZlCC1Kf5rITn8A5y+ChCQTDwMW2AfgcwtZua
	jN5poz9YFSziN9pahsVamlEaGSYIpqfi/s9/dAelzfyeigHe1k8AXpgHVMOmjE4/
	y6+wiB0SMz/SFU57A7aJj4C8slO0YEfTCYbQyOi2I5uqueuOOFAbrvvO8158TUh7
	sW82lBlu1uMomIYi1HzJzx+lwtY7EYBY4VuNmzxvEein3zTLlQacbsAIb8HnzWts
	Au8Ah7S8zrmHpN8BFyYHfJX83154jrzYOxz0i6/Q+A0a2FVDYO17Ah88sglY98/2
	MMgjcw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffj4nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 07:48:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b99763210e5so2014444a12.3
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 23:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762242532; x=1762847332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=;
        b=Nvd2W9qjI/1XQGDf28Cmx8iW8YYVumdlwDDTSYLdI672KbHJeHyzM90xymkh/ip6GG
         ZFhvUSSPJpSdUNzVQSDyr3EyrOQ4T4W1B5buXNIMFH99ZCDm2u1JHOKIPaU6RO2guH4K
         vuzlEfQBj0xCijNfRkEvzS32Yhv6c6R0hjK7uT8/P8NgJXCPwEe5TIOGAxNTWHWVeow8
         a14RoYOy4QIn/piFGyBREGQEBdDrxTaIrB4+UoOHPbnTlYz3mxifCVv3gYjZDFc+ocD5
         4yw4f+GfiX6nyS6e+UogmWZstCKBPfo7ROOwOXFQ18smGGW24WlRVHi75SW6txx531Rb
         Zg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762242532; x=1762847332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ML0bwIBQV8yKSWMhezC+0ED+VzAtX+MqzkKsWQgpDdQ=;
        b=P0I7P1ODO4tAKt329kv4YXrbJj0vWcHi2rqxxV85Nmz0IcEirsXC3ANLN3L7C7UfKX
         XQEelT0FN2SzjbJpKafShn75koZtXcEWpZrWaEx0Xkz0zq1J/Ug6QsjduWfzJ7TE0MYo
         s6eRBytRPMhGtbXGIXmxHYriiYeeOsNMbBhtzJX/OqCKn6iR4n4K0BASRfY4uJsUczqw
         V301+khCcKJeLtkkw1THjHJpCpIgQgR4YcNFrdpHCp0el6HRdiy9p++hwFdjEgI+cQi0
         2gnVMQRCC+2Jbro+WQ/zTuVyjc5dZt4ZVNJvaIfhqdN1UjhhiMjBMVAKFfqd18jnBxkS
         ATwg==
X-Gm-Message-State: AOJu0Yz9qWp3qxuFY7xmF7977whngMSqScRmF+NwUtx2acB9y/Lj0yur
	aHxTFEDeU8H95oUceQ/K9q6K/j1qAoo3g2IuSl+OpITJUfdYx0DD+RyWWsjXh+g4zwJ4sDwlb66
	LAXTNsKlZgYbmwrLcfO3WroCs2zAaCSkA7sH2p5Ey6Y2Dh3ETAHmgSJ9ofXBw1eHeAA==
X-Gm-Gg: ASbGnct1eriSKKn74jf3fZASx5jRIKnxH8xkFzg9o5qidb3NOOD1k51l1x/1cQLEZw7
	4kV+mZ1m7fb+VmTnCdqhRXZ6+mKEbXGyJ02xSmPas7WQNYHc0kDWVpMeFIw+vIC0FRZqMiT8aLv
	OY5wG1gmgLI/ASPkQ8s5oR1ajHfvVWCxZfs9zT3uE7U8QYHi2ZkusTW84sytIrAp9i9olwhrNNV
	ra4pxJ7DZRt0YXdHU455wwiiAwoLwSLdnO+2BUAQjtxa2+TtF10WtufJLAM7VJx6lCTRYWUE2O+
	TlML477kcEf/DaB1D+VuG4ogHAEtDN3jeJ52siUe9ZZ0BOdCupDUJ2CF5sB1xPuSn71+dRICENm
	DH2vaQPQpdt8yBDfWktYNzrtnCMGFiJfW1agKAQXOqPmofoEWD9ewtjl5tMLhfQVFYV/OIg==
X-Received: by 2002:a17:902:e890:b0:294:f310:5224 with SMTP id d9443c01a7336-2951a4d8357mr219816955ad.29.1762242532518;
        Mon, 03 Nov 2025 23:48:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVlq1HJiVNCk17XfjZL4ygCOoK/YhlTzaL8scnoFnoc4aalCAtrdv0g0H5F795oWl99sMb5w==
X-Received: by 2002:a17:902:e890:b0:294:f310:5224 with SMTP id d9443c01a7336-2951a4d8357mr219816585ad.29.1762242532015;
        Mon, 03 Nov 2025 23:48:52 -0800 (PST)
Received: from [10.249.21.117] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998893sm16411545ad.40.2025.11.03.23.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 23:48:51 -0800 (PST)
Message-ID: <bd1cfdac-16ea-46d7-ab97-989a2d3ff203@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:48:47 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] media: qcom: iris: Add rotation support for
 encoder
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
 <20251031-iris_encoder_enhancements-v2-3-319cd75cbb45@oss.qualcomm.com>
 <1d653876-2df0-4177-8256-00905148fb46@linaro.org>
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <1d653876-2df0-4177-8256-00905148fb46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909afe5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=P3cjl3EAIghPSHLTwM4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7fSzUpvnnNQ537lkX0TRzRNUWUrp7gZt
X-Proofpoint-ORIG-GUID: 7fSzUpvnnNQ537lkX0TRzRNUWUrp7gZt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MyBTYWx0ZWRfXxwHE6AR3aGca
 Q8xLZ41KSmv22NKgubFzE4T7SbbgDpa1/3+f0UTwmzJdNmlZP1SldeWx1QU6VFUPgDic/386pya
 TWBpHoNHRarLKxhoN6yQ4iKw9SadSj5dmLkczjJUHqu1d8BOEOrwA95VjnggnARI0yg/pZ5daG/
 +nZ+7OzRq4s81upRvMY2yFADiYZpMkFlQScn8h3L8heqKts2MuYF2JcMKI2ws5HPa4b8quKTaGM
 5NZ3tLa6TbxSuZyvxJBVyDGGq9Gpo5n0j9R3wWjMMqsRVXTOczjYIXH6jCop9ISSZuEla4aCAdr
 B7AggsbtcJaWktLv+WZax4g9RCfE/xH45KmBCrW0d3bHY4k+x67pK2ZwRbx+p7qIQceXRVoLI0j
 f3t82IDvxPChAav0KlYJW+inPuVBqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040063

On 10/31/2025 7:30 PM, Neil Armstrong wrote:
> 
> I found the issue with SM8650, you did not update the vppu33 variant of 
> iris_vpu_enc_line_size.
> 
> With this:
> ============================><=============================
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/ 
> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index be8b8588a39f..4a4fbcbfdb46 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1082,8 +1082,8 @@ static u32 iris_vpu33_enc_line_size(struct 
> iris_inst *inst)
>   {
>          u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>          struct v4l2_format *f = inst->fmt_dst;
> -       u32 height = f->fmt.pix_mp.height;
> -       u32 width = f->fmt.pix_mp.width;
> +       u32 height = iris_vpu_enc_get_bitstream_height(inst);
> +       u32 width = iris_vpu_enc_get_bitstream_width(inst);
>          u32 lcu_size = 16;
> 
>          if (inst->codec == V4L2_PIX_FMT_HEVC) {
> ============================><=============================
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> Neil
> 
> 
> <snip>
> 
Thank you for helping test on SM8650.
I indeed forgot to add the corresponding changes here.
This issue will be addressed in v3.

-- 
Best Regards,
Wangao



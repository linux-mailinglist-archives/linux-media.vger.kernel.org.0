Return-Path: <linux-media+bounces-50122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E8CFD34F
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 11:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 647093014DD0
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C04531ED62;
	Wed,  7 Jan 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEmx6uct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhM3qbFU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F44317704
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781652; cv=none; b=ETmV1yY226xH9uYGk1hOZUz2jGccf4J3D15nrRX8EhDM81n1zl+LxYNR1HYzf+X3UV93cb5M61PZlbOAeD3AGbLaHApO+V3IGZ/fVUyRyUR9bzL15wrD0Xsuk5G+UyKJC0awqfug8t1AznX93uJvPT02jtbx7WL0Jac/10AHBRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781652; c=relaxed/simple;
	bh=jxxOLKWQy24X1JdBxMKRyeqBnPRYT3VXTWPuCnAcFg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji09XDL83b71DcaS3TLRBTHwH9BZoMMwCkjF1pDFVsprhIj2YBPWGfzUFUDpb8Fq9cWBEsJjTwr0Psj9jGD1wT7p7BXfLa9NpKanCpL2t7fQ6ww71t96JQiz6sQhIJLRNgtrRo+yDusrZEIkVXNehTQaDSgmm3LMWiLe9/gzA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEmx6uct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhM3qbFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6077kM2P1474917
	for <linux-media@vger.kernel.org>; Wed, 7 Jan 2026 10:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=; b=DEmx6uctIURqOGQd
	XRdYb+08Y8JQmg/rLOTTmrSD1uhlH5Ob1Kb5pK2A0IYCRoORBmZ1iKfllPakWBhu
	ZcwFV9DFMqMRhm0skF/dg7jvFCLIrq+H/2Pjl/on6xJQWI76tH851JzRabgosyoJ
	w5zyOzOLMAtd7S3une893xP7VwIqwqnDBEim5XuvMvyqMxWC6A7xidugtDykGF6d
	d4rVqvlBCHCiRwNyIE7fMIx0m/byPvFBW1/K3n5mxagf7lX2x7Ut+wnzbwvw4DYQ
	v3sAxQNpMTKrEQiFX5zoC9/DNw9DCq61duLcAV3K3ua12GEf9d7KrX+RZEy73ElC
	io54sg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhayht0d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 10:27:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a090819ed1so14531995ad.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781650; x=1768386450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=;
        b=EhM3qbFU6/V+y3hvPh8AumYHRCbmFLQyoDk3YL/MtDn3FAnZ7VTaFvruJ52HUX7jLP
         kzqilUjvADwVuxPllhnZTxngLys+l+/iYE0U6eq5NfPy1Z/h0nH0luwkK+s71GJbJqo3
         Tf+u9sWk08UQIT0KiuMmX4IyJJH2RDF2r0baYfMs3GRcfmq6JstOL97Fiq/wqacfEGIH
         Vs1wU5zdOoW0qDJgMNdBvJzRLMX/7myqvLDYYujnzMMUWfR4SNghHkHwXkZglMsufRvS
         7cCYfnXkdUJ8buJJpsOuIa5vyxHmcfX4bMljq/dujyg7MCFRQS6Bs3UnN2s9amZD0Rmm
         ipIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781650; x=1768386450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd18Z1YzmeXBFzrrg4MrKCKtq5jjlT4LY/xzF2U61z4=;
        b=xOf+HZ514bEJOggg6FKmXOMgnvart4PoXZcswC9q+MaAdf9bp657GcocL0axCZfrh6
         wECNoWIg8EO+ad+xiPY8CrTeKvoqMJ8h9cS9Pw83XNuJHeMISgDmebIb9+7R6DsdwkGE
         /5Mk8lJYCAFVno3lm8lF0a345uPemPP0R8pVd/inLJXhKdLEHarhL2UPSJaDQ0JaoCBb
         NluIaHnEBeMADUchhi+7hNEROOerklU1D3RgS3fEFh/jPT1zG32rQJ/23JdG/nat6gz/
         trcD0zMlAYKrIEpEEjOzkMJYJOlsU+Vp3XgWpsMpK3TxOuFVoZxD7aUnW42TshgZHtJ1
         TCoA==
X-Gm-Message-State: AOJu0YxyCZcnltaaxF5ve5lUnyzPqmHirAnc5bUhFvpX+/zCK8JjBPef
	Ld2oEw/Mxas8dmekQ+qx1wamgJHpVt2U8dabUIx9vL8mDYIVjoEw8vSGTz/NemEd9R9wf9SxPN3
	4gnjSSYf4EtvWGQffE4IVr7ldWuys0wBd5zVmAil1GgACwSgR5wnPQE9UTtqoQPpjQA==
X-Gm-Gg: AY/fxX6paOZHjhtl1hasjxeEoQ94TBgtR6QacUPSAkf4UShFrk+OSRgJDbxqqyfqksr
	hGoLLKI3RioYvPicxSLqoWuSVozodTMhrKG0mO7/BnpoeiymGePSo0YjuNf9Siien3qVBqWnF1g
	7M1CSt8yhR0TdwRHi6W/QlWG9+722lmnqm88jknSWFhrSGLkcXjULFHjpJnLvHM1xfkHHppzZlE
	WE3egnUZfz/xzgF2FDLukLw4pMSk1YTy32HWtGUkA0Vq2BE9zcDyCB/Zkh7c5FWwegDOkykOUJu
	us380USAsu2WOvVeNkak0SRGnkS+fOHsrPidQeM2Q9mbaM4aJ18DRNvATamHFovYXTrn1p23Ljk
	vhCbCNqIE1QCSqg6VQl0rKpvjpKCc6Zo34XnSoYH+NA==
X-Received: by 2002:a17:902:ce08:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a3ee4456c1mr19470385ad.14.1767781649713;
        Wed, 07 Jan 2026 02:27:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9ywrDhvBZ0wnU7MYSCgeUFZYxYnTIlc0Ny6WlDiHewTpQIXm6yQb6LXotIU6yBAibh93cyw==
X-Received: by 2002:a17:902:ce08:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a3ee4456c1mr19470135ad.14.1767781649225;
        Wed, 07 Jan 2026 02:27:29 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2ac2sm47256485ad.90.2026.01.07.02.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:27:28 -0800 (PST)
Message-ID: <8f1b8d75-e3db-42e6-ba47-ce4d26aa6987@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: iris: Skip resolution set on first IPSC
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-2-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfXy2xntculozI/
 Ob9osdYksSElsjVOUUFxkjG9mBXnVOZXuo0dQRSmk7CBmPndRuC1pwuM/DIoPamnAK9qCaF28aB
 eSzsZeJRUlyWhdJGF4/HDH61R8DVDYuctpd0B33SR1De3VzMfktn8a/drnLRB29IVh5ZklAkG8P
 vu0oD4g3VDDWYyZ+W8j1NiwPLOGtSSub4fV2sFjCl85XnC4l0s1Xaw/wO9lgvkIYs7QQqaCnjAJ
 rFZ6c3r0YqJi8BOfTz6bMZXt8pVFbbeCsoSzqjgleHv5cb0F06mNTZaxpvh3beZVTLH9XNG8VBZ
 KBZlqXF8qCU74I4DPFR3tkB42Oucuqg4nWztQqbyWFHcOEusmBzm8OAGLJUx/UmYxSfn1m8FcRi
 O2BCbomuov+mN9d+zTKi0F617x+geCgRTEUFNda/C1eHQWr0MpWK7ToQhkSEQ6ZJC1W+AEHzm5t
 lEZWJZg3yhEUOOkt1uQ==
X-Authority-Analysis: v=2.4 cv=VI7QXtPX c=1 sm=1 tr=0 ts=695e3512 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=R43CkeNY5TQw8y71x44A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: tNVswRQQNcyeZEBknyl7BRrLBm8id7eZ
X-Proofpoint-ORIG-GUID: tNVswRQQNcyeZEBknyl7BRrLBm8id7eZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> The resolution property is not supposed to be set during reconfig.
> Existing iris_drc_pending(inst) check is insufficient, as it doesn't
> cover the first port setting change.
> 
> Extend the conditional check to also skip resolution setting when
> the instance is in IRIS_INST_SUB_FIRST_IPSC.
> 
> Fixes: caf205548769 ("media: iris: Avoid updating frame size to firmware during reconfig")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..5087e51daa842515e9d62730680fb237bf274efa 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -733,7 +733,7 @@ static int iris_hfi_gen1_set_resolution(struct iris_inst *inst, u32 plane)
>   	struct hfi_framesize fs;
>   	int ret;
>   
> -	if (!iris_drc_pending(inst)) {
> +	if (!iris_drc_pending(inst) && !(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC)) {
>   		fs.buffer_type = HFI_BUFFER_INPUT;
>   		fs.width = inst->fmt_src->fmt.pix_mp.width;
>   		fs.height = inst->fmt_src->fmt.pix_mp.height;
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>



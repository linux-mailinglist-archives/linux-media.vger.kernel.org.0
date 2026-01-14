Return-Path: <linux-media+bounces-50734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218AD2185F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 23:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B532C30109BE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C413B52FB;
	Wed, 14 Jan 2026 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxnApcXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTyrwfjW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0A3B5314
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768428891; cv=none; b=kLm7L+UJWXGRsW/dhOsOGOJJeGq17Wdup8pTZ+FOsu3/49un7U/7MPmnIFbuLuwT11z+dKx6HnaamYx3L4Mm76+2RD9zAOdngNljBveZhOlzRsTN7nrXm6ef0QB7/2tlsyh+ZsIOtBms+NUERC1PS/Qkrt0/Erjy5P2llKpi3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768428891; c=relaxed/simple;
	bh=hHnXqwbpMfZo7gfgRiyc5ultxI+IcpB8o9YLOKks6cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCLSG1fJv8UrxcWJZ1AR+ej4Gq2emign95pO07PoRg5nHXU20U1e5L827b1Jn0YhX8I6yJvI7yozYjitF1b0H6i4FguUp/FxjQccO9qsWhUoLYMl/qlgEmRC3g5b5sr066d3U5NxASsrazpiU2g5VtKvkoNt5cIJwTsV7t/8J88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxnApcXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTyrwfjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EGmPfH2552671
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 22:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qy45BWMwR5msHLLkoNhbqdSeUy1OObjTJGG6/i2F/vs=; b=IxnApcXjyy6TdCOX
	89zgE/y3niN7PlwIFKxjV9prYJTgFUVa1pNLSd3y5jExZoXDS6bEJrfkdHMzDwge
	OxodKyLW3lPyLeX7ytxApsaTPlBIz3tjqkRw72GtvPqvJg2kFzFaNOBdCmp/8GBM
	dv8inWx/8hqrrbWjAeXttH5LUXzt5XoIsEAg0ltq2DwnAejiuRA4WiYzuJYQ14Ww
	7qd1tijKXy6PEUWU4MGnNdjwcuryI2boQpL/7L4Y8qn5pmYpts3pUt6eDRR9wdA7
	wmIJJZtV+Wl1p3bqYf4U9DXSgKPhCy/BIBpkxPkkUKdIeXP7hCpdLngZoH1f8eRD
	Fn2mSg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d32g8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 22:14:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f3c7096baso47886c88.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 14:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768428860; x=1769033660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy45BWMwR5msHLLkoNhbqdSeUy1OObjTJGG6/i2F/vs=;
        b=KTyrwfjWgz8v9km3CgK03oZgZi6Qzlrx2uHvLysQEWhlbZ8VF/LRJbGehrm/UEDytS
         QMLmq+0VOBKSfQ0ADFazw4UJY/9o0eihxWAhNMqsyk4oPJTLLNgvHh+1tG+4HpfArv92
         kRxr4lzdf1gYJxT0QVWXDGGMQ8SqFrd1HAKu6BGn4E9M9mhICLJX5jKBuAOFWhKucHhq
         DloVW4Ryyz73oXKhu1l9YDzAZdvQhehpdgNga5XD4MTRLNScrplqAm38gEFuudwCbuWo
         7dwXeFUZ5i7BugYUfjYb9njrXuC01m4W38Vs7F0EfnpP8PTSwohJFj4hF0Z3mNuvzqO/
         Z8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768428860; x=1769033660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy45BWMwR5msHLLkoNhbqdSeUy1OObjTJGG6/i2F/vs=;
        b=ejJhkZq+z+srDls3mosTBZcQ8kSGRpkyg063z+Lt6W4q5GBq0yefiyG12b/t8Lsdfv
         FfxySnPDUyg7Lxp9xY2RhNzRh6AdGQ/veu8raXVFPUpq9fef0C9NN5yRXba9rD8F5h64
         rdjHmSy1GS1qaYh0vZBFKSlMoTMobaDTiHpQiqizdXzKSgIHDJAvicklDGMFGXwsvkM7
         Z2WY1lx1SJY/7lfcN1JbwuGhuASgnEMIbLIWZrFlHPMLkrLkJwSF7H0CH/1PMUXP90jY
         3ULapskqhah/BUHZNiYiyFBnWaQ12xGLa6DBSL9HA7V2ZDNe+01sito6oLu55tzD2wE0
         t/RA==
X-Gm-Message-State: AOJu0YwZSiSYyKYFD2YQ5iAICIQc5x9LwWLRtlJBDZm8CIHNjyuEQGAm
	/qQTZC+saWsXADXnCCikXbsgvheFaEksZBtl1HNK941aRb6gZpVxLZWb8Y7v551dB3rhz0tIXBY
	g95QAb7Cp23tzjLYb5/38VZvEkc2pA1W4wFNLZCqikBVCIOmo4ukBG+YiWno3k3IrMw==
X-Gm-Gg: AY/fxX4oPX+hes048Sa6BsyqzivzxtczEnznn+XYKKH0vyv2ruB7cKs7Au/rgY191n3
	7t5JUTwnNFGl/YvWErgpuu7hbU16xYUHNsNiYy11Tm+RpXPkxOoZqnWkrLOYVGkLFRsWku2sqC4
	uroQDXHsAMd0pItJNlSrL77DrDVRx+7C6TlYKzbPCx5arSUwd1/WfIdgHxpv5sWPGp9A6Lg5dPI
	Lkln+OrYY1ff/pP73JUz9s7Nbbvfwq5a6V1mk/SEqKRAn+Gv60MYnG9huvHInpPEkVJB5LM1Nqp
	RGA4/WMbPKMS91ufkTGHI8eyNw7qwMg+1WLZBOBAiyqr1CHFr4q4rx0A81kPZsZD08zM/EbfHun
	iZF1QMMUpbnXH0Dr4Ko9nFmDqzaECY3E7aDI0/RAcJ2587kDcUV36WD2xnpBLs6qQ2q9mkmUx
X-Received: by 2002:a05:7022:a86:b0:119:e56b:46b7 with SMTP id a92af1059eb24-12336a33ff2mr2682479c88.1.1768428860271;
        Wed, 14 Jan 2026 14:14:20 -0800 (PST)
X-Received: by 2002:a05:7022:a86:b0:119:e56b:46b7 with SMTP id a92af1059eb24-12336a33ff2mr2682462c88.1.1768428859689;
        Wed, 14 Jan 2026 14:14:19 -0800 (PST)
Received: from [10.110.121.92] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm32154921c88.4.2026.01.14.14.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 14:14:19 -0800 (PST)
Message-ID: <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 14:14:18 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Implement Region of Interest(ROI) support.
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
 <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <abb850223d81708588c594cfeee9e0fdbc1193e8.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VWcKkDilQVy5aqWhY2YWOsxjV_v6iWro
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968153d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HM2Y97s4x0O_qt6XTcsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: VWcKkDilQVy5aqWhY2YWOsxjV_v6iWro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE4MiBTYWx0ZWRfX+KXxKLSbVYSW
 izNxNPaX/f8sd3fAFcRRZeTjHvITudBblus6dHQd5FSqOsM1IwreSX7hviUOSHWamu4i4YII+eu
 JsOH33P3TBkvlNuu/k7ZOKnSm+8z+/YzvBnO5h/k9rlpuIBP14p3YoGb9GJV/euTmiHN0G1NNiD
 P+AmIjnxEE9/N6U2XAi9s74u9BVVWKdynO7y+fQSyZvVvHHFDLFHCqVVP5XGErTe+GcygolTAlN
 1kftw0Iob+TAu7KusDMFFqOFRQ2/XW649UQqNMsDnUQUpzvYeeeELWaDDZWvdR5TZYgEj8B7Rx2
 qgVkPlYPYiznwtshbfYSpX9foHcl03XpZnluot6XfFqZaRuHD+M5eaRdoZgWQsdoGsGylAiSzzW
 l6yQx7PV4ydqoxiaK2hB9TlZvmZ167mrVu1qIQfZ7GGnnJV+vxQNe/MX1HFcbQ8H9NfxyyBLNSU
 S5eAPdxX8hNCkHxxVJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140182


On 1/14/2026 8:08 AM, Nicolas Dufresne wrote:
> Hi,
>
> Le mardi 13 janvier 2026 à 12:33 -0800, Deepa Guthyappa Madivalara a écrit :
>> Hi all,
>>
>> This patch set implements region of interest(ROI) support
>> for video encoder to be configured as a rectangular
>> region, and corresponding delta QP parameter. A new compound
>> control V4L2_CID_MPEG_VIDEO_ENC_ROI which maps to struct
>> v4l2_ctrl_enc_roi_params is implemented to achieve this.
> My very first question will be why ROI rather then QP Map ? Its seems that
> modern API such as D3D12 and Vulkan Video aims for QP Map instead of a limited
> set of rectangles, while older hardware / firmware have ROI, but since you are
> saying that this is not yet implemented in your firmware, I thought it was worth
> asking.
>
> The ROI are relatively easy to convert into QP Maps, but the opposite is going
> to be a lot less accurate. That being said, the number of ROI can be extremely
> limited, at least this is the case for Samsung MFC firmware and Hantro encoders
> (no upstream driver yet).
>
> let us know your thought, should we adopt just one, and have driver translate
> once HW moved to the new approach ? Should we enventually support both ?
>
> Nicolas

Hi Nicolas,

Thanks for the quick comments.
Qp map for can be too much data to be sent from user space to firmware 
via control per frame.
Ex: Avc has mbsize as 16 and the max mbpf iris driver supports is 8192x4352.
This would mean 136kb of data (8bit Qp) needs to be transferred for each 
frame in worst case.
While are still evaluating Qp map option, due to firmware performance 
issues we are
gravitating more towards rectangle ROI.
I am not sure if we will need to support the Qp map in the future.

>> I'm sharing this series as an RFC because adding support
>> in the firmware and framework for testing, gstreamer testing
>> is still in progress. I would appreciate early feedback on
>> the design, implementation, and fixes before moving to a
>> formal submission.
>>
>> v4l2-ctl -d /dev/video1 --list-ctrls
>> ..
>> hevc_b_frame_maximum_qp_value 0x00990b8c (int): min=1 max=51 step=1
>> default=51 value=51 flags=has-min-max
>> video_encoder_roi_params 0x00990b92 (unknown): type=284
>> value=unsupported payload type flags=has-payload
>>
>> Thanks,
>> Deepa
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>> Deepa Guthyappa Madivalara (3):
>>        media: uapi: Introduce new control for video encoder ROI
>>        media: v4l2-core: Add support for video encoder ROI control
>>        media: iris: Add ROI support framework for video encoder
>>
>>   .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  7 +++
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 54
>> +++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  4 ++
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  8 ++++
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c          | 14 +++++-
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  5 ++
>>   include/media/v4l2-ctrls.h                         |  1 +
>>   include/uapi/linux/v4l2-controls.h                 |  1 +
>>   include/uapi/linux/videodev2.h                     | 17 +++++++
>>   10 files changed, 110 insertions(+), 2 deletions(-)
>> ---
>> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
>> change-id: 20260112-iris_enc_roi-8898f9a2455f
>>
>> Best regards,


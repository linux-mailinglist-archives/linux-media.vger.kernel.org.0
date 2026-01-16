Return-Path: <linux-media+bounces-50822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D067D296DE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 01:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEFE3303FE3D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 00:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4387A2FE58C;
	Fri, 16 Jan 2026 00:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzI2T7VV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgB3eFpz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419FE2FD1DA
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523896; cv=none; b=tQRZ8dQ1yMAB/WhP/LNXMAHXIu0ISSSMYq2MiU0T9d2DYsHe9mooBH8TSVcMIoH+16110xcGWI78I2QObuYf16VioRdAF5W+JJTm7Lx+MR+PTcbfvpmYEGxDt5vysEE1wwUm7PlI2rEpozXFceOkJtgcnQFl0BOIcZ98MmGlxk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523896; c=relaxed/simple;
	bh=/ecBY8F1aLTc5+EeesU+tmKORoC0VRSCzXyNM0cJbmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h77gTBBtb1ToNT2C18NRVRVqSXxmGis6UbwIFJKG451GdGGxNqFExfQoCI5IrF5mw8rqX7U3Y3xZRhJ1pIKO1Z2es3cppZaEyR5k+XnN3L2NJRn4/1LjhRsLInDBZmH0lKNiSY9gCqOlXOPdb/qVycAJBMJSlRLD+xUxEJfd7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzI2T7VV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgB3eFpz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMhTLp2819062
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQxRRPqzei3Ob8ntQIgpcuTXfDyfzjtfKi4+4zEPK80=; b=FzI2T7VVn4jWMDII
	lfF5rkts8XeZKhwXcdhVX6KmnAZ+2wN9IRyPcrnV5z3Loe3ETZEZpOydrlh0niJ2
	JWMinGI11qQYxgaWFsxeM9RocyfTAXTTkRD8FvvChc/rBo127hXrrGRSHpFP4CmB
	rKhSorH3Ge+mxmxEjRAP6GMapml9kgfEF7z0ryNDW1a3EWNNt4Ozq5CfS+cuAgnK
	MC1NiRAXKzzVJjM9MAyUw0+bdv4MdqIsuoqAjwhEmpt3jQHQtJEilu65sS4RILfS
	IkoYurRbCaewSJFiHBwzHozHdTRKZJGONqqXO8PHxPsvYZ9gq9wr8Jf3YNxR8KwH
	bFeUxg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq99ag7fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 00:38:14 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12334eccc8eso128369c88.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 16:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768523893; x=1769128693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQxRRPqzei3Ob8ntQIgpcuTXfDyfzjtfKi4+4zEPK80=;
        b=NgB3eFpz9rtIvjosJy95ah1V6f1htfgdt8syHBoocBX0yMB+SRAz4hZT1SOIMoq8i8
         hRu+6G2rPJRATkBXWVufjmHiDkah5t5jbnEG8F4m7YwYNYp8K5FHGCPUEHWtc4jjSYch
         JqTuGTJX5Uy9IwWF4vMjQM+NXzEQyJlXaDqglAM1Fzcwfc+KQdaryu4WtOL9t4XoTnOA
         on287H4rF/6gdvJoSw43ZuoQEfZgWb1uLdmp3hsMiIlJTuK1qn+t5/A9WlN3fmlgTsM3
         19Sz9aMH5tE2nmPc4wvDRJRzP0i+DJhc9eT7XKdV7b2mmx8Cn/pqEzspg9AU/gidPrq0
         YFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768523893; x=1769128693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQxRRPqzei3Ob8ntQIgpcuTXfDyfzjtfKi4+4zEPK80=;
        b=oswz9O60u98V449CHMif2KmcqFM0o1/4MzmonArFuW+DS90usRKpJsQsHj9eJkdy7T
         LoIH4HpUCcBmiDXC/ESCecNL1upIJg8ZCL3rv2Qq+5XPDqstJtM/eeoCJ1wrUouTKCJY
         bEhjqNm4TAgLnomjyWRTmstyLXlnPLwqyPRqPtBTcd3a4u9NmFVjBncub4Yf315y3hel
         sQJeeRR265NdlVwHeZzXKSxcrIFFtFimVwcQKChOy1yf9CopIBHbsDO7LU43YtgNcEC3
         bEPegRqP/odqiS5GrRIIRbylYJw9ZGle09y9HAMF/aIauR3R2WNcvTgeQpGsP3u5Adnd
         w88g==
X-Gm-Message-State: AOJu0Yz8QObv6bpB4PyXb+Tm+Ikf0uRx5vZIRx8RLB7pm9Smqf4rXOSK
	uK3hw5tn/JFZe1RsJHZtHVe0VdBVds2MUO8Vt2NajGpCeaLEWi8kgxiP8jMaivN+CcXkRsbICk8
	Ii5ZH8pKw1fPUIAbYO02gdh5qsse6IIKkQ+p8OoWOpFrOPche6yyqQ17yWNr241Ql7Q==
X-Gm-Gg: AY/fxX4FBIulsFJUqj04jB2TQbXgK+1eC9yTNOkeX9+RjYmgfGuq6MURk+9ydxEvbLR
	/eSwYzHl6vkF1y9rW2bmkWtdlhin1RWpNp5Y6EBBn0Bb/U4D/Xpfyxawy5/tNZOwD8MQ0lsTR5v
	7VPRmIVbmmdqGzAIizd+JM1fzY1ZiJi14SPtuzPjOLICGGxMjqTrq9tNGhbraWC5vH13PVl9/5Y
	hOLI70N2QMNg9/ezj2/u+2XAsHdt2hzCb4zZucaMrvCi6U9ShcrqYMH9c2UfmmChhS8LQDjGnZv
	V4/CFvv0jBc+G3rlLDAs74Ui+bOYCXY/dViJxiBMB2X0o10hJTE+k5p5LuAzEsAtDXOSrJPkfTW
	rGKSd1IYknm6BDYSlve+oVvGd9xqSTUSZvb9MxdsoHAwiOG/fMnLHRviMPM5MAjdqNoSjboF0
X-Received: by 2002:a05:7022:3b83:b0:11e:3e9:3e9c with SMTP id a92af1059eb24-1244a817bd4mr685465c88.7.1768523893053;
        Thu, 15 Jan 2026 16:38:13 -0800 (PST)
X-Received: by 2002:a05:7022:3b83:b0:11e:3e9:3e9c with SMTP id a92af1059eb24-1244a817bd4mr685453c88.7.1768523892405;
        Thu, 15 Jan 2026 16:38:12 -0800 (PST)
Received: from [10.110.121.92] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm1085336c88.16.2026.01.15.16.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 16:38:12 -0800 (PST)
Message-ID: <0232a3fc-8774-4540-a718-eddb1d89e6d2@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 16:38:10 -0800
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
 <d7b2d31b-e643-43cb-8f16-9568944222d6@oss.qualcomm.com>
 <6b5746cd16edf589fca79e2e6f8cf7f706309815.camel@ndufresne.ca>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <6b5746cd16edf589fca79e2e6f8cf7f706309815.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZgcMYZs2v8dT4JcNJToxYbBcaIlzbP2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAwMyBTYWx0ZWRfX4QCJRjfbFEqo
 SIAMXqsAwDkLV5Uo1le7anq3+oNWseHpxhD0bHG/QsHYmggurKvjKGdy0fhvrx926BbnlUJK12t
 cEnV4Zv4dLAZ219uWzDAtUy9Zd1wSwwvFJZm+30WEeTMZh5156tCNM6YbGmZ358D1r9ZLR0kk9h
 fHCqCji2RysKLd1mAKXiVNdKIFlok4FPXjn5X9QTZA3LOG0H1i3QMG3FNO1zFsVR3DAFKYmdZxe
 Sbi9QSmO2DIsDuAZjD938ikYZFzAqwPXwXN/3UjxnSr3qyKv1iXhBOiNdS5p4mJrm1sq/tgYWyU
 em5N8FV0QZTGFQD958ajmByWfTDqwmUUn3K6RtFJA9Ad9CAALaDchIuvhirMQWgh9f/Yb1/pnjF
 q/n7TdeBcrknGqNHSWHTxu1ZsISGnwNzvdRpVs6MG6kwt39ezR2jf5IiG3EWfuvdHUYIqN9iDdt
 vKWAUuGA+Rbb/WVADfw==
X-Proofpoint-GUID: ZgcMYZs2v8dT4JcNJToxYbBcaIlzbP2j
X-Authority-Analysis: v=2.4 cv=f5ZFxeyM c=1 sm=1 tr=0 ts=69698876 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zBYVM8QCAAAA:8 a=Dy9dXtnXAAAA:8 a=JsNoqYpyAAAA:8
 a=PlHZZfusjfnJ1J766TcA:9 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pqcTjcuDZwkA:10 a=1JuLLl_Xj_IA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=ArXkYGXkE6hBHcUMFODu:22 a=7b_YKI4FLZevj963FIVU:22
 a=2FlLF0J1BH4NsEBlSY-u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160003


On 1/15/2026 5:42 AM, Nicolas Dufresne wrote:
> Hi,
>
> Le mercredi 14 janvier 2026 à 14:14 -0800, Deepa Guthyappa Madivalara a écrit
>
>
> [...]
>
>> Thanks for the quick comments.
>> Qp map for can be too much data to be sent from user space to firmware
>> via control per frame.
>> Ex: Avc has mbsize as 16 and the max mbpf iris driver supports is 8192x4352.
>> This would mean 136kb of data (8bit Qp) needs to be transferred for each
>> frame in worst case.
>> While are still evaluating Qp map option, due to firmware performance
>> issues we are
>> gravitating more towards rectangle ROI.
>> I am not sure if we will need to support the Qp map in the future.
> Have you read how this is implemented in Vulkan and D3D12 ? Please have a read:
>
> - Vulkan Video, see quantizationMapTexelSize [0]
> - D3D, see QPMapRegionPixelsSize [1]
>
> [0] https://docs.vulkan.org/features/latest/features/proposals/VK_KHR_video_encode_quantization_map.html
> [1] https://microsoft.github.io/DirectX-Specs/d3d/D3D12_Video_Encoding_Texture_QPMap_DirtyMap_MotionVectors.html
>
> Note that D3D also support dirty regions (what you call ROI in this proposal),
> with no limits, since these are translated into map by drivers (its a software
> feature on top) and motion search hints, that one seems rare.
>
> I'm not against having ROI in our API, its common in older chips designs, but
> its clearly going away in the long run since most fixed hardware impose very low
> region count, which is not usable for modern application. ROI it trivial to
> implement on top of QP maps.
>
> A typical use case for that is to use lightweight AI or traditional CV to locate
> most relevant portion of a video. The result is more like a heat map, not a set
> of rectangles. Then we roughly map that in a low granularity QPMap before
> encoding. This allow maintaining very low bandwidth, while preserving the
> information needed for the heavier processing in the cloud. I'm including one of
> the many example of that, this is a talk from Spiideo [2].
>
> [2] https://gstconf.ubicast.tv/videos/region-based-compression-in-gstreamer/
>
>
> regards,
> Nicolas
Thank you for the detailed information. I reviewed the documentation
and agree with your assessment. I am following up with my team to 
explore this further.

Thanks,
Deepa



Return-Path: <linux-media+bounces-43835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD9BC13D4
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 13:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47934188B5AF
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 11:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CA42DAFBB;
	Tue,  7 Oct 2025 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5opgIXz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331BC1A58D
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837105; cv=none; b=q6hxPMgsNAoIkNz0YOlltHaxgIFalKGS6ar51nmVK1mB77U+CD5EiZ8fOpo9xsqaGex8d8R5ReIDhPBX/RKbrM63Z+uQFJW16aTss2S49LX4BfR/wFRYZVLPNfZ9FShwuZ7S5fovdkvMpTcAmICiOGUOvartyJayt6S72r625cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837105; c=relaxed/simple;
	bh=ZXrGelmvQas8vmmTp/wX0exf21knoe1W83mDfua+9fw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKOMKcrH2FmbUn4wM6xsHTzPCEJolWnZ8sBfCM7WNknhKA3hzbeoBQJBmbTedIadrVxIekPLofvIRC4FTrCK8+iETrBW4jbuUlxHE0tT78fa8muLvjmFt1Egh4fm786TM+xWvJpOK5dB2Wa2t5T/DrrH2sAk1tZATRE8//8BqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5opgIXz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973h0Y6023921
	for <linux-media@vger.kernel.org>; Tue, 7 Oct 2025 11:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCYeVPjY1mm3YEzAO8t9rcepeUOr5QIFPQ94aq1HS8A=; b=f5opgIXzjj32H8O2
	GznYGxX7b9hB7zfT+3AMVvQ1pink7gbD5s75hTBwmdY9fop0FyRPss6FpvsX4iJm
	ieMfCKXwwsvaDQA9ibIcq8G5h8CTF19JfPuapbTFQ64why/7SgMqsKtptku/ncxX
	E7sBbKsKIakPF9RF+X39F1iP4nX6/nBoh+/vHrc2E7NPj8VgIHCLxVq0pxkM8KyV
	htbGGg/KTmp1jmr3nNxDNWzzlFtt9fBaljuYtbq4RIH5ragoacVHNu5Mp8yZnHyE
	HBCnyBDTTwinimNRtcOHSbdCebsOHem4dHqb0qqgadoVPdTe2UVClST0ORpwcLeE
	bLFK2w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6aarye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 11:38:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5509ed1854so3705545a12.0
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 04:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837100; x=1760441900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCYeVPjY1mm3YEzAO8t9rcepeUOr5QIFPQ94aq1HS8A=;
        b=V4R4f3Cna+GZkY67rYGQHI/3MFSCpwR/v9W3fGNAJww8VrZnkMXYEIaa6suhSL8yef
         UWjJwe9v45QIPhzqT1T2sVA0lczmExk1IkO8nzrsFNmHm3RFP33pY6MNttXfkWKZf78I
         AWbEt87EPNytrzXiZziZbMazfyQn53wXOBxviuZ2wANVTBBMjOVpOh4LpgHNmxkgdmQd
         n8sMjlTErxYqFORp3/cCWz0VvGZmrqRTJBeUTU+dCBcznplL/yoSdMlgT+GlQC2I1UYD
         74E34lxvDYd7kwM6C6ZuaRZ8XCS7+Jt+g+kffIiSVCyZMjXkkDxQaXvrXg7cjUwxWR6b
         d9kA==
X-Gm-Message-State: AOJu0YyuN/nNUxnBrIJHxiBAF2ZktZP5TjSeax5cVS9l6PpQgdMVkdo8
	9Y9wH7Bo4AemmWVINUjRkC5wGY0gny1jgJA86jYCVvUxpVHMem9SkhmM/0gXD+MZ2oxD87xuFAC
	CW++bmgwSMhbkmnhMxokhrSmvccp+WzeYisR866lmN1QMfkU0ijSMsmv1Q5StB7KnTg==
X-Gm-Gg: ASbGncsaWMfa529Bcz9FcE2zJR/ORNfFdzbyPZpNKFtEIF3XVrwzs1KaFntWGPprGEX
	0/CZLXhN0MJeP7SzZrL/fY6BHhGjTU7lKj/Q/DMFu7AA8hk2jGQdyW7itX3Z6ETljxFza2kXMHO
	+yax9RBMGSBiAEKL4W5I/pkXecRH8FGVy0emCES9polSpJ0qqMUtHHqEuc5C3fY4vMOmqjciW2W
	Aty+3GoagH5sTG+EFuKnLpMjnAJ0aFDpnTHo3AAedWSzXhs7PObHTWfcREjp3oVJCfJeuDfPSTm
	tb7+wYvDlbOLFDnzssMWkLZtO3oufB3ChKnKJ8uk77jM6vZJkoQFQy5RpB3rOMUNjRPdT0X1kgn
	HLg==
X-Received: by 2002:a05:6a20:12d6:b0:2c6:cdcc:5dc0 with SMTP id adf61e73a8af0-32b61e6d11emr21191693637.16.1759837099740;
        Tue, 07 Oct 2025 04:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjww+c/j8M44jX9PgI+h6Etypkqn272KmpewHvoFomBsMZzaaIb9jb1O3bbZyUinW/tDhShQ==
X-Received: by 2002:a05:6a20:12d6:b0:2c6:cdcc:5dc0 with SMTP id adf61e73a8af0-32b61e6d11emr21191635637.16.1759837099017;
        Tue, 07 Oct 2025 04:38:19 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099ad926fsm14634202a12.5.2025.10.07.04.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:38:18 -0700 (PDT)
Message-ID: <aff68f3b-298a-2cb0-c312-808d7efce6f3@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 17:08:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix ffmpeg corrupted frame error
Content-Language: en-US
To: Vishnu Reddy <quic_bvisredd@quicinc.com>, vikash.garodia@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251006091819.2725617-1-quic_bvisredd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e4fbac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kcjkJnMakA67_LZCmskA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u056L8GUVITm_6OjGL8DJwaa5OSWy80_
X-Proofpoint-GUID: u056L8GUVITm_6OjGL8DJwaa5OSWy80_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX2r/LLh2iOjah
 +Ch5yeTUG2oeWLp1S8r0kiyz0dObD8eZZmYWcT4gRskzwtVSZiXITcwq5jLOGS5QUtFkHFvvPSQ
 KE+ylJgesrbEprq+PoTfWmokiIN0Xw/vfA+7BGASUg8Nlz52to5obrM5mn6snFmfCisrEOm9MAu
 aGjM0enLUpEl4CkNbEvzp0GCQRGKtog3L5xKJ1ujyOr+wotMBL7CPG01ZdCRUgBuHo3WVPzRXP1
 vJpTOc91y3NtD0XlEPR2xA5d0qIFBKiG75tYski+kmymkmJh881Iyv54vZaHDm1fhSyqPh5bsrW
 KUSZpXF4BJjY5Mmmn3nxnNVA1EC5no+50pLIEp++vmG2X+CQ0z1nj8Sgvdj2oIqvwyFGcMyBTO+
 ZALgAHQq53Z1qtZkZAA8qGgqjpeoyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121



On 10/6/2025 2:48 PM, Vishnu Reddy wrote:
> When the ffmpeg decoder is running, the driver receives the
> V4L2_BUF_FLAG_KEYFRAME flag in the input buffer. The driver then forwards
> this flag information to the firmware. The firmware, in turn, copies the
> input buffer flags directly into the output buffer flags. Upon receiving
> the output buffer from the firmware, the driver observes that the buffer
> contains the HFI_BUFFERFLAG_DATACORRUPT flag. The root cause is that both
> V4L2_BUF_FLAG_KEYFRAME and HFI_BUFFERFLAG_DATACORRUPT are the same value.
> As a result, the driver incorrectly interprets the output frame as
> corrupted, even though the frame is actually valid. This misinterpretation
> causes the driver to report an error and skip good frames, leading to
> missing frames in the final video output and triggering ffmpeg's "corrupt
> decoded frame" error.
> 
> To resolve this issue, the input buffer flags should not be sent to the
> firmware during decoding, since the firmware does not require this
> information.
> 
> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index e1788c266bb1..4de03f31eaf3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -282,7 +282,7 @@ static int iris_hfi_gen1_queue_input_buffer(struct iris_inst *inst, struct iris_
>  		com_ip_pkt.shdr.session_id = inst->session_id;
>  		com_ip_pkt.time_stamp_hi = upper_32_bits(buf->timestamp);
>  		com_ip_pkt.time_stamp_lo = lower_32_bits(buf->timestamp);
> -		com_ip_pkt.flags = buf->flags;
> +		com_ip_pkt.flags = 0;
>  		com_ip_pkt.mark_target = 0;
>  		com_ip_pkt.mark_data = 0;
>  		com_ip_pkt.offset = buf->data_offset;

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita


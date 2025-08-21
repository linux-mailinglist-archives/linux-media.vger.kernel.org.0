Return-Path: <linux-media+bounces-40542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC72B2F330
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A33141C232B0
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04312D3A9F;
	Thu, 21 Aug 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i0/eTsCV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F04233155;
	Thu, 21 Aug 2025 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767019; cv=none; b=RzfrotYIE0RWGTcqSA5K0/l//LwZK64TozEPkMKfIELPBbqK6mJSdqz0QQl6Ox6Swdl+96iiBb+N8VQjWcJgu5HO9g2suzqA0ebRL8vJa+Py8o4Ho87Mmy1UkAS6lIHetgWgIcfYvxI25wNysFNBNw7hv0aeYY8E90D/FRhpNcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767019; c=relaxed/simple;
	bh=kzBX8GdhV6NThGX4pERcHoD0fmC/V+mCWUidKUJ5P+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kfrDYwcWoDtGbSwSSznVo3Ar1rzz1lbWwIHJpyHhSq5VBHygs3TreD0LN3/EP+rWeiqUahjoCItrucXq3rBafAdwS22mROwGW0JoZYimP5nX+6/Nj28Q44bgghtVJg3XwU4hCTu61AXqqg/iE89v2o69p5rlvH0q6Zr5mAooW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i0/eTsCV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L6pWfT001621;
	Thu, 21 Aug 2025 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+536UOU63mVKMREZq7hulcR+AF8+Nj0oiTBRhRd6Go4=; b=i0/eTsCVVXtuSM3F
	INDKQEpGrqBtmLyURIejGw8074Gm0UfEpbkyo5ykvEY/+rvlE0JyYTFMpYJ+YZYz
	8S637Hv7o00s6N/79M3aAiJdiDfx8+ug6Nh2v1MTXFZKrRG3wtdgTPyRa3SNtmv5
	zgAKHAqoN1lOqLl6FoCVOc9RpUFBimPaVRTxlp3TRnpsK1HxTF8gUU56H8TQVFgF
	0AKZA5y+9xyMAVJb3JJgl9tETNxa/XtfPC5vCa7D4BC5kbUs4m6kFcEfkH54um3f
	CQre1F0kTi+nzwg2qy9EaDmwacRmlciN+zssEQJlXb+b07CSnttPJEth0X7Mypo5
	++FuSQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dmrab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:03:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57L93QrW005347
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 09:03:26 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 02:03:22 -0700
Message-ID: <fe1fe768-678a-48db-c603-2fda3effffb9@quicinc.com>
Date: Thu, 21 Aug 2025 14:33:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Fix firmware reference leak and unmap memory
 after load
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Stefan Schmidt" <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Neil
 Armstrong <neil.armstrong@linaro.org>
References: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250818-iris-firmware-leak-v1-1-1e3f9b8d31ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzR8xMzZWyK8M
 wkLlj5JVrIXVzye1PLl2pyTDM4GS4Lal2vffkFrSpLIJSTboxhk9S/sJDvim4EUVWdouqPiZhXp
 iyoWOtat0RAml810tMYttpdBMMweT7PTDC9OHDuRZqNUJCSM9fR0bUxkwbbcJ6ievdWwRu1JT3x
 PtF3xtT8m8xMCWGswf9bK/lEhnR6zHNSaHcmzv7Uq4KPLVWT1kQsT0lgQqYzNIq69tEGDGm/D+q
 TQpMep/gBHLITdjMR0jEtpLXW4qy1HRnV26HZzPkBAZgX3PfNsz+IgjySggNh8myOpK1Boo6z4r
 oJn7oIq8CPPndBVCvrEoJwDequbLvSSZJUKOKoqz5e7R38RIWL0iV0LiWNxnc8uFgHMEOtMUeq6
 hbObT4CABbQTjn0vyUbILqAM5wXDNA==
X-Proofpoint-ORIG-GUID: u0Oh3CQRLBEZPIG7IqcZSoJYJIsmnQYl
X-Proofpoint-GUID: u0Oh3CQRLBEZPIG7IqcZSoJYJIsmnQYl
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6e0df cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=clK9LW6jI8F3NDlFqTwA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Hi Stephan,

I noticed that the maintainers were included in the CC list rather than the
"To" field. please ensure that all relevant maintainers are added directly
to the "To" list in your future submissions.

On 8/18/2025 3:20 PM, Stephan Gerhold wrote:
> When we succeed loading the firmware, we don't want to hold on to the
> firmware pointer anymore, since it won't be freed anywhere else. The same
> applies for the mapped memory. Unmapping the memory is particularly
> important since the memory will be protected after the Iris firmware is
> started, so we need to make sure there will be no accidental access to this
> region (even if just a speculative one from the CPU).
> 
> Almost the same firmware loading code also exists in venus/firmware.c,
> there it is implemented correctly.
> 
> Fix this by dropping the early "return ret" and move the call of
> qcom_scm_pas_auth_and_reset() out of iris_load_fw_to_memory(). We should
> unmap the memory before bringing the firmware out of reset.
> 
> Cc: stable@vger.kernel.org
> Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index f1b5cd56db3225d0a97e07d3a63c24814deeba78..9ab499fad946446a87036720f49c9c8d311f3060 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -60,16 +60,7 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  
>  	ret = qcom_mdt_load(dev, firmware, fw_name,
>  			    pas_id, mem_virt, mem_phys, res_size, NULL);
> -	if (ret)
> -		goto err_mem_unmap;
> -
> -	ret = qcom_scm_pas_auth_and_reset(pas_id);
> -	if (ret)
> -		goto err_mem_unmap;
> -
> -	return ret;
>  
> -err_mem_unmap:
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -94,6 +85,12 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> +	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	if (ret)  {
> +		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>  					     cp_config->cp_size,
>  					     cp_config->cp_nonpixel_start,
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250815-iris-firmware-leak-b6c43bd1ee85
> 
> Best regards,

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>


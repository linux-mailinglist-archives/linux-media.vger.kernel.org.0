Return-Path: <linux-media+bounces-13544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3481C90CBBE
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17181F23E28
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA9F13A3F6;
	Tue, 18 Jun 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T1XGLoe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB04C62;
	Tue, 18 Jun 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718713895; cv=none; b=RnxhZf2VddqAKHdHt/9advyq6Tlp8qN+9S/4okdsQgRhpMP3BlFfRS/UVsiDiGAeNxcbiuEz9gZK7RjEfeTt5A7JB6ynnmZwxQhhISD4/2v0iJYiav5gPb5+dW05Dljj8jK8n1PsECuroZQ2mFkgbYglqUuYEV4vFPwpnRiBhpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718713895; c=relaxed/simple;
	bh=KF9KlLJ2/1IxFeWa+JfqOaei9CwLrBDpOq8rEVEM5mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TF5dxE0gzJZS1a28XCMLm+K8ZB+nQaGpMGzDxBqbxTrJFqtRYG/Mp40YxzuETHnc42rE8BSOO8hutCebjkWFmUMCCIbthw2YEl4mSHuQrJnDdRQaBc6whyL7wb+KFdAi5pG7MWe4lKCk157AlIVXf7Wn2TNEm3vI5/ei59AyDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T1XGLoe9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I8d9Ch011203;
	Tue, 18 Jun 2024 12:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXnLFxO+GsEC/MzSmb0Ccq/xCdmIioVnQiBh1gQQUns=; b=T1XGLoe9Bxkz0dxo
	+xVkxNq+5/yHPVxpTmpNS+Y5CGTjaY+5Bc+3VRVGiuEWqLzEKXJ22mIqeT3emT0h
	Pt9zUxHoXOx0LfUAXhD3FMKnjtcmGp+daTiadP61vAMjsDY3C3WQdgwovEuZWFTc
	5P2A+aAMoOnkSTjGZErIYekI8BMP/VzDSAnV9hvl0n8POiaoKzZAPcKoJ13Zagh1
	hu0QajZvoxwW3RXggYDyIt5Q3SJw3IBefcUZxkENY05xAB//YHbLrs+ZeCjPYaCO
	0KCPPMTbH8N4NrozR1e5/OA5YOras6+3Gk6KA5BXlIN05guyHLQfzTxDw8VPVWLM
	A0lvlg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu6wa8p17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:31:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ICVI3P028562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 12:31:18 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 05:31:14 -0700
Message-ID: <0832ee9a-dec3-9ed2-2386-d870495728cb@quicinc.com>
Date: Tue, 18 Jun 2024 18:01:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 18/18] media: venus: Refactor
 hfi_buffer_alloc_mode_supported
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
        Michael Tretter
	<m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-18-cda09c535816@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-18-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XY89Pk84uXecBlU-ECV6aEY1AC2H4by9
X-Proofpoint-ORIG-GUID: XY89Pk84uXecBlU-ECV6aEY1AC2H4by9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 mlxlogscore=871 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180093


On 5/28/2024 2:39 AM, Ricardo Ribalda wrote:
> Replace the old style single element array at the end of the struct with
> a flex array.
> 
> The code does not allocate this structure, so the size change should not
> be a problem.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index dee439ea4d2e..9545c964a428 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
>  struct hfi_buffer_alloc_mode_supported {
>  	u32 buffer_type;
>  	u32 num_entries;
> -	u32 data[1];
> +	u32 data[];
>  };
>  
>  struct hfi_metadata_pass_through {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>


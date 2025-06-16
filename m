Return-Path: <linux-media+bounces-34896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE415ADAEB0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2F397A6DB3
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392462E88B8;
	Mon, 16 Jun 2025 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V1g+KUgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F312E2EF4;
	Mon, 16 Jun 2025 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073704; cv=none; b=Qc75hQmBnnHJymrjM4L341Hg4oXIcoDS/UWCcuORKt61v+du4FzRVNzNTU1IUzsjG/GiL++pwhklphP67XJwLccd3R2CigLK80sQfn4JK0sHA8Cjetng8asTt6uk/pXX0c5c6jZKyTxhXPPpVsQB3PR53CfE2nVajxtwKYyak08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073704; c=relaxed/simple;
	bh=G9IPn0guZ8e7luDU6lCo/MjI/7F105ibaLtlSYoaCLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GlAgrpx9PZ4LEH93KgV8OxBMaeQ0f+nA9g/oEuk7FitqCe+Ye5U8FbmjQw5u5Kdfy+eGCTKawOY2rZBPmqFvljUn0Jj3MvvYZD00EDLsOQnzvsIf32WJSK5n/Fukfx9Evl8eB3Emtk9hv0j8D5ZRUwzBGbmV00IqRIkbw9YHLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V1g+KUgl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8llZk004109;
	Mon, 16 Jun 2025 11:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mr+Lp2/Tw3slc2QsiFw5oFEx+8uq1qJflYKkjSNvbyQ=; b=V1g+KUgltpBweqga
	hHfyKTyVE7c57ftCUqnehK21wDra3JnHOH+fHvRd3IL7k8A1vuC8qigmyQXmSgLB
	A+hIBXoz6v84oQ4dakE2aDgF2o8RGpnpcAqNYorpjeohSs4S7ln29jJp4jLuOkY2
	AjVUW00G8gG+MECBWBN3QKzuVsalwTOIo4SBmCFvqGRBRXRVHnjhGMQvcEhyxZ4G
	62nIT2730k7ukpIdVhH66ZMsncuu/FYJpfuJfAXgmC0hcUM/a2ze6MT0wM0sD3+6
	lKk3EUMrz2VFf05zSjj4PjzbB6PydCkYbc99J9bNTlo04XYmkTz8x3Xnpjn6FzhG
	i8ALtw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsv9k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:34:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GBYuOA010464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 11:34:56 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 04:34:54 -0700
Message-ID: <a20f7ad1-1b01-57d0-89ad-e1429690e770@quicinc.com>
Date: Mon, 16 Jun 2025 17:04:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 0/6] media: Fix coccinelle warning/errors
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Kosta Stefanov <costa.stephanoff@gmail.com>
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MSBTYWx0ZWRfX0ZGFoaCRuJxE
 mOxG45ATH6ThVLoctmeRTgoYsoVY4UiC9dJtNsEKqtehWKw1pk0oSyWWCtThX28u0tQRnTzOgHr
 hRkLa5dZDdnU97QV+KnxGrGeiyjOLs6tWmP/hRfvNfeH/CcL+pSPa3hrWsCQASvEIh6Oov3O5Du
 Ki/onV82tNJ28aFuyKIYOqcGcKyRJfxe0r9ifqoB8XGOgyX3i82cnHh2TNokisIuK/4ycNt6Zfv
 iEgRgVotgr05Kqv4131nXxA8cd/MStyxp9u6WR5br0uxW3XwxJuHx0+ESkC3/rHZmZ9u4W4efco
 XMVLvRMi5IrUd2luJzStl7hTA39hkovxg89XL+LdgOzr88brCelY3f3DIYi28ZIjP8YN/wWoyUh
 fwfJm6TzUdRegeSUsIbKCTRJyUvZ+/dtbKGtVdgk8CeQM+mBapZG/i4yZVz0wEwQw8acrgb0
X-Proofpoint-ORIG-GUID: adkOhAidUbc3L4XsB_qaLo5Jh1Mg_aLX
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68500161 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=xOd6jRPJAAAA:8 a=OPJHTv8p9pyGCHnS0U8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: adkOhAidUbc3L4XsB_qaLo5Jh1Mg_aLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160071

Hi Ricardo,

On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> These is the last set of patches to fix all the relevant patchwork
> warnings (TM).
> 
> --
> 
> ---
> Changes in v6:
> - Improve comments for tda10048, thanks Kosta.
> - Link to v5: https://lore.kernel.org/r/20250107-fix-cocci-v5-0-b26da641f730@chromium.org
> 
> Changes in v5:
> - venus: Ignore fps > 240
> - venus: Clamp invalid fps instead of -EINVAL
> - Link to v4: https://lore.kernel.org/r/20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org
> 
> Changes in v4:
> - Remove all merged patches
> - Improve commit messages.
> - media: Remove timeperframe from inst
> - Ignore 0 fps (Thanks Hans)
> - Link to v3: https://lore.kernel.org/r/20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org
> 
> Changes in v3: Thanks Bryan, Dan, Markus, Sakary and Hans
> - Improve commit messages.
> - Use div64_u64 when possible
> - Link to v2: https://lore.kernel.org/r/20240419-fix-cocci-v2-0-2119e692309c@chromium.org
> 
> Changes in v2:
> - Remove all the min() retval, and send a patch for cocci:  https://lore.kernel.org/lkml/20240415-minimax-v1-1-5feb20d66a79@chromium.org/T/#u
> - platform_get_irq() cannot return 0, fix that (Thanks Dan).
> - Fix stb0800 patch. chip_id can be 0 (Thanks Dan).
> - Use runtime (IS_ENABLED), code looks nicer. (Thanks Dan).
> - Do not replace do_div for venus (Thanks Dan).
> - Do not replace do_div for tda10048 (Thanks Dan).
> - Link to v1: https://lore.kernel.org/r/20240415-fix-cocci-v1-0-477afb23728b@chromium.org
> 
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> Ricardo Ribalda (6):
>       media: dvb-frontends: tda10048: Make the range of z explicit.
>       media: venus: vdec: Clamp parm smaller than 1fps and bigger than 240.
>       media: venus: venc: Clamp parm smaller than 1fps and bigger than 240
>       media: venus: Remove timeperframe from inst
>       media: venus: venc: Make the range of us_per_frame explicit
>       media: venus: vdec: Make the range of us_per_frame explicit
> 
>  drivers/media/dvb-frontends/tda10048.c   |  8 +++++++-
>  drivers/media/platform/qcom/venus/core.h |  4 ++--
>  drivers/media/platform/qcom/venus/vdec.c | 23 +++++++++++------------
>  drivers/media/platform/qcom/venus/venc.c | 24 +++++++++++-------------
>  4 files changed, 31 insertions(+), 28 deletions(-)
> ---

Apologies for delay in review for this series.

Regards,
Vikash


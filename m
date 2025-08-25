Return-Path: <linux-media+bounces-40864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A44B33676
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68EBB481C8B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EDC280324;
	Mon, 25 Aug 2025 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UPaF050Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17663277818;
	Mon, 25 Aug 2025 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756103358; cv=none; b=ckcD46mZvWR/P3zAB1AED/UGE5G7kleoSwuN8kftoH6jFT5wmYn8iSx9x+E+ScAUOnpBxzVPxuZkFpzuzRIw8/SlpepCKq1rwd/dJgAkX8lokxWAu2s5ZXgKqm+rZiHh0FbNjAPEabdyFSxVo1WY3Bj0zQkTyNo0gZSCCljENEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756103358; c=relaxed/simple;
	bh=+aCSCeFSIdIztzIDPGOpEGJxoqlfBFMogHzH/++23IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QzXUEmtK0RzekKcGFNAnd6oRvbcQ3SnG7kkDfo6NN0ndiFrIZ2Xf4u0MadmQyt6x0hLcfgcADLpjW4Dv6nY8fpR6d4ft4n7nYSoEMwTN/8j6p7+IpTu6p4Swv/CqOHa3BDOHRHHN2YYS2xp05BBog2ATCgOw1dyh5JQtGbvgmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UPaF050Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OGe5rU024681;
	Mon, 25 Aug 2025 06:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g9qb0uQ8lG7fH822VuVvdkzf7SFHewY7RtM5wBsh/wI=; b=UPaF050Yms0YgvKL
	QeyiZJ8dW/Z8XpmdmjURoLISMOhM7zgjU2K+q7vuk8aZRhbtR8022s65lCcm58SD
	ZRlLAXxrrBArkpZL/rDgQ5zjRH7anWYemUJenNWPHl4b4IOqb9rtR/QcO90Cb1Qh
	Bo2OuDXHMWi9zA3Rgsc078dWRtMf6kAPTf8r1aiPFP2BuNgwIOTjVF6zn5XoElH9
	i8FMmgv+zcI1SoAP0AU3U9cYfkgPZyB89qWSgqc/K2cdr7szMtjn5YcGN3xkREHJ
	pnW652gUB0WbW2liUClB+t2AKxKprLZQpDFAAsMrph8iVh63WbJu1B/Y0Sa+zcyb
	kn+3wg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc3x34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:29:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P6T9B1014019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 06:29:09 GMT
Received: from [10.204.100.211] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 24 Aug
 2025 23:29:05 -0700
Message-ID: <3b8599bc-ffbd-a129-3dba-088c2fc950dd@quicinc.com>
Date: Mon, 25 Aug 2025 11:59:02 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <7e734644-15d7-4a47-a98e-7f6c5a50697d@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <7e734644-15d7-4a47-a98e-7f6c5a50697d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX7XV/4OcQ25DT
 8nGOnEDn6zsIVsD7gYnxfjbZVG8EPgfhu3HMcqlBf1LfJOzY2DJ6spPBM3koA11m9Wp/nCYEo7k
 GaDWC6DkgeCr7j8BX9yQLbHdM+U3KOIKuG915Z4qnsiCiZOCcuOeOBMo7X8tfg1VX1gQIa5f+8z
 87Gz27zrZrs15XCXtSaTQUzxccK3kNy20KDhVLiNAZKhc12hIHiOk99F3XTPF3fUvKQ4dAiAuBM
 Fwni2076fKVb7Dh6IgYbhmISfM4mMjNreJ/poQVZwBRbOAqtkCiZp4cD0uhEK6UKWgNCotiXl2b
 0Vn2jJYShItNLsA0xVyPzq8X6cX1ImU/C46Y6z8M77+/LUCXZpS2OWaSUp446YRwdrv1KAXSN30
 ohXf/Kkp
X-Proofpoint-ORIG-GUID: u2jZ7B1iBzPgGHsUxW0N2FhESdH_H7ZT
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac02b6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=TJQhyDWxPBfA8VjwnykA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: u2jZ7B1iBzPgGHsUxW0N2FhESdH_H7ZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032


On 8/22/2025 4:59 PM, Neil Armstrong wrote:
> On 20/08/2025 11:07, Dikshita Agarwal wrote:
>> Hi All,
>>
>> This patch series adds support for H.264 and H.265 encoder in iris
>> driver and includes a few fixes and cleanup in the common code that were
>> identified during encoder bring-up process.
>>
>> The changes include:
>> - Enabling support for H.264 and H.265 encoding.
>> - Fixes and improvements in shared componenets used by both encoder and
>> decoder paths.
>> - Ensuring compatibility and stability with the existing decoder flow.
>>
>> Changes in v3:
>> - Fixed the log when destroying the interanl buffers (Jorge)
>> - Updated commit text with issue details in patch 05/25 (Krzysztof)
>> - Added a patch to simplify conditional logic in stop handling for hfi gen1
>> (Bryan)
>> - Reduced duplicate code while registering video devices (Bryan)
>> - Added a fix for try fmt handling in decoder (Self)
>> - Fixed the value of max core mbps for qcs8300 (Vikash)
>> - Simplied the frame rate handling in driver by using non q16 format and
>> converted to q16 when setting to firmware (Vikash)
>> - Fixed the issue with bitstream resolution setting to firmware (Neil)
>> - Addressed other review comments (Vikash, Bryan)
>> - Link to v2:
>> https://lore.kernel.org/r/20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com
>>
>> Changes in v2:
>> - Fixed sparse/coccinnelle issues.
>> - Fixed the kernel doc warning.
>> - Removed unsupported PEAK_BITRATE property from SM8250.
>> - Dropped patch 04/25 to fix quality issue with encoder.
>> - Enhanced command handling for encoder to allow start/stop commands.
>> - Expanded rate control condition checks to include additional rate
>>    control types for HFI Gen2.
>> - Updated default value to MAX_QP for all caps related to max QP settings.
>> - Add support for INPUT/OUTPUT_BUF_HOST_MAX_COUNT caps for encoder.
>> - Link to v1:
>> https://lore.kernel.org/r/20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com
>>
>> All patches have been tested with v4l2-compliance, v4l2-ctl and
>> Gstreamer on SM8250 and SM8550 for encoder, at the same time ensured
>> that the existing decoder functionality remains uneffected.
>>
>> Commands used for V4l2-ctl validation:
>>
>> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=H264 --stream-mmap --stream-out-mmap
>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.h264 -d /dev/video1
>>
>> v4l2-ctl --verbose --set-fmt-video-out=width=1280,height=720,pixelformat=NV12
>> --set-selection-output target=crop,top=0,left=0,width=1280,height=720
>> --set-fmt-video=pixelformat=HEVC --stream-mmap --stream-out-mmap
>> --stream-from=/media/cyclists_1280x720_92frames.yuv
>> --stream-to=/tmp/cyclists_1280x720_92frames.hevc -d /dev/video1
>>
>> Commands used for GST validation:
>>
>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h264enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=/tmp/gst_cyclists_1280x720_92frames.h264
>>
>> gst-launch-1.0 -v filesrc location=/media/cyclists_1280x720_92frames.yuv !
>> rawvideoparse format=nv12 width=1280 height=720 framerate=30/1 ! v4l2h265enc
>> capture-io-mode=4 output-io-mode=4 ! filesink sync=true
>> location=/tmp/gst_cyclists_1280x720_92frames.hevc

<snip>
> 
> Thanks !
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> It still requires some sm8650 specific buffer calculations tweaks
> to support new firmwares and HEVC for encoding, but I'll post that in
> a second time. The core is functional for H264 on older firmwares.
> 
> Neil

@Bryan,

except the minor fix in #24 (v4 would be needed for it), i do not see any open
comments in this series and looks good to me to be pulled once v4 is posted with
the fix.

Regards,
Vikash


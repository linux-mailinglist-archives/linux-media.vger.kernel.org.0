Return-Path: <linux-media+bounces-31554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFFAA6C91
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 116E89C1853
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 08:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B0722A7F6;
	Fri,  2 May 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YyRkrnGf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C18828;
	Fri,  2 May 2025 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174757; cv=none; b=U6yvJE+9SkXySwONtg+uiiA4uc+1uq2pQ1qjSX+mEoPxPus+rbYffDe6ELw/eM1VD1EORSTNZ+2bqk3zBkIusAmtlll4zCgAsNkPNlwOJYFPgaHQf01866SnEbHNLT2wBrUm0MmWIntyXMA33CI9whbv/SqM/9xht9f+tbDKWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174757; c=relaxed/simple;
	bh=iZwGMO2d1exAAFKQ5vueP2INbaQZ56mGrIVQt7fyugg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bHKqRGgFHC5UM1A4ag1jbYcBM3WVAC5D4FAhj2ro/1vZXUiKIUTUpwL2apa83aXN8OYHADhUu1IQ0PE3xINPgRvz//cxlnCN6XzgqNxCaq6C8nVJbpFRr+WS3gqcu/f7n5XJJ5GKylov5FfZ8V2OCL8F1G7FY91bj5c8I0pYMVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YyRkrnGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N5VZ017442;
	Fri, 2 May 2025 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ah9ZuEPoVTMgVuPQsu1FXTeptYIDiC+SfKaC+xPh/nY=; b=YyRkrnGfg96Lytna
	mCOhOiY/sZB00YpPuFPkkhPaxjHVuHn7lDMK5zwtBZb5pIfQvVJZhBtvSJw5KXlP
	j9QK+LvwDTz1237XjCHvdS8lHzkJfi7Ubb70vgrA868VPRU5yHXTtpZtCppfYYMO
	rb4J0ydv8ccyMHY2A3/oEx4OFRV2ADeepyf6xcF3RLx4PDLRiHldOj3grVw1dWQk
	h1uGr/388L0jN1fP9jTCWUbMa104gprZOv+EaYGZNk65kgv/kcVwWfggAzTbQae+
	5g8s8fmWlybCd7og5kvjMCSC8HBpQJ+UVylRaMXi+74/0AjNguJfTNYSFq1/lTwc
	P4S7Ig==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u77n1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 08:32:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5428WGNP000352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 08:32:16 GMT
Received: from [10.50.48.177] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 01:32:06 -0700
Message-ID: <29eb97c5-b6b7-c0fe-850c-d032473f3043@quicinc.com>
Date: Fri, 2 May 2025 14:01:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 00/23] Add support for HEVC and VP9 codecs in decoder
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, <neil.armstrong@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <a8de4886-4a18-46a2-9130-9c48d7eb1f83@linaro.org>
 <f519fc86-3a38-9a32-722e-9672746ff81a@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f519fc86-3a38-9a32-722e-9672746ff81a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA2NiBTYWx0ZWRfXzdh5QNcit6Ue iQtiJhuzBj6yEv+922/gLZsgzZ9PRjXYg9obrvZ0x47VKbK+eA9c4DE1EasTaN99FKkSM3UcQe9 c9fQx09JN0xE1i3U+et96t0Q6EWgYSn4MqSFvPPWF77P9t38yXmG7niEKi/MUp3t+TDSqZ0OOpb
 K3TIx0c2jPrrG1MbT5TLXow8WzO6FnlWsXDFKX0d9KA8FSG+50S/RH6TXxZGy+OJ/ONKZYSqMX6 FitJT7Uj9BuARqQeEyjhC7qlVia+uAjMA6wFHiUuM5ELJYV9Bsi6V+mxEycurMIGVImXghAlmuW WokzpAOKGddahr7UJwR50CT6Iys1YZPxcooGyYI0Zlb8OD6rCaIQUJMxuc+0dpdsYx/GPyT/N08
 3J5pzYXPYl8weI0nrmbJzVCqO4NpS1zZF7KfTtoRpHxJbgVbgUCAGvqNoKPPGfmBg0+prGzi
X-Proofpoint-GUID: -U-raE-jh5MR3Qm8CtGTsnGeCEBI_wHL
X-Proofpoint-ORIG-GUID: -U-raE-jh5MR3Qm8CtGTsnGeCEBI_wHL
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=68148311 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=KyCqM8wHc6odBKll0ykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020066


On 5/2/2025 1:04 PM, Dikshita Agarwal wrote:
> 
> 
> On 5/2/2025 12:55 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 01/05/2025 21:13, Dikshita Agarwal wrote:
>>> Hi All,
>>>
>>> This patch series adds initial support for the HEVC(H.265) and VP9
>>> codecs in iris decoder. The objective of this work is to extend the
>>> decoder's capabilities to handle HEVC and VP9 codec streams,
>>> including necessary format handling and buffer management.
>>> In addition, the series also includes a set of fixes to address issues
>>> identified during testing of these additional codecs.
>>>
>>> These patches also address the comments and feedback received from the
>>> RFC patches previously sent. I have made the necessary improvements
>>> based on the community's suggestions.
>>>
>>> Changes in v3:
>>> - Introduced two wrappers with explicit names to handle destroy internal
>>> buffers (Nicolas)
>>> - Used sub state check instead of introducing new boolean (Vikash)
>>> - Addressed other comments (Vikash)
>>> - Reorderd patches to have all fixes patches first (Dmitry)
>>> - Link to v2:
>>> https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com
>>>
>>> Changes in v2:
>>> - Added Changes to make sure all buffers are released in session close
>>> (bryna)
>>> - Added tracking for flush responses to fix a timing issue.
>>> - Added a handling to fix timing issue in reconfig
>>> - Splitted patch 06/20 in two patches (Bryan)
>>> - Added missing fixes tag (bryan)
>>> - Updated fluster report (Nicolas)
>>> - Link to v1:
>>> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
>>>
>>> Changes sinces RFC:
>>> - Added additional fixes to address issues identified during further
>>> testing.
>>> - Moved typo fix to a seperate patch [Neil]
>>> - Reordered the patches for better logical flow and clarity [Neil,
>>> Dmitry]
>>> - Added fixes tag wherever applicable [Neil, Dmitry]
>>> - Removed the default case in the switch statement for codecs [Bryan]
>>> - Replaced if-else statements with switch-case [Bryan]
>>> - Added comments for mbpf [Bryan]
>>> - RFC:
>>> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>>
>>> This patch series depends on [1] & [2]
>>> [1]
>>> https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
>>> [2]
>>> https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/
>>>
>>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
>>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
>>> the existing H264 decoder functionality remains uneffected.
>>>
>>> Note: 1 of the fluster compliance test is fixed with firmware [3]
>>> [3]:
>>> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
>>>
>>> The result of fluster test on SM8550:
>>>   131/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>>   GStreamer-H.265-V4L2-Gst1.0.
>>>   The failing test case:
>>>   - 10 testcases failed due to unsupported 10 bit format.
>>>     - DBLK_A_MAIN10_VIXS_4
>>>     - INITQP_B_Main10_Sony_1
>>>     - TSUNEQBD_A_MAIN10_Technicolor_2
>>>     - WP_A_MAIN10_Toshiba_3
>>>     - WP_MAIN10_B_Toshiba_3
>>>     - WPP_A_ericsson_MAIN10_2
>>>     - WPP_B_ericsson_MAIN10_2
>>>     - WPP_C_ericsson_MAIN10_2
>>>     - WPP_E_ericsson_MAIN10_2
>>>     - WPP_F_ericsson_MAIN10_2
>>>   - 4 testcase failed due to unsupported resolution
>>>     - PICSIZE_A_Bossen_1
>>>     - PICSIZE_B_Bossen_1
>>>     - WPP_D_ericsson_MAIN10_2
>>>     - WPP_D_ericsson_MAIN_2
>>>   - 2 testcase failed due to CRC mismatch
>>>     - RAP_A_docomo_6
>>>     - RAP_B_Bossen_2
>>>     - BUG reported:
>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
>>>       Analysis - First few frames in this discarded by firmware and are
>>>       sent to driver with 0 filled length. Driver send such buffers to
>>>       client with timestamp 0 and payload set to 0 and
>>>       make buf state to VB2_BUF_STATE_ERROR. Such buffers should be
>>>       dropped by GST. But instead, the first frame displayed as green
>>>       frame and when a valid buffer is sent to client later with same 0
>>>       timestamp, its dropped, leading to CRC mismatch for first frame.
>>>
>>>   235/305 testcases passed while testing VP9-TEST-VECTORS with
>>>   GStreamer-VP9-V4L2-Gst1.0.
>>>   The failing test case:
>>>   - 64 testcases failed due to unsupported resolution
>>>     - vp90-2-02-size-08x08.webm
>>>     - vp90-2-02-size-08x10.webm
>>>     - vp90-2-02-size-08x16.webm
>>>     - vp90-2-02-size-08x18.webm
>>>     - vp90-2-02-size-08x32.webm
>>>     - vp90-2-02-size-08x34.webm
>>>     - vp90-2-02-size-08x64.webm
>>>     - vp90-2-02-size-08x66.webm
>>>     - vp90-2-02-size-10x08.webm
>>>     - vp90-2-02-size-10x10.webm
>>>     - vp90-2-02-size-10x16.webm
>>>     - vp90-2-02-size-10x18.webm
>>>     - vp90-2-02-size-10x32.webm
>>>     - vp90-2-02-size-10x34.webm
>>>     - vp90-2-02-size-10x64.webm
>>>     - vp90-2-02-size-10x66.webm
>>>     - vp90-2-02-size-16x08.webm
>>>     - vp90-2-02-size-16x10.webm
>>>     - vp90-2-02-size-16x16.webm
>>>     - vp90-2-02-size-16x18.webm
>>>     - vp90-2-02-size-16x32.webm
>>>     - vp90-2-02-size-16x34.webm
>>>     - vp90-2-02-size-16x64.webm
>>>     - vp90-2-02-size-16x66.webm
>>>     - vp90-2-02-size-18x08.webm
>>>     - vp90-2-02-size-18x10.webm
>>>     - vp90-2-02-size-18x16.webm
>>>     - vp90-2-02-size-18x18.webm
>>>     - vp90-2-02-size-18x32.webm
>>>     - vp90-2-02-size-18x34.webm
>>>     - vp90-2-02-size-18x64.webm
>>>     - vp90-2-02-size-18x66.webm
>>>     - vp90-2-02-size-32x08.webm
>>>     - vp90-2-02-size-32x10.webm
>>>     - vp90-2-02-size-32x16.webm
>>>     - vp90-2-02-size-32x18.webm
>>>     - vp90-2-02-size-32x32.webm
>>>     - vp90-2-02-size-32x34.webm
>>>     - vp90-2-02-size-32x64.webm
>>>     - vp90-2-02-size-32x66.webm
>>>     - vp90-2-02-size-34x08.webm
>>>     - vp90-2-02-size-34x10.webm
>>>     - vp90-2-02-size-34x16.webm
>>>     - vp90-2-02-size-34x18.webm
>>>     - vp90-2-02-size-34x32.webm
>>>     - vp90-2-02-size-34x34.webm
>>>     - vp90-2-02-size-34x64.webm
>>>     - vp90-2-02-size-34x66.webm
>>>     - vp90-2-02-size-64x08.webm
>>>     - vp90-2-02-size-64x10.webm
>>>     - vp90-2-02-size-64x16.webm
>>>     - vp90-2-02-size-64x18.webm
>>>     - vp90-2-02-size-64x32.webm
>>>     - vp90-2-02-size-64x34.webm
>>>     - vp90-2-02-size-64x64.webm
>>>     - vp90-2-02-size-64x66.webm
>>>     - vp90-2-02-size-66x08.webm
>>>     - vp90-2-02-size-66x10.webm
>>>     - vp90-2-02-size-66x16.webm
>>>     - vp90-2-02-size-66x18.webm
>>>     - vp90-2-02-size-66x32.webm
>>>     - vp90-2-02-size-66x34.webm
>>>     - vp90-2-02-size-66x64.webm
>>>     - vp90-2-02-size-66x66.webm
>>>   - 2 testcases failed due to unsupported format
>>>     - vp91-2-04-yuv422.webm
>>>     - vp91-2-04-yuv444.webm
>>>   - 1 testcase failed with CRC mismatch
>>>     - vp90-2-22-svc_1280x720_3.ivf
>>>     - Bug reported:
>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>>>   - 2 testcase failed due to unsupported resolution after sequence change
>>>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>>>   - 1 testcase failed due to unsupported stream
>>>     - vp90-2-16-intra-only.webm
>>>
>>> The result of fluster test on SM8250:
>>>   133/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>>   GStreamer-H.265-V4L2-Gst1.0.
>>>   The failing test case:
>>>   - 10 testcases failed due to unsupported 10 bit format.
>>>     - DBLK_A_MAIN10_VIXS_4
>>>     - INITQP_B_Main10_Sony_1
>>>     - TSUNEQBD_A_MAIN10_Technicolor_2
>>>     - WP_A_MAIN10_Toshiba_3
>>>     - WP_MAIN10_B_Toshiba_3
>>>     - WPP_A_ericsson_MAIN10_2
>>>     - WPP_B_ericsson_MAIN10_2
>>>     - WPP_C_ericsson_MAIN10_2
>>>     - WPP_E_ericsson_MAIN10_2
>>>     - WPP_F_ericsson_MAIN10_2
>>>   - 4 testcase failed due to unsupported resolution
>>>     - PICSIZE_A_Bossen_1
>>>     - PICSIZE_B_Bossen_1
>>>     - WPP_D_ericsson_MAIN10_2
>>>     - WPP_D_ericsson_MAIN_2
>>>
>>>   232/305 testcases passed while testing VP9-TEST-VECTORS with
>>>   GStreamer-VP9-V4L2-Gst1.0.
>>>   The failing test case:
>>>   - 64 testcases failed due to unsupported resolution
>>>     - vp90-2-02-size-08x08.webm
>>>     - vp90-2-02-size-08x10.webm
>>>     - vp90-2-02-size-08x16.webm
>>>     - vp90-2-02-size-08x18.webm
>>>     - vp90-2-02-size-08x32.webm
>>>     - vp90-2-02-size-08x34.webm
>>>     - vp90-2-02-size-08x64.webm
>>>     - vp90-2-02-size-08x66.webm
>>>     - vp90-2-02-size-10x08.webm
>>>     - vp90-2-02-size-10x10.webm
>>>     - vp90-2-02-size-10x16.webm
>>>     - vp90-2-02-size-10x18.webm
>>>     - vp90-2-02-size-10x32.webm
>>>     - vp90-2-02-size-10x34.webm
>>>     - vp90-2-02-size-10x64.webm
>>>     - vp90-2-02-size-10x66.webm
>>>     - vp90-2-02-size-16x08.webm
>>>     - vp90-2-02-size-16x10.webm
>>>     - vp90-2-02-size-16x16.webm
>>>     - vp90-2-02-size-16x18.webm
>>>     - vp90-2-02-size-16x32.webm
>>>     - vp90-2-02-size-16x34.webm
>>>     - vp90-2-02-size-16x64.webm
>>>     - vp90-2-02-size-16x66.webm
>>>     - vp90-2-02-size-18x08.webm
>>>     - vp90-2-02-size-18x10.webm
>>>     - vp90-2-02-size-18x16.webm
>>>     - vp90-2-02-size-18x18.webm
>>>     - vp90-2-02-size-18x32.webm
>>>     - vp90-2-02-size-18x34.webm
>>>     - vp90-2-02-size-18x64.webm
>>>     - vp90-2-02-size-18x66.webm
>>>     - vp90-2-02-size-32x08.webm
>>>     - vp90-2-02-size-32x10.webm
>>>     - vp90-2-02-size-32x16.webm
>>>     - vp90-2-02-size-32x18.webm
>>>     - vp90-2-02-size-32x32.webm
>>>     - vp90-2-02-size-32x34.webm
>>>     - vp90-2-02-size-32x64.webm
>>>     - vp90-2-02-size-32x66.webm
>>>     - vp90-2-02-size-34x08.webm
>>>     - vp90-2-02-size-34x10.webm
>>>     - vp90-2-02-size-34x16.webm
>>>     - vp90-2-02-size-34x18.webm
>>>     - vp90-2-02-size-34x32.webm
>>>     - vp90-2-02-size-34x34.webm
>>>     - vp90-2-02-size-34x64.webm
>>>     - vp90-2-02-size-34x66.webm
>>>     - vp90-2-02-size-64x08.webm
>>>     - vp90-2-02-size-64x10.webm
>>>     - vp90-2-02-size-64x16.webm
>>>     - vp90-2-02-size-64x18.webm
>>>     - vp90-2-02-size-64x32.webm
>>>     - vp90-2-02-size-64x34.webm
>>>     - vp90-2-02-size-64x64.webm
>>>     - vp90-2-02-size-64x66.webm
>>>     - vp90-2-02-size-66x08.webm
>>>     - vp90-2-02-size-66x10.webm
>>>     - vp90-2-02-size-66x16.webm
>>>     - vp90-2-02-size-66x18.webm
>>>     - vp90-2-02-size-66x32.webm
>>>     - vp90-2-02-size-66x34.webm
>>>     - vp90-2-02-size-66x64.webm
>>>     - vp90-2-02-size-66x66.webm
>>>   - 2 testcases failed due to unsupported format
>>>     - vp91-2-04-yuv422.webm
>>>     - vp91-2-04-yuv444.webm
>>>   - 1 testcase failed with CRC mismatch
>>>     - vp90-2-22-svc_1280x720_3.ivf
>>>     - Bug raised:
>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>>>   - 5 testcase failed due to unsupported resolution after sequence change
>>>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>>>     - vp90-2-21-resize_inter_320x240_5_1-2.webm
>>>     - vp90-2-21-resize_inter_320x240_7_1-2.webm
>>>     - vp90-2-18-resize.ivf
>>>   - 1 testcase failed with CRC mismatch
>>>     - vp90-2-16-intra-only.webm
>>>     Analysis: First few frames are marked by firmware as NO_SHOW frame.
>>>     Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>>>     Such buffers should be dropped by GST. But instead, the first frame
>>>     is being displayed and when a valid buffer is sent to client later
>>>     with same timestamp, its dropped, leading to CRC mismatch for first
>>>     frame.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>> Dikshita Agarwal (23):
>>>        media: iris: Skip destroying internal buffer if not dequeued
>>>        media: iris: Update CAPTURE format info based on OUTPUT format
>>>        media: iris: Avoid updating frame size to firmware during reconfig
>>>        media: iris: Drop port check for session property response
>>>        media: iris: Prevent HFI queue writes when core is in deinit state
>>>        media: iris: Remove deprecated property setting to firmware
>>>        media: iris: Fix missing function pointer initialization
>>>        media: iris: Fix NULL pointer dereference
>>>        media: iris: Fix typo in depth variable
>>>        media: iris: Track flush responses to prevent premature completion
>>>        media: iris: Fix buffer preparation failure during resolution change
>>>        media: iris: Add handling for corrupt and drop frames
>>>        media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled
>>> length
>>>        media: iris: Add handling for no show frames
>>>        media: iris: Improve last flag handling
>>>        media: iris: Skip flush on first sequence change
>>>        media: iris: Remove redundant buffer count check in stream off
>>>        media: iris: Add a comment to explain usage of MBPS
>>>        media: iris: Add HEVC and VP9 formats for decoder
>>>        media: iris: Add platform capabilities for HEVC and VP9 decoders
>>>        media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>>        media: iris: Add internal buffer calculation for HEVC and VP9
>>> decoders
>>>        media: iris: Add codec specific check for VP9 decoder drain handling
>>>
>>>   drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
>>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>>   .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>>>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>>>   .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>>   drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
>>>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>>>   drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
>>>   drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>>   drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397
>>> ++++++++++++++++++++-
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>>   24 files changed, 1160 insertions(+), 211 deletions(-)
>>> ---
>>> base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
>>> change-id: 20250428-qcom-iris-hevc-vp9-eb31f30c3390
>>> prerequisite-message-id:
>>> <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
>>> prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
>>> prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
>>> prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
>>> prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
>>> prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
>>> prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
>>> prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
>>> prerequisite-message-id:
>>> <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
>>> prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f
>>> prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
>>> prerequisite-patch-id: feda620f147ca14a958c92afdc85a1dc507701ac
>>> prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
>>> prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
>>>
>>> Best regards,
>>
>> HEVC & VP9 works fine on HDK8550.
>>
>> But on SM8650-QRD & SM8650-HDK while decoding HEVC, I get:
>> [   44.741670] qcom-iris aa00000.video-codec: session error received
>> 0x1000005: unknown
>> [   44.755724] qcom-iris aa00000.video-codec: session error received
>> 0x4000005: insufficient resources
>> [   44.776462] qcom-iris aa00000.video-codec: session error received
>> 0x4000005: insufficient resources
>> [   44.797179] qcom-iris aa00000.video-codec: session error received
>> 0x1000005: unknown
>> [   44.816630] qcom-iris aa00000.video-codec: session error received
>> 0x4000005: insufficient resources
>> [   44.837387] qcom-iris aa00000.video-codec: session error received
>> 0x1000005: unknown
>> [   44.856812] qcom-iris aa00000.video-codec: session error received
>> 0x4000005: insufficient resources
>> [   44.877576] qcom-iris aa00000.video-codec: session error received
>> 0x1000005: unknown
>> [   44.897000] qcom-iris aa00000.video-codec: session error received
>> 0x4000005: insufficient resources
>> [   44.917801] qcom-iris aa00000.video-codec: session error received
>> 0x1000009: unknown
>> [   44.937254] qcom-iris aa00000.video-codec: session error received
>> 0x4000004: invalid operation for current state
>> [   44.959128] qcom-iris aa00000.video-codec: session error received
>> 0x4000004: invalid operation for current state
>> [   44.981025] qcom-iris aa00000.video-codec: session error received
>> 0x1000009: unknown
>> [   45.000459] qcom-iris aa00000.video-codec: session error received
>> 0x4000004: invalid operation for current state
>> [   45.022376] qcom-iris aa00000.video-codec: session error received
>> 0x1000009: unknown
>> [   45.041816] qcom-iris aa00000.video-codec: session error received
>> 0x4000004: invalid operation for current state
>> [   45.063736] qcom-iris aa00000.video-codec: session error received
>> 0x1000009: unknown
>> [   45.083167] qcom-iris aa00000.video-codec: session error received
>> 0x4000004: invalid operation for current state
>> [   45.105459] ------------[ cut here ]------------
>> [   45.121152] WARNING: CPU: 6 PID: 573 at
>> drivers/media/common/videobuf2/videobuf2-core.c:1827
>> vb2_start_streaming+0x100/0x178 [videobuf2_common]
>> while VP9 works fine.
>>
>> Is it a firmware issue ?
>>
> Looks like resources set to firmware are not sufficient.
> I suspect, internal buffers set to firmware are less than what it requires,
> this can change for different VPUs. Pls check if there is any difference in
> internal buffer calculations between vpu3 and vpu33.
I would not recommend adding the HEVC and VP9 for 8650 unless it is functional.
Please drop the HEVC and VP9 from 8650 platform data, and once it is validated,
they can be added in a separate series.

Regards,
Vikash

> 
> Thanks,
> Dikshita
>> I've added:
>> ========================================><======================================
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index d3026b2bcb70..8c0ab00ab435 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -400,7 +400,7 @@ struct iris_platform_data sm8650_data = {
>>         .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>         .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>         .vpu_ops = &iris_vpu33_ops,
>> -       .set_preset_registers = iris_set_sm8550_preset_registers,
>> +       .set_preset_registers = iris_set_sm8650_preset_registers,
>>         .icc_tbl = sm8550_icc_table,
>>         .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>         .clk_rst_tbl = sm8650_clk_reset_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> index 75e9d572e788..9e2d23f12f75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>> @@ -10,4 +10,20 @@ static const char * const sm8650_clk_reset_table[] = {
>> "bus", "core" };
>>
>>  static const char * const sm8650_controller_reset_table[] = { "xo" };
>>
>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>> +{
>> +       writel(0x0, core->reg_base + 0xB0088);
>> +       writel(0x33332222, core->reg_base + 0x13030);
>> +       writel(0x44444444, core->reg_base + 0x13034);
>> +       writel(0x1022, core->reg_base + 0x13038);
>> +       writel(0x0, core->reg_base + 0x13040);
>> +       writel(0xFFFF, core->reg_base + 0x13048);
>> +       writel(0x33332222, core->reg_base + 0x13430);
>> +       writel(0x44444444, core->reg_base + 0x13434);
>> +       writel(0x1022, core->reg_base + 0x13438);
>> +       writel(0x0, core->reg_base + 0x13440);
>> +       writel(0xFFFF, core->reg_base + 0x13448);
>> +       writel(0x99, core->reg_base + 0xA013C);
>> +}
>> +
>>  #endif
>> ========================================><======================================
>> and no change, error still occurs with HEVC decoding.
>>
>> Thanks,
>> Neil


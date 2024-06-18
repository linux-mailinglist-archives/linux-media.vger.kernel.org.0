Return-Path: <linux-media+bounces-13530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7551B90CA62
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21BD285E86
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B95A148833;
	Tue, 18 Jun 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PKmmLshU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC59F1482FA;
	Tue, 18 Jun 2024 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718710347; cv=none; b=cJqUC7XcPoI67TDrpiBT7Da4Xy6fb9R56i7N/GaDMEtGn4LziXdzdZ80ZQi7z8HJ2lzk805mWFerqnK8qAWNjNCgAYcKf7O1ZnK3jMhOfxvdbzxEvMMmtWSZMMlD8vmY0c6O6m2tSv7uruKj+SakdziX4Rcf1itPVPY/ih69TLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718710347; c=relaxed/simple;
	bh=9/VNuOy6f41HZQkBY0gWS/PVvybaUlmHcB4BzVq3fj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X/IbtO8AyBauWC8DSJ4ILafqKCvHxmdGy1fmibPlir2pDeLeJ/nOFF/wdhrtN+cq1IvCg4x1maT7McRwpQ7XUKTPoBRmGiV6wBc7ElVJwAm27XnvOTNdtoA+YKUzSvnJbvW8ULfDeNJUbJ9yPisORyuXep7zHo5SeDjBMz+LCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PKmmLshU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IBCqbl005316;
	Tue, 18 Jun 2024 11:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLHp7/SHMGmvtgP/YBRXcnsXboqjNC1Kcw5z6pT1Kow=; b=PKmmLshUv911AkHf
	cMu8uDBhV4WpE13ywdvklDMwIqFi3UqLxitTunySvMX52+0tNqdm5CbNM6TFY/pF
	eJStiXb3HhmvchHuFESpU4DP9gE+WPjCNGcgUa54MpqjGy+/Kr6tCzeRe3FeCHZY
	bsdbOpE5COi/4SnA4JLk6rVSypiwzmGL3xLU16kMQMEJ76+tlgu3Z7SnnAT2TPaK
	yuSl4J7n3NPNDvPo3WHyzDopZOTkdljk/Ct13dWwwkgvGL4mEC4+0oTJKgsjdJIk
	RRy88aTlaIHTbnduac1VHsePpfDDFcrNbgKbe45dWZ5ysX2/gwLfkB9s6HdUpMWZ
	I7botQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu95rg2a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 11:32:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IBW4mi009390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 11:32:04 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 04:31:59 -0700
Message-ID: <15adb142-b88b-e6e1-ddc7-1b4613d1a510@quicinc.com>
Date: Tue, 18 Jun 2024 17:01:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 09/18] media: venus: Remove unused structs
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
 <20240527-cocci-flexarray-v3-9-cda09c535816@chromium.org>
Content-Language: en-US
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20240527-cocci-flexarray-v3-9-cda09c535816@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tNFSyOd5xrxEVQT2jHL6m7c7QQfraI0y
X-Proofpoint-ORIG-GUID: tNFSyOd5xrxEVQT2jHL6m7c7QQfraI0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 phishscore=0 mlxlogscore=991 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180085

Hi Ricardo,

On 5/28/2024 2:38 AM, Ricardo Ribalda wrote:
> This structures are not used, and have a single element array at the end
> of them. Remove them.
> 
> This fix the following cocci warnings:
> drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_cmds.h   | 26 -----------------
>  drivers/media/platform/qcom/venus/hfi_helper.h | 39 --------------------------
>  2 files changed, 65 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 20acd412ee7b..41f765eac4d9 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -77,14 +77,6 @@ struct hfi_sys_get_property_pkt {
>  	u32 data[1];
>  };
>  
> -struct hfi_sys_set_buffers_pkt {
> -	struct hfi_pkt_hdr hdr;
> -	u32 buffer_type;
> -	u32 buffer_size;
> -	u32 num_buffers;
> -	u32 buffer_addr[1];
> -};
> -
>  struct hfi_sys_ping_pkt {
>  	struct hfi_pkt_hdr hdr;
>  	u32 client_data;
> @@ -171,24 +163,6 @@ struct hfi_session_empty_buffer_uncompressed_plane0_pkt {
>  	u32 data[1];
>  };
>  
> -struct hfi_session_empty_buffer_uncompressed_plane1_pkt {
> -	u32 flags;
> -	u32 alloc_len;
> -	u32 filled_len;
> -	u32 offset;
> -	u32 packet_buffer2;
> -	u32 data[1];
> -};
> -
> -struct hfi_session_empty_buffer_uncompressed_plane2_pkt {
> -	u32 flags;
> -	u32 alloc_len;
> -	u32 filled_len;
> -	u32 offset;
> -	u32 packet_buffer3;
> -	u32 data[1];
> -};
> -
>  struct hfi_session_fill_buffer_pkt {
>  	struct hfi_session_hdr_pkt shdr;
>  	u32 stream_id;
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index e4c05d62cfc7..7c0edef263ae 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -759,11 +759,6 @@ struct hfi_multi_stream_3x {
>  	u32 enable;
>  };
>  
> -struct hfi_multi_view_format {
> -	u32 views;
> -	u32 view_order[1];
> -};
> -
>  #define HFI_MULTI_SLICE_OFF			0x1
>  #define HFI_MULTI_SLICE_BY_MB_COUNT		0x2
>  #define HFI_MULTI_SLICE_BY_BYTE_COUNT		0x3
> @@ -1036,11 +1031,6 @@ struct hfi_codec_supported {
>  	u32 enc_codecs;
>  };
>  
> -struct hfi_properties_supported {
> -	u32 num_properties;
> -	u32 properties[1];
> -};
> -
>  struct hfi_max_sessions_supported {
>  	u32 max_sessions;
>  };
> @@ -1083,16 +1073,6 @@ struct hfi_resource_ocmem_requirement {
>  	u32 size;
>  };
>  
> -struct hfi_resource_ocmem_requirement_info {
> -	u32 num_entries;
> -	struct hfi_resource_ocmem_requirement requirements[1];
The struct "hfi_resource_ocmem_requirement" can also be removed alongwith this.

> -};
> -
> -struct hfi_property_sys_image_version_info_type {
> -	u32 string_size;
> -	u8  str_image_version[1];
> -};
> -
>  struct hfi_codec_mask_supported {
>  	u32 codecs;
>  	u32 video_domains;
> @@ -1135,15 +1115,6 @@ struct hfi_index_extradata_config {
>  	u32 index_extra_data_id;
>  };
>  
> -struct hfi_extradata_header {
> -	u32 size;
> -	u32 version;
> -	u32 port_index;
> -	u32 type;
> -	u32 data_size;
> -	u8 data[1];
> -};
> -
>  struct hfi_batch_info {
>  	u32 input_batch_count;
>  	u32 output_batch_count;
> @@ -1234,11 +1205,6 @@ static inline void hfi_bufreq_set_count_min_host(struct hfi_buffer_requirements
>  		req->count_min = val;
>  };
>  
> -struct hfi_data_payload {
> -	u32 size;
> -	u8 data[1];
> -};
> -
>  struct hfi_enable_picture {
>  	u32 picture_type;
>  };
> @@ -1267,11 +1233,6 @@ struct hfi_buffer_alloc_mode_supported {
>  	u32 data[1];
>  };
>  
> -struct hfi_mb_error_map {
> -	u32 error_map_size;
> -	u8 error_map[1];
> -};
> -
>  struct hfi_metadata_pass_through {
>  	int enable;
>  	u32 size;
> 
Regards,
Vikash


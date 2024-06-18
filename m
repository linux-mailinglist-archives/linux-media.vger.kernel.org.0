Return-Path: <linux-media+bounces-13600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99590DBEC
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848E61F21EA3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFEB15ECE9;
	Tue, 18 Jun 2024 18:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Crfb2kcN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719447773;
	Tue, 18 Jun 2024 18:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736815; cv=none; b=G931xo6cgNxAKw6Ss5cADVPoxsESxlI+uC7Hsa2UuwDg6PwimuV3AscayM+DiNUlh67rV2iv6D4kyr2vKuXZkAyG6Bwdg2oJaPQjDXg05XHygvpOUWUOWxkacS7kI+Av2dsBHSiSDsbx1RkIpzDcHdV+E6v0+hl/UZI237UvSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736815; c=relaxed/simple;
	bh=bwoT6LMzH1JDjMzmFUxQt80KgMc/nmK7HU+qeoWR5Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o63NgsDyJ+1N77c4FNpe8scdfMPQ/e7FhPRf2dgROAuMDs19n6pBpg3ycNGETf2g72lzM+s3AU0M/xaHhoSECZgXqu31p/lQq/syQDiv35AgaUGSkHcpIdTNwhmKBEOBSfXgVfo+sLv21kVlsCG5xU9iRulRzv6uaGz1IM+eOxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Crfb2kcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45IBi8OH005389;
	Tue, 18 Jun 2024 18:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZvRQmOykjPoqtQl5DoIFiafK6zeV6NpHViuVW7Yszc=; b=Crfb2kcNM8V8AlyP
	dyY08IhUWD313JjAhcj6ykImrMY4sdgCWJ4z0ffEy0RcQCDbPEea/+AKGEkSdJIM
	hF8hX/mIwB5Ca1ibg/jKAGjXz8tUBWGiXiXzn0pRInwvJHW493hG9PRIHlAOdV9c
	trQGzAUTqlprFgqMQ2RKtSEkLkWdk6IH+PTCKkYRmIP6cfwMImOIxon97NlLg5nJ
	cLjrM2/7kc0HeyCVN8UrBo3fdHz9gKxaoUgIB1wW380HLZkix4whV83F48gDAzfQ
	txxOhHn3Br/9lJZHYy8rjufkx839BhRZQfER1DMQOVfo3hXiNs6MEnx9Zu0DnpK3
	LchaQQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu9m6s3gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 18:53:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45IIrG7p013594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 18:53:16 GMT
Received: from [10.216.29.175] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 11:53:11 -0700
Message-ID: <41cb9314-293a-a2b2-9d7e-d44a0cde78d2@quicinc.com>
Date: Wed, 19 Jun 2024 00:23:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/18] media: Fix the last set of coccinelle warnings
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek
	<michal.simek@amd.com>,
        Andy Walls <awalls@md.metrocast.net>,
        Stanimir
 Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <3f7baafb-82c7-3955-e871-687fafe8048c@quicinc.com>
 <CANiDSCszoUyZW85qaCrkkfNR73dXBrAURayWD8_jpV6Er6fOsg@mail.gmail.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CANiDSCszoUyZW85qaCrkkfNR73dXBrAURayWD8_jpV6Er6fOsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GDVLdWpMd9VoiJswGp4eXC689-JVGUrI
X-Proofpoint-ORIG-GUID: GDVLdWpMd9VoiJswGp4eXC689-JVGUrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180140

Hi Ricardo,

On 6/18/2024 6:06 PM, Ricardo Ribalda wrote:
> Hi Vikash
> 
> On Tue, 18 Jun 2024 at 14:34, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>>
>> Hi Ricardo,
>>
>> On 5/28/2024 2:38 AM, Ricardo Ribalda wrote:
>>> With this set we are done with all the cocci warning/errors.
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>> Changes in v3:
>>> - Do not rename structure fields. (Thanks Bryan)
>>> - Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org
>>>
>>> Changes in v2:
>>> - allegro: Replace hard coded 1 with a define. (Thanks Michael)
>>> - Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org
>>>
>>> ---
>>> Ricardo Ribalda (18):
>>>       media: allegro: nal-hevc: Replace array[1] with arrray[N]
>>>       media: xilinx: Refactor struct xvip_dma
>>>       media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
>>>       media: dvb-frontend/mxl5xx: Use flex array for MBIN_SEGMENT_T
>>>       media: pci: cx18: Use flex arrays for struct cx18_scb
>>>       media: siano: Refactor struct sms_msg_data
>>>       media: siano: Remove unused structures
>>>       media: siano: Use flex arrays for sms_firmware
>>>       media: venus: Remove unused structs
>>>       media: venus: Use flex array for hfi_session_release_buffer_pkt
>>>       media: venus: Refactor struct hfi_uncompressed_plane_info
>>>       media: venus: Refactor struct hfi_session_get_property_pkt
>>>       media: venus: Refactor struct hfi_uncompressed_format_supported
>>>       media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
>>>       media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
>>>       media: venus: Refactor hfi_sys_get_property_pkt
>>>       media: venus: Refactor hfi_session_fill_buffer_pkt
>>>       media: venus: Refactor hfi_buffer_alloc_mode_supported
>>>
>>>  drivers/media/common/siano/smscoreapi.c        | 10 +++---
>>>  drivers/media/common/siano/smscoreapi.h        | 18 ++---------
>>>  drivers/media/common/siano/smsdvb-main.c       |  4 +--
>>>  drivers/media/common/siano/smsendian.c         |  8 +++--
>>>  drivers/media/dvb-frontends/mxl5xx.c           |  2 +-
>>>  drivers/media/dvb-frontends/mxl5xx_defs.h      |  4 +--
>>>  drivers/media/pci/cx18/cx18-scb.h              |  2 +-
>>>  drivers/media/platform/allegro-dvt/nal-hevc.h  |  7 ++--
>>>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++---
>>>  drivers/media/platform/qcom/venus/hfi_cmds.h   | 38 ++++------------------
>>>  drivers/media/platform/qcom/venus/hfi_helper.h | 45 ++------------------------
>>>  drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
>>>  drivers/media/platform/xilinx/xilinx-dma.c     |  4 +--
>>>  drivers/media/platform/xilinx/xilinx-dma.h     |  2 +-
>>>  14 files changed, 39 insertions(+), 115 deletions(-)
>>> ---
>>> base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
>>> change-id: 20240507-cocci-flexarray-9a807a8e108e
>>>
>>> Best regards,
>>
>> Could you also mention if you have run any video usecase on any of the boards
>> with these changes ?
> 
> I have only compile tested this series. If you have access to any of
> the hardware it would be great if you could test it out :)
I have tested the series on RB5 as well as SC7180 board and looks good. I was
looking for one round of validation on db410c (having issues with my db410c setup).

Regards,
Vikash
> 
> Regards!
> 
>>
>> Regards,
>> Vikash
> 
> 
> 


Return-Path: <linux-media+bounces-14095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8679161B0
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 10:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8251F24408
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 08:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46FE148FF6;
	Tue, 25 Jun 2024 08:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HlYQVlrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD61143C67;
	Tue, 25 Jun 2024 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719305558; cv=none; b=qQOkvrywvdLvKpgKu9uzBRD63vBjXaOzxMv4ph43r7Q+BsfvSncQn4k8hW2dfLoxtdB1ysWJG54EZHzRvLJTBNhoI685DPu3BFeLz61C966X5aRAHLmjjkNJI7UwNr5O923B8/SERYeSe9YOGkY9+MZE00XvYM3n6AJxzLPcImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719305558; c=relaxed/simple;
	bh=LeL2ZBvNN6fSKmhvt3tkSZdZTbUOY78GVVrpbWdhQ2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RoPYmEm8m7c4qFSBPzYhCVq6VYJkNkCQMPxVi7MPRzdjLKlEYLMB4EAXD2pnay2VTuGDTl1lPMBVsFYEGNZs+TA2tcDhRerLiAqh8yH3BHAlizMM1LkIjRiZ6arqJcg2jt5zcNjRTVI6GOl3JxSZRjlLK/uZxV8/H+JqdgP6+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HlYQVlrM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P7l9BT001878;
	Tue, 25 Jun 2024 08:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a8mBQLoMwN6dzzV3j6uU5C/gA7BwB05rooHWBcbWMeQ=; b=HlYQVlrMdbt4sroZ
	E29rHop2UGFVgLSK6WC9KHslINWDCZj5mWKSyPRlKv9mjobm31ki3xSp4cUSJPvh
	GztNCZFKM98STHZxkYy8KV0B+Sts5uUjmMZKRPPRFHuSTe5VO/uNalV8Y6w5cYbb
	H06hyBcG9cG8f2q2YXDZ1BP9WNO7zZgbu/F3WTJzO/EXZayVo5nfgREfa/a1OvMz
	LO/6RzHDVpuVlEi1y0ObOwAtA56fAza4MXB2j/mq3I0gt/DnUMNfQydPMCFV3o2v
	KfPBKZuoBoFqMhCgIk7XQ8V5B5U49hvLWEwJ72TPGm35jFXTXk072ZSL4WX2AHnE
	tgDU2A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaexapq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 08:52:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P8qSKE017099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 08:52:28 GMT
Received: from [10.251.44.181] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 01:52:24 -0700
Message-ID: <0f04511c-033b-4d23-a6e9-e4060f97b39d@quicinc.com>
Date: Tue, 25 Jun 2024 11:52:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        kernel test robot
	<lkp@intel.com>, <rfoss@kernel.org>,
        <todor.too@gmail.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mchehab@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <hverkuil-cisco@xs4all.nl>,
        <quic_hariramp@quicinc.com>
References: <20240522154659.510-7-quic_grosikop@quicinc.com>
 <202405232059.8lLokYw2-lkp@intel.com>
 <b0785dc2-aa91-4b81-9d5b-f49bb1ab6fb6@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
In-Reply-To: <b0785dc2-aa91-4b81-9d5b-f49bb1ab6fb6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hzQ8GEiNQS1G2-FyLIbJCXhFCQ7GQky8
X-Proofpoint-GUID: hzQ8GEiNQS1G2-FyLIbJCXhFCQ7GQky8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_04,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250064

Hi Bryan,


On 6/21/2024 6:09 PM, Bryan O'Donoghue wrote:
> On 23/05/2024 13:59, kernel test robot wrote:
>> Hi Gjorgji,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on media-tree/master]
>> [also build test WARNING on linus/master next-20240523]
>> [cannot apply to v6.9]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:https://github.com/intel-lab-lkp/linux/commits/Gjorgji-Rosikopulos/media-qcom-camss-Add-per-sub-device-type-resources/20240522-235220
>> base:   git://linuxtv.org/media_tree.git master
>> patch
>> link:https://lore.kernel.org/r/20240522154659.510-7-quic_grosikop%40quicinc.com
>> patch subject: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI
>> and RX for CSID 170
>> config: arm64-defconfig
>> (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/config)
>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot<lkp@intel.com>
>> |
>> Closes:https://lore.kernel.org/oe-kbuild-all/202405232059.8lLokYw2-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/media/platform/qcom/camss/camss-csid-gen2.c: In function
>> '__csid_configure_rdi_stream':
>>>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:265:13: warning:
>>>> variable 'phy_sel' set but not used [-Wunused-but-set-variable]
>>       265 |         u32 phy_sel = 0;
>>           |             ^~~~~~~
> 
> Gjorgji.
> 
> This appears to be a dead variable now.
> 
> I don't see a need to respin this series but, could you send a
> supplementary patch to fix this up ?

Yes i will send supplementary patch for fixing this. My mistake for
ignoring this warning...

~Gjorgji


> 
> ---
> bod


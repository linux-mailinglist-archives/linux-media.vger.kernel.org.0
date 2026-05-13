Return-Path: <linux-media+bounces-61505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKxGHaHLBGp2OwIAu9opvQ
	(envelope-from <linux-media+bounces-61505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:06:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A98539914
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A9BA3115236
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A073B4EA7;
	Wed, 13 May 2026 18:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbX6Gx6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emlMBMX3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC63B27D7
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698601; cv=none; b=A1lUvCcja2ezNd1MfIo1jEpHL3Koabm1yTx/4TgzKK0ayDDkUiIZA75rHUU+UbU8MSYguSfCmCDtIMHIIP2Y1xInWueZtFlpDSmKqKv659oO1qh3Bqa9P7bPhFrvWv2rw3/GW/vqwgDpByrZSOFX1ADVyl2oYRgV0JAT7D+tuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698601; c=relaxed/simple;
	bh=eMaxSssrKXUgRzUyVQt+S4DMHw1WIfhBoG+u9IXyTH4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ska+fZh7n4bwZMjOpD6tJgLQkSdOGq0WiHFUcgasOxcwABwuz3roHkrjlgOr8HPIwBRBAl7k3HFtADVbCCHd8L/lqzMBROAUU13r87IgF355i5kKYzwIihADhisnFAEnE7gRI9AEz1xlaJOMOGJ7YPVR6mqJm7KQRQf3zbM+XRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbX6Gx6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emlMBMX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAxPn2524414
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=; b=KbX6Gx6nu+6oQDtA
	xDpcwi2Ff9kzcz/ugu9TGI9MPdfFCseOoa0iimBOnOnBNdDDadu7n+7LmhqpRRbR
	TZstSP0maQ76ss4V9H79SXzJlXkFIb1s74/iO2rvmpinZYm74lwE83egUnRjU+xD
	km35ucMcbUmA8dxolc1brOxT+I3AS8uPzjzj6+LgpUVwts/j5BoT9sSiKnsF66Al
	cNf5LVQ0Vg0Sbmif3Hiaq23ZUgrlMe4yp8KPSJpel6BBVAEqdN+DqgsPseS1NNrx
	BWc1ZOb1apjHFI6z2WzisMvFRNKVkkrBg4Uep36Z4TMepPykr8Mn6n/mm/FZC9Xc
	Z3qKtw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjgqb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:56:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8276c91addso2721304a12.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698598; x=1779303398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=;
        b=emlMBMX31eAc5b95OheHkks6BrzCd1MsLjWUN5TneRu1H7TLMGp004pkpxwND/JkG8
         LhQd3rP8nZR/bTM5+A3TliUCciZwpMjVvd4JA8Te92r+IvIeNoTokYldZSnbOKaArdwZ
         oi7yofBHAfmyCzkXpoKSZblq+AmMxE5kFovZwKXRdRkzxvXjnJWV49zXCexMkk4XDZH1
         kglN67GVfNn2s6tjQryz9mX5CY/Mds2LwoNjJT82XQm0MOS4jSGyZwR4Sxkkn2o3Mpfo
         Us5rnc1ELEPOC9RIJcK1Db6C+aY+Q07oyinPmsjT4GqQWnY5wNX77kx7/cys+9wxhEzD
         qhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698598; x=1779303398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmVE04cdLbc/FMe/QPBHI2itToGW2Cie+k5fJeV+/zM=;
        b=cC8AHtbRziIhj3Tji3UzPwZlHG8zLi+KoDhbikQj6RDs1UbswbB9OqAnFEmEfgnrwG
         Qa1UNCpj7mCgaHFQPBuGTxCKRJ+dxQJ1yzp679t50vsOMbV9lWfSvN4PGK8BsdAOSy1S
         nX1yID3fClpabHEtkRbl2VDPwOGiwljBvzNjmeX8kjV31HTFvty/3Stl7fTEceX4Yrr3
         M9F/1PuyPinc3gjGo/ArLvq6W3ZqgzpYP3j5cwAkwk/wAgLX6gxwfjjFPo2Gr03B6azQ
         bnbp8mdyAhJYhGrSPKuzSkrI3ybXfPfg8wFAqXpt/nVHwq6Q7GwLuyZxd1QrcQ94D6iz
         BARw==
X-Forwarded-Encrypted: i=1; AFNElJ9rqNSUlUi3uabQQZZtIDYG5O65vQJC7F+0PZLsYZ32XQUBC2wAy3mmJp0V/7rswNBWCbMh3JJwBaylRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4oAvjQ7rxFxoJQ26Zqro3YDNghUfrDFjw7ryHZ/pbPQJLquXV
	Eh/Mqes7pbDRtJXhBXZuYx4awlS09gZ8u0MhlJLwlbN6+kXUWjF0a3/OHdKsNtQ23OmIIjqa4du
	8QOu674PRZGMcHsS1u4PnhuNORUYo2+jAoCWM3fRBJ4PKRNrIKkC15R1H1zMxAk4xTw==
X-Gm-Gg: Acq92OEIR6t4W2YuXS8U6FrUKGU1KmLnGi9qTEAREm821How+anLCy8wOQdENeX8iIO
	FEk9mthRcKvCVn0n72n1PJMwwcArUB6R1brkiGYrH7G/t+d9zyecmZQyU1d3dWmTMUXHl91yKG3
	ztZVVUG7F3jzfA/n63IVPRfL0wPD+ILO3kO4FO5W2dEXD7VY3mMwYTDATZrwI5RWXSLMpngqNro
	G4Y8zANm6FStoUlgW0V91MVKe5ZLCmeOPO4gGBlJxxFhOwK+Bq9ifnp91IXstMSZYJwuok7oXC5
	E/XoMsa3ID5Nfc2KHt2z+fKKbdihZtYvmi8RZS8BrdHBfGkd/F+Pvnkz9VAFt1tHgLcnqR6gAn8
	0pXHh2GmlZF7Z6ubc0RlJEwb3VAuMz7l2tqqvRBQ7Yl3KopyItMNHCRGfoDPGdwk=
X-Received: by 2002:a05:6a00:1802:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83f04290545mr4615005b3a.30.1778698597871;
        Wed, 13 May 2026 11:56:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:1802:b0:835:4447:69d8 with SMTP id d2e1a72fcca58-83f04290545mr4614981b3a.30.1778698597342;
        Wed, 13 May 2026 11:56:37 -0700 (PDT)
Received: from [192.168.0.17] ([49.205.251.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm273021b3a.12.2026.05.13.11.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 11:56:36 -0700 (PDT)
Message-ID: <4fa0d2b0-7e66-5841-d4e9-9a3f4ab00576@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
 <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
 <gc7adzf63sa4g7hsnwwoylv7ddmp2bpfa556gj7r3brzsry2x3@dmmdwsfwbcat>
Content-Language: en-US
In-Reply-To: <gc7adzf63sa4g7hsnwwoylv7ddmp2bpfa556gj7r3brzsry2x3@dmmdwsfwbcat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fL4PUftOQOaAJm6bxCCHHZdYsnOVU6Zu
X-Proofpoint-ORIG-GUID: fL4PUftOQOaAJm6bxCCHHZdYsnOVU6Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX3SC4JB4khlqJ
 KC1h7xpdOFgjzb2VfSS/wnpjveBRAxIuOp2sUMf+ALZIqur3dHG6/VNvlIVgz34HT1iwRNVC+0Z
 ANMy7y6q+Ey8YTwZEbverNuyLiVZwvmiT4ScZzuGJ8/f+b9YEMJ72TM9jEMoI44SyGlztkygPjb
 znIUNXB/USodnbAf1ebBX+e6lmOBO3KGu9LRmpMtjWY8KKDkEFzchS/mz35PMtiHuNDmD3a5U6o
 JTXBmPSYHMPo/2KFEO++imxQZgftkY95IWNN+WrqwOgCPgj0RJgRAAAxs0iYxgbQdsljOZsshn/
 wvR0ma3za2nHreETRBS7Y/qN4ObZEHOgAA90X7teEELZ7P8pAUlzypPzKRfTvOOgu/uYvz4VVyk
 PQlt7VHe9RQS+DsBdMuUJnnxb/cY1hjsG46lI8/igGksKhZ5/GluJvnKGFjmgzk/si5C30qYdMW
 bUGbCtaClXXLtB0lxTw==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04c966 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=UdqKVphAFhxg2bWZaUV5ew==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D9aC6Ywv3CxFFyY1MIYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130187
X-Rspamd-Queue-Id: 10A98539914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61505-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/13/2026 7:25 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:26:49PM +0530, Vishnu Reddy wrote:
>> On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
>>>> Add iris video codec to glymur SoC, which comes with significantly
>>>> different powering up sequence than previous platforms, thus different
>>>> clocks and resets.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 118 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> index f23cf81ddb77..c47443174f97 100644
>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>> @@ -13,6 +13,7 @@
>>>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>>>  			status = "disabled";
>>>>  		};
>>>>  
>>>> +		iris: video-codec@aa00000 {
>>>> +			compatible = "qcom,glymur-iris";
>>>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>>>> +
>>>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>>>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>>>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>>>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>>>> +			clock-names = "iface",
>>>> +				      "core",
>>>> +				      "vcodec0_core",
>>>> +				      "iface1",
>>> I first wrote the comment regarding resets. But the clocks seem to have
>>> the same pattern. It's not just "iface1" clock. It's the clock for one
>>> of the cores. And there is another clock for another core. Please make
>>> that nicely named.
>> In v1, I used iface_ctrl to reflect the clock purpose, but received the
>> feedback [1] to align with the iface1 naming convention used on earlier
>> platforms.
>>
>> [1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/
> I'd also dislike the iface_ctrl, it doesn't say anything.
>
> I'd suggest having vcodec0_iface / vcodec1_iface for vcodecs and just
> iface for the core AXI clock.

These changes would also need to be reflected in the DT binding document. The
current names are carried over from earlier platform targets as legacy names,
and in v1 Krzysztof suggested [1] using an earlier series as a base and building
on top of it — so I followed the same approach.
[1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

Krzysztof, do you have any input on renaming these names?

>>>> +				      "core_freerun",
>>>> +				      "vcodec0_core_freerun",
>>>> +				      "iface2",
>>>> +				      "vcodec1_core",
>>>> +				      "vcodec1_core_freerun";
>>>> +
>>>> +			dma-coherent;
>>>> +
>>>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>>>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>> +			interconnect-names = "cpu-cfg",
>>>> +					     "video-mem";
>>>> +
>>>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +			iommus = <&apps_smmu 0x1940 0x0>,
>>>> +				 <&apps_smmu 0x1943 0x0>,
>>>> +				 <&apps_smmu 0x1944 0x0>,
>>>> +				 <&apps_smmu 0x19e0 0x0>;
>>>> +
>>>> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>>>> +
>>>> +			memory-region = <&video_mem>;
>>>> +
>>>> +			operating-points-v2 = <&iris_opp_table>;
>>>> +
>>>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>>>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>>>> +					<&rpmhpd RPMHPD_MXC>,
>>>> +					<&rpmhpd RPMHPD_MMCX>,
>>>> +					<&videocc VIDEO_CC_MVS1_GDSC>;
>>>> +			power-domain-names = "venus",
>>>> +					     "vcodec0",
>>>> +					     "mxc",
>>>> +					     "mmcx",
>>>> +					     "vcodec1";
>>>> +
>>>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>>>> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>>>> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
>>>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>>>> +			reset-names = "bus0",
>>>> +				      "bus1",
>>> The names of the resets suggest that there is single "common" reset and
>>> then one reset per each core.
>> Two resets for controller and two resets for each per vcodec core.
> The same, vcodec0_bus, vcodec1_bus, please.
>
>>>> +				      "core",
>>>> +				      "vcodec0_core",
>>>> +				      "bus2",
>>>> +				      "vcodec1_core";
>>> Are there two codecs? Or are there two cores? Your naming suggests the
>>> former case.
>> Two vcodec cores.
>>
>>>> +
>>>> +			/*
>>>> +			 * IRIS firmware is signed by vendors, only
>>>> +			 * enable on boards where the proper signed firmware
>>>> +			 * is available.
>>>> +			 */
>>>> +			status = "disabled";
>>>> +
>>>> +			iris_opp_table: opp-table {
>>>> +				compatible = "operating-points-v2";
>>>> +
>>>> +				opp-240000000 {
>>>> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>> +							<&rpmhpd_opp_low_svs>;
>>>> +				};
>>>> +
>>>> +				opp-338000000 {
>>>> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs>,
>>>> +							<&rpmhpd_opp_svs>;
>>>> +				};
>>>> +
>>>> +				opp-366000000 {
>>>> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_svs_l1>;
>>>> +				};
>>>> +
>>>> +				opp-444000000 {
>>>> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_nom>;
>>>> +				};
>>>> +
>>>> +				opp-533333334 {
>>>> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>>>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>>>> +							<&rpmhpd_opp_turbo>;
>>>> +				};
>>>> +
>>>> +				opp-655000000 {
>>>> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>>>> +					required-opps = <&rpmhpd_opp_nom>,
>>>> +							<&rpmhpd_opp_turbo_l1>;
>>>> +				};
>>>> +			};
>>>> +		};
>>>> +
>>>>  		mdss: display-subsystem@ae00000 {
>>>>  			compatible = "qcom,glymur-mdss";
>>>>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
>>>>
>>>> -- 
>>>> 2.34.1
>>>>


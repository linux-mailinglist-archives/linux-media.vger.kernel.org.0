Return-Path: <linux-media+bounces-59030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AObZDQpS4mnx4QAAu9opvQ
	(envelope-from <linux-media+bounces-59030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:30:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A641C9ED
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CA20302C5C8
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 15:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8B5335063;
	Fri, 17 Apr 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrS8oMg2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE9gv91i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA482F12D4
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439803; cv=none; b=m1KHa0/jD9Gy7luZDzoFPcAG6WZy82dO9B0SP1bo6JJVqLpfl41Xtdoo8qhpjvNimz2ljvXroBU46LOylmg4I1jZFx1Qw3MHl9qYM7A482iMeadYJWboFYNmDmjvOsj8t25PLHgd5ata37ylP8iF2A453X6Z0zu58MJBaDO9HtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439803; c=relaxed/simple;
	bh=GMFw8UwlvWUDdGB4tOpqJjYQSXWL1VCmb5a+aZUVTx0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TapjrajnjQ6gUlmW/IaG9fxMVMKXIUuARCVS5fr25zaRtFhEohbqMj9OdK+g4oNoVAUJ3rw/WATTefrr/5REYQZYvcMv+eAmLJuV+N3y+4MMx/BSXW+qZ3fGbTO+9hmQ1AuyvKvVCkSqPFxknWxfy7F5GMXqd6e5CuVTCzXqYBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CrS8oMg2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE9gv91i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9kYPv1042156
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C1RZc4rE6GguQQXCpB0wcbOaTb2Bi4UlZ5HuicWVuYU=; b=CrS8oMg2o47dY/Mv
	p8xTqV7huanvPDeI9l4dOGNQsIGBuB7WohisKEWPAlWn1k+Bpub7XgC2v3oip/u2
	Y+kAWYK1v/AlbPm3l9meCMwxNuvqH8JEboV+Y3GA6WJ+EZGJOJPutNfqVcgGZRU2
	NoarZax3g17DUT+IRq58De/KuiY+jcqie3Iz9WyK2mxt2nLjc8kEIE3v+gKMXjgM
	pelWcGLuTXnk53/HAJMrlszoxOIQI2i9QfyliHWaCfWJvTmEKztrJdMLl6RL9PE4
	bP4HKeF8LnbPhvATwhJ9s+l85Y2wOCR73ocz3xJaJn8gO5A1FjumJqhD/kAZD37P
	DcZ32g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhds65v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 15:30:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so8442925ad.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439801; x=1777044601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1RZc4rE6GguQQXCpB0wcbOaTb2Bi4UlZ5HuicWVuYU=;
        b=fE9gv91imnHg3KZ9PcV9k60SLkf/rE2SH+bqtF389cLe/Q6qkyrESOZhvblg1qiIQa
         31mk1mnVftrfW1pELV+OzCAOnPSeyf1iQzfbjuCQzLjt58nT4KudMRw2K/YxiPih8P5L
         rnT9yCCgym81/crIvNx7SmV9p989JB68wmR5PM0vh8p7ae74AEoMXNGmOFz0YLvTHj+T
         xvaoohAZMNgD2UOfU9V2bvGvbsrgVw1udNAR0TAmQ1ZxyGNNExqXuSCWXzyB6wAkb2cY
         bZ8OESKeWMAF3oxklgDYzmV546NJHQ7hZoEsG8Y+G43GyMtXE4MFDw6J4QsrKaUNhsBd
         xGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439801; x=1777044601;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1RZc4rE6GguQQXCpB0wcbOaTb2Bi4UlZ5HuicWVuYU=;
        b=SGfmnS7Wef507pRhKtSOfJ83mMTdgA2gJ87dW/KubkHg2SQoKA57+RNKvfFqY63hXH
         f/M1lOfss8bKIG6GFhfCzMEG/17nH2Wz2T/oS7nhinZKpxoV16+yFx6qKn7+7ero7uE2
         yepaGgeImGkQVbsDR4F/rlqdzqEdrwr3oIDB0ahp/7ibMbFJhBNnUJBg2kLHgWs9qPIp
         YwxMvLSAZzplm5uQNHaydJcXicbPOTB8ijalCehNgARdniLYQ7Fe3v5ZCVwHsfF/FcDX
         exaVaCbt+1V6Bb6cLQ6mL2qrltYmtt6ENGNBgejc2w7m8OJ9u8j8PxpAE0emcBwFfHSr
         tgGg==
X-Forwarded-Encrypted: i=1; AFNElJ+SlAATKONLhBIlpaLUcQ2gEjnrxkTKxS2lxWmMiCz5z8jhEK3C3eBRNMfXRmkaukOpdk6RXjtoDbTu5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKMnYZAra4GxMkHdoOmHA48gm/Hv0i186cIuMLL5GS7JZNPoUU
	YA3LiW1mXL8+6PPuVhUDGG+wuKV79p+E0JqXLFu1bV24yXheuFTgndMV1B5+C9g//dG2UPP6Tp3
	80M3kDcQeR3R63WiEvJAFkz1cqMKnuHt3vefE/r2MdTDKbI18TS2SM/WD7jTJUL9REw==
X-Gm-Gg: AeBDievKt5azqfmMCYJfP/36iXgnoMEDLc19aaAn7NDB/wZUW72D0Q3Z2ezOn7JrOCH
	c08wK5XmyfMfhGGoSzXi59vfMCoI7iM4W9YO9eceYcyX/MFRHzMzUqvuuAij1zSzhb/oiGwqQTv
	KgGKmF4MIPDmQ6M064rSpagcIisLJ8ET2JSP4GdzHiF8Eipw8UXdONqCDJd/VHgBCOuJgWixt0i
	4lZTH0IL2RBL7BaGRae2T5TWEsD+CTLFVQXEkvmhTgBKovCrb2i0q9oLAFnABKdLLBGT4hjFMeY
	MGgt/7dpI1kQV0RWbITxYLNFqQ3h4V6j8NgOaSLHq0xFI9Rewke9wNgJ/kezlyqxYt0nRM9Ct4F
	jgjgVbkuCp9HjutBAmzsJ2tS4ontYs+eqM3XALCGI8SUl18ovgJQaE6JpmhBtT31u
X-Received: by 2002:a17:902:c211:b0:2b2:d5aa:e373 with SMTP id d9443c01a7336-2b5f9ed0d19mr26411845ad.14.1776439800784;
        Fri, 17 Apr 2026 08:30:00 -0700 (PDT)
X-Received: by 2002:a17:902:c211:b0:2b2:d5aa:e373 with SMTP id d9443c01a7336-2b5f9ed0d19mr26411675ad.14.1776439800235;
        Fri, 17 Apr 2026 08:30:00 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab54c2dsm21664015ad.83.2026.04.17.08.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:29:59 -0700 (PDT)
Message-ID: <06395bd6-b3c6-fcc4-bc5e-9e4faa50fa99@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:59:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <otikvdonnfakykra57z4fingdyfm7xebw2h3lmykzk6sbk7emq@xptiwpx5lvjl>
Content-Language: en-US
In-Reply-To: <otikvdonnfakykra57z4fingdyfm7xebw2h3lmykzk6sbk7emq@xptiwpx5lvjl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lbZkfpr29SovKhJVUfBFtzguMoq81OsX
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e251f9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfXzWAKQufRhadZ
 1nEj+Uh52P0BAGeFoa+4s+KutvVBaTpnGbx7pqkcjP7rVUn/TjvjMZE7VKbbQDtVTJf9LkdqJZo
 21LY5lopU3rFDI8Uw3w3IhT72SmBTkaqQzfm33T/HW45df+lnQN4s9Kt0my5ZEFIN4YNdAVpqFs
 +XmcWl5SXM9drvUYV5OWnFrvU7NrHISHwwZ4Ff+iGPgVOC1zGWpJG91FwqeaTV/3Mydc6Tchisz
 lE0zrhdxR1sIfTtPxhIA5KBk3R8fdjwNKKtISprkrEjQGLEcmn81X4Le/95bGb5EOFz8fcQfRsF
 OrrmR5S7CfvVGUCoESNWfyGGgZzulNiD7UngVhxuAcai4AzufjyRhZaeKqYAyeVg3+4/JlltXra
 VPU1ypT3jsD+3n/jjmaNpnm5RyXswkCL/x6M2vS2dJUPTHOvguv2mVsfnGClBEHExdCOTd+OCZU
 Hl0svlGZJ2IiN5W/6cg==
X-Proofpoint-ORIG-GUID: lbZkfpr29SovKhJVUfBFtzguMoq81OsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59030-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED4A641C9ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 8:50 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
> Does this apply to Glymur only or to other platforms too?

Only Glymur firmware is currently reading this register and other 
platform firmwares are
ignoring this.

Thanks,
Vishnu Reddy.

>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
>>
>> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..bfd1e762c38e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>>   	iris_vpu_setup_ucregion_memory_map(core);
>>   
>>   	writel(ctrl_init, core->reg_base + CTRL_INIT);
>> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>>   
>>   	while (!ctrl_status && count < max_tries) {
>>   		ctrl_status = readl(core->reg_base + CTRL_STATUS);
>>
>> -- 
>> 2.34.1
>>


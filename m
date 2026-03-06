Return-Path: <linux-media+bounces-54834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEg4AkIzq2n2agEAu9opvQ
	(envelope-from <linux-media+bounces-54834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 21:04:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC65227602
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 21:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAF4530ECBE5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 20:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83A03043CF;
	Fri,  6 Mar 2026 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iolXTHdg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6yxHRs3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC42E9730
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827238; cv=none; b=HjHefFUe8IrzyNyYuVrmrdC6uS1OIDL0PLl7jrMn5wMzWvQ8OYYN0WLd+lp4fv/N1covcQPW15z/ctvluQTYhTzqykVsH33NdDz1Ear5bsH11JQThA9C4qR9Wtm08FcCljWUTXKggCwBCqLC9ahgUpdWeimP7bnUEdUwgX4sjBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827238; c=relaxed/simple;
	bh=pbGgSdTnpxkY+2PiBhxk8UbO864vHB/UN+E1PY8xpl0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G5CdTFTRb0AIOYxk5ErpnopQp3NeYXMjQZn2RFCtkbjwEm7hW/rS3KhQCV42Pzd1y01V4/p5Kabftwi5PLESLGnDFAsF9Li/0wnMyqvmjC88znCKvKQfmE9wDXBY01QVGtLfG0a00AQtaJoCnOdhliA0hGdW8GDmstR1FPc31W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iolXTHdg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6yxHRs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1kMC667845
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 20:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=; b=iolXTHdgTdjfeOyD
	ZD1CaIv9BfKoTip56GVafVAI2pWYzNyMQHZIxdjSM97kmc9JYu7asDOGkKqXqzrG
	D7A6EGYVAir86BPd0Fn5Q7raSMDJWV6EdF1O3A4hsajmSp3swGeGIcffEwCsft2n
	6APlbK6ZVqMBM6cG+C7pk5Kyz9Fnh30veQDKzcgTG1qjkwGPUVXTxVRF9i+aiQDC
	5JqWWkql44Xvn6k9P7HX6IFX1mIcJWe549u1vpndfMKiUifO7bDmCekNyqgD56xS
	T/BL//RE4mKtCpeGpFZaumI8aENVJTpmUafJihIs4uiLWyozER6TEuIr1RntP5wd
	ADUk7w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2ye0ke2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 20:00:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so9464035eec.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772827236; x=1773432036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=V6yxHRs3Tj8Ww/IWbah0sOo+gmOE4OErY9A3WvPZ7aHIPPrL9IRyJ3Jr0UMWG/NGKt
         lgWgoOE2rsm7OeSGhT0uCVoqtHDvIY7srqmiYkgwUR20Vn8yxaRk1kpBe8eGGzDX8UQJ
         rokOAyljUOxutQnAdSo2FSXZ51qHsH4/Rb1GJkaCNbSlQBh9GKTgO6rB6RNoXVCq0IUJ
         ehSNMkoA5rImlO5dzW0blXjSKLbIsooKv+TvWq/7aWWonueBfBdmiqUkvo2fM0L+qjKR
         lXQ+dMjUpNbP1XQXcVXlg1R3n1n90ma6PlqSoxIy7GgfjWgyY1IAb3Z5CstV5EHG/LEd
         dKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827236; x=1773432036;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=JRfjniDiyLIeEO270yFnleDBIpk9JrlgUJ57aXqNsel+mcZsyvLeoAyYzA3z+UmKtj
         OTsjeupbOgy6nPsxxvpJTGF8lLkjwX4G8QTJ6umOJmQakEoFR+juqPKt6zmWnfXmTxcK
         ftQBPUpYUoT+svcMEe9m+1GdUReRMGfCHfoP0exSCeRZk+DpKY0/4UnCzIUfdm+ivI+V
         KnDVPGfeslvpswgRt/Y/kf6Y2KXwduDxkAFXJisT3KDeHUDzuUsnnFo6+Ebv2PmVFBF8
         ne+wdjYhFLJDxKDMBuoY/0X26Is+617gW4ZDpjSdUzdyfiA09NO+QhfLEqweqMPT9Uc/
         IpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXKY0fhf/kGuU9tuuDuRj35mV8mPyNeRT5EyGrUd+YXG7p26+jl/DhseLaq5WVRjBy7QZlN0GsalQaBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ingCPRLBIN+TjjAyBg+8g0UAqFMOVTnHE4/CO1R5YUoMy74t
	PIvWDPZReYYVrGuknQAhE3n7eQB96DIWEwL8BZyAe4ENYkMZIocHLBscoEaLJuSiNpPTdk0vLCT
	rpvngxwXkD8UV4LfbiPrH4q8AYGTCfCQyMKZZoLmgKCs17sxNZCfjcU6QTuQi/9Uw2A==
X-Gm-Gg: ATEYQzxA7tak6XVT2BPlOsgf8M2bVWtD4weLfw3Bust36BAYb0XEasJhWm/ub4QS6Lh
	mWF92V7bwZbd4Wcj6kFBK+BMKInbVQo9rEu6q0bDSiZydq7124TxzMlGc24w5tt91XaJi9kPcvD
	9QmOuUnFMpk35r0u21j6tQZBW9gfU8tPy82S5SDP4/XvrqYcTJorhY/L2Gk3RNeKwcp12ZMQa78
	0IdqwmbuC/W+dsxW1zOIzWVctderA59REDLLWuMApFcn9iWaDWdv4R0199gBkA/WurofsjvyYVU
	CHmmpltwIAQ35aLsqThVsUG+Nq7/KjlhQScYai2K3efpgyfKhDVTXW8Ad3KnO3SdwrLjUjDBeGJ
	RkxhO2XqVnslijvd6opVlEMgzkXH16gy8JyFVYvClVBm/0JKKWlwSSEU=
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342890eec.17.1772827235513;
        Fri, 06 Mar 2026 12:00:35 -0800 (PST)
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342841eec.17.1772827234438;
        Fri, 06 Mar 2026 12:00:34 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa3fsm1798784eec.24.2026.03.06.12.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 12:00:33 -0800 (PST)
Message-ID: <973acaab-f2fa-4e2a-81ea-9d7fbebd1ca4@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:00:31 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX4WBJtEA64Fc8
 oePyPdDlxoJ2MdGf74zcjs4CnM0dHhpWQjPYMt+spsYkGihR9TLyLSmj+00bX4ZE3z2pTL2dL4B
 UTGu3Y1J8hratSR6p1R4tnhzVABLlVTZakDIxZYFyii+7hV40TQk8+nL8bOAGMAIiKH9AGxvDoq
 IeV6E4uyHE/leFXultSTdDw34E2oPK18/Q98w0DeCUH5Qj19t9tf2oPkf9EDLF+CMG4F5tonS6M
 VjlLZddbYnEY65PWmIxWWorMgOskWDw1HI7FjLDBYvuVOCD7c5W8uhmAwkDbya+XGAm29rLCSWD
 hOGhBpZ7uRGJsfPPS5U/ZYhnWXiqE5wRuPKdQC/9VNT/iStBCvDwQcsaS7seqAe5OHDeRQiu1gt
 AEpaTElf8rxTDK7Gf9nllKzprirBhdVxzNzn4yypLjGA6eqWZxJmVdr6A55Am3E3Rmgt32ymka+
 ly4CQHoOAWJhaYCi6fg==
X-Authority-Analysis: v=2.4 cv=Bt+QAIX5 c=1 sm=1 tr=0 ts=69ab3264 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Dui5BcQmNnZPeg-S7-oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: EkPeiDm3ANtRgg2rTpq_nbRYoTI6Ooh_
X-Proofpoint-ORIG-GUID: EkPeiDm3ANtRgg2rTpq_nbRYoTI6Ooh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189
X-Rspamd-Queue-Id: 9EC65227602
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-54834-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>> new file mode 100644
>> index 000000000000..dc04ff1b6be0
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_pas.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/of.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
> are you sure you are using functionalities from these header files?
> 
> I couldn't find slab.h usage quickly and also qcom_scm.h. Can you please confirm?


I scrolled this patch too fast. I can see slab.h usage, but not sure about qcom_scm.h. 


Return-Path: <linux-media+bounces-67424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gsxbHNZ9VGpWmgMAu9opvQ
	(envelope-from <linux-media+bounces-67424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:55:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8777475DC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 07:55:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EkBfB4zj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VnJBtS8+;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67424-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67424-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2024C301FD58
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA08362120;
	Mon, 13 Jul 2026 05:53:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7937C33F8BC
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:53:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922028; cv=none; b=X6oYAEIHQEEOGCP20oe+DrZx0vC2Hfbol+MawUyOHyZZEIwu2LeLnOoMYmFN64wU9B3PMhsvJL5OmgE+LT0cWJMWjUC1sUezjzmJsyY6IMOD1q2SG+jk59fomzY85hyvUU0t0TGF9+mJFJbmqlGn3KLII2TMWbJ8Jge6GAa7+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922028; c=relaxed/simple;
	bh=CBNzd4b4CuEfF2oBe8C69ZGM92jDCQh/5ebA7XMBxt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVAKjbtyFIUE2xbGdQndrkDfQjS6++oNgBU1gDVWPZcxywLunsnhjwE4rarwtR9uOwyFIoEdKLbU+j6azb0kgNpWYIGix3lxlqcPic7dxsuzcthhM8KJSRtaV4QyTu3ZccDgcQApCFkEAM4IZI7SG0ONorQSMg//mYivsySeNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkBfB4zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnJBtS8+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D39uWM298759
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=; b=EkBfB4zjYtqoVFRi
	hvVB8K+pZU4XsQmsMV4drnJZWywKygyXXUVGURFDQWOp9ZsVIL0SPGWnOmwfvqZr
	BxYgBzrQtnVpQPzB4+0kDS/AXag3ppHsSeSW5IYKj/3thaLGMGd4Df8L3lHk6eOQ
	m0m1w6mGjn1PCel7d7BNcwI6/4Q5thsL6e1SXUMmh4CUPSGkUBGkILtBQIPCG1OJ
	EYCmVC0a+A/HeFqNWW6cMELFg7mz5b5phJoDNyrqAhSD3Cldi7I71T1bAyrkVIde
	9EJ4jrW+QCLSbUQQDVcAnyN++qrN/QEeCDgQRAAWCC+Plgrh1XBsBKZQByvXVRvS
	UZfjbg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn38ysy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:53:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88da04b719so2555686a12.2
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922026; x=1784526826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=VnJBtS8+GkAOMNadEmLEgcl3yJSWk18ILbHWMhcRrrCSOv5ZdVjbJ74ufkuwRXOEp+
         KeD8tbSyUnftfHbdKtjwk+OhvCR4GHQofAfXOngOFHm36Zgyb1m3AetcXThMC6bSgDGz
         2GjLDXpxl5tpCNuf8g8idPbjnKXTaBAQTIFtyYRLaAqFN0/Zt5Q+iEyzlv7+KOb3YUcr
         BvNWV/OSE6ucuoXJn8EoVnYI1y/msri32qL273qRV92M6icDuDlMoY1+k62i/CktYZyx
         Vt0jCSqi/5zoUGOZ0wuDgpothxZbEhLJ9A7DnDPjP65BSB1inPsgS7Co43mmQLtYNsdr
         lp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922026; x=1784526826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=kB543Z2bsJ5RYyx4zgzKhf8TiRCZfurFj49zmGD9OUhUGcAPeBXL/tbWDYXY3Hldpz
         NF9Bm4P+YPp6k81Ou18RSwoBEd0GtIyq22ACxL9g5va6/lBp2UgvvWW8tBLxMV0BfJ0P
         W8yNt3bB/HaJsZMAjNggjRk1hD5ImFmJUjIZBCZTxKKJfMIQqlLQ0tOwrA19JoLhx9pI
         pf/+WzwnxH9sYaFBNyZKn4b3JLYNH5zYUKtBEBoI6PrtCNH7RboeB9yMduvc4QNDuB9W
         z3U7Sbj75L41sq1G1B6TGclkNjO4k/E0CxgPec8xp7bemNyLFDw4bOcr1PKdaAWVRn1J
         7iFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8a7werKuqc4Ltrdko6eKeqrC2u5QpOjfT/SAzbMpzB3cxpqFdJLWc9Kcmtk4Cxo1d1p/P+PA5FmRQXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMt/JjHROYO5GY/gJ1SP3ZG5mNc1rQABNLDqPaSrfDErJ7Um2D
	x8ZmNZzbuJ70Nd1y8o3/W8Kwz8hvpFEZof9EWFD1NL62vd+TEBxEsF3YaUE8ygyafMOCXZOY6+F
	k8zkxbeRxmuJ4gCNl+QNYo6XDeB421Ob6NP5HmCgrr5uAhdl+CxaTebKVVzWq67kclA==
X-Gm-Gg: AfdE7ckHER0ioqqWouQq6XppFojK2OcKzY/1DLRos+gq0WmNL2D95Tbn3kWMjauxPXA
	PpEqOb0byBzn3WGlRYLZUNP9aLNI5ocDLGNJhVJcgjhAXl/ynAgKZSbryrcsN02HFkWr3QCOpXZ
	utMmfsH3//LKBZl9eGWSaRx/lXOj0F5yAa+j942MW4j+Vki/SFxdECc9bgQXSPs9iJIbsiHJ9H1
	r2sAbj2BoP1UTmXQMQgBdv71WJq0qlBfTQ4AmsHRaBOq6cRWNd3Ltz6zsWFO197JHHYEPObR2n8
	yhQALs50bN6yD2KoMls69b4RNNSKhZg50mqIppmuNWqHIvXFtY71VPfnY6DUEHBScvvVSYmIeH7
	/d0WegliQSOff2xVSXsERZuLhdMQq3EB0wjX1C2JCKngi
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007184637.42.1783922026067;
        Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007156637.42.1783922025614;
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm66569596eec.10.2026.07.12.22.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Message-ID: <d2c537cd-081a-4a89-b74a-76b8424ae84a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:23:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Daniel J Blueman <daniel@quora.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX8Q5jrzW9B+A9
 ZKBfoLjUTdHE26h/3wCOD2sQTVS+0CyCzhD0iQ7beVuAFpyQwlXeEmVu21C45zEuh+24efv0I8e
 T4biV8JpIgeMMfNFUng7QwRRW5Hj/9SCYqYQE6aiDC15ObvHVkZkHg4RcROeBQOGGPLBZOll9UK
 wj/4bu6dYidIxAyn6VyIcjpmeqvzB+EeTnaKq3L73Nu2b3CoXSr6nF6F284E4WQCesiGFPycXBk
 mQFLK1V/+P0gzzZTt/qbU4mt9vP1c8ij1I9r1JnW68q0Nco4nwgRcTZC9axx9tGZmpiPEO6dvuh
 XORNHb/R1vn/gv2hcUn5uN/5BT2QnN1KjzDiTCcUHm54mjtUUdMHvSyj1rG5JrwoKeK87YxlOo3
 cBgcDNDi9xsXVyMZoYn3O4dQx9lHFLoVKY4UnccUUXhA07PMBNYv85Rc5W9W69b/i5HR4MldqNB
 27TLlIZukW0mCU8ynOQ==
X-Proofpoint-ORIG-GUID: gRMZgUKTj17JKKQ24FAiF7Vc6ohEcVqx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfXxROOksx0020Z
 9VB91F9T45SB8RSL6DIxQ9K60mJmiI3Nbm4f42k10L5EVspKU8Csjq7MZXKtwYneLwnQ6gfqQUF
 dUipYhO+PUGu7aEIMyS93Y8yq7ik+2c=
X-Proofpoint-GUID: gRMZgUKTj17JKKQ24FAiF7Vc6ohEcVqx
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a547d6a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=KFtyBvXnAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=CFlqIJIDefiTY8DqsWkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67424-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,ui.com:url,gitlab.freedesktop.org:url];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:daniel@quora.org,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB8777475DC


On 7/12/2026 5:21 PM, Daniel J Blueman wrote:
> On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
> ...
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> ...
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
> 
> Amazing work Vikash and team! This patch series applied on 7.2-rc2
> resolves spontaneous rebooting with parallel streams eg when opening
> https://ui.com in one or more browser tabs, resolving this platform
> usability blocker. As such, this is absolutely relevant for -stable.
> 
> Tested-by: Daniel J Blueman <daniel@quora.org>
> 

Appreciate your efforts in trying out this. Also it took a while to 
formalize the design.

Stable - Yes, but the driver handling have gone through a lot, and i am 
quite confident :( , that the series would not apply to stable.

As Bryan is suggesting, we can think of applying your suggested 
workaround to stable, and pick the sub node design to mainline and 
forward. Open for suggestions here, if anyone have anything better.

Regards,
Vikash

> Thanks again,
>    Dan



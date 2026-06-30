Return-Path: <linux-media+bounces-66055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ijZ+GtCJQ2q1agoAu9opvQ
	(envelope-from <linux-media+bounces-66055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:18:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E66E206B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:18:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kBm8GQ9H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkqZiYXo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66055-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66055-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05EC6305B713
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F993E6389;
	Tue, 30 Jun 2026 09:13:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B63E638E
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:13:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810837; cv=none; b=eWqjs5GMGbXZ1TptgmZND52nxd7A/6mMeQbm8Gj3KXPCbLW3xwmN0yOeGDF7eX8A/0PZb9cUW1adjvF2FWW4M4zXNNCKkYW2yu8+KST8crR87LHiyir87/xd9UbrqKZ3gi7qWAhG2id2/gnKwz0NgncoLxy2vHcBbs/DCrOxUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810837; c=relaxed/simple;
	bh=d+mLD1x2hxZDlUEdb98SKIREx2londngUqrUjv7sJ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft8MvQxp5OmXZZ1TLWhBhgdeSw7k9Y0uxiuRI6LNCl4alGYvXTgN6bEHIQdRKE6xnjGdoUOnA6U1OIDqRtJvDvSaFWIZBjIzwt/ANGp6HQkcwMfM7qY3rqUno8IpoHwCijkHd5QHs9erBMAbP/9zE3+4GRygMYjUTnjEKVXV5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBm8GQ9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkqZiYXo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CID21055974
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=; b=kBm8GQ9HH3km03Ef
	HsaOF6dZw3mgIp6zp0NSEyXrNfz1S87nnA32TqLfDZqW+5ZKMRORKhZY6bAPdMHN
	yU5FVOcNo7tqZqgb8Ag5h+tyAnNuZD0WOveSrNGHuyfyE49fJch6R3Qan2W/aqlm
	eOABFZ+m+X6X6jOZSaHdrrQMTcN7f7oNdJh8tmKokkzSk0Xmov0GhN49LSQXZ6GX
	BDEyJLF4ZmVyyZC5U0833HcI4JT7Zfpjj/jXdyt05hJ0FBQWpuceOl9BZ8rGQWIN
	S2rvFmAwPplMkbyKYyzszkN8cMRbD8CzkLtnnUBrNf3l7FaYIvKs7VpDzdtZR8A9
	jmO+pQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46861auj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:13:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66fe6152so9807285a.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810835; x=1783415635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=WkqZiYXoot60CmKgV/5VTXRxdYZ/Ee4oYkpVvmKYK/YqonJY3aTyWrDQLX9eTrhnEl
         oQgN5Y+FH5/Zj35/Oo+mG0INbqhFPFz6fjXwu90mgSsbbKe187Q4TXjimTIHyhzOuRKj
         MMyuB0JB6S7FwEn547UIC86LlXC7IEpzdBMPFgrzoBo17i2z13g/0DCWuQULqBVPCkU2
         yC9sMfSqe8jQagu/zwSx57ahP20M/h5LBnSHD5Y1VxaP7Tm9UyM4YVuvCNL34nYuM5ru
         r2hVH1ndiA9QZ20jXG+gxvBbNwVYThoyexe907P/JZKnKhHbJOttmGwzibgMFHV0uDe1
         Nb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810835; x=1783415635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjAH6qXKIxIZlt0DR1HdruARu0yYHLdBvO2fRNVwJK0=;
        b=QWwSwV4EE9bxIwAcZqrI575s0HQzYHRQtEuqIdojzF4Oo+cCZguw1weRP0VN+CK2L5
         fzYqq9ONpJcTx+4C94hKZA5aPE+rLAKofhEGCWqVPpp6hxAQUDPng3o61BKqzwobeFYE
         UDI36DGUkZRbYk0++00/yMUl8y5tREnlrpY6qarUpqunQhbWwxWcnYebXdiGXa+35rOe
         I/KelXmBHKD6lNifOufFwehOB01u3Bxo4QXxveQOE06/lrjtpZ3yp7GQbqj3TzpMIRIr
         9klJBa17RYXLxFLvCHN5oYOrjtqNXxMsda9h9oMQlvUOSLhQTBEsBh5OUXEWgLKeTJvA
         GqhA==
X-Forwarded-Encrypted: i=1; AFNElJ+90vsmRkbFLQG06OgOOfhaBGFLBvwJC1fxVDjikQJ4RvUjq8OEn8GhoDxjlGJm4PJ7ubbWvonk5VTbsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmMacmuteOFJTQ3CGi4WFWjCtYaQTHm/Hqf1OgiYmoyV7/RfG
	3efTn9Qk4OsQucUUpw7sjU1A0lmZD8ItnVuWWOvpOwwS/IXzq7vTAt2cLtg2Fq9bAUSiGl3CuSa
	F7bbpoE/4G2sabdXyWBezCh3XUY/V94q6oyu2eAWU2L9S2KDNQK1AB1eQDnsAdUNKpziO/rLdLA
	==
X-Gm-Gg: AfdE7cmJBY9YM4mDbUWjczyHWJcmk2OMGbZHnzN2KV1FgEOdhh+sOziQ6RicecHzIw+
	8FSNCbDH3bKr0HmW/lxCCLTcYGyuDyaT66BvIsJTijJHXoVow6G5woAyqrk1h4NfgE+36ISFU53
	ve5voG8uqCbJmgoUxJN63NvUs13r11OM+LtiuUxXVVLpxtCvY8TyH/bu32PEauVk1CXbvbumASl
	TDTLd0woXjTEEymegGajWxdBpaoqBlXP6cQlxDZwjNb81SBvBKkI1iNuwTQ8SCdyOMdcj4mfDnj
	76kf+JXnlsNWCKa84JEhIA5zeGtgUytIVjJe8akMno/rnqHoLVF+tOezVMGwyY5+f6YzSWtsY0C
	Ml69r8t32mGzQvLx311HclsaB8X7MK9aTePY=
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284172485a.0.1782810834548;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e622c0c59mr284170685a.0.1782810834107;
        Tue, 30 Jun 2026 02:13:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d16b06sm91084266b.8.2026.06.30.02.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:13:53 -0700 (PDT)
Message-ID: <62ce45b8-5ffc-47e5-8424-f1472a2fddb3@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:13:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629121750.3469292-5-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qZtl2CkorSvkawcQL1nqYnIusDsqWSpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX7eObArF4cJKY
 qTbP4/k5+O5dLvPOtaIUd36jC8+IR6VgaA0tEo5+FSKWFQtiWnmdWTGQTCCcXzDHn8PVoTZFKRu
 SqQhgq3DuBGSYlG7E0HaDSICd67SFKNFYAe9gn6Nm1lWp4TysS3JTqq1LDL6V+aUEKo+AWL6Sp+
 gf7YOjIn24Z01YA+ktl6yp/jZWQoGwPO/D+sDBIP58Ad5Txmu24LPvhWIJJmkS9QeoYY8im8oOW
 C54OtD/ezUv/gjeWxXNHpfpylARtrY9nljx7pZnzWxbWK7zcPicA5aDTCAXrN4v7TL0AkbbEiqp
 K4uqHiNC8dybNq9NCyTNo5VwgdIW+87riQSXOjHKi0fEilDM/sebafqfS7caPxTbCs6w8l4Snxb
 +WjVD1PPIKrT8GCPJP0w8fqQjsFPbFcHWn7IIHi4ZJBI8MCHAn9itT9rzCvqi1NfV+33PY3r8kN
 Kit1tWvnOF0ywD0+/1w==
X-Proofpoint-GUID: qZtl2CkorSvkawcQL1nqYnIusDsqWSpE
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a4388d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S8WVJQRO9DNrYap-pUMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MiBTYWx0ZWRfX8BK9gp0dZHL0
 vzV3uXZ8Ei9SZGbGUxCeVuUVzFTgaW0fh/uPgVL01zibI7o0XfTPbnjSrupZqULKYiiQLYLUTwD
 sVWi+eOy02dxwi7YZJnyVDYqd8ixM5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66055-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F29E66E206B

On 6/29/26 2:17 PM, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> This series targets SM8250 (Kona) platforms.
> 
> The jpeg-encoder node is described as a child node of the CAMSS block
> and is probed automatically via of_platform_populate() in camss_probe().
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> media: qcom: jpeg: restore JPEG_ENCODE_H1V1 for CAPTURE format lookup
> 
> V4L2_PIX_FMT_JPEG must remain in jpeg_encode_fmt[] with JPEG_ENCODE_H1V1
> so that jpeg_get_encode_fmt() and jpeg_get_memory_fmt() resolve correctly
> for the Write Engine (CAPTURE queue) path.
> 
> The corresponding jpeg_mcu_blocks[H1V1] entry is also restored.
> 
> V4L2_PIX_FMT_JPEG is not present in jpeg_src_formats[] so it cannot be
> set as a SOURCE format by userspace.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> 
> fixup! media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

I recommend "git config --global rebase.autoSquash true"

Konrad


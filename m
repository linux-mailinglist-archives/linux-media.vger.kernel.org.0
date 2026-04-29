Return-Path: <linux-media+bounces-59955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NLdFbbY8Wm3kgEAu9opvQ
	(envelope-from <linux-media+bounces-59955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:08:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807A492981
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 12:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49382301C90B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 10:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517B03C6600;
	Wed, 29 Apr 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7onOf2h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VvNa0T41"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71C3C9456
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457325; cv=none; b=dPqrCNfsTAEPEHThqkL87GNUyqCuYMwT7wggngxw07qfMDK9Exn4v/QKaINmMZ7JTUUgnLS7zjKhY/UWAnLvUW1KSAu5RD4qRLBWdpoTXZYBvvc5JOGAKl5tQ0VpSDfa7G6eCay9jho2DwViz0PszDE3qZdeK534HcO3KnMtvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457325; c=relaxed/simple;
	bh=c0nVUO83BjMpsHyFNoCa8XQxjosX8sBB7LbafYTH3hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qo11C0H/EHkIvXRjzIszrQx1gL8rXqNes9LQItK37fqM0Dc+dYTK9RZXM8/UyfqnadKrkew9cud6h3y/SFVTWQ84RSEkOAitvF6Yv7QTmN26TUUWgnY+hOY3HtlqsQlBkWodsS6lys0EcaMrpAIpbywbpsKfFK+pZT10bdC+jRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7onOf2h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VvNa0T41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q6AK1721209
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=; b=P7onOf2h1D13IpNH
	L34OlUz/bnLqTIshP9LSzgwxtl+hfiFWgFMu6s8HxPTCO7X50HSudleth8bWzvAv
	S/JEToTueIzRvsW2SPSmGQShu3ev5ZqXhxP+G/4NB36ViVrl4puFqeyOGGJQYFe+
	fHk3yOtSnjMpVNUug8TBUtQu08QfrQHm6Oo4NetpK/Xkv3QzanC9u1f8yZYiGOL+
	xYOn5UocEpfKdKQR4ALgXDnjJQ3d0D7BzsWm34Evc1J5zaMac3X5fg4CnA///KUo
	wZLko4w9Xn0nmUOSaNbg7dxS+o9xvLz79MkXCR99jIOTkeHuz53nqW59sBAOCdiH
	SGNjxA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua731gy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:08:42 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so827108e0c.2
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777457321; x=1778062121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=VvNa0T41RbegCLtw7oQQg4jUf5oAKWw04Mk2+uOJ3pDQFAadLMKRJpt7gAJ2OOVOWb
         +JoupW3+XKWW8wCMPvNnZYR9YBM+6A5Z2j+T95nOZkOOUhinV8crI4EI/1Z9JbX7Yh/o
         fnuiHM3cEc42GLv2M66HDvRJXHTKSLnVuwg07XHPHPebwzHN13n2D3xsPC4rFuNLzNlC
         L8jbg6vUZDyy/BUqrvZFrILh00/mpOGIQiEtoEj4Mioy6ktYM9lAH2eHfNh1tOWtfEt0
         18JyzdFLXz0ASwr3b9qJdx4t9y9rWQGlZ1MrXKEwetS+mWK1gVW2+g67Eh0NwFUvhbhj
         208Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457321; x=1778062121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5drjt+Zpuu43uDiqwq0/vUROwFSA15/U3OKxmtRl0Nc=;
        b=oUcVSPUlgaejoeg9cijmhlnitjne/wWxlfWRHzFDDaNn2T4IzgkOYmAfaSq5VOLPFI
         tOTjxazTjTgjBTxpJrM6opjVJiOg9hY5xBpQN1LLUyPf1fiP9JEPXojmyH77JPHYmcwl
         ovVGMw8dEt9HQm5tZH65QcrPbBVO2/vJ+/GGScbOJ6+9U4gIKMGZEW3uquhtvDUIUaGW
         jteoQNTpNT9kslsdmk0xQQvISBL4Kult0vYqRf+ci1Bxjf6HsiO7gTnLRLYl5jzQL7bo
         wkM7sSPzpTYkFAErLIBbI+Hkff5p5TqFO+EFdwym36TqjV6b+G4OV1VOrIF+vic9Cg75
         c57A==
X-Forwarded-Encrypted: i=1; AFNElJ+H2ETftKXBoa9aOoyHi+k98N+PXXtWbvca4rMyWsFDfwfTOGz8AYQGxs89dOBCqQNtUI873bmBpblGSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgETkB9f9pPeZXnsaEGzw5ZWUjwEFb1GlSDNRAsw8swYLwqPf
	lcuPphoDcWZgIfsNb3sK+IonWqI5J4/Ht70fWq8JvkEmIBEZGDKTOxFxwPhki3YRBIwOY9SzFhW
	/Q3dCosKXCO9riE1euhJTSgNp/0X3+0rlZqA+Nel0SS9eEAsXCwIW7mlttpChrJuJcLiTGn3Iow
	==
X-Gm-Gg: AeBDieuclnupSsMcSQxW0AUDMK/wZWz1zk3f6m2ltNIK4QgM0rLtutjGxYAlUu4e5Jk
	cDd9udA+dJ9kn+EThxsMQfFplNNR9YbgU4QkvzP7BBRaFAZDy1PMM2IFAmh16UoBaGgaZfmnSIq
	EWcCS56t6QVlmIRa/Sq6CVLoiWlnK4K8O5YctXCSdTCOJl+RIzqBYbDrcOUfwr5Xmv25NFYBr2n
	shVIi9Szk+fZitYh0ZjZ2ByU+orZhWdFp2IvYx36lJ3uHOcZ/dTQP1XXwBy1PyRYNPs/DeEQGBE
	k9oObFKMo8OBg4TACa+Mbhoulgw/YR768xMWvMWvsg8Nu7rGOj7LcndiCfggeVr88waMUpl4+dH
	pOYI5QUBmbOerJlLX0p6MIWKXAFha/EYhIEoD90Myx8ISzk1dViRKLZ3CFzkCM8lCr5FFckybhV
	csH75h0Ofm80uVDg==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322765e0c.3.1777457320817;
        Wed, 29 Apr 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1322760e0c.3.1777457320324;
        Wed, 29 Apr 2026 03:08:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98630e647sm72001466b.60.2026.04.29.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:08:39 -0700 (PDT)
Message-ID: <652bf474-a524-4391-b8d1-7c0bbdc28b4d@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera
 sensor node
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Martin Kepplinger-Novakovic <martink@posteo.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-4-mitltlatltl@gmail.com>
 <2134b8d1-70ca-4f97-afc4-bba0538f84cb@oss.qualcomm.com>
 <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6AvtaQjrwOu-QumeqYVoz6GyQPRR363JWfS8Wy-jNBkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1d8aa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3JMqosQfyPtHKn0I9G0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEwMiBTYWx0ZWRfXwLT6oh4PFlL8
 kcKiz99wagpBXjk8Ls+8l6XGYSV9L+q9S7+GwTOYqpfCiH3fhYceThL/3NYgItWts72U/NYnfM/
 G5y+f6unaqaspdJG7xQZ82ltitg0XvsZ3ZNNfLKmy9nQ7/LCiL8/sY+lay20QDpH0RAweZHmuGd
 0nVr+ntJlAoG7wTJ5MjARV42fmpi3N3U2IkaRtS/UlmVA7YTsCMwELycRj83PDmDPBXATQQjcQh
 IQilinhuWkNyqtLKb5mgvT7W4QHEcchrifEEP/3zmKDEnHlzbEZ8bvOQ+ghmcGhMEW0i+f252kX
 Q2dpbt8pfjNBkS6cGQWEaUQTWTorrNTvAL86Op31Xb/0HLp6UBpYjgwTYBtzOZTo9wt7wPa9l6L
 C6SJXD+V3VA8bxM9UHowE17LIOpXtJFBEoOX/AlUGR5crkeaKiS+LpbPs0SvBWs36Qo1pXEKyUS
 2+LntE3kJfnZQqX0E9A==
X-Proofpoint-GUID: 3amBSEP-7925olxx6Hw-PnaLQn5prvmd
X-Proofpoint-ORIG-GUID: 3amBSEP-7925olxx6Hw-PnaLQn5prvmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290102
X-Rspamd-Queue-Id: 0807A492981
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59955-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/29/26 8:36 AM, Pengyu Luo wrote:
> On Mon, Apr 27, 2026 at 9:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/25/26 12:52 PM, Pengyu Luo wrote:
>>> Hi846 is found on my Gaokun3, descripting it.
>>>
>>> Note that it seems that only Goakun3(3.0GHz) version is equipped with
>>> Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.
>>
>> Are there any other noticeable hw differences between the two variants,
>> that could warrant the DT to be split?
>>
> 
> Except for the cameras and cpu, I think no.(But I couldn't tell all
> 3.0 variants are equipped with hi846) Before camera support, this DT
> worked for both of them.

Do the ACPI tables perhaps have some sort of a hwid mechanism? Perhaps
two nodes defined for both cameras and the _STA method referencing some
object?

Konrad


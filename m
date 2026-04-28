Return-Path: <linux-media+bounces-59839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE3ULNSg8GnrWQEAu9opvQ
	(envelope-from <linux-media+bounces-59839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:58:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25992484664
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D576031CB73E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D3A3B2FFB;
	Tue, 28 Apr 2026 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQVz4BFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3brEr8j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207E3AF656
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376478; cv=pass; b=Y0dqomK0aFI7soIJdYBVuV1whRRCV8SaLGkIqXF0QhToGtZUVVe0ok7PJ3YGj6NkAY5oQQ9Y/7OpYFZkf2vsiapG0RvSITaPPRVfX7ALqeGD2DuEsXnzDjroL3nOUwNZsC7hBSCJtKyX8vrPNzAmZx3BmeiQp79y02v4NjS5yio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376478; c=relaxed/simple;
	bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=het3t6cOwACO9PxjsIwypZOf9hxGuwqmY7F+s7GrVTAw61Dcb3C/qKkfFTv909PBZEVrcsZWvH1BcmfVkvKF6kTmiLSfQak5bAzeK6pYivxRaLBvLpFwzSlci9ay+lD406UxjjTihDmT/QDEnbKZ9GIuWw6SrS1NcnoMiMaqHUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQVz4BFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3brEr8j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACOeP2928894
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=; b=jQVz4BFZpNUbhzjD
	OvQje9QZrZqkjOyy6WeWu0C+cuu3YORqh2mzv/LsUXJzHECzFBZgA04NdVSPcTjJ
	GtsmU7o84uuiNPVKV8fz0vVA6ihK8HoezmLfodwxb73Jhd7VGaOnahIqx0kBFrIn
	il6zi0r/Yk0Genz32ElVVLBlvW3i8D+o7AQLUFrzjuh6vbJ80LP3/7Imf5mC137w
	PGKUHi0j9vEInenqaK9ZEMlQRzo4dSjXKClTQldlckXulqp693yH9xbLqpX3JSQL
	5cbHfc+Va2x4TzQt42ssjmmZ4UkUbd8rm8zydJzkRw306s/PYjdpdYv+q84S1kdU
	7893Ig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh89gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so168405216d6.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777376476; cv=none;
        d=google.com; s=arc-20240605;
        b=czN/TWMl4So985V8PNo3XslLMyI1CXgl4Cw2rTL+2KdvZsPiMQ2DlF9uE9bMWJA/Pd
         ZWsgoHyEHkQzrFODEWttrZMtLlexJcR1XrU/Mll9zF7eLzV0PB5q1wNDXqedT571ksXB
         I7+3Ikf+yaJF8SsdPtHrD+rVgHuk27NUHUAC7ucqOezyM/USztdPyoF9Oka3+gBQXm1+
         e21JFrrC+XfJMIz7zHSK4zXnaFE8RwQB+w1iB67c4RRe51JUnsTNxMU4itqwy3ee12U1
         H8+Vzp11Rza5ilSVTVKBsVqx8VO6j+PfJDfzuAMHrkvXCjnHY68mATpYem58tRTN+w4V
         02TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        fh=2eXGQyZsoe9NvtFNGaV8FCPZvl1YtZVcLC3KKGL0yy8=;
        b=fRn0OTVc2rFNflbFUjC41MgTGgU/FC78I58szZNIyGDcQw8etoWrwA3/x98CucZQ/b
         clRq4c4ivCfXZQd+cD/JxpybUkIILC8/8Ecx9pq3yZ5VTTl93hLY6I8bJzn9+Hmh5hjm
         QesmHaBraHb67nHiCJb8Dbx0RGv42CC36FrVXml5VT21aWMb8CBxNqS4BV8Mway0CTBf
         9/tzAfwKhQszzqX8S6REfLeiu5mYRuxgOsxurZZwX8f32TU2q7YkpKsyOW4F8+Q2ex4M
         5eljZAaEBOcOT9TaDGJRD8R85tHuw121s2Vuf0CAVDfPTiIdrtC2LFy4mmWAdGNNq8/k
         pLwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376476; x=1777981276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=L3brEr8jtJDHyXg+Jtu0cZSN3xg3qPQygwiRybvqAYsIIgdcNuKbyizCcJLLoOwk0+
         5Gg1EtQJ+It1Ws2qXzLQITDaF+zgjQfdUNrF0JKslleGHeTdgz6O2+iRIBUf7E3+2kjB
         QF+V5L/cxZI5vnqUX9tx/7iRRx/VtiV4F64gv5xZWhGCTuVWpHygAd0X9uaBWEYHkRTI
         q3n68EOYqwwGoi9PbHqghAuP36ohkzItooHgFgMOsvUpoQ04kz4F94+LpgXpqJrTAU1T
         my5KtM7aOUZX4dB12+yXFiPP0oavt0P87EMQVOH4Is+MDYwBuuT6bAt9tdsC6UBEeGix
         5LEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376476; x=1777981276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=VOuePvJlV+MTF/8yW4Zovsd8OLGGdYhS7SWx9nneCpHVojc3G2Ip8z4EuQ+7aNBXSS
         dxKb9WSH/2W0faf6XmDJws9CrF33CJ/Mi6ZRxFyINli6ErtTpxdS/M0e3hP3nB76ShDS
         dRu+dwcJZlxXeoNyYbHGFUzYrYnFmAnMfKz8uOjtmmzjP8aPEH1yUcq19zvLr8gASFdL
         5qsJLfkEut2Ws7UavkkORDX2kuJxNrjS7GXANgCY5H6E58NoXBdiCMwfaTKT2DAhBJdw
         QHifr/8kdQMLDngi5NWSsTcSkCuE8jvNnatGki+WbkCcRmpityDhH18KsAzs3ZSMLuJw
         MYKw==
X-Forwarded-Encrypted: i=1; AFNElJ9y2menEE9WwoCWgc27UPuA3vgzxSapOEBwq4Hpv14MJZ1mP6c4T2dHOJPgJE60MOdP+FWoHkL6/eiC/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw2HVweWQasxhSTfGj0ov7CuxYwPRTDn3iTR6M4+nhNtcLQVr4
	zjtVcwm+/k7/Pl24qVPVzFTBCilKGB7FmQ2Mnv4vzEsdUq3EFowvZx1tiPFP+xUBcG+96rIHHYP
	UdV5HeZjr+eGfxzooxu6L9G/3p6HuD6IUEzdXZB9BY9HuX29LFVDXqQapq9+juC6U8MzcY2N4+7
	hOLAgdP2DRU2cXEj65ENdCaj20uiYAqA1/NO1XxU5p
X-Gm-Gg: AeBDiev2S+A2NqlMx5zozfSlRmJLzEVp1CgmUqYyCYi6QVUIDHp6r8ev8mW25p6M485
	eL6mRsSgxcTT1WxdUcw8/TtNl9Xm/9cpl+DQ0sz+LQKpMVO5V8lRalSAPYcghBZw0bWZWw9HpZ5
	uv6Ehi35tB1UYfSaRlU+B0qa2BS9Q4a9OmyB44Q6LNRIzqilzP+/sgKp4xwdgxzuie5YIjAMWse
	6clFUXutf6JSvFT9/msIGflgXWgRbMbo2Zc12ejniPa9lvhxA==
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id 6a1803df08f44-8b3e31b26bcmr42646936d6.46.1777376475426;
        Tue, 28 Apr 2026 04:41:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id
 6a1803df08f44-8b3e31b26bcmr42646256d6.46.1777376474849; Tue, 28 Apr 2026
 04:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-1-f430e7485009@oss.qualcomm.com> <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
In-Reply-To: <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:41:04 +0200
X-Gm-Features: AVHnY4I30PHO3JaiGQw02eVXNc-m3WyF_MeHdddg6z1v0u-m38ixLGWueeKRES0
Message-ID: <CAFEp6-3Cx_6xa0e452220wfvUwcQvwEy6vtnBnwTpqTvC+HptQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] media: qcom: camss: Add support to populate sub-devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfXzMQZ57X6Hu7y
 ytzfvWJWL/ThO4nQI2fCiAR8oSuh537ZR9XZm+0ifm7FynrKKYZ5Tjvp0np8u8ZVdu4aFgftxab
 xb2ASL+fQmBmyPDNHNrxXWe6WF9ShvdihJ2etWcHUzi7qSa4qipZmGSwCMnVyg7Qcm9Tk2pgFj1
 kofs0cBGYtSL5sYwNRZkTB9ahpFjlQhqqlb0zwayfAwRCIXSCdwbspPH0qR9ZrHI72H3Ddj7FWY
 g/WCR8x5YbInfGGpGBuxVnqZ4ZAdubTscsTA1AAvMY/DKN4eCceO8FvQaeJBWWBGw2wWKMAgw5v
 y1hUOlz8eQouHR9R/EWiJmRugRtK9nBZHkZDELPsC4t9sQnLyGh1SJChZ6xbEFE5MU868eVdpid
 2IhA5gsUqeB09OJfyu0suJiaF1rHME5g93G2NKGuQbB0O4Rfx/2JQCwqlJvcI8lHFQa1N4+Mzi9
 0f/J/yp3bCGvrl+aytg==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f09cdc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Q8RtUPtQJvjqpABxVQUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1bvFGpM5AviWB6H4A0ihCXTIjZI0fazn
X-Proofpoint-GUID: 1bvFGpM5AviWB6H4A0ihCXTIjZI0fazn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280107
X-Rspamd-Queue-Id: 25992484664
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59839-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim]

On Tue, Apr 28, 2026 at 8:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/04/2026 14:43, Loic Poulain wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> There are no children in DTS and ABI does not allow them, so this is not
> really correct or you just missed proper order - bindings describing the
> ABI changes should be always before the actual change implementing it.

Right, this is a dependency that I cherry-picked from a previous
Bryan=E2=80=99s series. I will make sure to place it correctly, or explicit=
ly
document the series dependency in the next revision.


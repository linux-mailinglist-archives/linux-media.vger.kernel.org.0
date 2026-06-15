Return-Path: <linux-media+bounces-64896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FZwaETy6L2rXFAUAu9opvQ
	(envelope-from <linux-media+bounces-64896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:39:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C286849FF
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eFT1Hah9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HSt83ZGF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64896-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64896-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F3923045ECA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A5D3D3D08;
	Mon, 15 Jun 2026 08:34:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AE37FF71
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512494; cv=none; b=JQhSDi3H29FRZdLQrDfKXdMDjjuL7SybGP6ocOmuAu8EHrV9/cW+EngsVce10ibBU1+zktyVveGYs4cAhQcUkpp6xowKE1Nd7ZWMF2eyHnc5QL06HhHJ+4fgLOYht9k8Hn8AewQLJf9SJN2O7GJySH547Qny//MadKvas+hx0+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512494; c=relaxed/simple;
	bh=X503i/Mth0eTflp/hBfEJ8uVr06pRZPumlIjapac8+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKjRFCJZ1VB1OuLBPKRhs9+LI7HgH5+bE4Buafuu2B2VsN/Hz1BgA74sEjaLD/oVoR8z8aPVKzNbnGVtRjQwhtyV0yd8CwBgNmQF1nbNUDxXUZ9eaJLIsuLpdj1T7sqwhrXZ+FM/oEgMskGCou84l2B3pCMW0E0ge0EvWsTkVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFT1Hah9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSt83ZGF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IqDd1835951
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=; b=eFT1Hah9jS0fxap1
	ii3Npy85ddvflo+0FlYx9VL+jciwm3Ipl8rmTG6lxVtZuJ5c4SHpDQBGLIZPGZKe
	NzYyzuxdTZFMWF5dqaU9u+/IjAyfh3OCwtkr/Dy4/RO7KTTe9qsiq/ekjtQkBPoI
	te+Qbs7cwjQFhxzAabgVzK6LSwEGXaHVDjd9y3hXxMnG+tm9uR9NjvaB45nH+Pdu
	JFn5dgO99t6zilMJpriwTYInaMmMIyUX+h1Nq/rrAqJbPmm/ZszUoRwM75ax6Dzn
	G8IYFhp+kUMw/Ul/2mvtv7Zo2G1/psThhLc8YJGvHiq/YkITXXdMOXmLKnumnodA
	AdEueg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryffpdn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32f4b1bso31226045ad.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512485; x=1782117285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=HSt83ZGF6MZSLGL/9lybb0QrJcDsxkkVNE9s2WXuuEHgoFVpizkswmCFBt75baIC38
         e0a7zZvl5B3y0XojsRF2h8CDW2Vmn0pvNcUkPkyeDRBt5WjzlA5egHB+9r1l0H4K4SyA
         VVxk3BJ/DnBL9/ErbtS86fv08hss9Qs/m1cG4cz3CEeRod2p4bwi3cs31LTDbng4HjmJ
         6qBQ/kvnM7bpBm9s96JJBdzg/kO0T/SjBX71j9LtnOvJHiFP96MK08m1BgWgpf/zB3j4
         6rT9dsJCONiJ8rJa2MMLRZKKOODbxs5FtytfhnHwz4sZhXSH0lX3ztDYw0Ehl8DLkYrk
         kFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512485; x=1782117285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ogg4+x3ABUq0tZ1UsQhDlNpMjMUYFLtgDBX0fb8zT00=;
        b=Xw27im6Jkz1PnpkxR+MMCH9jWl/d6W6MsJN8AkCsW3Sf0omwtHaxtX1DNiZWI0HtXz
         ZmMrkAP/11283MKOe7EHtSJqjqHmgXMQmEikrHM8Z+gxUPxr8DlBuJDY1O4eYtC+Z/d6
         FjRQWVH2ayjWyWyygxSyUz2DvQmR6OeWamzrA2vUKSOqH9TxxhrkOB+x6FvJCyMsmJq8
         AiTBjqZTa43CwTL66rvNO4gnExKcLShO3X33LAObTbKJmI5Y32N6PN5ZWN5oKvw0mJfN
         BNZuyjM/jywpwau5jkzkm5h5BGJvoJxOCLY6zxmcNndWBetVijwYMLpiYYqQtm3wLAib
         W6Yw==
X-Forwarded-Encrypted: i=1; AFNElJ96HMfWd/MmFiHTWSGRDtwqmxgaNPOpVXOWOzVZx9uQTbeEkwxb2by5NHQ8p9x/HD+mbHYcVUsm/t5rSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/pOhXhx8pCKyWmlYGslJnlxgoe2O31qXj/ZY2wZn7taK4ztI
	3n/lUDfebiuBuwg/Sfglb8/KRPwlwzVJdgurtPcH2JsLOYBamB7Q9+J76c81n3AFyg1bR3IuRxP
	451KM4YFicg6YyK3knMOfbxQUgKMTELWakCG7P4fAw0KrJqMtktUbFZunC88eIBN1/Q==
X-Gm-Gg: Acq92OFFUnyPjNHCFCsMo6Vg+pxPaR83Axqc+vOqfWJ8SMlyq/pkeDCniRhyve6nhed
	nk4gPbPMXERzBKelrOK9O6GG9vAUJLkonqj/TRFTWA8gq875btUCCacwEYXNnZ6C0t6HVS0Ak0w
	jFMhGUkNrWQzoeSVBg29RRYP61cHqNomDh5hLsEi05SuESyb/tdYyf518sG2JiX0aoqJAFoujPq
	Hrk67orq1xH0smp5iSyYUwz30+bjIOgoy6wpiZwoD7v0rMAVfLI0b2SWq/kboxHopAm9rB1Tu+s
	n11bRb7PW+uQT5dpE3S8JGnsx/ElqAwouliavsvpVu71ijmqjfn6k3sjXeudZ3dRE/S20vaUOFd
	95PIp10IG01HUqyITIxWuevu7yDTMs2I9ruoPYbEkojC8qPZeNYOm
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104881365ad.17.1781512484603;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c6641e180cmr104880975ad.17.1781512484003;
        Mon, 15 Jun 2026 01:34:44 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:43 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:58 +0530
Subject: [PATCH v4 5/6] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-5-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3728;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=X503i/Mth0eTflp/hBfEJ8uVr06pRZPumlIjapac8+M=;
 b=HSVeJrzwoJPjIg0lth7jjpJ+yu4+T0MG7EJiH0F6k4OQXUeBwaFIwd8XaW3Cnbau3JrX0ZOPL
 Ht73cPtScrRDrVj0aPkrpIAiYqSkDJ/yT3aq2UJ47aF55jxuO/1Mha3
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=HuxG3UTS c=1 sm=1 tr=0 ts=6a2fb925 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7MgxBrbZEa1vrkmAVAMMbW3cOOCz93KN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX0z4kr/FvJZZ9
 Kv2RjyY39HYpOLChoYjeRnrD6ubXqrT2ryYEvsAP4oVUGjeqXRMgtEYHGSikJ93DRwnKiBf3AYq
 BIqVXj2WZ8g7BSVE3kPas6wqN4k90Qc=
X-Proofpoint-GUID: 7MgxBrbZEa1vrkmAVAMMbW3cOOCz93KN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5BCAZEQG8n4l
 PDIcz8rlA6Z5TxEdpaCuV971iY2LRS9zGZquW3460+OQxWr1Vuten5HoC1GprBpvVfS30l2Q7gk
 nNqae1ZHXl/G66UVzxW1LO18CdqMf7WlwtLiALhZ1ezcPJtxkYFUOr8eAOz92ayNQCE1ngpjxGW
 Dmw3BKZ+m1muzknq5wbMV1xexAKnpXaBHjWqFDawDCeuHoNlcijMTbxW/sbWDSjxGeM8x0tj2Sc
 KdIN7IZeYyMNAZIcIhTTvLtbzUeY05Ey23SXcMrUXLvCJCeaw90QToiz+w4TYw6me4EY/trVct0
 VIkXMgg7YjCNK+72UrXlrCRBBntquAAEs7/gcgf9sDGlmauWa+8DHMsBqZFx8DbRveoV4CN/JQr
 D81opkTHO1/NyOT76idekOT3pljOxxRFs0ZIBTIQTyokxW8GcNrQKvw9vaW0j5Va9aosUl+Rku1
 XZ6pTOOwgbiNpM/6/bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64896-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C286849FF

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 79 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a9e9d829fb962386b3975f345ec006504607130a..76b8f144983827f4905a72935e8d5291a227dc97 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..3a481d972cd27a2a324d96d8f47c161e11ea54f3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1



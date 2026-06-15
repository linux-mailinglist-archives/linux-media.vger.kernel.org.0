Return-Path: <linux-media+bounces-64893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U+biGla5L2qXFAUAu9opvQ
	(envelope-from <linux-media+bounces-64893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:35:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21183684961
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:35:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h36EGtv8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i2Uhq0ch;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64893-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64893-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2769301876F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79FD3A8734;
	Mon, 15 Jun 2026 08:34:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206443939BF
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512469; cv=none; b=jc4fLIZBn8R2dAEgQviZbSf+56eN9oYqXKWBfxMFx4JjbRHyNeeWqLjLytSjJaaBSSGHON5Y5ins1KNNi7kLsMiDaKScJRAzJ/6u+Yk6+DM/eqOE3eAq9yZgyLPfCy17IDIoWJpV31pItxSREIb8IVWUh/YEtCnQ9EXy4MBQZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512469; c=relaxed/simple;
	bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IosNE3BXDBKICjgrVT8MlhmqGcWSgJQqxmd624/6jRIQw8THKPJQEjTYdEvG98TRaTS1fBhLTlgdwW0VRI/IyJf6cFRevDbgWD0hJ/oGtJ3JLeXLdMTG6Hgc3qZ/sr5I5+AZRt0Ph4Y3qu5bZuy/c2aE0rvEWCG4A3flQDIstKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h36EGtv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2Uhq0ch; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J1XY3327575
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=h36EGtv8Vx0KQuJD
	PZ5IC27QV9rqS8hOCPuzi8adZ9hlXABwztMwbiGFplsxterTTY7eQ9lrG0sD1dp7
	n+Nb3P8885TdV+y/WbWvc+xAxXhjWJhnl4KHCez6JNidjz7vDBGdvxgBQalXT31C
	l/tIVgLFYBpzk/dvZ8pm6lDxUV7lCH1v5ZXev4tmJ8sWt1tslZQM0Iw8fbUuNMNA
	GxVXsBATQlZISgrdVJ5qLn9FeM9IbxcE+CS+NcKkbNz9CCUtHctHDXys2ei369PT
	H2jjniQDp7moJKM1vfTBHA2+2Pf8TqUhR6HGlTNoGXPGay/i2cMPgSRh6K+WVb0B
	GeiRhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cgp9r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:34:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso3609187a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512463; x=1782117263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=i2Uhq0chMk0h9AMS9qnzJiROohcSwR0ZE61sVZFx656nLlK/vl8WVz955jR9BrU6iC
         E88zdRtTlw0RAmmcLp4dRTILtgfFRbThf/TNXrQxeZ6r7WonMue49RCmHRX8Euezumw7
         LTg/uwTY1Qnzrd99Ox7aOAUQzqimrJhJmUiPZGbsTeJfnEzLmzc97Yax4O4PJpK80+KM
         W2uInPhNRfuQt6lhWxn334bkQtm2c0/z+E+kmMhwg1ki3OfsvqOwouE2+75cA0aN5J70
         8PjBUjqIdDi+93CH0SHkD/3YILE72URPESRfP1bTYySo/HaSdDXwkbOE49u29EVHbR8u
         iEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512463; x=1782117263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=nTRNMDXoQNxjK/VnGBfj1AVybbaVVYXsbcjxtZ/HwQ8jOPxmkSYgQv43iHT8zQFiWS
         CEEsE0X5l5Kv3pUkHjn0r+qFFepxb0KZ/EsnWn9aziRT6TQ4ChxX6wFhkYhu5/ww8jyb
         IfSi4lNh96CTwXmfwEZ7jCh0/wttK+4aYajxU2TF8oDoXZwM2Zzo6UJt1PmFm6fPEaHB
         fjj5kwDHamZn2kiwKnuiWr5zkF+1WBKVhooghzQ+Kg3a3IC3eAfSKL+SM+UYt//ukylx
         ULGRv9wvmLcXIdSDy3ZlFM94NZHeB4UkdPVQVTCM00JZMjz2ZZULAsl7ZOQ+Pam0OnRT
         ZtHA==
X-Forwarded-Encrypted: i=1; AFNElJ9uJ5/LmfX/xf9v8+o4maNsfDNO8O+xx1pi/jDPc8/rL7QExtEYD4nrfSBxps5EaDPtclvx497tg/7OZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvaDPU3Xk/ua3mNd3HDUsQkNoGGViLkaPdqC1mKYXy+wuvKiD
	NvKW+EXtAH0bfeWEtut/MuZspLNTeHVcQzKFO3rH1sQbV/UfO9985/DoNMEDxfGP0ruKRCbBy3Y
	2ZLl0g39QTRBsoc6VuLsrXjmQZIadRrXJ8u/LQ4SumCKxa8WVfRAoPA8DjFSD4c7Fkg==
X-Gm-Gg: Acq92OFf93nN9Oswb75u5DiJo3Ot7vHfqkfYEzOUBJ3FeixZ8KcIjFRaRX4x84k5HFr
	fPy2i68BV1IAYsW81L28onb2p/rRHdkLQGPhfi2lkUtLJ2utr8Qh4TtzDyWkJLZhErK6d1h6Fcm
	HSHUGcKIStVtJl8eJKCO284brv9wBqVC49hS6G3ZuJ9n1HsP0dzrb3yuCSI9Olrq9Kn8gHtEA3V
	TS2EizfIW039aWp6hVE+4CVpLPzz5vZ6uFT4WggB+HgkwkFtgkurDBQog3OnbqI/YgTkyPfK5pl
	cEdJjbGCiC6WL3pkcQPRF2KGcUQFc1mV41jQ4rfbDSacDZE8b011XOsYIPhThn5jhDKV6smt3yi
	fFqMrOptQ019W7tUl8ysTFPqQER5JCT4Kl3aK6SVyP9I6mysMMzSe
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314985ad.24.1781512462598;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314725ad.24.1781512462126;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:21 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:55 +0530
Subject: [PATCH v4 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-2-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=S+g3AVCbFZadW0cTR3VKyGr/WyTEp+9L5TnSb1M6ihwOPpO9a5hWKeZBoHRpo14yQvnGDguUA
 sDaldeY7rINBJKtG0qa3JAYOz+R0/fS0KO+jnsBqbCg8PVZFhry85FL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: WIo712lTHkahpGi9Ix2D4DCFqF5S6Rkp
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2fb90f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WIo712lTHkahpGi9Ix2D4DCFqF5S6Rkp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxEz8uX8hSV2z
 mzD3ZiZgj9WEN+o5s86d9ofXGaFWuRs19/6ekd9aNFNU3mVkzPtpRtHPQeP0OMQVhWS8sPW4Xx9
 nl8q44w7C4LLv+Eieur/I2Kzzc8nB+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX5X1qUYV9R6hU
 0Ng0uiRfFKVAqACq9/RHJ2zDPOTIOr6e5d7zR5qXSOlFLrXOperPfVi5wvPwjI26ReC95971bSD
 FIs9TMaZmVYfaSITJZ0hU6dEoIz8Kg6gi3Sd3ZO81FBoKPLtgLr6T3pfYbt4tPJu7OJygQaQs9d
 X6AHKBZGSU181UQ5MeTxhBI3QUtCDcvqdTn39QKHzrmcM0rNwR0spj0e7/mtj9FV7Dulx8TsT6I
 YTb6QApGRElVEa1FYiBMAyAjT9V7ETQ/RajY1jKJbvkisjoy0gzROrwL2touHavmYTxA/vLeDjX
 e/e0/blnj/hrSzg4r4o1JTVLmoO0StvPDE9OZM6/Vip9vfA2WNcYaVJmGTPSPW0tJcZL1B2L26x
 PH+c3Hw0OSm0ixt6M42Sh5DcEVRFs/qbAjn6dadc5aXyhrHclE4ACWorJJPcSq+1XfU3GPwHLoU
 ZzkyJKrDxswskNlUpGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64893-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 21183684961

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1



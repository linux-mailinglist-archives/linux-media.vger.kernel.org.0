Return-Path: <linux-media+bounces-64877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LdjONJumL2pfEAUAu9opvQ
	(envelope-from <linux-media+bounces-64877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:15:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38682684198
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:15:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gV3FlwnS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GbGWaDm9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64877-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64877-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22407303C014
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279F63BBFD5;
	Mon, 15 Jun 2026 07:13:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596253BBFB3
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507584; cv=none; b=filbmjPA+KSLI1wml2NblA6HfqCFBqJV5UkQWf7aK54kDPewABF2TLDxqe89mG7U3wVCW6KL7YV5DVk/xFizK/Ed9Pjxfyv7qwySi3ycBwBjwJyoj/xb9ndB3HVP/LB+cdMRgWeSXIT+z++7ye8eoLJAQcYE8NdUNXgFOgU31Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507584; c=relaxed/simple;
	bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCWYPQjwo9SBLKPogdcYypBsEdbw+hhqkaj0wpR2iNdd9AK5oZe45Z1ORulUIDCVhP4M0t17pKyY+wLV+KdP4CrpIzQBKW2fC+efZT34jWLCDuSba635gllQRmO/ksBr9VevW7D3N91Kbnq8KeFMoO6eXPPg4yqBYNtqVQ1af/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gV3FlwnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbGWaDm9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KchI3910894
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=; b=gV3FlwnS+mMU1ZWv
	NefsMOoZi0YvbHjNcmXp1y00j8ErfHcA+NDQ/FbqApJ0LQpSJjVRzVh8e1HDPquL
	OZHwWJ9/E6J31dvmgifx76e2BDyOtAwm+C9AWjujwPNfpN5+bZqgGId7JDZFfQao
	VYg3bDcoktnId+//Lc6vusY6XTiIkAc/6LB+bzry3tClfHU5Rawmg99XCIDrrAP4
	Rn6Swe0so34bQzfsMMvuIQWGFi5H2ND2gkZAFmpR5aDkSetiw9lBlNf1PpcLc7oV
	a0PT1JAKz+3Rs/2lOBPmzN3XN/Pk+pAnJf7Vse+killgJ54VQpl8ikNMwtqoTVmH
	C2pTfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so3302229a91.3
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507581; x=1782112381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=GbGWaDm9eK7wcCd3hthjSm9fG2k/JKN1Pbgfq//QlGLQTJsHQvXIih8e1cuIzuF9+1
         /683BKgPtMZaPuBAcDhtt6zqtqOUvmAUoNKO7UQVKRK2lU4dbVLZHCOq/ekQUcohaVUR
         CZX+7gRxiLuArfKa3eLMHB5hpvd9eRcjmRgi+6BRcsA88h2c2J0mS0FXIdyxXlfm8uH6
         x/dkUOBHvgTnlZftPYWX6AF8pE8q+QLRacdDQ84Bpep0Nms+1xCWd9f/TAU/1eEqGw/D
         RKlzSYE2BRG6dAy3mvZLgEIWVrmsHeObw/TJTCUNFDmURzojCLfTve8xlu7qSdtvWXR0
         O+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507581; x=1782112381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+V1+Dvn3cDeatOqG+XJiqlXl0JvB6Pajl2d8bHbdmnE=;
        b=rkLSS6K61jgmqclUtoEi320n7TlI07/jTdTlgSp08HR+Ra//w2e60pIV7EJ1w3+o5u
         scfjn+nhclTRSzMl2grp/egpjmCkHBIUSO+lP4GLCCuR0yhf68IHzUOTxQtNbfdeh97y
         he9NG4pOr83RagYGsdW6GTUvcwMkwkM6WzMfo6tHYSPJz0XBW7eB2MNHiRcJQ/LqBDhE
         VyQGZPwNDwJHaVo3ZeZZwZCMaFZ/OS6Q725Vyg6krGbyKSflQFZMyXr+SpB3t++TUS+v
         RPblWxvRmx+ZT+eQQso7ycxYVWW1nvfkr8Dbx++aoxNHpD4X2JTz1EupTR08H2oi5IIB
         4sOw==
X-Forwarded-Encrypted: i=1; AFNElJ8kPXCx/0UK/mKaIlP5aUbkUmwTvTKttJjCpovC9sUPdsGcwdu5It4ttX9a+1zkh8pikqOFvjTPnZ02dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMRAOTo16HTk5ok8Rlk3ru+cOFP9ZKUQYz6aU0hHeM9pwTGV4
	WUQ0A//Nf0gJodzlM3ZL2wLfX2D2fLUMLoVG+DcMnmjQeYMAS3FbOXafJdtoeoa7vSwRe7tMxen
	z98HaS3RR4nBuZ6aeZklOehPzpGWGiG9f07tiCQqV1cOvFRmjQN/VLeSMgmIiahlMvA==
X-Gm-Gg: Acq92OEertKptSdvc3a5TNoeah2Tkb/e9n4L5cWv5Yt84eMRjDI7+YmHuj8C+Pf+NIh
	30uo4JETo/tkZJJXDPmKz30BA0H6r8QFMrtE3dbdEF7hSmgq2ImSNvwo5Mv1c6h+ts8DAcUDTiI
	t30elV5wtcZr0mOyRrWPKAKx1bFRNnWbr/JK13SeDaj/2kbUZ0+qZSer+yhnU8y8qH3ANangq5o
	j1Lo770rz+CROmgMf4JVjQ/Q5LSWLmvaNlS/m3BraW3Lm8NPwGHmDKoyM97Jk6Spds/sNPBWemx
	dPeZDz9+H1CHJQM5kEgSkwmeFftaJIxZ6XXdecjh4WuqDKtAa+9TNgEaUrTdaGDBQI33tiiZkoC
	6xlAW3XjCVxdeSPUgg7yJgp1tiN6ANajrjBw+OM+/Mb0SK20YnsKq
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768851a91.7.1781507581229;
        Mon, 15 Jun 2026 00:13:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37c2bc6534fmr9768837a91.7.1781507580798;
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:00 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:14 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-3-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=2667;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dD0P2j8Nr28ZbmLTZrfr3Iys+tRkC7smVwGCVx5OZpM=;
 b=MiksEv4dAsytiqn9yWeQj/J3Y6aswxj9dbZTN7SqEhZdVeiE76C0aTVUL4+2Glq3iaO6ojOUy
 YlvQyqQKU1MD6aGx2ZSjsRezHKfmluPRHuZvZS53PBxBi78BTr66Oqw
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX/BEMifw+G3Jr
 N+0n+fip9VlLinpzTA2i2tD9vl1NK+0F6DGJ3m4lYnQpeJDJ9K6lP7EDc7iXF7ilAE7LCvc5c9X
 j+1FAUpbNjj6yY2E3hh7YyvBrc0vYT0=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa5fe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s9wsCz4ZXjtKvCKk99UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2S_5sWmhOeKSPTfkj9FDvS2DttJwV3FX
X-Proofpoint-ORIG-GUID: 2S_5sWmhOeKSPTfkj9FDvS2DttJwV3FX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXxKjt95CDTh/M
 LAWKYF+EtnjG1b33PTz3HYT1ci2GShsnukMb0A+GwmscHGRZyMGw3zk1epvKbVvkIYyoEhfjRff
 p6MFjVvPedGbbOPo+7ajHwbVrKLaWMzae5P/LOFbH9AsizFsJZ5x8iHMsY0WsqvomiUk5TMueEP
 qURH3vL0fXSvhpOmFZ2wHdBx+paPf0pvQBnDLDbYFbjDSVKIgJsfWJ1lZU3h2pHBVdmcW2QSB8S
 shYDa26Obm5LQKIMc6MYuOcVmBTdGJ6WUKgRmnAQsQl9mWrmQ6pHDGmXpzWdU0pCa5QjwliAiN4
 16cM3sZhwMU7SNufvS18s51XcbyvNgD4h0CQls2pT8tnQjZ2W0nwUxQJjHcFpcI9zMNPrajZ/J+
 rX8nk7oOrbnesMr26Rq0zqCrnuRxz16bDFwpIfHCxU2/dsuYryNiDslaFJp6yAf7lUzab2+NwBj
 hsqqYuWnBC8yBZjklDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150073
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
	TAGGED_FROM(0.00)[bounces-64877-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 38682684198

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0e827996609dab2c09834857a1bffd9560155a6..57732804a6c6a114a407a4a541a1cc7af7635ea2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -702,6 +734,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1



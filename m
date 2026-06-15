Return-Path: <linux-media+bounces-64878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EgsSDxGmL2ovEAUAu9opvQ
	(envelope-from <linux-media+bounces-64878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D3684122
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 09:13:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mpaDXtKR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hc0QPxNf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64878-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64878-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 931DA3006F0C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 07:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B880E3BBFD4;
	Mon, 15 Jun 2026 07:13:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F083BB9F4
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507592; cv=none; b=cfE9CB1En3dJVMMhMLOpmfIJzZFEtRZ7r1TcO4lBAfEbNIOdKh1QvZIKDEzxGkA028Gcxa/9rHJcfjtcWS8FUS9ViP0yjL0oM/0h7HksFycoDVKqHdSH3T8S5UI0P5KKBguJDzUzbJOgVDjZyadSOfJpcZfGwBa8gopHd+opZn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507592; c=relaxed/simple;
	bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0O8djCMx1bG/m0ZgKX3KHMJJpmgaPdjQJvlOyKz2/m2IfBLD01I2w09LK5M5+o3iYq4KDEpJWHO6I4ODvnz7qFH6DF5w0baKlS6jLSWFs7D1QQfM0OSo+X60Uv3Do+dIswbzaR8oPQK1kz0Iuon4Ybxj5K1qUi7kTejbs3+WcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpaDXtKR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hc0QPxNf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbJB3910861
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=; b=mpaDXtKRhMK7OYTP
	RwOaN5Doek4boMEUJmviyJ9rMmt7btz0zrYzJy8L9NEfcTj7E9l9UPe0iZx8W1Ph
	shR/llTRbdUUZfpzCWfdAmk5oOiKSHs/M2gXSJlA+CsoFydSx6jm+pm5eNkRpbmD
	hLDwhBXjIweJKIfRzLip2z6YmhHfnDvtl9oMva4yQLMCt7zkOSy01muoc1jWxhEY
	CwelikNIKaRIns3MqeYpmUFFcR5rtcR+XhHIDHr7juGcgTsf0bgM4W2Z/zJlwZ3E
	48S10s45ofrJGIEdWgMzylGutOXWqXA/KN4fZwet4mFxwtjMdNBKfL2M9K5bKtYB
	liJPGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x5vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 07:13:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b54cf2so2312729a91.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507589; x=1782112389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=hc0QPxNfs2QQm3ze6jbxdrRYeSeCX2AOMIYZ7fTLR7wwQgIXhbtwzh1y5p93tq6hBm
         5pCvQc9qORadyhFaBrdc/1fkJEy3D+F19PGj2GdMCeECon26UTS28XO9TWMQ5fNfQLdM
         ZAVhyvXbyHdQYnlpuexCs7yICBfrP2WziE6bLI2biNeb2lxK+auANABUB9aPu+ngq3OC
         3JHC0uEEJRYzSNefttOSHpU/tWewEoKxqw7iux11EToqiNMODiOm3QGMCqG1r1YGb64l
         NnUXuZYNptNcdX/fzcdC8Rp8a2hxGxKJiCIFiX14csOO5cCUa+R7/42OSdiej7rZy/j0
         e7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507589; x=1782112389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=au/dR6Wd3jTT560wWLDqtcWcjYZ7Z3B9jdL0VywUhbM=;
        b=c0VqbrdhrM3g4jUMtvXp64gmzisKBXuOdklyH7G15hnxz5gBsXG6LOWOricwRzTHB5
         iAqIjmVcfGmIlKRlvKTMixSyiIMApYeAZHH78mbDUVsVv8et16B8ZaUJe+uZaDJbCqcp
         dXlrcIMwlR50QBHC0UOn53YbrtxCTX1VKfbbixwITCM/EzRA1W2knnYDDHddc1Uk9gZx
         +7NU2TRTVs6VKUlche65cfnNjrXUZBK6k47qrIHMx9kUjnsfCK76AOrOzX2xlyMbegkB
         Lkr44IlQJC89iMPkxxY4UtUBbKFZFZxo0eBj20guv28lqdRoFRbqDHM42DIFltKja69y
         gqMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XpkkwhWk6YwPs73VFD/mmCum0UMn9zQo7hDNHR57JdJE0pLzxkI0QpM2TE/rhs3XFbYqCqjsYfYRHFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/uvKIERvyjJTr/e6l/3Q9bOY0D01/UFJkFpEUAdkEAonZksRa
	SPmsTLjfyhXSSmbCMYXGR3lpPpeNJ2tDk+kPUC5cQ9T1rxsyn7cRdx11g+gJEgkP4xqCGcARRMH
	B8S0EYMs+NC+Kqqh+WrLSfQ5Upg+0215iaPKAeWPJles+zSOc4IygdBLUC+3xGneNow==
X-Gm-Gg: Acq92OG68VjDfRhdegnAbhxnda84kHSJEbDb79ptf3xfzpTPuuzeBvxYIZ325fbanFJ
	63dTmOERtdoDAHFXxdG4guNp+4hKeaSk/cDQqxug0Hmax6Zyo+qBgw0FuTXXdiAcNrj8kOY27mP
	rbbNOyvwWwgbQLgHFXUg3ZYGUkBhKG1ROBBgh6pa8y0xhbEbaHQWRUT8+pIZb3fjrX3QtgXuN8L
	pkXhhQostZ89ha9XBw6bDU0LLE5RiboZcP08iaGb29y/YmpcQfIPIPQ39vU2SyeQJn7xtl2xw1v
	uVVzRzzg9+kkLUb5yryBNlLsYynQceiuLNpUeKPkx+gTGsh2eaSFkys3PthDYMemV3I7CxUbTQG
	kKyXPkcYZLxKv5YPJipVrhffdUgGU+xPm1VVWqS5ixMaeULwzyH/U
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470974a91.1.1781507589238;
        Mon, 15 Jun 2026 00:13:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37c2bc42814mr9470940a91.1.1781507588775;
        Mon, 15 Jun 2026 00:13:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:13:07 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:15 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-4-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1517;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QUAOHVDW4Udars0Jbe5wX7sJIZNINY1ZT2YyhfvvXAY=;
 b=BUXma6q9Gyn2swW58JKf5dAcZV8fecETY7r8PGWQEBejEnOm6JzM24v7xnDk/1CRwSH5xQIw8
 Kyn9H8F/NuJA3m0GP83IuA5KK6byXRSK8tcHmhsiOsKBH1ngD0WjUAW
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXxG/wDbDNZVzD
 f8tyJqllYqEM+jRreiSmhEfe4hFCe+4/OlaVqXb9eeTIhIh6CLehivzY823VFpaeQr8I6Cp2byH
 QqOReo6sFffuzNrFs6J/DABEWGd5Zbc=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa606 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hvkXKTiNP6R-ltmIA9UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7TDzIws9Yd0GwJR7JvOk3QX1fhosfR-U
X-Proofpoint-ORIG-GUID: 7TDzIws9Yd0GwJR7JvOk3QX1fhosfR-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXy0Fc+4RC2K8O
 ZdQdBAnPJ2+bOomGLlZVfCBqMb/7WK8r2vqQPIzJNsgxR0eXh4TFCOkgxYsdRIeeEEnvcgSHO9d
 nonns8P96x2bUaCep3Oim0ZvF4gw59QexrgGvDSvCpxMc1eYM+3cE6mYhQnWLl26wA41zNmL+hs
 1P8rgEeIl/28wKw6/WaYyCwBkjNXiwfJD1YsrnMdR1fyvgzzzqsaKqM4SSR09jZOQwwjLVSLprm
 oo5Lp+OFjyv9eFNvnMY1nP2ot3awTSVxNb6WCJjG2g1feUTHDoJWIRjRtHesHXhsAzJNiEpycmQ
 rF1xNYUYqXZ919TjYPu21o8IgqDA7fcIdGYqP7C7n/rfMWh5JeRwd6CTJOeBmqiC1dQ57wW85//
 6vfUfqaFHIKsGhWLzUKuDlIltQ21DOHG7/R5SwQxbKqBjTq7rQeJq7gKe3GLTxKjRvGn+yrjuGS
 lvpmy7yD9pYsn1Be1Pg==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64878-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: EA9D3684122

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1



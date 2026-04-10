Return-Path: <linux-media+bounces-58472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lc5VFfF72GlbdwgAu9opvQ
	(envelope-from <linux-media+bounces-58472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:26:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC43D20D3
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EEB23011524
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDDA26C3BD;
	Fri, 10 Apr 2026 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="km358ngl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGrdefKU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E032ED34
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795170; cv=none; b=cne+JCMJYiR5DBwP2FghyKNQPUsz+8ZS5X0qSJySNw5iWBJ0i7E6yx0EOqXTHVkuARuzVdDb4ozOVHcJYiujFiPTVNlibd8NBbqGucQUHJeoWXKEJoC5cBLBQGlnTkbSF1rg1VM/XMzn5go/BlZk6I8cyRNfWkUd5XwWObdlDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795170; c=relaxed/simple;
	bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjpgfa1uJHKpnS81oEQbOm/3QpJRlWUlWCmR7j8HJHtH0QrC38v2UpT3B2OE/59nIEpMJFYiqpUJX75iSLKePCWdOLkNYJs9HvoicjtlfRIT9igZUw0XouvIZUDnXj2cVJPQWUhg37A9r+NQImZzDbarwFe6uZS3pR2kA2gG1vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=km358ngl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGrdefKU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639L252u2624720
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=; b=km358nglaE08mi/G
	ZvE5bWnmvyIPdLi6SZ4dLR/qW0eCX6qmx8RBajSMcM7TpMXJQqWXDrg1+slEqLtG
	6Lbw1vsAFau1JIdzYpywLye3bLXai/rTTSR5MBnWwyNDvDZdM0yKKUCYtxmM+dGA
	5uEUOYOJeyjH1aMdpETrtWNgycn2m6IZREJh5G3WF/+0ZNDEWbEwm/+8OfpzHiqA
	OqQ263Tm558Tkhv9QOTkgcES3A5cOEu+43taRXreCAGMExMoBHR0rXPMRDuUP90L
	1k3PCmsqK5B4KoAjZg/iflu4HfTPVEWaDYXdZ+WUwwd0vSjUZsPatLJ/UhCmH+Ec
	GUGY6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu2nc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:26:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d3e4c19307so299939685a.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795167; x=1776399967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=JGrdefKUcwBzv3eh2nNMagVZq5QHOQY2/nx/O22K1QZxjCQxLUa+CJHBY+jYi8C54P
         tJ+sULBKTxC7MarxQRJsrSm/mI7Zkp6q7f6+2gyTw2QOD5IPTNB8kmMlmebmPrbioaar
         0/WkSws6M7xOdgd+BF2csgLv/UaNB30bHDRf786yjMFPUg9zJXN4CSRJf4rkRzlGi2rX
         ri2yyFAXppEacv/XYujemQeT44f/8Uy7pvCE1n65aJFKy7wbh6WMehQQGbLgHL04N5lU
         x2gP2BptOjI3rXVaC5fKknNNA7U0l/cndx5rFaInIwzNi5TAFJasDpFAw7AyL0lYI8GY
         K9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795167; x=1776399967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEFky4Kb0KlYAKdZcdXNgekS9YRdlktHQ/T8MvozGl0=;
        b=SNWKGvPfQ0pCv+x5QFZc88beJMn/kbk9G0KH6iwlcEv/DirHWtWrico75l8NJ2nLCO
         Go1Mz0mGV86EV5KEL8nUeY0D3ykdEQSpocMMGmR6Wao7n+yGnjhYdK993scvvUwN9Bu9
         om/sp1gScID3iDGe3dEvED6QkGOHlaO6qjfEMnW8OZZU4QS8yiMbIcrrohj+ATLizOvu
         ByPA+HfWV+9p51+vGEwvM1yqqdvsX/1qHcvzB+QkocEaWCa27YIbc/A/h/FMPVA6JqDa
         /0AlBeuTXIKKladk3y2Odqq+wRoRV4Sde7Be63npG7yYDrWX7Wa45ICfyGY8W+x7Jsim
         qUAQ==
X-Gm-Message-State: AOJu0Yza0oHB0G7sb4iRHHR/BHQH18DkyDyQp+KuXgieeDWEPuCfX0lJ
	mpGMxg70jNzpAQd7Xlo6ccIuTWly5bnGoroocd+gm4PlSdgh+UNEHznYJYWQKYn+LEqudeS08Cb
	aUJrci860o/x89Zf0Gijx0pdHQ2XFHgknLjoZZ/eQ1NNDQwHv0tb44lz+v5TzsXzK9NJihBxTP3
	Mb
X-Gm-Gg: AeBDievErSBLkW6HOcLJPGIFU3it7Evoigcew7aVzqPrlEHM6WrJieO5wOKyyTDNZnx
	ECdG4SCQuth6zh24BVZKUiXgVDYkE/nV1FMmXMGSsfYO1fTCkHyiJjTs5InRfDdvjIOooeYcixP
	oPB0UbOPBITkQMLE80bPUW2tUsiqi0bwa4JX5UA554hOMlXS+9n50XvqFFc8ey3+BgghRG/fc+c
	iYwTF+R47NOqTUKDjYUNO/uJ5E3qW8liRm1+Azu8yHWxKalPQNmj1XlUnaex2HlKkjbnPniysiF
	/hAuR9U2Xncyj97rvBQZKNk1OYbSMNBP+NSmBoMPUGsLPDzNqzD/hWT29omMEOiqOgPFcy+vkyE
	f+sie7xCxR0APiz5faWStIDpWUHuC7u1Vmben6z1OnNsRl+85TvGBFzY7AG+gnb4H2MYbZaZxNK
	CMcr9tr3FSQykA
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223449985a.19.1775795167083;
        Thu, 09 Apr 2026 21:26:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:8cd:9665:9ef3 with SMTP id af79cd13be357-8ddcd8f3ce7mr223447085a.19.1775795166624;
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:26:06 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:25:34 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
In-Reply-To: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=686;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=V4wUSuWV5Yj8ZviHFpqjcBhwd5DsUzsCPP/vHGseUdo=;
 b=+/fSDRh0kjqtmsEO04q71jhgtPncaUSiPf3yzSHP+H+PJ1RapKljGchMMhy02a6/c0SKUAYLH
 oRah80KvIePCV38PMBsvI5aExbf1aJ1azxF0EPkqXhA6lRiFwTkX5D5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: -uvjjCr5Ql2jknxVz9c9y8Ky0f-Dtc2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfX7eIyKbYCI3g7
 UV4QH57txqPRtsIk/l9TuuZiXqZ1lrEyvJcT/7NDqFaFrV7zjVdmNJ8HDFhaGDTegoOGPxPAo62
 1uMRhd5FGB0MVvmgbwy4Z8i069kwuC6km/pHHCrPQ6rvpXNdNSzV+fsm09c/g7XgvHSeF9TI6YY
 4ZfbczTnEyOb0A1LLS6ngpshJg57jXU0f0ojwXDI8qKD3lwnyY4kGYfGe7jjD+1Y1a5A6i+sivE
 9ejdSc1YKySo4PMP4gl0BUvE7VqnvtWem2zJBxNx2T3pIVyMkr60d3qYkueobBhinJp2rZYM8e9
 CxPUQmHhF7SDK5nnm+X8p4tHWz+Fn0LeMhXtMg8gCcXtbS72MQ1S6+cB1Oy4ocNdLEIu7Nx5huI
 LL38mZ2gXqetKpo16eRTV7g1tYQ6wht2p/ADfd21qjrMRSvR5SYX4h3NmzhJayISXjulSzBzp8N
 l5zpiSzY1+8HDcVNqtA==
X-Proofpoint-ORIG-GUID: -uvjjCr5Ql2jknxVz9c9y8Ky0f-Dtc2J
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d87bdf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fhchRTXZpgtNQ5V_lqcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58472-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EBC43D20D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

nable camss node for purwa iot evk board camss tpg support.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 

-- 
2.34.1



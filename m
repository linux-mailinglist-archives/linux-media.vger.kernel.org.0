Return-Path: <linux-media+bounces-51497-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N1DBoshdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51497-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF080DFE
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88C5630158A1
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A1B3246E8;
	Sun, 25 Jan 2026 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4g0RD0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQNbd1k5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E53322A28
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349469; cv=none; b=lQ++mzfeGQePo5NlzTtucHabvAodVRP/la/RddGu/9qvy6bnCSeYVeV2sA8Hb99ZtxJf7feiFTRN0hOAROdKUhgJa5VaiCIJjAWfSla1EXWlaKAsdJF7S4Qv76XPgzgGPdNU+xSUUKPhoi5eciPuf8ibumI4DAULtTnOgnjx3F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349469; c=relaxed/simple;
	bh=eMPPp5QdHl6l2+RHuOJrKXZ3iHN1D0E9GpkssxyQIzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP1Hr2eHDx7YDGcJDi+arZ3TFeIlGv/b+sfg++QaLMrG+HjjFPFEVaG61/IsOAWwjPGToIp4FCmeo7jt0ulOTSjbFKPExv51QSmX05j1NJNZIl/XMQpac0krc0hm7IvuZ72ZxwSyXYw718sAfYhvidNTVlJn7kW++Ip6JVf9bDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4g0RD0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQNbd1k5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P6Grwo2888366
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=; b=e4g0RD0FzSWL82T5
	eMDARqqlrrVeGLuYJxoXJ6sHWwOU8cceOjLReDJMtdTWqkyZCfioY92OLxQxuIBC
	KaQeIoQTvM+uyhTTUilzHaHxa/N/eoUkhVQK2E2qEnqknxDM5YayRWOT1lzt5q3M
	I4wveAKwOHHF/jhcN29e/IZRwPFZnc3EDkI2VA0kHEPQhTXoyWboJsh+WKL8TUMb
	9amoJgLFrGdbE5ljELZgPnMLeja94FXMU0a24/GyD/7gQoJFTB26ivuHmL1YlOIT
	Rm8+LPlsWDzGiTRv1JYvVZLmukA1jNbkrrbpfSCXU6YboV8jNYAcTVFAK7yvayDY
	iJdULQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj64q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so19131385a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349463; x=1769954263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=LQNbd1k58LjxT8qe0vocncCuHYEe9yoZGhopqEpcjIrOPx9a6MWp8HJgvkL+t4PsrK
         DdVzJBziaZi/+4TXlCW4+0iDu8aM41BMtKdahmiOdUk1xB9Rn4CmpxzgAvIm8Mi+y39S
         a1Kgt1V50XXoLrAtoYUE0sa/4rIPGb6tF9+jSqH+A+40G5i5FDaOMH837JKTz5N5NwLX
         eGMCVyr3cVBNJHT+9fNYfnnW4rRiCzwe/1/XB7oD7Sw5xdYYKHJX+HKQlwr5xN25C5Qf
         iynY5IlB5kLcnM9cGlFkktrjsCmvKDmmd2F28eDoLRrEByf7V8VHCwv+abjbcMwRIidv
         PL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349463; x=1769954263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/jnU1v8SbYVQvup/ww910IkEwyTZhceq3Rp0gE4nyQ=;
        b=oqRQSkXtdVjDeDg+fPPBH3WrEuYmOVRV+kBQg7nCANZKky28o2R6WCEfnhw68O/WYV
         z5/r635GzApoU6yUSFEmgBhClisu6d8IDoNpXtiv6Z3Znx7IT848TFZ8YIBbH2PNPc1p
         k4t1sgV8Fo3zq2+Zw3IU+GAxPU6APE6hQkahU+bXiL8TA+VXJDxvBvoPwMC7A2fIkhNp
         j7M33WnA7FZv7nZ0RRuqawsJqhTV8LVtlOwL2LkDsFRxqw1aC8bmt7H9KT+ysUp6BdEj
         2ua41LoIFJPDk+5RB3fWvtCWQyivpyOcxNjdSlj0m4F7uhyWRXcb5oW5hc1qm3Cdc7xb
         Pu9Q==
X-Gm-Message-State: AOJu0YwSJLSKyHHDdgLTIn3jcMGt/Ad4N5PFBPHgDwtUVNUf5nzM2DbB
	Vpvzi8POacRniWGEql7MdMTZPEVVePFU/AIpRfGYYpOEfz/+hOBZEq7Je4Co2ARf5E9vqjkI3d+
	NuAB4XN6TkoO9hJ8mbsE3STc4S8I5sXZYVRUav4I6HAn2a6yrawMbIi+I5SG7GqAsNg==
X-Gm-Gg: AZuq6aKeBO4+8xuzGG+YkOYbPeaNfn0fshHGk87zi9rOMv36PcFg3+dso2mcD5M+DOF
	VM3RuiLJ0RulzFDsQ+bM7D4rkv2q/BKxVUWp4oMjUHE52nRT85017caSZ41NTG1GtY439ivBVlh
	oBDOJek/Z7QRV/4iLBs+DQ2YtyE1YS6E8VkfSfgkYLq2gxlDn/bHIgdah8whah10X937SHWUJuy
	cKCcdhFAf4Lp6tFzFtqN93g64N/PGYUYxFLQcRAFM8FAco0PwgOakyiRiTroRE9/t5FuziLjtEB
	8OkqSDgrOWdvGeuJ04GqbIXZYihB4nUv3vmC+Fi28ZlBCCcPRbZnNsyE1GSCu7texB1W+SbUlos
	h3EJC17scjoW2MmPDf757lR1rmOuOcx4Xpj4ZHE/5mZaJH4MTGS/45SshfcQ4QjXRktOJO6eqYT
	H2gvKp6eEP4lREPYusnhPskRI=
X-Received: by 2002:a05:620a:2907:b0:8c6:de9c:bda8 with SMTP id af79cd13be357-8c6f95728eemr186950785a.11.1769349463507;
        Sun, 25 Jan 2026 05:57:43 -0800 (PST)
X-Received: by 2002:a05:620a:2907:b0:8c6:de9c:bda8 with SMTP id af79cd13be357-8c6f95728eemr186948185a.11.1769349463106;
        Sun, 25 Jan 2026 05:57:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:28 +0200
Subject: [PATCH v2 5/7] arm64: dts: qcom: sc8280xp-x13s: Enable Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-5-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rkZGIV8zHoppbf8XaAIcqSxhBd4bGzlkBwNa40cVeqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFG2qhUXRxWmKDAZ3dwCylQRaUtFDMwnpbrv
 t7AkBFQ49yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1ZXtCACkkTOwlBnX0IPB1eHxI2uHcUeDXg1fEKDSYqlK8e+gR8Qe+ydtmJhbjTIeX8ov5uNZou1
 xqWJzOyClJOkyKQu+bixyvX5BbIzxRtLAoMghKzQsYoI9bUNothc7f1d/ATkvHzGcBEswb1NMaT
 1hFQozhcLna9enl9uK3PEDNhf9+U2dyMptmtEECCK1/rpDyOohDBdj3pTj/B3kxF3vBp3MkOXwR
 XVNUXvPq9Uebp2E8l/x1RVgLe4DhDKJcx3JgOleycTPg8CyjQWc9Pzwc5lvXMBTBeCVJDWx/6fT
 vFqN6lKUcTv/ji8ZZNbR5vvXrJtEo3FHSCPS7UNkxNWYSIy7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uv74Ck0VTCcBaGGc8A1FvqmSaIw2zqgg
X-Proofpoint-GUID: uv74Ck0VTCcBaGGc8A1FvqmSaIw2zqgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNyBTYWx0ZWRfX7Uzsu3WB41eF
 JJ41ZLgttx0htKkDIQcgMerePXLfaMthOygV+Orr/lGi9gvYWKSdDVsab9IOOYbhLe1V9dtUQyt
 56uQwNF5HuwoGK3MMnQzX7Iusz7PirlDSIUcTbNRDSOoYfFXHO+QqocP1QPz1fjduYTMVzmmB1v
 GKrtM6xNOAOcNokcsLgK9jJ1V817iQ1JWrEM9AHgNY6VD8pj+XWmPJam4FUjjguG7sIbK0t+5ba
 DPJ35S/X3YtYO6iHYMtyMeQgMfgY72JMg9o1uyxRShC7SX8ovRobTIX5ICokDU5fEc/w3Mv/3Yt
 8oHWKyiPSN5ub2rh01TcMJtJ7+45XWM8CIt9/nwfKfBT8pnk1uvBSBv6MmMqAvkwt8c2mjTao0Y
 mkJSG0P/HB7WGf4ShGZdhl0VesvzkXYRoMtrm4H6dMz4FAOG0CIaceSu4GL1dLCnCFs/MFZhT3l
 5x7g8BMkR/DmQgdkOxg==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69762158 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9kCQqHoLWY5iHRgZhBMA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250117
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51497-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71AF080DFE
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Venus and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..62f4593958a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1474,6 +1474,12 @@ &vamacro {
 	status = "okay";
 };
 
+&venus {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &wsamacro {
 	status = "okay";
 };

-- 
2.47.3



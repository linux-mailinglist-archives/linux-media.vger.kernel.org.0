Return-Path: <linux-media+bounces-63014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBzGGllCGWqNuAgAu9opvQ
	(envelope-from <linux-media+bounces-63014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:38:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6E85FEA3E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C032D308A76F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7389A3B3BEB;
	Fri, 29 May 2026 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfp+gznA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5e3r++B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F313AFCF1
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040137; cv=none; b=Rp0FuYLwlnf1qL3CAmrrreaLoXWIdEWhlSZtJKkqBK0qhJ7V4wmEvhQO7lYYb6EUPBarHTbpsWom5XD7hR533a1MoTobQ9FRobpOBjv8I7y7WSQ6wltJ6kfTyuPLzYdNnTZdTZdhdsqdadnEA+uLk7AxcPag4CN/pb6nzHP0egU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040137; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac7AFBkCFTZEq3ggDHM9N+1VKg2MO3vTbGhZjKryNg7LAPgfEWQ5u8xGA0mczlbZltcERW0Fo0HPmloMf3VDhrKDiAu1J4g1Iwsara7MvHtSfGvIrrxN20OMqt1XFr6NjYh5vOvrsQWFwvOEwu7iMj8CTrEJdPhJ9t91Q7azmcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfp+gznA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5e3r++B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6fVB41386686
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=hfp+gznAP6RJlgCe
	e/xQsOvkTc45d0eNDDRZqY2i1SPZmp2kUOMTxBC0r7lKfm1mN7IRlk49a5mBs7yV
	xn5EJYhZYWML9ZyGbFWJIKa9ds2h4UNJqu9bBPlA+8WLilo+OODuoWmpaU/CMdyo
	cEYsJTURB32c0bcjS0sVNjlM7/fer4NB0kareVCU78eO+53iJLw6wDOfz4EC35eL
	Ic3dEe3uJ02d70BpBh1axPfl+v6perVRTN/na7QgvfSzEFm+9V49B7lelPIFMSmp
	VuCkzapdc2147tJhpYh2GrSoa7VcfkYJ6aFg1fC5PcUH2coKiYJZC7AiA1crPn7/
	d9DlCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumtb0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf0453031aso22547745ad.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040135; x=1780644935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=i5e3r++BktcuI4xPpJfidV36tnjFcKvo6sg0VCHQYi2aQ6Bx2XNiHMapLhdXqSqS3x
         Jzq7O1AZzuGPITMth4Nrn6U1rsov2SpRwxYcBow18VfjDiBVt3pdtn6dRP3jedkXhg6e
         TZ7cVpYO4I44l6Md+0T039pFHR/F310DnQwqlt0Od+Xg3S4hsY8WwG1UI5aCC+PvR+PQ
         5ZQ3a2ieoIvfzftSlFBe/KElzoLFihbw8u2AnP4hOZvG2TUuc2hKw2nwvKnvbqGXfpJX
         iinQ0mciIbJT9mXNl6s8SS08S7QjcnFQOVbopzJlKbIf6nMV3c5K9YrBBHkSrrsCe6Iz
         j1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040135; x=1780644935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=UbjOZCi9ATOEpxNcNrkuN6heo6LD4rf0qgl72egCOHAHONlvX2LL4ktwWWbSVM3gaH
         3ligQxPZHpcSrj2wbRtO/5CahFAe4VuoNS8iENu5X2X1n+wj0nDWVfehLk9rAPMM5RBT
         7US3bNFvakiEgOLqpJmI26+JQRXhE/q5pBSJ56lvaTM0+CeSF6pYnoS5q4nlXSXcB6AC
         +g+lcKAouQA7ttrjZIidWdM663Ov2MkgOSkEVYlWiVamTdX2cgpEswyF4xxjeuxDq224
         yFrDTA0jqV2d0rYCGFNo6QQkGCCLlCZltIV8F1z/A8qIMQOjFqsZwkl5nvTCx8blAAk7
         6c8Q==
X-Gm-Message-State: AOJu0YwdXwxAAYkexPZ0oMQM5R6iidBAkW0KeV2sLeoURcOp4pnDxEi9
	Wlw8iknLR0Bj7Xulhv43NGpIryhOS7QNNId2WiPsO7z200HJ5UP5PRPwobdAquC+7eoTz8R2TuP
	G6XcKggtizs4+S61D/81G7SMaat5D0PJm4HReBaYniRlRfYPf/F9zHukOkvvfOkkVJXJ8D0u2j0
	AK
X-Gm-Gg: Acq92OFWun8ZZlFPBhWYvC/8Nu2nLnTeQbJj8Ugm7hE/fr/D1o9fU7YXklkjzMdqVdj
	92rflhriYfPOzoTtX/hmJ0mcGJkDA6AbfWhCplwlbai3Ac9tW1U7kAp65RwoaZBpb8QxdRQul0N
	rvUcr5grS1oc04Dv4b+k5SzFAG0xstj6afkeOu1xsCyaMoqKmUn5q2IvbKmaw0qVy4ftYQpuIgn
	MykFRr5vBHhCLAwDVXxkut63IQaQ1mZyNujamZirqS7Y68EQxmJlgiIguLdn/gMgsmNHFgcAAzt
	qS8ciL4CI3eMFn5ZyChC7zdMsK2GNdNEqRUof9TrU601EZuIlmYhny85eOYW/O/96wOovi4ZU3i
	5x/yCQqAdxo0EZr8wlz48DQHcR59hwy2xxTpk3eXKTRi/nf1Eisq/bqOg4d64xaX6TjTg1Sp/Cr
	t1/SVD1dFLyfM/20N5xAjCU1wwv9IZ95U=
X-Received: by 2002:a17:903:8c5:b0:2bf:27d4:7262 with SMTP id d9443c01a7336-2bf27d4ac19mr7910805ad.41.1780040134649;
        Fri, 29 May 2026 00:35:34 -0700 (PDT)
X-Received: by 2002:a17:903:8c5:b0:2bf:27d4:7262 with SMTP id d9443c01a7336-2bf27d4ac19mr7910385ad.41.1780040134168;
        Fri, 29 May 2026 00:35:34 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:33 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:02 +0800
Subject: [PATCH v8 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-5-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=i1JRPmIsh0zF9aihyjTElfvWleK7DvuVCvSEgWXsztTwujxeeK6Y/jGwDoY3ujKKBKJrGVm99
 TxmvJr7oW4rCx2Ass6x2BPTuTrH68os2vwlUxl/cOcmFCOfULWwwUR8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: WK7B78Ks7u3dLjf9I6lcIWdX1whO7wWV
X-Proofpoint-ORIG-GUID: WK7B78Ks7u3dLjf9I6lcIWdX1whO7wWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX8Ms6d8AoOrIX
 pd9my7YInL/6PPr0QueogxVY33CsyPXyjWszVND19R5xdi5BrreFXfJ7Gtufn+Y/AeXWtH+8wxs
 8IOovVT1uMWp6W0QhOmNG2xUmC8KFTXyClmoCDb3hbsbLOpsu8sWMaCCn3bOtXW73xwQOqykiuk
 tbvoeP4EhwSiVQDvm2sYZvQQIPLiDu4WV+e9T45IJppDgSpGB/8UX2+w7M8UOIZVc0SPGjE9UM7
 Sx9F+3Oabh/x0RHNi+Vc1oc+/q1Va7SeIRzbJ/zUzqObq/PI3mufBOyzukwh3MV0s8bUYUVTLxh
 jP51MyN5T4wn9Q3TzR6HOQw51yckg9AT+qCkJEb6vau/E6VALSh4IEzdbfDQHjlRmI0w99mZPZr
 VL2R1NQIt6iM5raqQCi0sdNxQzTlrIutmCwrC9MLs0i5vDigYJJIsXcCFPBk+eLQg0S27NEVm7o
 g6MXZxWfe2eacMwgYDQ==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a1941c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-63014-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E6E85FEA3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0



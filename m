Return-Path: <linux-media+bounces-60716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMUWJA8s/GnVMQAAu9opvQ
	(envelope-from <linux-media+bounces-60716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:07:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890A4E34E7
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF4843045B36
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318CA33A9DB;
	Thu,  7 May 2026 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n283MIHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb+KjFFA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78233A9CB
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133965; cv=none; b=Elc2nmmUe6NUT9r86cMiujhU0bfs9F2vPjjm7aZrW/oQEtkDM4V53azVPHsUhZz+8X0ubOzsUabdwbXCdp6O8RDvn79kYIoh8sfulQN6FxKU8MxfXpe5TNbnj9cGzkT0bo5WlFrRheemHYvs3f9lxCOblGMtIJXvIf7xHFyWidA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133965; c=relaxed/simple;
	bh=RewBgTvMO8Z/qtnMqc+UdYwTZTh0doRKst6GnW3Jz/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwZ5W6KwuRdoTPxeZsAmiD6mGHWVBqzme5nFXApBGI/agHaVfiFZXSCs0Fh6fekm3mctXKc4CXuZR7kfw2OP3eLL7Ss+7M3+9AI0+dh+nMEEsfHoryZnsR55ZNT8j3dFkDYe6gPu2URFzVgzViGr3ngdkS2K8an3MVrwVFggYmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n283MIHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb+KjFFA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Mfbp3924169
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtlMyNrzMQAok2E0rGfjl5nigCuKBAZtrkK4zXVtiQE=; b=n283MIHaRNlaQ7V0
	+esVb2jNb9YmQHw9PF9eycnY3/AMEE3b9YMhOlgK32nYioiMgQDH4FceeOE1IYiK
	KCXRBdksI6YmFZkiGbDe/ozTjF0MNtrPt+bxpors7S4CG/Q7fDmDFWgnzspGXjjE
	Gehs9XmeSga+2vJ6c712k+hLlfI5VGUfNEq6G2x3g86i5eRWHE6vaxX5lfGxhCII
	XKOD0tcfBTeK96i1/xhcUhqtvb+4J1bQThK8xOJTy+tkH+hhJzgM7tizZfn+I713
	ZSj0tdUBOdJVDHegj0VOff1a2lTIC6+gRtirmnr0OClRvFP16wZCrSkWRYe49RIQ
	GJS7BQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889p5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:06:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso341771b3a.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133962; x=1778738762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtlMyNrzMQAok2E0rGfjl5nigCuKBAZtrkK4zXVtiQE=;
        b=Pb+KjFFAkqFMAzCaYl7drEEqhtbqMjBO9vW9Eq7AeG1wiPRebAQ64fe/4L46+NzoiZ
         XYD8IKtTTXJROj5k8oFcTigqBbZWK9OMfgyrsq3LWjMbCPrc0JQ+pUHFSYjw/oJdmda+
         uAg1G2UQmJvt1OWi716n0I50Kjz015gedyUCxT/YPzEkvzwJtzEgaaSuV75olxVYy8Uf
         Ir2ujWDmV1LWz90dUp2jDMhqk/BWdR9BID7Hho5qRmEmtjmBy2PenNYsDfvqaj3t5oh1
         6TQRdDzHy2puq1EJ8ypQ2w7ledZNaN7BrcWpLEki/saZx+B2dCy81vxyECjEGxkkxQ9/
         n4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133962; x=1778738762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtlMyNrzMQAok2E0rGfjl5nigCuKBAZtrkK4zXVtiQE=;
        b=msShvvVVCx84uvAZx8IFJCHDYWDQzH96nHSfKJ8m1A1JU0xw8q6KdamCyKPpXqLnyR
         FlyIAq7lWTRxk5/SaA7TbukSUo+umR/hSGcVFAGV1kYsHvzpgo93yJyIGgOdJNHhxG04
         3eWVkHYeGKqA9LTisWpa47HMjlyuaB35v+0HfEoVnjpJ8DUO0yQjo3bbgPmRNef52TQB
         y2rP2ZsW2I2LdMM6wVAHYsv3M6Cv7tG5PvOgUX7y4Ni0wHmgTQ29ZnpcEGRR/X2R3eDC
         EwGG1MsIUJdyJn6mknecwV9jIR8wxhgECN/Iz2D7zCuv+crE0aFzr1WW76Ki6j5YPH2c
         LLQw==
X-Gm-Message-State: AOJu0Yxm7PXaETmyCpl5siE0n4rUg18vIXZ+otajozaGAs/WLxrKXR/d
	/rhrJUGRxJqCh54jBsxPgKHXwB5dx5W3F956ivewAwAp8OsJQ9KhP7opmF2GMlc9HxIgevxRkix
	EABBBwkeBm2WIwliQL8Gb2MBBoDfe4I0abROEYcL8ZeKGsn4XUS9BXk3OD/QlukocWQ==
X-Gm-Gg: AeBDievKDcZC/GidZ7NXsecCaz6EXiZfnXshyDJJljow58ylRBkK+og3LEJc1J1sjdN
	3KYTA1z85B1INpVQrjh3t1xHDbFXXciIw6LbZIN1Xu1XLcr4zoS46jHB7fxuepXPYuBUGPo1Aup
	hs3I3ntz5DG4Aewko4a+u+qlJa8H14OHuPer89q3dCT11aaI2/VgYcAYtZiB3xRcCHKvNQCaFkC
	ZFXbwe/SaXLdZdZit/ffVptOKrGL2M7o7tMbge3SYuBsejUcsJz85oCkd0evlgEoYufq9xmihqz
	y/efc+5Mao4MosrvjNcKip/DHU3lhp+TP+gVNO6NHvFoaIq52xzsSTWJM4/1j6N57caPLvjEeKm
	6dVivZrK8E/jZpu+2ZFcqbbuVx82KmZNaEPpQQKWF8bayi2Ohw/nnlCKvN2h5OBFKa6Qq6L+bSy
	hFVKVTzrcxq+GuYW0J5vqtzbIkQkkNotM=
X-Received: by 2002:a05:6a00:22d5:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-83a5d387595mr6329670b3a.32.1778133962332;
        Wed, 06 May 2026 23:06:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d5:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-83a5d387595mr6329646b3a.32.1778133961813;
        Wed, 06 May 2026 23:06:01 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:06:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:45 +0800
Subject: [PATCH v6 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-2-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=1865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=RewBgTvMO8Z/qtnMqc+UdYwTZTh0doRKst6GnW3Jz/A=;
 b=goj99b2lHdOqR+s7VdrKnlkVD7PpWILoOrnGiJ1dNvMT+t7EqZBmq42Vn7sZWb9Ghpq21y0mK
 7u1ZAVKeMsIC9M+4u849z7RjwUS93LBkn4Ec9ghvyJr8cywDF/YKQry
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 3mSbwM0Rl4alQrSJb-PS1U66ftGjOVzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfX3zGe9gpo4X95
 ZxDOQJXHHmBchi8qLcf8ix9ewWMOijX5JBqdcHI9oCI1Gp39VEQ+coh6pWFHYEPRiSqy9y3atLW
 ovDRYuk+XwoEPdtwIKilEdx9Vk96ZyHNh9dmp2DA4eHdes/7IqiX2xFQbR5GvmqA2pZ9bVc25Ir
 WrAxKbUEQffJ3qVQakwvtNp/QxTiPleFigL6b7/BM07gWhLzXT8Dpm81bFsCXkGsAHeMIdQFhBs
 jV3ykUBLW9DyW9aiRxR/F9L8XSLRTqEti+WJ3i6p4DhsuLRR2Z7Yp4Zx8RPPFrB3bUMuERKVwY1
 dgG/jGyV/j6su4prjYUC0jNLp1t+nc6E1UVLu31mlF89NHp8lyY14H+tsdmsuAGovItjw1s1cmU
 prX/SVM4qol7DDtTS1SFwsBUchLUacPSaUv+vou0ag1rM61nVvjezByVPNYm5U5AaXjsiEBi0g0
 xjP06L2k6vljfjIQDTg==
X-Proofpoint-GUID: 3mSbwM0Rl4alQrSJb-PS1U66ftGjOVzH
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc2bcb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KtZWPW8jcQ_ObEEXPWgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070057
X-Rspamd-Queue-Id: 0890A4E34E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60716-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
the power on/off sequence.

The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
of the video codec hardware responsible for bitstream-level processing. It
is required to be enabled separately from the core clock to ensure proper
codec operation.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 69e6126dc4d95ed9e5fccf596205e84ec0bfc82d..20af13388f3ffa1834a172c7c027e75c037ab8d1 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -224,6 +224,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 }
@@ -292,8 +293,14 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
+	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_hw_ahb_clock;
+
 	return 0;
 
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:

-- 
2.43.0



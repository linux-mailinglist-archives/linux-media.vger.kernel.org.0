Return-Path: <linux-media+bounces-61662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WASDEYsDB2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-61662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:29:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B684354E741
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4F2831DB622
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F48478E26;
	Fri, 15 May 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rcs0lINl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QzL5DBZ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC3472797
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842619; cv=none; b=PO7l3q9XAnX6ft5i3gPSwiTIN1wa2DUUkRGLNvBEkjZmtopb6q33A6SaAMHKtrZHa3dqkyuwjZ23xuPD6akoeFohePilTA/wyFvxyi8IC9L6VG45c27Th4vQjDlU0RlJha9Si3H8GgDxoKC1CdhrDA7VkhZ0BC8xeKucljlk8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842619; c=relaxed/simple;
	bh=VzHnsFGqGjwV+IDfYsDqSu9J90gdVOI884vxXv23cYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkR3TEXWKHayjsTNGpVj6dISdjsd1asLRReFuNN3AmQQt7u/hAzJ4irhIwwdykjQhP5DRMlCf5+p972mkYIGfmgOXuMJk3RoFBKfqcZzpHGGdFgROktZpcO9Iw7L058th6Pt0mntQ/UP1dy5SC8VPygMyig2SD4cJQFvIktBO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rcs0lINl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QzL5DBZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Cb7x4008231
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbCGYTJ9XgtrEdhTeKYZEhpo7oEx0nJTLTNraTLBcOo=; b=Rcs0lINlO48sySOF
	aeZUCq1fLxuYrm+qzRbzPL2pWUwEju3xPcfxKdvOgsMxJVXbE3mmQSfaj810ocD6
	5nawX1zPq/oQnVz4qMVTDRDpO/ClJQ+z5zVUXdearZqJeCQQsZUjuvw0N0yg1h6A
	y5VubdbfTpBMmVJbe1xeSVIttUFJcDYxsDCbmzBdeOViPaIhcbLFdzaK8VW8+Lnf
	hQleiJ9Jvqx4Bis2lMTaRzYYZRMHTriPSlX/IK37nyynfDy6s9qUkhZLs/QiVd+l
	RMetx5/DVhFzWfUAw2wjkF399uPXKcPvzXoc5lg9IABPxeqyHzdR8zbqchV/AVu0
	8kvUsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stxqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514551d5f2aso249041511cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842616; x=1779447416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbCGYTJ9XgtrEdhTeKYZEhpo7oEx0nJTLTNraTLBcOo=;
        b=QzL5DBZ/xOLiFU7uANWxuiHabB6XWFqMm9hzh/ov7/Joc0gTtEgkCGKutKJUpjpjGv
         pvbv3LCKC7BXYkrO6W14tA4G0rTGnusnjvnTOzKedNCGP1b8H+Jtk/89/vQIsOstDAUA
         sjraQJjXsZQcSf9qpKKwSmMvJAEov+7dfficJ3QQk+fpJvFzuk4hhzwqdDRIJ9FQ9WGd
         Cn7xQOJN0F2uhrdhMtwS+E3oskieFAZGrQRTn+twyQQuHQHRlIMfmSTij208/ZB2yLiN
         LuK69KBzbGbaTMs1SZw3xKlK3Niipbwm+zr0rmkGHDO29ceXtyfzmJJ5NlY6odOUXDlR
         UbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842616; x=1779447416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbCGYTJ9XgtrEdhTeKYZEhpo7oEx0nJTLTNraTLBcOo=;
        b=kP27QzPljCXz87BYUdu3SLv0C8PMVHy53+wNP7UonpfGplNo9CRJ0oTepINOmZ4o1F
         N3BJOrw6ogjJ7D71UZ4bVVSMzWlZK+yAO5nNt5J9DDQTrElhLA6iCSjkrS4XuFhP/qu7
         MgyzNwNnV8hkbwgzq+vAkiMHuTIV7W+wCfK9pU9ZVQJJ6WTroCDUp+TlvYbOs/O0kpDy
         +yJUyNf0aja6TusKYXJWr8e8onOTu1gZGprXiilbblknkM4V2dGiPRlPu/ItovGSsohU
         es6ogcmEGCrWdbhJytQ5loBqWjEsGhZRbVkBhJFraDqmnifL9zwBpbCE50MKkcYsvY80
         8vIg==
X-Gm-Message-State: AOJu0YzVqyWDVMYGoRpatG8XnTJfIO0yH9bnzQtWN/+Jocsx+2iPxT6Q
	9nbQ4d9twPsZ4CoARI+d/TABuLdS5EBDaXGt2JP8wweml3JP4bPAWRjgw7RiGhxWhbOnutZxcMX
	PKm8K3uxsF7GXhckvx2MTZ9ug6+qjyqHzW9Mauk20TKIxszUvshkR0FZExCjYAg8+ZA==
X-Gm-Gg: Acq92OE9zcVBxGJUananTUDQ1joKuO16QB1SppNOahNiPBJcE6WLKKkL+jor7QWapOL
	F6xBpr1c17qWyPdIK7IanfDlZ60Q6doVnfanBiGs2m36OAEGM5B92NeNfiCBYlVHT50xXoc9t3g
	8ndujcd4DJHjZtjWC9aGIHA4D2qXVv5BIXm2oVqweZrO2adguNT/bxXBq44iJUKk/XVCegV0M7T
	OmJSBxB2JuvyfXeyg9a23fy5/nJJLQAGTXddgmNa5PQJPoWp1uPzlwv/IEnTl6knDH8YDffTce0
	rGvw+/MEKj0F7PDMlrnk8b2eKWdticvYcRP6W9+qGNjPWm5vIbjEUAEyvHH56/WJ6xESrGJQfNZ
	XpqDb0SrHYkKT+fTMvoFEe+g6Q8/ES0rkkxilIv+HHyu8EUnSkknS5aq/WNT/4znuDhdjhrIj26
	FJsMbeyK2H0N53L4MzMZ6jve5eLOp6hPqZqKs=
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr47566121cf.23.1778842616067;
        Fri, 15 May 2026 03:56:56 -0700 (PDT)
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr47565681cf.23.1778842615541;
        Fri, 15 May 2026 03:56:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:37 +0300
Subject: [PATCH v7 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-3-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4751;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TuvevisC6NgIoFbLRdku2jdxwJ91bZ+rBxKii6P1RQo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbb749tqaYuEV8mBaV9EbdcnSl9fLWVdLvg5RsMS++nV
 jm4r9rRyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ6Kiy/7OJUGg7uKPrK9sJ
 LzaH/n6WWR5JM7iC1nwUzTJq4J/3UqHsxWzfZH2VsoR4q7q5KTqHN/6rZTkjY+e7OWu5vmhgnHb
 f9+wFJbHRSku9BFZYtH0TlORV/LS14mluXu/bWJZCK5dNWy+HJsx8OVePcR2Xdw9Xc9S1a9N+3X
 l/59kufvZFOxmj3ugF95+PetDZvG4t89t9U567vRN//uiQlcnnRn52fp8A/hn6Ux5NkvY2zXqX/
 GpvWqL2QfaUU4USzvnC95qPxy6smiO1PL+k4cYdtm1yshLXi/NnfJCK2q7/+my97HHbb3HFi2pW
 qxaFBCYX3WBVMjjx2WbacqY3PWIiZ5OPOrdaiq9S1ZwPAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: frePSuOXpDY2jkpYE_rxm39ccmWg7y-k
X-Proofpoint-GUID: frePSuOXpDY2jkpYE_rxm39ccmWg7y-k
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fbf8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5etVbCIt5GNeBr577cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXyKHtOHoUdnZk
 vdR0JQYLPeEc8nMhuVhYEFN/LIFdRrSdBQdmJkBlJoBnUtS3y7L33sAi249aWrmw5JUqsYnoXMZ
 hnsKzjDZi8oHavXoU54pbq1OWQaJu3wO7/91nWwZlF1Hq1f3ziU0xAQNCUTAwMsfboXvUR6IeC2
 zyK9JOxCQqu/yQajoE5ML/x/anINwZFOk/mEftEwopS6ywZ5VRKexJdjflbYUIU5FRj2Yg7YBZN
 /u/xBz1IjCuaeY3+K/QDCNAqmV+RPJHgXDq4iHWDAEpOFNtdHUMfwJvekT2vvbkfGVdi5+4owY/
 NI7gZwbVne6W7OBRCOLULS+E0YnUZhSwfZSBCHFvc0+GH67lNQnbAyiWN6GBxOLFvjUZ/92N8iZ
 IUDeKQX4QIJsdtiZIKvz/9t118esh5MXtLl5fOhCO3fhxbtu462ke/v7/DHQPicJlBV606AW5IT
 fzJx6BUlVEJUtw2HpLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: B684354E741
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61662-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[5.42.239.224:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Iris core on SC8280XP.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b09bc6f3b518..092b5c369f95 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -11,13 +11,16 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -692,6 +695,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: video-region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4182,6 +4190,97 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>,
+					<&rpmhpd SC8280XP_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2a00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3



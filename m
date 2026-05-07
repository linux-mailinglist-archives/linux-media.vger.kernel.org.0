Return-Path: <linux-media+bounces-60865-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNIzN2EX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60865-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC64EFEC4
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F7013063640
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E6B3D3CE5;
	Thu,  7 May 2026 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCQoeyTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY84Ia4U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73B03D3492
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194214; cv=none; b=gd05TzknGDY+nOAwaavNdQa8lYzofAYcY5w9Ut7GBLHkvET+I3Opkdp/GkkTO6v8KW7IpoQPdzfjYUqNr3FsUrez+ej9pt+2JOxmW/Ywu0drVTRVi1jzvP6ww1yRDTklw0+MJBeTpObP53o06JMthuziV6HtAXAA1JyAM3i5u8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194214; c=relaxed/simple;
	bh=DeoGvIk2JM6d3iYKy2epXQEX0HxjaKrwSQKtJe5us/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMGcRjb6vsZlGO1P5cS9rxwqEdXnJ8u371jZUo5BEM+IEOUdsJqLMI3qSUMrKjFBY6h4fAHizOq6lIvWQnupdKUZqltDFD6TANCEZtjiqbjfLQH37Q2IH+AgQr6s1Xj826+Lbt/CZqhP+QJItzX+XkmP7bBpk14QunWtvPKnMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCQoeyTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY84Ia4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647IBjCX2771491
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=; b=mCQoeyTpvVA7XDYn
	ZJ3rL90ZeOGF12kxncfq0nwsHq0+hl9jeWIqVrJyX34O39r6SHIQuPGMBduHpyeQ
	uV32k9OdLE91iCmWbyfcEgi7EQnxrBHnynuYk2XknEWh9EszpJgM08yjF/BVDW+6
	nLsHvSLahnbyUZGVpc/9qsrv7lUr5j/9RxW2vZxlwuKGOTjknbCQ4mkfoO4E2QCb
	AP9PMNeNN5mgW1+xhf9TPCwYOcwZN+Xls53EMqkDBYDGoGM913ftm5DNl7xLBWam
	E7jFutzSm4uhPoc2w2Kcr5hYr7oiZgRAb6coakDzXDhePcAjZsoXDcd2mIsdIoV/
	uGk1OQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5gum2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so3246109241.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194211; x=1778799011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=hY84Ia4UACwUitlRjctguziFEGWLtwiJU5yxbCZbmLM3QIHWabZ9D0m2oO+7u7Yqcq
         fXdEcXDqM86PCWjjXvHakGpxgWPYBN5jCMQ/h24ef1gadthThUfBLDZOszeW6NVs0qvu
         PnbhfDZIOH7enMVbYtMEcQrNbrOjSoYGmhWhKyHw8eWZT1QsN9Nflk3Q/yy3/9NAtEIy
         HuF1UzN0RlZICpmEplkKm+XqMksPkaZcSsKeuDyrtuzuPn4VcjyqciCHtL+t5km914gr
         s/2rB8hWAw/wQ4i2LOn+jIlF1xwu1NCxWhfLLdueQY28jP8MY3wC8BrlUtD+YHwJQYNS
         IuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194211; x=1778799011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9vAhl3V7MUdd4qjbESfTeY51BTylAF+5R3us3v248k=;
        b=mVSK8JnV/axrLH+txKI5cgmbrMvlkmx/iRU9s6GtQd5dYKPKoWP/beCBrjZw+1ltFv
         DDP13UmuEbzgv+VE62mamYBGp81naPiOiKuu9FCjVh5ykBCYsU3JB1dTuHBOR8zF3Whc
         SNuDQdSg/TLhDN3K+FSUhxVg4ZEd5/a5RQCUud92KtDYVm9NJWucwdHr3VeKxOBY9hLQ
         l0KTHm3ddbuUeWWgYQasJw74HZdvIhG2PnJHgpjJEzZBlkQHBCK9K55o1nxzagHON1X8
         npqkP+0al6g6oy4QkCTInYAIZ+SwRAkEjfhd2a33QRUOtp63L/pxQNleRdK4S4wodHNz
         MMeQ==
X-Gm-Message-State: AOJu0YwvDi1uduC1I2OI2nD7fim4k01yRDnDKM5bA1GuuT7eT9HFt9lg
	/zyiF4IJF5xiGvo/XsyyN638W9Ks76jOzOUTjqAtm+dxCHepFDkpdbQYUWraWFSfw4XGcFNc0IL
	61lm6FVsULvaCYFwjs4VBVGEjlY0TVugiCk15oLdk7vWSV7TidkNELNB1vjxMPXQ47Q==
X-Gm-Gg: AeBDievUlHhKep9x509kPWEW5PwD9qzBYW8y0U4+W1JBBtK7+u4hkCTBgcqZ60Yr0ri
	kPlCzURVylh8e3lOn9nMSzULmMqbF7XjKhpuu8DrkWVfP6rYOAgzMxBzCUo+n5LaMwiUuEjYQ+r
	HjEcSQi/yYCcGqd3iC29hg+WQ111YNlpqqC2eoV4X7yphCzIAvWFJDfOlhlku5O+Cs36/ZXIHZY
	nr4cfptpCxCanoWNRtH0uUrRSBlWjIkij1uJ8n4MaMo2KJDrsSzQMXrBij/ViCE4Lu3t8G1Oj46
	FVDgw2e+l1zMRv/Utq0dZKD+fhXpmSi/riu67O2SNkDMRLFf3sjQPGd8ehyxavygl9/g7psOokP
	6c6cSV4Rs7NtWwwozGp2mAldX2byjxKKQiYNiUj7ImThkUXf/SkinmIVpbQB80yM6wtfosIatyp
	HDPDJcNOx5AGond+bG
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101564137.20.1778194211136;
        Thu, 07 May 2026 15:50:11 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:607:d68f:d0f6 with SMTP id ada2fe7eead31-631160350cfmr2101543137.20.1778194210720;
        Thu, 07 May 2026 15:50:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:17 +0200
Subject: [PATCH v3 02/15] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-2-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fd1723 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gZ4aIBoJpEVIEF-KsNAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: BNkiSC0crdS82fMsx70J8NBPPESd1qTq
X-Proofpoint-ORIG-GUID: BNkiSC0crdS82fMsx70J8NBPPESd1qTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX2axpQvMVfj0D
 0UintcPdET7YLPV2juVwzab6Y46fooz/Gqfd+TM5EstPti5z9y27Uv/+r4hNLJRLapY79J7DztF
 8qfh4mnFVpe3Fb2aijUWI2K6RDe2+jrsXQi6l0ybjlr5UovkGR4Fw4XPPA+1Rk6MKPW5JmaPS7P
 qqf7tfCKT8x8reFmuqdFvF4JtgUDRPAi78ZatKM36L6J7yujpf3np2tt2Br1R7EguiEGyzyB8qK
 6ZJ6s4c8eyEuCxlLGVnhHgQRpqUZN5OSq2coVFWADXVRFPNMvn8mdJaIE+KIqF+ASSiuJ/N8K6/
 ECsvQm+eslf1WhWKLHg0yaeWd+7xwjorkLUdspk7cWoLUD6e+jolMtYZPusjTRB99NU/HGfBbqu
 /k/xhEe34KpP1GlWt6NARB0OjZL82uLBcZoYLDqw//qRO7v5txZeH8Ei9FHpUkrpCHAwuaSA2mf
 6OnvUwCCsWIxvQgRrKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 70FC64EFEC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60865-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb and axi clocks with their appropriate
nominal rates so they can be managed automatically through the PM
clock framework (both are part of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c37d5bfb4072d4d94a8abd453b89c9aad7e15001..3bde26c4750ea932ea69fdbf5c5da9f959e5e5e2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4830,6 +4830,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1



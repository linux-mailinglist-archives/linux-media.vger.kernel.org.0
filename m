Return-Path: <linux-media+bounces-61424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI5+CbZwBGprIQIAu9opvQ
	(envelope-from <linux-media+bounces-61424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:38:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D18533237
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3E01305C986
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA0C43CEC4;
	Wed, 13 May 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCz77HSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkBMhAfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7641323A
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675704; cv=none; b=cnLwIDG3CFWVB95moMUTke2QcS0uMOaVmebACycP5vR+N5KvoABmLjSaPdWkSPDMgF4JtKoOGuoPXmrFxwWShg2f2WDp6wW8lWKYYVht4ZYkh5zHzBSZkIH1+9ZJfW1neug7cbgQ5sycwXQWC9BzxMjX7sXsKk6vxELRyRhX7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675704; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3ouyBhPT7tfcEhdODK/KfYclK4pj0dS44GNOx1SrPBYd3DkQZbL8uOFS3Du/ofHOb4zUC7m2FJgQIMx0b5L2Sl8DMDOdQ1kytqws+zIWOscuFI56PgnZpuV26Pk2yM0/rQTEE1qW1IhlUToj/9wfYKB9PTuE8fwvOPuP7rvP88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCz77HSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkBMhAfZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVqfX1393146
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=eCz77HSMAXJY/8Pn
	oHuBX0EPTn4a2bnIFNRxpXmwlqRUICj40yJuH1kmLcA9wiRJj7JyHuqK0bc0EUyk
	0MLSJhcBGaHGhXEkQjX/7x2VqadS7QuVw4MiwS9AypXCHXf/jgAg9mX2wICsyGvk
	GVPiaIrZiP4pNY4QqAIfKVCgXUuIfbbAvP8n3dMnOTBIoP0kcjDKqCbvhb0UiUxT
	PWNqgWHacfeB4uohkSRqR2uv+LRK0twnHZHdR9yVtf+HlKKCuvqc5kqFyy6b7kwS
	w7eGci1+gLXwoXtQyZE9f73g3Dx1aTicGmudXFY/bt6zzGIX528gIWQGYVUcXl9a
	n/lWzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261mr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:35:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso161097991cf.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675700; x=1779280500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=LkBMhAfZp8heKlRoac2Sg8H4YCROuctQ79avnOwpwu23FgZoK4q4x4PuL/mXUMclWO
         tTR8jBt8YMC4MXNxndI5rHHxQXOLQlpUn2QhyxRgwL91GOZwU58sJthpj0ITGUC8Jz1p
         TQGP7mD/RH5GcdIivJey0CYeGHbZkIosKQMtxhDCqWQnFSnQufTF/ylWLxJWD+18rgHo
         dJVBJsjuIQ5md2X5SxSJLKQbmeC7/cm1+qUBLg291XcGY8KuQvLuX1gNeEZudJWuILY7
         xz0CAZb2E0Hxizx6vY7UuoKD70egWSLCOJuC9oJsFBHMfn8LUOt8s4oH8zXBM1XWmxZA
         fzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675700; x=1779280500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=ECYBH047sPkt07a4nhh0xqugawA4zFb4h1SVi6VEo9HrIDM9W5+z61pmpjH1tW7LKZ
         y1G7BAmsKMMacr49fPas0Gs6fTP7ljVmyxDzmv+YSQSmE0YVNdE1oEJ3ZLNmDpEN/pXf
         QoV2DsTHGRzXBauTfnIezWUL0XzXOUQ7n0aYc4Y/0+ny5iOQUxwwVsytpv9M9Zfx0Ora
         qATwDnkM2e/saWOyXQu4388bgu0IRufi9ZpV977NrSGqZW3p3viFeWML+OZQheLzOKuM
         SDWY5gp6osCfnVa1Lyma67iuwNH2KPptcGnhfXKTJfUd1qL5fKjb1Xg+pGBgE3LBz8iZ
         7Olw==
X-Gm-Message-State: AOJu0Ywzcvo7hEeIoUjUG58Vp58QtcSD8J+HbeGIkfXnsDV9reQVsDTn
	zZpwFAF5ldnpdhU+vyPZIeAWI6QH54H3SEPD9t56t7yhhsOSv407pUtH1zlx1VgGVSE/71Qj/Or
	eJtgKM1gurRMtf1qB5BXSMek8ZuHwrSBjOFaM+Afa31GD/LGiip95v2ALnhveQDSxiA==
X-Gm-Gg: Acq92OFA3DSlUT8Ubj7+0mI/muF1/vVsNiSlJhK6t3TJfXS+1asonLfGQJA8sbhCrA3
	5Koz2JkhyVtnMzIs3s/tdW3urE2+aUsrEjXpp/Wrnaj5xAOGFmuYEcYM1nxnsPvREaqWRKVYXMt
	NxS43pQW+poyAH5600IHOS3DESDJpbtBWTachEmUAZ0iiyPPfxzOzvfwix4SWiAeISbaVKdH2P6
	Xv8insFXOHvoTSR84Dzkm9wstutpuAXIHvxLAG3QO233CTCE2BclTwGj5/1m5GK49rowkfikUcs
	2p3Yfwd515WkiwmJwcGS2ktk4fTGttLLbJxK/ZisHKNY0nR58rLsIKyJH2NiLKw8EZ1nDhnGJHH
	HzAbgodpetlGfmAgKEL1rNlxpnJ5bl0zmvpsYLntnB95L0ArgDD6T+xWbFwJ+vS+Oxb2f3t5yeM
	t5Y0fHhqAB8JXEmhOH0G4J9t6Zy5mVIJ3M6ns=
X-Received: by 2002:a05:622a:a17:b0:50f:bc91:709 with SMTP id d75a77b69052e-5162ff0cbd4mr35335371cf.39.1778675700495;
        Wed, 13 May 2026 05:35:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:50f:bc91:709 with SMTP id d75a77b69052e-5162ff0cbd4mr35335051cf.39.1778675700087;
        Wed, 13 May 2026 05:35:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660c1sm4132610e87.66.2026.05.13.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:34:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:34:48 +0300
Subject: [PATCH v6 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-sc8280xp-v6-6-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
In-Reply-To: <20260513-iris-sc8280xp-v6-0-0d11d90d3e26@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBG/mMzuZ2CO8MKO5+uhvdxsyiKGr3SmewIBjq
 QM1hUvPXESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRv5gAKCRCLPIo+Aiko
 1RxrCACy03R5HrcGKACC1VcQJ6q81GOpEocy5kSrC/3h20cc7Qm2HjPWhzVsCwUu7A2oKtrv3qM
 T0im3Q2gLN+WshzPl+Mega75B4nwugyS1+UNvu1OM52iwvu5ebPKDcjlTecErqSD9oJLaunGtWJ
 jBawKFIIsdOfUscDUwZaAP88irxRS8AhyoYI9AYsqHRLYAzOj6a3pBVcyRru00dcgSj85GK+rjI
 caJOl5R3GIf0f0dV9TX5X859MSbI58M2sc57Kg58OpIJ5nDRcKvTjTDpwdLXSUqFFTEGUSDiSWA
 fI2M55btufSr6ldBYIzUO/1kvhJ5aHiwuiDysSKEwnMFtRzm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a046ff5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMSBTYWx0ZWRfX0Q3fQ8PwpbkI
 LPSZQUcAuiwSbqvNSJE0t8Ck41FtJYX6Y6ZUoIIUweUe29kOrKMwPJ00Id4ozo6YjvdIWkENwVq
 jl9nuzZ8rJAUIK/jZflvxpCSo07OiBTre95uEcVODjLdrIzccyg9VOS9O5E+VAGHo6Xk9XuMpXm
 YziKjOz4mfihs8RLpg9fcFvrDzAdWR2z3jujNGDvwbB0y7u6mw18YahX0HLByoundgXpGi36odV
 CVkYLuYXEYbCJCOcQveHK/HEBq5TdZoHzTQIY1iUgxaTko3JfL7iYFhUZidcHSRQHL6vxSUuXvR
 ryQNlWD6DWsVSjgEhZpgg0OXejYHiHMh+TOoImqO3ULsjqWizsSLna1lr7k8q97fdfA9u8mAEBu
 jB1tOQdPMH5BXngPAU4d/ligag9GXvgtZs1GhUZUvPNy4J0Q2Cn8T2kMnagonj2JBzyIUCT9Z0C
 50n5boRUprTk8c7EycQ==
X-Proofpoint-ORIG-GUID: 3gyXh3NRRBUrwVBmLNZwqkejID3v6vwc
X-Proofpoint-GUID: 3gyXh3NRRBUrwVBmLNZwqkejID3v6vwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130131
X-Rspamd-Queue-Id: 28D18533237
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61424-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3



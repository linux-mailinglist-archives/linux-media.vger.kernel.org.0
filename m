Return-Path: <linux-media+bounces-51657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFgmBZ6ueGlasAEAu9opvQ
	(envelope-from <linux-media+bounces-51657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F44944B8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B8853008470
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104DE34D4DE;
	Tue, 27 Jan 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkHF303U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iapn7+m5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897634D4FB
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516598; cv=none; b=oF7D9sAJ87I5Kpc1xhguVu4cs/+RgmQaFXfqfeYToVKCdCNIG6EaJJ1S/APYO9anXdepvWapFHTkHWYaxlGDi/7KsQ/RVpJIJ7T2k/PGz0CXbPp1cLaaZBBeeY3U6Mqrn5XTh/T6m99Pt/w/BuIa4Ygee8YW72VZWM5Eap8U/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516598; c=relaxed/simple;
	bh=O6rDG01uuKhI+p5aawFUM6OGJMTB29WlyXqC3eML6Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHyAT/HzfKzcU+sbK9MNZFUT2FC8bO3s40VBS7Wy2cVnnmN1D+vNQOdSkFC9kvlfeZ941kcTwtsa1vVEWh7dO6jYfxrejo0Jt0ZfP0PHbbEBHag9onccUIwlY8PrLLH35DFpnJF/tBoxiwe8zdn/EodIfmOQ7KahlWcJ0UVfmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZkHF303U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iapn7+m5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RATGbe495967
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=; b=ZkHF303UhEKwwtrI
	g7ufgwgU1ZzxxDghaTI2YvIxmT/LSaS2+oOPV3NoBAMySE6ATBTPkdW1YiqdgDcS
	I3Q6SE1LJbtdTxShejon/mfeGxwp1Q6w+fl/2Ap5H14g2fBUvpFBs9bW/aFbStgK
	m3rmGtSdfxQZjpurnKBzGUkKtsI+t3w/0aHreUkV0M+ahvZ6aZ9H7Yp2UStpRwxe
	9HBqfaaj2imXnaW2EIpufoVKaEd0ICT2wyE7L7PLQypCQ6iB3/DkgVaEXq+iAP/D
	FOSAIeDGHZV5pr0+xM68KmsynognwLJwZQZOuBdyfEqy5b/Vy87f3euFl1tyUfKb
	K8r6dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3bjq3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9431a97992aso21792966241.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516591; x=1770121391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=;
        b=Iapn7+m5Lwe0b1vp4moqhfoiuCDRj3KHk8VBZPCGumYkhmE7OB807PCt/EW9UnSJ6/
         0+xMEnIBFdBCJbuTNhOiaHN4bRUxIt0v8hNHqh22jDm69gfbXkLNC4p/Fp+Jto5dCqmr
         9npeLANq8Kg7MNMlHW+EhV1DfYitHTUVqyhkpRveFE7f0Lz1cqxPT6cInlZ4hZn8Cpjs
         a2a6yT3i4yg/I2MqkyFIyPQL74NbrZZbPkC7vcvH8QossJFvQIlO+V+39IsUjFV8RsLK
         aRUXW7hPJ/TJLUEDASDlkxIk0kh1Z/5YKkSciLPb+RV9vYQCLk0YFOlYW3SzdoDeIYJ/
         GOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516591; x=1770121391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X+oDnrqs14XAXLjkyy0vgrxBDcXxr0LVxm/6KC6d1bc=;
        b=cQnj70gTOXIY+Nzr9abrJ/QTeeukYQXzfUB2npIpZAa/UdvXw/CL/vJ7BlepKzJQmI
         vlGC2evyboYKjk+VhJmn6e2Y2dJvhllQX9VK/JItK5IK5LKvIQKGmbLOhusRkQ1ThljI
         I8y7urLTSTYc5/xvlMasMOSQ/ODSiQ6nG8ra7bBWJaLVv4nLDmqyHgx/wUzmAysHfC+E
         x/X/mXhFEZZjfaStE6zFaj1pRyW1k0svTOUTZAMNCg54pzJxwWs9X/kLMXY+NV0+VdfN
         /fQr0UIuP+0rLnm5Jb9PXo6Ta6gw7Wp2LaXQXNX6sEtud4mfHo63EAJBmCM7z2y9Kpf1
         nl3g==
X-Gm-Message-State: AOJu0Ywi2Bsd72ZYBwhWWpYd6/enojbdPAeChMqvGefLcnyCPFpcPb3K
	My/bDbBbxF4ZtB+dJIjbg3kPiZQN0gI9T8Ms/m89IuRDhg45jHgdmLl6Xtc10M7j64v0bQ6qL5E
	XlmzUTOoCJBFPeJmpwUIVaGUeeglhbzV0FnDhVAq6qyQJ6pD3C1YldLfN+sbcyuZaIA==
X-Gm-Gg: AZuq6aJfWyvKW4rSRziUGOlQNnr20mFiYIwyx6B15HUKvePfbEkBnQrWrgbvcUOO2Vx
	UrAIp3hZkcnP/ndD+EYd7AdAq81k1thLdILKaGL/ZbhyBpgKn5dmGambAU9YMMZQvZ63j4Jgsb5
	/T3HiTehU9wvlIcDcXa7Qm4GQn2J0JPWXxTciwKWlbAlVxWgRpWozjmivRGLe3mdt9lXqM/bV/n
	aoVsoidZo8I3PolVJtafDcl7dizAlttrkjQ3LDheEYeasMFM1yNt92865AF2s0k7VPNwN6eX2fO
	oJsfrFmDkdBkiC/DKmKgNMbAKtuK1up/+rbDprKzmtYZZpt7B0j+0sATgkZynrbkYFQ7al7Nfjx
	lhmCQod6rsq6TvjiscC3c3T7tyAfXyf9JGhetbHsb9E2LIIcHHK5kB8xkRG802TW3NbkeuvKoRD
	NmpTc+hy0Ha0CdJ95oOKuMu8Q=
X-Received: by 2002:a05:6102:5492:b0:5db:d60a:6b1a with SMTP id ada2fe7eead31-5f723811ad4mr928528137.30.1769516591067;
        Tue, 27 Jan 2026 04:23:11 -0800 (PST)
X-Received: by 2002:a05:6102:5492:b0:5db:d60a:6b1a with SMTP id ada2fe7eead31-5f723811ad4mr928505137.30.1769516590620;
        Tue, 27 Jan 2026 04:23:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:03 +0200
Subject: [PATCH v3 4/4] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-4-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=O6rDG01uuKhI+p5aawFUM6OGJMTB29WlyXqC3eML6Y0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpeK4mv48HyhHRJB1xy9Fj/VwTAdT9q4lho1IqU
 rhXjH45KUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXiuJgAKCRCLPIo+Aiko
 1bpZCACbRjwawbbj4eT0N4rNQ6vV37xnqhofZJOQ1e1Ia1pEkDdMQ8HueJq2D8SR/ry2WEAfkX4
 imhemVutFwtlDR5BFNUK3FI8ESM5Xgl9+WKU3Mdohp1+rJr72IMerPenQFPvUiNd1ZX8+9DLbNu
 ujVN1Xz22XelD7HfZmIqN3nZNVUAXFHamKCWURQ/BJKpieCfaz+JkRat3neWgR0csqWSfxu0CRY
 xPYZlZJ7HVjGPSBksPrRCVL8Tb51Tk2HSdgZ/zUlXfSHzVIef5nUTBh8/CIhIb6qpA0TN6X7kR0
 I0csveL2bbEqwIlON7cgPQPJv86hAXNSlzyfZodlXhn0deZX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DfLy0tbvZd_4Xiu3SnM-y2BUtYEKYkMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX6mmYNRuTEOO7
 4BBKcT1vIn/yD4iTuGsVUgoEaJtWC1UaYpquIU/R2U0moOXoeW+xCM1p72bHzjvjOKhHGFEm3MG
 s0dC2w4pBz++NFLY+TfNgl1mhVWHel6byj1NLbr6ZIcE08p5bv1FMTqgC7tpb7xDUdyzNifWw+U
 yLgpyPuJRpEBM82cZOT0aDoYo0dfTpHZwQ6Jh5Fw1Fv/uW5ok7iCLJkvstN8syp/Cw+rjgfO+v0
 pwl6Yn78e41cwQQpWNWOwpx84Khw0C3/mg5RpNdq8V0JD15eMfqkBsAPuXBKcz4BhAngYrXiHSo
 X/Ebz1rAF+4A875hf2bDE7fKAojm0HrDgDiA9cpPgTVwEKd5pz9yHyHy28nyAv2cSc3FBmnCbDm
 ijMJ+nsxF1rVP3a+rOrffajuq4Hjg/JH5M3H9NQZZud25fkc+2jX8jUVyirw8I9zRLWdtojwd1G
 Wsuznm8iNBGuoQgFHtw==
X-Proofpoint-GUID: DfLy0tbvZd_4Xiu3SnM-y2BUtYEKYkMC
X-Authority-Analysis: v=2.4 cv=AOFXvqQI c=1 sm=1 tr=0 ts=6978ae30 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ch7mjRkEqDhx0_hr-tEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51657-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.30:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73F44944B8
X-Rspamd-Action: no action

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c |  2 --
 drivers/media/platform/qcom/venus/core.c      |  6 ++++++
 drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..7b612ad37e4f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 24d2b2fd0340..646dae3407b4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c7acacaa53b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {

-- 
2.47.3



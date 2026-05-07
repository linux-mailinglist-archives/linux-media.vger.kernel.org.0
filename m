Return-Path: <linux-media+bounces-60693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NXAFOLm+2kaHwAAu9opvQ
	(envelope-from <linux-media+bounces-60693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C352A4E1DED
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A93E30485CE
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BD426F289;
	Thu,  7 May 2026 01:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrQAkdoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPa0i+mb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADB2609E3
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778116258; cv=none; b=QknU1y9kTgOmAZSsyGb5ytySpnH1R7DC5+hecyCK7ktw2KolWhF2QcP4kwOshcxbJZLnB0juEudBqLNH+M0wPiFWEMaF8nmKAwkWNT/+3JfjnAQZwkni1Dr2duSmWw/jQL0QTbUGeMCNKMyIp14Ug55m2X9RjIFjvCgl02sGfEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778116258; c=relaxed/simple;
	bh=1QlP7Ht2G4UJJw6JsObuL9FKuIo3jLuJ5rs2/0xHro8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWf4rUmPY15CB/OHteDIlcvS5n99z9jNsorQbjn7F7t2DcwvAQ0We48EYrP4IBlJZKDutSBGLpwuISMFDNMf5w+bjeIuCkPNSnlbEUWmE58VaWm3uNBfWQEr5Jr97/ENYr3QEHBRAmZrEfhgQVGtSiuN4MMylz4VHNVxvfwkf/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrQAkdoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPa0i+mb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646MLJrn3309059
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 01:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=; b=XrQAkdoGV6aznQRb
	Zk7jL/AJot66c85Wk2j2diVCfJtT2+HoQDiuZP6FjWbPrStDJo1gzhvIDKI+QT0/
	WNZ5UfSYdaa5l3Ff4eRQPETOOUSgZZihF9CIPSQ7Mz6LihHTtnM1g7T42QWPVksA
	YZ/Xv+iOva1IBtLDJEWRToPJD2lbTb9ogfpoosPY1Q7IeIjii0KX5xLkUS7J/5gv
	S2uD0xbC6cq9E8eHN214dE+yQXV26QRjb0gE5NBnDi6aieTIVjTfJHNEE64EaN6b
	bwK3Qfxi87P9TeyHXjrhQm9LwL+yxA1gX4/Wujs7hD4ZAtRYtATb9dfw2UX9qj9x
	dio9lg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sj2xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:10:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eaee67d1bcso73225685a.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778116255; x=1778721055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
        b=jPa0i+mbunTS21Pbqt7mNZ9PD2mFk8WBmMkeLAuBDe1bA2EF5VJPO6L50rrsFiL5S7
         vo1LXUqS2oHRHX/EwMtOQCQF+rleI1tFrXpZkaOeK1lxzUncVo5q6RcWSkuLAIOBgzpc
         jmslQX4BGTyWqRC/nzaE+G+Hwbuvyyn4s2+Q6nZ6LzZ7fpBfsMk3sQQqWYSGUb2g0UNg
         VBaxBQQTONjlLTSD1NsqqRiyqM5BQv+/bkZxjPQyJh/n4vHucTkDCFDmzQsOiyV8WLRt
         uiQUGOKOmZArzPgcAmNkMtBzH2vsOWQs4Wm60nDKG259JNSWMQZVi+bRuKw9S+siXRYe
         9C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778116255; x=1778721055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Quz1+hYLS+IVpR4ioPDtziPJPuojhivjRtEFcR5Dsis=;
        b=gI03eWvH/AymNCpAzLQAsdmYbKT6raACmya2r92qtQsgrcfNXBEf/lAIKdUQWF4dkW
         CqLgMtth8NSzHkZuQEGOVyTEgXqnI1hopBhJci0qdWEEszpOEPq+NPi1mgQc9r3gEO/s
         9F/PCoPkCqBgCmcIWcpADRvv5IOZC6wXZ5yVsA5zaEZV0vbGGcvg4TYqiAvSPBA9XdqJ
         GhzjJYNZgOk+gzN9Ju7x3Qm/3aMPKbvFdcgK4hYmhhw4mBfcuIYi+U2UKXTDtZ0dYq57
         jV3nxXi2y/m+epC/tcolnZjEXVqM23azCc0z+HZBf2Y4wACbFMubr0ZkvtEBOsBbDXgX
         hfew==
X-Forwarded-Encrypted: i=1; AFNElJ/roAV6Q15YH0uSypMmXBSSgH7I/2xJ7cuj8vTG4MJFzMYjDww32pPb/RhohJNu5gqd4voMD7yxZ4Yrtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5rSucdVla7dLksVNzxaMVL6z74rGWkhrcTNIKPi01Osz2Wm85
	3YBFMpiy5vv8ZV4S2+itIiobWrO91LzHniQS8t7zI1E0f0fwUYHoJDrAxfzsKyDSd/76wVm/VNT
	iqHgU4nwJc2oDda2ETOYwNWJajlEA+QFCIF0Th+/ki6lU74GgC7cyJCuz/mWT2Awd5Q==
X-Gm-Gg: AeBDietfxavo9NS8q5gp62X8npBIiGsyAafNaGldhMCDtjVMFjVQWvaB/urFedOzCv5
	GR81WJzMQkHYHULY7Slk8aOn4qdF0Wexc7GsZHRNkUDFSh3fynyjNkzeOHU6iG0JxGEu7AhPF/W
	0pt0mAM69g6ULkBnfg4bohqadjDmdRk/ocMWtpoUV7YQIsj/oabQjiGKvtqqWd96DGlxwF3hYvD
	1+oz6CGN4BjtIvz2pBrouepHGOhGoU0E9IO/p3jXAFibTlGLtpxPp8ejq3WUEg5NWZPpLd9jcGw
	UZQtPpxv1TrbVe51CTw797KZJzOmxXLdihhn6dNyWuoB+36eygMx9de4npl+xJswTTDEicEnyuD
	/xRj8bGHWn8uc6fDQaUNqCh4zFmSl7hKqqMVzeCRaPnAbcU9YGk29Wnp80WznmGXPRa/qiPO9Uu
	hLR1q8eW2lFEbdTbm2csX/A2vHQ4pdFpW16/EOqN8IztgAIQ==
X-Received: by 2002:a05:620a:2a0d:b0:8eb:425:2ac6 with SMTP id af79cd13be357-904d4b59704mr841980685a.22.1778116255484;
        Wed, 06 May 2026 18:10:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0d:b0:8eb:425:2ac6 with SMTP id af79cd13be357-904d4b59704mr841976785a.22.1778116255030;
        Wed, 06 May 2026 18:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e00sm5221967e87.29.2026.05.06.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:10:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 04:10:42 +0300
Subject: [PATCH v5 3/7] media: iris: don't specify highest_bank_bit in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ubwc-v5-3-e9a3aee53c49@oss.qualcomm.com>
References: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ubwc-v5-0-e9a3aee53c49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2440;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1QlP7Ht2G4UJJw6JsObuL9FKuIo3jLuJ5rs2/0xHro8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp++aUhWXHJTdo70XvRKwJ6GRjpbcVSdIC2fJrd
 xPBFijrFsmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafvmlAAKCRCLPIo+Aiko
 1Uh1B/96m2qYOJuCsfVHLH0lul9CSxOjG2U4PRerFqmH8bb8xlJmk8iTl8H3b3z2W0kaUR/9v3C
 zcoTd+betfJO2GY0WJGeV8Qly8uQrOxAi+0s0gXC4WM4FG+F0nG+1qOxfVvxFuiD/Jaulm/OqQG
 BWdTVw+mMiwTOm4/BZYG7dT646CakPD2PjUdj5zde0R237T3ZGpJIK5KFf9Z1DSMfgruoscN1Sw
 lJrmBulZW4clIk5vSofy96LHfkXwhc6dyawR+7+jzviYgs7uCrzSeyQRy4HWn9NkVAnUr7C7yE0
 qchBripLPUCRVsgJsue9hwn9CegoLN6ii/15viWl9ip5FtWH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fbe6a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAwOSBTYWx0ZWRfX8QM0z5wEfj55
 eOiLYvwEyF4Wt5lSXJ5tItutgo8cKCKqd9lj3L4UAhz/uzJQGqJT6HIkRCYhCi+rgcej//HiSH2
 2BlMaJHc0qH3C7FPDpfXO9DDV4+/Hg51r2/E46ok0ON358aviZUW3qoQdkOeObsEDND3omNdOKP
 MFUiBEOTSsHnwcHpEYjgiZ4YdGkkzLHM/p5HkvN7EKBoB6FQteNLh9cW++/mrlBYrP3CK5RsEY/
 m8cFg95c5i2xahjHhWUy9+AL9MuVw5Qj3emB6d+TV+Cf9xGQEXEDiWz9sd28YmzO5rQXomFSLUb
 1ronVa9RDIxM67FnY9n8hnpDXhhETI+LY4xDC3KLadsgfS7R4t5Y8D0r9DegC6YgvcPOv9RK3Nb
 pB90wJrNldGQbZGCg5s+1ArAYCb9pY+7jhvb/yOoZKpbMLqYDMNJe7bQr8sLDkevEZEHjPukIv4
 vm971Gauh7AnbTlj+DA==
X-Proofpoint-ORIG-GUID: VCi7Y5pmuA5P7Sddi6vA99Cx_GqWGhhJ
X-Proofpoint-GUID: VCi7Y5pmuA5P7Sddi6vA99Cx_GqWGhhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070009
X-Rspamd-Queue-Id: C352A4E1DED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60693-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index aa4520b27739..6dc0cbaa9c19 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -160,7 +160,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 08a9529e599b..5639eb5a75b6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -77,7 +77,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 01c6ffa7e084..bdeb92e0b7bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -792,7 +792,6 @@ static const char * const sm8550_opp_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3



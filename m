Return-Path: <linux-media+bounces-56295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AvUIlKSu2mYlgIAu9opvQ
	(envelope-from <linux-media+bounces-56295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:06:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1D62C6845
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B757321FB9B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854C0346FA9;
	Thu, 19 Mar 2026 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLvzmMDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV1AzmeA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EB31619D
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900017; cv=none; b=ItuzWB6Z8nZXFGRfS5vr4x/Jy99NhdZt46hbuyLcRZUinaThiBcF7JyGeMoWnHKQzsJ+WXxPcJF5cHDwQslkKaqTU+n4Le9eidLyaUpo1E+NoljiNKwcgEuHtT1U4DY2liZHaEkgGBcv5bnfhZDp4lSgOLyneOh1gyqaF/sC9s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900017; c=relaxed/simple;
	bh=4aoxx1fP4chm37ZEt9fNlCeGqbvbUox4z5NZsa9woZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJUN/Lcn3+Rgt1uyJD4oOR5OYZ/MfXT2L20UcA03/J6QHmjKeJ1qTku/tgxfVhPaLEBtpF6iBsXXXIHhBamnu/tf2ffMQnQ8O49nrGU8RIJBmwFFaa+NOBB5xKZDs3WSNxiX5Q7VuyL5NbLgtqjQqFGsWCyL21gooWR9gTaNeSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLvzmMDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV1AzmeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XdM8831311
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=; b=ZLvzmMDms0B1uGol
	fXvJ3oGOsqJ6/LFZvTUNlB8oTKmjcU64vpYakJ1QVaDqF4nNjeYn0aBVCRyxoBf8
	Y/hh7aUIXlNSU3YMl8OM+f4nBZuNA10Hp4KR1MLntYuMVTdOi/HOald9jg7eEjos
	DNM0iKZAH5hjYSHeX8FILT77bh291zRSMxfywxM5XbVHo8phAZ9YG1UCirTfqLtt
	Nov5I8DTowy1Cj9taXZzJueWo/t87FNUuJlF+gQiGo7qZTMIaIVhJyRnKcUFpfbA
	NJKowdSvDTRtWuVz28r7wRF5A3evH+uxkyNYCZYwBnXdKw3B9OMWMGuGzbR854xL
	axqpsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j3sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 06:00:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509181cc6ebso7697681cf.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 23:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900014; x=1774504814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=;
        b=MV1AzmeAMGgPfi6Lp1iUKrWXSt2H4nHMogYV4HeX499PVXcoh4dZploKbgU00eqVs/
         uCQQnprXUOk44fydonAe+usK3Coivm4wv1EdwJ0vcDWxUM7YWVDBAbq2GSz9M9f6lELs
         qNsnpwmw1W8lVt/RozjTkDZW1IZsTHjo984OEBHsWmcKC8XVp2xqYGSUWuKEgLQAkQ5f
         SIst58YNjN8+xEQ21uSjjA/5tEcn16mhr1pqs0t974X/cIsx2Wgg0AV1K1qSw8a41t78
         KxKEMcsQDBd8T9pAkX8piCm8C/45ZBtG672hWVjaAQDdfBPD1zgqrNXmRvzNF/lLXsAE
         IEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900014; x=1774504814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuEIJo+d4oizJgAZbWxI05x+ea+KqPWOtAOdMUPV5/o=;
        b=e52W0Bq3tEVzy45SdKZx0mHZTyz4esRr0J8nFIBsT4oVuQR0tyknANfZdzXLk6unNX
         LLDl6vbDPSjG295jYK/r62nekkJZ5MSgQDExzW9xmOy90nXF8hXUQCtkZHD29bAxHpkN
         JEoTSnkSgH7crep6UXhrvHhbPIEy0fUTN7ExiOfVwgWAZrPkynW7h7e0iWj7Ak5SH1wA
         EtC/Hoq2dAhY5tXok9MGeJXroqCPdSl5vL50jnJfjSvvGE3N+Q6D6u10th6kMKU5NE+o
         xVrn36wXDbuZIPQ6NPZdDj88LPJ38Q6KTFNsO4YmOoIWvI9Qi+18ZxxtjBGHbfwJHdRM
         HDPg==
X-Gm-Message-State: AOJu0YzXiROoo4uoth5IqFAO1Rpwl84MLRKS+3Qrvj6/YPfzyl63syOW
	mV9UnZc/CPaYld470tunq4kdfmNJz+chdDI0fNZBcgQfgy8EudGSRgN8WE+GLdQIeFIMhdeTttz
	0MZpkg3Y8D5ztx7basAIwasCV3WZAYN0fRFiyRdc46S0HJYK7brMdk3juxkkDHaPu9LMI+8Ci9Q
	==
X-Gm-Gg: ATEYQzxGUpXsIcM0DjwJBND5xitvDiZwGb3j3GESvG9ingdipwjVyrORnY1aXY0UMew
	GMCBgZwjky5Txcsp2y63GVmPzG9eyUmLB9SWMU1YyusySSHPXZQzfQEVMiuzjowNDnoyGv+i6BF
	MmV6/3yNAOdxX4epDT3ewh+c4zzjKoOS+t0edQ9mcbsCnjryParTtjKEsXe/GLTSYqEULifPUbU
	Rxi+SbwNRduoUNRMlyqxNRILZpCqkax+AkdyEPGnbfAJIzLGnDwyBrjCYyOhJpAvIfURs2mGZ3p
	BoiMnLnch6LnbVjvn/oIRzOvCYcmGAi/Pk+BDA2D6g8sLf3AGTxjjA3NC3WrwBPQtXRd2UijNq3
	EUb1ScfSh31SyTlhFqMuAUaKOV6hrTXxsSQjpwAAoTIqDqOclJZh4ENMLJyhF5DpJ0NVNdxLCPO
	TEE1YIDXq/hmywfRke9znT8Mkre42Vry/2ifw=
X-Received: by 2002:ac8:580c:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-50b14858355mr80447961cf.43.1773900014465;
        Wed, 18 Mar 2026 23:00:14 -0700 (PDT)
X-Received: by 2002:ac8:580c:0:b0:509:116c:8e05 with SMTP id d75a77b69052e-50b14858355mr80447071cf.43.1773900013795;
        Wed, 18 Mar 2026 23:00:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c7415asm993174e87.56.2026.03.18.23.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:00:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:59:54 +0200
Subject: [PATCH v8 10/11] media: qcom: iris: use new firmware name for
 SM8250
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-iris-platform-data-v8-10-55a9566ebf60@oss.qualcomm.com>
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4aoxx1fP4chm37ZEt9fNlCeGqbvbUox4z5NZsa9woZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpu5DXjp6mcgPxYUZaUZGJb6w4H/rK0HtVezjUg
 d9MHf71q1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabuQ1wAKCRCLPIo+Aiko
 1Q0eB/9eNiUPtigO+hB/uNkBXR4tDu2ASM2HmjUUC68MRW0DnS0IP5QcY1Ape9pSObrOo9Nm5l+
 w6vPU64NYJRwwul68ye8z4rNlWKMSMUUiSMN+7LXmfXSMfNXYgdd8D3IzVx3d7mOEO2so4eClqA
 z/4zrLai2xEVfyXedajX3kNKZOj75rUvqN/F76hvsIEtBubnDSuiY6NMESQscL8gjzIyQtM+Kj9
 uwhycuXskjijtmVB6lVajNeDWF6L3UIAgI+9vn+h8TXe1HRfeC0S45aleIY+Kah/mHom9F4mkuQ
 OgVbVSVy9u2RcQ6a8IF38pxmhDaAqM7KIWRb6n5OSuPs2cSu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XUNyuR8UhfJ7DEUJwqOr7PmIX6p_VyuL
X-Proofpoint-GUID: XUNyuR8UhfJ7DEUJwqOr7PmIX6p_VyuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfXwYZ4sFCthWNN
 D38eQEIMBNkB18u20rrYKOGgNSggDph8p6/sVx03Au1JhRtPqrH17ePB7802ZypvNYvoHL7eaNR
 8bVVN0KuxczYHPsd35XeMgJB3uh25zgAu6xGEE3AN7choFMzUkkAhwMt+QNuvpOtzbl0xK+q2EU
 Yg7kyV/RYs88QMje54nLAlfFuK9LtkWaUgvKr7+Nl1vPC0QS4Lbzv0hu0VcQ+JMjxCim83qeCM+
 gJO9Jhy3NRsnFVcy4Iic8IfSRBRF0ensG7fcRHw9Jya5vwQbvoNnmLpNbYBj70MbbR1yzm+QVlX
 w0je23h/QPrWkxRKZGbzvYe6Gci3SOLZgqB/429Wlqyp9mXQrMzdZuSD1R7ICylqvsNkwxftCtq
 QlLC9UQaDEdwQ72lVWufHOWOCeCl9hjBI91nnHOoDkFxpKOYKfOwpte1pUs5VcNU6VyXWOiMHo4
 9TbV7qlmCB/8nCk6FBA==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb90ef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nz9G3-SO7wN5dIpBwN0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190044
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56295-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C1D62C6845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
since August of 2024. Stop using the legacy firmware name
(vpu-1.0/venus.mbn) and switch to the standard firmware name schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ab2a19aa9c36..692fbc2aab56 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.fwname = "qcom/vpu-1.0/venus.mbn",
+	.fwname = "qcom/vpu/vpu20_p4.mbn",
 	.inst_iris_fmts = iris_fmts_vpu2_dec,
 	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,

-- 
2.47.3



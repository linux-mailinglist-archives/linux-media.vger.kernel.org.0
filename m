Return-Path: <linux-media+bounces-63293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APF/NL2qHWq+cwkAu9opvQ
	(envelope-from <linux-media+bounces-63293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:52:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9648F622141
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAB0C30EC9FE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0C13DB335;
	Mon,  1 Jun 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7c6qpj7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axuXIzBX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E13B95EC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328543; cv=none; b=smXsIaRSzCU/CwZn6dhAqPYs0LtZolDA3Qa1++rhTuLXrE6u4uc22x94gpZP1uLtHxmkYpQFvd6J5jTx1SPffMvcTpYqLurpWGYuygQy8M7rjWJBP+mHg0yhlBr0iLgZBOMUaT0/Y35weKpbqbqvdHY9MGQcG1wRb7b4tWYxAKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328543; c=relaxed/simple;
	bh=Ozl5EeXxBuqxv3EqPkK5t0/LMK4hoJjLCYFpbaWf0HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZAODXwmMRUEsCZPCusJSeAEp2NjjPHlTLN6jMvowfzKFXIwWBuF0ROLQoLxkL+4ULwSMVo1J1BJT0CrOxS9Ppd5PQpGKaKuXlmEO5sgnydAYpn7sfBoNwGbgYTX52lqeCu7CmDMuyUTbxvdXrFmfBomxqTY6noanDhqBwW9Mgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7c6qpj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axuXIzBX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FAX9k1214152
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 15:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=; b=C7c6qpj71VmpKgQ6
	U3nhSN+W1y1rZLd8eSJLZjq2V/xyQxAB7/HW0+mTkZkpIKFiVWHhmyXRH+63GYyy
	tfZU1jQClJoCZDeoT3MBFjChcOFN9BHuOvJhqLsy1TWYNqArwSBSHFHHBn9W74la
	1G/rTaWL6+MYFpcDOMsUdI01K2YsKgsEZszImCxj6C9StQyhvXf2nAmqtXutrSAq
	WL5+f/iWwRRIEdDILlXoIOgAZ2ksuj3iBCm+jGRsBs7UNzYj4B6FZVyVyIv/C2oX
	6DWV5T1vufLe9HfvOXaCsV9Dw17KKYOeLdl5/xQ4pmsCJmhCfce8Ye0zJ5bWT2mB
	mOGf2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s99rtd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 15:42:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304e7fbfaf5so3462124eec.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780328540; x=1780933340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=axuXIzBXwkmulPwbTbuus3YY7LoyQDcJrHwHcUbYhS/aUnLOjhQEU+f3/t/8D7UgCq
         aCELA0GZIgrkC5IJyiQmEfsJxYbWG03tIyAscOHVZORh5lIDtwg5aq0TDjGysZJnb9Jl
         0d2beYdn9sJ12QkHFG7y9T3TLPFGN+q5wWmtqfPNg4PWtPyQidm8xnOjbdJqpIKLJAqG
         l+ejJhz8i0It/ofl+ZvckdJ8+NIWZ+RQm9tGPxRGfNdXoDzAlz+g2zM1kr6G0nG1uAmW
         y4Kx8//UrngI2+UN4bAx5JmLjgjDNH2U2slXHM+FuH3yS/Jc+kH1vYNpu7JCQumdoGxT
         kaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328540; x=1780933340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2TNzr3HoHbuhKfUhKh1x8ZLE6HzCcesuUXBRRI2rJng=;
        b=R0/sxZrQNaU2aIHpqV9BWseOA7P0UFRYuacpNfaMOxvwuRBeIK9BwFAnY2rjASJpK6
         vGD+8Wr58VfZlhDKrSIBvlT75EUbGuTCbVd81ek4ZHOXKwJNzRE+Gx05k3TUG9H5ump4
         +EKjRn9KVhrDoFGrDdVFW/6M8JWlSZYRWNCsCAyqqf113l55Tt2PNGr9COwNc5+id6CA
         S9fzQLjmODIygWyy05XRycbfCmf1pDEhYLrzL8xcdL1NJVBaexfLKVyXMMg2/UiezEoX
         03VOScTAj4gsMuY63q8cg0DqAyK8Nzhx1J4WvKf9IuytjmF53xDrQqm8dwwgtPQx4pie
         kPZA==
X-Gm-Message-State: AOJu0YxzgXEH4h2EzgHm1fT44k+/Nf3mmcVhBgyiiNOQ8iGMCcS08Ty9
	Z8B2Vv7qwMCdIDqzDwOyS9+yY536+DuZI4kRinAp7L8uXkEBpQDrxK57e+cvH80m2s3Fr8A5ByC
	WANL0fQMqt+MZLr+2AAUij60SMQrEKCWnylGlBEPnWC9xYNfVfIe14c6dBXPuMuskWA==
X-Gm-Gg: Acq92OHBxQowenfzcZhM7bX9A3Eimqz0+CzUivrp+G1mmA1WbO0gy7CSvvhBOs2CwHD
	d25Dh81c7BdY3GPBgMJUIze/uSSCbRuyeRkQLWCFerGoBJ4rKQeXCG4xqsDpgG/8USpw8sJZBhZ
	9EqKZskYt29CsQOHV7NjfSXutp92e0ZZvvWaSUyXqHlREvoWBh1fEJs+2uSRYZCc+lOuzpSXapg
	GdQQDPQfu+7Ma8D3OVfp3Yy/nZzMQjIMYr8D38COgaP8AUL2M5Itz36TT+KztrAgO3wDWa8+x4n
	x7xDvvGq3slDrINLrf2QhjBdjFbah5T5h06tI6I3zhYStIp2sWvCuhxgbpFWyB0P3qWQg2YdXE2
	jtSPyfxvslhcurxlxzGYC4Yxa20rbEjJrYrZBThPBdhamF328KzW1lzbBtllBmo4++YGUg/MHjZ
	QNszUP0lArvew=
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4589941eec.27.1780328540470;
        Mon, 01 Jun 2026 08:42:20 -0700 (PDT)
X-Received: by 2002:a05:7301:1e92:b0:304:8364:e95f with SMTP id 5a478bee46e88-304fa64b8efmr4589920eec.27.1780328539931;
        Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm9430371eec.18.2026.06.01.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:42:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 08:42:15 -0700
Subject: [PATCH v4 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v4-2-1eb6f432cfd1@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v4-0-1eb6f432cfd1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: -Ur2twpCWQNtsS-7HKCfEG6BZWevAkKv
X-Proofpoint-GUID: -Ur2twpCWQNtsS-7HKCfEG6BZWevAkKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1NyBTYWx0ZWRfX4h7XKcnZU91y
 Waiyb1ixGBIL7axVrKxG2MpwiakIVTNuCR3yvkloo2Wvysvn6DLz3voes5k2lunFvAy7OhYe3O6
 d3FF0glBvgeRV9uodOogRL4zN1xoq/TYlzRGF8/tnYlM+O15ILJ8HAgAgIuH/z9X7TiBdEdCruj
 YnCsiqP/PGhYQ0p7Z2V6kjsdkE8cvUwQUimvdL94ra5QYmLx48VTaxrmGbFysuA72qkQET+I1/P
 so7LUhalW+/Ut2JqCBu13/va3QmBr6Jd/G9YFXKhgbXpzZGhyaCvdxi0cm9ZKbN4j7mQhxxUAG9
 kyP4dX4hkEbtjnDI9AwvfUFBstn36WHrpmDxz60UWjQopAlpuMSL+EE0Ono5uoEh5Pr3LNHwRtR
 5Y5F1fSFWDrdRfwCQrQ9/qDV4X9AvmfYKEVAXGIGcbK8fRQT7LVLTEk9fSbcVDeNyhctTE3ZAjy
 C78U2O8GMnjmW7XYjgA==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1da85d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63293-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9648F622141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8fed46868d62..834f6c1a2519 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6082,6 +6096,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6117,6 +6138,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 2c7a0218a82b..314bd794033b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1



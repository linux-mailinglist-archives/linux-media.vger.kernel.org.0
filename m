Return-Path: <linux-media+bounces-51033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB77D3A48A
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3245930312F0
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BB31DF759;
	Mon, 19 Jan 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8wUJaLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4ADYvMH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99303289E13
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817713; cv=none; b=Ipc8SvJORpXE6WWNBy3gT2B8QSzB9VAi5GmTUpB5EKmYItlB30gwzZeOLnFl9vU1VwX31xmO9RrZWO23Yca/z+qfFGeykwAbPPm79Vjbjpdcl3Rqi+Ccr+fZwjCUSgEcPQ7QrN+vnQ6T2YT5wa2O2Vl+BV0JVHdMvOx//7Pk5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817713; c=relaxed/simple;
	bh=EVzBqcV/PtMLwZMDcfyYQ1Zxto4pfaVmHkVU4DFez8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6BjEjCeLQBZkPsrCjzXEmcq3anfTY3h7xUkjgiZN+FXn/LDp5ZDyXlm9yw4/3dO3L2mEexWllhBZlnMxWVfrSpA2N5zqhvYyMqW//sGjPnORLt7psSSIODHHFDLtlH+tYOy+gvzUrUm0OSyi07NgLcJQDbgESMhmpPHx5yWOV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8wUJaLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4ADYvMH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9kKsm774079
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjvpRtqj7aQlyXwi0J2od79h2DtnWW/Q8jPBhPq2nUU=; b=N8wUJaLjTJAaP+zi
	Zx/QwFN8stH84QWAXI/uTUQfOjY2/LcWSHSsLQeao/wS97BxECqBXRYN3/5mNegn
	xA0VBOZgtD7PgAlRzGqomZmvpM0IzvdtqTQTRN1IrlJXWyf63yjkw1U8rzTygxY5
	wDRei1Z3T+MjZaEb6eaPQQtELCd+3Lg4gwVqpDXPWfD+QV+OC3taFFXRYTGWYLlb
	o47ton/owbpC/hWfc8BiCZBDI04tACJnA3//XABzT/9h3/BmZ7WGYDhDXbXUsT9z
	+w3n0zpOYsFnCSrByDI43PJKoail6leQ+OTL4WshAHyNgDruvWp6zEV3P4DGoWHs
	Q44SKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9a8373-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5329ed28bso1068425085a.2
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817709; x=1769422509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjvpRtqj7aQlyXwi0J2od79h2DtnWW/Q8jPBhPq2nUU=;
        b=W4ADYvMHcAkjXQfyogMMru+O0SQpZ/ir6g0eDBZ5Vg3D1OFnPzhSc39XhW1EpBdiSy
         3WDbX4EHkUQmQzzkorIPGflPPWsfruTf3T+LMzYKZ009Fkhmd5Me0L99FCcIDt4Thfyf
         sKvApDWfskWVtlCOYNyqqPuY5jR8NE9rgVIW//ZUG1f3VIbOcbIvGfbrgQPxrMGiksQ/
         Urhv9HX2LjRUJlGHeV1Oi5OgK00SUuitwBeQT2iTVcA3MZknkb+gbZbKjpfZPlMGbxp7
         aEFnDIdKLVD+Rd8Vxglhaq58fimxG7zIm/Zaw/bpL5F0RUdD22OGIkJL3T4TFXbtGZ4m
         3ERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817709; x=1769422509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AjvpRtqj7aQlyXwi0J2od79h2DtnWW/Q8jPBhPq2nUU=;
        b=sOLSL2L1gtIM8NWrZpi2fIy0w21LIvWVYMXzcuI8cDAmaHvSJ9Jcu9Eos+zQyvr5CM
         9lFcHAMHZXSpd/ZG5gZrYqbY99sDRVRYgjeghFURf9Zh/aCeFPIkBiWPN9D3D47Y2tPk
         gW+HEonT2zjegtnaxpUvevRyc2SLQFzqrzSBFmM0wUq31JN5pG9vMg60q/J1RxOR4lHX
         w7HT/QTBRmYdWTcE5cJrUpIiOg7WBF2pu1ma+zrA04JAE7+i64JDZvsb1fQNBxFXzAJ4
         PLH0trbDNU1Cj2eHB8ikl2SkcNJvIuA+72D5s8hwIZGrhD1Ba3H6o77BeW2+kNaeNR3C
         pYkA==
X-Gm-Message-State: AOJu0Ywo6+/ir8xT58DHMgRbsM8+7LYGQuofzhpj+Xpp9FBqnr/HOQQW
	FCo5BC/XNYe1lHnITt1bpWS0e+7jWs0nieB5ARNHH1vwBeM0O1Ej+5s+ZD3B6nADSY13OHiXmgn
	4/BUTde8mEaDkNPCHNpWyY7T+yhXkkMjbr88JuLuKy3WFlI5VvrNi6LuT+wI+q+mFFbuKjHYHb2
	9Z
X-Gm-Gg: AY/fxX7AUnRuXjX9i29epIe/65UZXfE6cq2vxAl/7Ty7ccQnpVaNuRZO7YdZXWUOu9b
	d/+LLGnPG8n9XhHphDCnZHJMLLrWXvRTy+NKekxdp7thSvAK5E1AcfrrrkPZKttGNY+7yaCAEZg
	4E7ertFq/92xw0fTulFCbkNT13w0BSdQSWfFmm6khO0zImkvXS4MCNrIx5rKJWD2RwtK9AxhYMt
	5OdYI8i1c9KIDHh/gVshPfUx+KmuBZr/d6ZhbNQY9VckWBycFY5QRH35v1lcFP5jrDq/i6qKsxe
	xCTa78Sdxuk8y7DUGfpOdi3WS5b0QXUED806QN+DXFPUltS20ZgYxdBA501x+XQbnW1C4mi1hL9
	S7RSBIiyM/682MdaftrOKM85n0Fi3CPXYBKfw+PEDWRRKm3UXAh6xM4PUg+Q6Pn9VHNGqbp+LHf
	YB
X-Received: by 2002:a05:620a:4054:b0:8b1:110a:e14 with SMTP id af79cd13be357-8c6a67648cdmr1420407185a.55.1768817709405;
        Mon, 19 Jan 2026 02:15:09 -0800 (PST)
X-Received: by 2002:a05:620a:4054:b0:8b1:110a:e14 with SMTP id af79cd13be357-8c6a67648cdmr1420404185a.55.1768817708964;
        Mon, 19 Jan 2026 02:15:08 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d8640sm77208166d6.50.2026.01.19.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:15:08 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 18:15:01 +0800
Subject: [PATCH v3 1/2] media: i2c: imx412: fix sensor power-on timing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-imx412-v3-1-8b46929af773@oss.qualcomm.com>
References: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
In-Reply-To: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768817703; l=1484;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EVzBqcV/PtMLwZMDcfyYQ1Zxto4pfaVmHkVU4DFez8s=;
 b=/ux31TVHQPtnd+pE7DDqJBN0g/3Ugi1wGaGb1hi87AeCfGkETLGKYvaejk2rIg6zGoi4lahf4
 mCHM7mPsJT3ADevVAY85odxkKYEjPsOAmJxkOh+YqJRKY/0g7SLP6fV
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: s-zj5hDo3xmpiMGB50s9pIzPQAqfYOeo
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696e042e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bMybYJ5piMyaIM2v7y0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfX6grgL7Uz9gF1
 8H8RLXvFE/7Hih/U8uIj7clPVnU/XV//kwd5HfmBdNR4Is3J/nt5zyapq0/UhvI94wpSMOMenLQ
 xaPhryKIPNBFbSKNHQNp3EkDYKxtqKdNCYmyVvmHSbMW9DeUoioN4NjmwZk6ketYoqr/Rky/5d4
 WR4r1RT7pKNabKovlT5c1HH60YvteU3YvvNjbIYvbbDmWG703B2GEV1raiciTSqi0HJd/4EZzKj
 rgixIyQ630zmxQuOOr9b6xF84eUR9fL1dX1JPmvpsMe9M5UsNBm96ojQNVCmYvwdx1qHrXarT+2
 nFrAfYE0GX+hMk2UBGV+nlaiVu54LfLoNRL+BKNfUAYYYWEnflCP6duQl9C4lHf7Nai7Xe9CXYO
 /NQU81ryqx5jx7pzYhbx8phhrha5aPh4UQJ/iPeVY+BaFDNMzcBwJ9Fmizcebihcv6ciCbl+KgQ
 vlwfUWdSKxPYNYcgwFg==
X-Proofpoint-GUID: s-zj5hDo3xmpiMGB50s9pIzPQAqfYOeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190084

Assert the reset GPIO at the start of power-on, enable regulators and the
clock, then deassert reset. This avoids a mismatch where the first
power-up (when the reset GPIO defaults deasserted) differs from subsequent
cycles.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index b3826f80354703b17b416dc233854da3f5736e38..ebc2fb706442365f541540bf4ce9d307d42e0061 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1022,6 +1022,8 @@ static int imx412_power_on(struct device *dev)
 	struct imx412 *imx412 = to_imx412(sd);
 	int ret;
 
+	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
 				    imx412->supplies);
 	if (ret < 0) {
@@ -1029,20 +1031,19 @@ static int imx412_power_on(struct device *dev)
 		return ret;
 	}
 
-	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
-
 	ret = clk_prepare_enable(imx412->inclk);
 	if (ret) {
 		dev_err(imx412->dev, "fail to enable inclk\n");
 		goto error_reset;
 	}
 
+	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
+
 	usleep_range(1000, 1200);
 
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
 			       imx412->supplies);
 

-- 
2.34.1



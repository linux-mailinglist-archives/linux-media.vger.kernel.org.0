Return-Path: <linux-media+bounces-47036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A6731C5B11C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 466D735186A
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BF4258EC2;
	Fri, 14 Nov 2025 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfw97WfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en2xc0q0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBAB256C71
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089869; cv=none; b=pFsLHERGFGfxQpiko2oNn+DTPJSsFXRjKlCG2jPAXhzciba+aC6HzlQKcCLyjC9UoAnpoyQJR/lhVaxcRZnK49SO4mqzNxYHQPERBx2y2znHG1GfQyofVYY0Pq2OrLss9mYth/EBAeiWWk+tcxrmW0TbdwpUJWz5kHIsBo+mnJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089869; c=relaxed/simple;
	bh=E/3i2/+44CedmRS8ulf2O/Swxg+3oJwtmc68sYT+BcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzsSC0iRd0uz+tha+cU5RLNeNPvkBLfpebdBfm9NhFsSFq7giKWSRqFsC1a57oNNSgP/en3WWZVDE7YV+QUtLWOOQHSnIhrMGYd9yoqMoBDOdWwRVg1TzU6VMwVmkjz8E2r4NhI7r82l7LC/EnBSY06r2RL6pWsxM/VP6SdA7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qfw97WfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en2xc0q0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMae3m1629387
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=; b=Qfw97WfUpZrU3nN5
	jkPHO6ggbAxkm9RHUn/YY0/cuQUvessZZKz9JKgkuzs8jay056miatKM2h5q3561
	9aavkcIPbzeKFPmIsSCWENRb25O1xzKidxDejW8Gkh8IEkfLYK2kAFWN6W2ECOpH
	jC/R9oKiKGL0OWAvEPl3ZDGBWzGccAd8VhUFo93zAMx7z2xhxJ1MAJqUK1YaPmdG
	f0OX69tlZq+FCx7lL6I3Mk2lQez8O2uJ8iY8F6Kg+uhWDhYsjdS9YJTOWWpih6yA
	I7whzi8XB3oxwADLutoQSwncyK8m4BjkVV/RFZ/+PTxN4uO3nFaET75QfUhRXp4G
	Et45pg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d8mtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso1571890b3a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089866; x=1763694666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=;
        b=en2xc0q0rJX9mIorSB++hN+bU1UIIIxdorCtThVj/q+IaxeSwSL14hsXsLumC5/vfv
         9zI5Wh2rKJBRamGEU69TC7gaVYXg8NEpOCaBWHwy2NCEuGM5/laAowSpqE18Gi15aA8/
         DUVd997H++5Oxbrzpuktcl5Q85kj5j3owAve0zc62lFj0R2geU7EJfpa39vsPBBInR//
         zXhFtAm03QVrfb+NZe5Sy2vLHMmlnfcfZhx0NSjfaA4m0Q+WOdmZSfmmHQDmEHWsh58d
         jxgvED/wxUr9tCq6sZCSKnPG3XBFMyF7XcoZR8D5lxHHML+Aq6GuuDo5TGA5chjk4BoO
         LNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089866; x=1763694666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLwsNIV9PC6cPYdCEvfzQ1SasdDd3Px68Ca5i3GYDSg=;
        b=RbmyrKEpr8bgW1Um3qu5IAo0c9OYkW3AVKzoGS+rujQHPuvalyCk4LE9uQLDixIpvL
         aMROFthCVggHJW715NW0F/4dqEC0duqkdGmAAHG+L0h2Q6TU+byV+2ZDaY2V5VCt9k+R
         p0PHSIzkWFyoj3275WdzR4dO3mNkqDIfx+xQ/cSsyE6IVrSRAWtmBgPpkxfSrhzITyW9
         WdmmVTy3JBgCY2gf+pGHv+URAt0kGrMmcnDY8eq8UnGIeuKdz04Qrt5Ydu/SXiH2wjxm
         3Bi5m6+1xhuAnmsN6rh0ldUT+aErjIXy6Zq2u6zZHvza4yLDllKYXhv5B/6wViT/s4LB
         dBng==
X-Gm-Message-State: AOJu0YwMHIiuG2shPH1D7l7OfEI8BdgRtiYlIFBi988RYU70PUWd98MK
	Pr0uPhRdlyehhZH5Y0YmeKmYYdkduhhmSufRmwb6m3Gf0airi/Gtded+T7YnAuXKi8LnX9933AP
	OVjTO6NPei/gLQYKx4tigvIJeRTrRmpAP+j0Jn+JwJxfPJiQyf6JtutWKPlicKUuMwQ==
X-Gm-Gg: ASbGncv9LdVjsJL0+jTl+giUPe/vp/YrzrnrNENC8iPhWB65gkC8UH0YwUyyhmw+eOw
	C0rSfeBOMODrbkR/Tq8Tv6WV+avbjD4GAp1zjWpTYeMUfosfYz3LdkEim+ls+avjUJfN8fY4EhS
	PVVdZLwVC0TlVH+356bNcuLpbTcbTFdAolAbi3Xli0sXGgjkJmE6bm/dqQqSW1UMDhqc9BYcVAS
	IsHnNRMplPZ++hdHpnggHxwVlBoIf51s00rkctg+cmKYslynpiL7JFNsL2VfQ51IWcE0QvYREBh
	h4LCat8q1mlfuiRb8HwvE0/ZeoWhYV6st6ZDNhib4esa5zOztALF4Mg65O6QDZxn2Rx3OOatOXp
	eP+6zY4mGIcpa1id92my1tctpeO0cv0ztIvn/S2ZV16nCyhZcq02Z5X3WR8nqJhYAbQi43Aopd9
	5xsQVCG6+F
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr2163411b3a.4.1763089866371;
        Thu, 13 Nov 2025 19:11:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr7nQFy4/LctFwnJ5En2cKeocm+jGZ6Z/wTsYu/Reba5o1kThs3DdudFabVI+prksf4UMa+Q==
X-Received: by 2002:a05:6a00:3cc8:b0:7ae:d1d:d500 with SMTP id d2e1a72fcca58-7ba39b79f58mr2163376b3a.4.1763089865839;
        Thu, 13 Nov 2025 19:11:05 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:05 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:08:58 +0800
Subject: [PATCH v6 1/6] media: qcom: iris: Improve format alignment for
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=3515;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=E/3i2/+44CedmRS8ulf2O/Swxg+3oJwtmc68sYT+BcE=;
 b=1WeoDxJJIk46lr5wsCFUzv/qO6WmQtRwp8Ixt8LOraZVcuthYtKkCSYHJN8b2vo7OG340CptB
 m2wf0zmWpKcCdlUH4XxAypPjD6caEZtkuYD9ORw2Fk1BAM6tA/ZZ89b
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: bq1xMhbFz2eRC9tpW4z-T5vVNusl3y3N
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69169dcb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Ydk8v881x4eQe87C_TwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bq1xMhbFz2eRC9tpW4z-T5vVNusl3y3N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMyBTYWx0ZWRfX3Ptz1Q7Dwqce
 cUhFeb7rJWZMZ0zkdGaUouFgQO1x99VBsXO4NiuO8IGzLC96oT2SLVAVjOpAX6WsUDbyyiTAc+U
 I++ebD4Scp0VauxIeuRbGs9ii4fyTIRRzdH1qOh5GgSTAPzfW4eVHSfl9MYTnMNETFEJRLIJAPQ
 8ROiCEHN+p4y55C6SeE/zG23P4sXnZbfh4NvDL2sidSctESxfIDOwXMUGRyb73REtg9G9IYtqt2
 LGImWk+Xkk0o/9t9dS0ngHNYhSgrjRANz2EbFIuDbmwa3Xel3sECOFsTZ9ynYip3oQ54nAcM/7l
 brA7tuxst304hqVguuLSS/NeJ6Au6Lbt6sv1LGNXl+6IzhRObv/hDK8CsHRjwe6s2nymalnVEY6
 l3F5Oi6jIptkkH25iFjd5I1Wjy0DiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140023

Add members enc_raw_width, enc_raw_height to the struct iris_inst to
support codec alignment requirements.

HFI_PROP_RAW_RESOLUTION needs to be set to the actual YUV resolution.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +--
 drivers/media/platform/qcom/iris/iris_instance.h         | 4 ++++
 drivers/media/platform/qcom/iris/iris_venc.c             | 6 ++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..b5ae3d4745c6a7b354ab8907aacd532b81b48aab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
 
 static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 {
-	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
-		inst->fmt_src->fmt.pix_mp.height;
+	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 
 	return iris_hfi_gen2_session_set_property(inst,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 62fbb30691ff967212022308fa53ff221fa24ce9..a95244cf6d30cd81199b9f1e51bf64c991be1790 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -69,6 +69,8 @@ struct iris_fmt {
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
+ * @enc_raw_width: source image width for encoder instance
+ * @enc_raw_height: source image height for encoder instance
  */
 
 struct iris_inst {
@@ -107,6 +109,8 @@ struct iris_inst {
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
+	u32				enc_raw_width;
+	u32				enc_raw_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 5830eba93c68b27fa9db87bac63a691eaca338d2..07ffcd4d20969c8c33084dc8b03156913e8c89fc 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -68,6 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;
 
+	inst->enc_raw_width = DEFAULT_WIDTH;
+	inst->enc_raw_height = DEFAULT_HEIGHT;
+
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
 
@@ -287,6 +290,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	inst->enc_raw_width = f->fmt.pix_mp.width;
+	inst->enc_raw_height = f->fmt.pix_mp.height;
+
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;

-- 
2.43.0



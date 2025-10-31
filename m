Return-Path: <linux-media+bounces-46059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED4C24449
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E449A34FA1F
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A5C334C24;
	Fri, 31 Oct 2025 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1yGHZWL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gj8pQAgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA96B3346A3
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904304; cv=none; b=S9iIG+wfx/1gE4q0K0lLIoHfto7EjN8bBpIQfrVE0eMXDDiSdFN/Q5y1/L1QBs0FZXHIkW0UeprFqxcchOa0tQIXRHLAUuxbMf4qXVW1UQvZpwj5Mv5SsrzaFn0NMLHU2sCqs2lG4OEdmnXZs9MalbBabl4hEPEWwD7iwDixzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904304; c=relaxed/simple;
	bh=tNK3w71T6e4PjaLm8LNoJvsCCYX65B4pzJT4mQrjvDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJPdvQU+fLw+W27OSSxgVzYlTBElK5ael4Pfd5u2MTds9tToxyTYb80P5Rr62/sJrkfG53aKfxsi9w58aN/g5OqUFmdkCugb663XUuDAZ6w6vsIruDQeNlB+Ib1DfPP1d7N+rb4tB39+T14nd0j0Fj7ADxjpFS/1PbNUjmgOyVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1yGHZWL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gj8pQAgQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V73jXw2059166
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=; b=l1yGHZWL5FHO1Vvi
	5790VGMjHeDsYlGRilqTSoA11tDP6dCzUtqeUvaOnRkYyI8obRXOw93XowpCW/EE
	6HxSASSFh/qCM9iEdq0kN9RPFuGmCz2cPMYLUGQy1xb/ra9QVU33D66A207AuFuq
	X53Y4Tz89fBE1I0q8Av+CXuwoix0YVnDgohkIhQQyhLqEVB+Vc4xU00nu+Cguk+N
	xy7J32FJy/gMuBFNyszzNdUSYMjTareBuJzIUGhb2+GfwM++eVpkpyR0kxyapcr5
	J4AGRVRu6CwqLWruOqMJWWJ2H63Z52i0tTTBUmLh5Q7L8/GrWkMJhs04Cq8HXByS
	9neqnA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4rcvgfrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2951a6cf0d2so7103535ad.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 02:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904301; x=1762509101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=;
        b=Gj8pQAgQYQLsRIiPzSMhAM9ShTLIIu4iaj2EGHIzunWCSPSlEWBixtMmE9Vgu2cDwH
         fzNQdzR7mz0RHBVlfiZgqWYCUcgh9UF4XokUsOR+LNiFriaG96J27uD0rD1ECYbCP9d+
         xhaf43nlBbXftGMxq5jEyogbvxByhSTyZ3hPoPYarKDfWjIdgm7s8+Z9d2uV8Jf4VQGo
         xD9iWBvYF5DFtIc1GzVXvz8535tnt4JJDklRpStvmKCx2xqNRlhzd8iXK0PrQB5gJ2hh
         hWSMpQ+VPJc1SKzDeg/RXdd5O3BnkoPw+r5CaC/ex417n12Ds4Cbb7fiY7dZ5ehysQE2
         tF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904301; x=1762509101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JpM/Paae13Jto15iFYVyEhtvAI0lxD1SeWwHVnZ0fs=;
        b=Xq5Z+uy+IpAmHKLAbgBCdep7fPopdhqk66Ah2qWL1lIVqs53LezB5qn/dprqnaHE8L
         H21BTlvmZXymXz6TBGml692nrm4bb6hjm4ntGx2MJr2lZV1k0I2fuRM7AkgyOtklPoIZ
         jfLs+BZKUSKoxW3k8UlDo/6EMD3qOiR1/N6tIzyvsIHxKoRx2fiCT5cwrdypUajWRrM2
         JM20GqM0oGdjL6iV4Ml5ZRGC7WC0MMXNWODGVLHxKfJg9QmqhrJLjJ2R+UmEVKZZ4G8+
         fcxOeJ2CzCHlX+xw5ErLk/ZiWcoq+7LzRqpaXJOzh/JIIWp0SJ/MtmQ2ZpsvrmNNLK0z
         FlBQ==
X-Gm-Message-State: AOJu0YznIF5nNAWrtX2CDS5xMoNCvRD/78eavfninRxMIklVpn+P9Kz3
	IkmFKwAvNI82ObGYJii5rGPiTdvFygmp/KQFwVMbNfYrpyqsBElL5AV2q0A9otK+Eh9/Ku9nrB8
	udX1MZNEQZiKorAJSMmaBqH2ZWIJud3LHDcnLN5L3BA0O44XWqPxj+6/VHa4iulxSpw==
X-Gm-Gg: ASbGncuAHzggNmna1ZfoRvFkh5l3ZH3MpfEMpu0cO8RbwQDxJAPA06NvCI2tbVZy5my
	K1hYT/NX8pwHu15p/m8tSry8u0teriQCqOaTclHEj2tiTFvnU090aDaSXt2Yp6FP4VVej8PRiaZ
	/63zyTMRt9wlhvGwQlHAHLLD1ghwfB4S+oFB4mFBmCXAYiwmNwKKzg4nZqzu+ccSaXZwgjWWqIE
	/kcDr9l29gRd6qHNY2QA3ERi67P/m++I3gQROlyQDUI/ArUpnCrYEO1vN7NyjbgcwzsUCMKTaPY
	gN5hAhEB4FedgCo/t4/uRnJu8UkFyK01PhqScMG3gIYXhM9PTslpSNiU+BHkTjoGRhymyGZW8tF
	6h78J6drjF1YufXZ9XPvNBSmNM1Al+a47j7XwKPeDnOdVwempeHoEzRaQCnK4SVTA09AWallLDg
	==
X-Received: by 2002:a17:903:2f10:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2951a3d0d1fmr35684575ad.14.1761904301288;
        Fri, 31 Oct 2025 02:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExWdhj8g/jlNPdEPwEK4/kCn2ilRTx48miAgHuZAI43lKz3CQx0hdppvLjoYedmB04jEsTAg==
X-Received: by 2002:a17:903:2f10:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-2951a3d0d1fmr35683345ad.14.1761904298813;
        Fri, 31 Oct 2025 02:51:38 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:38 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:39 +0800
Subject: [PATCH v2 1/5] media: qcom: iris: Improve format alignment for
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=5100;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=tNK3w71T6e4PjaLm8LNoJvsCCYX65B4pzJT4mQrjvDk=;
 b=Q4iIB9stru17MD9UZUYytGkrWrUBUyuuXSktuZYZYOqDim0VX168jtjnEXBefVLUYccPi1hM3
 7S6Ym5Adh9eDox4MDWXxS+H8rDvdS/4OhqMBZ4HTCLE6XwXI/BfDZkm
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=bJYb4f+Z c=1 sm=1 tr=0 ts=690486ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ua5b2oKhh2CtpjQe1ZYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfX0iRtvCFn5qOF
 EL9IkUhiDHyztR8KAthJn4vR5frDxhSOrepTqrX6teMlac3AReLl2+6CgCCVIBWKvqDjoeZ4BO5
 8weCNGSgzsHjC5fUpVUlEnAhUR0dxEFs0M/NZVMHfeZbPG3a0e+RPsz0MqgBEaGZrh8qBTQZDjB
 mnfO1zPesZ+bscwu+lJ/WnJYdRpQrbsuxkGRDcBd/GU1qevHV/seyb7rjMT101H2zbtxGbZFPNp
 HqyJoCyqFi/TQlbC7PM0q3Tsb0EU53H8shqY6H29sAA8Ucc8+BlCHSiNZZozpBsqwupIxgYY/lS
 fZUZ0Bz18NKYSuDJwrMJ8dV1511AU7Be5HI9e7W5Fk4fv+x92oLH+zFwT3CGDtHxbv968G3uQuc
 gCZTA5W/NHWoptekuhGyqF2HgqRJxA==
X-Proofpoint-ORIG-GUID: jtFrPw1xsat3Rsw80PyPdx0gvS3MSX1P
X-Proofpoint-GUID: jtFrPw1xsat3Rsw80PyPdx0gvS3MSX1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089

Add members enc_raw_width, enc_raw_height to the struct iris_inst to
support codec alignment requirements.

HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
of interest, rather than indicating that the codec supports crop.
Therefore, the crop handling has been corrected accordingly.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c   | 18 ++++++++++++------
 drivers/media/platform/qcom/iris/iris_instance.h       |  4 ++++
 drivers/media/platform/qcom/iris/iris_venc.c           | 10 +++++++---
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4ce71a14250832440099e4cf3835b4aedfb749e8..ada9b4d298ef10ac47a573061369828a1e150f85 100644
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
@@ -216,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bottom_offset, right_offset;
 	u32 left_offset, top_offset;
+	u32 codec_align;
 	u32 payload[2];
 
+	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
@@ -231,10 +233,14 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			top_offset = inst->compose.top;
 		}
 	} else {
-		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
-		left_offset = inst->crop.left;
-		top_offset = inst->crop.top;
+		if (V4L2_TYPE_IS_CAPTURE(plane)) {
+			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
+					inst->enc_raw_height);
+			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
+					inst->enc_raw_width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		}
 	}
 
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..fbae1662947df73bb3d10b7892839fa1076b7e61 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -64,6 +64,8 @@ struct iris_fmt {
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
+ * @enc_raw_width: raw image width for encoder instance
+ * @enc_raw_height: raw image height for encoder instance
  */
 
 struct iris_inst {
@@ -102,6 +104,8 @@ struct iris_inst {
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
+	u32				enc_raw_width;
+	u32				enc_raw_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 099bd5ed4ae0294725860305254c4cad1ec88d7e..6adadc89e360a6e4bebe1f839d38892990e10fa2 100644
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
 
@@ -249,6 +252,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
 	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
 
+	inst->enc_raw_width = f->fmt.pix_mp.width;
+	inst->enc_raw_height = f->fmt.pix_mp.height;
+
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
 		inst->crop.top = 0;
@@ -329,9 +335,7 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
 		inst->crop.top = s->r.top;
 		inst->crop.width = s->r.width;
 		inst->crop.height = s->r.height;
-		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
-		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
-		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
+		return 0;
 	default:
 		return -EINVAL;
 	}

-- 
2.43.0



Return-Path: <linux-media+bounces-47038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEAC5B12E
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 46A38352BF7
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EA026B942;
	Fri, 14 Nov 2025 03:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPzeB5c0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjIfn2OP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FADD262FCB
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089878; cv=none; b=BK3Slx3huc1EzdH/BMhkKOtDa33M5V3F6bhsWEB5ZJ+hNsuWs6KKojrq0tRFeg8wtWGEo+vKeE4HOJELL/079ryUYM51EQYCLOd2zYmflVglM+FEV2hLFpAZ48RumaFBTFWbjPKZaanPWQyxxcGIEpkDxiW01WX3cdvBsCKbbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089878; c=relaxed/simple;
	bh=A5Xjh9wncFudH1x+WWV7p2S3djGgtZFVxWAzwpFk6Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLail77E8dBQiDSnAaQkz9+jhXwza1g7jJCIyCtvUCZac5KwM3NU+YedLRTdUaurZ4uWWVZfeXva1zFiq3O+f03swd6Ttb8jQnpo1QZ18++EYwECoPBlLvowzZSCkq+V5/70Lw6vIPDCRJ/uRQbmThrg1gO1FNyn6REkhyvz8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPzeB5c0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjIfn2OP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbLtD1746780
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mW+piX9ZO4kQPQtL4o4eh4rpAaysTU/ChkQyerwYGdA=; b=fPzeB5c0ft3cJTZP
	D+eThkALAYF2DxhYa9EZ3oOOgCFQSDJJOhOMYfDBovyZt7A0veyUfm4K3PHl3ldq
	GgXdQ/MtBhMvNoa4CU8Mr6Wsmd+uMod3aq+TzbOOrdUhX9KvPk9uNJtoRSI7+gU+
	vraN+B3LUGVAQH5h5Ak2+ABQ2J6IovzRXQCKUzxiOgi728wwNEgigi0us6mCv/eO
	u/VdZtvUGeorHas4lD+k9hYTIkVv+HudoO5KIV8EA9dJ9cZwdQYLWWFWqbW/M+4r
	B/IY81e4d5tbi2yOLz11OsGDgK5hf+Tysq/oSrfVHJSnLCjITCKdQw0WLvIvDW2L
	SneR+w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egmng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso2635754b3a.2
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089874; x=1763694674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mW+piX9ZO4kQPQtL4o4eh4rpAaysTU/ChkQyerwYGdA=;
        b=kjIfn2OPwAh7adhtFt1M21UHWR61vf2lhRzqzp0MHXnaDbENqBl38S5tzSfDD2n4UF
         +c+J/xJrjJ11HH3hQqgBHCZ3Hhk0mX2o8D9kAAwDCEBAW97Dc5m0E9AQnwM9yfgHbCls
         O9uvOo8R0ZlXmCYx8zrBsdOv3KvFJKnrX1dNwSWS2e3cGKG8sVB8WqGZj3WcF6LPSJ2C
         Wz5zP11YV0qkQWsP4L7nMmiXj1Si0THdsijhB+leG4suTXllPNleB4ukGVCbg0Bb2bf7
         RINOdz95S49jozQxwfSB3jGZ5TaPR2/9ZR+30FUDHLDGEXBhCqf9NZTdO31jxBY4gH9f
         S4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089874; x=1763694674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mW+piX9ZO4kQPQtL4o4eh4rpAaysTU/ChkQyerwYGdA=;
        b=Z/LhT248CQV+VD1QWMvA5PCm401WROXfvOqrllNrsXjHK1MY/yOnIiks/u55HdB63w
         CnwlygoXP2e5XQ4H87oHdzuy9XvGuH5QomX+61h0J03rg+Flb2MjXygI5vOGJyJoHf5+
         r6LL+sLiXMk/5nXrH3aOxMz8+1PmhDt/arb8GVp9Xe+OA0QoeQGoRq6Q1jnFN7ZL2Zz6
         ipeGv0V+VFeiL7NcPI9k3ayu0pzPTif2/l4PdEuyppNb3TT6+qyJTAiVdHAxQHKcSuZg
         ygKwoeghk59Ievk7FLR0enI29M3dQZ/6TdS9ifkIx/OPefIUP6+OCIw9OL3lFn4syKRY
         +YzA==
X-Gm-Message-State: AOJu0Yxq0Wr8rbAAQ/zAUg0Ntyp9ngBOHB5JBuoMzRmKibrzkWTE6cvp
	+c6GWoDJCcaldBVrV9G5TXobk92OaiV4DNQbB8YHrJEsGtDz0rMG5GKd9agVSI3MOf/KlXVpLyB
	xIONbi4/if6E/AHMBWkHejcUGVwdvsEji0K7ugvvZC/w7i0dn1X9S1FhgFTmqhu260Q==
X-Gm-Gg: ASbGncvo8aik7A2p+hWd5GFTME8bxIKSBt7FLz/ZJ5CVXHGmLQ3PIkn09YviF7SKS1C
	j3FG3X2+H0FKW+Cuo2WaklxnxDG4E8SdpxCV6ycgGhy+TazGZ1DUMUXWdHMVaQ8KE79K9ESIUqG
	kYOZkolKNs5JGlOz4tUVLpatYAhItRQRG3WdfzxOeJLdLu0HzkOi47f2HzNgn/3b/1yUjJ1WVVS
	p+tfgCcMlKliogTqdoWZxqXiRjbs7Js3gSERxEEpbqzX1uwt8Xnt0UgrQ6QyM8gmnqRoBJTMF1L
	QNGbCL2yXLTsPDb8PKP76y5gN5s/oQRCz1CGkqXRuKat0Hv8HE5xK2PC6iCnPyKIiFPCIICzCAu
	iEF2LWQha12aiaOsNY2zELrjarBejlmsxWRXtoPsE4uAdibMLOrM6cuQEvFdK7gM0oGEUfroWlU
	n6nEInQ1NZ
X-Received: by 2002:a05:6a20:7484:b0:33f:df99:11e9 with SMTP id adf61e73a8af0-35b9fa7ee06mr2545525637.11.1763089874343;
        Thu, 13 Nov 2025 19:11:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3nkHNrSPmuFu/yJsvime+BRzfD1WCytpyCuZ8oUFXCYWKKBNwuhbQRm2FC05Dh3jF5oae+Q==
X-Received: by 2002:a05:6a20:7484:b0:33f:df99:11e9 with SMTP id adf61e73a8af0-35b9fa7ee06mr2545483637.11.1763089873830;
        Thu, 13 Nov 2025 19:11:13 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:13 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:09:00 +0800
Subject: [PATCH v6 3/6] media: qcom: iris: Add scale support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-3-d6d35a92635d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=9733;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=A5Xjh9wncFudH1x+WWV7p2S3djGgtZFVxWAzwpFk6Ak=;
 b=jYE8PIh/jbCZFZAvu6DW5o7CYHmS7Q/9m2KnTpy8MD/qGUNY8ngeka2XulVWb8D0JcH2bwpEs
 qYOnUUVTnj1Dh7m2HrukTgDCTBkiR/q36jeko3RZvrxnkmhY/wCdXij
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfXwhbLCjVP3tJk
 bdeFWvq3MV+dzQjshX7a9bhEutJTjgGVcIpCwfaKeCwPNI5y8ch/GOL0N/txtIOzfe99S1olvoZ
 tTodtXFaNuOVStpi2gSgCs26dRlLjHOR5yAvJ4q0qwVtyHx6wjvz6ILgg3JvgRTI/F8V/iDZ46y
 HkZMfnZrRhugFIOf2o8ewWDDGP8C4tgf7qVyvHRXSL71lIvoIu6RGKgQrEO1Js+rDfewN2UhFL4
 PCA4KUiOX6YAZQ6WszvNmJKgLOoaeUMFzfSrNaDGY0pcff4ITMbK4LjTAKnmcsYkqWrFrWNuEf5
 eH2re2HU/dRgo3HGQfcN+vlLevTjO7wz4XVkbf2+DXdfQdBHd5am69UmXYIiL19qCqsj5ciArPD
 MuyFuk3NymKm1zAHCO0Cm5En+al/wA==
X-Proofpoint-ORIG-GUID: AXkp5742-cLcycoxrQo-ZSTYTY9xf4jq
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=69169dd3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Z8iH8PakIHK9AZBxCNEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AXkp5742-cLcycoxrQo-ZSTYTY9xf4jq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140022

Add members enc_scale_width, enc_scale_height to the struct iris_inst to
support scale requirements.

Add output width and height settings in iris_venc_s_fmt_output to
enable scaling functionality.

Add VPSS buffer to platform data, which the scale function requires.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 12 +++++------
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
 6 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 8250e0d6f0a8916f3389be60dba762f3b4f3c690..94c996c6eeceb36d5e63e3ddb0d402d7138f94c4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
 		payload_type = HFI_PAYLOAD_U32;
 	} else {
 		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
-			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
+		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
+			ALIGN(inst->enc_scale_height, codec_align);
 		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_32_PACKED;
 	}
@@ -237,10 +237,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		} else {
-			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
-					inst->fmt_dst->fmt.pix_mp.height);
-			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
-					inst->fmt_dst->fmt.pix_mp.width);
+			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+					inst->enc_scale_height);
+			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+				       inst->enc_scale_width);
 			left_offset = 0;
 			top_offset = 0;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
+	case HFI_BUFFER_VPSS:
+		return BUF_VPSS;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a95244cf6d30cd81199b9f1e51bf64c991be1790..0a0d4ace0bb6bee6ab11bd47fddb27432cd524f7 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -71,6 +71,8 @@ struct iris_fmt {
  * @hfi_rc_type: rate control type
  * @enc_raw_width: source image width for encoder instance
  * @enc_raw_height: source image height for encoder instance
+ * @enc_scale_width: scale width for encoder instance
+ * @enc_scale_height: scale height for encoder instance
  */
 
 struct iris_inst {
@@ -111,6 +113,8 @@ struct iris_inst {
 	u32				hfi_rc_type;
 	u32				enc_raw_width;
 	u32				enc_raw_height;
+	u32				enc_scale_width;
+	u32				enc_scale_height;
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..f1f9ee8a93560c0875a396f6197d4b42e3d2612c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -728,6 +728,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
 	BUF_DPB,
 };
 
+static const u32 sm8550_enc_ip_int_buf_tbl[] = {
+	BUF_VPSS,
+};
+
 static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -815,6 +819,8 @@ const struct iris_platform_data sm8550_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -907,6 +913,8 @@ const struct iris_platform_data sm8650_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -988,6 +996,8 @@ const struct iris_platform_data sm8750_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
@@ -1075,6 +1085,8 @@ const struct iris_platform_data qcs8300_data = {
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
 	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
 
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 71f4263ada898ce8333086db59e386e91b34ed60..51162690168e6e6db923e635fe17932ad509d782 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->enc_raw_width = DEFAULT_WIDTH;
 	inst->enc_raw_height = DEFAULT_HEIGHT;
+	inst->enc_scale_width = DEFAULT_WIDTH;
+	inst->enc_scale_height = DEFAULT_HEIGHT;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -226,15 +228,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 
 static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
 {
+	const struct iris_fmt *venc_fmt;
 	struct v4l2_format *fmt;
+	u32 codec_align;
 
 	iris_venc_try_fmt(inst, f);
 
-	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
+	if (!venc_fmt)
 		return -EINVAL;
 
+	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
 	fmt = inst->fmt_dst;
 	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	/*
+	 * If output format size != input format size,
+	 * it is considered a scaling case,
+	 * and the scaled size needs to be saved.
+	 */
+	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
+	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
+		inst->enc_scale_width = f->fmt.pix_mp.width;
+		inst->enc_scale_height = f->fmt.pix_mp.height;
+		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
+		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
+	}
 	fmt->fmt.pix_mp.num_planes = 1;
 	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
 	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
@@ -292,6 +311,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
 
 	inst->enc_raw_width = f->fmt.pix_mp.width;
 	inst->enc_raw_height = f->fmt.pix_mp.height;
+	inst->enc_scale_width = f->fmt.pix_mp.width;
+	inst->enc_scale_height = f->fmt.pix_mp.height;
 
 	if (f->fmt.pix_mp.width != inst->crop.width ||
 	    f->fmt.pix_mp.height != inst->crop.height) {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
 
 inline bool is_scaling_enabled(struct iris_inst *inst)
 {
-	return inst->crop.left != inst->compose.left ||
-		inst->crop.top != inst->compose.top ||
-		inst->crop.width != inst->compose.width ||
-		inst->crop.height != inst->compose.height;
+	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
+	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
+
+	return dst_fmt->width != src_fmt->width ||
+		dst_fmt->height != src_fmt->height;
 }
 
 static inline

-- 
2.43.0



Return-Path: <linux-media+bounces-49475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27DCDC39A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1090630E4B98
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F7533122B;
	Wed, 24 Dec 2025 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OO/kKzQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MAQW88Wr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4AE336EF5
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579491; cv=none; b=NQyJOr/4tVkSQyA5P3i5JFA3B9Pvwd4Un9EnaWD/pkiOGuNnKAmX9DJhXeQEdPpesx0fLMt9a5xmr/bqKPVyHAMrbYBRfFL3nB+Ae2FwndSa+x3PtqtXnaefD5BZ7+4T1qdADHNXF45cTOazUZfeQB2lLu/xjTqfk0TS/YGe7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579491; c=relaxed/simple;
	bh=ICATXnY8OUn+EYLLDMbD26cRJdbw0LYk2Tn53ySJtys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FH+gQKy6oltpcO5BtzsGiGywghV+4dPcZfcx35sJuRY+0JxdZxhCrwiPYbrd4ImHtKEmAKCOy47OCncgD+PJ9CSdHUIMcANjQzhGn5ZMe5vpk8GARwYlBzYw32g6GAAHjc7Mez75R8sAAOq7ZY1MnQ5jq8I8DbKSPhCw/58M2A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OO/kKzQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAQW88Wr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOBnCQ2913513
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q67QdQGLjQghzeJzftBRQzEPwwok8C7+UkPXfDPo1U8=; b=OO/kKzQdTh8B7tb1
	q0cGE5FdB3JCrznyoE2U8lgQhI6Xuj8yNYHALYtzkf2R9eQuGLilHHAxUch52Zzp
	q3QYwhgZfyt1UjxutYsg9WtDuoOLzRXuto7m52SpiuV3AnzW8qKw8uJXll5EflBd
	UBLrlc+CgDGfKXTbVezuWYmNjD5XC+u43sc/oIYTvdpy/05LqhxsQTXsZd1mScV3
	Ri8en0yg9xGNWWIFS7eJkANh+bi1vrk2+boewpH12soQiL4Q+JbV/lVfGFIwvxhA
	6g+K0W1aO9iPoXRosGH7JOKdzxkWPjTCmXrnTAQia0s7MEEBsceMGoutLjOQ7eCF
	Izi80Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k6js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so160554711cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579487; x=1767184287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q67QdQGLjQghzeJzftBRQzEPwwok8C7+UkPXfDPo1U8=;
        b=MAQW88WrWVNSRBpa86ZWUCwXPnBngMDmP1s/wc23Iar1N7RBaXPYk0zR/OT8W31G9u
         pq4Ag5rOk91YwB2/xb6WI+PBaucq9n7MjbbO4NQM4uDZvYHoYhTUEyODjf+fR1bq69J8
         C/iZYuwPko+6j/SwUUuR2diBZUsTPfHfYOqQ2yG3zHQCkbtD92hw16UcM7yI0e58i0dz
         mCytEb96luRmBuh3YxDNwOLZFk7ksyzoEFXatzDjmpkXiAoQ7v9jV3iEm/AzEMBY+em0
         yaiwduTsEhro9dNJwgb/85jNiyixXxT2rjxvruBQk8CAb04xRKDO7WAE5L1mfXMfdnmB
         v6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579487; x=1767184287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q67QdQGLjQghzeJzftBRQzEPwwok8C7+UkPXfDPo1U8=;
        b=hdCWTXMrY9xN8/WiCxyn+XB9gW2OX3yK36FbipitUh00ea01LDr3Y1QpLOhd305PsE
         vJoUVRz080unFdvKrgXX/fQRRCB25//BWTljCYOYcaaML/gSQcRMqdosun1793KM49Wq
         5vajVwtPMREXIIvj7KEc2ALXzlylQbEqirb3m5PXqUNOEmcCvlWDioh1L0mMe9DemLlv
         KgDJ511DIguXVYxrNMI6cheK/+wJSwEWPKOv5I5mQRUB+7ZOYzI6KGb5L1xK8ePrRZ8q
         G2CbV/Ffb9GTvaXGsEfkYmi1a/xt1c86uK/mz4hzGZCHjHjMHdStd3TpX2SChFga+MtX
         Nr5g==
X-Gm-Message-State: AOJu0YyZnIihWC3ZOrTJWtMOvtoLZ/tkwf8/3bcpc2C5noHhwgxDxMKI
	gNfzwE3lK2DrDphJZGCzKio4kngwempXyszrMiLLI6bi84WzbkgY1YbYEUZMBZeq/FLfKPv36Fg
	bqlKlsgY4MQevCx6i49EJ75CtpDOVpRlVKEgkTpOve4M7duXqpQ4JCFdsFDdshdzvS1jyCOCpBA
	==
X-Gm-Gg: AY/fxX5+TmmFbBOEZV4gHTdbwOnOGbjyNvEuvr+btK2g+/BbkJ258sfbLCFHe7NdYwB
	x0rYb073F9JYnyl9JacZGHVGetlnzt1tLOBctV5hX2iSiUOQi5J29M5n/GkF8Qs1dekzNjd9Ldn
	wWGDSTewNVPMxWofOOh1UdApVoLTNQOAGUQnRNNFn8lO4Glq9CAJ+Lx2/syki0tezUgHCeYrtRc
	wV9xKyGnHNqGUlN7jhWNj6Rfw/RXiJHTQMNyjOCUuLYNU0WfHMSuXVmi6jKCXSmphjdykJe8HK9
	yY5hjQ7W+KIhGTQdTG3+LPK3V2w3iBUrLq1wAnm8BgcEX4ZL2LAeNN4gxRBhVRb2p0unS0V/i5G
	dabph+3lZtvv2h7wN8HPYvw7dSmN7RGSpko8vuzhmM7rsktw4oKG8anT2YFkYTo0+Gxe5ONVhph
	KI7gNp/9eLmelsZnKODnO1ni8JZCceSAMbo0L4H28G
X-Received: by 2002:a05:622a:5a13:b0:4f0:131f:66fe with SMTP id d75a77b69052e-4f4abdb3a07mr234223511cf.59.1766579487053;
        Wed, 24 Dec 2025 04:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRT/MedxaEXpVi/eXyGCoyB4VSkFskbjX16VocUoouWVGYhnr15rPblB+vvr/Qz+yCNBWukQ==
X-Received: by 2002:a05:622a:5a13:b0:4f0:131f:66fe with SMTP id d75a77b69052e-4f4abdb3a07mr234223101cf.59.1766579486591;
        Wed, 24 Dec 2025 04:31:26 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:25 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:19 +0100
Subject: [PATCH v4 10/15] media: mt9m114: Adjust IFP selections and source
 format when source format changes to/from RAW10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-10-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXxlmAuLekQ6cv
 K68wpYkiO175xRU1DH+8bWeTrm5AMtSFuC4nLccI3jrvJZc+leVZUUKi0cLE6PGpQsI5ecF6TjT
 SckjXCSVKPhEQxVHEXPEyaIurm6X4PiFywMqgAzN6kh6TCbDpsn5w4uR98vdSkWtIfr9WOKIxEB
 qGPq8qRwRF1BPUACaUW7ORBzbv60PoGpgFJpLA6Hr5cRVC7gEuv0hJa2WJQqFXU3eT9iy9BcMII
 u8l3quM7VajMuOaTUglmxHcOAZ4zb3lZRhJtkcWrramWMgTNrkWSy3ZdjwBjcX/c2F6eo35zz3B
 b+qwBD6gcQe0X0TPNYq2tuAdYgOwpOV012BFSZj4NGvqdFDrCnTMFGIUjXVoxR5+h61xO4KmK+a
 ZKQ2DJp86q2jkleUeib4f++tsBDgTaDMfxwmcgLkqzoE+mkhlRFAWG4W/286qOFDjBVHmEEagGi
 PXdsrFoh6sQoPWQVKYg==
X-Proofpoint-GUID: QXU-kjIVl75mlilRtavUStU_possART-
X-Proofpoint-ORIG-GUID: QXU-kjIVl75mlilRtavUStU_possART-
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bdd1f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=m-OQgdKteQAIafo4PngA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

Changing the IFP source pad format to RAW10 means disabling the scaler,
which means that the crop and compose rectangles must be reset to
match the sink format size with no border.

And when changing the source pad format back from RAW10 to another format
which require demosaicing the crop and compose rectangles must be reset
to the sink format size minus a 4 pixels border all around it.

Also when changing the source pad format back from RAW10 to another format
the colorspace, ycbcr_enc and quantization need to be updated too.

Add a new mt9m114_ifp_update_sel_and_src_fmt() helper which resets all
these taking the bordersize for the new source format into account and
call this helper whenever the source pad format changes to/from RAW10.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Address comments from Laurent about commit message and comment wording
- Use simpler code to test when source pad format changes to/from RAW10

Changes in v3:
- This is a new patch in v3 of this patch-set, which comes from splitting
  up "media: mt9m114: Fix scaler bypass mode" into multiple patches
---
 drivers/media/i2c/mt9m114.c | 53 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c0710dbb670d4e40e13fc895cf8c84219ea43bde..a9162457bf649404ac2057328799f1be61558481 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1840,6 +1840,41 @@ static int mt9m114_ifp_enum_frameintervals(struct v4l2_subdev *sd,
 	return 0;
 }
 
+/*
+ * Helper function to update IFP crop, compose rectangles and source format
+ * when the pixel border size changes, which requires resetting these.
+ */
+static void mt9m114_ifp_update_sel_and_src_fmt(struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *src_format, *sink_format;
+	struct v4l2_rect *crop;
+	unsigned int border;
+
+	sink_format = v4l2_subdev_state_get_format(state, 0);
+	src_format = v4l2_subdev_state_get_format(state, 1);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	border = mt9m114_ifp_get_border(state);
+
+	crop->left = border;
+	crop->top = border;
+	crop->width = sink_format->width - 2 * border;
+	crop->height = sink_format->height - 2 * border;
+	*v4l2_subdev_state_get_compose(state, 0) = *crop;
+
+	src_format->width = crop->width;
+	src_format->height = crop->height;
+
+	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		src_format->colorspace = V4L2_COLORSPACE_RAW;
+		src_format->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		src_format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	} else {
+		src_format->colorspace = V4L2_COLORSPACE_SRGB;
+		src_format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		src_format->quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+}
+
 static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *fmt)
@@ -1863,11 +1898,19 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		/* Only the media bus code can be changed on the source pad. */
 		info = mt9m114_format_info(sensor, 1, fmt->format.code);
 
-		format->code = info->code;
-
-		/* If the output format is RAW10, bypass the scaler. */
-		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
-			*format = *v4l2_subdev_state_get_format(state, 0);
+		/*
+		 * If the output format changes from/to RAW10 then the crop
+		 * rectangle needs to be adjusted to add / remove the 4 pixel
+		 * border used for demosaicing. And these changes then need to
+		 * be propagated to the compose rectangle and source format.
+		 */
+		if ((format->code == MEDIA_BUS_FMT_SGRBG10_1X10) !=
+		    (info->code == MEDIA_BUS_FMT_SGRBG10_1X10)) {
+			format->code = info->code;
+			mt9m114_ifp_update_sel_and_src_fmt(state);
+		} else {
+			format->code = info->code;
+		}
 	}
 
 	fmt->format = *format;

-- 
2.52.0



Return-Path: <linux-media+bounces-49752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0BCEA415
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F220630087AB
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB6432FA1E;
	Tue, 30 Dec 2025 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI3ZuPCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZLm8W0h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACA86331
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114207; cv=none; b=ulM1pYHWIF+LuY2lWTCdVpU/6hlbdge8PgkLZdRAZnJJ5s8SYUWcTHEE8i/4eRBUTUMqaKjGHzkWSTp5KAnBAHyyh3u3XqDd240oZxMj5z8WRuX641yWoTk4tiDo+HdP4OBzrbuJECvMHJyeE9U5fVQI2lsnY8lQN8EDQqxZ3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114207; c=relaxed/simple;
	bh=4Sk0YA2nfPgLIrimXTzL601q8qRPpVzg6oy0cFocKVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIdcDSScC+oR2gKWlce7DHJ6yRz+bobbaWiFQoZwjJ26iBl1lwI7EGFyKM7EKVqzLq9vBdWRNIjUG6BfhcC/ipFBmibwzTBDAoKelty19UdOYa5WJVG0bOSe+ERKP5MIBVahhTRxKgrGfLtoLKoHcvEPbxtpDPCeNzhDf5y2Bjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI3ZuPCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZLm8W0h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUAUHDd956496
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qswEzpCbCYktLniio5qv0qVeG2mcCHZa5ramsj5FOCg=; b=TI3ZuPCwsA9BmkEy
	xky4tIH0OZj9zfsagan6PsmOErs3pwktyWaOwcRVpXFWF0bau2363wMIP4kXij9V
	H/GnNMrPxtu26rLrioRxyfCO/BlOXHIDNVIysuk62mpJa2FLoCM1R9JoYnwV/oLC
	1gO8zoceItUGKo8C6jFecZQs6FDs7wnyO7FEcC32k2qDwXeXOPzo16H/nVJ/vJVg
	DW4BaRzhM3gQkPd5oQ7Tyb0oFh+Hm55jItYUftR3tPgCSP5cKmr6p2HVjkK9ar1a
	Zdl+mvLAZDSB1RXlJwARf7mgQSE6cMZiqBfXLk5YphFOHbrl0wOf7WgnhiU0IxHk
	iYP34w==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbqk1bsb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:24 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-78ab0ef3673so161011487b3.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114203; x=1767719003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qswEzpCbCYktLniio5qv0qVeG2mcCHZa5ramsj5FOCg=;
        b=IZLm8W0hk924AhV3xSNiV0FSmOfOkze6++QF8t3HflO5F1IHCLFf8exlB6S8cC4utn
         95SSZBgF9y74iwilXMzo9UDLP7tttyU+GXQxH2V51mB4L9+If0JKurvyW+kRxia4sJCv
         sNhsqbFEsBbIvkA1FCFBYIcxqlU8tE1qF34uGPitwjy9wSQiuAnNBjdccrlWYjgVkuO7
         vZ3XFLF8bXqSqfakydKGL0x/12MN40TOmWuI8aEI59jR4paZYqXFHF6Oj2BNJphO/3IA
         kWvzz7AOOVysMFJz0VYMceD4s9QQ97wRyfYdBx8/+SRcAYnxZOynyInqqoLc+lij+fFH
         RLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114203; x=1767719003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qswEzpCbCYktLniio5qv0qVeG2mcCHZa5ramsj5FOCg=;
        b=dVM3dhu/Nt/K6X+d1NoG4w0GMxWdP6PjW+LBtVQBXXZH9fnvAAehlJAG0Wlq0wLiIe
         +tRvasiBCDrJ1dkdOrFAIPrajZxhMk0QdLp1Sbkos+XCq/hDx/TCMPSmDr3GxwBnBbKj
         IMLwIPfJBS4sspFvMkTnsJGHYaLagsgVmHwFJ9ikOGCYVPUk6SfElq/TLQvj04xLj6EQ
         6JVlUW3c6dX7UN24ja8vXH8QXphsN6cGF/agHb28/9trooFAtYSmnsGWtynpT7+VN7D3
         UR8TTLfjyDUoJDJNfZTblbkwnHdjrIavo/D6WZMGzOim24JF44hGGDKjHPGWt/Q83GpK
         lgMQ==
X-Gm-Message-State: AOJu0YycylKGb/+2cgFWRixkqXLzcIMVc+oHkb/g8f9voAiANl94RZjQ
	Rr0SV/qpyu/d1JSIJTPo6Uu6AC3WtTyEBnOUontIDE7Ldpe/4M184WgANOVAFVJL8RD/aV4kFPe
	6pPT836zQ0cTUqP0zM4dlDvpMQ+Vzv6mcLkJZfGGBd5f2NKSdFJc4iBVsq+VrSfYC2w==
X-Gm-Gg: AY/fxX4KwhWh8uoO1Oujzcpz0qNOAz2+iuzqVawaUkYQp6vbRZldOv+kc6fGGjVOWkz
	PpDfVCiHBTnPa2NQNmMOFeeB2cWpG26w1hurKl6ROIeNJnggjLywofGrsTcDMN6LkoMAWzHkPcQ
	+OdN+dKGFmDIGAFaOqrTckAj3gBpeozXFg9p+86H2VR8AAiTrDNAT5CaYAAES93XmENFQAEi0uj
	A9rHLx6dWmT8gihfn+aF1pzYXqKgTkz0T5Dz62abgsNqBayQ4lBThmSOxFBh7bD9/vScJpAm7Mg
	oNhmQUnSX4OAicZ0KRZ0v4bSEQxSzglWLH8KGsOyMUHO7xCaKMlN2b8RveB5Ecv/L3lJvZiLKzP
	OrV09NA/c9xMO0jEYJfM1FaIEdhT3OYpzdL9fnWJNM4j5dOGP/LNJebW6qKW1WSu7TShdSMIe5N
	TKCHqbwY5j7XhKlun502MmYJx3cRlBV9rHDWV5I4We
X-Received: by 2002:a05:690c:c45a:b0:786:a967:5a8a with SMTP id 00721157ae682-78fb4058175mr286180377b3.51.1767114203304;
        Tue, 30 Dec 2025 09:03:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/34RNRNajOkZI7QqvMxlKyynQoNzAVPCmp9wjJ2j5xJL9SGk8BXz3NC+Wb5EC2VBWiUTSJw==
X-Received: by 2002:a05:690c:c45a:b0:786:a967:5a8a with SMTP id 00721157ae682-78fb4058175mr286180107b3.51.1767114202901;
        Tue, 30 Dec 2025 09:03:22 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:22 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:06 +0100
Subject: [PATCH v5 09/14] media: mt9m114: Adjust IFP selections and source
 format when source format changes to/from RAW10
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-9-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: UdWleYHZILO3kQOKwnDMhBUE6YVGEb1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX45d5MAsCEYN1
 fH/SxcxytyA49bzuThQp7SK2e1adrr9IJ5PSqeqfLH+VyYSA98Sxzg/nd1XjWUdIKmCWHmMq6dr
 OHTktHiHn9uKP2RGy46BC1Pn5ZrF/GzrXKbfj4+Bsxii5CPQUih4TtyolZ8uISTNuf+HA9Uwhhm
 hLdM6gftHiTGTSRNI7w387vLC37DKutVXDC7AZTTaaXMHPZsoyLiaArw6A92BmJs9f0JNb9L1bq
 UTIGbK2zs0543qU6+PbKIeAev3Xf2B0IzCx2ucjMQnvWVr150x5NsWGzw8uj88B7BDy6nxKr8U6
 0tkTvCyPzMlEy09ZVqGubzveEPcqFYwumUMpr+g59bkrdYYU+mHK3TYx+ueBryouSMEkUOBOGKq
 SWPm6udcYCvO3Pu4OcyDmnYFYl77xG35movAJIQ+VmbDHphoqQU55LkH71NFVOzmMPSNayXstfQ
 kKcJT+81A/utVejahAg==
X-Authority-Analysis: v=2.4 cv=Tf6bdBQh c=1 sm=1 tr=0 ts=695405dc cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=m-OQgdKteQAIafo4PngA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: UdWleYHZILO3kQOKwnDMhBUE6YVGEb1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

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
index 4529320ab920145dd7055eec87a9bcb52e91a54b..9ef237943a085e058c17c8ffe50636ca2e4d95c3 100644
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



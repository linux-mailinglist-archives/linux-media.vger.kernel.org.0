Return-Path: <linux-media+bounces-34351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24AAD2002
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05E8D167158
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C791325D54E;
	Mon,  9 Jun 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Da2ESV3w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0B25D20A;
	Mon,  9 Jun 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476908; cv=none; b=c1RIFitbXLyjE04L9tZ0xGMA10C7MHl/tIzbQ3pygCBvp9WO1snOZBT4Jg6dL9D7S1WgTnE+5QbCB0rkDJpnONKaJ9qXUn9fDw7mZg9b1cmLGvyPrkftiXzLS6p9znbE0oCgJInPwVEtxhlLjmX5PxH2zW1cgcuJ+NfDXKCthhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476908; c=relaxed/simple;
	bh=tToi8tfhAwhbg8M9op98TVL8Co/zc0UThzZIsHoprw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uXiLFoyUR5N4ZYHMKNJ8X+ePbRIhIF1YPD+CbwU45/TrfB+sifFhdpOzj36jYCp3CV0MiGoq3QLecSeFNfn4CRXrC5VwD1/VOE95CX5tYv5YejOBm8a+CDGWTQ/oq7as30h0vWUOwt3acj68dCUjR+hES8wzVQ+jACmXwmOM74o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Da2ESV3w; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559D7mBl023584;
	Mon, 9 Jun 2025 15:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZPw43GyUj1rBJP84OCQo1msrNqbW6/iMIuz9l5cgfso=; b=Da2ESV3wDgMuxbze
	YdxFyNKei6Y3UtR+PJG4y5K3Yd+ssCiWIV4oJdpHfyEqfZKtsIfIkBEBq0D56dL3
	H67LkWp+nfFIvh23EQA5ySqQLU0DuVQW60Y4qLOeXYnI+knjmDE6ABAQmMKuLMYu
	t+yQi0iP5xYnQSUn99W3of3me9+5VbsjNoEKURzRe6jJp+xkB2Sisw11SQqkx+xk
	i6D3HkEMmsSEz+SBQa0PepRJXpdSQ0s98CCMus/V7SBH7eoKNFX6JXmnIqHH2n0x
	/hLfMbnNDDct1GVm/MFizuoQPDPIl8lW7ZfdSbRNS7S3/GeWUijljIDsZMo743kD
	OeuU1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2fxvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 15:48:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 29892400CB;
	Mon,  9 Jun 2025 15:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 708B7BA62B4;
	Mon,  9 Jun 2025 15:46:32 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:46:32 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 9 Jun 2025 15:46:24 +0200
Subject: [PATCH 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-fix_vd55g1-v1-4-594f1134e3fb@foss.st.com>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
In-Reply-To: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01

Factorize code and prevent future erros in case of media bus codes
change.
Rename VD55G1_DEFAULT_MODE to VD55G1_MODE_DEF to mimic other macros
while at it.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index dec6e3e231d54a742bdd08ff2a506c152bb89429..177caa5470cfcf49e0ae2fb568d7872a5608a11f 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -111,9 +111,9 @@
 
 #define VD55G1_WIDTH					804
 #define VD55G1_HEIGHT					704
-#define VD55G1_DEFAULT_MODE				0
+#define VD55G1_MODE_DEF					0
 #define VD55G1_NB_GPIOS					4
-#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
+#define VD55G1_MBUS_CODE_DEF				0
 #define VD55G1_DGAIN_DEF				256
 #define VD55G1_AGAIN_DEF				19
 #define VD55G1_EXPO_MAX_TERM				64
@@ -1260,7 +1260,8 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
 static int vd55g1_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
-	unsigned int def_mode = VD55G1_DEFAULT_MODE;
+	unsigned int def_mode = VD55G1_MODE_DEF;
+	unsigned int def_mbus_code = VD55G1_MBUS_CODE_DEF;
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	struct v4l2_subdev_format fmt = { 0 };
 	struct v4l2_subdev_route routes[] = {
@@ -1278,7 +1279,8 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 		return ret;
 
 	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
-				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
+				     vd55g1_mbus_codes[def_mbus_code].code,
+				     &fmt.format);
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.25.1



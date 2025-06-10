Return-Path: <linux-media+bounces-34382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30984AD2E59
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80C8F188AE99
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC59C27EC7C;
	Tue, 10 Jun 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="StJN63c2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6B322B8CB;
	Tue, 10 Jun 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539326; cv=none; b=mgfm7fvt6Fpn9/QWk95aJKSbvZc/SNorUHBwKujuQYhYpPRqYqY6l69gcMbBhXXwWuUpVcl0ChLlj04RlZxQ6WyrnoyUk+zb/NELS4A8HOiq9CoeM6v9D+wtDTwFM+qbwOp0yfZqVv0SA8vtI/421AtMgHJmPOCOGnK0Eu7xo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539326; c=relaxed/simple;
	bh=tToi8tfhAwhbg8M9op98TVL8Co/zc0UThzZIsHoprw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=buu2V2dOU1uPOTvb7q63RAWTAfcJgNftBNXkADdrvXryuspXPralQSLVc3ORC9/wRavHl8Wro+LsBaYDmWCcjPowSosh3Z+V6NceO7KxUmQCD3CxzlFHmryaUU/AiLwVnMsu0rvaMnUDWIvrIT8dd022I1iRW9WAVj4RQqogspA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=StJN63c2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5xdqd006735;
	Tue, 10 Jun 2025 09:08:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	ZPw43GyUj1rBJP84OCQo1msrNqbW6/iMIuz9l5cgfso=; b=StJN63c22GLOtsvG
	9fojwf5LSEuEPKjFbXmz84uIY7ub3vFX99Z9XJXV2a1vFpsN5d5S2XhOo0h0Q7GF
	HBpGoemQxN4fcBWM5/ZHQdUMn1f8kB3SxQ7DzQiHjg1MHcQm4zqi/F1Pd7P2N9nH
	YGS0i8KoFV64+rIpwliONXS0nstH7n8kaK5J8LrF7QuRHWTsaRorojKTVLi1GixN
	h4GSLWeaddFox9BAgi13SEz3KX+kW65txewuOE3Vgl8CUYkAaKLUNd5jdGeFkRgd
	CADr9mUF0OMeANtFtjm3NanRjZdPo4IgMnxRVv+xkPkgZU4JPDfu3LmquDkFDc3q
	bGa+8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2k6sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:08:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8EBB4005A;
	Tue, 10 Jun 2025 09:08:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 531B6B9EE0A;
	Tue, 10 Jun 2025 09:07:44 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:07:44 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 10 Jun 2025 09:07:44 +0200
Subject: [PATCH v2 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-fix_vd55g1-v2-4-328305748417@foss.st.com>
References: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
In-Reply-To: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
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
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01

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



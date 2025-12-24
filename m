Return-Path: <linux-media+bounces-49471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA294CDC35B
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E55730305E4
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4711930E822;
	Wed, 24 Dec 2025 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RbtQqxcB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIOPb0Uj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69BE336EE0
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579485; cv=none; b=cWB8pqFMDAv5K1gr51VsRRMvnnurhPskEs4TTb3drPqLjL0CJYCYEbZniEaxUGDcEop6jeUo2RH5haIMC3YRtLiRlV3k7TLwQu/jwe4pXReuvgAfIhdIC7cUqCKgOiqUiQXAvYTGJJ/bBW8i2ZZ6Q2wdzfnDn0S/vBBq8YdUlss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579485; c=relaxed/simple;
	bh=b2c7aSXIBFANsOsl3sWyp6Krl6PwUCB1Ergo9aqsMhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IU5m3rIGIKm9q8w6WNEoixJ9sRrhVuGKeyWdyI1XR9H8whMU7FidMuXDVYsn7yMnb4odVDw/RDE+P6iSiKO/LJypMr4vnxW9JyrfbX3wnfVxe3nmk7jxLCxIOGWN0J3VJxW/xAHyBH1lDJj2npWda7wKYh8YiYQuWiKwGctqO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RbtQqxcB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIOPb0Uj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOC9cMq913433
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sB2XKaAMBemaHGY+Hx2NVmlhFiJWnpVmNC7a9z7vO4A=; b=RbtQqxcBz5VeD4WT
	xJJ6yGzSOYv/r6HN22Qxl1pi8g/OD88Opo6DiQvU8P+vS/D1YR8jhcdEu/GN8JO7
	3kMcBxKbgp09tk/WWfOtRslc7zoVzXwgsGmXc6oXztyZfpd9B/I0bQE+JmGo4aaa
	rRSazLD+9mfkHWHTDLbueyQJVU6TmRUo9cqCYaPN8HgXCRs7q65AEmNP9PvAzQK3
	gCwMzvb35ChYVIP3OAguksSPr6X6t7QR6rW9GZg7th9igTv6JD4Xt/LKhWKJHuo5
	Cui8iWbeEhXuYz2CnGu2RTFTH69zCfOWdG1P0O6vQt3X1wkahRgN596Dh3d7Zn1M
	WR86Fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k6jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so83380361cf.3
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579482; x=1767184282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB2XKaAMBemaHGY+Hx2NVmlhFiJWnpVmNC7a9z7vO4A=;
        b=YIOPb0UjjbmmIz6+FBCf6/p7ZQ6JF6BFjhM080VL2EY/DzZAXOdx+v44Y+SeLuVdDF
         C4ofO/hLLd5le/I8t5hZMepvSzfwaTE/W0OWtCtQT/eQnK4cQ/JGmzzCDofI5x5ZnQDt
         X1+VfMuPNnIBRT0LvWmev5nbdyqRleunWQWqOg7VRIuQKBvMP33IoNQVPx0BMFL+8YVC
         QR+p5tR1Q6x4D0kuUK3qSt1pp0uVtiv1v8vG4PtOCwInZShjCpMAsUrbBJdFn/OdQLuy
         LDwJmoFs9TBFXZR+b2kAUoIjYqPqdynWtD930n8yK6qv+YJbT/iUYQHwW0O6dtH2Suwy
         77Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579482; x=1767184282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sB2XKaAMBemaHGY+Hx2NVmlhFiJWnpVmNC7a9z7vO4A=;
        b=g2FBvgybb3rSjWyE3CaXMfdAQpYDPcwTBYrdGHEMF7BlOPm0Z8rINKBwb2ECou9Z9B
         6gJLAMkuTtDMicSsivCqpmPAGBjw7V5mvP6rsp7hNTqARoaDOjOegD0W5crHdrkMly9l
         sQb1byF5DF1hT6D1bF40/zJUuRVu1bp479Yg0RPthQpQ8F3X4sk7nHbmdMUTaHTY3FVo
         wh4KAn8ZJAZDG9AacluHZYAJYKHekq85e/WFEjeHEi8jwSOm5Mw7E9cBVjDrxDq++ZgX
         iSSadE+D46zpoZVFW6+1jqrcDpsYAipFBqeVWKhT2+SKALjrLAEpjrEdBf+HzdZuYfxK
         ekYA==
X-Gm-Message-State: AOJu0YyaVTs5FizTAH12zLrolbGicvfZj/CP0wnVtKNAB+nuiKKUBZTw
	kjwaen4E7xpiaEFb02GWb78GZg0ZPTzH/elDojIENbmhtKOtA0hIsykmn5XGoOx0OyMHOJRUYKX
	MoHDVIvoNmmQOrZXs9IGzY79STLXhOGOWyaZZm236FVbkycswOahMcA5Wlk0wJvILdw==
X-Gm-Gg: AY/fxX5kT8UU8n+BjHU1VKjuJz8G4uWrZBMa3gbhD5dc+WtPo1gjyth38U2nIWI6ykp
	T9jH62aUmZ0u81E3qICwxneVo8w3jtutDEE+rxfDvHR3m/cokumTV1rcq/vb3twLaJY4gwoKkW/
	yg6wgyfTfDrHLgDhex4HGXatZX/h1Ldba8G3aHgomrEqen2Ga2OZUtPzVKXRs0SYD3QszFUoAWo
	3hhSDEmWlObZc77a2pjEt77G/g0ZC3UKX9VZuP+C5fAmgJOXce7LPwS+CFP439DPI+3tUn0WiWT
	9q5J7PVzdTIvHrm80d/RPs04h5cdKbsNcpGybjspiT8DUevJCKivn4e/zq9k1+qrMZn0jtpfC5C
	xitA2DEvs3Dvi8iA2OcuhbfK+1faJD1Jp86VZvkOLFF7zGL10b25YGM5UyhB8rsh7S8n/slUEnb
	4z+hgAq6fC2AO51N2jPhOUvK2D8qAGqu368ybrbwP7
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr57508831cf.81.1766579481742;
        Wed, 24 Dec 2025 04:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB++obDSGwhONkEH9QP/sY16TRHTTvZpxUmaU7LrmZqOB2z/I+DQ60Sl2yUqGaSwoKu9i3Tw==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr57508301cf.81.1766579481262;
        Wed, 24 Dec 2025 04:31:21 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:20 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:15 +0100
Subject: [PATCH v4 06/15] media: mt9m114: Tweak default hblank and vblank
 for more accurate fps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-mt9m114-atomisp-v4-6-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXx50shUDuW5mu
 drcHwLvawCzKhQU+McswoXpIpmC4SBan+f9Tr3i4OBNa25jaSHHqtThWiwoMKpf/7g0kQmDs8hy
 AdikiivIpbpHwIYjnDkmW1fKFbuAp8tSvLcFxslu/eDBFCKexXEgnKk7MEzsZa70067zHUE1lbR
 57KW/nA3o5YPljnRRemKz4YJqe/aiqEaf5BVcmCyZjuDwXC7j9TcPnstFxWsAUtdbuX97k4/1rw
 hd6+oq1d37P9slbZOj6m/zYSbH38TVV1Iah2CGSViEBE/VWgJ00YMv1f2WFiVf0L6VMaE/YHKvg
 /Nbzjt4ltFpVsxi18uqiUC8bPvIjkVsa6wwxdb9n0f8m5bsKRAWXdYj+G2em9dlSClfmnWbuYbD
 sgR6Cf0fvoc8nPK8186DERFlGl5D2E1ZiOi3dfFdDI9iili4MR3Myo5SusOdH52mkOY8HdGVxVo
 YLLXSpobryAzURc4Wbw==
X-Proofpoint-GUID: 7E9Ejq97U786F-yakHGHGq6dz8RN9fz4
X-Proofpoint-ORIG-GUID: 7E9Ejq97U786F-yakHGHGq6dz8RN9fz4
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bdd1a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=ukL-QT8NHvV3VPxu6cQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

The PLL gets programmed to achieve a 48 MHz pixelclock, with the current
vblank + hblank defaults this results in a fps of:

48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps

Tweak the defaults to get closer to 30 fps:

48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps

This improves things from being 0.026 fps too low to 0.015 fps too high.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 3fed509055142d7a134cae6cabadde423743178c..d58445826c090f377db473f7926c1b612874ff78 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -337,8 +337,8 @@
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				307
-#define MT9M114_DEF_VBLANK				23
+#define MT9M114_DEF_HBLANK				308
+#define MT9M114_DEF_VBLANK				21
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120

-- 
2.52.0



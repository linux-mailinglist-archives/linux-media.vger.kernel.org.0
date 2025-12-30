Return-Path: <linux-media+bounces-49745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D1CEA3F7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51BCD301D305
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC0032BF31;
	Tue, 30 Dec 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyU9HE/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNVehGVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B4319617
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114199; cv=none; b=CPOrK5Hi8646O33zfm0qTzt/eJdwvLNv4tJlWk09bUhKistB1Tra3mocq5ZXIX8Ziplfuw2DsC20lIfT0/knrUNdN2Q86D3pUgoYzLE5n73nK7gGzHkQYbtoAUTQj23zzmb5F7CiZP2gjWen7OOga7gxs1+sBAi5pRUVmS1803I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114199; c=relaxed/simple;
	bh=E8zM/jnsYTbL0D05aH1pJVbbk3xxTXhkSSmDae0DFzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJ+nOJ+wYZdntKvaJLYmZee9/tcMtUa44c+zCxnw6n0J8yks/Cl3ygLVr7bfixrAHih0tXX30OeLPYDVg5GPmbTMvbZ+7Yu861qPbH0XsI6nuO+uuWbgZQiDI4UMzkctwkzf2Au5wMmWozAY0hv0K296Wb8/V0IR8lNzaVCP1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyU9HE/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNVehGVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUBDG182671413
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OojpLCac3m1kHWGN11vnnJIfJ2G4KAMmQwlM0wKfo38=; b=jyU9HE/4fIXP7q1s
	BVa3LNrG5jFnyx2ZWgXvShSNmsnPvEiNaJ3UOJzaa0aOvp2gaUd1i5iEF2vKdbH1
	9fIkDxj8xceJG/hhYU0/b7pShOjwHUH2/yQv673/JvlAE30Mpxy0Ll9njWAF6B0b
	XKjGdadWeSGhK7HSRIUxrpppZnGpWBg4Q6uW9hOyWCrVnvwNXXuhyu197wnoBo5t
	vEvzqYzAh82I7tOwpdaCIxBWOlJ40aR0FV361TFUlop5BHYrcFsEFM2dPkSD+d0x
	D29R1G6ihAVRVgCuC2hPlS/AYXaLAj5CyDHIxpmHZMGSkeIlg2Gvw7bOdVFkPVU6
	soDQDA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fct300-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:16 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79043e14dfdso15237047b3.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114196; x=1767718996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OojpLCac3m1kHWGN11vnnJIfJ2G4KAMmQwlM0wKfo38=;
        b=KNVehGVa5VakR4zeGI6I5qbACvpTJ/L9+AxusnzD1Q9eAtgYuxa89OF+osGscEX4C5
         B65S9VWotKqD/ZSABOvgr1W4yX6u9Uo9msTSi2TJxDiYzWPbw1Nik8HovlZrVI7jS22L
         4ImE5tzwx33D5NNHe/ngQ3EVaoTg2ptUlLFdeZ6jd0CNE+3BMUuEfXO2jNWW3aofnMrN
         Jf89r9Tgp+6B4bXcD8GTtVMZMgZNLFOvBK6TPDYUlHIARnAPa41PlP3+QlSmqd1vrq9t
         m3LYAAgDGCvk420jwXuRokhEGZQL+gSraiu1591B8ZCdKO/mi5wnJN0L7QQZlaaPm0o5
         mVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114196; x=1767718996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OojpLCac3m1kHWGN11vnnJIfJ2G4KAMmQwlM0wKfo38=;
        b=OlbNtUINh8xygVw1uOhsHqEBDI4mAc6Yu+sKH4HF0y7GLEnr54ySnSgg4n7s0T1ey5
         CZfjrkPLxK5dnYnzfIWRnnB9DBXH4tFp/e365T4X6OMuqzOZ1/KgsR0wEMYuAqjItnpu
         itVNjEpRdmS4Wy+VEDarInZOqKK8giqcARsJ/rizlOLaM+0gI6EHTYPIBLmg1rbl//ZB
         h7Viqfdh7ApKLfRUpWv0lJJmzXjOZtw7Pk/MwPk5Bi6pAcAb6dpKx+Y51ANfU4gBe0u0
         q0Gus5sfzalkEHyqc9UsB8CAgjUm6y/idgwczYfpQ6p2aaOIH4nZiJGeKxHUYeSk0Vm9
         5Veg==
X-Gm-Message-State: AOJu0YznrcTv/OuwIkuT2YztxYBZpgKzr2Wyjee7AD0fQ66Wl3CE74p7
	L+51x9ln7AZOdNT7qNCoz0oyhOJ7xNJc3GFPiS1rqmxzNi7+60ndPSJmSdtOPEp2xxu6So/6fxP
	ukfzHN0EbEBeo7Fa4eZN2uKRIQmAHOSOl0RS4aQgPR3qKrHbrFn9j9LwHrib52lO5iA==
X-Gm-Gg: AY/fxX4y2ztg0KF3cIsM/p7oTbZtqmaeb3rNFhmYkA9FDSjgnbdHDFVVFrpNudJog94
	gp2fUP+vxTUvLe9ZqHkXcl/F68+KV8LxWkM0oMQxYxDvGp8Jy0bxMhuidQ9gEZ8mi9ZyjHH4wZA
	QhtKek8JSiAw+k+0ddh5+ledxquxT7urRd+IPCeBleXJeAklFso+YaS+PTg1/jKJEOJMDpTKS+5
	GiqiOlcgfku4oD3vTJ9cxPtgniRy3fsGmzlTY1ACiHR1I6HgrhuI186YSFOyqRgEWOaiRFujKCx
	GY77t9jwSyL9BYGX7LvdA6Xj0pZMjOxyzVTn0nnGIAnZsKYBYO0ns0MbwZM8T30dnNKOJ0iKtbx
	oHt7iZKnvEz1ZkSfOzTkmv01WZ4fVNdCy2a7o2dYOMkkUqqXOu9MxRtsRB2zQzm51S6s3YK1Stl
	XL3a8MGyog39QNLKDJ4yQ8A9RoOodvTty2Q/NPtAGf
X-Received: by 2002:a05:690c:680c:b0:78f:a7e5:cf3d with SMTP id 00721157ae682-78fb4068a25mr294330427b3.57.1767114196383;
        Tue, 30 Dec 2025 09:03:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/6BQw07ygyzSZpETeo4xPAUaLGeseTCsCZ5I/D6YZe1FWfh+Hvt22ZiumxhwIzrO7yvoLlg==
X-Received: by 2002:a05:690c:680c:b0:78f:a7e5:cf3d with SMTP id 00721157ae682-78fb4068a25mr294330227b3.57.1767114195983;
        Tue, 30 Dec 2025 09:03:15 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:15 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:00 +0100
Subject: [PATCH v5 03/14] media: mt9m114: Lower minimum vblank value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-3-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: sWNTbDGQFegryw_uS0m2dXqs2vRsbgou
X-Proofpoint-ORIG-GUID: sWNTbDGQFegryw_uS0m2dXqs2vRsbgou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfXwNs1X0eZUJHw
 KeK0SdfqFOQUSrSZY27ObqZ7K9Ihdkqny96TnfibwUowco7Plqk7v2/+alCJmRvJUtlasSHodtp
 VsBB1v3Y3MRU0VC9AMl2YwVuWFG5XOjoyc5pLfs0QoNuIajAzw4CvF/u/S5o3hfZbXsvkBC/ea9
 eWONXk7RNR1UkdPlotOXQluz+fLFnwi9AFmS3cenJd8fCt4C1qjNpG3tg5dFZ/yUjuL7ZKsLfoX
 FsY2hDpKPr7OpgYTsnsNAgtkGAhtgd465rxU13ont29J9+dTL8DyHpnSymHxgi/03v6/5O8bmr0
 M4p79H08qHCd15PSoq+1HlzcpIivvp5M55oY/DfAwHRrMQYb/Al0F0JFZUJxAsLLuC+1Lg0niWa
 aJRt4gQwgk1HuWvksWb+mEpIrYyEEGKlLIS06jVbpt8jByUYCXm9UKAdTEh+ujBfvEhawJd3B77
 QMjDXuz9ZoglYQrye6Q==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=695405d4 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=qoDHQqv3VgfKNNLz41EA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

As the comment above the defines says, the minimum values are undocumented
so the lowest values seen in register lists are used.

The version of the mt9m114 driver shipped together with the atomisp code
uses 21 for vblank in its register lists, lower MT9M114_MIN_VBLANK
accordingly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index bbac5fd9b2ad85a1ab56a7e36de16659bc38a369..d9cc260a13bd9f7dc76b69696ce18b953f43e3d0 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -329,13 +329,13 @@
 
 /*
  * The minimum amount of horizontal and vertical blanking is undocumented. The
- * minimum values that have been seen in register lists are 303 and 38, use
+ * minimum values that have been seen in register lists are 303 and 21, use
  * them.
  *
  * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
-#define MT9M114_MIN_VBLANK				38
+#define MT9M114_MIN_VBLANK				21
 #define MT9M114_DEF_HBLANK				323
 #define MT9M114_DEF_VBLANK				39
 

-- 
2.52.0



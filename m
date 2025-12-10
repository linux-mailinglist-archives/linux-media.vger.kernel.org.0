Return-Path: <linux-media+bounces-48574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB3CCB3CD4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 19:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7912430133D1
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 18:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5613F329E5F;
	Wed, 10 Dec 2025 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="he2I8Sv0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDc+Q/pP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C393254BD
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393154; cv=none; b=FXiL29xvCNtDd/CpzL3sc0+864hhFZ6x0As8EkNVldv7iQzx0p/Xn/GdzqPd4s4QGSMKkUKfCUC/Q0SV5UOCeUQkp8zSUfZk2umrQRrKpcy6rNTeL7UacXPLobG9Mf3S60fIZw+ctXWzQR61N8X0S4APjKRZTHGZ3ypp31nBkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393154; c=relaxed/simple;
	bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYFd18Fa1qaWURtHDIlYF2owE+aS4KmlC+i0afloNRSQdapuzbn7iInG++BbZtBqMrJQUOy3dDNVgJKtb3UgPoB9fJ/MT5dplgunlBKpuI1lyuyOFoNLC93eRjNFbKFUErZy4b/liMo+yaMWn++eCjv2un/UC5NKoXKuqrS8Aac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=he2I8Sv0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDc+Q/pP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRT3S3178110
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=; b=he2I8Sv020anQ1xj
	EAXH4UC9qOQbFPoDHg1foM8g4hHclcQcrarF94OrSmYw5Utkp88zo6eJZsr02LpN
	At0q8JRl8IZsjQgH/eCeUD1DKUN/yYzblQL0P2cy4vURMkyO3OGFeMeMlMIsfUX9
	WUXUhjldT0DKgQnigoeJaM56MrqLX4BTHdIVbFRxH4NQn+oIvRuLJO9ku3ZsvUiP
	gxOEE8eSlBNhVPhWtmJt+zL2pln6ybCHq/fvjYvikajl8VYEPUWEk0RDxHZnoH4I
	fPW+bCaIOwGzs3V8hXytPJqpw+5hWoWaxMkYpHh5+ItO328I94BQmSCenReRjfy9
	AApugQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp2s03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 18:59:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ba43116e8abso19950a12.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 10:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765393150; x=1765997950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=kDc+Q/pPNvlon6WK00Whk4SUj4pY9IrrPMIbnUBiOveRBOoP2a2r1XrRROx1C/8zQJ
         oZzcSMRIzVvur+PwIu0xkN5WwsvhBe0wFT/HT+t0QVBD8u0zIvURCd6MooM4i7XG/r5Y
         Zhn7dQSyTCaTZbReAGohUH4abOkv3n/pp0SLVMjdv2jzbzgw8KbpWa7vW7y4UF/PX8jy
         wl2ceefeehXal4OaDpflFE7G3uyqQXjNS++Z4JQJ4tsy3hZ9igJg6+yUHw5UVzzL9WFu
         ys/lH39Uk6SpNbnj+yTHbsEo8LtfCEz0IwgSd0dlEHH+Yt6ipkGPhnBAQgacFDZlSAZJ
         vMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765393150; x=1765997950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5XieH/3awDfs/tFlFkM5r9w59nwt/TmWB9woGSGWLc=;
        b=uuZVbIK4BtaahdAOWKr3YCnkErKqgjIN6I5TjDHYOQpPnTonP5A4su+FN2PH7Pasf7
         RUEho/7NCWu+Oe8GWJukPaZ/e7Z+hZy8hT2jPcFuxNc5JAHbhOzZxxn7zekDw7H78Kbe
         hv5DlSpkphELg3sbIH2IStCo0dqWmVxGQQioRtnCn2i7DF3fAnWYmu0prZBstL2S010z
         yEWk0Oz/SsMAfM2qnlq79H4bquiPoNZFD9LkGosDtFg+SV/Kuwo+aXCcmyR9l9qONe+W
         /5uBoaPgy74bDxNaAASX1+NOk7jtWE+MWASc6eBF/NnxkJvsujmjD2zyvVGh3BqlWr7K
         WsMA==
X-Gm-Message-State: AOJu0YzQ4TT0THQ615WXMaVjb1jYS6O1FRgOH54GXrrn2Nndat3WW1O5
	zZbPYVGatSwTdROmric0HJXZcu3H1ZyGdJjdlztNj+NRqXLHqyTxCGE4AaNlvvxkJsm1lX1DGq5
	YZEQiLw5w7UUIvl1Hc0Fh2DLMsZaEs1NOx+o/LwP9tf8e0nCd8zIc1nmIoGBnFQPv+w==
X-Gm-Gg: ASbGncv7v/n3RfK+w9CiIewYKSk/U4ZJwAo3vxoiO53+6Y6cHSO3xX9VmMIH/z34dPZ
	TWASN27hKST90v8q3phHW/K61thVHHOdCYS4sdfFvKEUK5LWZ8QUOE4kYOKsokW/Nn9trH59Hc4
	SZQIzGj0js96kQqr9L91I3neWQO/q9wCOJRxaUuiFV6GOepKswCBClyAvKU4m28Yk2CYEwMnpc7
	6T5Lo3RNGtC66mMpV+N43F3pqlmIxg5UKjYAF4L/CfGvTadD7/BikTM3Zlh1g9e0hlXjMO/GKm1
	M9fUQR8ZvS39KwpG57nVTHVSl6d33f4OxgUZTkyL1wpDTg+0vzl88TPRUZFb+MEXMKpoCC0HxSU
	TLlruJuBkHeNVx7Z2JFB1PESrizX64p9MAN0D5FE+HlzW/oj++afCR2p0JbwPgwC0JzY8Ug==
X-Received: by 2002:a05:7022:6199:b0:11b:862d:8031 with SMTP id a92af1059eb24-11f295a78e1mr1412509c88.0.1765393150294;
        Wed, 10 Dec 2025 10:59:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDUVy4v2ck8fG4ASyXLL0u5NGQmJAA4GYlMhKQutxRxjlpvz+rDslvPmHmqJUAPRUaIyhO/A==
X-Received: by 2002:a05:7022:6199:b0:11b:862d:8031 with SMTP id a92af1059eb24-11f295a78e1mr1412486c88.0.1765393149703;
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm778008c88.1.2025.12.10.10.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:59:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 10:59:05 -0800
Subject: [PATCH v10 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-av1d_stateful_v3-v10-2-cf4379a3dcff@oss.qualcomm.com>
References: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
In-Reply-To: <20251210-av1d_stateful_v3-v10-0-cf4379a3dcff@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765393147; l=1333;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=ShXSwBiBFlrxCS8qy3BkVJmHbLDT1NGKrhctV5UO0Ns=;
 b=cWZGZ5dfpD+JXutJnSGEF7+dwjGHRCJ/eKBewagAakBh5FrzhTJEpxaCKUDKLboQPSYjvo0N2
 R5fbyrWTiDVDCRzmpNAEBDbcWdA/kXSG1wfd/ZzShjYblSI0QDB03NW
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1NSBTYWx0ZWRfXyTTNrYBheq4N
 Vwe8EZ7Ru5cdtpcq/tfeKKucdaRxxtp9oRGGSwc+JdVzCSVkfWq9KVD6Jkob9Z3GQts+7F7Spn/
 QILXQpNluYkkkfrIMrVLiLcURVbCqiptbpCXmZvOE1BCzdEo23/56sriD5Nx+wybc/a4x/8Qu5C
 V9K/MFmd20knlyh2525ApElb4SuZ3axInpyMyUDF0h48spGH0NcjaKwrAnt3FaLnZdcNwmJJU7s
 Z2cc2YKoKe9xCVXkbsfLaUGoZbwDxVn2IFJ73a0ODukTTPUP/ewHRRdodS94zpuJgsgXgfzaLsF
 FM46fjsJJSX4OTR8FMvbb0vMVR4TzZOgZtLNkFxV3S+cJhfmCZBDIHesLCZ3RpUKXjhp4nrt7wX
 OqFNOKqniZcO/C0UmqcyoEdVbOiepg==
X-Proofpoint-ORIG-GUID: jYK5PJfkPTsMMi2XM6azyKt74Tz8Tg0r
X-Proofpoint-GUID: jYK5PJfkPTsMMi2XM6azyKt74Tz8Tg0r
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=6939c2ff cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100155

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..37d33d4a363d7eb02119b84bf368dac8e7a8bd8e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1544,6 +1544,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1



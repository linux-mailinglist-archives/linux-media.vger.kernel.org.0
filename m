Return-Path: <linux-media+bounces-41608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A6B41080
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 01:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576BA1B6558E
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 23:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183022DA77E;
	Tue,  2 Sep 2025 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jG0UvFMd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D026AA93
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756854030; cv=none; b=OVjqIe/wPiN+vkmGOz4hXUCpfTOQxLe+IF12RohVpwyVW2k2sTR8IIRXKiod6qraXT+mPvchtqxiBQuR8Qp+TMdG4cTmg/MjBCXQ/fvtUEYoqcOF6ULxYBX4JUuoazhrBuJMp7Dr4wb/YELILkeJ1/zYlkNeDAO1zMon29RwKOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756854030; c=relaxed/simple;
	bh=tQc6Y5Bsiiea2HywNjxgjTAh2ShMYLKZglVKp1Iwxp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FxQsclxWKHXogZgU0XYJXo3Hna+c/ULfkP4eLjn4WPlxgdI+FaZaxPS95ccb+MZmRUFm9jhRolfNsaFc8hG/24ROBTDizyBYfE0IF7WyNOiyRzlYg38LHFerOjPUg2Q07jvP9qzESieW5ig9nrKPSLY2RamF7fe7fq5usGOL4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jG0UvFMd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqDF8012679
	for <linux-media@vger.kernel.org>; Tue, 2 Sep 2025 23:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zd0Lprzr3Kw917hPg2BQnERLEjH2IUBAYq51p+NcSlY=; b=jG0UvFMdyH6XyE1K
	N2jcA7Ij51Zs01jOcmUzif39F2eRb8lYd3gffHOyGB04GqPQmjAEB/UvPXkOKwZt
	YtINtb7l+MKqKJ0jVI+dcJ04gnPiYxwFIWxOfNeZUUmBvALTMSC4hZb/LHGPsqhl
	duXd9OT6xPszRtVPPO8EI03bKSNDDOwPiVN8PCe99X4Zm0KOIyozeCeLQW7ls1t/
	sL42ZC/GPH+ft6oSN7FiE06sncJ4qKG18AlrO5vCnOmgCaX+aWYgUpn+ILRR/vx+
	pLBxWTQQtFYsqoGSFf7WssM8VIpH12Y5qIsh9e3X2KWMN5fWFjmB0cvOfdNbrQBp
	PJ5uPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk919am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 23:00:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329745d6842so703194a91.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 16:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756854026; x=1757458826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd0Lprzr3Kw917hPg2BQnERLEjH2IUBAYq51p+NcSlY=;
        b=sJxEI5f8cExLDOWMDXoxPpRlNQL4kzreKCEZaJ92Qmo2imZNamqSeaUvoZ5tKEIuV0
         i9QbkeChlr5KtQpUlcO3OJV/3e6CU/hH855E8HwnqBrjP8mlxs7O8d0xuk10sY9JjP13
         NZUSQNg1Trhnss/UEaJcjc/nkolZ9Cf/5SsYia5sSaRbRdQRNdCETcLlvPguvt0pgetn
         rHsCF8l6iJt7ZBMSlkz2keOyHAekAkocE7QmgJfVFeTfmX6FDwz8ThWQGWLgLIcosNt+
         bCHufM0B5DIlpDPIXwDC2DyQF/fQ3wRmiBpH0qF7ngu1g9fy1+qwKbhYKaKRWVK7NZ7j
         KISw==
X-Gm-Message-State: AOJu0YztZkVoKOOaWBszdNtXe6tuAaTf9TpJjLPefoefqZv3/Z7oxgkL
	YFHvkPx4FfrUYT+W0CsDVr/cokH2tReYXypT240Nb2+9a+Lnr79RqlDYWofHs097wuXfov6qPE9
	mXde+eQ+CT7+y2aU4HXch9xbGdZMBD9BNiHThH3r0xgC6AVXG7ug+04d2XjgTbx9WOQ==
X-Gm-Gg: ASbGnct9VAJclm/HnVUf/XKW8X8Lfx1drJkpv14lKSokUiJ/Cyn03iAC/Hq/5pT/oei
	I/PqJTXolKwjVwXkNqsTczZguM8ZQj0tpggvCez3lODmIf9QEOG6KW6gs+Kyd6EKWgWXy6kbfvF
	SypgQoDgqaVpYtxVEMwERzBNpDmmkzkIFBrU6BiGjkRfP0l90KEl8jIPlpKT1MTc2HNacrHrhXF
	09rg0oHHPwFkRjaPGyYdf+fIk+EuR7DcBuxyGGxv+gwCxghcNvo+rJQDoTpahYYxESpfE0YqBp7
	oPIUxKUVvDM/y7U8P8WMjVYVL2vjL17JE455RgfRVFniYvDqCtZTBSrCSBfx1sQ14sg9chKlJez
	xqyD72xPKZwwPW4AIXDGTaa2F
X-Received: by 2002:a17:90b:2dcc:b0:329:d47f:c25b with SMTP id 98e67ed59e1d1-329d47fe8f4mr3404370a91.7.1756854025797;
        Tue, 02 Sep 2025 16:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQYhZGXz4aSi5BuIlQQO1tbdiEjDHqMtjtMg306jjPNJf/8/j1CGcxS6BZzUhy4A2DwcBc5A==
X-Received: by 2002:a17:90b:2dcc:b0:329:d47f:c25b with SMTP id 98e67ed59e1d1-329d47fe8f4mr3404352a91.7.1756854025220;
        Tue, 02 Sep 2025 16:00:25 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32a698ad4c1sm1875866a91.5.2025.09.02.16.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 16:00:24 -0700 (PDT)
From: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Sep 2025 16:00:04 -0700
Subject: [PATCH RFC 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-rfc_split-v1-2-47307a70c061@oss.qualcomm.com>
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
In-Reply-To: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756854022; l=1143;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=tQc6Y5Bsiiea2HywNjxgjTAh2ShMYLKZglVKp1Iwxp8=;
 b=uZrym3CVPNMvmBtZVtgfm4vNtFnQc23iaXz5MtlQ9OmrB1zeCq7etU7b51WO+ZDPYlTkZ3VBP
 wT51ISo8lizBmT5nqROe8RMgHE3Xxp+oX61YoSGelOR2tZLfY0FQgQH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: CbQLEKOHJYDgGEQQMMdkxZtPCuEkklGd
X-Proofpoint-ORIG-GUID: CbQLEKOHJYDgGEQQMMdkxZtPCuEkklGd
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b7770b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3VFMuRvh7oFGMF0ZDtIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXxLBoWDQb9gPE
 sI9VqWTjPuMvKSIoGi54Utj/FjIE7NOtRW5BH09YRArFHPJXFfgfWScLVD8kTJHSjxsgpi2R381
 aV8tz9Aff6OwOrnLc8cEKfUJ7WpUyWjNlVitUx45iNYgYP+f68Z8F/HpA51GrAHPYEf/2+GvmAn
 bJEZelo7yOKOIqQUWT6V34MMQm8wiIV4W4IfQZHfrRapOlrd64FHpxFfArBPneDiX6QQuGigAf1
 0vgq3SJovi43zrfmOIiRHlqCIBBMHHCSdJTYQnbQrleDLhldCgXKDfwcSQF2Psru/VrMwrgLyuD
 YSVMC5vtjgdjAb2iDMwSAxjCsi3poLVIbL5S2cyGN9Bjj9hql7cwajRtbJ/Cts1zuesajpSQ2B8
 euLZUmeo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.

Signed-off-by: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..d3ee7736b74b0f277d3208782e3ac3282eca1e6b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
 		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
 		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
+		case V4L2_PIX_FMT_AV1:		descr = "AV1"; break;
 		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
 		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
 		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;

-- 
2.34.1



Return-Path: <linux-media+bounces-60870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPn6NOoX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:53:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADD4EFF81
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFFDC309677E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B423D5672;
	Thu,  7 May 2026 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cm5cXAyn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j6jHnOaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68673D5670
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194229; cv=none; b=joOYXx0AJErzU4waqVYsbQzS5q7SRFyjBuFdwmd68uXwOsXy+8QBnYbpRGHCblGkBv/GPAt85O4Sd8kuemyne5Ip1c+Z1LBQrdykz5Iaw7fQsOl+Ue6SP+pl+4FyhJb33+Cia5YLcDLFtfUjWvhEwhR5/MyrZJVXUU54/om56QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194229; c=relaxed/simple;
	bh=Mh7PVsHAeBxro5wjXWn2s92lyXis/97vUohYTl63Csk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wyp2ASVjld8ZZESluXto3SJI6qZsRTNLuTjZWP8OnwrHEhfudGeKjSdN4tLhtaiQsHas1eLd9cakW81cIAXme5HX44uPfxAtNq8DEKgBMvRERDSYQJQfSEZp39ZQh+FYVCwoK3J2K4AF4veHneM2fe9atYxVQEVSi0PYdMclG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cm5cXAyn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6jHnOaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Lj5MG1424448
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=; b=cm5cXAynoc4yOlLQ
	Jgq7Sn2/5lfb8qefqI1moOAHcnBVK6py1EVTTTQBE9ZuPE8ue/beKKNxKf79hVer
	d+8PcKd90wkmQj3WTNzlUGRc8iZyDyaNmYzHBZpcLeOcZa9wueyNPcaocMcXN08b
	bOo8l1r8O3pdhi38r0eAQhUoVCeiS9PkSLQXvlOMsG8vh64beufan/GDnrG8nPIc
	CXcQKCCxfDGL3TLfFi1WGdA+y4BA0RklDrpoDvzDAKaau/R2PAG4uduZIxTdp9FW
	R2h+m19auigZT+nl5ixXBMcph2gCg+wAZThbJWDKnJRN0i08+3ryCt3s9FnVXFCD
	uTwIQA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfub98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d25cc8f5bso2528580241.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194226; x=1778799026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=;
        b=j6jHnOaKrmorfm+f9mAo8le7AMYl+hjGCVyNCRuytYyYfU/mD0y0ELN18+YyJNQddz
         gQBXCPkDmVrmgMUsBE2rIHbfD8DGLv9pM39cEqyREeWT7uW7S1DFeQQABlpIO0v/R1Qi
         OWWrNeacCb6Sm5+AJ9UcGxd1zMrefX80qouObUz2EN4vYlBbS3dv9WarQbdjkyRyvodO
         zScYU3rWoqhLmse1S1hnDZ+0yGi7myF4UVXby8BOtwlLRbY0pcxP7J0bgPAgDV3Dj9b5
         Cj/xil7Z4FiWKTrN6Yjbn+QHnRHdwTNdp0U5B9sU8a5bKH1Gmiv4u6Sqc9BZl/QRyGhy
         uzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194226; x=1778799026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkDMdHG4MAKPTHoh78zrZYswwET0RC/m0vlXIvO5Ql8=;
        b=loOslR3h2afis1PJuEi1SrPFd7g1K6WatLKY8F6lqQfZe2AbeE/0kFK4kWjdAddO3v
         QfexmF388Sxf5E5uNEOY8UYnxazNVTI9QgF64QSABWBHAR1jZRCNtgV3rk/TUlelGW3w
         FVAa0Jen6rk6yG5WYBG/tCIAdtgldyONQKhctMuI2LyvXI2KCZEkOcDsJgej8Kvx1yLR
         UYyZSKUyZumbPTuGMhRaV9FyLbxJWUlh9XzVx9rvd+dHlf+26JEvzeG03WFCeHiQyJ56
         6Ejg+KY4DANOh6JUrrhVn0yvCMoiVD7TgjOr12Ze32IMVD/mtxCIQ8rissnIwvbJnDQZ
         OlOA==
X-Gm-Message-State: AOJu0YzwWyeJqwrC8J+JQNQe7js3c4442BBmFq5bK8kumHdsu8AeEmNp
	FaRveXcxmwJLJbeZt9Fm2BztTpGr70rJsTjL2vVUjZpwMyIpPFcMICUJ3+zsBS732Q9VyeJoOXX
	efsyjBfep8rGjM0FNAOFJ25EFFaBBUe5iHw9vP421hkEioycxoQHEiNOh7bQaga/Zqg==
X-Gm-Gg: AeBDiesj08TAuaXFlrpWcZgB7hKeryvKUYJIvjZz9BWGTShSEttfmC/2FwkuUMKPKM2
	+3TZALwjFMdWyVFkAa8Tuhm+giUMKPiJg/tFvO5JEmIK/lo4Z4OQYlOwdSbwqFlDOm/0tuoRlfq
	cZtgkklqkvpD/MSmB6Cu2n499hYA3T7R/qZrSlJFQgxylfzhMvffh2O0May94o+ttyt8q2wQ0jk
	NtyFmX2c1rYclm4VGi2u61IXmlRwS1WyCKqMMRYMKwJDWyGOW/3X2Hw6OZfo2RoPsKcU8qwtf2b
	PfJpmOUAWePcCm0+nKA3eLozVxE2OSSrlIqlsSJcmR4x6A8FEnqpKLPLa4VvGV5GZouuVQVr3J5
	njL2nWgLvSkhS717ZrDiu0IJbmy3amKzP0MicwgJZVl+HD0W9VUEAEa2mzH5Lw5P7gz3lVFrcKs
	wosmnQ/rG3Q5kVauE7OU03BQaFqzI=
X-Received: by 2002:a05:6102:f0f:b0:606:49d:1861 with SMTP id ada2fe7eead31-630f9058f05mr5648711137.27.1778194226272;
        Thu, 07 May 2026 15:50:26 -0700 (PDT)
X-Received: by 2002:a05:6102:f0f:b0:606:49d:1861 with SMTP id ada2fe7eead31-630f9058f05mr5648702137.27.1778194225890;
        Thu, 07 May 2026 15:50:25 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:24 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:22 +0200
Subject: [PATCH v3 07/15] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-7-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fd1732 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX3JYIk3LPw2kt
 6L09aLtwPf+ye9t/dJRFiTJhZcZI42jv7XPDBncjP1zfswbyLAaM2uE7UdSLogRB0QRfKo0mZfx
 tZYm1/D83nNfCpgyRCwlB8tC21jcposFwDAWXD4vROS5ZnAXvqcGWfebNXidwmdLmXPSPVhqRZC
 csa04RwEFhaAsIvwjQi0ux93+DiP27v62Mr1L0ddBa0MVjnexSuk/0KTHdyjMMANhGKK5bf13Cr
 TBW0Zuacox1tFmsvjarxxJkIYCodUfHrvgvez+Ih/gQrnIf39R9mzUtRxunZT+ydTLbkvLUoTI1
 oOI70fSCNjPVy9euUQ2VmaZMkkuP6fjElAT5IQImiaRN/cCQnHFOyLtOc5EzHcZyJJzi09nvvIy
 BHoi+Ypud34A38B+K7eIhXVcaNhZDwnEQ+BNqz4raHEnbscD7XjONBRjYShhE8j29pnpjSLGGxT
 t4IZEsx6FteOMBQwkgg==
X-Proofpoint-GUID: eq8Ih1Cjn8hSovTNbcVAqM93JgQN30-0
X-Proofpoint-ORIG-GUID: eq8Ih1Cjn8hSovTNbcVAqM93JgQN30-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 4CADD4EFF81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60870-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_CAMSS_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
per-frame ISP tuning data such as white balance, color correction and
chroma enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..f861211ebd7aefbcf4096885388069efed27ddc3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1



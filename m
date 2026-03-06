Return-Path: <linux-media+bounces-54813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADYSOmz8qmmcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:10:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C78224957
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8E9C30511BA
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA9B3E8C4F;
	Fri,  6 Mar 2026 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOE98rRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtIeOy9W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FF136C0D6
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812830; cv=none; b=U6eenkGkl86wtSgmAGmmqidD6MczNbcvCS2iHgteuLtnNkv5QjtwKkbqwg/HVfOKB7pAF61HAtFvaNOzTxBPhzH0LIbE0N/EsOjqAPGfphJsvCiKJBVlbqCixB5KeT6R1+zT3kEbV5d/HKy2jA5io9+b2Gu7vfSxQm6jqihVfUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812830; c=relaxed/simple;
	bh=qHw42QzdkbYlWdlV8BZtDYHC/YbceO2kwTKx/pPDr2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fu3l30MAZSfbd2QPWW9AuqW1nT9AWanCjtwksRIydEhVc8DCJ7i45FopJO1pnvj7Z3SujgZKXaznOBQ4utJBDB/cWyM6kiilXnlUdRXqRKc/Xy2a8UrPB/MAoulE78e2Pno3ImRD1mDp5hDLmAmuTojG+JJJ1v1P70twi/nvSZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOE98rRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtIeOy9W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrIdd2577844
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 16:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kqir2XdaR6T
	WAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=; b=OOE98rRK8x/kbMhcFB9gLRxvENn
	JyVokUVLrnPy4095oCCEbsLzi0+Z9bqFuIxsBdGwR6HRFecIOBx9BA+G/NyGemVb
	522JnLFiXGp3oe+1jF2IBy8dEVwg3g38dlX0gtJibP7fuMJrhzu/XgdKJxpymae9
	kKXvk/X7lHfMDcsF7Wx/n0nDrOPv1kpMAqvFpCrJ6Dd++jdBIk17YdWMDr1J2wLK
	wGix24QEdTnKyv4q85W8NIQeZXguz6+UlKxsdmx5ZNygnpP+b9VLCUj5a/bi/aWK
	BtZhBT4WGCeQv++pYnC2wACKqeFNZbtRlAUPNt2yaIL8zJTskRNeIHVCgsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6bt1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 16:00:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5909730085a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812827; x=1773417627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqir2XdaR6TWAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=;
        b=jtIeOy9WKuerBsAgVe/D7PZsIrk2Dqw7bZM0/foJ001b7mtDPYGMz0U/ZXfEGDT0/n
         Qg/yCABGd4RkT6X3XfpTw4SMq72FxPOfrGSVJF8wb4F0HBks7dZPMrWev0URQvhvu24i
         J+LpEYnTRgWE99/IH59YzYy9N+onlp5ncRHOIwhoZXFg2YQU51TBAv7EQtxouLyfY2Nq
         HEcClcHPrF3Hf5h7GEjCwZ+/Y7wupcLMWxPyRJIO01NJNfYHKmP96QVBHqTKFeeGYuXA
         cwWxPOq82i/ra4ptLzP5EAtLcHXtE+TT5xhkmyIQvkdtSZjIcOtfeZJUEvzGOSjAfWqg
         jp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812827; x=1773417627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqir2XdaR6TWAFYABNEF5HxPRzOmeGXDkGpKShWXLjE=;
        b=KxDwJ0mC/sc+0OznN8m3pRYqM3kbfpcKPOXajhsHbWHY0cL/rwQ4T7YttC5FulXYmU
         fY+E8eF8Qt5BBsSO+lZ5GFDrgQG51y5IrU1HMhsEPIjQXgjz7vWa9TT5sQCgrPacEbfJ
         OCnmtJ5MqMKGj1abeJHbn9FxVv9kB7RGnFbNmvda1k3VVcDMy+QzELzfHT5gJn0DEO9o
         fsqGiXdVITrYFbTPIqV0yQ8dUGkt87mnT9L5lrrkQLejZOXQzoUjztpSRbAsqncOEC8k
         VO69dcVQ9GiIGaN2MCd03szho8qASFEg8MPhNfTdSYIruofhuHKljq6QAAgczqLoZm1v
         WNnA==
X-Gm-Message-State: AOJu0YxFFx+h5JmQTVT9uovs8DmRU5Cg0GLRAYWUSXXitu7ABYL1LTDV
	mq6Zte2hOKOGA/UAyGfO9dTMYvpw++4C9p7OLyAppq+KIeotW0UNxb64i/6JYEBKQFnkmzV+UPq
	37zWKFMP/I+el3eOIntkT9Yjk0BDl5Oqf09SgubVZ7bccatDXsc2nWPt8qOm0goZOAw==
X-Gm-Gg: ATEYQzzVQ4G3Xs0IjeKEZpTEW37uOfFd3riv8l8IVr/Za+3OJ2diH9jmvrbygaxy0uR
	BGu/xVGlYiO21KQll4vuvheWgwH3nVJ2QR5eYKXp3KP9kZnaaGT/vkRpDIv9V1uVp2nTxkl5DbZ
	f1is6xnUdOnJZVuGnZYzuSqHYSJUXDr2nk2Nq7baB4MDJLTbbsBmqBDvVbB4wmq2dRtdvCScQtT
	Wdi0h50nDFVJOy3PiWomY342JiliDmjwrb8BakarKN9jpaIeXimco0EpfC65LWSmr5mK14nc8z6
	WUEBDCRyLeL/LBL8JKDPq96HM3f2J64bjuo7iQLczrbt9KBPxec6YrvaTAaeM2x2RmKmQdt07RW
	4ysq2R9bZ0iqriMWFAM9NnsusaZKSo8jX7Az4tDMk8xkA7CFRq4/UPm1ZbsGij235EHlYw8QQB6
	nUhV9nvVRTiBb2OJEDeOzrHIYMyAZc7MQgb20Ji45Vlw==
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr721341485a.43.1772812820695;
        Fri, 06 Mar 2026 08:00:20 -0800 (PST)
X-Received: by 2002:a05:620a:269a:b0:8c6:df6b:93fa with SMTP id af79cd13be357-8cd6352e2a3mr721251285a.43.1772812814706;
        Fri, 06 Mar 2026 08:00:14 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290
Date: Fri,  6 Mar 2026 17:00:06 +0100
Message-Id: <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tyJuACPYzNLp8bPX6LrybBvz5LuKUOyc
X-Proofpoint-ORIG-GUID: tyJuACPYzNLp8bPX6LrybBvz5LuKUOyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfX6WFsmna3A02e
 OrBU1FbgSROnu6uYnE5Im9ZkOMhi3bEO2Vt9yPByo4vhXyNxaTBkbKCT8W98NckMdTmwmxZSxUo
 ngR8WCVF9uO2W6mJhPr2Oj9UoUOx8/LqgiM3+fJdNPrTNp04MtiunsRyt0Da5sB2KY9JD8UCuW4
 XIK9HK0Ebo+YG1AYZv7XuWg8RYW30CxR5EV96Mor2jSMfu9gdefKiqadV6xnUWU9Yzcs2ZgReGC
 5IAeY7fMFOy7TaQpHPhPRb9gmEM8itie0PsxAvxjhlggL9Gjj36BM01oK0LNQOPh5Q8ECQhHz7E
 sOsnE4vAr2qeCVugfpHnoCbBH3/7D+iaPwVZxOS86OP8ucDD083qBnT0zX7s0nMEkYjJ3nJrL76
 0NGwANExA7mlABr/5CD4lbgAfeKB7iiAU9ZBK5NB/B9ZMQKEVYn3fNY0DlpUdVUWqkWcUrc+8If
 PV1LtD52HVisCiScyYw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aafa1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: E5C78224957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54813-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Split the VFE bytes-per-line (BPL) alignment logic into separate
helpers for RDI and PIX paths. RDI is usually aligned on RDI write
engine bus constraint such as 64-bit or 128-bit. But PIX engine
is usually (at least on platform I looked at) based on pixel format.

On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
alignment must be derived from the pixel format. This allows the
pipeline to use camss_format_get_bpl_alignment().

For other platforms, retain the legacy PIX default (16 bytes), until
PIX is properly tested/enabled.

A future improvement would be to remove platform-specific conditionals
from the VFE code and move the alignment requirements into the
per-platform VFE resource data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa4058..c174c7d706e2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static int vfe_bpl_align(struct vfe_device *vfe)
+static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 {
 	int ret = 8;
 
@@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	return ret;
 }
 
+static int vfe_bpl_align_pix(struct vfe_device *vfe)
+{
+	int ret = 16;
+
+	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
+		/* The alignment/bpl depends solely on the pixel format and is
+		 * computed dynamically in camss_format_get_bpl_alignment().
+		 */
+		ret = 0;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2085,11 +2104,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		video_out->bpl_alignment = vfe_bpl_align(vfe);
-		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
-			video_out->bpl_alignment = 16;
+			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
 			video_out->line_based = 1;
+		} else {
+			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
+			video_out->line_based = 0;
 		}
 
 		video_out->nformats = vfe->line[i].nformats;
-- 
2.34.1



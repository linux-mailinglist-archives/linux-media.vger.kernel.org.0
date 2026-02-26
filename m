Return-Path: <linux-media+bounces-53441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PjGL6wNoGnbfQQAu9opvQ
	(envelope-from <linux-media+bounces-53441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:09:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A363C1A328C
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F527300D0D3
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5125E26560B;
	Thu, 26 Feb 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKCMY5Ef";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJgZQiDi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449132522A7
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772096938; cv=none; b=m93FeDn6F1uNy7c6wyYZV8Usy8nRZriSBF0lHLy8AFM/Cm7ffWBjhC9/6Yigjm0H2iT9ViJhZvex0GoQ/lWHiSEqr6JbRKW63LUaWb59YNNROKHWuHartIoeW9//VFueQEwJGgpCEJPbMXcv/zN2eQx93NDIo+T7WTUAvmW3YFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772096938; c=relaxed/simple;
	bh=AsA+gJVaB0n1q/2UCXmz9k9rHtiiqcFu68NT9XiPDko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t8DnYKM1L/Un6eV7Zs2q83JEoIpjLlsjfHjnl5lEPfgBWMgaGKTmmU1SN5vdDZ8mkv0FmTHq0LuI9/+fOa36fZx8rjmZDQWnraeEdUtgqgEWIpsOf9Bu6Od91h6pP9+4vAqZwUiwvwAjeqH2q5duHfN/L9TbsnfuOIVfh7dAs/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gKCMY5Ef; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJgZQiDi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V1sM2617840
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7
	QS42tJTo=; b=gKCMY5EfiDOPRk9Ldab211FLkpsRhTofFC1otIKOFfCpfOPDYhu
	u9C+NT2EefcBhAnokRCpG5YG/3C1Gs5dqpjWYlHaXb/qrtKWMHM0vcm62rO4XTLO
	n71SkorvoTs/dWXzHLJbsxFqIzuGw+z0wK5x1iY0EIEn1l5UulJNkgYlPOewk+q9
	gkmHG/FwGDL66QvtRtWgh0ojb3PY4fBr2aAMgauihMe3nLNGNraZAYIBDNyZEWiF
	5qbYBkpp95zjWPU6czNs2ZWvEhjsx+57f/0Vdx/UrUTrYWBMkpc0YYCGj4dhY/+t
	KUcEX/bYDfOd+FZEjGSoYEPVerC7RUUib9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559jj2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 09:08:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso669940985a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 01:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772096934; x=1772701734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7QS42tJTo=;
        b=gJgZQiDi6GVU073mIiJ7VqIwmryZ7HpGBsTgrX59jzH96PJdLhOK78qjCAxywrWf6L
         uQt8K98htDCmq2AWfn7UWxdXMXrs9JgqiKg0aTSbvxe3x85ZqSYBnwtDn7tiOwA5f0Ux
         721BE5k/AqCiMzUBFvPwtyKRK328NNmlNguw5TxX4BQiA3+WSkmW0ic1rNVOlmovjqkb
         M98iqPQd8kCb1O2O1NsmwrOiWEF8VP0q5EE6K4btSFq1kZXohDMd5vFinPSsbiUHp5jB
         I5Yi1KkxetkjbedPALV2jVSc20SGv3rI118VrYwRr1Vtpu1OKDCDD9EwzbWY4brEUtuB
         Ke2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772096934; x=1772701734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXe/SUX1WenBcaA6Nk5U5ZXTozeuokZ6XY7QS42tJTo=;
        b=HOAtKAy4wUhfZ5WOozKD+vUBSmnaUsFHk/MpzNjZWbLuL24ID14Zl9Xh+TzERidxaG
         jWbh7RdBRhN2UPgiKO9BDbNW2eMmf8oBKBG6WCzfRzrNQzQwFY1SfJ5euhUyWm0lAIXY
         2tiZrhgFfYofnWfSVDSc9X9vv79ND9LtQU0Op8MlLCX1VV114hcM0wwjey2PV85Ysaff
         UynVwho6veT42dj7G2XcvVxUFNZCyQtvIHx3eC3KnCtsZZqcQtMZFT8Fza3Dc8jckpDU
         mVpRQDQWeXN/2DQqPieLL9s8AOw5lFN41GFQm4EzXC77sUwKOpC0EFR9kXq8o9PhzNn3
         tzZA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ99Lg1lKj+eAAit0LCDf3NgRB1joKxTCZqb8NKcTd43R+fF/dcdljG/VPvCeiz93q/IR4X+NlAgNfvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoiDOuD+smlNUNcN/OGBXDqHrGECIlz0FQTxaRx91DQomT3miO
	KP4f8uAiiHX38PnNFBiNfJRcAnx4HjSDdbIctJJrfryNZfbovsEQS/GiF2BWIE00EMyj8HOAB9K
	mC1lXzvBlZHng7g9mrMHfX+iVFQMc0PZsIar1VFJ2G+J1UtJlEHzOEDMr6uP1IMLhY1iSDLakfQ
	==
X-Gm-Gg: ATEYQzzaY+oCLJC1YDP1ykI8GAYuNb34DdkEUPpo8k/j+bHeDGpl0yikpJSzs0DpKoP
	r2A7E6UeSDdUVLLr4JiKkdXrEcQ6xxllerwEz82fZdtXES3o5t3EHZdQjS+6X4KxvN0BwTwU1mq
	8rYGOHkNV4R59SXFMnVzDT+wWFlQcVoV55MFqnrthxVDM2tI2zX/RCqWLwIkp4nee2s3V6FvPI5
	oG/sb2jWM4JAmZvMLw/OX7FLGVUNTkqPTuXP+iUk6iykI0lm8WXgCWpjk1kBf6eX0uCFbdeVHBN
	qLzoJu13pUuaYVBX8TdJGFEg34twBo1uLHXfKi9KXs6dGS12HXYjJHsVvecXUGA4umSia4E62sw
	TPIhSmABn7EAgmbbSkF5YiFbM0TkjxXmKMdZNesaiFy7/R6TE4AsF9ArHx6QS2ohyGE91DMuXg9
	niDL1JdFtXkd4=
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr417493585a.15.1772096934163;
        Thu, 26 Feb 2026 01:08:54 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr417492385a.15.1772096933641;
        Thu, 26 Feb 2026 01:08:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51431sm42419466b.17.2026.02.26.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:08:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] media: qcom: camss: Add debug message to camss-video format check
Date: Thu, 26 Feb 2026 10:08:50 +0100
Message-Id: <20260226090850.828694-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LWtbvI50ROBmcGpQC6fy2cXYlBO1QIGh
X-Proofpoint-GUID: LWtbvI50ROBmcGpQC6fy2cXYlBO1QIGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4MSBTYWx0ZWRfXxap1EruFgHk3
 3PENu6cKnrXxqk/1F129Hdv1VO8SoQgZow69egsBWCoyCmtXZVvw9oBdQbtSU1gnsNvkf1J0D7D
 nPZ5cJrgDPBBTWm7+KbZe4QZxmqkYLQZjW5pjkrzuUwV3fKdeexEJTv2qbs3NRyBmAk6uoWqo+v
 EqaVrE9Szd09WZBtPg3IQBQasdwuIIh9b4DQY1sryblWgtF0L8CtzjOwPBU0r572xG20+l0PdVs
 cGCqYLiky/8eRSiaUMXl1BwlXHx3xGi3VIBvaTgFpsPMlWBDHGWxqyKoyT0YuOVC0d984fvUIbe
 3aPcaH/e6FPJtRLM49cOOHBR4iKE0I0WI8thb4SbGkrenYuF0IqB/euARMvYwmr06mvvKO8YsuQ
 qJ7pSzmQE1J2tFQnZJuhpsDTjiP565fTNf54iFz+zCnMAr5D8FOh8LFuP5yv+TQF6qQlRKn1pp5
 Bz7nszVT2EAy2ez2YNQ==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a00da7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=6k50daf3fveMbYCwvhsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53441-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A363C1A328C
X-Rspamd-Action: no action

Add a debug trace to video_check_format() to log both the subdev-reported
format and the format requested by the video node. This makes it easier
to diagnose mismatches between subdev output and the negotiated V4L2
pixel format, as well as issues related to plane count, resolution, or
field settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0c76bc2cc574..0852eb6f1315 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -218,6 +218,12 @@ static int video_check_format(struct camss_video *video)
 	if (ret < 0)
 		return ret;
 
+	dev_dbg(video->camss->dev,
+		"%s: format is (%ux%u %p4cc/%up field:%u), trying (%ux%u %p4cc/%up field:%u)",
+		 video->vdev.name, sd_pix->width, sd_pix->height, &sd_pix->pixelformat,
+		 sd_pix->num_planes, sd_pix->field, pix->width, pix->height, &pix->pixelformat,
+		 pix->num_planes, pix->field);
+
 	if (pix->pixelformat != sd_pix->pixelformat ||
 	    pix->height != sd_pix->height ||
 	    pix->width != sd_pix->width ||
-- 
2.34.1



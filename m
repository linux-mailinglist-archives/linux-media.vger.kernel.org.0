Return-Path: <linux-media+bounces-53381-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLciCLITn2nWYwQAu9opvQ
	(envelope-from <linux-media+bounces-53381-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:22:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097019984E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 16:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E22003015A6F
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491FC29A9C9;
	Wed, 25 Feb 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdrYxcDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVO25+nH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E623161BF
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032937; cv=none; b=M53UWMhWArAevxggZTbBD7GPRl15kmPjzozBrul3r95DQixIq83At9SNb4BEN2mSHWi6oJmACX1P4ZFDU/iu4N0kjnNi7VrnfihiEQ3UltpBBOx+w0bOnwAWqRFC1+s0uAdUPIcdDcGnLTS/XMHhM/D9TMT7PaDaqIXLo+FDuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032937; c=relaxed/simple;
	bh=VdCPHC+lv/6qpBzYdZ9HT8OY0Utr3VthZpI8xrnEPaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kqCNMY1fB9/LETCtyuIH1oEHOI/ayH5de6qsgLoXUV+qmH9AyX6I9BpI6FSR0bxrKrWxIa/S3oqQEDpnlQjrJgiS63zBc/ciOi4EgHnYCdTLOnomt5AOTTl4ZwpxwlR5SRYji6SafGtZmd5yAlWhwEAZMGOwfzZbnekeXwqEXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdrYxcDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVO25+nH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SqDJ229723
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3
	dwHIQ0JI=; b=SdrYxcDlSjFvLloyfsOpV8NUv4SrbYQi4HRMtD2i8zdkIOSww3H
	7Ll3ZwDF3N+/HXO/ttbpkMjc19jimEPgWsszyDUwJJM90RwkiEH+5qUbGFUYEV+z
	LKsmRrI07z6KAWaU7jm41UGVEchFS3BXOSXi6HYzTwxjVKAYK3Be+AznL8KF97C9
	sixyqR2r5xyQTqxMz/nKxOCL7KqYO4KPKLu/xttv1ixBaEInG85hqDgoKz2nM8Vw
	Ioq9gfAoR5i0HbTlS5sXXRf5ZBP0Ih3F+qNOvM/KBBnFHckDhVKv77/kJxrIyPSs
	EUYJTCvZRLG03OhqbIuF7ndQUYsMd4Mpq6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37upme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:22:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so486105085a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772032935; x=1772637735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3dwHIQ0JI=;
        b=AVO25+nHGGcX2NefdrDrplH6jQ3KMJ4/ctM8pQ9b1eOZalBhOlegeVNOko44kPgG8u
         G5hduB/3dfUDUoaYwV3pCSI4CPt/lwnrDYRJ1J6HM+gnJR4yabFIfX94cO+uAoQkdSzh
         E6zISbNtPh3jQcB2Z/i5mk39CKkwKhdqSYbCwC8ncvxHem6zUnKWhMcGapZzqrdzNEAG
         lfMCPTjQvyzoSMoMmdGxGZojw8YJlPHxkNtRSnHfi8bw4YZdJiQUMT3jSbVl08UG+/SF
         a1g0kAGm8NAHIvvFuSh68Uo9xcYGdE5lUDNnMJa0h0UzlTyaLvi5HzB1qUOlOxiwODfx
         b+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032935; x=1772637735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFviwGLCo5ioexgOtF3xpIXVZXd22kE/lq3dwHIQ0JI=;
        b=Ou5PuVQ497Vusp0dcb8Mqq/y66cBR9L1YnktcewsLqwUGpGqwxZz6wbWt4cgslj/kw
         /ITsX2g6w/ToPNGc136t2ZyhZ+4FdLbAtpITctYPjOoj0xL5XRU0P0mNNSM/tuN0EIlg
         j0Ifd0z2D4FlVjnC8GGPXtVHKiBRfWqg3jKq2Rx8ocq91SPGQgymZYVh1wa9fnTmQFWw
         kc1pcDk0C+qwvD0ijGtlpwLJAVFJFmENmhms03Kl83xUGNqZj8vSiCdovF4Aus5hXKEU
         MSXCud/nt/bd6nVdc6MMNSPAEKCp6ZIsYKXWduwlA8Ucfx8G0LJSNO3779c/FvfNgoON
         Zqkg==
X-Forwarded-Encrypted: i=1; AJvYcCVj1WKJwi1Pb4uD6Vv5OjfUuSkwBQ2WBSyyRs4RH9kCNlT+1B+S4+yZ8u+E9i644Xf8EtmETeRerIpdOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3PnYnsS6Ycm2PCPsNXvR4Zibg2H7YUj6RkzFhkdKV3A2HqQH
	CH47f91NEps5d31fxv6DjQg0AQ6jcLNxioFXJhT34m0cc6CZoKpt4xzTgrVzvXaDthSzJetnh9p
	wZm9cnSqIYxim9zCRWXQzOe9P7fCSIe1ry0mzEs+JGT5OmYi2DJ7jCiCcsaUY8k0lgA17SDISNg
	==
X-Gm-Gg: ATEYQzxKzGj5oJYsYvLB7uoWynCnq/2w6M6qvAAzN/1i7BVyUHWFBQXbG7G2c7fzEDO
	/1EN95mE7+m852ev4cSgFtcmtDjapEIzV4muIt98Ngi+I33AGZ6LbYoNuBJWtcOxOkojUuEdCPy
	WERl8cP58zZ2cIahRzih617e2yoUdqRvXzhHSJb2FLmyVXI2BPvGfMyhVJytXjh70/m1kykY4qr
	6B4CUkX/8+S8BvGsw/kJ7RHXmwEInT05gaDHIA0jSYim2bu7QwPQfmtbUhIIezPDpLmLM8N7ye3
	7nqnZSFobYKhwMo1bJrxAJmhPMsffdUhC/UxxbhAeYTUj5aD7ldrPR619nz1XkzAJyipRSE8/jJ
	lJgfBuRTQKmeXwQ6mEROKJYtgO+bcsBp+SBJ2ejyHZx+Qbm1rYHM+hwBQvwDpOekbROhfZOd8Dd
	01lZffCpIGGEU=
X-Received: by 2002:a05:620a:c4d:b0:8cb:8d0f:6ba7 with SMTP id af79cd13be357-8cbb1fddf90mr487773885a.16.1772032934789;
        Wed, 25 Feb 2026 07:22:14 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:8cb:8d0f:6ba7 with SMTP id af79cd13be357-8cbb1fddf90mr487769185a.16.1772032934179;
        Wed, 25 Feb 2026 07:22:14 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c5de66sm546490466b.10.2026.02.25.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:22:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: Add debug message to camss-video format check
Date: Wed, 25 Feb 2026 16:22:11 +0100
Message-Id: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699f13a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=q9RLfEvHQeQPQIK2xucA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NyBTYWx0ZWRfX0IB/wQA4xaz2
 QVFUZ4mHd/PS6zGgHsUq6XYRaY+I1VoHi+7Z8JtaEtZEeDIZXDwKGMgVLu4lzPBNAi2dzaRYZdU
 IgujMwyZgulR3bnw+JAF7AcipVW0JcInkIlixpUw08wEHGFpY2BW4szM6SXSZbz6cKrjrUT8jHl
 WhJcO8wbociyQS+HHMiMSvY4KWK9UfRhLyTfNTOY3ESC3vS2GZPO90A1O/bZENumr6XZ8WV/WOe
 4iLco93nKb5IApFcM37j7xtxCjfJCOfb51IXQIoHOTDRL5pPAW7K4lrdHOt5kOsnkLiHKGnwjRy
 TFlQyWW7C3J89pkpne+7GjXMc0atsMywuvWdk6fbC8Fu9HLhpWjCs0AG8ncTsiA3YJKprEqbwKn
 tghNagFAGNw3WccSHjFrlihdCCLLMOupbghTxG0/V2BdkqW34Mdo0Tv93g2Aj9n4dqYdaeFpZ/0
 ZQDnQ2DFwe8cVLF40gg==
X-Proofpoint-ORIG-GUID: iX4rPDH34nmn5laBlsixwl9bhYKNyRSS
X-Proofpoint-GUID: iX4rPDH34nmn5laBlsixwl9bhYKNyRSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53381-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8097019984E
X-Rspamd-Action: no action

Add a debug trace to video_check_format() to log both the subdev-reported
format and the format requested by the video node. This makes it easier
to diagnose mismatches between subdev output and the negotiated V4L2
pixel format, as well as issues related to plane count, resolution, or
field settings.

A small helper, print_fourcc(), is introduced to render fourcc codes in
a readable way.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0c76bc2cc574..601d5a43306f 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_video *video,
 				    &video->formats[ret], video->bpl_alignment);
 }
 
+static char *print_fourcc(u32 fmt)
+{
+	static char code[5];
+
+	code[0] = (unsigned char)(fmt & 0xff);
+	code[1] = (unsigned char)((fmt >> 8) & 0xff);
+	code[2] = (unsigned char)((fmt >> 16) & 0xff);
+	code[3] = (unsigned char)((fmt >> 24) & 0xff);
+	code[4] = '\0';
+
+	return code;
+}
+
 /* -----------------------------------------------------------------------------
  * Video queue operations
  */
@@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *video)
 	if (ret < 0)
 		return ret;
 
+	pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s/%up field:%u)",
+		 video->vdev.name, sd_pix->width, sd_pix->height,
+		 print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, sd_pix->field,
+		 pix->width, pix->height, print_fourcc(pix->pixelformat),
+		 pix->num_planes, pix->field);
+
 	if (pix->pixelformat != sd_pix->pixelformat ||
 	    pix->height != sd_pix->height ||
 	    pix->width != sd_pix->width ||
-- 
2.34.1



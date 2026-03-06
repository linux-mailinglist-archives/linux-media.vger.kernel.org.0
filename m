Return-Path: <linux-media+bounces-54811-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDsyIPX6qmmcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54811-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:04:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5B22482D
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8DF130813C0
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9281C3AE1AC;
	Fri,  6 Mar 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7CpuyPV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQ4wrkEx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAD636829E
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812818; cv=none; b=koegMwcbQ5F5ZI5fSISNS7pB4som9q+0mn6lXTvZzUqB/stGJMwgD6ILm2/+OAo8P2X6qOHIbLoDjN62ATEP9ruAh/4YkqsNmeEp9vlu818Evw0X7lGnQfBgcFaOtGWz8PHA4o5joI8VQMz5HKKIt0hYvl05LDbcgNjUa/s8cZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812818; c=relaxed/simple;
	bh=jao7WzPpxARrtkYPwFNOiftYRUIGBhQZLDKatCNwVDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aBPm3X8D6vKjqD50vuDwspaSmS2FtFlcR1uVK7Xp3zsfMeeebnEHJu0CBdE+sY84Vc8zc6Vh7tq0phTypwZaUnYMXh/S8nQGqEmdXf4+wHdOF0SLU7HDbmcmNM7URz39hUFsSyFIy8CVPHBgqjcpyEPsIFlqTWhiiPE7Yo+NU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7CpuyPV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QQ4wrkEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr4Yu3959759
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 16:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OXZ2U0fIgdz
	SVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=; b=l7CpuyPVkEvNlwnKVcStcz4jF0c
	GJ4/Rfp33k6OkjIuLU7Bd2stLKFJ1i9eo/hsNZ5Rbkzc4qVCL5qlhyMHUAU41nY4
	ZLtHze3JU5Q4qBbDK/NmkrspqCdzHIuCti/mHbJA34TodMnNFFDmpWRDHSuSQCYy
	fnbjm9aYvehO/rys0tIgORdlcrlQ/4zK4Yb9A1bqbS2/GXQkBy2gvK25vO3tMl1c
	ZWSFZFv7kJfKohHt1pRZebPsjqLmcEJHv7L88SaYtulra/UN/AnrJSJhualwvE6r
	8dQmXRAkFsxgVakof5eoAVeyxkkCAEwfgEMP8asU6DJILfK7k1NhS5ozgsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u96vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 16:00:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71156fe09so5200935785a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812815; x=1773417615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=QQ4wrkExaIOWrBxxofRhJLdHzQuvKNz1V40yV0r1VEcySxJsou41vhzwOTJe5imv5y
         5U+q03Ypwe4sCp22eE7adUvsuvqv3FTqUM2pOId6+rX/YCBO/X9Tg9Xa+Bgcy4NqbVjN
         5GCzZjAKber6GUW3gf5hymrT1d+06QZbanUUykY0j6xw2xo9RVwoHkcKOXvdqsAc7bP5
         VdQHnIn3XXOAhU5CNNzBLz4JIN9arb4abMKlyunFMT0+xuh3ii8yWjJ/aMyYhDM/W1+A
         O4Cx/9eNndBD2PQumYZJFC8+KmWWYfGq4p+ldywddE0eWAzm8sLnzgBV2jXfRFspF1eD
         hPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812815; x=1773417615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=fsBfRZKWD4SpA6V7LJ9RwZi6TweNjUSVD92cIDmp6iRKffgZb3JUBmPRWYUBmalEjy
         7r510C2hJnOINH6N9SXKrFAl2qlpnrkc4zcIqzMEDZNUYSZ7hMdEHGvDnjzpqZKX88KQ
         1AdY+48AdA2NYzHvhVzncpFqMDYrP6x72lpwO3bLmVd8knqpoidtfuvLTWzgSomTHf37
         SsPBO7uZkfesEpsOMtXPo78UuYVOciaDxNrKpHLYFbWCnF6nmIF2BN9hc87LORwxsRZk
         zvyMx/OlJBjtKfcrQLKxVfgd9Z4lyIKNMs9bbnaFF66efWr30ppa+3AshzesXtMOPIxa
         +vpA==
X-Gm-Message-State: AOJu0Ywn+ZHzbMTYUsOtAEdfnOl1sn5UkYmXjDkwsJvr3d5GN2tsg8Ld
	EtqBViRFxdr2KpAiYSHaKL4kOKTXeFAKFDeJ6KCXhHGmJ7MIXZzVRMxHBUd49ACOWgPN6B3//wQ
	uciK+SS96R4ADcNuUfmQAprAfnpnxlYmZF1gt6zbWP1NavG7yqxmxXxDCyR7kxAcWhQ==
X-Gm-Gg: ATEYQzz/mh7Q8WHuNfCIul2lm1jixG9Ul1gXtfnae/ilhj79qsPvmfXba8RyWCV93ti
	E7bn2KVTGLhnSqn8UqAmotxpf1xGStiFoAt7F6MsvLxPgfNRFGzfPLjThmEd3VhRtP2Eng8Ue1O
	DiR0aMENvX7PeYs81jvOzTESSiaX8W+PKCu/WFBdbbAwMZvTBG49J/qi+6dVdSIAykRWhdHuKac
	9BGGJOVPOtSoHVC2hz7iC2c/Nl3AeCtev8n8Ky82rxh0+35UK/xpfQH3MduZT1zef0H72XHis1D
	Tnax1tHv4qqC3Q972twVP3rt6fGHGuE/aZnK3QY/vPI4lupuLjz3IVJufWOtWgE61kIg+KzKiPG
	7y65/Ms0kAyZrvrCEzwUtueRoDmtGgzVCaSI/8/ixnke0xWAUlbGUzClldW1xQfXj49OaD4JLkU
	cE7tAeyS1sBfI/xqoGJtr/FzKMygc9lnPRn+jLoCVJMg==
X-Received: by 2002:a05:620a:1991:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd6d54ce7fmr343240085a.81.1772812814287;
        Fri, 06 Mar 2026 08:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8cb:6b4:7007 with SMTP id af79cd13be357-8cd6d54ce7fmr343222285a.81.1772812813319;
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:12 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 2/3] media: camss: Use proper BPL alignment helper and non-power-of-two rounding
Date: Fri,  6 Mar 2026 17:00:05 +0100
Message-Id: <20260306160006.1513177-3-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfX5WPYnBMm5YI1
 KZgrKsLDvbCIA/Fi5LbVlXmC2PjtLKzvNuZU5KWCYcp/XY1oRUWhJw/3TWWccMXPZ7Tt15kU1vr
 Y5Elw+R+4V1yjyUKP3cBv6JbH/T06DDPxAbtQkaGgGAdGeHZB3X9rlwf528mILMNvzflt3i0MY+
 SEMWcAE0wV8YHIBupNB84xSHBrvzpw3W8HoWEBQefrmlx/UU6WIemDjTuxAlKQTW5mIhQQTp1Xb
 1GtlWNW7gV6Rng3KXKTwiTNJ3ARWyOEIDLsgVm20bmJmQqwKAM+vYRMGkrbnSbmbZJnyg4IvAzE
 7BnjQluvn8kzgAIbuMekzftG+p691qyyeORfgCGY5YcJ1XXtFVEUE9NcuLMnHuf5SvWNpIOfJLK
 k8yFR9n+WMLXDES5oiMb3DcYbOS2Q8WxeXg5CVdqmxqU8/9+6+lnqAV9PMDuI3Zi9nysOrR9tMN
 cesE4ig/LlQb8xi/ERw==
X-Proofpoint-ORIG-GUID: _7FkLxLi0VBpeNm58RVSJ8DYzuDjmYcq
X-Proofpoint-GUID: _7FkLxLi0VBpeNm58RVSJ8DYzuDjmYcq
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aafa0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zUK7vVYnaECQvLc2T7MA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: EAC5B22482D
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
	TAGGED_FROM(0.00)[bounces-54811-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.985];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Bytes-per-line (BPL) alignment in CAMSS currently uses ALIGN(), which
only works correctly for power-of-two values. Some RAW Bayer packing
formats (e.g. RAW10/12/14) require non-power-of-two alignment such as
3, 5, or 7-byte multiples, so ALIGN() produces incorrect results.

Introduce the use of roundup() with the per-format alignment returned by
camss_format_get_bpl_alignment() when no hardware alignment is enforced
(video->bpl_alignment).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f52d8e84f970..0852eb6f1315 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -47,6 +47,9 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
 	unsigned int i;
 	u32 bytesperline;
 
+	if (!alignment)
+		alignment = camss_format_get_bpl_alignment(f);
+
 	memset(pix, 0, sizeof(*pix));
 	v4l2_fill_pix_format_mplane(pix, mbus);
 	pix->pixelformat = f->pixelformat;
@@ -54,7 +57,7 @@ static int video_mbus_to_pix_mp(const struct v4l2_mbus_framefmt *mbus,
 	for (i = 0; i < pix->num_planes; i++) {
 		bytesperline = pix->width / f->hsub[i].numerator *
 			f->hsub[i].denominator * f->bpp[i] / 8;
-		bytesperline = ALIGN(bytesperline, alignment);
+		bytesperline = roundup(bytesperline, alignment);
 		pix->plane_fmt[i].bytesperline = bytesperline;
 		pix->plane_fmt[i].sizeimage = pix->height /
 				f->vsub[i].numerator * f->vsub[i].denominator *
@@ -459,6 +462,7 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 
 static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 {
+	unsigned int alignment = video->bpl_alignment;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct camss_format_info *fi;
 	struct v4l2_plane_pix_format *p;
@@ -491,6 +495,9 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	width = pix_mp->width;
 	height = pix_mp->height;
 
+	if (!alignment)
+		alignment = camss_format_get_bpl_alignment(fi);
+
 	memset(pix_mp, 0, sizeof(*pix_mp));
 
 	pix_mp->pixelformat = fi->pixelformat;
@@ -500,7 +507,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 	for (i = 0; i < pix_mp->num_planes; i++) {
 		bpl = pix_mp->width / fi->hsub[i].numerator *
 			fi->hsub[i].denominator * fi->bpp[i] / 8;
-		bpl = ALIGN(bpl, video->bpl_alignment);
+		bpl = roundup(bpl, alignment);
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 		pix_mp->plane_fmt[i].sizeimage = pix_mp->height /
 			fi->vsub[i].numerator * fi->vsub[i].denominator * bpl;
@@ -525,7 +532,7 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 			lines = p->sizeimage / p->bytesperline;
 
 			if (p->bytesperline < bytesperline[i])
-				p->bytesperline = ALIGN(bytesperline[i], 8);
+				p->bytesperline = roundup(bytesperline[i], alignment);
 
 			if (p->sizeimage < p->bytesperline * lines)
 				p->sizeimage = p->bytesperline * lines;
-- 
2.34.1



Return-Path: <linux-media+bounces-55774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNV2KvZqtGn9ngAAu9opvQ
	(envelope-from <linux-media+bounces-55774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:52:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8D289753
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B1F93031F1F
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C77B31B83B;
	Fri, 13 Mar 2026 19:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z7UB5yz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DC43NTm+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584E316199
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431525; cv=none; b=M2AYOp9lkyFe8zlIM8ZEMTR3qunmF1miG+Clpxh1LP2ASk+6ghb7WoxEyv+VWfy/Zr3uuALzB+qk847d/D5ZC9CcXqdIAv94FRqe2/6L2tWd3bYfD04bAI4Rxn5xPz48CEfQ6FSwF1mkxqmlB/Kn4bqVLQnLCREIOqwylCPlEBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431525; c=relaxed/simple;
	bh=jao7WzPpxARrtkYPwFNOiftYRUIGBhQZLDKatCNwVDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C0N6+NYHpYetZBSIAEts77bpi4fBnUk+t82+hGAjDeHt0AfxY7bWBRt9JozlmZWj0ZOXaEWBE0IUb1ajkHoLaiiGuCg8rHckbxJ7ASHL0aziw4Jv0Zs+U64HOfr8vluXuYkovQ3L1pis8Dxg3kAg/JevT8WIpx0L9G++aVGRgvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z7UB5yz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DC43NTm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DHY3O91499474
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OXZ2U0fIgdz
	SVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=; b=Z7UB5yz0VwrpEHlu93l+MOk/46l
	70RKYY9Iw4Apm+gi0+0MTX6zMsRcHLX0SLOkHYNFM3LOfGlMv/yPVYtqKk5Q1dsn
	t5bVly+5klLIUFhZUzMZXakLWDR0V7AsvfKUGqqV4qr8qpSSHTJ1rUA5Z0zgEADd
	lXYiWAWB7ffcn+0GRG+43exYazp25l5tENyG6Q8fhyP7K6Leoa0iSHTwD9ABiU9o
	vNhENjqMqc3UUwMBDAF5BK8orSGBtiYaNjXQysctaF25Ge60Sj3HcMqtSw7W+v7j
	WvC+dgytI6nlmFkYdhz73/SapbsFRPbV/EjdlBIgTYD93W1OQsDPCintNPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hj54s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so2418556785a.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431520; x=1774036320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=DC43NTm+3zoAlAgSByq/KoEcCIskG9kGOPpMBhEp2788tkeIDC75QHqrDJlZGxMAt+
         T7+RRa0awkNox8Eu0RpAPAtBBCbRv8KuOcv/jYNTIaMFUEO2wDtELRrQjd77l/PBnhBs
         Ywe72c99nlpC5M2aaAeivNibPTx/qZ9aMVbYU8EGKv9cVtgv2xnhr9jWwY6bAJhhwiUv
         Bs1Hafj/VG4VHTmtBf9I/cw0+dMsn+jY34sIcZbp17WZR81h8klxIFdakiuidJa6V33z
         uFmQEeBy93gCDXz8ZZu4IXQG3cxIEkztsGdJtXiK9NqsDcj/0/+53QddI486FsFL3xzC
         rx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431520; x=1774036320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXZ2U0fIgdzSVdIibkw3solxyN7tL4IAp1Y1Fyl0gi8=;
        b=qKk3ZVgsN9lMJi50TujwwMkkn7hySocbxSqcaN0kIOD96c1+XHUb/jvvjmV6qDOJEx
         fyPnuc2us7zlWOmRFpToIVK2Afe5v1G9V1PRGnG8hkBZ0xnEXEvcEpuNg+kN/EBBwWQ8
         SKP+BBCsSJmXS3Iktcsxi5FN+S53JPUpDk1gzQc4ONbWISGtUZGx21dS2QTCireFA+mJ
         Ro7VAFzIUsIcJ9l6dRzPHMzw5lzVzG4wCZZYskdPMP/TTHsHQITPCWLFT0XlReGuvCYN
         qDy8aWeMrYYH7jJZPx3XSuomqx79p1rF9D/FhhptmuO4qpL3sNA5ueUXEVjIse3u5Mfi
         8BOA==
X-Gm-Message-State: AOJu0YwkvYrpbJQQcST94Rv8MGZ2cxeXeFowQXQGkeOI4mfTT0uP1j/r
	Cs+8N8rtiUi7U7iKZziEtDCflxnk8StTtGoqZKJG+W0wvRCdcsmAy3jaPUR1skzKiy8QJbTDLpS
	AAcxdQlbn+wR1IWppM8wUISeBbAaYWjItcjLAfe4Zn5kiwa+rWABn6kCo58+41bYyMw==
X-Gm-Gg: ATEYQzzrZlunS7n5vFpGpd6DgG1tQWV2PAtRPJTLejfUyVN0ccXq6EUMIok6GuxiN1z
	6JCdoobnOZP6m+EOGCP2JgC+o3es4etqqkOtTL80KEf4/q/SMrQsfEKPeAKzYVy8Pi/eukYTfvm
	9nRm7kb9Nf1cXTpfHq2pR28MsAPisuZpja6yf2h+LOqPiwj3oxMmi92BO1EZn/wOcqnHSVzSBQ9
	Np0SndKMhWNunTtznqHbUo9gHutM4YlVx0PdKChbEOcPn7DJgl7jBq+ncn+AmL27Pke0ddajbjc
	pds6NYUhZu+rz8YVfbFdqqCRLmG8urG/6pwDglskwCsYAF9Z6Uu8NLt7gXbPxlwnH127JPU/cpQ
	Yd63/jvYeID/crnV0CdwCP6ArlrdBuwPicjxV0/06zcuw8CUbscO6OOlkKwmQTxG6+crxjbjo7t
	zKGgeIDV3+Geqt
X-Received: by 2002:a05:620a:1986:b0:8cd:937f:1402 with SMTP id af79cd13be357-8cdaa7b6238mr1035233985a.13.1773431519690;
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:8cd:937f:1402 with SMTP id af79cd13be357-8cdaa7b6238mr1035231985a.13.1773431519269;
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 2/3] media: qcom: camss: Use proper BPL alignment helper and non-power-of-two rounding
Date: Fri, 13 Mar 2026 20:51:51 +0100
Message-Id: <20260313195152.275196-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b46ae0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=zUK7vVYnaECQvLc2T7MA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: O7_a0tJdzRDATb2eFzz2qJq7ugs9anJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfX2IvDJrgyqkPh
 w/mtzgMUG2NuvzlAT7OcbDE1x5OROVSc9h4HEfPfJIubw/ku5FEEKib3QXCqfTQgY4rAQ6MN9am
 Ynkwb+kt36J9B+HkRXWavATZrKC5Uzi+0ITrazrNkufTaeYMwVV4Wtlwci8fNDel8AqtO0vtby+
 RT48DPaM6ofc+rH8hEB2aYIlCs8PTXe8BjuQOW1UrSUdOMdGZ2oEHmniyG1/XpXc3MKz7fdVw9t
 2Ifu8Xz5D4hfQsFqSnf/fD8LibXfegiZCmvahvFF3fxKdYYZbImFfjBcQNvD4tEGEdb4UfCZ3sq
 Uh9gOuuoyWXG4j84Wm6YjXfXKG78hG/aAUK507sNOvti4/0qTiKa/nlrWXhXQ6cCReEMWJrRbhk
 dm+YhN3Gr+pvd2SixEbJrPXD4uoTIHuzw35A7dlX+8JRTJ8hqcP6SacYZQZpTrNmx74QPRN3ePt
 rjc0je+LxclWpkzyciA==
X-Proofpoint-GUID: O7_a0tJdzRDATb2eFzz2qJq7ugs9anJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55774-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62E8D289753
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



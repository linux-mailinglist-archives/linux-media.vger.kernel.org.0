Return-Path: <linux-media+bounces-65067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CzYMAfDeMWrzrAUAu9opvQ
	(envelope-from <linux-media+bounces-65067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AC695C08
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R7sgntdd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qr1x7VVS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65067-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65067-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3484303ADCE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 23:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B139481FBA;
	Tue, 16 Jun 2026 23:40:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C68E481A89
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653211; cv=none; b=GXZuJxgFbziNfDJuJdov9NXaXQiu45Nw5/tIPRxOuMeMfvwBlt6ob6+LffQw/Z1o7qrB/8y0MliPBZSDtrMBV341MhCVVz8JV5o7vo4D4RTZ9pgHJJCabvsECruuccDLPEZMoyjll8qUKMTcdJJcTdfipDhQQd1j7TzTZl8IK30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653211; c=relaxed/simple;
	bh=s2axybC9gZJV6DhelFvJqIsgDslOKwc4D1G669PivyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSVyPgXD3xgfML0k6piwI8KtDlISMLCNbRqLXa5cCC8gxcAt8sbPO/n1S0HnacOPv0JM6kFDqzH5KFBRrruZ1CKB94HKZ2FKSdrvXahGgZ+KWSZydqABbTVGCKjBkoJpnOA27Cu4TuRLIF0i2ZetVM0lixZn0RqMooo8Itzj6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7sgntdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qr1x7VVS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTagd249116
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=; b=R7sgntddRyQ36YY5
	1oVYBMgfYIr0+mBiTT9S3Cz1fQ5G6xRPGn+pAV6SLiOA8PCSvqJWOz5ibYpk4Hdm
	Gbi6xJFhvyOtHC52P6uz20YkwK40dfOqWc77447Qi0iQmc2s14F1UJu1ZChsrbN7
	4a+rcgF1YsNE6FK9/Ktae+49OicHpDoWJV4nRZEkypXMS6zeHBAaYDi1gTWRg5PD
	vUpvj4vgCG0LPUBuBCh/BgtggtWUx5+T0qQ+1nNlGsEDuxp77ijY3RQVPd8Mk/Lj
	NWozHyw6phuYMn9HtIdXTEqXIhlbsGuD2q+++b4ER5NJCMpzMGTYXUuQ3/mH1qzD
	MN3bMg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet0c9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bd2951238so12396eec.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653209; x=1782258009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=;
        b=Qr1x7VVSxqniEe4ClCug10doI0Pxpae4KCF2SLpJI5jOY+Yh/8Oc662EsGg7vWK7BB
         NJRlIpfgmU0iy2gP/w8mVTm2Gmi0amHtxOKEnAT7ywRurRXs+ueqN5eZDRQhwVtSV/MW
         jYclcZqntFuYERGi5PLeee5qo7SIvcc0G78tmx4UX8OjPu9BiRXI5v/hDnjFskuh9P+5
         L5joE1p1+gyG5tEp9gb/01uNpA8hpdsnMsgQbQDo6DaDQbzcZyZKOS+D+z92+8i7HCuA
         VosiOC03MwyKySPlF8+Ca98dM2hs3QM96FbafYmV2VeEeQC+8r74QJzBm22wJGmiiX5S
         3XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653209; x=1782258009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Tmy1cIYxXjpzHBntLzbSuQARaXb8dG+6b7KwUXzoV0=;
        b=Np3K4gS+gR82W70oYqzEYXuIFs84ZNWae9peqVHBjNz/R4Zx8o6AtRbCScR+8+rGyG
         kZFxOTeP/dvB+L0hxBDqJrt2pDuucnlP8MMc2X0hXEcJUnL48JKf/6fzqIUF4oy4bBkQ
         jXp1kcDIDstLIJoA/qU+RTPvsBdt28/l4FeZrwHXFDG4Y5FYvYyPh+hkErY2f/iyKnDq
         9OZeBIkSSWOtfNQ8bKYY0XwQHYfopBZjnqmlha2lnZwCqwYSmCLv21ZPKv02U1CRTDyE
         p88W9wREuNluexWTgqnoR2XeIyg3N5gz8KVNCSSG/l1PcQmAq47MIh9mrwGxbxkHnIJT
         dXjg==
X-Gm-Message-State: AOJu0YzSKo/jvksF/QLGqgLgX4TQD5rapIvvWkdv3bukuxn8EMlQRo48
	QRcHt6l/oQzf7Nj394xDzN2p72wToR/Z2bUcuGnwF8fPhMXMIVCQEzH6UQv/AX4JFvkwJbgDwnL
	ygMz0iMErPpMcPenTEE4FARB4nWTgEy1EI2NXrW5VWiBDw5dUzlIOoMeZen7L1q4TGw==
X-Gm-Gg: AfdE7clhChWLdXLtMdB9uKblkxh9hXK56ZzbuGVH8NLgrC4VTU/MkwDc9hHTvVh6ZHX
	V7OrCd3VnuHmwGm5CHPmqILdmtYe3NnAPAqnv0yLyUTubgncJEhtVVF/vmRW5gpoQ3LfWnDdRjz
	QfSUkaiBUfm0m8vmcQEF947ThwwL9nQRaJ5k9b0mPYRubx3rlyG44qLy0j3EmbOz71muhldD7To
	HIQLw64fNv1Yu827gs0bTXxUuHuTsZ1YS/1FZuJa0SRPCbja6N/ghg+OmUepwFTPVRW9+NbxLUV
	1jEINwTaZREoWIi7fn+ElsQFy+1/Za0WJuUbe3cfaKj/qS783OLowg9xL4w/HZSW65y0Uc6SyRk
	OEWE9W9DE2nFHof6mYFnVeHUIGINOCnLbkTo2uPwBc3+og9yQPXp0s2m9T4GzgYRBBOBfMz4aVh
	Beoag5sw==
X-Received: by 2002:a05:7300:2153:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30bc9cb8b04mr388062eec.1.1781653208899;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
X-Received: by 2002:a05:7300:2153:b0:2d5:9438:2a02 with SMTP id 5a478bee46e88-30bc9cb8b04mr388058eec.1.1781653208386;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:40:04 -0700
Subject: [PATCH 2/3] media: v4l2-core: Add support for video encoder ROI
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enc_roi_enable-v1-2-fefcc4e76f33@oss.qualcomm.com>
References: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
In-Reply-To: <20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4874;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=s2axybC9gZJV6DhelFvJqIsgDslOKwc4D1G669PivyQ=;
 b=5e7ji4nw/cmeEZBzzL43KzRs3bfG/FnCF0j/D7yVYPIfhaJFhwtPn1LjC0TzyQUicA/YJGbNE
 yNMlZ3kDSdEAH9/P7yb8T7b0t2TvyJ8KEwRwEe2l0lnB+bW5onTEavP
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: yPFja_l1vWONPnSQVy5MUtZ6mrFPmSoG
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a31ded9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1VXWyIoLJVhIH0d9pWEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: yPFja_l1vWONPnSQVy5MUtZ6mrFPmSoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX/M8rb3Gava87
 7lUbCpSSCkUdRufaHyeHrVzmuezPq0mZ1tS/2n5Ck4CsU53TWBtU+b1yWdyRH6TRuGdiQYbmJEk
 BbM0knuP8FEARjqbmjGniWdVay+hq7Jd1cb79N8yP5s9NMMWBOwCIIg/GYp2VVHj7aUmhjMXbOj
 YS45LphkChD66oVHK/bU83jwWC3+IaIgzf+i/wCQLwwVOQ8hxQwbTG3cZsvkvwG0viFwCnX0odx
 sB2z0863D1IfnIv24tIjuIuuyxF+j8VTOGKvbd69hH5As2rWt3rRAKT5lFdJLqwcOqq+e8xY9e9
 +t8kbHENb+T8Pn798o6sr86GU8SWkbZnkTOwHiQQIZByYN2VTVqjs8eX2IXYOzv1GE6ZNQdBZfR
 ENvpYQuGr7aCByTVYKG5g2DUXCck2iowvC32Nx3Z2sWC/ToJp4Tl+l1JzE15dp8KmVn7zAA6SAU
 H7xEBnO9gUMJX5v25sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfXyuz0iGs0NTHJ
 ltr25HarokXwJ58r/amTMHdgMxp6uORnRhjRtT7ICJxKh9ZQ1RguuMOLgWUabA2/m/yVW8CguD0
 DQ+6DbssbCLlN4YJih5DH2D8blrKrx0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606160239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65067-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 675AC695C08

Add necessary support for controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 21 +++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d86010bf0cf8f8fbf2dc343883d6bdae0..ec7e49407603b34d3b7eed40cc6fde001b0b10d0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -287,6 +287,14 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (value) {
+			for (i = from_idx; i < tot_elems; i++)
+				ptr.p_s8[i] = value;
+		} else {
+			memset(ptr.p_s8 + from_idx, 0, elems * sizeof(s8));
+		}
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -367,6 +375,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1365,6 +1376,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1403,7 +1416,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
-
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], s8, ctrl);
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
 		return 0;
@@ -1556,6 +1570,7 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 		return;
 	if (ctrl->is_dyn_array)
 		ctrl->new_elems = ctrl->elems;
+
 	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
 }
 
@@ -1998,6 +2013,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
@@ -2215,7 +2233,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
 		void *ptr = ctrl->p_def.p;
-
 		if (p_min.p_const) {
 			ptr += elem_size;
 			ctrl->p_min.p = ptr;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;

-- 
2.34.1



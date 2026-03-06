Return-Path: <linux-media+bounces-54812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELK2BP36qmmcZAEAu9opvQ
	(envelope-from <linux-media+bounces-54812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:04:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC69224836
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 17:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F7903084891
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 16:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3643C36829E;
	Fri,  6 Mar 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oksn7Qm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGMnazmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EA3ECBE3
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812819; cv=none; b=LDnRyap9C15Ex2ei+hjKrXYrLBjiuU1u7dyvln8EUy0khds8Eofjiyxcm0+6I0ZnOkAeiLwX6Wg4pYS8bVbAwHS990yYuxaBud58tdGJ5UXmq8O+eMwiy8Q5GbdCtIl3bZgP8nhqkHSQRb+sTQQKQPgDIyfDoSveAzyJQwxAyBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812819; c=relaxed/simple;
	bh=if4eaLzLPgPSjLbsM4bnpYncKYVm83evR7YeMoNXPFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W4EhKYfhXagriWK/jaDWFcyQhJxv7LaJX2lK84KsoIFW3jaUjXFxBTcPJlVmQEjcfQd01E90KWVrCCM7CG1zoeCRL8l5c9hHwd1RoSjv9NnNeZEjCRoCh61zOF6bV5MixT7Y2HqPkC8yb/RS1Jd9rhegJLI/+cPuYWd41CltBX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oksn7Qm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGMnazmo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrQo33960172
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 16:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qvPNFU2tjsk
	R6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=; b=oksn7Qm6J+h11HxqXPd0rJqHwAt
	io6S57c1PYQCUQSdTNJZSk9JviDP2jA1A4K69UEX2mmMajrHqkfQd5MkoxLazbdU
	jInz569hO5SUAvlySRR4NYHFbUyZzHgVdxD5if1I5XLitx6pQCs+VTM1EBVCOY1k
	h958AQi8QtSDy8hnleJqghNRvQBP81zvvF+qIl34uOI2lRZU2FC3XPvj/ti5b2it
	Nv9iruoWSbndL9g04NBGRM8RvhmPKMdOMR1nOFO+AtHGoyvuvHdggJqGwutkC11/
	gQP4FOqMJVcl1K7kI2m+K6EWinJJXh3f8FCVy+hP9Ji9o3+VuyM2t7i/ryQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u96vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 16:00:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so1233111485a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812816; x=1773417616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvPNFU2tjskR6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=;
        b=aGMnazmot1uELSsj/bI0XLJf0x1lO/rCEA7wvQn9Vjkqfmdt+a181F4/lNYzYIO+0G
         4kWmIltfOGcbR0kWGn1DV4Um4eWoXy0xWwfvxF3aSKJjPsz8SI+olUtjS0KvPandwJ7J
         zOuAu9GjfMUJz0qWdwz5MQw+/yuQMgjfx5e50mr20MQgptWApYA/hr97oUdLIMFXpdqR
         ZvrUo52Em++3+1FkS/XIflzo4z2YD08u+JbGRfIPHkOUWUwZKwOtv/a/q1MzA+Tot4zk
         lCA1vCzVjOtHe/CbD8zU2VM5hnzi+djX3TYbWimiQRQ4X9Po9XTLJ1ey5RqkTyKIg5I/
         MNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812816; x=1773417616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvPNFU2tjskR6IdlqRpGfMUHzJ76OegAIKA/3dzxcvg=;
        b=vbkRgaBv8wTWrtLzBfkmEECYObVSJy6IFwBhJK3MvwMOX9XSb/BttR4o9c47fkTyTL
         TVc92xoWTifBMb0pOPX9nNQGFu4of9Uv27EzGGeFzsXSazTgpiz8A18vrAKwtbWlHQDp
         bC4pTJQ9Izl0TUis41R8QKq7Io2Wznok4oMsZ5rO1st4Pm7YZwNFhiIPA8S50L+0hW83
         hDkWH9DrrcJr2/SuaHksI+TulWINeyEMpjCizxCkSYlz6uVEVKqe64BUOY1ATtLus0dE
         2l9x9eYHGcq/r7SMgLrqcmiUlkjPGyphTlK5ubNCqOZYBjCq7eaFlNIS8GAC4FDk9DyT
         rFQg==
X-Gm-Message-State: AOJu0YxqX+GRK3Di1p8Td0Vdp7iTm7E01XjtZNPjIyQwczZRHg0zCPWq
	zlGkMdDCUdy3PNTPZIsyxULUXEqGIBIpHWtHAOwok6lqjbB1EN6ZHbkThWM9hVZQE2U02DraG25
	NIEA1IEJ/ZfwrA0SvlkR0ggrzl4mdk1nLbVlhHLpmbwhb5Z8/aFiUpeenqhq6/OCogg==
X-Gm-Gg: ATEYQzx4WNFzOI0gi1O94+3inRoK7CyDSI1kmC3hiqH4kjh/jndMDjvVyf6EZiUdHMA
	eOyqbiURaXkjS2ViAqJhyVPPzLeg58PCDCruFDBZTjHwnyzBHhBU/WziX3b4MU/F4ktEaivW2Iv
	s3btXg/CCsa46zm6UpdjCnboiDvZyFOM83oSOPB2Ik5NLrY4POCh1JHp8CNKBvk17g7TJ0XY0E/
	TVUrb0AriTuDosuwUiWZeUHVcpD4dCeaHj9iaCO8oOlbgXO1UpzoJLjKMIysmaBcVkd40uO0eI6
	GQMX0wxi2FZZ9WvPmK18x4rkdIaR1BjB++HxF053Qs1iwC/U5g0+lPAEcN4VaVHsHn8AroY/hxg
	L3/+PdMmTW+9b7ztek6bjStZwxZPuM3kSeS4vOwMzu8/ITYYg+JmfURAjJJToNH+KyMCXPA5wsp
	kFQ38lIYKYKfsPc9WQ1n7+tSfpTgyx+1+tvKYG1MNFUA==
X-Received: by 2002:a05:620a:31a0:b0:8c6:aeff:4002 with SMTP id af79cd13be357-8cd6d4a4e6amr321230685a.81.1772812813493;
        Fri, 06 Mar 2026 08:00:13 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:8c6:aeff:4002 with SMTP id af79cd13be357-8cd6d4a4e6amr321208185a.81.1772812812013;
        Fri, 06 Mar 2026 08:00:12 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4695983f8f.14.2026.03.06.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:00:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
Date: Fri,  6 Mar 2026 17:00:04 +0100
Message-Id: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0OCBTYWx0ZWRfX06cXvCTfrs3k
 37S/KMdzbavUElU4p4ZnCFkITplyLguhAtS3gRo9MLyTVQe0fl7DECdyOyEYkeECRsUohszFOgf
 IGmNWB818FssymWz5GTYzK/a6KmQtrMMDha2qOqHjZQyOGsMGIoqljmBCK6EvYK9/qZsFORA4Kp
 KEI1fUa4cYhzBfNRItccgANL46IqL40QWXCXKnJ536eSv3GNl+0KZQVGjnksd1pclQfyhvhlN3E
 K2rIuu2NyAp2I1Yb9asRcVU3YbdRoTl8TAqTo5LZt5C3JNDtYQUzPDzfEJA6KQ/9JukXy9chRSq
 lITVqqzHbzv4qA+pD2UVDVBpZBD5Bve9TSWdsc8Bn4HF1blRhKag5G0dO93ovaL8ZTapNrI8oe3
 zuVQ69slJ+d70ZZT0E/1p09Qd2FZb+kyvpW/DMm4Xpgow0fNO6NwLYY2CheCa4O6pIC9ID8W2q1
 Mo5OhLJ9ux086jZMJsA==
X-Proofpoint-ORIG-GUID: Xq6ZSaWntn9N4EbeXBEYhPzX2wtMiI2a
X-Proofpoint-GUID: Xq6ZSaWntn9N4EbeXBEYhPzX2wtMiI2a
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69aafa11 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ksOl0FbaWB9S7YhX058A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060148
X-Rspamd-Queue-Id: BBC69224836
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
	TAGGED_FROM(0.00)[bounces-54812-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add camss_format_get_bpl_alignment(), a helper that returns the
bytes-per-line (BPL) alignment requirement for a given CAMSS format.

Different RAW Bayer packing schemes impose different BPL alignment
constraints (e.g. RAW10 requires multiples of 5 bytes, RAW12 multiples of
3 bytes, RAW14 multiples of 7 bytes, etc.). Centralizing this logic
makes the alignment rules explicit and avoids duplicating them across
the pipeline.

This will allow PIX paths and buffer preparation code to correctly
round up BPL values to hardware-required boundaries.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-format.c  | 28 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-format.h  |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-format.c b/drivers/media/platform/qcom/camss/camss-format.c
index 4a3d5549615c..2cd0f3a0bfac 100644
--- a/drivers/media/platform/qcom/camss/camss-format.c
+++ b/drivers/media/platform/qcom/camss/camss-format.c
@@ -33,6 +33,34 @@ u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nf
 	return formats[0].mbus_bpp;
 }
 
+
+/*
+ * camss_format_get_bpl_alignment - Retrieve required BPL alignment for a given format.
+ * @format: a pointer to the format
+ *
+ * Return the required alignment, in bytes.
+ */
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *format)
+{
+	switch (format->mbus_bpp) {
+	case 8: /* Plain 8-bit -> output must be a multiple of 1 pixel (1 byte) */
+		return 1;
+	case 10: /* Packed 10-bit -> output must be a multiple of 4 pixels (5 bytes) */
+		return 5;
+	case 12: /* Packed 12-bit -> output must be a multiple of 2 pixels (3 bytes) */
+		return 3;
+	case 14: /* Packed 14-bit -> output must be a multiple of 4 pixels (7 bytes) */
+		return 7;
+	case 16: /* 16-bit -> output must be a multiple of 1 pixel (2 bytes) */
+		return 2;
+	default:
+		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
+	}
+
+	return 1;
+}
+
+
 /*
  * camss_format_find_code - Find a format code in an array
  * @code: a pointer to media bus format codes array
diff --git a/drivers/media/platform/qcom/camss/camss-format.h b/drivers/media/platform/qcom/camss/camss-format.h
index 923a48c9c3fb..4f87ac8c4975 100644
--- a/drivers/media/platform/qcom/camss/camss-format.h
+++ b/drivers/media/platform/qcom/camss/camss-format.h
@@ -55,6 +55,7 @@ struct camss_formats {
 };
 
 u8 camss_format_get_bpp(const struct camss_format_info *formats, unsigned int nformats, u32 code);
+unsigned int camss_format_get_bpl_alignment(const struct camss_format_info *f);
 u32 camss_format_find_code(u32 *code, unsigned int n_code, unsigned int index, u32 req_code);
 int camss_format_find_format(u32 code, u32 pixelformat, const struct camss_format_info *formats,
 			     unsigned int nformats);
-- 
2.34.1



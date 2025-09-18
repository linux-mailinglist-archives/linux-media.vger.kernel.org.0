Return-Path: <linux-media+bounces-42711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36694B84210
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FDF524C73
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 10:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE012628C;
	Thu, 18 Sep 2025 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVPyoAht"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A1C27978C
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191564; cv=none; b=uqDHwrzF9e8Q60oGrirtPWvjaqV8Rx3soT8e4i09UrMQk4BvGiJsOeJ5lEqZh2qT8TCw91w1WXCG+BJwsJqk/1SiZN/+OSGwl/AwKdYDnS6Fg6Rn7EJtQHjz/NyB8HOGcuNwJn3dWdkGQq3tSmftpgChRJOw2/0EQFxya5q6RbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191564; c=relaxed/simple;
	bh=lzuoAn9syamHnf3EOFMQrgm6uZxfv1aTaj/En0MHw2s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QN3z4jhLqk8bZzSGVSELH0sXeSaGG/0i+mBpuiNeDbuQPAv6s4CEWRHbfRquaPGSis/5JBYgIw6eeH0tIZqPS1tVFn+UiO2WwWlAXRhtyg89I34th4ffy2tgOvHTIwpveCw57r6UQmsPvIkCh4r5+LR7VZsWdgYK+qY+HUKE2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVPyoAht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I8B7Ca007410
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 10:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B0qFP2JUKkZ9hARCOIngiWgKFzsFuJ4aRBB
	7zmN3uuc=; b=PVPyoAhtZuYaK1mEKuK8gjHTzACOzR1sckVkiPWXIZQVvUMTWPM
	tmexzzrW6SZPcT5HlPtiMVc6GSj9qdmDx3vT+bypb9WnAx5m1bqzhOgR4K2kNJfj
	Dnaftw3eg1Ze76+p4RpL9eETcAYvHm7xQa4/nsus/PfhgiT6EMg83/mUVgwAFiNQ
	AL/raRLaI1dr6LZHpWsEKZ1lM067hxdCkCizGMElduRUUzNo+IoAPsgSZNGfvo6+
	hhi7QylLWwgdkHs7xAc/ip6hdUVXCjZBugt4FNw/gcnY5oeBqFYxe+lWzVn4xaq8
	kv3UkcfX437wD1Exb/yYZ+i7zpKhAzkaHcg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498eberere-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 10:32:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77429fb6ce4so905782b3a.2
        for <linux-media@vger.kernel.org>; Thu, 18 Sep 2025 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191561; x=1758796361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0qFP2JUKkZ9hARCOIngiWgKFzsFuJ4aRBB7zmN3uuc=;
        b=tdTfJXN/NAOKLnd+a1MmJEPwMKqyIjiAI5ghu5ePayF3PtgSv/xjEskbmfKVVnr0Zf
         9G7ObFT2xmWU2Ykcg/9sYjR6DOeNlhXwj2pFxHFQ13HPi8mzVAtJ/IzAfpzDjfyWBvhu
         NUhk1ynjb/ZGsW2Z6nHaSuP/BUnCs3lu+/UwfDJUZloLq2iS8F99xIl9T5cuj1Viatxk
         e/5KQNUv9EvSDo29nSOZWUY8kCdG48JeRyjtPWV26AjXDDffaxqrDsY+HFPWX5gk9kIi
         KRwQL3PGN8sTeo9Uc96o9Tkx7F+XDbgmASB1H3oDsf1MMqB1wbGQWhY0ixs5CRLeJMRB
         K41A==
X-Forwarded-Encrypted: i=1; AJvYcCWNh3tTrgLWi/9FJLk/xGGxqBbqMOCPztg8WKle/rxVQBBDZrDwct/mP4BgxbFp6EFN2R2DqUp/7OLjcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGwn2+aJ3xn72Osgr0tMv+u9anUA+YtIB/UPg71MzPwWViSqnN
	yDWeW3V8f3FAORLLyBnVGNu+f2zowdhpIKDq5ew3vOPTyfkh/C+QUUU9tJV3YN6DdOrSDr2qaVU
	rE8NgKrTH4PtgzgfGB0DksV/fHtXUyfInr1EJRbFY5nZOaIFI0UkYYUyJJlFXXxLz4/L/vJN3vQ
	==
X-Gm-Gg: ASbGncsUr/H9imzq6Ce582gvNAyJ20s5sMWInn8UAK/7dogPDd2IvKklt74D9KHChtD
	7HORNI9kii6snoo3F1vFFChx124lNPw0bP/PZD5gJos+aNlh/3hzIOvRO5aFhpFWl4FrzBAqMet
	eLapF+X3cyJ8ewl+B/ht7mDJXoKw96/GIhfS7pqYMNUtl46SZ0U/yFLonciXsHEe1fu3VLL+rbN
	fp4mQS8k2eL8tKCHSM76v/eX/H1n77HQ8M7Odpq6ZojGL/wjJ5YkXcaqiMfXgbiplsX84sEorVk
	+nupW/Bu9Npxc0PG/QPMQ0DwzUYcmq4Gr21pCzZIMmmhQQTKaKQwDXEQgDIYWxFEu1z0PdQ40TG
	t+g==
X-Received: by 2002:a05:6a00:1898:b0:77d:4cec:d697 with SMTP id d2e1a72fcca58-77d4cfc1ebfmr2011335b3a.26.1758191560705;
        Thu, 18 Sep 2025 03:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5aiRkV5ypMxZfg+HeUABfPuKaZyrEgFLL1q+M6u2Kbn/q6Ozid+l0/FTHBwLstbC/nn+oaQ==
X-Received: by 2002:a05:6a00:1898:b0:77d:4cec:d697 with SMTP id d2e1a72fcca58-77d4cfc1ebfmr2011295b3a.26.1758191560193;
        Thu, 18 Sep 2025 03:32:40 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79be6sm1950563b3a.5.2025.09.18.03.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 03:32:39 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: hverkuil@kernel.org, linux-media@vger.kernel.org
Cc: dikshita.agarwal@oss.qualcomm.com
Subject: [PATCH] v4l-utils: Add is_compressed_format helper to centralize compressed format checks
Date: Thu, 18 Sep 2025 16:02:35 +0530
Message-Id: <20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lCPx6HwSZY4Q-iWddnN0CL07svybyTIY
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cbdfc9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k8S4WJGZqQq4Lb2wAL0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: lCPx6HwSZY4Q-iWddnN0CL07svybyTIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX/ykGfo99N/CA
 DwTf4HEVHfrxRyhMbydDj1nwMnQl93sjPyIMu8xCxqMQhIf3bT9bYCrf+zndgIeww/q7hE6OjeO
 pW4oBX2gdxvdFvB2AH4UgXj+muWf46WGFTxBqx7OVHvbQpFlRwecTza3xe9B96RQ/PaXt6vdqTZ
 Tzlw0BKyr26kkaim6sZIvN9EqWKqovPw2JdBY5ZW2SmUaRNKgroEfOPBJy+YnTjzcq8poMtM5bR
 UnlKliiZSzibApXM4oNf6N9AAyYokuhpI5WtHUgIcCAto+hK5hTaPlP/mX5UvNspvPSgu+T2lY9
 jb+iy+LJvAJlsnLbz9yOW84WuivcHHTNDAW5K9voCnh7emBBTh4x29Br5pOOY+vhbOSfRIW4+ED
 1TmaFtdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

Both v4l2-ctl and v4l2-compliance require logic to determine if a given
v4l2_fmtdesc describes a compressed format, excluding internal
vendor-specific formats such as V4L2_PIX_FMT_QC08C and V4L2_PIX_FMT_QC10C.

Centralizing this check makes it easier to maintain and extend as more
such formats are identified in the future.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 utils/common/v4l2-info.cpp                | 13 +++++++++++++
 utils/common/v4l2-info.h                  |  3 +++
 utils/v4l2-compliance/v4l2-compliance.cpp | 12 ++----------
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  4 ++--
 4 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 02dfd6da..c9ad1ba0 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -892,3 +892,16 @@ std::string subdevclientcap2s(__u64 cap)
 		s += "interval-uses-which ";
 	return s;
 }
+
+bool is_codec_format(const v4l2_fmtdesc& fmt_desc) {
+    if (!(fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED))
+        return false;
+
+    switch (fmt_desc.pixelformat) {
+        case V4L2_PIX_FMT_QC08C:
+        case V4L2_PIX_FMT_QC10C:
+            return false;
+        default:
+            return true;
+    }
+}
diff --git a/utils/common/v4l2-info.h b/utils/common/v4l2-info.h
index ac227971..34e8f11e 100644
--- a/utils/common/v4l2-info.h
+++ b/utils/common/v4l2-info.h
@@ -161,4 +161,7 @@ std::string modulation2s(unsigned modulation);
 /* Return subdev client capabilities description */
 std::string subdevclientcap2s(__u64 cap);
 
+/* Return whether a color format is compressed or not */
+bool is_codec_format(const v4l2_fmtdesc &fmt_desc);
+
 #endif
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 39b5e14c..b82d7dad 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -525,7 +525,7 @@ static void determine_codec_mask(struct node &node)
 		return;
 
 	do {
-		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED) {
+		if (is_codec_format(fmt_desc)) {
 			num_compressed_cap_fmts++;
 			switch (fmt_desc.pixelformat) {
 			case V4L2_PIX_FMT_JPEG:
@@ -553,10 +553,6 @@ static void determine_codec_mask(struct node &node)
 				mask |= STATELESS_ENCODER;
 				break;
 #endif
-			case V4L2_PIX_FMT_QC08C:
-			case V4L2_PIX_FMT_QC10C:
-				num_compressed_cap_fmts--;
-				break;
 			default:
 				return;
 			}
@@ -569,7 +565,7 @@ static void determine_codec_mask(struct node &node)
 		return;
 
 	do {
-		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED) {
+		if (is_codec_format(fmt_desc)) {
 			num_compressed_out_fmts++;
 			switch (fmt_desc.pixelformat) {
 			case V4L2_PIX_FMT_JPEG:
@@ -601,10 +597,6 @@ static void determine_codec_mask(struct node &node)
 			case V4L2_PIX_FMT_FWHT_STATELESS:
 				mask |= STATELESS_DECODER;
 				break;
-			case V4L2_PIX_FMT_QC08C:
-			case V4L2_PIX_FMT_QC10C:
-				num_compressed_out_fmts--;
-				break;
 			default:
 				return;
 			}
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index a565628d..ec85e41e 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -427,7 +427,7 @@ static void get_codec_type(cv4l_fd &fd)
 		return;
 
 	do {
-		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED)
+		if (is_codec_format(fmt_desc))
 			num_compressed_cap_fmts++;
 		num_cap_fmts++;
 	} while (!fd.enum_fmt(fmt_desc));
@@ -437,7 +437,7 @@ static void get_codec_type(cv4l_fd &fd)
 		return;
 
 	do {
-		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED)
+		if (is_codec_format(fmt_desc))
 			num_compressed_out_fmts++;
 		num_out_fmts++;
 	} while (!fd.enum_fmt(fmt_desc));
-- 
2.34.1



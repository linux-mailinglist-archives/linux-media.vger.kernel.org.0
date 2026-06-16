Return-Path: <linux-media+bounces-65068-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gWRfKeTeMWrwrAUAu9opvQ
	(envelope-from <linux-media+bounces-65068-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53715695C03
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 01:40:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kylxHvXv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JbkDhaPM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65068-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65068-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 794CD304E668
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 23:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C36A48166E;
	Tue, 16 Jun 2026 23:40:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD727481A85
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653212; cv=none; b=IIQNKlH3glhVIzgEMNmmS8n0QvBF4oNTT7MAEdNYwscVsxLB8pFppUER3ZArdlptQL6IFXx2q9Iescf74VrJrXFfzzSAAb+/LMihnWnVLWM1dHwVadi11luY2v3q9Z113onilJh9D94W/H0F1JvBf7Eo0j86OWyrH1tLlj4LQdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653212; c=relaxed/simple;
	bh=2oVtRuJR5wLvi4drkwXbpmhGqp9pCP+15g4e/nO6WsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/lytyn+WS2bPjxytqOkPwhFDfJ/SOVkbPfIqlCcFqcKYqgxtddPnLn8o4v5HDDRsjLF88qnZgJ9AGAzZGpaTud5B92YwgVL2IIU4+TfZAsQkM26WWn8PD02MHL6h0A/nyIrEcKCpB9VaXjmPFduSFFpGGu3gmVbgk+srJH78gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kylxHvXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbkDhaPM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTvUk249693
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=; b=kylxHvXvsQ2UHnL5
	0+16lqB9Vw+vaYasPAowTafo/RbuW4V7rsPRUxj03++BgxsEPn2acx5R3XVqK+7W
	rTjcIeoP4Hxf8ajSjscnAY3GJmCAqAU+yYWutndqWcJ6T506yLFrbhk7esKVwKlb
	Ep5eR+EDXE05xKT8RARq6Uhwbm7sf7TAqtp6KzD146JzZwhAO2u88igPBYB6vREw
	Ut95ld4xpiLbUhVFXDXbZoHtkeHv1+t0VydzQufhVlQ121IeE5JsBVqwBJ3FX4li
	NWZXlyKikcjksgBISNU040HmxD3CwQm3dHkhD81jEm6fYw7Mhg0tf9oFHei8M5of
	dLbmcQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueet0c9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 23:40:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137dd558ac5so374236c88.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781653208; x=1782258008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=;
        b=JbkDhaPMSxBENqniszbd/zfrlhxaf96E1xpnejPpFOBBoBji+vAfwqVk15TMKv0ncs
         51KQQrhIPbNuUJbOIDQVs7q+qqEv60zRChjiLS2PuJomy+kSAv1sF9u7fBTqlEpmb9zF
         r5qHOjqvrmh+jgl8//T+q3P80rxShhA1PFtAOuTbCuMINhtHHZRsabJTuiTKkWstTwbl
         IjYZxLCdKfZtN1G2AJlqMivTbpLOJYKbG2BsTIw/VbK7LAXUKBpKRDyC0Y489qLRRGre
         DlmHpuoZPwp3Ow0SVcuh0nz/Ht1jg5JkNXsASkEyFeByKTIk5MZFZgIYfUCPXQqQwZrF
         MZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653208; x=1782258008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SSBfUs5zHWsHGP8+8ujO3onLvjU61aUkgAyxvbFTMZ0=;
        b=BSabwlFHsR5zJRWNKR3vmW6cF6Sm37mgaSOuavETojDFHc8D1gdmy2eMfdYtz5VWLx
         IBE01W3kgveL84d02U0SA8Ne+HnO8fvmszDXaqh36BhwBpNV0ZGmsj3AnRca7HtWRYyz
         kPVQcOC9Y9BftZpt13W7v+2ADL+ddBh2XCsTURFbNjp9cXnJVvK1kGjMmxrcIbTQ0RyP
         8JJiFLXa1pftmzJB3B1C498+mXpFFQvbf2JskpwXTIwuAJd4vuGouyhr7Lwu9PTVgVdk
         /G6hj5OMHJ5Stq7BL/2G4NqhQ5szckWXWTARpAUVIrBhrzm5GJ0sY7HFvviXuaWdEQgv
         WsGQ==
X-Gm-Message-State: AOJu0YygBWvwohA5vBIMzD6QS9ESAXtnW8C4mfDUf0bpgPe5cadHpiGx
	7EhiwhiM52zMn4QkKQH59RuI4q41gucQaMq7JNj9qrzNlzZpo3rmPDu6SJLaPpslvl6+6rkAGMh
	9OW1QqSonwgZy7ryLzMRjCjKaenYXBVSeDlKnO/m9IXzC42EIqN66/GORWe6BQ2aCeA==
X-Gm-Gg: AfdE7cmAoZAsofwYLQFQWqKATj3292gLScw/HdFEjIvvkbeKoT7D9FD4FvxEAFp29m5
	l6odABbRz8LKHIAeeSw2oImugVuUnLI243Nn4GPxz08KvdH7VuaZ+/GWLFwNXRejp77XBpQBr5S
	q4lqm4F+8GrenwKZxTVbHai3K93Mm0dTAnYIrHvxf1b+16sU0QAnfH/BARjRiYPYq7mlO4PHOMd
	SQZAVTDpGooH5/8egnMxkDfqvyOITACmYyvEkVLb8E2fdgbACgxX82ulIIjw/yP1hm9PQRyqyZS
	FDlWADg4piFEacBdr13FbfrqxXJpipdJfWeUkEuHXtTTU703BxlLt14VVEGegTOfoZ2irJ70gos
	LjuFnRTmpzI2+i8R5qrM1WXJ7UCb7boXKV5Pl6WflipaJjaV1uKA9csCqs/FQT/Vv5kOI8py3Hg
	BB1CG38g==
X-Received: by 2002:a05:7300:8bac:b0:2f3:3835:2005 with SMTP id 5a478bee46e88-30bca0740cbmr469712eec.6.1781653208300;
        Tue, 16 Jun 2026 16:40:08 -0700 (PDT)
X-Received: by 2002:a05:7300:8bac:b0:2f3:3835:2005 with SMTP id 5a478bee46e88-30bca0740cbmr469694eec.6.1781653207718;
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bbbd636fasm2828607eec.22.2026.06.16.16.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:40:07 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:40:03 -0700
Subject: [PATCH 1/3] media: uapi: Introduce new control for video encoder
 ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-enc_roi_enable-v1-1-fefcc4e76f33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781653206; l=4210;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2oVtRuJR5wLvi4drkwXbpmhGqp9pCP+15g4e/nO6WsM=;
 b=N8Uh7A1P8CnzpWV3lV80XN9/yPl4mPYxEFmoI6njVMzRGNJGjT3x2ldG43GyNZTjKDCc7STlJ
 L25rJD/8gRHCl3VjuzxMlt7OGPvNfESwxoRgbj2JmrNYVGk8C4VmUw+
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: N3B5ssQS3tTx_48jp0XxgdJNX4yVOm94
X-Authority-Analysis: v=2.4 cv=JufBas4C c=1 sm=1 tr=0 ts=6a31ded9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1tTGy1hlu4sAMEPmmk4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: N3B5ssQS3tTx_48jp0XxgdJNX4yVOm94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX8XzEXVUg6mfK
 vj8cpsMRINs9Xu9UvanKVuu8Suk32McAGWSTVnEoZ1fkS9B9WzD7Cqx5ALgcDdOrfu+wOaWDh8y
 ldq6tK7QmAh0nkLetADyztT677AmAeU4VBMhrDT6rdAEIiFz1QB/SqIMsUvge6CnNibq+jTgxnx
 aXpW68OVuqc5BgYACMIoTB2xI6n8g427gCU1cbIxGCTAE1lYCMuvemUoI6HF1H6b5nXmq/KLHx7
 1ttBnNORrOWWpBA2YzBbJoUpXj6eKJUc5akyWzcOOTC23t3b0cjz5ht15tKY8dXdPv4XLEeQEo3
 0WqOoaYdpc4qmt/1GwSSk8klH5BqA6jJ0yJ9/sJ688J8lNyumzrgBs1NE5Kw6iMYB28TAltxJfS
 0qoGAB17gdoDA9ougjBOFovEeSbvko7gV8U8J7XoKIe0mI01lhzx+lZNrz143Pdo3b6+GL69OQ5
 hKRVXPjIZhtuODNijzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOSBTYWx0ZWRfX9gMyefbNy9Un
 xEp5H96NPSUIWtKE22zCZh+ZiltMK6UOl6TB5CGm6LiD4SDQctQqOvFNmOT2XFjzBRtUKAIgyKp
 2SZs9RtVlESj4Jlpw+q6VdJpSs4V0sM=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65068-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53715695C03

Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 14 ++++++++++++++
 include/media/v4l2-ctrls.h                                |  1 +
 include/uapi/linux/v4l2-controls.h                        |  2 ++
 include/uapi/linux/videodev2.h                            |  3 +++
 4 files changed, 20 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..1995e7335fb29611151c61561df577f2bdac7a48 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (integer)``
+    This custom control is used to set ROI MB map delta_Qp for whole frame.
+    The frame is divided into grid with MB Size returned from querying
+    V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE. Each block is configured with delta_Qp
+    in raster order. The valid range for delta_Qp is encoder dependent.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE (integer)``
+    This read-only control returns the MB Size for ROI MB delta_Qp map.
+    Its valid range depends on encoder supported codec format.
+    Example: For H.264, 16 is returned for 16x16 MB size.
+    For HEVC, 32 is returned for 32x32 MB size.
+    Depending on the size returned, delta_Qp Map is set to the encoder.
+
 .. raw:: latex
 
     \normalsize
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
+	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc14a90a230601d8e23b0e13845d34..ce217c41c471042eb9b920532a4102a87c991d5b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1880,6 +1880,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1993,6 +1994,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
+	V4L2_CTRL_TYPE_S8		    = 0x284,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

-- 
2.34.1



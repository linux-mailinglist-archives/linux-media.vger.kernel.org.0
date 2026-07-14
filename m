Return-Path: <linux-media+bounces-67587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yaNrIH2IVmrH8QAAu9opvQ
	(envelope-from <linux-media+bounces-67587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:05:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D913075816B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ajxEi+LR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XWvjZmBY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67587-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67587-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C9831073E1
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF9441A913;
	Tue, 14 Jul 2026 19:01:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD2D35674E
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055661; cv=none; b=rfMzKURwJvIC1tPgYwUBXXu67btdmn9YS5HRG6G2BSziHpFEptof4sSk4sblKWtN/v/bVV83pUL2GiBj+HQY+igHXo+6SpKcTEUMypyoyICZUfKPla7b52Pnu1MdN0BAu+DLEI7OQChWmy4qwUDx2wQrUsg1bHeT95BnmVkjhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055661; c=relaxed/simple;
	bh=7GK9DDlQMpT8QfDTHGaKj8I2AooJphTa7MXU9UGm/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ax0Fd54ptHqRaNIEWegSPXfXdkVpdsp5PnDnKBU8qVsBZ9ayCjUKW3UrKCPQ8ZAUyF1CHUDZg3BE/MgyhSYbZDeYtAC/m6j9IRBkR4az0tV6DW/95tQbNdrJP2okwwLF9jYDWB7lsEg1CHQVivnbNodMgH2ITmN+TLcPM5HCD5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajxEi+LR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWvjZmBY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwneP1268871
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=; b=ajxEi+LRyXllk3mR
	fpOeC2RAeYOad0K9GUVP/LvyIycqMmb5cw6qFmX4MxwRN+iNctrehLAvighMW9Du
	gU0P5pHj0p16sVolAonr2f3gAwYlCfmLy3M3zCKhmB90bDUk9P9ZHvEZWBZD8rap
	JCJv5NaOAs24tYqZzxnWIZEvYk988+35pR3CzBN0HgfSY+GRJPz/RSECPSSMfavZ
	cry0E+ogKB8PJ5QXE3sPyxcf0hy2O1m6E6TLaTYhPhBirLKaHoiiDCqIQ+5zb3sv
	EFiCtDXWuCzoYK2nSLEFz3LEe1rUpZypG7mJl5+NDCrXk9xEEHoDIurAeCnhIWIU
	o03v4g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g0bxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:00:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38459087607so1528576a91.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784055631; x=1784660431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=;
        b=XWvjZmBYWqw0NIgzT43Y3TssVzOeCWpf1fw/aM7Ba38vo+X5n7K5r4kNDlJN9xAhU+
         aJfqTsz/rO9lH38DPnnmzaLyyafKhGJGJUaMI5Mk5/HG55Mk0O8yA+qqFZ9G0vHYEPvE
         t0mncUEl7N8S6qIKDOfPGsozjjrZx0RHvHtqgG1idgomyXOEK9Kqm0OyrANfnkyRiH9d
         V++VsvFbmc70H6RjCAd3AmJSCCXkQv8NZYqD0a2zys87VWOZWfbSmpblAnmQ2DPlWC+q
         8a+Oe5IKyg3YGZZyFCcjpIpQoq4MeeW5iMgudkX9sDJDKPoYnp132yTAMbWCeJoEEdIr
         i3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055631; x=1784660431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88t5Q1rCrRBovk001PxYQwOFDJ/w1W3H4voGdGdGz1Y=;
        b=ZxV+a/oIUygmomcIOAFa+mBtDjF2nVlvNSvOQ1MUpb85QrVYGCsezRoCA4oHSCBQQ7
         M+GcZL9YAyeacUXiSjiylBS7WD7OpF/Ts0Dc+APdy372eQsZiO7fXN8bzeqSg0Yzs6oK
         6eNdtGBM5hpZUhYZjN9/Z59iBKPzKKU65/ltn6g83KK1zm8CqDigZYPBPeHuocN7T0aJ
         TGDhpNakXLCgdq4dCDk6X4lUntv3QZRYnH9uTyD5h5X2qJiMFVS+6yRJOqpoUXX/d5Uz
         FqA+zE0lVqujF6huely5An0ioE7ItALa6uPpFsKxqYUJOKHw50QIw6uQ7CLgZOWxc+fs
         iHrg==
X-Gm-Message-State: AOJu0YzeZjDt+h4eIJh1pVBNT2JV7fbDx/cH2JMrxZBpB5ATsGfrEZav
	TjoKHNRRhMc2nt5TX34bF95c7bsjF25EoUNmTObAe4+0kAS9CgIsDgwh75eAS6mFGXz6YO0UIHf
	f4UHL2hMYpPrVrLHCt2fxHGCaJY4yMGiOQLMh8WpL96vpJSnA8MsCDUYfgLvmpnza3PD0wguFDA
	==
X-Gm-Gg: AfdE7cnEO3oIEbBaWZvPp/RK+f6muyzLcctjLv7MbZFnrkg0qXjeOb4IaiXrpnigTZD
	uKSqfsIPP2TQvXuyX7gE4ZrAal+qV9RKiyYN+6ombWWgzzE7lX8ihb9lG7JI95dfUlWJ5W72ir+
	C/1vV7TX/inrXNppK7E8xRfwuNgK7lP5ZnuifiyARkgh+F6I5CHwqjsw7r4E8Ui/tq7ao6+mBjH
	3N0KMhTRnNDk9zdeOe/iNXmMPyaX7AFrq9xMEclw5jWTOa/XI293sMUoXeLnAdQ8yZUQMaU/DDN
	KRCIjoYiGbi1yobXbudnWEcGF24njOKD1A0syfkKZaGYvd/HPnAT7nQEZ2WBKQfzwX4HgNtRNi5
	eeh7aNdijXNyq5TpFhUAJfKM66MuzO3K9FOqKMLT8NhqmtXIaM/kwmZyEFaFr4QH+XyP1YVU=
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38dc76069b8mr9790210a91.0.1784055631070;
        Tue, 14 Jul 2026 12:00:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id 98e67ed59e1d1-38dc76069b8mr9790176a91.0.1784055630350;
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm56634528eec.12.2026.07.14.12.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:00:30 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 12:00:25 -0700
Subject: [PATCH v2 1/3] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-enc_roi_enable-v2-1-63683f9dbcef@oss.qualcomm.com>
References: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
In-Reply-To: <20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784055628; l=7340;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=7GK9DDlQMpT8QfDTHGaKj8I2AooJphTa7MXU9UGm/CY=;
 b=7dvywaOemnD8FH1LcfJy29+t4Ch1JXP8Jy1FuXpWHl+ATOsyXIX1JoF6b4N1YsfBlTqZR9lcG
 z/0HxHMeRcXCfwmUfadSJQwVg0qzQIdXC0SHpNeXwOgEsXRSy4b75iF
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX+yp08eKLhKfC
 PTWZ18DHV6FhdTLphvRWR4IfFW6E2lInLfA2xfC7dcYUWWOYUhaKBbpCggVB1icvfK3fD2nUPv2
 X5Uf1LMSXSGazd+NouxuCZR6PV6as9E=
X-Proofpoint-ORIG-GUID: j-5zRtmacP_8nfHyvH8akldp6ARvKQGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE5NiBTYWx0ZWRfX2oOssb/ECdm7
 YR4vpQU+pSLasg7dBk8iw8osb+xG1ePxnamJnZjIFZCwMXhLnBPJ/YQk0Ryd/xsJItG5JO0JY/Q
 W+2CjqVhx4ut44YFjUlS5zCl7biuJdg0yzC5wNjT//d0ZxEXqdBZfuhDniHSXJ+MN9Xa/iiAiIt
 OVhgR1jY5UUlteAWLt77ToFYxMCMwL+bIzsEbZDBNQ6PRYWasr4kpOPCSVwtfdO4lzWZ6Xk0hTt
 Sj/ryG9IMvMhXwtq6zD2ZGo/JsxQ/VEQ4fQ88HxUSRlj+Hx+UsOQ//hMBpHJR8t5GfzlXxM9iTR
 kBKepw4O4mOgxXDCl93MfuqxYBlDH6DNKHev2PbIgPyLOZ/m9I2TDBC+y7SdUbdaJCLzsdWrBrD
 00bo9bsVqALJydGPqpIDou/sx3jz7sON9PKUa8oJCqfGyzggbcwrW+hMqwW8can29pShM/ZeY/k
 COVsxEwDxQwNTthJS5w==
X-Proofpoint-GUID: j-5zRtmacP_8nfHyvH8akldp6ARvKQGl
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a568750 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=o2p6THidDhOa5OcZzacA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67587-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:deepa.madivalara@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepa.madivalara@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D913075816B

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
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 14 ++++++++++++++
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions     |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst         |  4 ++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst |  6 ++++++
 include/media/v4l2-ctrls.h                                 |  1 +
 include/uapi/linux/v4l2-controls.h                         |  2 ++
 include/uapi/linux/videodev2.h                             |  3 +++
 7 files changed, 31 insertions(+)

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
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd808979fc590715125f689880e5a30e..8d5eec357509700c9a582b98c14843bb5e483be0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -185,6 +185,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
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
index eda4492e40dc14a90a230601d8e23b0e13845d34..1e307781645543960e4b73ba46fdf83279fda4dd 100644
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
@@ -1957,6 +1958,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8		 = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
@@ -1993,6 +1995,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
 	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
 	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
+
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */

-- 
2.34.1



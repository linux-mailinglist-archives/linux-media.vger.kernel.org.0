Return-Path: <linux-media+bounces-66809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xbCRMoKeTGqnnAEAu9opvQ
	(envelope-from <linux-media+bounces-66809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:36:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43A718056
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 08:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JVcIu/l4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AXyHhf9D;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66809-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66809-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B8C73042812
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 06:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12913A8759;
	Tue,  7 Jul 2026 06:35:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A8B3A9D88
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 06:35:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406157; cv=none; b=keNQgdFKJ5zEJMbkwJMSrhXQFPe+EgNeW+IVoODFyhcX3lIxdqyJ7LOI+OCqS4p84iGKdDo1h4LKtI6mdyWCHaZkx/M5xYAWTIVBYLZckMUvZ3FRb45rCTphW4P92+6qhG0H/DTWObmPk1kZ3o22x4aJy0AF1cxLY2roC9feYY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406157; c=relaxed/simple;
	bh=U+OZ9O1Cs+CPXtp/C14ZFK3x9+t47Sd15lZiuTeSofU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRnMjMxgPp1RWFtq4bqDboDNoV+KQSyZyn9pCmGkC8+kUGOzj7MJFpqiRW2GzLhGV7y7Afo3htDTjnz3i/S88CcHVUYEtGdaSeNShsuiLZKXpIOnkCB4fnfszNiJAvV9GhW//6Z1z54iyicG+4LMbJ6SJqhqyf0oWpLO5gWvqn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVcIu/l4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXyHhf9D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748dZI2449640
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 06:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=; b=JVcIu/l4a12+QGYm
	sKCi/dLtHP+8i1Pn4Zm7dk2d/WBz6mFp9qnQIqEKX/+NVH1rRAElPYRlB3tJkqvi
	E6Q+bT000KN51AhsV+Ugx4mlmPgoPl8KKG1IoFFgaGX3hYqX4+yYgaQMn4b8aDHh
	Qq9XspUmB1OG4f/WwZ1baUlug+ojSsz3pTDUwbk/B3vdjQ60IwD073zvXl1jfDLR
	tNaXrYHnIXtWvqcoGiFj+fbUBzsjJRJ9kOyR0ZIl5VX7i9MCKNW6guHXZlTQ9Q9v
	khF4+bew0RLqSmwrMJdd6DobhhTtoXn0WvP1yzeKCc5OZtp0uK+txpZeCjnEEdAJ
	Ft64Ug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70gyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:35:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a483ea41so609103b3a.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 23:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783406154; x=1784010954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=;
        b=AXyHhf9Dwy53WuuglvCnm4VTlYuoAVuOvkRKto2MpHZi8IpbupX04Kb82kiYehAZe/
         UgWA/26URlfESHhEv6fTWgc9asYX9xnKPLKwH8tnO0C99H71CTcLmIUimzfMQnmx+JEE
         fba8jCtZH+/kV3sPXojq1vykuIGs4C+EtlS6T018whtmQWLLYXo13bN7fPePkiFU3HKG
         N9gQc20C9ctEVgqQs5Ykjdlhyz1+VST7b53tLm/0z6aP06sq/oaq0GwTnN/eMhgskk+X
         CswesRHV0UQ/O3rEdmbw1r7M1w6456B7aMoZJ67xgt1LhQjQE2Cd+DoX98WLUKq6DU7b
         LCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406154; x=1784010954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zld39roC+nUCFK9u4JX5pNXWgjY0HSPQafKAjriZJPg=;
        b=MD+TIRASH5Epw5zDGeR2le9Vg87DbqG796RO+N8TGExgJLwIN9WdY6Ldnbb3bw9XT6
         XJnwBaHiaHSSD5Ls182uUou/6YiPtJrAysYqr9A2mWWwY7f2ZLV4GFabcxO+KB62aWXB
         HIj7FerIrDF2N9UlVH+Kry5eAPUC/453T4jTmTNsLWg6phKCaMbEZJbLjiviXZ85u9pn
         ZJD88QYuTvhFzT6da4LLKvaQbIvSmv0BBQX7vNfTu6T2KuBUfG6OO0PgccZLqlA0JBDF
         4I3QXA6sKdGES3OAaRCYmNW12vAUCd7M0tIAeOeVWLYaZyTE+YsZkYFnUjR4XFna3QkR
         HTqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7mSTdIQKIaZQQk56CHiOIoRSkb3Okbyy8DsQF32fcJiAcgUWCWgmGmRDNdqjeN/falfhRmraNG0wZnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pyF0hn6BXMfVjybDb8r5mciKFE6jXsR46vR5kF/IKCHfl4/d
	akkpfKoi5rKKf5I5mPOPVNXQF9mClaDJfpUcG4mijhhFi5eTCAH2FtPx05weLX9EBbRwmyQF1hU
	hNWmZ9h34ooHhH1BtMNFFGwbTx0GTLksfE0HRKKfs3WzfHG8LM6CtdAMR9XnYD9VPVw==
X-Gm-Gg: AfdE7cmcObIyhjWiIBrk6+Jy1M0ecHVmoVRosiFYqaSJkgGDVnoKLydEUBNSOXOfT2r
	Ktc73W3ed9gMz1XVrbPD3ldezyzGPjhD4EKAoRjfKgcT/h2Dd6IWqzZtBsw8xp2Df7J+2I/1q/Y
	M54sBwIBoxVqnrS5k/oA3//EZxi9O6BaGBabNKRRd0rlSpzyGUZHlv3G8K96vNtrMEMongbA8Vo
	aMZXU7yPCU1NI2ORjUxznUKpkJbWJjbDxFdJX8ExTt/RwHTUqpR5R15gi0DmHfPJ79RorTNhT5X
	yqa+x5TJmyGwSXsGmhezr2gwS6ZD4t9HIVHZeBGIxA/zlcQuHP0sQdALjtlsYS0pa/TzNizKIai
	Li39lMIjsAHkPefttPNepQzWudE4s79qED3QdL+M4WRr3
X-Received: by 2002:a05:6a00:3698:b0:847:9515:9296 with SMTP id d2e1a72fcca58-8482f2bd6bemr1324391b3a.6.1783406154019;
        Mon, 06 Jul 2026 23:35:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:847:9515:9296 with SMTP id d2e1a72fcca58-8482f2bd6bemr1324359b3a.6.1783406153480;
        Mon, 06 Jul 2026 23:35:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm4889973b3a.53.2026.07.06.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:35:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:05:24 +0530
Subject: [PATCH 2/2] media: iris: disable time-delta-based rate control for
 VBR
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-2-33fa130bc535@oss.qualcomm.com>
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
In-Reply-To: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783406138; l=5488;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=imtBPLnerSwb3oU4/NP33rvM71DYb2DBrfePh2rdoG0=;
 b=kosY8GPm0Ihdmjo+jq8atYUt24v4SVSAKvj1RZezUxduwwireEtemc5KWM+CJzyLChFALA9re
 WNI8oN+SS9jAI7wGF8xP6cTh+/4Af/B3c3m8CGYJ3vB14QFzegr/dcD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX4Qds3zMZ3zRK
 Gb9yWapzKYwSmhL2Pkd+XB+4Web2NHAVPd6gZME3MAbegwpKiWBOY1PSugQ3HyLG/Yylm7Pp1iH
 59rNeSGQI//85m7vhtReLl0DD0praoay8rfNWdy377f3IqeDD3N5GMSsmkDgPTjN1U/gYJaYaQt
 2cyxrjZwU9SHBL0HHst2k7SHr/kkiNItsXkBIJTD/MeMri8MI0THy5r4XJzQ+ALd68e5VBeMieC
 KrCWMrBvohufjdMIYql5Vu4gtIwHM01YVfu9Du+l6svKVgZPJVMS8pJlO9tXPS+Tm6bm35g62rA
 n2u5L1m5nOalR0Tq/psi750PKrXYmDTscdGVK/z+mHHIc7HbOzLn2hZnv4wPuJr7act1NAR9aBJ
 hdBRqrRfQTyeOXEjrQdbW1FrZLxeiPyq71Y4uL9fPPkQdQjyAYqYBaKr2w8zwxW8dGxrepwdLRE
 ayAYXdHi/5JNvVK8SPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX05VRo9vN3oVb
 KeyCj2MU/LOqSqvIJKpgt67GQgTF+OBwKGLAKx1/+QnjfFrjymgAaV59lyPWkDvsDFt2ofBKarq
 mml9sfu0/IXklyYqNwDdhVx+/Qd2LMY=
X-Proofpoint-GUID: 2VAWDlS8IWcoyqflztYSbOIN5z8-drPk
X-Proofpoint-ORIG-GUID: 2VAWDlS8IWcoyqflztYSbOIN5z8-drPk
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4c9e4a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hCni5AK2fHxqBZM7pzMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070061
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66809-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F43A718056

From: Gourav Kumar <gouravk@qti.qualcomm.com>

The iris encoder driver was not sending
HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL to the firmware during encoder
initialization. Without this property, the firmware defaults to
time-delta-based rate control (enabled), which calculates the output
bitrate from actual frame timing rather than following the configured
bitrate target.

This caused variable bitrate (VBR) encoding to produce ~5x configured
bitrate. For example, with video_bitrate=896000 (896 Kbps), the output
is ~4.4 Mbps instead of the expected ~896 Kbps.

Time-delta-based rate control is designed for variable frame rate (VFR)
scenarios where the encoder adapts to actual frame timing. However, when
an application explicitly configures a bitrate target, the firmware must
follow that target regardless of frame timing.

Fix this by adding the TIME_DELTA_BASED_RC capability with a default value
of 0 (disabled) and sending HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL = 0 to
the firmware during stream-on, allowing the firmware to use the configured
bitrate as the target.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c         | 19 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h         |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c      | 10 ++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h  |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h   |  1 +
 5 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..f6136e655b98 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1477,6 +1477,25 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 value = inst->fw_caps[cap_id].value;
+
+	/*
+	 * Disable time-delta-based rate control (value = 0).
+	 * This overrides the firmware's default (enabled), ensuring the
+	 * firmware uses the configured bitrate target rather than calculating
+	 * bitrate from frame timing.
+	 */
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &value, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..10e046722ad3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..d119ad599c31 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -416,6 +416,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_bitrate_mode_gen2,
 	},
+	{
+		.cap_id = TIME_DELTA_BASED_RC,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_time_delta_based_rc,
+	},
 	{
 		.cap_id = FRAME_SKIP_MODE,
 		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..8766d9e49611 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -67,6 +67,7 @@ enum hfi_rate_control {
 };
 
 #define HFI_PROP_RATE_CONTROL			0x0300012a
+#define HFI_PROP_TIME_DELTA_BASED_RATE_CONTROL	0x0300012b
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..99dc6d5c72ba 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	TIME_DELTA_BASED_RC,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1



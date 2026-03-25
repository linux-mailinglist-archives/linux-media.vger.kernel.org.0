Return-Path: <linux-media+bounces-56946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDe4Hc5kw2mrqgQAu9opvQ
	(envelope-from <linux-media+bounces-56946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:30:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E242A31FA5C
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A34953063AB9
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 04:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A182F690F;
	Wed, 25 Mar 2026 04:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfX/Tn5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YI2lHCde"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6937930BBB6
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412938; cv=none; b=sKfINhlCPxMpVCxeBqMai3pwPhXDu9Gpf9SC3R9sokuHHf7eTy8HwLQUt0/6FS9r3m0tcZedO6693snxlJnsu8R6AGhytn5Iv6mMgIf/tOpiLSKzAnqjiQlPt16R5AUwH3O8JLjqwQ/kAD1Tg1wJW5C3gJ7VgszzFM+DPP2KMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412938; c=relaxed/simple;
	bh=O9k5sbNbliyjwCfU4/2rvQsib07HELJ5jU7XvpY0BZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rD0v2FdrKKzqvwzUUqAwNSLSvrE4duOLMSlIKtanqJd/epxehJHVxo7r1bTd08hvrLfidDhPZJNmkERfhZa+bxA+S21IRky3cOShQVbNrJ8O5UDYPSUd6PDzosclhJuLoXydhYRIRjc3xYePPnNnAUbjrycoW9wY7dwo1zSbqVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfX/Tn5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YI2lHCde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMehC72276880
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 04:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yCUcZwnRSz7kINo8xzqbZt
	uw5fBlTi+A3o+3zPGO0Xg=; b=FfX/Tn5BVd0OwI0xQOWZaftksZ9kEFV/QVUciu
	UV3iZv90M80GaZN7o48kyTkEbX90pNcmBQKAdrVKaUxSORGtdag9clwdGdiAIwxl
	CDkDUa59YDTmfCwXfHyuFeJ3jJwFPuLn5+0YaS0TxpEUTqr081MkxbOm737vM7gM
	Arq6hwhfS3E11d2c2bBg9amvZHC/uXwbYjpCdPM7cQQjb/nqxQH4dVdpKSOJeRGL
	FR841scB74Baue6E/6GnJFTRU6j7ZIh9Qv6H1DS4gR6V09oBBHEVytNCpno3BaUI
	3PMfOCErGRrJB0usOw+8Cb+WcWbV83dPAlpdULwREKrdnAUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rasd8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 04:28:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b064884a7cso399657955ad.3
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774412930; x=1775017730; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCUcZwnRSz7kINo8xzqbZtuw5fBlTi+A3o+3zPGO0Xg=;
        b=YI2lHCde3eiRldqTV9jPwT2h6XlOtCDr6ZM2zj5PCC0qnx6n3h9AzxqDiAXAiECwF7
         fWSEPVgBh28/pVgznak7Dg9pX6nniCDBCsETcC8vRDOjdvnA6aJ7ko2yDlm/Nog2l12Z
         KwgxEC9+EiQ8RfAR1r28wFDqwhXkWhuPkhKdWM+Z1N3c3XHvELD3+kC9hVWVRB4lPRKY
         DCR5swcIcmgI7IwYgbBBKGNXApt0PjDljiZSpTbe5ZHibkO4MZIwfIL2DqRsVaqDPZLX
         QWmxL5INkw750wTMVA+zpS3ZJBNiV4w8C1paAZ4KxXO93cGn0TuhoCO9VvqMS3J9DhH8
         irFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774412930; x=1775017730;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCUcZwnRSz7kINo8xzqbZtuw5fBlTi+A3o+3zPGO0Xg=;
        b=tHEjMPDW/QaGQmIzTyhIOU46CW4URgx7SxzssEy+0omXpLqxKUFXiu7qKehX6mxsDX
         xhWQycYgfZ4KBasjEdbAN6jbjiJctzRxGuwZkXb7ib0I2+KhVmHgr7O3ZIE7klS1qj3H
         5V/bBmFoZCSlZhyjs2hF60x3J4MG5xK1zRb+CjWinMj6zHytqUCs4k6GCvdyxMycLktz
         s1NMpvrJHluRjZAypz9EE+hAEvHA/IxpAS0xBCPVMRlDKPJEyfscMVKXGp9jmlRSOPnl
         zJ//g9zPpJxLp678Xfh5iD+5jCQWiUWGDWN+ksdAHT76eXJ/CRMAi3ByRLIWfQvwULtr
         OCKQ==
X-Gm-Message-State: AOJu0YzCYKSr/xvxvyNdpns64TrA1LOJgZUWW6C+W6Le8fRvBOU7B9B1
	9PSuKJkv28IP4YyMwA4czQ2ZbsC7fSi+wXn0LiWGIvgAPiGM8VgZgvSI2wxTDQE5fEolTz6I42n
	gDDJrVIfcNBx4IuRCHzS7p58N8wfrYK9atSFlSrNKIDC3aTUFAirWNjuO+YD0Madfpg==
X-Gm-Gg: ATEYQzxC4lXwRludLYX2q1CJxu+IEr+fLxs2R5YR/X7+x88rrm36XHB8l8Xz+lxtHAS
	m4HdvQp4w9XKQ16cd4eDP4umu3pmZZ0vwBbtdWqcvEl6ARHbucYUdRjsX/sngy2/ulUlmVoa2Eu
	mJ+rzZPr4Qkio4KNxTPg3PzPVDqVvU2AGa84UHq1OKqji4+EXjWqgQ4J/OWKpZBmYwqpxBAP5on
	PVBJ2Zdm+Rr0QWL5Lx35rNO0NFsGbxA/Lpcah4dsHn7Di8Qc8u0goiX27DYgExZXlmVXXOFPv93
	rtXvsnNVIKhwKHRM6IytHBtsSmFs+Apc1ukajjqSHEvIKycru7WdQxrm/dXPnVHfFNqo6pqyumo
	8WxsSLnKP+mjItc1TYds6w4OHcgofoBdSC9OjWDggcRfrfE8ZELi5hQQ=
X-Received: by 2002:a17:903:2ac4:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b0b0acff88mr24108745ad.32.1774412930355;
        Tue, 24 Mar 2026 21:28:50 -0700 (PDT)
X-Received: by 2002:a17:903:2ac4:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b0b0acff88mr24108475ad.32.1774412929897;
        Tue, 24 Mar 2026 21:28:49 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549f63sm159890435ad.30.2026.03.24.21.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:28:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 09:58:16 +0530
Subject: [PATCH v3] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGBkw2kC/4XOTWrDMBAF4KsYraugX0vJKvcoJYw040aQxI4km
 5bgu1d1Nl20dDPwhpmP92CFcqLCDt2DZVpSSeOtBf3SsXiG2zvxhC0zJVQvtDB8nhAqnYapnCJ
 c4nyB2l743hO5wVnhgmTteco0pI8Nfn175kz3ufn1uWQBCvE4Xq+pHrrBCkt751GCMEYBhoBkP
 BBqH4U3iAQ99sS+rXMqdcyfW+dFbth/9RbJJTdEELXTYIU5jqXs7nM7aQ12bWzyon5q9k9NNY1
 0sDHGIJXpf9HWdf0CRCtR1F0BAAA=
X-Change-ID: 20260304-update_fps_calculation-98ee7f7507b1
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774412926; l=4463;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=O9k5sbNbliyjwCfU4/2rvQsib07HELJ5jU7XvpY0BZY=;
 b=/7aS1bDEnahBNol9wJblFhdEj1eTVHGO6PR4n4+KkiHRETDC6ViFMwqt1ObLqrk0jVJDfBchJ
 P5HxgdxYZaaDa5xcyvuEpoYVVOrDqA5WVXlr0XbUCk44Nkp8EbtuNfO
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c36483 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aZFUA4iBNJJznah6NdIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: LYfV_dvCEfL3mLJxCAwIHdeunQZQfrQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyNyBTYWx0ZWRfXy635CmQoRL2p
 cK7ezwPncWxCLtxPB5B77r3YHsEcoKoWqW76K0hOhbxBaAjnhYlANxLmy5nVwWrlh7djzSkGdXN
 XNuvFe9pM3PxJgq/xB8s5HFhJq7E2F8hwaprTm3Jaf1CaJYtvCNe/OtdGw6HiU9D0eJ+HBrcQJ3
 G5/vOLO0UuReHui6nTjIBNTvlBrwuV3H5za2LxD+Y9mCly35rK6pB09j713zmIzeMHTgJz+cUjJ
 nUc23mt77NL3gjwMvEP7Z/n7ncckJpMfcJCTNRYhZGDsOcjGPDOPRg+nHn3TsYXafBj5bicSrJ3
 pvKqhf3FwyALrmmetVkgfg/xbSZJ1eXUmkgijad+a53Cb1TR4GKvVNTpmumCyurWE17urNgJ383
 Rmo4+6W90hOQ8FnyBPXXIoa9IwLw0R2Zv2xmX8riXJlKjDPgEw9W8ve0OClXgQ+H1c9AN1D7brx
 tFgTFuygmwYnqZ3FoVg==
X-Proofpoint-GUID: LYfV_dvCEfL3mLJxCAwIHdeunQZQfrQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250027
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56946-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E242A31FA5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was using a fixed default FPS value when calculating the VPU
frequency. This caused wrong frequency requests for high‑frame‑rate
streams, for example 4K at 240 FPS. Because of this, the hardware was
running at a lower frequency than needed.

Add the FPS measurement based on the decoder input buffer arrival rate.
The measured FPS is stored per instance and used in frequency calculation
instead of the fixed default FPS. The value is clamped so that it does
not exceed platform limits. Add a VPP firmware overhead when running in
STAGE_2.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Updated the frame_count condition check
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 21 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..180cba36a7f2 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -109,6 +109,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_recv_time_ns;
+	u32				frame_count;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..6d982802e5d4 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_count = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_recv_time_ns, time_delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_recv_time_ns = ktime_get_ns();
+
+		if (!inst->frame_count) {
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_rate = MAXIMUM_FPS;
+		}
+		time_delta_ns = cur_buf_recv_time_ns - inst->last_buf_recv_time_ns;
+
+		if (time_delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
+			inst->frame_count = 0;
+		}
+		inst->frame_count++;
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 548e5f1727fd..d621ccffa868 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	u32 height, width, mbs_per_second, mbpf;
 	u64 fw_cycles, fw_vpp_cycles;
 	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
@@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 	if (inst->fw_caps[PIPE].value > 1)
 		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
 
+	/* 1.05 is VPP FW overhead */
+	if (inst->fw_caps[STAGE].value == STAGE_2)
+		vpp_cycles += mult_frac(vpp_cycles, 5, 100);
+
 	vsp_cycles = fps * data_size * 8;
 	vsp_cycles = div_u64(vsp_cycles, 2);
 	/* VSP FW overhead 1.05 */

---
base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
change-id: 20260304-update_fps_calculation-98ee7f7507b1

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>



Return-Path: <linux-media+bounces-57884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BnVAdAlzWlkaQYAu9opvQ
	(envelope-from <linux-media+bounces-57884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:04:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA1C37BC80
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 16:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6773B30E7ED9
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 13:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188E243CEC3;
	Wed,  1 Apr 2026 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDlu8AVO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4qJdY3/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891743CEE4
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051391; cv=none; b=fNPrslAD5eJBCrPkBFKtY1BQWO8s9iceZZYJsCPwt8eoKyTL6eCUqmUT52D+AKnwhi72OZ4rorz98/78v0Msh1k0DB7Tc9YJgxjpPVx+CIYlsF0z36H6S5PIWD9f4BWa9CcjTUxUdDwhPGk9v1TPt3P7fn0+QWg/kXY5l/wBc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051391; c=relaxed/simple;
	bh=rW46XFPPp2C7fNwBbAzHJuh71JQi/lNqZu/462qrWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S7fD2TL3sz5PNprUuo3fp60b4ReiTjfeTtAT4mv4QrujDF9hD/n1Npqe/vOFWMkqz+iAHOWs7pD9kJnK37SMOCQzMPPsLqFsYvmUGv1fYq7YxvXx/O5obC0WJDiAoNr7FGqMEqinABStdTqNGpBvBQfGVmgKu7RfQXir6JYopts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDlu8AVO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4qJdY3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C5UqN4106686
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 13:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pLcwugmveaGuc3b8rkj7O5
	lUNjS3ZVBSKuNHEhcgUvk=; b=NDlu8AVOWqk4EiJzvBAseAYapxJvgtCzCHicbS
	RFvQJ+mTdVT0ha9L/Q5ZAKggOh0/NA190CWL4/PZ20YZ8f3k4Xq77uAhGQkUcdJW
	T2SPjhogcNiVOgLDohhiT9UVYnGpllMBlSKW97YOffLqVnldgz6rr92zdCLyhNWo
	z2xvchnUdpZB7/MNz1PoyiTisNsBqzjexHgh3Go7KnOVG7FbM/9w6lZ5X/M8bcvQ
	ODNqLdibFXezc/hXhAMyBT/7XQrgcY9Wlf9ZkVxDOH1fzJKkz00aPS1H1vNK2kWB
	PHM7NmAQ/VAoPZJrmxyeO71235WJL2dhbQLboAwF+KigZQWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt91mp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 13:49:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0bf2b3879so217977425ad.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775051389; x=1775656189; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pLcwugmveaGuc3b8rkj7O5lUNjS3ZVBSKuNHEhcgUvk=;
        b=R4qJdY3/SPXUBRI13/lXJuZrEhenLb53gY7eDN5+wILC1T29qnyNCTFXIR/acWWyaO
         E5ejLKKHCTFvdrb8RRpGLaFYmpK7IPCYxmZN7LugjODeXCJSjqnBleXwT/sysyFOaLyX
         4mnpFyu62CwahlA5Ex0wsGGRPjspYu4hk8t+R9qo5cNNurK0GFwSYLQpHrg/HmUbZV+e
         BeifY9Pt+ElVQ6JxLtNAZfS3eopvddUVB6sCRGN/BtJaVAMF03gqOLJE7tYX5tGpaEAW
         CJEbVpcgiLAuyYJHvp+xWAgsD6Sm/ROzUJC32An6TWS+bJwk4Zh4mgjtOHIGKp3oN4fm
         bQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051389; x=1775656189;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLcwugmveaGuc3b8rkj7O5lUNjS3ZVBSKuNHEhcgUvk=;
        b=ka8D/ejz6wi2uLAstGrzmb0rEUauocedqrwpiMQm2LrnFKYfuK2FxCaI/sjA2scI9S
         fyaFqhu1XLnSIeNyYTSRldVNHHh4pqwAZc8gLcN5SFDlkpqKvzkg3oeyNK22PFFWHsaI
         bTQp3S41jzZXLGXkmjle0K2eUkeEmKTddSOpfyBdiFBTMes7pS5K8APWQc36O8qUYfr3
         s6v8BwYu4EAyc6W/ImUsJKRioezM6z9W37Q7MEfRLqQKbUb1d+I7R4mEuBFrH8UV5TP4
         KcyWVOXm3dV86jjnxVed9CwukfPA1gTP/cHwmW2hsgyQCOOGt5jw9eqlZefyeHnv0hR/
         ySKw==
X-Gm-Message-State: AOJu0YzsHgW8IhwJYf9SBi1RIQP6n28JC7CV57TI/LvR4XATBTRhxnCL
	yClVHdWSc2rT4V7IQGrlMqyUrxg4sf0prSCf4hlgbNwZ91nZvNMrQgJk8K/PnV56Ldx1eJUOhhD
	3v+6YRGda2NrwDyNaz2xe9joZ0srBCwmYxZEpYZ+ypK3ZHJe4u72JN2ZYLeooIDaDyA==
X-Gm-Gg: ATEYQzwZPcp5wgiSrFyrhdCbhCsLcf7pLT7aPZpShrMhr/6eNSn+G4+aFxX60XZbPAY
	j66W6AnlvJi0+Y/CxQxDy8Zi3vAML+SvwnEKlx5x2E7nQYd1t4uFKm6/4rf0wcxZ+R98B+ZT7vv
	NsbQO90PD+Mstsu/ko2EwQuvxNn8P2S8rpu8AIiXlNkP4ClytAwWHJuVTzLz3Y9TzlrrEXq6m5O
	2YaEirUodGuoxtBDyvlSbk2FyxYLEQvCuy6lEgIxbv9hb0N7JlfI7aPmAiZmg0EWuxVrLwEAZP9
	OF43bP7g7BHcGRUPAox3A5rGmfQARJWDjeR3yj3N4mPUC7JQ53g4hmTanDgJmL1A+S5lmE9aCGz
	IlhoFoxFmQQpikhPcNFsk6kwoXyJ/oszCvUjM+4p+ch6aa3SRdJABrss=
X-Received: by 2002:a17:903:37cd:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b269cffdd9mr36809155ad.24.1775051388547;
        Wed, 01 Apr 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a17:903:37cd:b0:2ae:ced7:4650 with SMTP id d9443c01a7336-2b269cffdd9mr36808785ad.24.1775051388035;
        Wed, 01 Apr 2026 06:49:48 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642615sm146649295ad.11.2026.04.01.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:49:47 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 19:19:29 +0530
Subject: [PATCH v6] media: iris: add FPS calculation and VPP FW overhead in
 frequency formula
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-update_fps_calculation-v6-1-f44f8154ca39@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGgizWkC/43QTWrDMBAF4KsYreugf9lZ9R6lhJE0agRJ7Fi2a
 Qm+e6fOxouadjPwBs3HQw9WcMhY2LF6sAHnXHJ3o2BfKhbOcPvAOkfKTHJpueK6nvoII55SX04
 BLmG6wEgnddsguuQMd14wOu4HTPlzhd/en3nA+0T++FwyDwXr0F2veTxWyXCDrWuiAK61hOh9R
 N0ARtUE3ugYEWy0yH6scy5jN3ytnWexYn/Vm0Utao0IQTkFhuvXrpTDfaIn1OBAY5VnudXMriZ
 JQ+VNCMELqe2Opjaa3NcUaV5isEYnhzruaPp/miZNKCfp37g1Ke1oZqMpsasZ0iC1wgswCUzzi
 7YsyzdhuNpzRwIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775051384; l=6667;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=rW46XFPPp2C7fNwBbAzHJuh71JQi/lNqZu/462qrWPQ=;
 b=IZRCfGGxGVZHKaINWSGDHDMoqEA3eR/774HyA9SUmi7R3DGnF9Z/S4OVMbaQ6ryKH2YEiBgRJ
 pOF0s2//mDlAiv0wPtJ0EMI44b7REUolmoOBdwv4s/QlzFRgdYz7VXY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: Kz8w0cJooa-HKYBkeY11tLsHQPiyuNB9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyOCBTYWx0ZWRfX2ZeoiW8flqGI
 mUUpL4FVB1Hcs9CgnCWwOPqO3nn4PD7aIjmUCAxn6W4Jz+gjA4Y33GSaWpj1rusQMVute5V7Cjm
 DA0rqxs1x55ak/8Lus3Wjg9PXx5ribwMJhK1Hs1hWpXSNXk76+kAqBHxsHVF3UgNdIBu2Mkqwyy
 pHgPklNRtztOmfpnnXr3SRxZjD3RFUdBU/PsOl7Ya6xBzAdKSVWUBLeBY3rjtkN19BkwbwYnOTC
 KIJqd+Km0IEAQcDIEexxgV48AEkPIwyNai+E5jDq4OHa/6PdD9MUotjn+DDTPfs2e0JNiSlRu6/
 3byRUKJMMSnIxB5OxZuyiDuum4ZUyPC2Ugr4LhS5tldX2238G7EQtSswpUHy3KYExXBdS6cvyBY
 b42cdfPdRAnuPALpD2zxBM8PPgoSFBdV0PD2k8B9TbfyNvF6c1C/wY2KYarR57s///T/L4YnWwy
 AgXEgrkPa+nBGjX5iKA==
X-Proofpoint-ORIG-GUID: Kz8w0cJooa-HKYBkeY11tLsHQPiyuNB9
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd227d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4OJABYYT5sTn56tSQdkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010128
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
	TAGGED_FROM(0.00)[bounces-57884-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 0CA1C37BC80
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

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v6:
- Updated the vpu2 frequency calculation also to take the actual FPS
- Link to v5: https://lore.kernel.org/r/20260331-update_fps_calculation-v5-1-af91b1a5fa58@oss.qualcomm.com

Changes in v5:
- Added description for defined members in struct iris_inst (Bryan O'Donoghue)
- Link to v4: https://lore.kernel.org/r/20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com

Changes in v4:
- Renamed the variable names (Vikash Garodia)
- Updated the fps calculation logic (Vikash Garodia)
- Link to v3: https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com

Changes in v3:
- Updated the frame_count condition check (Vikash Garodia)
- Link to v2: https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com

Changes in v2:
- Replaced div_u64 with mult_frac (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
 drivers/media/platform/qcom/iris/iris_vdec.c       | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..63dd889c9992 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -67,6 +67,8 @@ struct iris_fmt {
  * @metadata_idx: index for metadata buffer
  * @codec: codec type
  * @last_buffer_dequeued: a flag to indicate that last buffer is sent by driver
+ * @last_buf_ns: start time of received input buffer for current one second FPS window
+ * @frame_counter: input buffer counter for current one second FPS window
  * @frame_rate: frame rate of current instance
  * @operating_rate: operating rate of current instance
  * @hfi_rc_type: rate control type
@@ -109,6 +111,8 @@ struct iris_inst {
 	u32				metadata_idx;
 	u32				codec;
 	bool				last_buffer_dequeued;
+	u64				last_buf_ns;
+	u32				frame_counter;
 	u32				frame_rate;
 	u32				operating_rate;
 	u32				hfi_rc_type;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..7fb45df37db6 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
+	inst->frame_rate = MAXIMUM_FPS;
 
 	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
 	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
@@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
 	if (ret)
 		return ret;
 
+	inst->frame_counter = 0;
+
 	return iris_process_streamon_input(inst);
 }
 
@@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 {
 	struct iris_buffer *buf = to_iris_buffer(vbuf);
 	struct vb2_buffer *vb2 = &vbuf->vb2_buf;
+	u64 cur_buf_ns, delta_ns;
 	struct vb2_queue *q;
 	int ret;
 
@@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		return 0;
 	}
 
+	if (buf->type == BUF_INPUT) {
+		cur_buf_ns = ktime_get_ns();
+
+		if (!inst->frame_counter)
+			inst->last_buf_ns = cur_buf_ns;
+
+		inst->frame_counter++;
+		delta_ns = cur_buf_ns - inst->last_buf_ns;
+
+		if (delta_ns >= NSEC_PER_SEC) {
+			inst->frame_rate = clamp_t(u32, inst->frame_counter, DEFAULT_FPS,
+						   MAXIMUM_FPS);
+			inst->frame_counter = 0;
+		}
+	}
+
 	iris_scale_power(inst);
 
 	return iris_queue_buffer(inst, buf);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 9c103a2e4e4e..73c201f4f338 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -18,7 +18,7 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
 	struct v4l2_format *inp_f = inst->fmt_src;
 	u32 mbs_per_second, mbpf, height, width;
 	unsigned long vpp_freq, vsp_freq;
-	u32 fps = DEFAULT_FPS;
+	u32 fps = inst->frame_rate;
 
 	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
 	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
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



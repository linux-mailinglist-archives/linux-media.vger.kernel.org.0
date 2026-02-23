Return-Path: <linux-media+bounces-53218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEqzDimonGk4JwQAu9opvQ
	(envelope-from <linux-media+bounces-53218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:19:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504A17C426
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07A01326E075
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037D136CDE8;
	Mon, 23 Feb 2026 19:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cd8dPuZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KM/gw3I/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E1E36CDE7
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873885; cv=none; b=PK/PIYDDo5srJcTFr/hWYBHFsgR/OA52Hjrs1jwHbEGNCHE/ofqfx76kcNSNemMWjM4C0wwrPxLJDOVW4V+d956QeICKSWpfRE8c+2JfZbpPvAQyc++JoqJGqhY4rqAL6HrjRe2+Dpmv51oLE9krs3OvNwA6KZsbH3VF+Jlsmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873885; c=relaxed/simple;
	bh=In824aYdTZtiBe3D/1mBer+pKP5XT1pFDVVL+e0V4wY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPMgVFceA6awPyexLk7UPG61AlmfNZ0quZbAUNQ2NlfOiXi0aCh0pKHKIGXcYs+ONrS9ZmtwE5N7sdLpOqKfwbwSmpIciJe1IR/5YdBN9oNJo9KufTHHuj5h8F1fKT8W/Og4jO9OkNmXjyrNrGjbV4Z5Pv/Fc0orLATXmMhE2BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cd8dPuZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KM/gw3I/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIpsHW3733258
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=; b=Cd8dPuZpje7fWAeT
	yxEByrcBsGi2F4lNVI3AN3QzaOy78t674wtLxB/yvNOdLIbP5svl4HTOc+hjxBT6
	WP4tuHywwZiyPjlRRGwSqZ/xUzE9XCLpU/sjFypeaRDyGBhWy4tMV2E3iJtWJ8tK
	UTl5hLEGABFHDUOSJ72j9YWqoickDpBkBDv0IU4Vh8NENuF1xG8W9uqvWhBa0gGE
	NJUfA7wnOujWFe4MNQSDPZlaHXrqoCMhzFMAlPOfWF8YQiFkfHkEzBAkODtZmuXI
	SmlGXBn6NmuKSOFi0npMihEmvAviMxO3p4/OlT2MHyAF8rJvs+VjFkwIPaV/Mqmj
	/EhmPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9mc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aadeb3dee4so384047675ad.2
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873882; x=1772478682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=;
        b=KM/gw3I/0jActEXwQ9xRFFDjsZKGtQvnEmDCrhQ+Rf0SkI0bK0ETo6p8x2D0/lRRXV
         /wWL2tNXKeIlv5bCxyNZW3YQb9op+0q2qQrVpvulhHYgwcn9PH+8kMUq+NXc8Q33vtnb
         BG5J3MJiBjbMnslz2IXsQTzXgQElIsQSSTR2ZPCUJbIzVwJIRg8Sgtyb+b1GilMuFKAf
         q8x0iVmMVu+tJM10/rgwAcVO/T9ppX77f/iUhhO4w12W4gbKEywbWsxkqHyLQfsdaBfl
         4TVMF7nvRb/R/d2pc8lxPEG5BLoXxwhhaORMM5HK/lFf0r1q36PRlOtYLA1Oi3/hXlFq
         VDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873882; x=1772478682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZaGUVE53+HTX2lkLB5p1TySzSvMtZiR+5hs3hFD9wg=;
        b=KGl2MRkGGyl7gkzvEAwnMzMq7nnNZOKDhf4UZ0/PcqLoRX/zdU6mOdFUU8VwcMKSVt
         mBhYpKrhreYhk032YQVDT14ockrzY1tFqFVwJy7vKeI3xidnKzK9Kio4G8XgH8/651QY
         sU/+b3hCfbDTsMJlRdFpNlVgIyZ3nRZ4vV222RP6CzCEmtIjVwDQIXVfGF6SrA+nd4jQ
         kXaVurDB9sqrg+eLgM1x4I6B7WTHJFLZeNoBZb+Fygc3OZjG/W9APU9wjXYRoWS5P6S6
         D7uDdNXHB3a3L9STco9bGY1Vbq4fxvDIw5wdotQ68Tz3AfY31BTkRB6CmRDD2a4xujDt
         TU0g==
X-Forwarded-Encrypted: i=1; AJvYcCV27YgcKz4aMVo81QXApLsqG0+0k9oLQHJGxdfmo9bVGbAHIzG6CKOsgjmTPEloqmDmXdLHbyds4T80rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6RaDdApxtZ8n0jT/YPqsAFKiyOk1uSfIbie/V0uzdNJGrSDO
	9q2qcmYXJWozMQnLTTbAHY/2oS3bZ7XoAXHjHz77MjqSsBhda8AVs8iEbw4vrLmaomOTxgiUeLc
	2/OfELoDIqTw65tCTefIsDDRqysBbluLlqJoOWhOcGqEcb4EPIPFsy5kSMZsxLuXj1Q==
X-Gm-Gg: ATEYQzzm91ZmUVAoY4Wqg7YcUOHFkCCmh9OJ3H80bOo2i19YuimdqPOD7JjJn85z0o1
	1NeQf9IA2a1iX3vCf/Ea7Xhs8vE5GWbwSYPk7YfFeciE7EqKHP4HVsCVQruh/pkZzF+1McoqyYP
	smXYHi8PCiJVwiNC0tjl/rHBiCit14nRC2CjsOoVqNuRlWjFlS2noyypx2l/RzZTSNz6as3OGqx
	BzXlkGVXI66uBKCW5MMYAFDG4gIq+02uJeszH9cb5NfKNASENlARwNFnHbSSM1Lry7VAtTcLOZi
	foVf0XWMsvEGeWhMTJ7j9v+O724lHrY5UxXqj92i4Yd0Qc1DJBP7mqUjl74/HU1Mtk3r4n/Fg4y
	OHiSmS+hzcBdsjLnIxlGggQZiLzV5yF15UBscBJfb7qZYjFinH6LlDg==
X-Received: by 2002:a17:902:ce0c:b0:2aa:d04b:73af with SMTP id d9443c01a7336-2ad744e0f51mr85545025ad.30.1771873881303;
        Mon, 23 Feb 2026 11:11:21 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2aa:d04b:73af with SMTP id d9443c01a7336-2ad744e0f51mr85544695ad.30.1771873880713;
        Mon, 23 Feb 2026 11:11:20 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:11:20 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:10 +0530
Subject: [PATCH RFC 16/18] accel/qda: Add FastRPC-based DSP memory mapping
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-16-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=17200;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=In824aYdTZtiBe3D/1mBer+pKP5XT1pFDVVL+e0V4wY=;
 b=4X9x+B3ZUgfatV9QCIxkEcWhNzkJJNPP5aWlq8gxklcmqruDEuqwEAGcBDXH+tT8om5k5Ab4I
 GyWBHirqRMnCCiAu7HVTDlFCVn/vGDp8b5GhSihOLsGdlv5FVVRi0/9
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699ca65a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rEPeaROu6cVHm8VQ6AkA:9 a=VNHnRFp1g_w2UU4Q:21
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JuAA5jzCe58JCaqTnotNbnl4-yzeLFmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX8uDqvUnxWcvo
 BJdes7YBOgLRETTzBcCe0Wqp2skhCfDEaFWafGT9M/wWXSVt3/DTDnRWFyoIZ1QH8ZNyEWMFGbl
 8N8svZ0ePP7tuV2xXXpGrgTmFqz9EKim6Xv4A40rIeTyXEekLSUjC3xsDuJEmuBpAUCDgSeK3LT
 FZCvgXG3nZA9eDlcYxHFO8cyR31eahOcg6LED4VCRtFwWqk1LTS35Fo3LIdOVufjYLz5QfHGZzs
 f1+1lB+vPEb6qibSlvID7xotgWTEpVpKq9KLte65GQKPidaLT6Axsa21Yl8B85OvMhayzbPlGdN
 q0MGIYBbCFvBFmfPkPKeTSg8kU3oqmqnrT1EpQoz7QYMOp0AyJaBNtfXkK+wZo4FHcmyNXC6t5V
 xlAliixDr4Q6q1KlZZa+Tvy9xf7dpeDQBs/2c66VYNK0crQkoDB3EnnRHAvkc0GSq4NFEIiLijs
 HYdo/UeZjPqWukzjKnA==
X-Proofpoint-ORIG-GUID: JuAA5jzCe58JCaqTnotNbnl4-yzeLFmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53218-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8504A17C426
X-Rspamd-Action: no action

Add a DRM_QDA_MAP ioctl and supporting FastRPC plumbing to map GEM
backed buffers into the DSP virtual address space. The new
qda_mem_map UAPI structure allows userspace to request legacy MMAP
style mappings or handle-based MEM_MAP mappings with attributes, and
encodes flags, offsets and optional virtual address hints that are
forwarded to the DSP.

On the FastRPC side new method identifiers FASTRPC_RMID_INIT_MMAP
and FASTRPC_RMID_INIT_MEM_MAP are introduced together with message
structures for map requests and responses. The fastrpc_prepare_args
path is extended to build the appropriate request headers, serialize
the physical page information derived from a GEM object into a
fastrpc_phy_page array and pack the arguments into the shared message
buffer used by the existing invoke infrastructure.

The qda_ioctl_mmap() handler dispatches mapping requests based on the
qda_mem_map request type, reusing the generic fastrpc_invoke()
machinery and the RPMsg transport to communicate with the DSP. This
provides the foundation for explicit buffer mapping into the DSP
address space for subsequent FastRPC calls, aligned with the
traditional FastRPC user space model.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig    |   2 +
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_fastrpc.c | 217 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  64 ++++++++++++
 drivers/accel/qda/qda_ioctl.c   |  24 +++++
 drivers/accel/qda/qda_ioctl.h   |  13 +++
 include/uapi/drm/qda_accel.h    |  44 +++++++-
 7 files changed, 364 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..e53a7984c9be 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1046,6 +1046,8 @@ CONFIG_DRM_TIDSS=m
 CONFIG_DRM_ZYNQMP_DPSUB=m
 CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_DRM_POWERVR=m
+CONFIG_DRM_ACCEL=y
+CONFIG_DRM_ACCEL_QDA=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 2b080d5d51c5..5f43c97ebc25 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -163,6 +163,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_CREATE, qda_ioctl_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_MAP, qda_ioctl_mmap, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
 };
 
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index f03dcf7e21e4..25b5d53ba2d6 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -487,6 +487,40 @@ int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static int  fastrpc_return_result_mem_map(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	rsp_msg = ctx->rsp;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	margs.vaddrout = rsp_msg->vaddrout;
+
+	err = copy_to_user_or_kernel(argp, &margs, sizeof(margs));
+	return err;
+}
+
+int fastrpc_return_result(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	int err = 0;
+
+	switch (ctx->type) {
+	case FASTRPC_RMID_INIT_MMAP:
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		err = fastrpc_return_result_mem_map(ctx, argp);
+		break;
+	default:
+		break;
+	}
+
+	return err;
+}
+
 static void setup_create_process_args(struct fastrpc_invoke_args *args,
 				      struct fastrpc_create_process_inbuf *inbuf,
 				      struct qda_init_create *init,
@@ -517,6 +551,29 @@ static void setup_create_process_args(struct fastrpc_invoke_args *args,
 	args[5].fd = -1;
 }
 
+static int setup_mmap_pages(struct drm_file *file_priv, int fd, struct fastrpc_phy_page *pages)
+{
+	struct drm_gem_object *gem_obj;
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+
+	if (fd <= 0) {
+		pages->addr = 0;
+		pages->size = 0;
+		return 0;
+	}
+
+	err = get_gem_obj_from_handle(file_priv, fd, &gem_obj);
+	if (err)
+		return err;
+
+	qda_gem_obj = to_qda_gem_obj(gem_obj);
+	setup_pages_from_gem_obj(qda_gem_obj, pages);
+
+	drm_gem_object_put(gem_obj);
+	return 0;
+}
+
 static int fastrpc_prepare_args_init_attach(struct fastrpc_invoke_context *ctx)
 {
 	struct fastrpc_invoke_args *args;
@@ -658,6 +715,160 @@ static int fastrpc_prepare_args_init_create(struct fastrpc_invoke_context *ctx,
 	return err;
 }
 
+static int fastrpc_prepare_args_map(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_invoke_args *args;
+	void *req, *rsp;
+	struct fastrpc_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	args = kzalloc_objs(*args, 3, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	req = kzalloc_obj(*req_msg, GFP_KERNEL);
+	if (!req) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+	req_msg = (struct fastrpc_map_req_msg *)req;
+
+	rsp = kzalloc_obj(*rsp_msg, GFP_KERNEL);
+	if (!rsp) {
+		err = -ENOMEM;
+		goto err_free_req;
+	}
+	rsp_msg = (struct fastrpc_map_rsp_msg *)rsp;
+
+	ctx->input_pages = kzalloc_objs(*ctx->input_pages, 1, GFP_KERNEL);
+	if (!ctx->input_pages) {
+		err = -ENOMEM;
+		goto err_free_rsp;
+	}
+
+	req_msg->client_id = ctx->client_id;
+	req_msg->flags = margs.flags;
+	req_msg->vaddr = margs.vaddrin;
+	req_msg->num = sizeof(*ctx->input_pages);
+
+	args[0].ptr = (u64)(uintptr_t)req;
+	args[0].length = sizeof(*req_msg);
+
+	err = setup_mmap_pages(ctx->file_priv, margs.fd, ctx->input_pages);
+	if (err)
+		goto err_free_input_pages;
+
+	args[1].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[1].length = sizeof(*ctx->input_pages);
+
+	args[2].ptr = (u64)(uintptr_t)rsp;
+	args[2].length = sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ctx->args = args;
+	ctx->req = req;
+	ctx->rsp = rsp;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+
+err_free_input_pages:
+	kfree(ctx->input_pages);
+	ctx->input_pages = NULL;
+err_free_rsp:
+	kfree(rsp);
+err_free_req:
+	kfree(req);
+err_free_args:
+	kfree(args);
+	return err;
+}
+
+static int fastrpc_prepare_args_mem_map_attr(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct qda_mem_map margs;
+	struct fastrpc_invoke_args *args;
+	void *req, *rsp;
+	struct fastrpc_mem_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	int err;
+
+	err = copy_from_user_or_kernel(&margs, argp, sizeof(margs));
+	if (err)
+		return err;
+
+	args = kzalloc_objs(*args, 4, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	req = kzalloc_obj(*req_msg, GFP_KERNEL);
+	if (!req) {
+		kfree(args);
+		return -ENOMEM;
+	}
+	req_msg = (struct fastrpc_mem_map_req_msg *)req;
+
+	rsp = kzalloc_obj(*rsp_msg, GFP_KERNEL);
+	if (!rsp) {
+		kfree(args);
+		kfree(req);
+		return -ENOMEM;
+	}
+	rsp_msg = (struct fastrpc_map_rsp_msg *)rsp;
+
+	ctx->input_pages = kzalloc_objs(*ctx->input_pages, 1, GFP_KERNEL);
+	if (!ctx->input_pages) {
+		kfree(args);
+		kfree(req);
+		kfree(rsp);
+		return -ENOMEM;
+	}
+
+	req_msg->client_id = ctx->client_id;
+	req_msg->fd = margs.fd;
+	req_msg->offset = margs.offset;
+	req_msg->flags = margs.flags;
+	req_msg->vaddrin = margs.vaddrin;
+	req_msg->num = sizeof(*ctx->input_pages);
+	req_msg->data_len = 0;
+
+	args[0].ptr = (u64)(uintptr_t)req;
+	args[0].length = sizeof(*req_msg);
+
+	err = setup_mmap_pages(ctx->file_priv, margs.fd, ctx->input_pages);
+	if (err) {
+		kfree(args);
+		kfree(req);
+		kfree(rsp);
+		kfree(ctx->input_pages);
+		ctx->input_pages = NULL;
+		return err;
+	}
+
+	args[1].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[1].length = sizeof(*ctx->input_pages);
+
+	args[2].ptr = (u64)(uintptr_t)ctx->input_pages;
+	args[2].length = 0;
+
+	args[3].ptr = (u64)(uintptr_t)rsp;
+	args[3].length = sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ctx->args = args;
+	ctx->req = req;
+	ctx->rsp = rsp;
+	ctx->handle = FASTRPC_INIT_HANDLE;
+
+	return 0;
+}
+
 int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	int err;
@@ -678,6 +889,12 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 		ctx->pd = USER_PD;
 		err = fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case FASTRPC_RMID_INIT_MMAP:
+		err = fastrpc_prepare_args_map(ctx, argp);
+		break;
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		err = fastrpc_prepare_args_mem_map_attr(ctx, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index a8deb7efec86..b45ccc77d9d1 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -260,8 +260,10 @@ struct fastrpc_invoke_context {
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
+#define FASTRPC_RMID_INIT_MMAP		4	/* Map memory region to DSP */
 #define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
+#define FASTRPC_RMID_INIT_MEM_MAP	10	/* Map DMA buffer with attributes to DSP */
 #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
@@ -276,6 +278,59 @@ struct fastrpc_invoke_context {
 /* Maximum initialization file size (4MB) */
 #define INIT_FILELEN_MAX		(4 * 1024 * 1024)
 
+/* Message structures for internal FastRPC calls */
+
+/**
+ * struct fastrpc_mem_map_req_msg - Memory map request message with attributes
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer with custom attributes (ATTR request).
+ */
+struct fastrpc_mem_map_req_msg {
+	/* Client identifier for the session */
+	s32 client_id;
+	/* Handle of the buffer */
+	s32 fd;
+	/* Offset within the buffer */
+	s32 offset;
+	/* Mapping flags */
+	u32 flags;
+	/* Virtual address hint for mapping */
+	u64 vaddrin;
+	/* Pages in the mapping */
+	s32 num;
+	/* Length of additional data */
+	s32 data_len;
+};
+
+/**
+ * struct fastrpc_map_req_msg - Legacy memory map request message
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer into the DSP's virtual address space.
+ */
+struct fastrpc_map_req_msg {
+	/* Client identifier for the session */
+	s32 client_id;
+	/* Mapping flags */
+	u32 flags;
+	/* Virtual address hint for mapping */
+	u64 vaddr;
+	/* Pages in the mapping */
+	s32 num;
+};
+
+/**
+ * struct fastrpc_map_rsp_msg - Memory map response message
+ *
+ * This message structure is returned by the DSP after successfully
+ * mapping a buffer, providing the virtual address for future access.
+ */
+struct fastrpc_map_rsp_msg {
+	/* DSP virtual address assigned to the mapped buffer */
+	u64 vaddrout;
+};
+
 /**
  * fastrpc_context_free - Free an invocation context
  * @ref: Reference counter for the context
@@ -332,4 +387,13 @@ int fastrpc_internal_invoke_pack(struct fastrpc_invoke_context *ctx, struct qda_
  */
 int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
 
+/**
+ * fastrpc_return_result - Return invocation result to user-space
+ * @ctx: FastRPC invocation context
+ * @argp: User-space pointer to return result
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int fastrpc_return_result(struct fastrpc_invoke_context *ctx, char __user *argp);
+
 #endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 477112ad6664..4eb932e2c9ae 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -192,6 +192,10 @@ static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
 	if (err)
 		goto err_context_free;
 
+	err = fastrpc_return_result(ctx, (char __user *)data);
+	if (err)
+		goto err_context_free;
+
 err_context_free:
 	if (type == FASTRPC_RMID_INIT_RELEASE && qda_user->init_mem_gem_obj) {
 		drm_gem_object_put(&qda_user->init_mem_gem_obj->base);
@@ -223,3 +227,23 @@ int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_p
 {
 	return fastrpc_invoke(FASTRPC_RMID_INIT_CREATE, dev, data, file_priv);
 }
+
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qda_mem_map *map_req;
+
+	if (!data)
+		return -EINVAL;
+
+	map_req = (struct qda_mem_map *)data;
+
+	switch (map_req->request) {
+	case QDA_MAP_REQUEST_LEGACY:
+		return fastrpc_invoke(FASTRPC_RMID_INIT_MMAP, dev, data, file_priv);
+	case QDA_MAP_REQUEST_ATTR:
+		return fastrpc_invoke(FASTRPC_RMID_INIT_MEM_MAP, dev, data, file_priv);
+	default:
+		qda_err(NULL, "Invalid map request type: %u\n", map_req->request);
+		return -EINVAL;
+	}
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 181ed50b19dc..d402d6715b41 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -89,4 +89,17 @@ int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_p
  */
 int qda_ioctl_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_mmap - Map memory to DSP address space
+ * @dev: DRM device structure
+ * @data: User-space data containing memory mapping parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler maps a DMA buffer into the DSP's virtual address
+ * space, enabling the DSP to access the buffer during remote calls.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 2b7f500db52c..9151ba7adfaf 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -23,7 +23,8 @@ extern "C" {
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
 #define DRM_QDA_INIT_ATTACH		0x03
 #define DRM_QDA_INIT_CREATE		0x04
-/* Indexes 0x05-0x06 are reserved for other requests */
+#define DRM_QDA_MAP			0x05
+/* 0x06 is reserved for other request */
 #define DRM_QDA_INVOKE			0x07
 
 /*
@@ -41,9 +42,14 @@ extern "C" {
 #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
 #define DRM_IOCTL_QDA_INIT_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INIT_CREATE, \
 						 struct qda_init_create)
+#define DRM_IOCTL_QDA_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_MAP, struct qda_mem_map)
 #define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
 						 struct qda_invoke_args)
 
+/* Request type definitions for qda_mem_map */
+#define QDA_MAP_REQUEST_LEGACY    1  /* Legacy MMAP operation */
+#define QDA_MAP_REQUEST_ATTR      2  /* Handle-based MEM_MAP operation with attributes */
+
 /**
  * struct drm_qda_query - Device information query structure
  * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
@@ -143,6 +149,42 @@ struct qda_init_create {
 	__u64 file;
 };
 
+/**
+ * struct qda_mem_map - Memory mapping request structure
+ * @request: Request type (QDA_MAP_REQUEST_LEGACY or QDA_MAP_REQUEST_ATTR)
+ * @flags: Mapping flags for DSP (cache attributes, permissions)
+ * @fd: Handle of the buffer to map
+ * @attrs: Mapping attributes (used for ATTR request)
+ * @offset: Offset within buffer (used for ATTR request)
+ * @reserved: Reserved for alignment/future use
+ * @vaddrin: Optional virtual address hint for mapping
+ * @size: Size of the memory region to map in bytes
+ * @vaddrout: Output DSP virtual address after successful mapping
+ *
+ * This structure is used to request mapping of a DMA buffer into the
+ * DSP's virtual address space. The DSP will map the buffer according
+ * to the specified flags and return the virtual address in vaddrout.
+ *
+ * For QDA_MAP_REQUEST_LEGACY (value 1):
+ *   - Uses fields: fd, flags, vaddrin, size, vaddrout
+ *   - Legacy MMAP operation for backward compatibility
+ *
+ * For QDA_MAP_REQUEST_ATTR (value 2):
+ *   - Uses all fields including attrs and offset
+ *   - FD-based MEM_MAP operation with custom SMMU attributes
+ */
+struct qda_mem_map {
+	__u32 request;
+	__u32 flags;
+	__s32 fd;
+	__u32 attrs;
+	__u32 offset;
+	__u32 reserved;
+	__u64 vaddrin;
+	__u64 size;
+	__u64 vaddrout;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1



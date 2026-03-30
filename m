Return-Path: <linux-media+bounces-57559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIgzLYgwymkA6AUAu9opvQ
	(envelope-from <linux-media+bounces-57559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:12:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93282356F16
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5A61300D4FE
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 08:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE483AEF2F;
	Mon, 30 Mar 2026 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="h76td7zj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7A3ACA5E;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858340; cv=none; b=RGW+rsF/YAx4BkXb0DZQNsSCje0PlfiNdDlKBeUIQaZHg2NY1mfb9VSsgBb4QzrAVHcgsMeYG89KPpzmt/pz8qTr+Bel/Xa0qy9mJdfSG2Ni7jOtfQeMZbm7pazXBYFlJA7pJpwb+9Ef7XygELCUllNkMBBqqZPdx3fJBurgGU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858340; c=relaxed/simple;
	bh=lvp5iBbzvk/kDvWmLdotGafwfMUI49hfQihjvGfgTLU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=biuhCeecnDZK38DTMncXe4eZ+BVtqGaSLkWtxlkmbWmax2oEvyMLvNIgD3YlK6IymxesCzvc2czevCYYDzNZaBvmlBfF30zsM9UgpkJrn2vBZHc9qIpI1EWASp81hsCKjPVM3uRyLIifzclKa2f5P+LZmxPGRuUnEBqJFqQVaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=h76td7zj; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTh174202;
	Mon, 30 Mar 2026 08:57:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=yB9+piC1EbFFmqnHwBkOC6n
	/Sqlzu3GE4ZlF3exkrdY=; b=h76td7zj/zSY2UDxFeki1uFVUcE2HGcbpHYBq7V
	YNmMk22sE6liVCUMS09pd8NQHSWmYlF5Tr/UpS+IvKycQx+EPgzOmG4od4ShhvLG
	73m2cZIfH+fbhsXJw3oUQ0hfw+dTb4Ne80GRBdx9jyhvsbzQzOVql5oUyBCcJS6v
	LeJlNQWyOI/4DEJVGx4AhdjjG/TfAC0/XclpbUJ6ZTDTUqQkazPyz4vI7rmMCCR4
	5lNOr/+R9mHw7E+fXXIhihGzj9cmnNjgJExAeyGi2RQyLWHHb3IxQF7x12dwGtm5
	WXWeaEJ2ZLpX2a3kIWfasrVMp9Oi6fSv80hwxcOVPAOLP5w==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:56:59 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:56:58 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Subject: [PATCH 0/8] drm/imagination: Job submission fixes and cleanup
Date: Mon, 30 Mar 2026 08:56:35 +0100
Message-ID: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALMsymkC/x3MQQqDMBBG4avIrB1IDEjjVUoXmv5tRzSRDIog3
 t3U5YOPd5AiC5S66qCMTVRSLGHrisKvj1+wvEtTY5rWOGd4TAPrOsyif8of2aEcJvRxXfjhYKz
 1bXDwVBZLxg3K4fk6zwt1XWMSbgAAAA==
X-Change-ID: 20260330-job-submission-fixes-cleanup-83e01196c3e9
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        "Alexandru Dadu" <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=1503;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=lvp5iBbzvk/kDvWmLdotGafwfMUI49hfQihjvGfgTLU=;
 b=VGZPMAS4hkE4GC9hYhC8/xEU5F9LFtJ8ZwfebEbOLQmhwCc88L4uCUMLRrmPMvvQA/pkti3ca
 +dT8kmmmsL5DscZxqg/XaRQ/VWxU6NcNAh67s2Ad0VvqTSxpXVSiRBR
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfX0ySgs+hjmKeN
 KolZrrA+f8K6/29OTFWBfXp2mCadMBoSENzOJ279EAdbhX4VkaZFhKByF2beDbGC7a8d2zv8P6d
 GF1xL5qjIBHLXl7xRIsrVPutJleNNPhWGzCDlWwjhijPnOHsu3+D8qEJvETqYIDqI3qAgkKsCJ1
 UJRrLHPZKrpbz/fpZUgpgQz/esWKGvEMEwJM6QhytSFbN5pV24kJExL1i9j7u5vFlkWpm6LV6L7
 MkigWGK+lOpC7y7xoP7NScpsxWO+lpaU2cNjRCywlQZOkzoWjKz1Ou0KyIn51mIkF85L/SxZJqP
 7+TdowoA1Hm8dvRHTFZqMa0OAqxo22J0iOYugOTJjLw8bHokcq03QkELuBEF0ysKPJlyqRotbQa
 ZHIz7Xkr1W/qnnIMCk1rAZt5Ygn5PtUHbzWQaTPUX/FJS0jbWDzWdB92vbeUFWa4BKPWZxrQKFr
 DpkX4zCE5TIhWFheDiw==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2ccb cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=2L_qYD7-lHZGDKFFxjgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: KOu9Qe8EYfkSAtSHH-TDDW2t0QAW90TX
X-Proofpoint-ORIG-GUID: KOu9Qe8EYfkSAtSHH-TDDW2t0QAW90TX
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57559-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[imgtec.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessio.belle@imgtec.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,imgtec.com:dkim,imgtec.com:email,imgtec.com:mid]
X-Rspamd-Queue-Id: 93282356F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The first two commits fix rare bugs and should be backported to stable
branches.

The rest is an attempt to cleanup and document the code to make it
a bit easier to understand.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
Alessio Belle (8):
      drm/imagination: Count paired job fence as dependency in prepare_job()
      drm/imagination: Fit paired fragment job in the correct CCCB
      drm/imagination: Skip check on paired job fence during job submission
      drm/imagination: Rename pvr_queue_fence_is_ufo_backed() to reflect usage
      drm/imagination: Rename fence returned by pvr_queue_job_arm()
      drm/imagination: Move repeated job fence check to its own function
      drm/imagination: Update check to skip prepare_job() for fragment jobs
      drm/imagination: Minor improvements to job submission code documentation

 drivers/gpu/drm/imagination/pvr_job.c              |   8 +-
 drivers/gpu/drm/imagination/pvr_queue.c            | 154 +++++++++++++--------
 drivers/gpu/drm/imagination/pvr_queue.h            |   2 +-
 .../gpu/drm/imagination/pvr_rogue_fwif_shared.h    |  10 +-
 drivers/gpu/drm/imagination/pvr_sync.c             |   8 +-
 drivers/gpu/drm/imagination/pvr_sync.h             |   2 +-
 6 files changed, 110 insertions(+), 74 deletions(-)
---
base-commit: 3bce3fdd1ff2ba242f76ab66659fff27207299f1
change-id: 20260330-job-submission-fixes-cleanup-83e01196c3e9

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>



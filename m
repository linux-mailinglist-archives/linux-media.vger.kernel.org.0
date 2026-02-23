Return-Path: <linux-media+bounces-53213-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKX5D4GpnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53213-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:24:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D217C549
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0FD3078E9B
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B178F36C0B7;
	Mon, 23 Feb 2026 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqkqPx5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Db5kqOOr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57336C0AF
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873847; cv=none; b=NiYIL6JZFyj9aTYPfFrmVeKBjoqnPgZz9o39VCQQMjsowKFUlGKK0yZB/GcozmAMWVYbAO32RQ214VG/U6vg7dsSqcfRqbqOLpA9UccrDvYj4vjWeA0ChNn27N4bq7sw1I8IWxM2U2WiY3oMTCjNzh1DNU/Mq3UIvfnPEDYUiiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873847; c=relaxed/simple;
	bh=2RxOxXc9zqZvtJxNIuKIxSb9BnPuUuUrWmkgeMbTfW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRtudINRkv1Z/ffOktZWUxGNCfvYKX66NFocDpadmEi5rYatO8uf1/9KihA1OrLEi2x4A9ektx9Amqw3305X2WHXfRyekvsB3gMxRx62/HIR6qa/iinH7BukNywB/v+LgWa9Ofqz5A6ba5jzc/6RyKNcgAhK23XXrOIaMUkO0z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqkqPx5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Db5kqOOr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIeYxE3409241
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=; b=OqkqPx5DajaGaPNQ
	9oi4JyZMGMa3uC/V148Ftz8x1qGnU5jAn3Hp0OyelszklsQjRnTYsvyORjcrM5J9
	kM2n5nqoKGR3lemZUd6RdrKRRqFvGW+Q1Ht3tEGVxFO/2U6dEhXf8cn5HZ2X3kXl
	Kkizh3UFar+DJHRqvmO0AMqAGaxwp0V1dX2VUyrwQCIw/4H0tBsl02lEtqFDdgtC
	VthsA6QRlGvoQIhZwQfqW6jdByd9tRb8EMbf3I8v1Q5yINNnEVDs5ZwLyY9LMi9G
	O4Oz+2umASGPUZxESnS87u4K/HjCdhLsQ3y9P+KMc0qpOIZj+mZGE2SJvRACwM8/
	zPRv3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tsk6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so70505625ad.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873844; x=1772478644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=;
        b=Db5kqOOrd/Znhv4UKI+9uL/GrxgeJ8jbj2OwzvoVzJXrMGCGjyZRsBSPDbBLJ7W9eS
         rMh/dt8ox2z8O1N0Ik9bH7oIhRQ/Zv7CH5A4BgWnwHQcZsRDpDoL7bPZIdL1cFaZE3m2
         HtLq+tMldw+uBo6DjEhQCb4+JMHpMMa1t9MDF416ml8me96e3nK1Yp3lYp4OchMzEsZG
         UHx38XYBvkXz7VfX5FGNAFhRrfRFm5t4Iw5qS26nacAIQHMZgfuK7lCDfnyP3oLy6iXf
         eIKziCkvyu9dYi7fqsZB4Pay0MzpxzZf3CWEtIXQPpYKZrHG8NzMJpaGbvN9mVhcXrkW
         ET1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873844; x=1772478644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cEndrH++ZoozGxCle7RcLV8UVr6wjbisoptDK/+Xp8=;
        b=TLbrCTDR+0xgiBcjHbrZ5TluEbmk11X0jZBO0+tATb8GsseDYdeexE2ojJ4GdQng+i
         UHo3nr4iezRJS1GDjqrNsq4yAgvjc+CAa4CZlZ/RkkMFHRHuwf6u1z11Eg4tVQuBVY2A
         mA5cGjuK13/eT9qSDM/Sx3upXi+KXOnLjcarr7oAHA2Bs7Ze5ZCi2p5jWYHoIV31gF9s
         j/L6XUJm2gGLHMDdQQw7VSQbBumtPA0NnfPISccjBarwMS8jiLN0zRHIYOnXE9LauYf4
         qoZBVN7RWAkc1xGLKKZEJVTXGnQT4vFp+CJLBEfUkYS+CufWtM003GjyCmPzWRVZwGzm
         IXGw==
X-Forwarded-Encrypted: i=1; AJvYcCXCM52z5wZZZuPaN6VNixmZg6qWNq+IewJIwZIPb+dLeBJgZe/cvjRmZKApDCf4ad6moEQRA5SbVnNF+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQtVleGbJVIX18TalDi//Oc0k9suxatnEGHXS1aGLyJjXvYvM
	c/TjUg3pX57w6L65E4Ts5OcSg/oKhy8GDWRzaxC4rG9R0OBUNRlkUFtzPc0booEowsVcQp1SXr1
	zX2LKOxSI4pxUHSh+LrTT+zKhCzhH0IDw6xvJpAHsGIqws9ZI/wr/Ad8gVntcx94S8g==
X-Gm-Gg: ATEYQzw2sETlzQ0OtXbv7ZS4TqVISTFLFN7G4I8Y3NhiOVCwpe+0FTg0MI0qJMV3otC
	k/shVdtITXnjrrx6lJKHQkIR0nf1dQtah5bYaNS3jUdGA71LLE2+XN6eb/3wdBmauXH7yNAinL1
	FXctwWAJvGKzWqhpC6ngmRzV1wtaa6o+5xolGhVU2DBGyQVsa67omEnk9bFF6jKsQwxt5gIjzRa
	ocD2XtVcDPnejcD5fjPhpi71N5cFCmh+uuM+hHGP/liJaMbjEoLOe8+73Ag14Zn5VES/qKrqTwg
	fqxt7US7gqAwAX36vtw8z6ckl9gm9aLTHxviianTg6pTbbNBGgXKf0M9GjYCpGxqQsejnzvwKZC
	ttgWn/J3m5h9/A5qIVNZIP1+SioxRVxYadvhM1eeXZczqY07QOcqbYQ==
X-Received: by 2002:a17:903:1107:b0:2a9:320d:285e with SMTP id d9443c01a7336-2ad5f7b8baamr123910525ad.27.1771873844286;
        Mon, 23 Feb 2026 11:10:44 -0800 (PST)
X-Received: by 2002:a17:903:1107:b0:2a9:320d:285e with SMTP id d9443c01a7336-2ad5f7b8baamr123910275ad.27.1771873843731;
        Mon, 23 Feb 2026 11:10:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:10:43 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:05 +0530
Subject: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6899;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=2RxOxXc9zqZvtJxNIuKIxSb9BnPuUuUrWmkgeMbTfW8=;
 b=OdNLCIrevKeJOr4Sn7iJQ7EA64taPtlHsqOdk0FAznWQBx7+UrSyEBkaxLabf/n4ZADVR797g
 gmHDCtzQkxDCDFwH4r3tYY2PYPpjtmNKwQNMzhCaFXo/sq/VV+FDLok
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699ca635 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mxALtX23GHkpHf8IwecA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9pHRyMejQNopEFAs7BP0LQaX-Bh-wtvG
X-Proofpoint-GUID: 9pHRyMejQNopEFAs7BP0LQaX-Bh-wtvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX+dlut9EeZHu5
 JKvob4gUeDDIb8+MzT3Tff/p553ugr1d+DLlW1OezzMpCABqJUQvxqcRaR52ejZvUsh0qIxmNdv
 V6mTSPcpPhW15V5Zfcq0ivqE5f4FEdjo8ABTphW2LFDPTWBD8HwWGeEMBX869+09vpizpwo8m3Q
 DaX4K3gVDbny0PbHLbooTlt3ipIEIlOVe3nDqNCdww6614e7H4WsfnSIsN4kfGn2XpgJEjKnpfw
 kxn9M4IsZi1fdp57Xyv483jEkbrJn3h6aXbzeyaEHRHHK3NgQcD0rdeNxFGK9HJc28JJTKCtYLg
 VU7LZuTH2S4FoMKfLT5FczJUnaZ8Nat8wGKuC28eMRBQpfmnk1K8t8sSK43x3AAZpuSNhcT7B66
 /64iR9NCiCDGfU+mMSNsGObt+AYj+gdaNzPaym4DMSRW502gsKRzOp28iFm2dAlZTN5glN7aSu2
 Ll0PLsXtXZ2+b+JKRYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53213-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 967D217C549
X-Rspamd-Action: no action

Add two GEM-related IOCTLs for the QDA accelerator driver and hook
them into the DRM accel driver. DRM_IOCTL_QDA_GEM_CREATE allocates
a DMA-backed GEM buffer object via qda_gem_create_object() and
returns a GEM handle to userspace, while
DRM_IOCTL_QDA_GEM_MMAP_OFFSET returns a valid mmap offset for a
given GEM handle using drm_gem_create_mmap_offset() and the
vma_node in the GEM object.

The QDA driver is updated to advertise DRIVER_GEM in its
driver_features, and the new IOCTLs are wired through the QDA
GEM and memory-manager backend. These IOCTLs allow userspace to
allocate buffers and map them into its address space as a first
step toward full compute buffer management and integration with
DSP workloads.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c   |  5 ++++-
 drivers/accel/qda/qda_gem.h   | 30 ++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
 include/uapi/drm/qda_accel.h  | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 19798359b14e..0dd0e2bb2c0f 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -12,6 +12,7 @@
 #include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_gem.h"
 #include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
@@ -154,10 +155,12 @@ DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 };
 
 static struct drm_driver qda_drm_driver = {
-	.driver_features = DRIVER_COMPUTE_ACCEL,
+	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
 	.open			= qda_open,
 	.postclose		= qda_postclose,
diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
index caae9cda5363..cbd5d0a58fa4 100644
--- a/drivers/accel/qda/qda_gem.h
+++ b/drivers/accel/qda/qda_gem.h
@@ -47,6 +47,36 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
 void qda_gem_free_object(struct drm_gem_object *gem_obj);
 int qda_gem_mmap_obj(struct drm_gem_object *gem_obj, struct vm_area_struct *vma);
 
+/*
+ * GEM IOCTL handlers
+ */
+
+/**
+ * qda_ioctl_gem_create - Create a GEM buffer object
+ * @dev: DRM device structure
+ * @data: User-space data containing buffer creation parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler creates a new GEM buffer object with the specified
+ * size and returns a handle to the created buffer.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+/**
+ * qda_ioctl_gem_mmap_offset - Get mmap offset for a GEM buffer object
+ * @dev: DRM device structure
+ * @data: User-space data containing buffer handle and offset result
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler retrieves the mmap offset for a GEM buffer object,
+ * which can be used to map the buffer into user-space memory.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 /*
  * Helper functions for GEM object allocation and cleanup
  * These are used internally and by the PRIME import code
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 9fa73ec2dfce..ef3c9c691cb7 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -43,3 +43,38 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
 
 	return 0;
 }
+
+int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_create *args = data;
+	struct drm_gem_object *gem_obj;
+	struct qda_drm_priv *drm_priv;
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv || !drm_priv->iommu_mgr)
+		return -EINVAL;
+
+	gem_obj = qda_gem_create_object(dev, drm_priv->iommu_mgr, args->size, file_priv);
+	if (IS_ERR(gem_obj))
+		return PTR_ERR(gem_obj);
+
+	return qda_gem_create_handle(file_priv, gem_obj, &args->handle);
+}
+
+int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_gem_mmap_offset *args = data;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	gem_obj = qda_gem_lookup_object(file_priv, args->handle);
+	if (IS_ERR(gem_obj))
+		return PTR_ERR(gem_obj);
+
+	ret = drm_gem_create_mmap_offset(gem_obj);
+	if (ret == 0)
+		args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+
+	drm_gem_object_put(gem_obj);
+	return ret;
+}
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 0aad791c4832..ed24a7f5637e 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -19,6 +19,8 @@ extern "C" {
  * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
  */
 #define DRM_QDA_QUERY	0x00
+#define DRM_QDA_GEM_CREATE		0x01
+#define DRM_QDA_GEM_MMAP_OFFSET	0x02
 /*
  * QDA IOCTL definitions
  *
@@ -27,6 +29,10 @@ extern "C" {
  * data structure and direction (read/write) for each IOCTL.
  */
 #define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
+#define DRM_IOCTL_QDA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_CREATE, \
+						 struct drm_qda_gem_create)
+#define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
+						 struct drm_qda_gem_mmap_offset)
 
 /**
  * struct drm_qda_query - Device information query structure
@@ -40,6 +46,36 @@ struct drm_qda_query {
 	__u8 dsp_name[16];
 };
 
+/**
+ * struct drm_qda_gem_create - GEM buffer object creation parameters
+ * @size: Size of the GEM object to create in bytes (input)
+ * @handle: Allocated GEM handle (output)
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_CREATE to allocate
+ * a new GEM buffer object.
+ */
+struct drm_qda_gem_create {
+	__u32 handle;
+	__u32 pad;
+	__u64 size;
+};
+
+/**
+ * struct drm_qda_gem_mmap_offset - GEM object mmap offset query
+ * @handle: GEM handle (input)
+ * @pad: Padding for 64-bit alignment
+ * @offset: mmap offset for the GEM object (output)
+ *
+ * This structure is used with DRM_IOCTL_QDA_GEM_MMAP_OFFSET to retrieve
+ * the mmap offset that can be used with mmap() to map the GEM object into
+ * user space.
+ */
+struct drm_qda_gem_mmap_offset {
+	__u32 handle;
+	__u32 pad;
+	__u64 offset;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1



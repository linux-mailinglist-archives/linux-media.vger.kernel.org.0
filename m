Return-Path: <linux-media+bounces-53210-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFyVFW6nnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53210-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:15:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C741617C2DD
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E70D313021A
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C7436C0D5;
	Mon, 23 Feb 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWUZysgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2A8i7xp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7736AB60
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873824; cv=none; b=YHXe+HMrCuTHLiHjAkDpBK/JnvwmHHYTwS7rYPqDcnPo0vC1cv6pgo10ahh+1J4U7eNC6QQ52P1lM0doxPpzoMT/visLkT5fRsbx1tpIgrFBqP1Wa1r6SC2ka8YVT9pZV2IU9TeFZvGa7jwh/7sQMPFUKFpXg+PvfN2ocfKjSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873824; c=relaxed/simple;
	bh=6EHrB7O8xO1KO3JeXaSJmhEvz4UF48aY+wHefteIn5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDVxgQqUFzoOgAKGdV/KBvNTgOt7NfUD23nCNL3beQn7UIlJ00qhlTjg7gGLzM7Ksnufn79bePh2G5VT9xxFO8IeAjYGs9qGiWEhHA+AO+1ARBXSi1CfHsIZ2hL5UTlo9Z7m+IDliXFZ/0yRNbTFBlS0e0C1pEWISh6fT8QMT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWUZysgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2A8i7xp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NITRTr561293
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=; b=mWUZysgpZBnQX/2G
	wuG7JAfjNH9xkMP2RD774Ch7eQXXEEW6DfNmwI/9kicOHEhE19zCZxZmUcBH7R+I
	9/NK0RB+ZeuScc97Z/gXQLpe6J0bI2VTyxZbvCLyjQ0uB+SRcmH5Lub7h/CMjK7E
	Ys43tdgyPA0x89FJOtZJr2VQNIjcj0s6jBlNrfRtlxnzVtfc0lglwOQA8uFgggJF
	4XFg/0kBYW52B3t/sjYGv1wnZZnX5wgZUQrkUerqMNNTknAyy0Nr1/qJwo0/uIpi
	N7/lr9IgLGiqdxcPUqkWSaNUCc/qA4KwA/wuZqAUgB2s0yaz/HQehzulI6Y8jxld
	+g+sgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r9jy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so51018445ad.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873822; x=1772478622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=;
        b=X2A8i7xpNCdeLWYFFbsp3wH8qpTyfv/IP2ZLLTAazJE/TDOGTfORjULMwBcjd+ld+Z
         aT+9/1YAzR5ElzAhV6uPj3azEnwkUPf95vjdeRtuBcoNDnFqjsFmh58of2p8Njz7hDEk
         lcfgYKogeg7YQSYrHYl1plffXGHab8m6Z0RrFpf6BiMbbUohejazkv21yHT4Ngj/JZeJ
         Kymanyx+sqJy9qokXq03i+AO9mauIi3qPN/fWv0/5CrALb0EqwIaSdOh232/0IU0scgR
         3DuZGkcBAqCuwPOwQVQMxBpVgnxITnkgC5G0tvCoA4iSj57pwoDG/7FijTF708MQmnGJ
         ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873822; x=1772478622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGtqCA2sSEGVBfxM2+pOtYGJuWhGvcLCkjQcUGRaoOk=;
        b=npeJsHWIBaSNMu+LI+Pyh7e0ziCwva+TYhZlxpYUn4yYNXlgrA8mm0RnbrQwCweRy3
         mtPdPfHLTavto2XS+jTCaE/26FsYxS3TGsrxvepr7W6nmrTL93sSYNggJjr0VdpydrGm
         MgcgBMuXcfECeU5TUncTjEN2vCGZmzFdAyYD8XNZpCxJLJCrqc9Evg6LLojti+GH+5di
         W1pTf2aNYuIoSfJU8iR74ABnreIuuDZbdhvArk2mYa6hSr6Am7QvAYo1zd5EsHTgyx4f
         87mVt9M/LOlmZPa2QEyHk2JdcE3SgSlExxZuR0dzgH2c00MUSYxvQnkz9Rr1HUS1ecvC
         dRxw==
X-Forwarded-Encrypted: i=1; AJvYcCXEVt7kti9iZz8MBE7cpEEaKcZ9DAkEjJDp+RFoiRJUFT4VSkTLhm/a1PYHf7z47sice/ypFYW0/BtBWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3ORp8hCLjarQgUXu4aB7RH/igd4Oc/+fD+veKpS25COqQyYe
	g+7PmJVkGz4PbDlaLWRS7GcUz2O/33BaaHth+IDcrhReDZOiUFVfTf/zKN79pdZATbPrfWSxfpa
	y8oKHvHGeIET1zs+6izI/Pu5sNDuEoTS8DnY0mhj+cuBH4bfaZFwPwzKcx3jKaRnyWg==
X-Gm-Gg: ATEYQzzou8Lc9oYuJS6qofXGUuUvo9Cnn231hlIzNSHISaOqHNcyrpT6g4hB5tXnEig
	xqAlrrgYnz8xuheJI3feXOrPAwzwXpfJj5nHd9biYivA0D3sVKdj17qYXomJkFg28yOaOfyf4c6
	qNGgBaPr4hyD+MNvfSw/FDK4cnG8edlB2SlRthR3yos1/a5I00Bc/r0QS4sORIcVOj9ZuC4uUpj
	grb4wh6He+7JoadJyuYxic09cMi65UDj/xY6QOY5lIz7n7ecfU1BiQimz+3tcVihtNbkr5TV2Tj
	eYatEA9iPKvWf+WMkBEYRKXLNQGAhGlGaqQLRYZlUkdVfD0tySzwfpu8l+DyYt83ig/37XpAUYG
	kMqFXErT4aBahoooNcHmJPJhjy1s/9pRVo814V0MQuSyBvXh2pFAkqQ==
X-Received: by 2002:a17:903:246:b0:2a2:d2e7:1601 with SMTP id d9443c01a7336-2ad74541768mr90428595ad.48.1771873822032;
        Mon, 23 Feb 2026 11:10:22 -0800 (PST)
X-Received: by 2002:a17:903:246:b0:2a2:d2e7:1601 with SMTP id d9443c01a7336-2ad74541768mr90428265ad.48.1771873821476;
        Mon, 23 Feb 2026 11:10:21 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:10:20 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:02 +0530
Subject: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6299;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=6EHrB7O8xO1KO3JeXaSJmhEvz4UF48aY+wHefteIn5o=;
 b=PQoJ0WQ74WdOsWKY6SUsnfL5qbidltdPL4pFBld3IPPhdFunIRAZUD0aVWSiqeKX4Q+C1O8us
 HJ7xauW+RB+CD3tKcCU67VQ4JDbx2VlgLnYZovthqbqOs1Z9EiYO/B8
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: Yq18eoSPzWvGZmVlzLT0hldiwdB0TLN2
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699ca61e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eDbiE4MX-y_Gg5q49BQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXwtsmyvoj+ynn
 xq69trxF+eRZi14d3jB4i6mf6ZFMYYKgj91G1isphshKmWuh8sAMkfm+CThDADprC6Ni7z5Tjz1
 Q64akaea5vH9iHhQq/DTvqFArtxk9mHeej+2Wft8SkagbngOURuV/fVJs9+ywr1oOC9u3TFDs2+
 Dg2kxnMbCqgjN5BjWx3GoLut9UuEXp1q0QdefbV6rhbvwkQ40AUFUrtd+njEQhWDss7PjXJLiTN
 s2DoN+AAVqgfl4u2HCCQl8fnnc+Ld6l291aiO+UXQG06lKPcjOLec6axUcjYhP3l23sGhN6xi6I
 n7zEhnNffA3bMnjr2tmG5noUgLSG61URxPEH6k7DoQ/yjUjUprs/7MgK/ry3fWO7tjjbLdcJdX8
 s2MLT27LTGY5VT06WhtEo3+nNOQDdSTOQ0sBiDmCeqTI9S2qOiLvbJFe92qlJ7GlWJodOmRJzwf
 eOdti74bOtVNVrEE1mw==
X-Proofpoint-GUID: Yq18eoSPzWvGZmVlzLT0hldiwdB0TLN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53210-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C741617C2DD
X-Rspamd-Action: no action

Introduce per-file and per-user context for the QDA DRM accelerator
driver. A new qda_file_priv structure is stored in file->driver_priv
for each open file descriptor, and a qda_user object is allocated per
client with a unique client_id generated from an atomic counter in
qda_dev.

The DRM driver now provides qda_open() and qda_postclose() callbacks.
qda_open() resolves the qda_dev from the drm_device, allocates the
qda_file_priv and qda_user structures, and attaches them to the DRM
file. qda_postclose() tears down the per-file context and frees the
qda_user object when the file is closed.

This prepares the QDA driver to track per-process state for future
features such as per-client memory mappings, job submission contexts,
and access control over DSP compute resources.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_drv.h |  30 ++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index a9113ec78fa2..bf95fc782cf8 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -12,11 +12,127 @@
 #include "qda_drv.h"
 #include "qda_rpmsg.h"
 
+static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
+{
+	if (!dev)
+		return NULL;
+
+	return (struct qda_drm_priv *)dev->dev_private;
+}
+
+static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
+{
+	struct qda_drm_priv *drm_priv;
+
+	if (!dev) {
+		qda_dbg(NULL, "Invalid drm_device\n");
+		return NULL;
+	}
+
+	drm_priv = get_drm_priv_from_device(dev);
+	if (!drm_priv) {
+		qda_dbg(NULL, "No drm_priv in dev_private\n");
+		return NULL;
+	}
+
+	return drm_priv->qdev;
+}
+
+static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
+{
+	struct qda_user *qda_user;
+
+	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
+	if (!qda_user)
+		return NULL;
+
+	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
+	qda_user->qda_dev = qdev;
+
+	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
+	return qda_user;
+}
+
+static void free_qda_user(struct qda_user *qda_user)
+{
+	if (!qda_user)
+		return;
+
+	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
+
+	kfree(qda_user);
+}
+
+static int qda_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_user *qda_user;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_dev *qdev;
+
+	if (!file) {
+		qda_dbg(NULL, "Invalid file pointer\n");
+		return -EINVAL;
+	}
+
+	qdev = get_qdev_from_drm_device(dev);
+	if (!qdev) {
+		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
+		return -EINVAL;
+	}
+
+	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
+	if (!qda_file_priv)
+		return -ENOMEM;
+
+	qda_file_priv->pid = current->pid;
+
+	qda_user = alloc_qda_user(qdev);
+	if (!qda_user) {
+		qda_dbg(qdev, "Failed to allocate qda_user\n");
+		kfree(qda_file_priv);
+		return -ENOMEM;
+	}
+
+	file->driver_priv = qda_file_priv;
+	qda_file_priv->qda_user = qda_user;
+
+	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
+
+	return 0;
+}
+
+static void qda_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct qda_dev *qdev;
+	struct qda_file_priv *qda_file_priv;
+	struct qda_user *qda_user;
+
+	qdev = get_qdev_from_drm_device(dev);
+	if (!qdev || atomic_read(&qdev->removing)) {
+		qda_dbg(NULL, "Device unavailable or removing\n");
+		return;
+	}
+
+	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
+	if (qda_file_priv) {
+		qda_user = qda_file_priv->qda_user;
+		if (qda_user)
+			free_qda_user(qda_user);
+
+		kfree(qda_file_priv);
+		file->driver_priv = NULL;
+	}
+
+	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
+}
+
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
 static struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
+	.open			= qda_open,
+	.postclose		= qda_postclose,
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
@@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
 
 	mutex_init(&qdev->lock);
 	atomic_set(&qdev->removing, 0);
+	atomic_set(&qdev->client_id_counter, 0);
 }
 
 static int init_memory_manager(struct qda_dev *qdev)
diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
index 2b80401a3741..e0ba37702a86 100644
--- a/drivers/accel/qda/qda_drv.h
+++ b/drivers/accel/qda/qda_drv.h
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/rpmsg.h>
+#include <linux/types.h>
 #include <linux/xarray.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -20,6 +21,33 @@
 /* Driver identification */
 #define DRIVER_NAME "qda"
 
+/**
+ * struct qda_file_priv - Per-process private data for DRM file
+ *
+ * This structure tracks per-process state for each open file descriptor.
+ * It maintains the IOMMU device assignment and links to the legacy qda_user
+ * structure for compatibility with existing code.
+ */
+struct qda_file_priv {
+	/* Process ID for tracking */
+	pid_t pid;
+	/* Pointer to qda_user structure for backward compatibility */
+	struct qda_user *qda_user;
+};
+
+/**
+ * struct qda_user - Per-user context for remote processor interaction
+ *
+ * This structure maintains per-user state for interactions with the
+ * remote processor, including memory mappings and pending operations.
+ */
+struct qda_user {
+	/* Unique client identifier */
+	u32 client_id;
+	/* Back-pointer to device structure */
+	struct qda_dev *qda_dev;
+};
+
 /**
  * struct qda_drm_priv - DRM device private data for QDA device
  *
@@ -52,6 +80,8 @@ struct qda_dev {
 	struct qda_drm_priv *drm_priv;
 	/* Flag indicating device removal in progress */
 	atomic_t removing;
+	/* Atomic counter for generating unique client IDs */
+	atomic_t client_id_counter;
 	/* Name of the DSP (e.g., "cdsp", "adsp") */
 	char dsp_name[16];
 	/* Compute context-bank (CB) child devices */

-- 
2.34.1



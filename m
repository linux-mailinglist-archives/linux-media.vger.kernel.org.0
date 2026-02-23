Return-Path: <linux-media+bounces-53211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I9bC/WmnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:13:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD717C1FF
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 163A5302B454
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9702736C58F;
	Mon, 23 Feb 2026 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mr0aOAlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+KblW2U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462F36B076
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873833; cv=none; b=jY81QnPD3uBdIrzPHO5tDJlalu66K4p7EszGYvrhN4woLeL+HSMdYr4qB39g3ryhe48iEvm2DvwV2T82eak8ug4VylQ1zuM7ZmWz0khnt5p1OwvkY5ucbpQos3M/V1oH+vbbtD73YfN4NMTHOasCL8GENPQHXuQzOyLtTeOZ5jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873833; c=relaxed/simple;
	bh=cPe6XiIaqlleCllXAqlYjNWCbV9gcpzWtKPjZ8WPpf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GjYcA5EWDr0v+omk/Dx7uhfuqnHbD15ZOLV325//er9GTy/qcGwFWH/NSlFfnA4b+HpyPOfRzYSynG9yrIrKXrLpFa8R9elz4R1+cCOn8/oIrG/ZDHLa3BhzwkLc/K2rJZunPLIN2MmapFSNhSw0+YK2ieTa77W2ERM8hyZXLOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mr0aOAlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+KblW2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIEpJE3733250
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=; b=mr0aOAltrI4uJ7Y/
	eX9yHYbh93qOBnF0O2Jqi5e+eWUymu4EHSr+IRSR6gTZxrvMqgHZ6o1FClrysAH3
	pMZrf70/KSN/FcBb2TvAafzdorTIV4pVb4LiUtBBsF0Km8bD0I4tL6M7YTD+PGca
	4CNb3QtHn2c06AyXuTJyxX4vRMNwVn7Hxqo3Hio+v8Wbu7rCaEj44wddHPe6RanH
	GrilYYSFJwxyqM62A14LM/3SDVGNbRisSdICQwZWw3r+AMJwc8gQQsG3/33xl13e
	HPu3/IMadAw3RB4Z9G9QTr+krQ0RRdQjJBoCxtyld2upIJwRwgKRcmHlx4IB8xP8
	jzK1Qg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9m93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:10:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a946c0e441so42561275ad.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873829; x=1772478629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=;
        b=A+KblW2U0GhVc3IE3cPCz8b2KMcevi1GgyYJ1fqciqYsd7h72jTlcMwxjYvzMGU0uY
         ZHyZrCoPTVRk6EKzM6JTt+u5ji9EcHNrkbSavgfPLs6qigGxOnn7z7F509fDtZV+e+Ew
         hyu0Df6kCSj7iX1wq2oaXT/i+7HWcqx2xTuafbDHPOr0vWMuD7iO+7UNJFP4t/GEm+xN
         FajN9zVVKx7vCSyIQeZzt5TYwqmcPpfy3crlk+Hx2FsaeJ7Qnuh8GUSZD3iRn9G04RX0
         bw7Wm6Oqm2jUoN+QZWWaKgMVh9mEcH7Wtv1yBSHjEpDFfVJoU/PKNKYzzs3XXUFdd8C9
         uiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873829; x=1772478629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4cWM5gPirp6izkRy//rcobyzuJsSsXAsmgnCXnHF9B0=;
        b=JLhRNueFz2O9exzeIVtV5l2axfPXePq2VhcyfvtPFiIKwxRYS9F4Pmpjb4BrXQpjRJ
         oHKm7py/25MFP6nQSHhY+9uIPwq3ZzMf4Co477qwxodKr1tveDpTizvnBekraB58xBkV
         5Qjyw0nNpqvvCg0WPCcr8eB6qWV59mAlcito3tx+Oqu/QoPpDkizSBLFkyM9F9IeZG7m
         //FEsUoEfm5fS20slJmXmvvVdmV+KEPGCPy05mF8XzlZU9PfpMUlth5T6Mg7J5w/DSha
         gpLfM71Bo1BCTT8yyJYIUDUfHxYF12gsBximt2XehZQFGA2kjhIeiYiA4wMUmdbQTk9F
         EPPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJotZFpXVsJWSCORpWTf0Q64MYg6ngmx6vNBk7OfUw3iCvQUdsl8DdF0ykSXsliNt0xY5300HVcfcohA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJwWr5HFfu9Ez1tay7EcqUNLKGZE6OzaCUqbK5or7f98t/FvN
	zTzixxMirRdotZpGRIJMAx4saZY1bRni+HBD0uRx5lvqyGe37vcwk0YI1zv3BwvGjomm9+cl71Q
	TsdnJEJlkSyrTuACg22FHjswrwB0EOm1wExKCPSPFa4q716ESqSvCM1lNENbeIaba8w==
X-Gm-Gg: ATEYQzxkojr7f9rp8+Yg8Fk16W927RmXhbWQRntYiXe7XpYtfu76nLAvEAyDLTlPoYN
	mHHL22Cj0ExB+9RlgaY/4vZrd+lLzsd3w68n4jo78fn6AEgKqxNFIcwNBzg9sExb1eS4XzuyQ9b
	yiGyH8Q+rdGm7A+HhUiSHjsYlF8iCdLC9gM3mWE8mPoh9t8lyc+UGK7j/nYrIISek2dwB0aES5z
	Wh1cXmUKFOS/EHxzYGVMmdDLx3a3MXg4BlD6l6HAhO6zbq8zXu7/5wQJChktp+9qexzs5sqrYUI
	JEXYzlMmh/Voe64h47av53bG6CVxGF9AYmxuP0g+bnWKMwjq0XSV9xnqERXT0nSkhmVgykIIZ7X
	d287pedazWK+Ekp00NEldA8zedpjCwVSeBSat+N32hYoQwaMwFIP8UA==
X-Received: by 2002:a17:903:2f8c:b0:2a9:451b:422 with SMTP id d9443c01a7336-2ad74439669mr84594605ad.14.1771873829347;
        Mon, 23 Feb 2026 11:10:29 -0800 (PST)
X-Received: by 2002:a17:903:2f8c:b0:2a9:451b:422 with SMTP id d9443c01a7336-2ad74439669mr84594305ad.14.1771873828808;
        Mon, 23 Feb 2026 11:10:28 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:10:28 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:03 +0530
Subject: [PATCH RFC 09/18] accel/qda: Add QUERY IOCTL and basic QDA UAPI
 header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-9-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=6604;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=cPe6XiIaqlleCllXAqlYjNWCbV9gcpzWtKPjZ8WPpf8=;
 b=ZymVL6dioZif6Wgr4wJm47EDwZKmJDJvKkln1f30mqSxFcv/WXANZRzJ6HZOt0B38TaPvWsjI
 2zkyvEL7H+3AOLdSQuIn9G6ImRaRh4RXlXJ9NOWvLTJOVVCdBtH+0mj
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699ca626 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xFwpPJ--XgJ2TdNcX9IA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: c6SP0C9vOv9x8Py-uwo29VzQdcbZMwgi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXxODd1lwar9Li
 qtfkbHxehzhTbRGe0gsc7zEWZwa81myDkPIPa9OhEXVFHwE5mRcapKZfAxwxHAmHf/+qg1xPPeg
 uzJOHxZv3d1ZhNK1rgLMUAMXkxeZ+1yjgWEmwC7TUB9x89aA1+wrC79vZYNneDCas7wq+RfanWn
 XDT+n3CHccZjx10lrBildbB8Kp/u7SV0HQq6ilJ6JZZkX1avH1YBYFSMV5dObJgnI3mOQaz9SY2
 iVuxuh5EMk5r/+cPRA98YqLRLwS88qiOBXO5ymK0EcXPpI1ZBjh514mcck9O2pdRRwvamlxjuWs
 3qkiq5wMQ7ncmorhI6c/R91bVUQfDxt7pP/YzItz8YedX24eG0D8bZGvzUcNIlCxftc6M2HJsFr
 3dM5hYRQBwgdjzacHU/HuLIW4FLYdQJD/Rz0OJnpJFJhP7UYtciMs3oTjFeRB+tpLG4DiR6jNuu
 nivqssVPNArzuoormEA==
X-Proofpoint-ORIG-GUID: c6SP0C9vOv9x8Py-uwo29VzQdcbZMwgi
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53211-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50FD717C1FF
X-Rspamd-Action: no action

Introduce a basic UAPI for the QDA accelerator driver along with a
DRM IOCTL handler to query DSP device identity. A new UAPI header
include/uapi/drm/qda_accel.h defines DRM_QDA_QUERY, the corresponding
DRM_IOCTL_QDA_QUERY command, and struct drm_qda_query, which contains
a DSP name string.

On the kernel side, qda_ioctl_query() validates the per-file context,
resolves the qda_dev instance from dev->dev_private, and copies the
DSP name from qdev->dsp_name into the query structure. The new
qda_ioctls[] table wires this IOCTL into the QDA DRM driver so
userspace can call it through the standard DRM command interface.

This IOCTL provides a simple and stable way for userspace to discover
which DSP a given QDA device node represents and serves as the first
building block for a richer QDA UAPI in subsequent patches.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_drv.c   |  9 +++++++++
 drivers/accel/qda/qda_ioctl.c | 45 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h | 26 ++++++++++++++++++++++++
 include/uapi/drm/qda_accel.h  | 47 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 7e96ddc40a24..f547398e1a72 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -10,5 +10,6 @@ qda-y := \
 	qda_rpmsg.o \
 	qda_cb.o \
 	qda_memory_manager.o \
+	qda_ioctl.o \
 
 obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index bf95fc782cf8..86758a9cd982 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -9,7 +9,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/qda_accel.h>
+
 #include "qda_drv.h"
+#include "qda_ioctl.h"
 #include "qda_rpmsg.h"
 
 static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
@@ -128,11 +131,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
+static const struct drm_ioctl_desc qda_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+};
+
 static struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops			= &qda_accel_fops,
 	.open			= qda_open,
 	.postclose		= qda_postclose,
+	.ioctls = qda_ioctls,
+	.num_ioctls = ARRAY_SIZE(qda_ioctls),
 	.name = DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
new file mode 100644
index 000000000000..9fa73ec2dfce
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_ioctl.h>
+#include <drm/drm_gem.h>
+#include <drm/qda_accel.h>
+#include "qda_drv.h"
+#include "qda_ioctl.h"
+
+static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
+					struct qda_dev **qdev, struct qda_user **qda_user)
+{
+	struct qda_drm_priv *drm_priv = dev->dev_private;
+	struct qda_file_priv *qda_file_priv;
+
+	if (!drm_priv)
+		return -EINVAL;
+
+	*qdev = drm_priv->qdev;
+	if (!*qdev)
+		return -EINVAL;
+
+	qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
+	if (!qda_file_priv || !qda_file_priv->qda_user)
+		return -EINVAL;
+
+	*qda_user = qda_file_priv->qda_user;
+
+	return 0;
+}
+
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct qda_dev *qdev;
+	struct qda_user *qda_user;
+	struct drm_qda_query *args = data;
+	int ret;
+
+	ret = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
+	if (ret)
+		return ret;
+
+	strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
+
+	return 0;
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
new file mode 100644
index 000000000000..6bf3bcd28c0e
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QDA_IOCTL_H
+#define _QDA_IOCTL_H
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <drm/drm_ioctl.h>
+#include "qda_drv.h"
+
+/**
+ * qda_ioctl_query - Query DSP device information and capabilities
+ * @dev: DRM device structure
+ * @data: User-space data containing query parameters and results
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler queries information about the DSP device.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+#endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
new file mode 100644
index 000000000000..0aad791c4832
--- /dev/null
+++ b/include/uapi/drm/qda_accel.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_ACCEL_H__
+#define __QDA_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * QDA IOCTL command numbers
+ *
+ * These define the command numbers for QDA-specific IOCTLs.
+ * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
+ */
+#define DRM_QDA_QUERY	0x00
+/*
+ * QDA IOCTL definitions
+ *
+ * These macros define the actual IOCTL numbers used by userspace applications.
+ * They combine the command numbers with DRM_COMMAND_BASE and specify the
+ * data structure and direction (read/write) for each IOCTL.
+ */
+#define DRM_IOCTL_QDA_QUERY	DRM_IOR(DRM_COMMAND_BASE + DRM_QDA_QUERY, struct drm_qda_query)
+
+/**
+ * struct drm_qda_query - Device information query structure
+ * @dsp_name: Name of DSP (e.g., "adsp", "cdsp", "cdsp1", "gdsp0", "gdsp1")
+ *
+ * This structure is used with DRM_IOCTL_QDA_QUERY to query device type,
+ * allowing userspace to identify which DSP a device node represents. The
+ * kernel provides the DSP name directly as a null-terminated string.
+ */
+struct drm_qda_query {
+	__u8 dsp_name[16];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __QDA_ACCEL_H__ */

-- 
2.34.1



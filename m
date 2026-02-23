Return-Path: <linux-media+bounces-53204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEm8FUKnnGksJwQAu9opvQ
	(envelope-from <linux-media+bounces-53204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:15:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4D717C278
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF59631AD805
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E1036AB64;
	Mon, 23 Feb 2026 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdNsNsWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7vOr3oF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DF36AB5D
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873780; cv=none; b=EnAl9TmcxIl4kVX7tDINBjCRrvduUY52iMJ2NBaHDFwTnRgGZqIdHEzfZClp4HInFhYFfC8XIAqVrFgLM39xdOlebpuBlZZReKMfP3RYTPSisj9/c9/2IJjo5fzQNaDWphLfH0k4yXK49zgIpRNLVT9+kYUEiOPy2d6h3mjq5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873780; c=relaxed/simple;
	bh=Iw0hzhN8TNwgA9xnHeYqChSsZ5/vTjuUaVZUYGjv0iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZ8T7YNoS8bwku7BcW2BCpMxUYuvuBnx60ZABKDn2qS+SneCeNnwxZa9c3ax/oMwbdDsqi+uiI1LtAGJnObJmJTaQePU2K9kGyXSKvw8xhTbjKISuEkX4I/HAEmRLpWUwPUgmzyYu1Scg3GnV5JuBRPFMvu+MiUuXtjyM2gj1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdNsNsWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7vOr3oF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIIC6u3733304
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=; b=XdNsNsWvxZaLB+WO
	1c9je4mRHs9lemIwzNeVaBTfpwvKr7B0M6jAGIFkItnEmwzraStnPI+eLsvh+Xg1
	9tqJOYWOtxI5zGygqqarte6g8YKv1SPyRAjTJDK/H1eUgLiAWwJbOlM+R5ZVO7Gu
	Zlidsi74Xn3WIUeJeLdS6qj+zGxJeuJaICoHVkiD27kVX2tzYfA0ZOwCh1kXu4+5
	JXAy4aZ6r6X+Z6maQBc488mYwlT3XgqPa5XsPeu0Kvlf54tMIfsLd/itCow9x1rM
	D5dq7NJNCG/xoZz2ALOSMmFhUqbSS2og4rxeBOS6jyP69+IusIvhhoGOhRfkNw7B
	1fcYwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9m6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a76f2d7744so51012125ad.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873777; x=1772478577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
        b=Y7vOr3oFBu6loEOhL60SwpqQNEmwKz8hQI987ebowlzT/RYI+p2mVQ7J4Lm78wFUlQ
         i3nhGnTafB2r/yOvNqLgtAX6iZsRLAETP+9OIdvdj+93R76HuMcfIoxELmOLBho7tPAy
         itCe4+kllW6TC0hqO4HtEwgW3htFjyzDzgvuaofd7D7lc/eBozWBjikfLd8zCGg9TnEB
         k+HsbsnurM4XiEwNGd+vL2mjBuUVtYBxiT65MrxlAXRGo/i9i3j3QmrM3lmEAcdIWvrA
         ecFldb1ctXW3jZWq/GDuI4YZLBxU6EeWh3gbV7RFkOJHllNG9k25gJYmqTBDMCZR5fY8
         tLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873777; x=1772478577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0JCApWIKIFxtoeFjcHtlOVvzzubuiNTLYafS3Jft1k=;
        b=mNwhlGLNDtAuSE8o9T/nbKMgfvUhai6aOplcR99ZbT93gZ64kknt1VNRlXXCc3z62F
         Gm00IwRsG6sfvPzphhaNJdwyV7fAJ6P5WPsebCDLQBGsVTB7O+LWPL52Ovc0b+R69rVP
         PgsH7sVKZTFsp2Ibv+QBb+QWA2GHzniSsPqmV+SW4EGeXBsyje+O/HjpKTAl7CNOV+86
         2CA5XZkKDOIIxRL8yKv6CvVs8z+9hGJBnNqbJGxorG11bUWtOT804PnHrR0uEvuuwRSj
         yL6rxK1P5X55m6a7aJWbGPEJonHKoWNWSnNuJhAh/Qo5JNALHpJKRYs59uV/W8AK7TYT
         3Myw==
X-Forwarded-Encrypted: i=1; AJvYcCXgOxph+elAsEekR/tsB3mhQLNg5RAUpxwnWT0PlXgx5Qj83QNZ2hTM2Bcv4cMrb1MCBjLtDWXCIJ+nCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEvzvEjT4++LSNsPkrw4kmKVxHTIKSd7t85nHd18OxlCD6ksSh
	prj7un9A/K6GGr+x1dlqIjpbEQ7Pooo56qFrse2OetazsszTAcisHPJYirnX7Aw9hslSQKP2mK2
	CKcecaWEVw9mwwXFfeoL62RwCYW4Vk5GPlTGGoEzPfR+mjmdLiKYbxo3LQL8qaaK5kw==
X-Gm-Gg: ATEYQzx2VAQpWT4koBoV2dE6fylOpZZZmyGnIdWcdYSf/zUyn496Cxl6C3hIHBUrCfl
	iQgZbfQ1lgooE4ZY/dx0Jzp1F5Ye7Bd0tnZBaTnvK261OkQBH9yN1PGJ15ummN98w/rAgt0M3wR
	tK3uPW/iZVNlxvmwUDy5NqLx3ZD8TEMlYub/DMHtjncnnrhEVyi5qvSRQ9YfptVPKhyznu3xoIa
	Zd+qeXBtFCIFuKJ2uQScrgIKuIruZ4WJHll0kgi+jbK5h1xP05Kj/ec6HK+NwiPi85W+iaw7xE0
	otH8hW9PtPgCkiq/4Uu9ReNs7GMI+mPCOF4yisH6FDxgu1b0V06oBF4LJq2skaMIFlyCGiP3XMZ
	hsQUkWE3nPRtT6Cpg0Cveyfi3SJfj176CJeA3jsdfpf+K/y1ubkBZ8Q==
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad7447b9a3mr88580515ad.25.1771873776742;
        Mon, 23 Feb 2026 11:09:36 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad7447b9a3mr88580215ad.25.1771873776239;
        Mon, 23 Feb 2026 11:09:36 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:09:35 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:56 +0530
Subject: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=4540;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Iw0hzhN8TNwgA9xnHeYqChSsZ5/vTjuUaVZUYGjv0iQ=;
 b=6mfusuznwiKRoFz7lqPVV796aoLzrrTOSWeY7E+k/o91H+68GH9DCi4JNH+MgsD4WTZjhKMWZ
 rfXsJyoI0+sBQzXiPtXlgnu8MwGhwyzA7WTUYFVKS2pm+ZpHc4bQxcZ
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699ca5f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YXnACfkLeW4vfmpQHhcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: tQC66ADvyr5Oq2CjYa9B6kfsSK2vO5Rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX5h3uNL5pJmxe
 Dbstzwsvzbga4zv7XUrhS8nfpdRNspEbBQyhShazF2nYwlRykk3ZQKiVko/yBCTQDgKNYjIOqEF
 U1b9zPKxmsZPTd5ZBYtzY+cihhZXb+dXjl69KDdgiva6MFL4D/mUbB56GZaNXKbCC/cEpOfIh3g
 ohsB9LzzGHnVplvLHdLKeyLO9SPjbVPkldcddQFEX00kn1DjOxxJ8COpx7wkWL826+LGggreDX/
 9NfZBADDuB/L/yqT1gcy6uZtHUsi1xREQDLf/3gCp2z+x+WzxMW+WuNDjZII7Rq2QKmbjoi3jFf
 XYRVj7fnUGytMlIJum+5W2weKZ9GvtUh1czcco/wYflofia89Gul5OIN1ZhgU4ODeutlUxoHE1+
 S7YIL5WtRVNOqZDglf2jtjC+nqi6VecmErxd86quJu/aN4AmHnnD+cCAseZOS1/0JVMp2i+76JA
 Rxt/78RfuJhZ6TWHjpQ==
X-Proofpoint-ORIG-GUID: tQC66ADvyr5Oq2CjYa9B6kfsSK2vO5Rv
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
	TAGGED_FROM(0.00)[bounces-53204-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: DC4D717C278
X-Rspamd-Action: no action

This patch introduces the initial scaffolding for the Qualcomm DSP
accelerator (QDA) driver under drivers/accel/.
The new Kconfig option DRM_ACCEL_QDA integrates the driver with the
DRM/accel subsystem, and the accel Makefile is updated to build the
driver as a loadable module. A minimal qda_drv.c file is added to
provide basic module_init/module_exit hooks so that the driver can be
built and loaded.

Subsequent patches will add:

- RPMSG-based communication with Qualcomm Hexagon DSPs
- FastRPC integration for userspace offload
- DMA-BUF support and memory management
- GEM, PRIME and IOCTL interfaces for compute job submission

This patch only wires up the basic driver framework and does not yet
provide functional DSP offload capabilities.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qda/Kconfig   | 29 +++++++++++++++++++++++++++++
 drivers/accel/qda/Makefile  |  8 ++++++++
 drivers/accel/qda/qda_drv.c | 22 ++++++++++++++++++++++
 5 files changed, 61 insertions(+)

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..74ac0f71bc9d 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -29,6 +29,7 @@ source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/qda/Kconfig"
 source "drivers/accel/rocket/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..58c08dd5f389 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
new file mode 100644
index 000000000000..3c78ff6189e0
--- /dev/null
+++ b/drivers/accel/qda/Kconfig
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm DSP accelerator driver
+#
+
+config DRM_ACCEL_QDA
+	tristate "Qualcomm DSP accelerator"
+	depends on DRM_ACCEL
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
+	  This driver provides a standardized interface for offloading computational
+	  tasks to the DSP, including audio processing, sensor offload, computer
+	  vision, and AI inference workloads.
+
+	  The driver supports all DSP domains (ADSP, CDSP, SDSP, GDSP) and
+	  implements the FastRPC protocol for communication between the application
+	  processor and DSP. It integrates with the Linux kernel's Compute
+	  Accelerators subsystem (drivers/accel/) and provides a modern alternative
+	  to the legacy FastRPC driver found in drivers/misc/.
+
+	  Key features include DMA-BUF interoperability for seamless buffer sharing
+	  with other multimedia subsystems, IOMMU-based memory isolation, and
+	  standard DRM IOCTLs for device management and job submission.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qda.
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
new file mode 100644
index 000000000000..573711af1d28
--- /dev/null
+++ b/drivers/accel/qda/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm DSP accelerator driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
+
+qda-y := qda_drv.o
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
new file mode 100644
index 000000000000..18b0d3fb1598
--- /dev/null
+++ b/drivers/accel/qda/qda_drv.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int __init qda_core_init(void)
+{
+	pr_info("QDA: driver initialization complete\n");
+	return 0;
+}
+
+static void __exit qda_core_exit(void)
+{
+	pr_info("QDA: driver exit complete\n");
+}
+
+module_init(qda_core_init);
+module_exit(qda_core_exit);
+
+MODULE_AUTHOR("Qualcomm AI Infra Team");
+MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1



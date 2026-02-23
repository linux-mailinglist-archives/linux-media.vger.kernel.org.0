Return-Path: <linux-media+bounces-53206-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEwVE6mmnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53206-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:12:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC4C17C19D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13668303998F
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF53D339B41;
	Mon, 23 Feb 2026 19:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpEkL3VY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYGVCylK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EFA36AB57
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873795; cv=none; b=BtDz/erdzZCpkkOu4Z94moKKtBbPMJEvKp9wEi+lLnC3Q7ezkDBUsr/d7kLdYFhuzr+iTmnHly3hnVNmAf8147huMQ8O3zNvWXrM+sYIEqYTNptRuI0rROKBsGIb/Z8ZS555MjasYUsqzzjV7z7j9oe+2zqztPwZlLmw91Rr5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873795; c=relaxed/simple;
	bh=kVGIvUQYd8fYwcDgOBRxiOF7ByQocRT92vAbYBLm9bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B1BuIc4W5goqVwXlKy944BjDArmHmAhNVxwbuTQK6/0hntWqxVv3nn28IVXCVa2z8eqecKFHwdGTkcLvyLj/vAbbDNY3NM9VGITrFE2v/5ue3nAng2bxEyRg4Jakv3cYZQX8PiUhxWlbQxtfM7ZPTLcfK7pNiRM/jFrZNjYZEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpEkL3VY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYGVCylK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGvHEr3478529
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=; b=RpEkL3VYvUKXqlya
	rYKRGcHWELDmVNYUNjnxgaIdhwD3KZgSYGrqLnKFuPWyuvoQM1Xt/tB8z+itdjaL
	hUMX7cRvkVeH1g+D5hG/1D5cI4Ai56L1IOftdKHXVO9Vaazy29/L5DUIYI7z2weP
	jzqBj92+V55qvY8gekJVzOhP4EhUq7Vjl8qBLKzi/7fi5OMOIVIIr1ZybznKDKaJ
	rLqgDg2+tvUKMjunp9+3WWW/IG8ukDYG21pMIKylZ0a0yqugjrbgXAENI4aHIQm+
	YuEhYfWYiDAF1iL+8ObVpGRdMq7Iv4sVPPiO4Y2Q6lpjgmnH0QNyyU2apjaYbDhh
	6QBuwA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtv9re5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:09:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae146bab0so48788315ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873792; x=1772478592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=;
        b=bYGVCylKS9PItG0bSxtPfNAznBD2Z4AKl2Fdm97UZ1bL4eb/l5+P3a2jmJXNZ1igWw
         ccaqYHtwmO45Uj/iu2U38YlazPjckCR8wydJhsoAsOr1O6sakmqugXARX78imIrD6pmb
         exyjQuW+0SRASR2+JijPFzHzW/FD7Ipd1hboUHD6KVvF3nCigmMcyF6R5jjZ8XAqF8Ul
         QhvYTMRF+vbxL8FiirZ9S+cJHiMfNQOqkOJkXX84PoHJ8HomOw7kIB7LE2Fkw3gJPaaH
         ivHBWJ7BEVuIH0pRpmngSjv0bq7GuoilbPyQnDzB7M9NCtDqEVBsKfdpMjU82e1uplnP
         mFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873792; x=1772478592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lsNmoBqASYHT9cEHp6wiIElpPi1KeWEI5rpj2+q1iIA=;
        b=R+bEjOQ/wS9/EmZKYgvaXALe7HnIJe34abms2V3rGKgepZnqB/wAIryacHHgomHvr3
         Cr8N57wpN4bNXHveydNs14hCycUh8/YkdOysPgAYQXD0xf8zCedfP+Jb8J6oPTQ0xhOK
         ZAf0dXoMmMcvNT6Q35jk0xV/O1spdXaOP6RlcgcUEf65m+ciOI5xvjSc0G9EoEla+w3u
         HyuBlfVibdzYhqammDyw7LLV4M/o8L6HXOFsFQKoqy1y6UNLmUAQd5e7mpFhW0RpOlqm
         bsU3rxhIwU/z77y7BPNvmMbD9+jVet83/DGL62VZV7tlnDDXAdfV1P3yBw54uGCZbYTH
         Isag==
X-Forwarded-Encrypted: i=1; AJvYcCW02DEe4d8sTI0+P6+XDEi/9/s41yRkxNgMsXqlRWdWBaSBUOfqAdyBXh+GzRf8FD5rNNCizQigHNlnHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDNBM7pncK/LPsClft7LhdyJnMkmSM2f6wXs50jRGCas251F1
	D39KO4rususAUFSdkFBipnDj5jbO+EMpUZw/nLKgbO/iEcL5tvRjXiEFBHIzvy63HoApvTlMjzK
	buuqIWFg0MhEBDaOboaMU8ezwym3YX/XujU/Oom9JwHZ7gR9zh2PPbJLHpZUK8PgGKg==
X-Gm-Gg: ATEYQzwPtsUh37Gr06YvwaHm2TP7Kot7R3yM0x6f3h9DUPd8aWH/EjzpmciSob34+Zz
	KlskW8cIP48YBdgxuY3Fu00dCfNUo89cdKseuVPOh+7t0POVDNI+tfAbb3Rt4fugRT4QqfPsXFx
	LBPl52QvEBDe7sIZAGRItEk/I9HZsylhE57QtINz0GNdeT09ELNpwODxnVsEk2988VEFFfCMhHe
	oO61OTffK+BHE4sYeSW91Zq+Mn3YGOz+ZectTf/+oY/S8lvlL0i5+6uJCLFDv5Hr2QORTUi2jTw
	YfitDi97dxSb3SiCJPbfLEg8ldGSW+O7ixXaOuUbSraKf41n2L9LdOVO699qSTAVXL2aMt8wEuH
	kprbCxivwPIwwNoKJGEAyStdJHXggeg5Vj5vEgxu5uKtIcBKH57kBcw==
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id d9443c01a7336-2ad74516615mr88514275ad.30.1771873791670;
        Mon, 23 Feb 2026 11:09:51 -0800 (PST)
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id d9443c01a7336-2ad74516615mr88513935ad.30.1771873791111;
        Mon, 23 Feb 2026 11:09:51 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:09:50 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:38:58 +0530
Subject: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=4943;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=kVGIvUQYd8fYwcDgOBRxiOF7ByQocRT92vAbYBLm9bM=;
 b=rUIy5HgCLDRhZVp2IzTGLrvCMsULd21ubbtDKIPuQIn9m/tfFsvEGy2LbREw4uK3leLblRQUp
 ul4rak0R2xhAnwPvhY8PF/SfHK0rFwibTRGVhaul0H1g9UdEczMQ+K5
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=Vaf6/Vp9 c=1 sm=1 tr=0 ts=699ca600 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Rss5_8j3o1z-bWaeIIsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXzXWSby05Huqg
 AGBzPzKBDW181S1ahVEdP6kX51Mh9BLghuRBcz2OqpCZ3RJZue+sx05q+vzlpFJuwnAGwsLjsQi
 ypGcePtbFSek7lrEVzWbCHxj2nSzW+Sw1/klhVWe/N8AaExbpNXFIn2w9iglVHVeCA0ZHLHU0eM
 k5hPpiQyf2leK8tVk0JhbOBgsmbjZ0W24i6YZm5Fn5YAJjJ2cUvhlJVMisHDOLF8oLc//i4n2Bp
 3OBPexmiZx+kaHFt/NdHgInbVUj7GGq/5nDtjQ3nEtdohcq7AlVZ0hRlrbAALZUZ3tct5JAGCbW
 MOE0hCgjzeLTm18oc+iZWmDzA0SnYVn9NQvXkLMYqIrjT9dYrQvSTeGSdHvBcR+zyOGBZS9IugH
 MPqnIl87N/nsRbxFiRVXpRyhVf5lOsboy1pVZw+6htqUgKoQOklBaNcc2JWQloFpN8S3UKz5GbR
 1nAmXE07caUbhnhxw0g==
X-Proofpoint-ORIG-GUID: -Zi_k-oQuqHz9umwea8Kyoz96ipF4bJK
X-Proofpoint-GUID: -Zi_k-oQuqHz9umwea8Kyoz96ipF4bJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-53206-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DC4C17C19D
X-Rspamd-Action: no action

Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
DSP accelerator (QDA) driver to represent DSP CB devices that require
IOMMU configuration. This separates the CB bus from the QDA driver and
allows QDA to remain a loadable module while the bus is always built-in.

A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
updated to descend into the QDA directory for both built-in and module
builds so that the CB bus is compiled into vmlinux while the driver
remains modular.

The CB bus is registered at postcore_initcall() time and is exposed to
the IOMMU core through iommu_buses[] in the same way as the Tegra
host1x context-bus. This enables later patches to create CB devices on
this bus and obtain IOMMU domains for them.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/Makefile              |  1 +
 drivers/accel/qda/Kconfig           |  5 +++++
 drivers/accel/qda/Makefile          |  2 ++
 drivers/accel/qda/qda_compute_bus.c | 23 +++++++++++++++++++++++
 drivers/iommu/iommu.c               |  4 ++++
 include/linux/qda_compute_bus.h     | 22 ++++++++++++++++++++++
 6 files changed, 57 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 58c08dd5f389..9ed843cd293f 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
 obj-$(CONFIG_DRM_ACCEL_QDA)		+= qda/
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda/
 obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
diff --git a/drivers/accel/qda/Kconfig b/drivers/accel/qda/Kconfig
index 484d21ff1b55..ef1fa384efbe 100644
--- a/drivers/accel/qda/Kconfig
+++ b/drivers/accel/qda/Kconfig
@@ -3,11 +3,16 @@
 # Qualcomm DSP accelerator driver
 #
 
+
+config DRM_ACCEL_QDA_COMPUTE_BUS
+	bool
+
 config DRM_ACCEL_QDA
 	tristate "Qualcomm DSP accelerator"
 	depends on DRM_ACCEL
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select DRM_ACCEL_QDA_COMPUTE_BUS
 	help
 	  Enables the DRM-based accelerator driver for Qualcomm's Hexagon DSPs.
 	  This driver provides a standardized interface for offloading computational
diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index e7f23182589b..242684ef1af7 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_drv.o \
 	qda_rpmsg.o \
+
+obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
diff --git a/drivers/accel/qda/qda_compute_bus.c b/drivers/accel/qda/qda_compute_bus.c
new file mode 100644
index 000000000000..1d9c39948fb5
--- /dev/null
+++ b/drivers/accel/qda/qda_compute_bus.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/device.h>
+#include <linux/init.h>
+
+struct bus_type qda_cb_bus_type = {
+	.name = "qda-compute-cb",
+};
+EXPORT_SYMBOL_GPL(qda_cb_bus_type);
+
+static int __init qda_cb_bus_init(void)
+{
+	int err;
+
+	err = bus_register(&qda_cb_bus_type);
+	if (err < 0) {
+		pr_err("qda-compute-cb bus registration failed: %d\n", err);
+		return err;
+	}
+	return 0;
+}
+
+postcore_initcall(qda_cb_bus_init);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4926a43118e6..5dee912686ee 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -33,6 +33,7 @@
 #include <trace/events/iommu.h>
 #include <linux/sched/mm.h>
 #include <linux/msi.h>
+#include <linux/qda_compute_bus.h>
 #include <uapi/linux/iommufd.h>
 
 #include "dma-iommu.h"
@@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+	&qda_cb_bus_type,
+#endif
 };
 
 /*
diff --git a/include/linux/qda_compute_bus.h b/include/linux/qda_compute_bus.h
new file mode 100644
index 000000000000..807122d84e3f
--- /dev/null
+++ b/include/linux/qda_compute_bus.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_COMPUTE_BUS_H__
+#define __QDA_COMPUTE_BUS_H__
+
+#include <linux/device.h>
+
+/*
+ * Custom bus type for QDA compute context bank (CB) devices
+ *
+ * This bus type is used for manually created CB devices that represent
+ * IOMMU context banks. The custom bus allows proper IOMMU configuration
+ * and device management for these virtual devices.
+ */
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+extern struct bus_type qda_cb_bus_type;
+#endif
+
+#endif /* __QDA_COMPUTE_BUS_H__ */

-- 
2.34.1



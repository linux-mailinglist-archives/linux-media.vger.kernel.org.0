Return-Path: <linux-media+bounces-40309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9060B2CA1C
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 175DE1C20E03
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04FA2FF167;
	Tue, 19 Aug 2025 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpV5vJSb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7CD2FDC3A
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622552; cv=none; b=tcjDnm4n5k5DMcgCRsQDybCDMwu+F5kN+gIEjUMVWHz3MnZf0l9RoLc9ShmRsN13gM8x+tBYqytZdduPK9vnJftntpXn92Xx2N6XyQGUMFpdYDP+m4hiyQY2TRWaXN7v7dF5jCe7hD7iSqEwyMuzmzXdCq3pASfdxUz/ioRp+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622552; c=relaxed/simple;
	bh=6uARc0vcWDCi81bBukzSSmsTavWRG+fZaiu9oKnZQEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZTuW1Q1ZUw5mzmfWL/dlmX3OI1sDwDLj0fqUrTlklJCY8WkkQS6Qsk49KAQEZP4yf7Si3bukdvgroKEXLUsF9uReOTQstIzHpHrJ59ejVPJSFW8v+uQTs2V3eO+Bmz0k1AhaWGNkjhmHilnDBegSUCNct1yuCnuVszJKRBqmhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpV5vJSb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90i0f021904
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIdi5u8DuhRCI3eqLELOEnZhKOfN2ulzVRZrP+89AOE=; b=CpV5vJSb8pZnEcTD
	DQxK3GsFUCweaDj2sPH0e0aUB7NBV/eHVRccy2FVGZmTe8OIX2fRM4UKik5eaVhg
	oJKc6vez1oT/ImOW0DCtyfceTVCmnG2E7YTpmvIUYOTlOoWBwVpDPK3BrRn0ozPo
	S1HgcnDjBeHhzwX9q+dbrv7hGy5QrRvsvLlQczkx2FGbFgGbIYealfese1uOO1JW
	Aw+ZyOBoAR3QngCyj7Taj5ho3+9+uHE34aNQ2D9WfYhl0GRBY4Y2TJsZABTEvgJl
	pSXKkcenNmhgN9hmb50fYUDToEmgVOtApUtt9bRROhCxe2DNyLL6tvDP82I1iEyD
	Apw46w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cm224-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445806dc88so138367075ad.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622547; x=1756227347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIdi5u8DuhRCI3eqLELOEnZhKOfN2ulzVRZrP+89AOE=;
        b=uRqALCr7aogE+MwxfmIF+LsCsrcMwNCnPT0Kh19k09jOj4ekLTDkDjbUtZP8W45qaF
         UHWJpBm067oc11QqH38HPuPbo186IPOuS8HsPUCwWW9sSgc4VAFuK43Rp5X4ierOgyZ+
         TBYMGGWl4pa9I3EdhVMCy1o/v4ENsc4Y4EcxdUzCDVqDQW6tu4aQA7AJSubEPIROudXv
         YewxLdnnffnqQ/Q3BOGvpnHcQcJKIcHCMVxZHY2EhkbetK/1o5vFuX6fHxJL99EGlzJW
         SmtaWW21YBe12kIllwMkEuGEciw7MqSr1/GLlO3r+8WayNYSSrubnrbtxnsdfUlKhycO
         kfHg==
X-Forwarded-Encrypted: i=1; AJvYcCWaQhqKLw36SDJMM3V7/eu4Kw2TqRUXD1WR6Nnad5vs++l3XIWoHJk7xLNBbEQRi5b8eleIlSxq5jpMDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDyvPV6yf3fer1LFBadlOkceZLGHqdSjKRYUsxNm/0WCoC4omu
	7YDbuxfXijqjUZc3O2YRpoLkWYx4HOT07uqbC5T4jmyFk3JFvUOCdvZVY8WGojF/9EzwxQ79rZK
	4MA3/tiZQwYkuTu90tfn1qkmqqXh6q9s7NQ0LuAC0Lq7mg3djmqrZmldiLq/jTFCrSA==
X-Gm-Gg: ASbGncsnZnJ+4WKnpTP3vRoELW/zJYPgHudGFlD6Cf+ETJsmBRb4NW8wTC2uKq6E16G
	nBVfza+jhIUVLQd9Y63Mca8QLxlpdPib0zYyor62nilHEzJQf0tFY7sx+awOxxOR8p1dpIU32MP
	dVfYus7F8sTogOfRy/jWV3TfQ4ip6/HT0odCpgzeWNfQxdknQ1jB1WWeUR3j/9JjLPnAaSG5u7d
	oT0fMl5Cxn+dtTNFACEJ2VNk0ksM+pM/tPKolH5mmlBNa14odvH/vWOKec+KlcvFuE9+9N5/mlr
	f+hmSlKoJLySAGjAWXZe8aVHdwBassGzdUVvWH0EuGKBcvmhJ3mgWjdRSXH4WN1yhS8=
X-Received: by 2002:a17:903:f86:b0:234:b123:b4ff with SMTP id d9443c01a7336-245e030dcc5mr37283735ad.21.1755622546405;
        Tue, 19 Aug 2025 09:55:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlv3/HxdpCBT3YNIgL40FoV62d5oil2G8WGXtNSzI2tuHRffr1GEdKFOqkN74PCrIbi8L2Aw==
X-Received: by 2002:a17:903:f86:b0:234:b123:b4ff with SMTP id d9443c01a7336-245e030dcc5mr37283365ad.21.1755622545643;
        Tue, 19 Aug 2025 09:55:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 06/11] remoteproc: Move resource table data structure to its own header
Date: Tue, 19 Aug 2025 22:24:41 +0530
Message-ID: <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8gFX4kfaDumfTO7FSei2jf-m74NjzDa0
X-Proofpoint-GUID: 8gFX4kfaDumfTO7FSei2jf-m74NjzDa0
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4ac93 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hqicfOp3TDPPg1m-M2YA:9
 a=Y6HKh-LrsuiIPCo2:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX/IA76WEoqBGC
 +nsEcAB1A1nc3IH4Ss27iFnr125qKVLeUWekAOr0L0vzI/6Be5M2PM1eJZ7gVxzTVHqEttA5tm3
 FYQmp6AzAk/YZdYnbCP8d6t78DLjI6kuZS5cllVkhdxP41WxBzUeWXn98QbCEKzpq6Qk+oZDvMM
 dhctHX3OMzrUo1kp4tGn26CPfcv/sL8hnMuJgth+ebz8G6/aLzhgJdqdbthRzbtCz9fsFrl9nA2
 CXOQoV3hIBUuYHuojyTqR6waDBEIU650ahDgTuuP77T2+GQWyQjbJqbxBdHDZEiKSo7+YTazGzY
 DDdfzUzK5W13JnffMaViCdQh26QEuMbqqviGiYtb9B1MauOoF9p5Akxz25eDn0P9Ifd9ffweg2G
 2Q4dBzWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

The resource table data structure has traditionally been associated with
the remoteproc framework, where the resource table is included as a
section within the remote processor firmware binary. However, it is also
possible to obtain the resource table through other means—such as from a
reserved memory region populated by the boot firmware, statically
maintained driver data, or via a secure SMC call—when it is not embedded
in the firmware.

There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
etc.) in the upstream kernel that do not use the remoteproc framework to
manage their lifecycle for various reasons.

When Linux is running at EL2, similar to the Qualcomm PAS driver
(qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
also want to use the resource table SMC call to retrieve and map
resources before they are used by the remote processor.

In such cases, the resource table data structure is no longer tightly
coupled with the remoteproc headers. Client drivers that do not use the
remoteproc framework should still be able to parse the resource table
obtained through alternative means. Therefore, there is a need to
decouple the resource table definitions from the remoteproc headers.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 269 +-------------------------------
 include/linux/rsc_table.h  | 306 +++++++++++++++++++++++++++++++++++++
 2 files changed, 307 insertions(+), 268 deletions(-)
 create mode 100644 include/linux/rsc_table.h

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..7c1546d48008 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -42,274 +42,7 @@
 #include <linux/completion.h>
 #include <linux/idr.h>
 #include <linux/of.h>
-
-/**
- * struct resource_table - firmware resource table header
- * @ver: version number
- * @num: number of resource entries
- * @reserved: reserved (must be zero)
- * @offset: array of offsets pointing at the various resource entries
- *
- * A resource table is essentially a list of system resources required
- * by the remote processor. It may also include configuration entries.
- * If needed, the remote processor firmware should contain this table
- * as a dedicated ".resource_table" ELF section.
- *
- * Some resources entries are mere announcements, where the host is informed
- * of specific remoteproc configuration. Other entries require the host to
- * do something (e.g. allocate a system resource). Sometimes a negotiation
- * is expected, where the firmware requests a resource, and once allocated,
- * the host should provide back its details (e.g. address of an allocated
- * memory region).
- *
- * The header of the resource table, as expressed by this structure,
- * contains a version number (should we need to change this format in the
- * future), the number of available resource entries, and their offsets
- * in the table.
- *
- * Immediately following this header are the resource entries themselves,
- * each of which begins with a resource entry header (as described below).
- */
-struct resource_table {
-	u32 ver;
-	u32 num;
-	u32 reserved[2];
-	u32 offset[];
-} __packed;
-
-/**
- * struct fw_rsc_hdr - firmware resource entry header
- * @type: resource type
- * @data: resource data
- *
- * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
- * its @type. The content of the entry itself will immediately follow
- * this header, and it should be parsed according to the resource type.
- */
-struct fw_rsc_hdr {
-	u32 type;
-	u8 data[];
-} __packed;
-
-/**
- * enum fw_resource_type - types of resource entries
- *
- * @RSC_CARVEOUT:   request for allocation of a physically contiguous
- *		    memory region.
- * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
- * @RSC_TRACE:	    announces the availability of a trace buffer into which
- *		    the remote processor will be writing logs.
- * @RSC_VDEV:       declare support for a virtio device, and serve as its
- *		    virtio header.
- * @RSC_LAST:       just keep this one at the end of standard resources
- * @RSC_VENDOR_START:	start of the vendor specific resource types range
- * @RSC_VENDOR_END:	end of the vendor specific resource types range
- *
- * For more details regarding a specific resource type, please see its
- * dedicated structure below.
- *
- * Please note that these values are used as indices to the rproc_handle_rsc
- * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
- * check the validity of an index before the lookup table is accessed, so
- * please update it as needed.
- */
-enum fw_resource_type {
-	RSC_CARVEOUT		= 0,
-	RSC_DEVMEM		= 1,
-	RSC_TRACE		= 2,
-	RSC_VDEV		= 3,
-	RSC_LAST		= 4,
-	RSC_VENDOR_START	= 128,
-	RSC_VENDOR_END		= 512,
-};
-
-#define FW_RSC_ADDR_ANY (-1)
-
-/**
- * struct fw_rsc_carveout - physically contiguous memory request
- * @da: device address
- * @pa: physical address
- * @len: length (in bytes)
- * @flags: iommu protection flags
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the requested memory region
- *
- * This resource entry requests the host to allocate a physically contiguous
- * memory region.
- *
- * These request entries should precede other firmware resource entries,
- * as other entries might request placing other data objects inside
- * these memory regions (e.g. data/code segments, trace resource entries, ...).
- *
- * Allocating memory this way helps utilizing the reserved physical memory
- * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
- * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
- * pressure is important; it may have a substantial impact on performance.
- *
- * If the firmware is compiled with static addresses, then @da should specify
- * the expected device address of this memory region. If @da is set to
- * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
- * overwrite @da with the dynamically allocated address.
- *
- * We will always use @da to negotiate the device addresses, even if it
- * isn't using an iommu. In that case, though, it will obviously contain
- * physical addresses.
- *
- * Some remote processors needs to know the allocated physical address
- * even if they do use an iommu. This is needed, e.g., if they control
- * hardware accelerators which access the physical memory directly (this
- * is the case with OMAP4 for instance). In that case, the host will
- * overwrite @pa with the dynamically allocated physical address.
- * Generally we don't want to expose physical addresses if we don't have to
- * (remote processors are generally _not_ trusted), so we might want to
- * change this to happen _only_ when explicitly required by the hardware.
- *
- * @flags is used to provide IOMMU protection flags, and @name should
- * (optionally) contain a human readable name of this carveout region
- * (mainly for debugging purposes).
- */
-struct fw_rsc_carveout {
-	u32 da;
-	u32 pa;
-	u32 len;
-	u32 flags;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_devmem - iommu mapping request
- * @da: device address
- * @pa: physical address
- * @len: length (in bytes)
- * @flags: iommu protection flags
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the requested region to be mapped
- *
- * This resource entry requests the host to iommu map a physically contiguous
- * memory region. This is needed in case the remote processor requires
- * access to certain memory-based peripherals; _never_ use it to access
- * regular memory.
- *
- * This is obviously only needed if the remote processor is accessing memory
- * via an iommu.
- *
- * @da should specify the required device address, @pa should specify
- * the physical address we want to map, @len should specify the size of
- * the mapping and @flags is the IOMMU protection flags. As always, @name may
- * (optionally) contain a human readable name of this mapping (mainly for
- * debugging purposes).
- *
- * Note: at this point we just "trust" those devmem entries to contain valid
- * physical addresses, but this isn't safe and will be changed: eventually we
- * want remoteproc implementations to provide us ranges of physical addresses
- * the firmware is allowed to request, and not allow firmwares to request
- * access to physical addresses that are outside those ranges.
- */
-struct fw_rsc_devmem {
-	u32 da;
-	u32 pa;
-	u32 len;
-	u32 flags;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_trace - trace buffer declaration
- * @da: device address
- * @len: length (in bytes)
- * @reserved: reserved (must be zero)
- * @name: human-readable name of the trace buffer
- *
- * This resource entry provides the host information about a trace buffer
- * into which the remote processor will write log messages.
- *
- * @da specifies the device address of the buffer, @len specifies
- * its size, and @name may contain a human readable name of the trace buffer.
- *
- * After booting the remote processor, the trace buffers are exposed to the
- * user via debugfs entries (called trace0, trace1, etc..).
- */
-struct fw_rsc_trace {
-	u32 da;
-	u32 len;
-	u32 reserved;
-	u8 name[32];
-} __packed;
-
-/**
- * struct fw_rsc_vdev_vring - vring descriptor entry
- * @da: device address
- * @align: the alignment between the consumer and producer parts of the vring
- * @num: num of buffers supported by this vring (must be power of two)
- * @notifyid: a unique rproc-wide notify index for this vring. This notify
- * index is used when kicking a remote processor, to let it know that this
- * vring is triggered.
- * @pa: physical address
- *
- * This descriptor is not a resource entry by itself; it is part of the
- * vdev resource type (see below).
- *
- * Note that @da should either contain the device address where
- * the remote processor is expecting the vring, or indicate that
- * dynamically allocation of the vring's device address is supported.
- */
-struct fw_rsc_vdev_vring {
-	u32 da;
-	u32 align;
-	u32 num;
-	u32 notifyid;
-	u32 pa;
-} __packed;
-
-/**
- * struct fw_rsc_vdev - virtio device header
- * @id: virtio device id (as in virtio_ids.h)
- * @notifyid: a unique rproc-wide notify index for this vdev. This notify
- * index is used when kicking a remote processor, to let it know that the
- * status/features of this vdev have changes.
- * @dfeatures: specifies the virtio device features supported by the firmware
- * @gfeatures: a place holder used by the host to write back the
- * negotiated features that are supported by both sides.
- * @config_len: the size of the virtio config space of this vdev. The config
- * space lies in the resource table immediate after this vdev header.
- * @status: a place holder where the host will indicate its virtio progress.
- * @num_of_vrings: indicates how many vrings are described in this vdev header
- * @reserved: reserved (must be zero)
- * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
- *
- * This resource is a virtio device header: it provides information about
- * the vdev, and is then used by the host and its peer remote processors
- * to negotiate and share certain virtio properties.
- *
- * By providing this resource entry, the firmware essentially asks remoteproc
- * to statically allocate a vdev upon registration of the rproc (dynamic vdev
- * allocation is not yet supported).
- *
- * Note:
- * 1. unlike virtualization systems, the term 'host' here means
- *    the Linux side which is running remoteproc to control the remote
- *    processors. We use the name 'gfeatures' to comply with virtio's terms,
- *    though there isn't really any virtualized guest OS here: it's the host
- *    which is responsible for negotiating the final features.
- *    Yeah, it's a bit confusing.
- *
- * 2. immediately following this structure is the virtio config space for
- *    this vdev (which is specific to the vdev; for more info, read the virtio
- *    spec). The size of the config space is specified by @config_len.
- */
-struct fw_rsc_vdev {
-	u32 id;
-	u32 notifyid;
-	u32 dfeatures;
-	u32 gfeatures;
-	u32 config_len;
-	u8 status;
-	u8 num_of_vrings;
-	u8 reserved[2];
-	struct fw_rsc_vdev_vring vring[];
-} __packed;
+#include <linux/rsc_table.h>
 
 struct rproc;
 
diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
new file mode 100644
index 000000000000..c32c8b6cd2a7
--- /dev/null
+++ b/include/linux/rsc_table.h
@@ -0,0 +1,306 @@
+/*
+ * Resource table and its types data structure
+ *
+ * Copyright(c) 2011 Texas Instruments, Inc.
+ * Copyright(c) 2011 Google, Inc.
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * * Redistributions of source code must retain the above copyright
+ *   notice, this list of conditions and the following disclaimer.
+ * * Redistributions in binary form must reproduce the above copyright
+ *   notice, this list of conditions and the following disclaimer in
+ *   the documentation and/or other materials provided with the
+ *   distribution.
+ * * Neither the name Texas Instruments nor the names of its
+ *   contributors may be used to endorse or promote products derived
+ *   from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef RSC_TABLE_H
+#define RSC_TABLE_H
+
+/**
+ * struct resource_table - firmware resource table header
+ * @ver: version number
+ * @num: number of resource entries
+ * @reserved: reserved (must be zero)
+ * @offset: array of offsets pointing at the various resource entries
+ *
+ * A resource table is essentially a list of system resources required
+ * by the remote processor. It may also include configuration entries.
+ * If needed, the remote processor firmware should contain this table
+ * as a dedicated ".resource_table" ELF section.
+ *
+ * Some resources entries are mere announcements, where the host is informed
+ * of specific remoteproc configuration. Other entries require the host to
+ * do something (e.g. allocate a system resource). Sometimes a negotiation
+ * is expected, where the firmware requests a resource, and once allocated,
+ * the host should provide back its details (e.g. address of an allocated
+ * memory region).
+ *
+ * The header of the resource table, as expressed by this structure,
+ * contains a version number (should we need to change this format in the
+ * future), the number of available resource entries, and their offsets
+ * in the table.
+ *
+ * Immediately following this header are the resource entries themselves,
+ * each of which begins with a resource entry header (as described below).
+ */
+struct resource_table {
+	u32 ver;
+	u32 num;
+	u32 reserved[2];
+	u32 offset[];
+} __packed;
+
+/**
+ * struct fw_rsc_hdr - firmware resource entry header
+ * @type: resource type
+ * @data: resource data
+ *
+ * Every resource entry begins with a 'struct fw_rsc_hdr' header providing
+ * its @type. The content of the entry itself will immediately follow
+ * this header, and it should be parsed according to the resource type.
+ */
+struct fw_rsc_hdr {
+	u32 type;
+	u8 data[];
+} __packed;
+
+/**
+ * enum fw_resource_type - types of resource entries
+ *
+ * @RSC_CARVEOUT:   request for allocation of a physically contiguous
+ *		    memory region.
+ * @RSC_DEVMEM:     request to iommu_map a memory-based peripheral.
+ * @RSC_TRACE:	    announces the availability of a trace buffer into which
+ *		    the remote processor will be writing logs.
+ * @RSC_VDEV:       declare support for a virtio device, and serve as its
+ *		    virtio header.
+ * @RSC_LAST:       just keep this one at the end of standard resources
+ * @RSC_VENDOR_START:	start of the vendor specific resource types range
+ * @RSC_VENDOR_END:	end of the vendor specific resource types range
+ *
+ * For more details regarding a specific resource type, please see its
+ * dedicated structure below.
+ *
+ * Please note that these values are used as indices to the rproc_handle_rsc
+ * lookup table, so please keep them sane. Moreover, @RSC_LAST is used to
+ * check the validity of an index before the lookup table is accessed, so
+ * please update it as needed.
+ */
+enum fw_resource_type {
+	RSC_CARVEOUT		= 0,
+	RSC_DEVMEM		= 1,
+	RSC_TRACE		= 2,
+	RSC_VDEV		= 3,
+	RSC_LAST		= 4,
+	RSC_VENDOR_START	= 128,
+	RSC_VENDOR_END		= 512,
+};
+
+#define FW_RSC_ADDR_ANY (-1)
+
+/**
+ * struct fw_rsc_carveout - physically contiguous memory request
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @flags: iommu protection flags
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the requested memory region
+ *
+ * This resource entry requests the host to allocate a physically contiguous
+ * memory region.
+ *
+ * These request entries should precede other firmware resource entries,
+ * as other entries might request placing other data objects inside
+ * these memory regions (e.g. data/code segments, trace resource entries, ...).
+ *
+ * Allocating memory this way helps utilizing the reserved physical memory
+ * (e.g. CMA) more efficiently, and also minimizes the number of TLB entries
+ * needed to map it (in case @rproc is using an IOMMU). Reducing the TLB
+ * pressure is important; it may have a substantial impact on performance.
+ *
+ * If the firmware is compiled with static addresses, then @da should specify
+ * the expected device address of this memory region. If @da is set to
+ * FW_RSC_ADDR_ANY, then the host will dynamically allocate it, and then
+ * overwrite @da with the dynamically allocated address.
+ *
+ * We will always use @da to negotiate the device addresses, even if it
+ * isn't using an iommu. In that case, though, it will obviously contain
+ * physical addresses.
+ *
+ * Some remote processors needs to know the allocated physical address
+ * even if they do use an iommu. This is needed, e.g., if they control
+ * hardware accelerators which access the physical memory directly (this
+ * is the case with OMAP4 for instance). In that case, the host will
+ * overwrite @pa with the dynamically allocated physical address.
+ * Generally we don't want to expose physical addresses if we don't have to
+ * (remote processors are generally _not_ trusted), so we might want to
+ * change this to happen _only_ when explicitly required by the hardware.
+ *
+ * @flags is used to provide IOMMU protection flags, and @name should
+ * (optionally) contain a human readable name of this carveout region
+ * (mainly for debugging purposes).
+ */
+struct fw_rsc_carveout {
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 flags;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_devmem - iommu mapping request
+ * @da: device address
+ * @pa: physical address
+ * @len: length (in bytes)
+ * @flags: iommu protection flags
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the requested region to be mapped
+ *
+ * This resource entry requests the host to iommu map a physically contiguous
+ * memory region. This is needed in case the remote processor requires
+ * access to certain memory-based peripherals; _never_ use it to access
+ * regular memory.
+ *
+ * This is obviously only needed if the remote processor is accessing memory
+ * via an iommu.
+ *
+ * @da should specify the required device address, @pa should specify
+ * the physical address we want to map, @len should specify the size of
+ * the mapping and @flags is the IOMMU protection flags. As always, @name may
+ * (optionally) contain a human readable name of this mapping (mainly for
+ * debugging purposes).
+ *
+ * Note: at this point we just "trust" those devmem entries to contain valid
+ * physical addresses, but this isn't safe and will be changed: eventually we
+ * want remoteproc implementations to provide us ranges of physical addresses
+ * the firmware is allowed to request, and not allow firmwares to request
+ * access to physical addresses that are outside those ranges.
+ */
+struct fw_rsc_devmem {
+	u32 da;
+	u32 pa;
+	u32 len;
+	u32 flags;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_trace - trace buffer declaration
+ * @da: device address
+ * @len: length (in bytes)
+ * @reserved: reserved (must be zero)
+ * @name: human-readable name of the trace buffer
+ *
+ * This resource entry provides the host information about a trace buffer
+ * into which the remote processor will write log messages.
+ *
+ * @da specifies the device address of the buffer, @len specifies
+ * its size, and @name may contain a human readable name of the trace buffer.
+ *
+ * After booting the remote processor, the trace buffers are exposed to the
+ * user via debugfs entries (called trace0, trace1, etc..).
+ */
+struct fw_rsc_trace {
+	u32 da;
+	u32 len;
+	u32 reserved;
+	u8 name[32];
+} __packed;
+
+/**
+ * struct fw_rsc_vdev_vring - vring descriptor entry
+ * @da: device address
+ * @align: the alignment between the consumer and producer parts of the vring
+ * @num: num of buffers supported by this vring (must be power of two)
+ * @notifyid: a unique rproc-wide notify index for this vring. This notify
+ * index is used when kicking a remote processor, to let it know that this
+ * vring is triggered.
+ * @pa: physical address
+ *
+ * This descriptor is not a resource entry by itself; it is part of the
+ * vdev resource type (see below).
+ *
+ * Note that @da should either contain the device address where
+ * the remote processor is expecting the vring, or indicate that
+ * dynamically allocation of the vring's device address is supported.
+ */
+struct fw_rsc_vdev_vring {
+	u32 da;
+	u32 align;
+	u32 num;
+	u32 notifyid;
+	u32 pa;
+} __packed;
+
+/**
+ * struct fw_rsc_vdev - virtio device header
+ * @id: virtio device id (as in virtio_ids.h)
+ * @notifyid: a unique rproc-wide notify index for this vdev. This notify
+ * index is used when kicking a remote processor, to let it know that the
+ * status/features of this vdev have changes.
+ * @dfeatures: specifies the virtio device features supported by the firmware
+ * @gfeatures: a place holder used by the host to write back the
+ * negotiated features that are supported by both sides.
+ * @config_len: the size of the virtio config space of this vdev. The config
+ * space lies in the resource table immediate after this vdev header.
+ * @status: a place holder where the host will indicate its virtio progress.
+ * @num_of_vrings: indicates how many vrings are described in this vdev header
+ * @reserved: reserved (must be zero)
+ * @vring: an array of @num_of_vrings entries of 'struct fw_rsc_vdev_vring'.
+ *
+ * This resource is a virtio device header: it provides information about
+ * the vdev, and is then used by the host and its peer remote processors
+ * to negotiate and share certain virtio properties.
+ *
+ * By providing this resource entry, the firmware essentially asks remoteproc
+ * to statically allocate a vdev upon registration of the rproc (dynamic vdev
+ * allocation is not yet supported).
+ *
+ * Note:
+ * 1. unlike virtualization systems, the term 'host' here means
+ *    the Linux side which is running remoteproc to control the remote
+ *    processors. We use the name 'gfeatures' to comply with virtio's terms,
+ *    though there isn't really any virtualized guest OS here: it's the host
+ *    which is responsible for negotiating the final features.
+ *    Yeah, it's a bit confusing.
+ *
+ * 2. immediately following this structure is the virtio config space for
+ *    this vdev (which is specific to the vdev; for more info, read the virtio
+ *    spec). The size of the config space is specified by @config_len.
+ */
+struct fw_rsc_vdev {
+	u32 id;
+	u32 notifyid;
+	u32 dfeatures;
+	u32 gfeatures;
+	u32 config_len;
+	u8 status;
+	u8 num_of_vrings;
+	u8 reserved[2];
+	struct fw_rsc_vdev_vring vring[];
+} __packed;
+
+#endif /* RSC_TABLE_H */
-- 
2.50.1



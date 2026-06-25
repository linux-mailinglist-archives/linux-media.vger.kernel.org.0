Return-Path: <linux-media+bounces-65638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dImsJX4vPWqQyggAu9opvQ
	(envelope-from <linux-media+bounces-65638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:39:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E586C62FA
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:39:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KSstLolM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ax0Xhu+f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65638-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65638-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30F8B301516D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DCF339853;
	Thu, 25 Jun 2026 13:38:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106F1F03DE
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394739; cv=none; b=Qkev9XAe2uN0kz1IEzQ55Po+EnHKJg7RINawv05QPZtm7ZK3I/kZ026nVDTaTK/OwYmMWswUkK1VmPkX36MVdQwjSp5trxgnr4G6wecShk2IpW/Gr3VNVKYHXxCkTncKYQPI5SBrh/J0NAhs73Qgvdmu0p50onqX4wVCmUnBExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394739; c=relaxed/simple;
	bh=oYWkP0pmqxe6KndoKRn7TRgu629HFHLmEdTwDpLhYBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpVT7JY8nVXreqfRCP1Pkx2WFcBsBCAd1Bs0qGMibOsmxhHvhcY72g4Ztl3LbzTOyzsZMnTHrpWdqHOtiYjFQai9rmdVrTfNb1ZckwoDbHvZSTPgiYpyAroj2D50U87JXWh0SYdgy8ibf5DDHWxpd/F4HJLnyBboKpt7fh9TjfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSstLolM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ax0Xhu+f; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k1I21724353
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZr
	MmwuGftg=; b=KSstLolM7xiD5AJGNyH3vhpZrf5n7VbWZbXSlIbWjbmg0+tI1fT
	HkCm3v9xZ8yVYG01kjzw0lqZMoHAm2YUQFVRSIxU4cj6iuXk5m8kOfEdE5DMRmgY
	OeoTKzXaTJCI7GFQWpRt6BT7/jrwOHYOkj/cQHpbYN1OXpsJZ81VFjUew1qBlCos
	SzkyZOymcdRzEJ21BakKPrEwbw1wVGQZDuZ5W1KzXS0yfW8Hl/eZCI4kRUzSDRRz
	I8icXK4OHldK+2gnbBVGDCj9jAaKV2V++Y1J8zHhjzsxgtDldfDPbNY0ESr+O6dq
	Kwsc6Sium9tsVJCWE185j1H6pDc96gYwPQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dvghq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so547690885a.0
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394736; x=1782999536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZrMmwuGftg=;
        b=Ax0Xhu+f2LA/eIjqu3MunxqAWpk8WXeY+TpOIZwt7y+cYwklRE0MzQKEmdjBe8rYAC
         MttrgIvjXL6CleGB0W8IeStzT9h50sT6/1UwdL4PJYzSynpDpXM2WsuDzTPsaCTG8Gwj
         w6xxLeZhsLjMZnFhvH/LxNOL33GAFz92kxTWN/JyAmLHlzmz6blOEg4BHofNCglb61/T
         +dnE/4etR39qbM6nwWWDTMWOAVk+SGARzaDC8ldrSJsnErTvw0O9MytDchRQ0t0watIq
         hcDd7eHxWV5UPafxPFamPP3tpaeX3hD1F35SVrq5ae4biFAqXgGq9i+IPen5BEwIXHjW
         q1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394736; x=1782999536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUxMXib9zaC8reGAmsfaOzOGvoqPesJ2hZrMmwuGftg=;
        b=ffsJ+OYvRDp2HuVrDaIrWYPzEyiEhBPmw7kMcal7oraYN97FKSS8+t4u6oaLJ6QgY5
         CL4CcpI92GUo4M//ZBvq9hZ1SEQDIbuU6/NMjnuE+Qxp0fgRXCZ8nNtE27loLFWtS/G0
         yt6tvZ+4Ij3vivS/kA+9jlpf5GO0lS33rgW/fOqdIxTa0EZqHjH7mBqLK56wgscriV8J
         O8tVdfd/0tmnk24WekNVd2PESdQfwApCZoKkENEI3e3sxO6dPwF0f3BMo6Aofhg/t2oa
         Ev1giVHJ863Mj7LsZ0kBT+E+qhtCufNR6iXrrLOhWqo+MrY17UqljG2nXkDxhuITjF6I
         v/KA==
X-Gm-Message-State: AOJu0YzE6sF00imQsGcex61iWZOlp8t1IUbZmE64yTR5t71fK2EWMV9U
	m7dvJ8pCc4/a9ZIwx/XSbtPNCkZmrXB9Pdven0z207MpdkQzjSWKAvTWFAsqMtdA08wWROXbAW1
	eEdlCr8pv6dgAat6stWucTfrcjZ58vmeLM5gbSiIclC4f4kQNJsyEmxbVYyww5LmFFwjKVTZQb+
	Pc
X-Gm-Gg: AfdE7ckZ0ooTyvO7/3yddYlT4RdZf5JdnTi+l/tHVQFr2jWJHyC2OY5n+FyBwYhcpLw
	ftmkGW0XT7dnHkxusEF2Mlj3UFVxPzF14KqNkzYyYJyu6jUnwc8tJWgg+o6Zl8VtGdPxfFoQfJK
	Ox9KwqzbJ3VItVfcDOnnsxEPVafrPCD3CmsrqcaOgxH7TOVGWifKF07gUQ2MPFR7SJ+kzozmWfc
	vKvAB4JTNs32ZsU52m/vylN7BELDjUIQpSID6nURo3xdLhPGJOo177VLNSubY13oSfzBPeVACd+
	ZcY/eGxgakDjzmER0z7bbZxRxfzTzcoK/GSgdFlRorqHxBBkf2XZtsn2frF7c6pB4ruLwQQ7FDW
	5hFbYiLoHYAfd/KxoO/kyUK1UAnOSDt/TWeg=
X-Received: by 2002:a05:620a:2994:b0:915:5379:b511 with SMTP id af79cd13be357-9293ddae94fmr368992085a.43.1782394736242;
        Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2994:b0:915:5379:b511 with SMTP id af79cd13be357-9293ddae94fmr368986185a.43.1782394735613;
        Thu, 25 Jun 2026 06:38:55 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:54 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Thu, 25 Jun 2026 16:38:25 +0300
Message-Id: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dpqM009F3WkOM8MwxecVx0Pj0ISj-2Kn
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3d2f70 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bNK7v6p62rK0NTNIeiIA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfXyok1DdTxzXYa
 3QgoWRv97xkpBrqmNx7PuOQxp2xZ8fL7h9FOSzTqTdXvMB6KS0upPu9tNGCWfANWroqTV9A+f1C
 rT181oVz+EtLmYVLTRqBpfIkQ8xmL9g=
X-Proofpoint-ORIG-GUID: dpqM009F3WkOM8MwxecVx0Pj0ISj-2Kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX4eEbqFEfhVv0
 1jjS886CyGk/XnjEfB2TmB3iQNE/IFWOVKodVJp+87JC+qLL+A0CjC/p+bhlFMVy02VHsXTAJE/
 6Fmx00euzVTQaTiSfJ+5FVCHrSkvvKgFf3xJKbzeTdmdEWuv9+DNMZCstWb49F+h97xpX57dhNm
 gSFyHZxF28MFlSva5JHAwBBHCrW996To+F/jaTLe/xPQ8ZTlli3YtCsGCdmYZsEV4CAFRPlL526
 BsVNxJZSWO5N2YN6H4hce0UrpeT+r4+G98zM+vSqYKcllyH6Ny4i70MZmlXx++23e+SBDSzwCXZ
 4ccdi2hP99/+jz622K2H2BJXWc55FCikCInoXk7gahlaY77sKh1U0HxBede3t8lALCPJgLpBYXN
 LPb+CxQ5zmXFn2DFBR+pkbcOOzVK5XM1abzOKUpKQuY8m0qz8XyCRph43V+Nrg5cbzqyIMhxDXO
 9/Yr6QAwBl0r8oiXoeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65638-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92E586C62FA

This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

Patch layout:
- 1/3: dt-bindings: media: qcom,jpeg-encoder: add binding
- 2/3: arm64: dts: qcom: sm8250: add JPEG encoder node
- 3/3: media: qcom: jpeg: add Qualcomm JPEG V4L2 encoder

Supported compatibles:
- qcom,sm8250-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)
- keeps userspace interface within existing V4L2 JPEG controls/framework
- uses runtime PM for balanced power transitions across stream/probe/remove

Functional validation (hardware):
- platform: Kona / SM8250 / qcom,sm8250-jenc / RB5
- tested with v4l2-ctl and GStreamer (v4l2jpegenc):
  - single-frame encode: 8192x8192 NV12
  - single-frame encode: 1920x1080 NV12
  - single-frame encode: 1920x1080 GREY
  - GStreamer NV12 pipeline to JPEG files
  - GStreamer GRAY8 pipeline to MJPEG output

Changes since v1:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Removed qcm6490 and sm8550 compatible strings; this series is SM8250
    only.
  - Fixed clock-names block in the binding example.
  - Added operating-points-v2 property documentation.
  - Fixed reg in the example to use the correct 2-cell (64-bit) format
    matching the sm8250 soc node address/size cells.
  - Dropped reg-names: with a single reg entry it is unnecessary.
  - Removed description literal block scalar (|).
  - Dropped _clk suffix from clock-names.
  - Added iommus description in the properties section with
    minItems/maxItems constraints.

  Driver (media: qcom: jpeg):
  - Trimmed hardware register map and definitions.
  - Migrated to devm_clk_bulk_get_all() replacing per-SoC named clock
    arrays.
  - Migrated to the OPP framework for core clock rate and performance
    level management; the OPP table is embedded in the DTS node and maps
    performance levels to frequencies.
  - Switched to devm_platform_ioremap_resource(pdev, 0); reg-names no
    longer needed.
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - Switched to devm_mutex_init().
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Atanas Filipov (3):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

 .../bindings/media/qcom,jpeg-encoder.yaml     |  135 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   65 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   17 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  259 +++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  313 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  109 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  354 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1510 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   39 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   30 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  527 ++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1136 +++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
 18 files changed, 4701 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
 create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
 create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
 create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h


base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
prerequisite-patch-id: 8bfa054e24f9de8d7a09cfab8db0efff173d98fc
-- 
2.34.1



Return-Path: <linux-media+bounces-66704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OQOSDKRaS2quPwEAu9opvQ
	(envelope-from <linux-media+bounces-66704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:35:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F770D99E
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oW2GRq2I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DRjjCKjZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66704-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66704-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 134C03119812
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C943DFC8A;
	Mon,  6 Jul 2026 07:11:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF53C8716
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321891; cv=none; b=WPx0uifdK/qrRB5J2YOJIPllWdBPS8kJr7cfSEkz6kvK906YoDvl940sv2Thq5gc4GAbLjx3kNL0yebFQ8c9cfKP6fGf6ilPFXYvS59hRwvOfK52E9efPuUhxwrYJyqcOKe6h5+1rPwjHaefWq2bZalOLXuOxekJzIG0n6F7a9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321891; c=relaxed/simple;
	bh=r1jwcyxr5Dt3ECzt6tKAgLMIjDYT8uuPD5cATFscYPc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fotZMttYOKGnHbdAPqdNcJo1kdpUMAVsf1+V/spYFnpS6GPDlUbMQIPz4Bv7k2dhjSgWeWEHz9QVsHPFPSn9QZUrGFr9UaF7TG14oXDKSEbEDXmpUYqDtV5ddj70CK+vZtrPMVWfClKjympo1KPI3UyYyOaFOJ6u4NIz1fMQRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oW2GRq2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRjjCKjZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SmZ3593989
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 07:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J74KsC5QU9N7JkW3KRj+XSHfFO4dRMv8Liw
	gGdvHfPE=; b=oW2GRq2IzvD72W577JBoe17OxOKTr5esnC58wwGNV02DZaUZ1Sj
	II5a4WYriE/McnSS1+jcIHvXyy1O+C36UZtx1qDEiKBvJMHUhs5PnzPnfqYhXnks
	xRP+lDevqwoCbVVI5Eghz7c10ykXTGnBiuW7VVvQG3nccT32S/7e9/09wQR0yI+n
	5ScV9a9s3+oSEddgKMr4aRm44BqM77YWMNdlfNEgpbtmqGjvon/AYWrYgXxvgW4t
	BwrSMX56/b8bx4PMMOEMqmhssNT0tQcO3QIOmY/ERUc8PhaRSyXo1EexrhQqESov
	qOKkYmBOeDZj/Q82k3D0DAgTr8p1N0LxNuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgw9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:11:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e59b0e0f4so188863285a.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321877; x=1783926677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J74KsC5QU9N7JkW3KRj+XSHfFO4dRMv8LiwgGdvHfPE=;
        b=DRjjCKjZBe4yeV1ubryyfWtwhRD2a7o8lO0S85IIbZzF5q26jPOpBBF+mWQisWias5
         MiW6P7f5Nkf0jDCpTRJ/z0u/edI/G+DrEMjuCeIQQzUAEqd/bUV5L2Mk8O/vOblemxNg
         HLFvnjmHPH64H8if1ndsNCiyjjJp5O/BLEAim9ZxQfbJNlGbRzWO92wf7OoirEjvBIDr
         9qu62BZKUidi9ZQEOnj71/eX1n+5/THXe+imX3G8sEVaTTSJXCZzb89NPiRTII8RqAer
         vAGoh8P2TFvQiJPzbD1OPFYXAzmOTGnuArSUHrGaaxwxE1ppKbDykG5JUBtKgIYmDnIo
         t1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321877; x=1783926677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J74KsC5QU9N7JkW3KRj+XSHfFO4dRMv8LiwgGdvHfPE=;
        b=foH5eLjm90Q+7Yz4ztH6yWFhwRfDPesq6u00yfuhewYRW0pHaxAluMHyJpI49FGyuP
         vd6+3iBiTSETMbpZswY2y4BkRd4QaPW6MRGpEztVODXbUJ99z1u1FzmRNc461/TUlIGG
         SrbotemllmIkriz0J0qEDoCFJCci8No4zZSXFFRxbLawjAD9bPWM5aNRofUnB5Rj8jt7
         +Gd5IhEKxq7i/7PDcciGUX7HmZ8hN6vlAYh+c6vUrq6TtCcNt5UYzUTKfd3tZpt1fHwu
         1AzAP0M3wkf11vNDCqrg3+J2u+leqypmzAqxdMh27aZWURhUJs0Ucoxx/KqXV1CWwN7e
         CIPQ==
X-Gm-Message-State: AOJu0YyBOJFvfIvP0xnKLsU3nbkvfH99ovxnMXGgBrps60sHqO78l6Se
	Xy2c64d+ErvQL8SE0cpzVncJCeR6G4xHjo437qoGk92P/u38xygFmJqc81Mlw0CInpYQGE7WcQL
	wp7vnEkJ6eHgc6dJeUTlUf23rBSrCDSvOZq61HIzDwVDWpxljlnLjpSILn872EcrNvxCb9crycM
	qu
X-Gm-Gg: AfdE7cnUplDQYqo40I9Z6bFqok5vh/px3aVyNwrAhwqXkGzhjOLw+6b+dZyGtS1dLxw
	XHBiStqQ78DdVG60CUVapU8a3WY/mno7fZcKnzl8SPLUw0CokyFo2U7i6sAODvWP0JUduvVLApa
	BCLRJpjqW9jzLKXDatnFepP4zqJ8Uci97wd/eBVhCSI4IrVAvGsLt8aAu1T9LRmkUdkAgNuMA2v
	SJpDJZHVJdpZP1heTdCpQC6gbPoKcxbnw1TIr7Cd0+eV+FCDzgpEbxi2PGLcwELWAkKEPcpL4M8
	G5/br3N4LFCIeBmXdnVi/HKeWP3AC3kbkYS14KQH7OoYavCs7I5+854rzeGrSb4/9p9dGcbrM+3
	Vmfzkabz/tgoPt4NnzfJja4AxB4ITUcs84AE=
X-Received: by 2002:a05:620a:28c6:b0:92b:7420:bd7b with SMTP id af79cd13be357-92e9a529a23mr1371422685a.66.1783321877307;
        Mon, 06 Jul 2026 00:11:17 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:92b:7420:bd7b with SMTP id af79cd13be357-92e9a529a23mr1371419385a.66.1783321876806;
        Mon, 06 Jul 2026 00:11:16 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:15 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Date: Mon,  6 Jul 2026 10:11:08 +0300
Message-Id: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b5516 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=xq3W2uTSAAAA:8
 a=KKAkSRfTAAAA:8 a=fvEfv-lMOMBzJYUFIVYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: McWP3QpXHGbtiYv5hcfJOuk3p8aymM7c
X-Proofpoint-GUID: McWP3QpXHGbtiYv5hcfJOuk3p8aymM7c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX98njpXfDvGfF
 jUSY8Yq2GXAr/3/sgb8j4CZb8aB+xplftxEH7fCv5DkMzPZdSV29VUF6AAYGS7CQQd31u98dxhW
 6B8P45ieWaUPXwaXGRad1GAmBftdSJg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX2NzLJYKBNUQC
 hVFyAY/nFgc1K4YbT2v6zPtQVpotBERxCpiaCakNd1veN3fBkpdoC9cwi5vB7OW+1I0EEsdIL5V
 8sFRJ2XD7tGtah/XMZwbV/pWe7eUp1rx6gnKeczEMfU/hEzD5daTX1uZENCYhBH6dC8g47Txok5
 LZ3522Z2arG7mBo+WCy7Nlm6Vj5m8GpzYP8ZMAdDF4FXvzjOS2rCGPrWXTOKihUGkvyEkD3FnhF
 +jBxp6PzCn7AxTCd72evBTo8FCS+IWRx1K3pDop5Th9E/5boaRqB3NhlubmpCJmR/Johyek5nTf
 Q3z/EIkFheyTHfkP+RADo8ub4LQrhfJOlASPs4OKQPaC+uCCO2f1og2cHsM1P7/R5Yyzseyc7fI
 Jbce93huyvcDityr+Mj6tWCjI47zDrtlQTttOapa8VBFyOshDmhjyps4EdVZFlf3g/308EUdlca
 1FG2+/1kUBiqOethKQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66704-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linuxtv.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE1F770D99E

This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder on SM8250.

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

The JPEG encoder is part of the Camera SubSystem (CAMSS) and is described as a
child node of the CAMSS block, allowing of_platform_populate() in camss_probe()
to register and probe it automatically.

Dependencies:
- Patch 1/5 is related to bod's work queued in patchwork:
  https://patchwork.linuxtv.org/project/linux-media/patch/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org/

Supported compatibles:
- qcom,sm8250-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)

Functional validation:
- tested with v4l2-ctl and GStreamer (v4l2jpegenc)
- V4L2 compliance test (v4l2-compliance) passed

Note: The handling of shared camera subsystem resources (power domains,
interconnects) for child IP blocks is still an open design question.
We have followed the established SM8250 pattern for now and would
welcome guidance from maintainers on the preferred approach.

Changes since v3:

  CAMSS binding (dt-bindings: media: qcom,sm8250-camss):
  - Added as new patch 2/5; allows #address-cells, #size-cells, ranges,
    and child nodes using unevaluatedProperties: false so that dtbs_check
    validates child nodes against their own schema without requiring the
    parent binding to enumerate each child type explicitly.

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - Dropped soc and camss wrapper nodes from example. (Dmitry)
  - Removed opp-level from all OPP table entries. (Dmitry)

  CAMSS (media: qcom: camss):
  - Replaced patch 1/4 with Bryan O'Donoghue's original upstream commit. (Vladimir, bod)

  Driver (media: qcom: jpeg):
  - Cleaned up driver patch commit. (bod)
  - Removed redundant "Provides" section from Kconfig help. (Dmitry)
  - Removed unneeded headers from qcom_jenc_defs.h. (Dmitry)
  - Moved V4L2_CID_QCOM_JPEG_* defines to v4l2-controls.h. (Dmitry)
  - Removed perf level and clock frequency constants. (Dmitry)
  - Replaced register mask enum with direct mask constants. (Dmitry)
  - Replaced manual clock scaling with dev_pm_opp_set_opp(). (Dmitry)
  - Fixed clock teardown order in PM suspend. (Dmitry)
  - Removed ICC management from driver. (Dmitry)
  - Switched to _DEFINE_DEV_PM_OPS for PM operations. (Dmitry)
  - Replaced kzalloc_obj() with devm_kzalloc() in probe. (Dmitry)
  - Added IRQF_NO_AUTOEN to defer IRQ until hardware is acquired. (Dmitry)
  - Used devm_add_action_or_reset() for v4l2_device_unregister cleanup. (Dmitry)
  - Moved generic JPEG marker defines to include/media/jpeg.h. (Dmitry)
  - Reused v4l2-jpeg reference Huffman tables in header generation. (Dmitry)
  - Added usage examples to the driver commit log. (bod)
  - Added baseline performance measurements table. (bod)

  DTS (arm64: dts: qcom: sm8250):
  - Restored camss interconnect-names to original values.
  - Removed icp-mnoc interconnect from jpeg-encoder node. (bod)
  - Added #address-cells, #size-cells and ranges before status. (Dmitry)
  - Padded jpeg-encoder reg address to 8 digits: 0x0ac53000. (Dmitry)
  - Removed TITAN_TOP_GDSC power-domain from jpeg-encoder sub-node. (Dmitry)
  - Removed duplicate iommus entry. (Dmitry)
  - Used ICC defines instead of 0 in interconnects. (Dmitry)

Changes since v2:

  Binding (dt-bindings: media: qcom,jpeg-encoder):
  - IOMMU stream IDs documented in binding description. (bod)
  - Dropped "Properties documented:" section from commit message. (krzk)
  - Dropped clocks minItems constraint. (krzk)
  - Renamed clock-names to match hardware signal names. (krzk)
  - Renamed interconnect-names to reflect path topology. (krzk, Dmitry)

  DTS (arm64: dts: qcom: sm8250):
  - Removed cell-index; use lowercase hex, no 0x0 padding. (Dmitry)
  - Moved jpeg-encoder node into the camss block as a child node. (bod)
  - MMCX power domain not added to jpeg-encoder; on SM8250 MMCX is
    voted by camcc, not by individual IP blocks. (bod, kept as-is)

  CAMSS (media: qcom: camss):
  - Added of_platform_populate() in camss_probe() to register child
    platform devices; no conflicts with existing CAMSS resource
    management observed. (bod)

  Driver (media: qcom: jpeg):
  - Sort obj-y entries alphabetically in qcom/Makefile. (krzk)
  - Use devm_mutex_init() instead of mutex_init(). (Frank Li)
  - Check return value of devm_mutex_init(). (Frank Li)
  - Kept return value check on dma_set_mask_and_coherent(); consistent
    with upstream media driver practice. (Frank Li, kept as-is)

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
    level management.
  - Switched to devm_platform_ioremap_resource(pdev, 0).
  - Switched to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros.
  - platform_set_drvdata() moved to immediately after allocation.
  - .pm uses pm_ptr().

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels


Atanas Filipov (4):
  dt-bindings: media: qcom,sm8250-camss: allow JPEG encoder child node
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

Bryan O'Donoghue (1):
  media: qcom: camss: Populate CAMSS child devices via DT

 .../bindings/media/qcom,jpeg-encoder.yaml     |  146 ++
 .../bindings/media/qcom,sm8250-camss.yaml     |   10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   81 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/camss/camss.c     |    3 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   15 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |   37 +
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  314 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  109 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  331 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1625 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |   15 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   19 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  410 +++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1154 ++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   23 +
 include/media/jpeg.h                          |   33 +
 include/uapi/linux/v4l2-controls.h            |   21 +
 22 files changed, 4527 insertions(+), 1 deletion(-)
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
-- 
2.34.1



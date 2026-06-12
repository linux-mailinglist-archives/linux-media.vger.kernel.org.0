Return-Path: <linux-media+bounces-64733-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1VM4AwJiLGoEQQQAu9opvQ
	(envelope-from <linux-media+bounces-64733-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:46:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33667C2B6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iaEZBFKp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JIWyBKkB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64733-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64733-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5159A33BDB8D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876B439C645;
	Fri, 12 Jun 2026 19:44:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230C368D5B
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293464; cv=none; b=R7QK8JS+UArxbn9IT5sbt7glDlfiq41k1c6NOu+hDmw1DCVfkdC4chQMwa8z5dKnu/gnC45Di41feqwroZhr+OCVLqlAKSvyeDqEpxVChsHHcMWh4OFkWrRb8p82KtqDz1w1r1yDoE9K4CKXX+SprFEL5aqISCEciOsOzt6xNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293464; c=relaxed/simple;
	bh=QNZ3+S2PpCImXGWksF7IvgVfrTcvdAu1a5ANpPC2IcA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lB8XPaj0Yqm5V2+mWwxjfHm73EZle8ytHnQAgx4MX57j+1uZMllVgUAlLriO4lbSmOhfcRVxCz8rNhZP6ikR/an23U/6KsIKfhVbxMnDzARDVIonWDuYzPwsOFkQd2AmaRv3RNDZ9Qzzsr6SsAkKJ5c6B6+DvJIVedRnoMiSbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaEZBFKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIWyBKkB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGW51Q019941
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssF
	ZCOYv0OA=; b=iaEZBFKpDZenxUu4FIYL00sKcjK/idjWEOa27XHVdEgldPrbEo6
	uXXtDiiSqSImaculrzr2ZJ1a+N6lQNijGg6HE3Xqofr5+qHop8EekLiX9ZR24ePj
	wRiBvxarWXCAjgYyy/OpjVlTbr4Sq4FKf2y/CFW8a0pzo6gapdm5ZBofgdyGWArX
	VhA/DijBR/AhZoM2UH7Ys4yE+Y8RFIYXYyttzrXA10ZVhR8/7OZh7XmYovGS1NRI
	bzdrYXo08nnB55eAUHhawb+lKJRVhTLD3oMGOMkQuMPdPlN/kLRIyrQ2I2UcFOCi
	9OKgoV+nGdtYLBuH74OKtYLVhqSKrffcHCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbmrg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9159bc52211so191752385a.2
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293460; x=1781898260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssFZCOYv0OA=;
        b=JIWyBKkBr1sJYqUGrjDSjaVaqE/Zt6uUDURCPRWneaI866IsI6PrZFTmLWnEIvHrce
         LM8Sx8K2WhvsyOaxSgbtZQ2W+/O3GVPIeU4wwEiFitZUO9Y2sKt3yuxYWLXc3FCJ6sgU
         8SwbCYGKbt+4VVmw7JmDZGS4vv8JCIxrdk/2Sddvi7eaugdLO2wvXP8tRtPTyet3Cfm5
         QPNZXZ/D3WBLBD+9HtHzPrP2T5I1+QLdsfcxlSVR2vI0etaAKNY7+EtrA4fnWzfDQk5M
         LGjryFZEjyw2gr1mWk8XFjOIIXE9bGNtAHs5DXIxAZ7J2QLeULzMJlQhB8hBe2KFOy4+
         QE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293460; x=1781898260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vEg2rm8IN+wa6gpeS8irIAvx2VUQmNQssFZCOYv0OA=;
        b=o3UOD6oRlo/mFU0cmGGYtDV+s4d23nUpCjaGPSGw7tdNMRvYe8UDVpbx+FWnr4SnrF
         LdwO9ldza1ecrUkOZ2xKaymphWshf7xCIQ4wY0XgI9AQsZ3O6+Ifk6pVON2keL7V8XTv
         FEg5LcPa5AgEepF/aY/xsIw3UqAKG4jHVik7yT7C/WGlrvgEnLZgdiAR0SWCOmzsFP5J
         Xm/k+3f9FNxQndOK300gwJWvZZZhi873mLID1/g/yJrofpOWoZ96luYn3wbSLug5VF0d
         vUVJMPZetjwoSC7T+LB55RZb2RQnYksZPuPhmO8mMzhq1v4SO6uWJ6d21H4iQmdhk8al
         uEqw==
X-Gm-Message-State: AOJu0YxUFzTozkzEeCFL3My85nSAh54lwcltZ0HFWfGVDepVHl3+FMRm
	6D9XmLvJsPMG7UUI55a8+6xe+/EbvX70TROyyc1RJw2B9O0Y4OCYIAwSBPLhGaBxdTpWTBQx/l6
	i5qEPVMZlCvxBSSKZj4nD0ayU/5W0d2Iyu8DIttSDpcUODgJEfRZK1X1KUHz8qun/gsZHGvW0PK
	7F
X-Gm-Gg: Acq92OEY4SEgpi81YPFrOLmkcFe6cLsUkdJsXtoUognMQVlia5+4v/pIPePSkicMeyI
	uBGH5p9I3Ghdczk7fpza8pTtc0iCjymmRNkTZZrrwgjtcS7Of5qpdBLGHIb4iFP71rU0QiC2/iA
	fa7yS4zWmXhrGEQvU+QbUkuxGaHena+vHA3UzqUXBnFGuxukQsTrV+ELIYcD2+qssdcZs9sD2TH
	1xpl2xHGCbmW5StT4G1ASQJAJdsIuxZjn48QEXR1x17NQCXQCb1C34SGwDsCy2E1CJ8X9cN++Qt
	bvjc0dKMZBisxdbMBE+PMf+nltOVahOlxQ+COr72N/33TGuIbeDeffFXA9enH0KDAFOEsbh8Ft0
	7ouzUZJTZE+woT+6HWrCoj4/jo8rAvNbh03FMIXvLv44rbw==
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr187235285a.55.1781293460201;
        Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr187229585a.55.1781293459666;
        Fri, 12 Jun 2026 12:44:19 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:18 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG V4L2 mem2mem encoder.
Date: Fri, 12 Jun 2026 22:44:13 +0300
Message-Id: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QHm8dNZBeR8kgmMbMBD2RcLyYRDFZgNv
X-Proofpoint-ORIG-GUID: QHm8dNZBeR8kgmMbMBD2RcLyYRDFZgNv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX8QiOjsxC42sv
 82m8vbxIqnBfd3AtU/Gt4WshiIEicvXL8QpPbTur1Yr35Da7FBOFPuQ18Rymw7O92x/bB/RCEzA
 iTmfnVVXprqPJeeK0IDw4EIZoQ0aM5s=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c6194 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=yUVlmgnzSyTKfynlg6sA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX7rS+zsQkrGwr
 Ag5nkfvI32RKRmU6j+5CmciDqs92hkGXY3my/C+KyyG6YD07SGlVCoK7JBYj4YOor30WN3Z+Lzi
 0qlGcFukHrSK41Q5zeOvhsRt/E9nOglFxcoqUTkuJ8TyE5qNAczcXaJMm/TIW1RKoIKm9vXlL3e
 MIpU4ZEVGmGL54blqFbRbt0viLHQJCzrtIssVYL0gunxn3B+4ksjy9A5kiPrPvvMgOVb2hRHI+k
 Il5Lxm/Lqo8AgbAQx7WvAbbI0q2gjbM8p1SeFsE13kyJLZGbSDEkhIz6YPjDM0y41gYgjW9oxGG
 EuLA/UYY+heMEA7gBv0rQwUvApbn3WdMqGp1J1L4g8jiVJ+h5t5mO16HrjFqi0MLlGHNxgYmkSo
 wxt5Io3DvZQy0pKaY7X4nQjyZOx2gGPlBqCf4UKjKT2eJZAQ7xqZo57qVflxHLeu98lGeDChvKs
 8uwrp1fa0QbrkCGW2fA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-64733-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE33667C2B6

The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
framework, with DT-described hardware resources and SoC DTS integration.

Patch layout:
- 1/4: devicetree bindings for the standalone Qualcomm JPEG encoder block
- 2/4: SM8550 devicetree integration
- 3/4: SM8250 devicetree integration
- 4/4: qcom-jenc V4L2 mem2mem encoder driver

Supported compatibles:
- qcom,sm8250-jenc
- qcom,qcm6490-jenc
- qcom,sm8550-jenc

Driver scope and design choices:
- uses the standard V4L2 mem2mem + vb2 workflow
- maps runtime resources from DT (clocks/interconnects/iommu/etc.)
- keeps userspace interface within existing V4L2 JPEG controls/framework
- uses runtime PM for balanced power transitions across stream/probe/remove

Functional validation (hardware):
- platforms (codename / SoC / compatible / board):
  - Kona / SM8250 (QRB5165 class) / qcom,sm8250-jenc / RB5
  - Kailua / SM8550 / qcom,sm8550-jenc / RB5 Gen2
  - Kodiak / QCM6490 (QCS6490 derivative line) / qcom,qcm6490-jenc / RB3 Gen2
- validated SoC coverage: SM8250, SM8550, QCM6490
- tested flows:
  - single-frame encode: 8192x8192 NV12 (v4l2-ctl)
  - single-frame encode: 1920x1080 NV12 (v4l2-ctl)
  - single-frame encode: 1920x1080 GREY (v4l2-ctl)
  - GStreamer NV12 pipeline to JPEG files (v4l2jpegenc)
  - GStreamer GRAY8 pipeline to MJPEG output (v4l2jpegenc)

Known limitations:
- scaling is not supported
- width and height must be aligned to 16 pixels

Atanas Filipov (4):
  dt-bindings: media: qcom: Add JPEG encoder binding
  arm64: dts: qcom: sm8550: Add JPEG encoder node
  arm64: dts: qcom: sm8250: Add JPEG encoder node
  media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder

 .../bindings/media/qcom,jpeg-encoder.yaml     |  142 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   35 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   42 +
 drivers/media/platform/qcom/Kconfig           |    1 +
 drivers/media/platform/qcom/Makefile          |    1 +
 drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
 drivers/media/platform/qcom/jpeg/Makefile     |    9 +
 .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
 .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
 .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
 .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
 .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
 .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
 19 files changed, 5067 insertions(+)
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


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.34.1



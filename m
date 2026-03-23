Return-Path: <linux-media+bounces-56711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +H9HGN86wWn2RgQAu9opvQ
	(envelope-from <linux-media+bounces-56711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:06:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B52F27FF
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F006E3028EFE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC7F3AA1B6;
	Mon, 23 Mar 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUO+jJXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuGJ1eQj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE5340298
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270711; cv=none; b=YL+G5gWfOr8+D2DzWVhKq2V2gAShK/UrJevOCF9GbBm63FlfunWr0NNob4gu+5Q+lY+6ZWSHao7f2JXEfBEiS/UB1w2u8eGzEqlh+xd1aR+MFsIMcHdzvK/pjEmE21FzeB+5W5J9eRxXB2pahLNrBWDBf02l1kVUKJk5Yy0RbZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270711; c=relaxed/simple;
	bh=Wi6Y2BBnsOM46XGjOTLIrgWTvNj8GRhq7EiHI7Vdrwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H13Nam5nyA8Pgq9a+MM8FDFML8iH8qfMOZ1sNUd1pqCZgNDdb9XQ/Cf4QuqjnRe8pYVjH90LhHSM/bF6OHBsZLCt5SNxBBgYZ6+ETuMpf/ExkZiEBxGy9/uV933ni9jTjksFRt0TfywT316tGopfUGN7iB/NTtpdAL/VkJsjEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUO+jJXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuGJ1eQj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tcgW1627195
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6Q
	ZbrWnkaI=; b=kUO+jJXMEnRIHtbIQGzgHfoB62E41pPCxRaoMRIVDlI3hSyRTGD
	5xMBE9efjjSUby/gFadznBeJDdNruGabFXjPDI/2QNeytPWa2xqZH7jHSM81ByXq
	DDsaSdy2JdKoOASIUuGZiNn59pceZrawZja0s00N6yFFuSZkw2OJmU6oSO6D05nV
	KtVc4mqBLUoQK0niah0z1L9kG+Wy7NM8djS7IiHW8leCnRyc7vMCE3WtGm5QYUF1
	J7XDuAX0JDjzn4YfmIvwEb7yLO3Enw0t9s4QSmSB1IdSEaKT9p7jSQ16EBDoDLMp
	OSjQMkPrRFZRwqpX5eKpu9CZHpbAapCp1ug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc119p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso164328221cf.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270709; x=1774875509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=OuGJ1eQj4BijZh/1eccPUuFgoy7ykpDLHJLH61CTYFvWBBftP7SXF/rNs7aA7V/I+7
         caTRJhVxCH9rTVn5cxW1N5xiuhHaz/sa6lHYzs3sR3Q1Qkqp6aTOYhDcnGLlUfmXD2fs
         ogGo+PvyXDx4FwLUMbo/eN5MVHYKKeiiP0oqLjmrZfLz6J/M76xnSXfHoWnWz0S/MXAL
         4bDNzXWO1qmR0AdfTpNMHFFKBFyKh5pGl6W+qYwRw/E4XShM7S/WWL8dnJiVXoD0moWY
         VkFmmFx4hpUpQ+OSZJHx3+qekTITfwTbLMQKlyrSvpdIsqtGgzt34tldizWbMYZXGOWR
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270709; x=1774875509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=eg7ODvYya7kANGPnRRizSsSBUQbKL+6WWUv2Zrb6bt/NMB1vkeFnNLY/Ptw0VHtEvq
         j6bhJnb2+aGl8Y1f9eSr1DwX95yNX/SSXVqjfLpkPKDkpA3E/PHYAHByyxjZR/IwuoPd
         WO0wzALwlRGhOcZFcktTygeIwlWGOayXRGQrwn2pTCglUAhnsbm6H5tB75Jf76X6MH4y
         1Eb1sDRSDzUFf9k+OzKawcHldlFNzaSJP4GwZ3yV7l0u7y6Oi8w26tPgmmVF4Wd/YJ+R
         +Gd3mNxhP/BrsyOJVpyXjkfmuq2eHdIvJb7KDRRDK+7SUOoI9VRcudK328IHCFMJd7bE
         h+vw==
X-Gm-Message-State: AOJu0YxxbqQB3rosVgqeZr9nHpB6EON9H8WlGdwillKioAMqBNeynk0q
	Vwft1KqC/GEdSxZW5e0vYcjZYk4Esk7wY8UwbJcX64cTwKUx/bumOw6dBD1yrhvsTCAXK5V5nDF
	OWyTWrwDLoyDjSfNn6bkTcyHIdsBeGzUddCrh4IcDau+qlHD2C6Kuo13/8JMagNmogg==
X-Gm-Gg: ATEYQzxb1duoOupLa/en0c2kZTxkvdRJ2JjAnWiFTt4t3BnhJeYKeiptrqzL4JWbL2A
	G5NQCsTZFMaIHz7TMInURGRBAQtnHp/MOkGC3AyZni/tzn2eMszooOE78JPYMIJIC2SWnvAwySO
	8w9FfFa6YbMYcgcpvoipuuwSMEX0ApH7qZu4x+9hIooHaNDiXJ0HQAMnvpG2ALJ17IHZxvBu5Ky
	4R6P89x49ZX4zdZp6TKP+85UqHSUOwE8nZ0v6KXSCLCt8evTMzmojJ3EpkM1eKAKGrRLabiz2Sk
	q2Z8Myecq2iWyBA+3lPlfI8vvupLd0ezR8DHhAFyit2adtkQWONhRV5aFEQFaMifZeiqL/4LVuc
	PosFJHTXNCUlSXjlGIfsgz4e0iyAy40CJN+iIXCfPrnJECHxznONgmO+wfK+V2V7V7N6w717bAx
	WImlh1h257nL9M
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189821cf.5.1774270708677;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189491cf.5.1774270708236;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing Engine support
Date: Mon, 23 Mar 2026 13:58:21 +0100
Message-Id: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c138f5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KcaBgNpwSxjJcJ_5TmQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zfqfdjTtU792K2bB0aUf24hP5keR5FFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX0ubmJCeEbmHc
 SKWkGPEIkHvoZO3IKPFv2AK+YE5hzQZf80bOqD4aef14bvdYpikAcH7errvC7n6E9Txz+JXAq4b
 EkcgulwKujjXuqUByR+C5cf1APh7jaGe/OUGFiYuGQiz7ZWwBO657qBU5fgFc5EIBgK+diJkvM3
 TztQevadxB14/zq9q8JLmPX0MylfBYo78mtj/Xm4JrtpUxCpKN6EYiObowgmSYkaB7NbNc9VF/N
 G/a9koh5k/bc6ZVo2zbjidp9MzRetH0O9O8ML7QcfxzIp46pnlsh1K4rNT/Hzw9qLAjnSgOIo79
 Tl1/rwRPl6U640BvseRQnwU9IPXK6lUbflgOgjeozGRfd7jCzMxfjUplIpIkNBmLBhw8eeJPp75
 9GLZFOm7TsWp+6hQf6Iyh2B9ShmgLDT0UsPgGXRdlg9AUevVM38MOIU7Hnt/WP16MCbmhKaX5NF
 /EfL/J7GOJe7RO2zVXg==
X-Proofpoint-ORIG-GUID: zfqfdjTtU792K2bB0aUf24hP5keR5FFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56711-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C2B52F27FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This RFC series introduces initial support for the Qualcomm CAMSS
Offline Processing Engine (OPE), as found on Agatti-based platforms.
Boards such as Arduino UNO-Q use this SoC family and will benefit
from hardware-assisted image processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, 3A, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 10MPix stream at 60 fps or to handle four
parallel 2MPix (HD) streams at 60 fps.

The initial driver implementation relies on the V4L2 m2m framework
to keep the design simple while already enabling practical offline
processing workflows. This model also provides time-sharing across
multiple contexts through its built-in scheduling.

This first version is intentionally minimalistic. It provides a working
configuration using a fixed set of static processing parameters, mainly
to achieve correct and good-quality debayering.

Support for more advanced use-cases (dynamic parameters, statistics
outputs, additional data endpoints) will require evolving the driver
model beyond a pure m2m design. This may involve either moving away
from m2m, as other ISP drivers do, or extending it to support auxiliary
endpoints for parameters and statistics.

This series includes:
  - dt-binding schema for CAMSS OPE
  - initial CAMSS OPE driver
  - QCM2290 device tree node describing the hardware block.

Feedback on the architecture and expected uAPI direction is especially
welcome.

Loic Poulain (3):
  dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
  media: qcom: camss: Add CAMSS Offline Processing Engine driver
  arm64: dts: qcom: qcm2290: Add CAMSS OPE node

 .../bindings/media/qcom,camss-ope.yaml        |   87 +
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   72 +
 drivers/media/platform/qcom/camss/Makefile    |    4 +
 drivers/media/platform/qcom/camss/camss-ope.c | 2058 +++++++++++++++++
 4 files changed, 2221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c

-- 
2.34.1



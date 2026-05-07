Return-Path: <linux-media+bounces-60863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL8yBjMX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:50:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E14EFE81
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 848BB3018762
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCACA3D1CCA;
	Thu,  7 May 2026 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJpfz3k3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJXJTmfb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713C136AB53
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194209; cv=none; b=U798u3uAohGln7Hxi5FfTfCEXiuQBwEAsSMFirxndfPcMFCDvNTcqJo8Ya514qj1qVpFObmvqx0Bd7oS4MSztRiR59oLkuHhd44LAtEWYimCsa2+2bMx10vb3ycE0gzEPRSOgI+mZYfcMqiYKvPSCq5siMX/5mu4ligYKh02MN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194209; c=relaxed/simple;
	bh=5GDnKhmBM1yypsTlKGw6vvvavdKBYfnkdInWhp+vMLE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dnNxpM1x4bBbxRdFDIhHhLRyxkwcMwTVJ+h7eqF43j6wizidFdP3etWgeHKInHo1G6STyKacVO5ubOd3SvXdfjPpWHcrEDPgBWFjz50sshUFPJ3tFYzxKDd8XCyuQ9NIz7IQWDXRueNAgyEjmngbHxWW5peijPa9j6grIgJiSbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJpfz3k3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJXJTmfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LsOpd1174015
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PkSeNiGbgA7F4Yd46b6MKb
	ZkR6t+RRbEp49Tj4V3k2k=; b=nJpfz3k3mr8yc6QkzDSrJ92J8inLaEtOezoerF
	1YOvTJNnzJsD4c6IDiAbJkK+QUa2iE10ZuBTG/kJ8yRApG61t66RL1fKusqpAZpZ
	nB5NWDf4XIP8WAujf0QrJEeb/sG/fU9lF59daWUa0hYW2rrpEMRoJ9BzIFJzFb4X
	QQHd3pKjhJWX5yvlH6EIUORB5q2Ao+++87ogW7ULDfrIN9ssbl3tS5PSQ7h1ZB59
	t7dO0CVcFwZ1zwSd8nM8TY8kseEfjwJnRyqdCxndmU2LqVUPRwA6O3OcSHeirCdk
	3yr6iYJX44T0sY6/pv8yUc2+xm7hIVpalguiM00/1K7OL8Xg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132h849g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad0ada31bso5130051241.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194205; x=1778799005; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkSeNiGbgA7F4Yd46b6MKbZkR6t+RRbEp49Tj4V3k2k=;
        b=VJXJTmfbMbu2BgO7nr02MNHKROAI12Tca3rGNcKmz/1Vc9jJfr/4ByOzBMEvocwd+N
         vd7g8ozYOQQeYQM7AuU5hqaGHZ0vQkbf9SBuCU51XKNwlsU5+hr9fV5EQwLp8Ez42p4A
         T1cG5x8z92EkMvtxwQPsuOPlqGjVBwFLJQr3bibqtaz4PDWFLsb4NfMnweZfdGRlkU2Y
         qw8vk+NXDanlQtVEcT6+ci16lMWpzV09QfECImko7wBNQ7u+e8dMBqAqnejTEgEEpn2v
         Ezf2qe3Qu2wyXhZGr5Xj+SM403TL67x45uZjsnrEcJmpluthVo+iUef35VRDMS9HBYnO
         9t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194205; x=1778799005;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkSeNiGbgA7F4Yd46b6MKbZkR6t+RRbEp49Tj4V3k2k=;
        b=OgPU7Ege0pFzaDdXrhuVpORbfNJuuLrTxYj5soTppWkV49NoxW1Z9LMl27S85ELHaG
         LUB0yQmXmchmgmmGcs1sYfK4JkIEq5gdJe7ti5qLJKx2d3c42UN48DpLngut3JP8pHma
         VwZ8X/UnwMVVLNYZ1lBvXp9Gx39Pww62wJm9oOIiV7nPzy1ojI77aWcbw3OZKMjRDVw4
         OTdSrJe7H27K7R8E7g201/tY2qX0TSJKCI68ECzMmmD2M/b5PJ/+c3izWrKuxuEMCEQ+
         eAdOEaBGtXWfZ+K8mG9r+IZjn75S3J7yeSSuu0ZFk9Tn2aNq0U8zhns9mT9nUVR6hMts
         lhwQ==
X-Gm-Message-State: AOJu0Yx/CoPZ8lx2bXygC2DhLYKFMBvGlfcqIZLus50lyg7QLnoxTXdi
	Fx7QAe8AQFO5dIG6YA2dCHbzved7lL1OL7VA6e5jfXL/myGXEhG2LJLQRQu86icjBDz/IZmR9ZN
	4blAesCuj4JVWylrdJoch6PYlOGRKTUEFRIp7IJ4X96m/iPa2QR/fum0b2hb6EtSphA==
X-Gm-Gg: AeBDievaRMrOEVXY56DWL6FKkLf7mQZxuzWwZK73UVdZ+3rLB8jnR4myIWSWCsq9Duu
	FleP5aLaq5oL6vs54o7mgeI47K7okr6GsvZXxD8m1GW/DUuT27QSGc3pmRHiuj2Hiq7VU9ICf/I
	eN96oO2sH/W0J7SkCs2fKKeVcC1Fbfw66qV9eZLF3y3CF+LxIjcbFoto+U6qKIy5Lm9uMvNxL1+
	ET7ztO9nfAbIIBA2hCk+uzbFewaUPSlUWjBfxR72YL8z5Fb5ouCt0s1TAxBalYqurRyvsjlvmcv
	LlfIQOaq3QgpxEz4herQVcOYSCyFwfMTKixfX6+cxljrYZmY8qRdplsN9udUcF73Zl91AjZ8JV3
	Sd0Wy3M4RQTbUPamvD64ODbdBgOUK0p5Z9KIdM7rY+SbuABBOO0ZQNbuspabWc4+ViVqpNmSNRw
	59Igr/d0m9h+n1R74H
X-Received: by 2002:a05:6102:5813:b0:62f:3686:4b86 with SMTP id ada2fe7eead31-63115d846f7mr2051134137.1.1778194204662;
        Thu, 07 May 2026 15:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:62f:3686:4b86 with SMTP id ada2fe7eead31-63115d846f7mr2051119137.1.1778194204230;
        Thu, 07 May 2026 15:50:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:02 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 00/15] media: qcom: camss: CAMSS Offline Processing
 Engine support
Date: Fri, 08 May 2026 00:49:15 +0200
Message-Id: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwW/WkC/3XOMQ7CMAyF4augzLhK3IQCE/dADCE41FLblBgqE
 OrdCSwMiMXSP/jTeyqhzCRqu3iqTBMLp6FEvVyo0PrhTMCn0go1rrTFBoLvRYBlhDQS2KNrXIw
 UkE6q/IyZIt8/3v5QOubUw7XN5L9KjbVBt0ZboTEr48BAlzhUY7p1noddEqkuN9+F1PdVOW+3Z
 bmm/PjMnPCt/1s0IWiIttbU2LXTevPrHeZ5fgG2JIlV+QAAAA==
X-Change-ID: 20260427-camss-isp-ope-4b575ffec2ed
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX3USSQP68jZAB
 8yyfJZKCrnp1ktYToAHK+u0EByMkTb5CgustsIgvp4DK11EW22jm+Brxxfu5jz9owQ0EAmAS6NB
 5Kl+uX5FJyLlwD4TsX6Q+yo+Q/Xey4l02pvDegR35g9Y+nglnob+fWK/d1VMcrH5WpFfhUo5ucY
 DxVWERRz8+mFZ8cgPopHo2sq64XP0lUgZtlk+7m/b9J9MkB2s9IJTqbzAwPuDm6tISGelOE0Atk
 9wxqz3M0aIXAxARVYo0KzQGA3N84hMxrKqJ5wHcaLlncHJE+nvadgi4AFArHtlHw2KUrjSEMOi9
 7fJcogdLCtFUn9shFfi7qel6rYd362+lr75YeDNCTr001MI1tyhFo0zRW3jpUm9XGrO/9+l7wNu
 mdbwHOaQypmzc2/pZLt6llTqxYSTTjNc7h6VjQ83QoqWLyh0MMVcWwiDpMOK+cQ3nueD/jBozbu
 kcnS8EuJB9GX43mAlsw==
X-Proofpoint-ORIG-GUID: YsqScuXhO_TPQ7NQpUHujuXDMLdakpWg
X-Proofpoint-GUID: YsqScuXhO_TPQ7NQpUHujuXDMLdakpWg
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fd171d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oJE8aRnLwfUkw7FiLPAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070231
X-Rspamd-Queue-Id: B00E14EFE81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60863-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series introduces support for the Qualcomm CAMSS Offline Processing
Engine (OPE), as found on Agatti-based platforms. Boards such as Arduino
UNO-Q use this SoC family and will benefit from hardware-assisted image
processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, color correction, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 9MPix (4K) stream at 60 fps or to handle
four parallel 2MPix (HD) streams at 60 fps.

In order to enable reuse across future CAMSS ISP implementations,
a new camss-isp-common module is introduced, providing common
helpers for:
- buffer queue management
- job scheduling
- pipeline construction
- parameter parsing

While currently tailored for CAMSS ISP drivers, these helpers are
designed in a way that allows further generalization and extension
into the V4L2 ISP framework.

The driver is designed to support multiple processing contexts. At
present, however, only a single context is instantiated, which is
created on the first media-pipeline open. This keeps the implementation
simple while ensuring the design is ready for forthcoming multi-context
support at the V4L2/media framework level.

Since the OPE is a child node of the CAMSS device, the CAMSS driver
is reworked to properly share and manage power-related resources,
including power domains and common clocks.

Graph:
ope_input ----+
              +--> ope_proc --> ope_disp --> ope_disp_output
ope_params ---+

Compliance: v4l2-compliance has been executed without any error on
the media and video devices.

Testing: A camss-isp-m2m tool is available at
https://github.com/loicpoulain/camss-isp-m2m-test
The tool can be used to exercise and stress-test the OPE engine,
as well as to observe performance and latency behavior under
various operating conditions (resolution, format, buf count, etc).

./camss-isp-m2m -s 3840x2160 -n 5

  Name                            Device            Dir       Type
  --------------------------------------------------------------
  ope_input                       /dev/video10      output    video
  ope_params                      /dev/video11      output    meta
  ope_disp_output                 /dev/video12      capture   video
  ope_proc                        /dev/v4l-subdev13  -        subdev
  ope_disp                        /dev/v4l-subdev14  -        subdev

Test: 3840x2160 RGGB -> 3840x2160 NV12  [5 frames]
  Input   /dev/video10  3840x2160 RGGB  bpl=3840  size=8294400
  Output  /dev/video12  3840x2160 NV12  bpl=5760  size=12441600

Buffers:
  /dev/video10    buf[0]  offset=0x00000000  length=8294400   VA=0xffffbcb87000
  /dev/video11    buf[0]  offset=0x00000000  length=12441600  VA=0xffffbbfa9000

Streaming  5 frames...
  seq=0      buf: in=0 out=0   14.833 ms  (67.4 fps)
  seq=1      buf: in=0 out=0   14.874 ms  (67.2 fps)
  seq=2      buf: in=0 out=0   14.902 ms  (67.1 fps)
  seq=3      buf: in=0 out=0   14.960 ms  (66.8 fps)
  seq=4      buf: in=0 out=0   14.896 ms  (67.1 fps)

Changes in v3:
- Simplified camss_init_pm_clks()- no clk_get, no rate setting;
- Added Assigned clock rate in devicetree for CAMSS AXI clock
- Add Kernel Doc for camss-isp-bufq exported functions
- Added description explaining the 2-cell for CAMSS bus
- Reworked OPE media topology with intermediate ope_disp subdev
- Support for crop and compose in ope_proc sink/source
- Fixed Write Engine violation with some scaling config
- Fixed input/output custom-stride issue (Hans)
- Split uapi header (camss-config.h) into its own dedicated commit
- Patch reordering to respect dependency in regards to ABI/dt-bindings introduction
- Link to v2: https://lore.kernel.org/r/20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com

Changes in v2:
- Not an RFC anymore
- Move from v4l2-m2m to multi-devices design
- Support for parameters
- Helpers for pipeline, job scheduling, buf-queues
- OPE as a child node of CAMSS

---
Bryan O'Donoghue (1):
      media: qcom: camss: Populate CAMSS child devices via DT

Loic Poulain (14):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Add camss-isp-bufq helper
      media: qcom: camss: Add camss-isp-sched helper
      media: qcom: camss: Add camss-isp-pipeline helper
      media: qcom: camss: Add V4L2 meta format for CAMSS ISP parameters
      media: qcom: camss: Add camss-isp-params helper
      dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
      dt-bindings: media: qcom,qcm2290-camss: Add OPE ISP subnode
      media: uapi: Add CAMSS ISP configuration definition
      media: qcom: camss: Add CAMSS Offline Processing Engine driver
      arm64: dts: qcom: agatti: Assigned clock rate for CAMSS AXI
      arm64: dts: qcom: agatti: Add OPE node

 .../bindings/media/qcom,qcm2290-camss-ope.yaml     |  131 +
 .../bindings/media/qcom,qcm2290-camss.yaml         |   13 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   73 +
 drivers/media/platform/qcom/camss/Kconfig          |   32 +
 drivers/media/platform/qcom/camss/Makefile         |   11 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c |  101 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.h |  122 +
 drivers/media/platform/qcom/camss/camss-isp-ope.c  | 3025 ++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.c   |   67 +
 .../media/platform/qcom/camss/camss-isp-params.h   |   62 +
 .../media/platform/qcom/camss/camss-isp-pipeline.c |  372 +++
 .../media/platform/qcom/camss/camss-isp-pipeline.h |  230 ++
 .../media/platform/qcom/camss/camss-isp-sched.c    |  223 ++
 .../media/platform/qcom/camss/camss-isp-sched.h    |  174 ++
 drivers/media/platform/qcom/camss/camss.c          |   67 +-
 drivers/media/platform/qcom/camss/camss.h          |    1 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/camss-config.h                  |  115 +
 include/uapi/linux/videodev2.h                     |    3 +
 19 files changed, 4807 insertions(+), 16 deletions(-)
---
base-commit: cb49dcae0241fb3ea59f42ce2edd69367784b51c
change-id: 20260427-camss-isp-ope-4b575ffec2ed

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>



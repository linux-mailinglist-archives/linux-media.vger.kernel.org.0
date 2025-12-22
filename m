Return-Path: <linux-media+bounces-49304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6588ECD52D4
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B7393003FF6
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFFF333750;
	Mon, 22 Dec 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIPpIkC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JThsV+iW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3C33290B
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392132; cv=none; b=IJ+iABJ4AH5taAfJ+YN+OU/1ggkX0rpuFvGLjSycjRqOX167QhLyowV479uyO3GZ5F2HGeH5u+3kbLpfBF78jd/nisAjvu1NZqfhq0qQLzerFsdjthzCQjXCuxg98XdNBWbY+zjjMp9aDq7fjH7IZKATRgMAZz9o73vkZkABRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392132; c=relaxed/simple;
	bh=D1CzXEDGqZ4SIxckMt+uoSKACIrQ6NvDhcsFOK60C/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PkAHVyYT5ZmM3l5jh4N38o6PTPUJt2jo1QWPbHdIbu4Lmpk61ow2od671Gi5zioXg2Zixwtal+T0IfI8XedlNqRpehP+bY7+JjSB+D/kE+FoRvENTBpOz1CMq1aOUdzMMB/69B2E1pIVEIy/md5N7WCzCtFJhpahcpu42M4ODPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIPpIkC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JThsV+iW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM83GPf240215
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=arSuoSo08Lo2cAeKWtUafv
	WaQHmn64vSxSM5X523+O0=; b=KIPpIkC0jtim7FVA1qtALeZ5rY2un39259QmGU
	46u39Khw3ytvrQWK4oVBDuUeFKBqJruPUnNtY++Sg4oLpSJJqTBBOTZGvwVplEBp
	savQ4t0cKL0OqSHZhTgkzQDYY6Ero9qvKTb+gvt/DY+qS//17mkcgYzyqNrEuSzK
	d1o+dmorD1+W567KmLStxPqu+Qt42Dab+7XGCNadWGsjfD6A5c35H8LsH8U3DNn5
	WphwdIHpBVyfa7a+SYRRd5Ulxn93wQ8j8uC3/MiUx8mKPDRxue+gBVMV3BBP6ip9
	d/WSrJtNY7VxSETCNU07g92z4B6/iluqINYwo7DRa52MYNpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubm954-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb6a7fea4dso900850485a.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766392129; x=1766996929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arSuoSo08Lo2cAeKWtUafvWaQHmn64vSxSM5X523+O0=;
        b=JThsV+iW7FECWpjpXjJ2XuoBWw1mAZdkqfaxB6qvYj4zz8XOjGs8+Hz05Ke5cOjW9Q
         mkMK+WGBhrI8DFKkDjAnRbOkfCl7A88lC57/bSSaVbUd4aKg6a4gfs5ls0ZrrDSi9zDV
         KOv24oML6O40TEduGTl0NE/YqNGvOX0b0AHbRydl70opHaG6SVI5gVklu3ZH8b8JFsiL
         fAk66JUkAoQE9cyjymP1yUtD3AEYKuGCmDreaZIEMYOUdWCompV3y7xH0LHFIPgv9YFi
         HJbZHFesgs9ro6OcnHmeNo6DCUJIGjyzV/haONcJQr+lRdD9W+4R9CyOFKJ9N0VClLOc
         HlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392129; x=1766996929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arSuoSo08Lo2cAeKWtUafvWaQHmn64vSxSM5X523+O0=;
        b=UGJ9BlgF4qBEQg5Es2MtdU8iHnDR/vsMG5K5oIFGJOI+Kd0sGwXz1I36uDWh0d52sP
         aE68pqOPCjk0LAjvPnBdbehROzf/7Zsv82CB+CQmXlByTD9A8thcP2OpoeCJDKoY7IrQ
         K/en+C4AKEFhP6aUTxQ5X4X7HJNBU6TaKsNnOSDkwjPsBabS3QjYvwWtcP82PR7q787A
         NG7p0oxSdqfb1/bba1g3G1DEQ8TyjHwMJoPSVP4QAUthjZfPPWwyhJmK7MYeiNQeMElw
         AfoD7EImr6jGlK2puo4MEK/dgZQPKpGc9qkBWU6r6jD4aksnbelh/TLv7qw5WDcRvE9F
         bQnQ==
X-Gm-Message-State: AOJu0YxfwOjBpjlAkZKSdHES+iXRqCqVxQxMQg3/vdoMfntQqefyfnNC
	NevYj/oxbTrECLJEjkkXE/QACGRqQur1TXhys5M6knbJuVxcVRWPj+0i90qo9Ht8ACa73dA2MB8
	nqs3+yfacYqNC+FvwAQFocTrKqDbWh+UJDeQ5eFSwKQOIja01NkfprdeE//qFTaO4QIwy4Yc4Fw
	==
X-Gm-Gg: AY/fxX4gf6yXZ57S0+juSHXFhpTB4nowfaF+/jfvghbOOSE1NkoA7T8lJF60gOq9B6v
	b2hRz+EnyJB5jWt9r1Pd7D2h0cfJP8Lp010Bi3hsA1tbHaRkPsG70aJZEJk4a5YZZOMR4mc/FrQ
	3lgx13eQ0HESyoMzQ6bZLemKoalqsiSyMqqlWib5+QvOuLrC9ocj5YiDaZOYijXdh3jMcI0KYBT
	0bmcscwaOPxHFcnO1Ea1jRYwP/3l0cR8B9Q2g8eBel8nDuuy+PiytGtxnoprnJ8wVTMmmKrAIec
	doUU8SRLTGnhP3+aUaVhgfEgWakEqI8maTRXFWLbWOAMVC9drYWYi9AWv2UPlBkxNq00SYcAgfM
	XBpiE7uVMu3LohVsJFMkTHn77jocoLphBJJwvyReNbO8eBOaDWhTGyMa7XlRAbCur0+/yH4kEuU
	89
X-Received: by 2002:a05:620a:f06:b0:8b3:16c:1a82 with SMTP id af79cd13be357-8c08fd22fd6mr1764908985a.47.1766392128780;
        Mon, 22 Dec 2025 00:28:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy7yKdj2dHsBU68SEa7/loz6oBVeXcN72zBV95sKHOXNIQUSoqbxAhyg3QnDEl+FhtFeixww==
X-Received: by 2002:a05:620a:f06:b0:8b3:16c:1a82 with SMTP id af79cd13be357-8c08fd22fd6mr1764906085a.47.1766392128331;
        Mon, 22 Dec 2025 00:28:48 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm764046585a.25.2025.12.22.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:47 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add sm6150 camss support
Date: Mon, 22 Dec 2025 16:28:38 +0800
Message-Id: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYBSWkC/x3MQQqAIBBA0avIrBNyKImuEi1Mx5qFFg5EIN09a
 fkW/1cQKkwCs6pQ6GbhMzdgp8AfLu+kOTQD9jgaRNSSrBl77V0S0bgNNrowTUPw0JKrUOTn3y3
 r+35ApmPjXgAAAA==
X-Change-ID: 20251222-sm6150-camss-2b46fad884dc
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392123; l=2152;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=D1CzXEDGqZ4SIxckMt+uoSKACIrQ6NvDhcsFOK60C/4=;
 b=2fzW7qTm/UZDCu+ciY2beYdxaDwkLusVY0kiJjHK4ixqG/bITvQWRfusWOJeAdAB8gwdfNPDY
 tSHfVZvW+QkCf+DbkDgt2AoELqIDF1zoWEWTIuQwxTy+mcLpDsKguuM
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3NSBTYWx0ZWRfX1CgTz37yHdDT
 74bAJnqYkx4Al6UKEJV/86B7ldAH3TSaHT9xrNpRHCIxj+uikYeUij3iqp5h6oOsjqCC61Q1lwS
 CFhO+isjnk/A2uzDY88LaTd+us25o9YoN6qwnCK/S/NMIO9N2GTXW6QI2GM8OlJ8Aw4TLXOcOr9
 deZ9XpkQx1uYK3XNxq9AIN6iTfdIuDPdlJjFfD2FNDQnyDaPkbpm4fWbVLQRKGajGKMYFD5l5wk
 RJTPLLY1tSTrr/jBHBxk+emGpmle+s4qYvkqD/1GF5myk0ujssa5TNFjYmZWc2H9jBOk9sjTo6g
 QH+BcYgFab9tiPhOa2zhC5nnyjIkO/kz7Lejg+xAj87nXW30KqWh+ENiYFzOf6L53WaG+LNy0d5
 9byxvO2tky8vFyaF6dXstEOS65vbqhq/Xfuv7D7698DZjjccL8M5TvDdG7Gaa2gywVPISi/K4oK
 8aLmWQMb1qLvSjOzAKg==
X-Proofpoint-GUID: X0pO97DHttEndgJt1k-XzYy7-sK7VSVc
X-Proofpoint-ORIG-GUID: X0pO97DHttEndgJt1k-XzYy7-sK7VSVc
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=69490141 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b5PrnZgeE6CfPZZ6BtAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220075

SM6150 is a Qualcomm flagship SoC. This series adds support to
the CSIPHY, CSID, VFE/RDI interfaces in SM6150.

The SM6150 platform provides:
 - 2 x VFE (version 170), each with 3 RDI
 - 1 x VFE Lite (version 170), each with 4 RDI
 - 2 x CSID (version 170)
 - 1 x CSID Lite (version 170)
 - 3 x CSIPHY (version 2.0.0)
 - 1 x BPS (Bayer Processing Segment)
 - 1 x ICP (Imaging Control Processor)
 - 1 x IPE (Image Postprocessing Engine)
 - 1 x JPEG Encoder/Decoder
 - 1 x LRME (Low Resolution Motion Estimation)

Tested on Talos EVK board.

Tested with following commands:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Changes in v2:
- Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
- Correct the order of the header files. - bob
- Add Csiphy id num, improve the resource name. - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

---
Wenmeng Liu (3):
      media: dt-bindings: Add qcom,sm6150-camss
      media: qcom: camss: add support for SM6150 camss
      arm64: dts: qcom: talos: Add camss node

 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 200 ++++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 189 +++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 6 files changed, 833 insertions(+)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-sm6150-camss-2b46fad884dc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



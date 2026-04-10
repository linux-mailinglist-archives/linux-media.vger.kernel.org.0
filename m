Return-Path: <linux-media+bounces-58468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHWWGth72GlMdwgAu9opvQ
	(envelope-from <linux-media+bounces-58468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:26:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33C3D208E
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E053018BC6
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17D3330D2F;
	Fri, 10 Apr 2026 04:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VErWMXR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKyCbrI8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3B325704
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775795148; cv=none; b=btrpTC80zp6ords2bOu1/Z5TBneEijjLI6pFJrOfjOhv9HG7bk85+IxoRb5PH3r0IQp2trvyxNbo6XDB3SJyvDBT/leA6/iQfj6ULCDF9mP+7h/zIxK7va3H0hh4s+DxvhoN0JJTVL1eCXysWnSKG4KZztLZEkp1xgUg3t4RaLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775795148; c=relaxed/simple;
	bh=afMyCl6q80b5zE2nccWBXEOFfRuZfUdUC9CQcEqjYC0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pj2mK0B9UIpNRWiXu0j0pXOFHeR6AUo3fLXPYJweB87jhA7BupJj/NrZfe5C827oComlG8I9Z/MQm4Dvyan44HhvSSVSY+Dm8YJBLDR3+gVLJjvVPaXVqQfih+J4WFu3UJsXV4ZOY45Vjh9K6EN0syZbkyJCzx1A+o0l4Vtw51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VErWMXR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKyCbrI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639HkRX72698366
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E+x2pfKVCYAegJiR8tU4eX
	nRaVp98QEUR06OD9JbNxw=; b=VErWMXR5BaE8jHyIAsg9HhX/85oMt2SUzWRIJg
	uzjUgIDencPfbD6iLBybA7wdU+LG1dxyg1iPgrQC2Fp5VVlEmnBUxutRvhIcimvc
	1lsp1C7NTyocrsisz8qtwl4JYITbQljuY6WAH3VsgDYzm6U396BzNUcoOCuwVI3X
	bhuQiysXDOONJ4yah9ZJPlAHjqC+pEHEZlDcf8YAl1BTsCeiWvkwpStOEoHuQA9U
	BlljhiBLOsVLYK/lpBoGiCf7pIhPGbZzpV0YXmLq9mB63XXDgqUEz0PUTiJto5/Q
	UNTUSkBQjuukkOX0g8fx61OUxBDkM6fWmwAVivtSQBdOtqcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9sjxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 04:25:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d3a8df9a52so323520185a.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775795145; x=1776399945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+x2pfKVCYAegJiR8tU4eXnRaVp98QEUR06OD9JbNxw=;
        b=dKyCbrI8mrwmXYf+rXvaqG6PrSRn/aPP5qzUvWeL6NomTqs87W5sB/dQ7u+wpMNngh
         7vw0Gi81/NK7o5b95G3g2j+/dTFSPDR7safIN0k5V8BTAqsZnijzx/uKA8gjlart47M4
         FxMSG5CH8ZKYrQ8pTIXkxPLcCj6eiKz7IoQ7mGbF5kPgId7UAIl64xSQ6w2rbQF9lzEA
         0wAo+MV8hLvxEupjGZztyjEqprNP8D0KVoipAONdWfkE32vRLdLrMuv7kguj/wL3ZynR
         wDmtIulTxrPZ+RC7M60R0wzwwMmnP4jMTWkMk2J8Lv1VjSDPpNEhMZ5OBNxdHaYadyij
         atDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775795145; x=1776399945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+x2pfKVCYAegJiR8tU4eXnRaVp98QEUR06OD9JbNxw=;
        b=DqCSkxR0BGs5qjumt4BHTE05PK+KI9e+CB8Es9jG7CNMIDVCzMV2S/IH+j2I0MM+/9
         rDH6nlgCqhW5bOxJLLossKiqry93FDL9jLYIulKq33J80rMqxbHsv0BzXFRwmNZfNtKl
         qRnjHsBp7DI0/Qa2yxsX+qJpcs3RLEKnYUEvJ8lswu8oG2R10x8VkqQ0uRGRiwJSgqxB
         FrQ+FVEfpApJ+Xmh7opJ2bhMm0q4bHtlcJpxu5SMFjsnRNlqIu0egKjLjX0LYLYfrmN0
         pWguhMn+evw+MdiG8jLk6ozTFKeUwwq6c6OCjJAUgpwb4QziroKTmi6gcIrTX9Uq9vdT
         AbYg==
X-Gm-Message-State: AOJu0YzaYGhwlD4SpEyAuBDRNOfoSh1C11S3F0vKlH7aPHcP7JJ717zm
	1uYugHxdLKaxjYPhwIQowCps/ff0Oa6l0ffMnkTfU9zHvbcUVWCPDAh7mlYNl7HHRtohpb+aYzv
	OjOu4JVOE1e6ghA57FZHjrjyCwBrdqZq62CQnrtkMFFc2b9Ts7Nl2oAwX8Sn51Nai8kuHIkq2Bf
	4P
X-Gm-Gg: AeBDieuYhTX9NhTxjfdkhxeDu+JKatxeyinpU9QtLapjP313XbYurt9RyFserXybIwd
	gXb1pSEJ6Srz/2BdceEqK7JksS1M2oEqVPDaMXS5qFQysDe0+p6HDE48utHDj5NFjMQZQZ1GUsL
	NTEU8gO0bEqST47LC3cU5xLCuxgj5QCTkca+muJOCN0Oq+zZnkYGKPofoNcob+jjq0wUmN+wF7C
	2K1Wa/D8cYR2WvGUPIr8ZyxSG5EQETdtdUfdaNatf2/0CEdIabMYs3tQdf43KjM+S1+dUVp6fs4
	FCHVcb2jmwNNOPhfkgVu915OxWzHFC+FHcMGEO4fw8pHkpcmhEJ8aErO+drWyA1WzvDtXQ7cLoo
	mh7rWla1oHomarsJMNfjvuc4QvHuTzMPe7xEyep8TZOHGHNwa5+13yqAmDNNPX4DwgEqj0E4tYZ
	ckD3q2H1+c+PO7
X-Received: by 2002:a05:620a:468e:b0:8d8:2a0:e17a with SMTP id af79cd13be357-8ddcfcb2d46mr231434985a.50.1775795144728;
        Thu, 09 Apr 2026 21:25:44 -0700 (PDT)
X-Received: by 2002:a05:620a:468e:b0:8d8:2a0:e17a with SMTP id af79cd13be357-8ddcfcb2d46mr231432085a.50.1775795144215;
        Thu, 09 Apr 2026 21:25:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb934d8e9sm121757785a.35.2026.04.09.21.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 21:25:43 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/4] media: camss: add support for purwa platform
Date: Fri, 10 Apr 2026 12:25:30 +0800
Message-Id: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALt72GkC/22Q3WrcQAyFX2XxdQXS/Hr8KiUEzV92oOt1bK+7J
 eTdK9sXpSQ3A0fofDpzPrqlzK0s3XD56OaytaXdRxH049KlK49vBVoW3SlUDg0GmB7zb35NfFs
 WMN763sfeFzKdOKa51PY8aD9fTj2X94dA13P4jzlcDqLWdBJha7ncUwIhy5uDR8xYffB52A74F
 6uykKfrH5h4ljRQnmsZ9/hga8ohcs/V0bDRV7NFTwhPKpCWpmCHVGe0ic5S1jxs9juPJg3RwK8
 2Pp4wyjmQBKhBxnld2s7rkRDhLIcsuupNjAeRjhgTr+l6EGOyMWhFiZThmIMjLlQdOsKcjPNIO
 fXI6X+Xy9rVwqxZySEdqlTPxjN7Y5RmsUkxNbpv4pNS7kz2uk5vEGVdhz7Kl/d0uDsiL9LI/XZ
 r63DJ0ZeaiuEim9kWo6qt1hrVV6tCrU7F3lWO3cvn51/FxIVbRgIAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775795138; l=3887;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=afMyCl6q80b5zE2nccWBXEOFfRuZfUdUC9CQcEqjYC0=;
 b=CdBvw3hrELo9xP28PYSiKqqhcA5eiB9AakDjInbtyboiDdpVfoZ9GnV06wYlndEMam1zmJZh3
 Newvpy6/FIPD/acEKDNmDOcxhtiHcUpXWhsBZ4zCiMsn0tPzVnvEnFp
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzOCBTYWx0ZWRfX4QKLzdkI7Dyy
 +6K7y260pL9OiaiWcX8UMz0shhZR9WgNTzlXqUx+s+irIE8WyJ4STDKuSUr6ddxpzL7YAr4a/An
 V4xqwRxAS/eqs+WE7jejE+7I4xACDq2iY9qJH7bv/pkQP9e5zlp6YbDHVLvXM6W1/fRYW+82hSK
 WmQXoUo8ZLKZh5sHyg6NJTx4EgPFcPvg8Q2Y3apqE4XOib18fy7QOOqkKB0tUPhpMcturuhxqdZ
 SP8PRSj5klJ522yXf/IUaXUtG2WaI66tuspVogYYXybN/kh6TfW5sOv6A97d/1fHGMp6pkrOtAx
 VL3IeD0yDElfJL+AP3iN2OrNVsR13xiKeoGs1NMp8KThzJVG/PvROKL3VjVWH+PF9vO76v5qVbR
 sEO8U1NswpGWAf91Q7+SepnVj6qeS8sqFpKdY0kbt4MvWGjc2cZfZiSnt4L3OluEQHlgRUdsu9V
 MznU9j99+kyWE9145gw==
X-Proofpoint-ORIG-GUID: 8oRxa2FiFMp6FK4ZBy6Ubao62uV3S07J
X-Proofpoint-GUID: 8oRxa2FiFMp6FK4ZBy6Ubao62uV3S07J
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d87bc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Qb1CgdutHYG83UUbXIIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58468-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA33C3D208E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds camss support for purwa platform and enables TPG for
purwa-iot-evk board.

Have tested with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":0->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com/
https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org/
https://lore.kernel.org/all/20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Wenmeng Liu (4):
      dt-bindings: media: Add bindings for qcom,x1p42100-camss
      media: qcom: camss: add support for X1P42100 camss
      arm64: dts: qcom: purwa: Add camss node
      arm64: dts: qcom: purwa-iot-evk: Add camss node

 .../bindings/media/qcom,x1p42100-camss.yaml        | 424 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         |   4 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                | 158 ++++++++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 109 ++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 7 files changed, 700 insertions(+)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-purwa_camss-475787b87e14
prerequisite-change-id: 20260331-purwa-videocc-camcc-d9700d0f797d:v4
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: 2f4d4c5c118e057c76e6d2785479df01d5bc1c7b
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: 615e6f38e528de35dc206f1c7f3eaf78ff04afe2
prerequisite-patch-id: 66096b909debe4d942eee972948d5a138a5be427
prerequisite-patch-id: ee26e00cdde21ddb070af713230082ad3454422c
prerequisite-change-id: 20260325-dphy-params-extension-5fcd9ba8af61:v1
prerequisite-patch-id: 471e9403130bb3e65cea1d2365d75ef664662306
prerequisite-patch-id: 075fa72fba3c4f51138b88972e6a5e240038d90c
prerequisite-patch-id: 4edca361ad7d370a338641d1ebb5ca65b114a244
prerequisite-patch-id: 32dd1b55ba678d00088b376e33e12d9da6241aca
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v5
prerequisite-patch-id: 5c8b5c0011e54921bcfb64b07f0468977f44290b
prerequisite-patch-id: 22e71ff566976c8333537b09b2721116acd267e1
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v11
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: bbf431fcabc17c30fa5e804eb4accb8275198b37
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: 5f5504fd7b5eee72c3fb8c045fa57219fd2f0456
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-patch-id: bc5b9321c124abd961ae1f60610dc46701dc80ac
prerequisite-patch-id: 6d36feaa3a210039f87ea47aa74423a670260fb6
prerequisite-change-id: 20251226-camss_tpg-b23a398bb65a:v10
prerequisite-patch-id: 520491f0d518f3463d429e77444e231fa6016dd9
prerequisite-patch-id: 459fda84ad92fcd4a497d00ce1690cd19f2cbacb
prerequisite-patch-id: 82330aed01b91c49acbd577ba75bb73bcae6ac90

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>



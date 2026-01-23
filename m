Return-Path: <linux-media+bounces-51405-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK+lMU09c2kztgAAu9opvQ
	(envelope-from <linux-media+bounces-51405-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:20:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4373268
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E65AB30095EB
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232C930BB80;
	Fri, 23 Jan 2026 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxDLo8uH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsiJZHZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF390337692
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160005; cv=none; b=CnwwYt3CqjUYe4WPAMaCjScUQVfmVhhzC9p0fV9rPYL70pdHDcuLkbg9HvJoef7yeeag1D1r6mxnOuZPvuqVIfDQTee3CHWvf6PlBFXY6FlQ1Q94GpgNzeXLdwsDBmejAEO6PKv8LVbv/0hl5VE8R1XVqQqJxoaILKAvimzLMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160005; c=relaxed/simple;
	bh=YZL1RmD/cleXPDkx2bGKb/HrQU12l4ZoC+NLYNQ6QIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NoHb/gj7aUWdeXC+g5ymJKWHPZ4Gd4bJHq5L6jFlR2fhLcdvaN/iLRD6gyETk6HtORRA6mAOjgnudgXW67HuBGHR/StXxrAATpg6+DnK3VraWBoowcHxBolzNBQlZxq9einJb8liXuZjjGgcZ1YefejqeB3KCq4gkvZqKWxsnzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxDLo8uH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EsiJZHZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N56R8L3656648
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=chNUffUQgL+rPjre2EEwcK
	IBO/kVK93yHNti3Djn5Wg=; b=kxDLo8uHEbXreS+kh28FYK2u9UwiUChkWfk/iE
	Q38iV/rou2Of2X2f5Ln+TBTwGbBJcyTSuwpljjLx2kEprSw1ND8GAwxcwFzbxegy
	633ivhPiOxdH+5u3NwF4iTg1CXuIVdOf8bkn9KsTuHhyTsfSsRHMoBd2aoHSRBc1
	ZLXRJpkxrCxxx+deJlo4l+8q96EE/vtR6a0YyjKehjs7JEnhv1v9t5z6Q/w2+CwQ
	X11VLpZ/XKIYlqEG5a3s3MneW9ZpIj3Ob9dZfClwaixabuga2oY4WsJ3qSKl3hPc
	78iD+XdeI3ZHoKv7LjHyDRtjKplpWCwWueTItjYb7Qi3b9Dg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bv2hw8tqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 09:20:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8887c0d3074so70372156d6.2
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769160002; x=1769764802; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chNUffUQgL+rPjre2EEwcKIBO/kVK93yHNti3Djn5Wg=;
        b=EsiJZHZGCItvJkLA9ZIqruFJrpQbF+sTpbtsR2hCcOuYDQFvyXvXHAbnu0saAdifZY
         zI2MlcDAzo83y/ZeXO/mCUzA3wByWwlP0eg7Y9dTTiYtDYO3Qdo1zYhEyxpjEOc9Ntww
         grA7BfQH0a2+0N/yUvhq7LU4XB2rPHnVsE8X5s/LC86xm9foOQwefPAZtIsCF3NPMKkX
         /J9LdcIPlfyYycY7xxBi5GfVO45m48+Z4nQ2tsRvmrlD+0obunAFGmOoFh01QkmYa/p9
         791b/Y6ySS556xjfJvN/1VVT9j7naoG6bjXyI/bcUjmPwiON8Gvg8vF4+XhHUvnD9agg
         Yq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160002; x=1769764802;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chNUffUQgL+rPjre2EEwcKIBO/kVK93yHNti3Djn5Wg=;
        b=Z3xhiu/503ov0e/LYiZpevxv21XXFKEvWK962fn27nHY48BcSkguQyW+zkIknO4FzN
         qNmryln5RNLjN/Y8PC0azjO/m0IbZbqJlYMATWT4HH9pAtd+8+LDkjW/vlWVn0P+UHEu
         rxYbEuwspMgjBG8tq8432uoR1pgi/Wn0hPcbt2Gki7WRceUXYKmutl4E79LN3LmF6d/v
         K0bG2GfuaQIiY/TcXFqQVdCNV16zulcAWNxjEuxPxe4qo/Z4HqnPuwN9xGCB64+7Uw85
         OyJwSjR6NUx/1iAafdqz4yiEqch9JEqEQOLE/aYzPymw+eEyMYEWAZfKNdzPez2yDYrz
         1v2w==
X-Gm-Message-State: AOJu0YzHbZ4NyaQsVNEAIJEFr+9JUPWhR0vPrh5aVXqPdxpn+18485wa
	COjzEechejRRFEdLxn8MU2tWNj2WYHLXISnl90F6JY5xDLy5CD+lHlURvy/OCmiCTWjPA0/vG1z
	W29/TN+Kif5ydVFicQAt5wOfGKENkZgl6+weCBEGPItArmZaNYKeUEu2aT8imQ4hul8ke8zaXKc
	ag
X-Gm-Gg: AZuq6aJQjjMLu4WLd8cfzekwaMLB9A1lLrPKCprVqWZ6uEQJyBMyIHYta3LYtVOE2uM
	Q94k5WN3/rp88A7xs7qe9Cj/ZR9ewF8UPAcNACashMee5Hi+2xH9vUwSQfmsREbHBwHMnHD1j7s
	6dNaXvaD85lRb0mK4Tw+E3Xuu5G1JucYc8Kif3rLjdjSt6NLGiHtaVr9/gwPvspehKVlz3WvpOJ
	9hXDmh4Iv8Sgjy3eqnh6pS6gKlCjQXWytW3zYLIGq38pkHz9Vo/IKuTXzc6iwTpsRgqdsT6l6SE
	p6dtS04BV4FiEwWGu4wMVY9lFAXn7Spr7DW1aeNfl7O9t6PwZnrWsRFDpYqs6MsVC760vw7vr8f
	QhR6OQt6FIvqyC/hSBKvG88laERek9pp5uXuTe8efyyYLsGFvdGcep+tF1nCbh1zgHst4UPm0KQ
	4e
X-Received: by 2002:ad4:5ae9:0:b0:894:2d0c:5de4 with SMTP id 6a1803df08f44-894901eaca8mr31974726d6.34.1769160001847;
        Fri, 23 Jan 2026 01:20:01 -0800 (PST)
X-Received: by 2002:ad4:5ae9:0:b0:894:2d0c:5de4 with SMTP id 6a1803df08f44-894901eaca8mr31974516d6.34.1769160001427;
        Fri, 23 Jan 2026 01:20:01 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8949182443esm13111066d6.11.2026.01.23.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:20:00 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v7 0/2] media: i2c: imx412: power on timing adjust
Date: Fri, 23 Jan 2026 17:19:54 +0800
Message-Id: <20260123-imx412-v7-0-e58303f2b76b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADo9c2kC/3XOwW7DIAwG4FepOI8IgzFlp71H1QMQaJGapAtr1
 qnKu49WU5dDc7H0W/5++cZKHHMs7H1zY2OccslDX4N527BwdP0h8tzWzKSQJAAsz90VQfKWDAh
 vU6sCsXp8HmPK10fRbl/zMZevYfx59E5w3/5VCCsQLahGKRAc+Hfsu9gfmlO+fAylNJ8XdwpD1
 zV1sHvTpBb6/4FJccG3HslK65IxakXjQkt4aqw6kW/TViUA8itav9a6ah/JkEaHLsUVTUstn5q
 qlkF4jdpikO6Fnuf5F/L+QuibAQAA
X-Change-ID: 20260119-imx412-d6710b9fd3c6
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769159998; l=1989;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=YZL1RmD/cleXPDkx2bGKb/HrQU12l4ZoC+NLYNQ6QIw=;
 b=wW26TFZNCqQpaIwjkmuJDHAODzDkaWeiokULWLvTsdL/ZR4gjeqGSwe3TK8qC1eIQi7iH7Zud
 MAnMQXDTJb5A2GuY6UyXO4mg+l1RkQNPU4bEuDFydlOAIwRWRVpHCy2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Brmzalyju3kOkiIypL1k8F07PulXJS36
X-Proofpoint-ORIG-GUID: Brmzalyju3kOkiIypL1k8F07PulXJS36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA3MyBTYWx0ZWRfX08NEIOFVB7SI
 N9Rc7M/1tNlAvF6Mo0fr38tlpvT1ks7VQhsSEYvKbopBoUP0sawLMTf5iN/74lXlCi53sML0//l
 Gc9WZezIKQqq4sxhhalEDkmBVQ+aCvOMHgvG7gCez92geTo73i+J6GPhmhLeZ47ksuBS+GyWerE
 WkSQxbW9zTUiJhOip8kKlJku0UzNua8rpCGMvhGsM3L2PNTeTMss15O+GsaqwugUwL+8weDv4lH
 u3Y6IBUUfQe21DJNmrQTTkks3ZxsrPcPAkoRbS0fZ5CqDgJPFPJg/REFw7CdZ5jfbHHah8wY+iJ
 d1Xrm/1/mwVm2cJTFxJSYWJyXQYum3S/kAehhghbYCpSFEpN7qVNk0qjpswsR1vyFN3ZqluI4rK
 qCwSo8y4WpA3u+eahQ6kyLdtF0n7MV3k4dDqwo6Hd4KzfZaHqEU6oh3fnmlVUrmtyaLMQoIv+MU
 v3tmQ0Ltjz+3bwfXHzQ==
X-Authority-Analysis: v=2.4 cv=A4Rh/qWG c=1 sm=1 tr=0 ts=69733d42 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230073
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51405-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8F4373268
X-Rspamd-Action: no action

This series of patches mainly addresses two issues:
1. Fix potential timing issues that may occur during the first and second power on.
If the reset GPIO happens to default to the deasserted state at the very
first power-up, the previous sequence could let the sensor run before
supplies/clock are fully stable, while subsequent power cycles would
differ because the driver explicitly toggles reset. This results in
inconsistent power on sequences between the first and later power on.

2. The Arducam IMX577 sensor requires a longer reset time.

Changes in v7:
- Add vendor details to the comments. -- Sakari
- Link to v6: https://lore.kernel.org/r/20260122-imx412-v6-0-2c0b54594c2a@oss.qualcomm.com

Changes in v6:
- Added comments for the modifications. -- Sakari
- Link to v5: https://lore.kernel.org/r/20260121-imx412-v5-0-be67654a4afe@oss.qualcomm.com

Changes in v5:
- Assert reset GPIO in imx412_parse_hw_config. -- Tarang
- Link to v4: https://lore.kernel.org/r/20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com

Changes in v4:
- Add assert reset in probe. -- Sakari
- Link to v3: https://lore.kernel.org/r/20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com

Changes in v3:
- Fix power on timing. -- Bryan.
- Add reset delay time for Arducam Imx577.
- Link to v2: https://lore.kernel.org/all/20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com/

Changes in v2:
- Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
- Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/

---
Wenmeng Liu (2):
      media: i2c: imx412: Assert reset GPIO during probe
      media: i2c: imx412: Extend the power-on waiting time

 drivers/media/i2c/imx412.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260119-imx412-d6710b9fd3c6

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>



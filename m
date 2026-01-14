Return-Path: <linux-media+bounces-50648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B2D1D090
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 55E61300C630
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41DD37C10D;
	Wed, 14 Jan 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLMaFGbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kILZT2p0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868237418A
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768378415; cv=none; b=M1idJHurBPsZDJtrJV/wGZXW4mavt6TIomqZTHmfM3pPiYy/Pr0Ic9+FBN9JX3NUmNGg1BpSYjCt8ZwhmtrgZ6fsRIrH6jnsYuIjqilKGLTXXwSXSlVWtpV+XevaKLLzYWr6I/36yjKwvDohgIZCHKs23KHsPUaf9/w2Ui5rd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768378415; c=relaxed/simple;
	bh=kJ6JoMuxxz8m7+gqy24BMxC84P3aMchfFqwPNv1E8DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGhUGt3NdEF/Sy6NqchXXtmNml2ubh12401H3x5rHrV404rG8to90kj6KBWSRtJG3fmPayuq8ZMREvKWBAewNRKcto0GJ7wgwmKtZopzKfTUc/bbRdoqJf3K6JvBTAVkA/JcbYN/kCRwM7jD1gK1LFLyU4zwgQM7d6wjhMKuvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLMaFGbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kILZT2p0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jMJB3027981
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1l6eCARhoCy5RZ0rpOpVAWZCDGwcoewH/cP
	nAbp1TLY=; b=CLMaFGbvYakC65jU2HYH1+4g6ZHMp07SDxolk+lc+JOVPuCmEKZ
	qYK2B+oT/X/HYNlkK7MY0gh6EYf52RvThDRilt3MRA/8SBcnGWLjGlIRI2Gpv9tc
	cZJkalxe0Nm+GRwrySGfoLKBK11uCOyWgFb3Guhi9hkVb4cjCgD27ot2zgyS0V4L
	EVx9JOJ70i12dNuXnDiyz2b6J/AlSeRI31YLqaHOkkJZLCJQ1kTGUyFrrC4zwNLv
	xmAOe1Ddem1M5SoPqzz+1lKCctjEOc4kcx6PFOwU+FqF9K9mPX6unNDn9BGVoBED
	63ruSgsthLnCKxCaZmd1XEpAQPW5Voyuazw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89hpsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 08:13:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b19a112b75so2062431485a.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768378410; x=1768983210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1l6eCARhoCy5RZ0rpOpVAWZCDGwcoewH/cPnAbp1TLY=;
        b=kILZT2p0OGTrqDUehoVCVyAJqmyvTIJbtdW7yXukTbz8fm0DbfulPmevwoWbWQiIN0
         SU6hyP0tZyFoN4P6Yr6uTdPSaC16XYnlSW6y9Av97fehEW32U7TtqO0/V2i04XVXXyLy
         IUgwGMkMbxAKCUMnkWtXoLiNmdkO3uP4Gwa9SqL8eXjl2CxolYSjluYWWo3A5G1yIM+T
         yjyGyarkbWVIy72RojReqLfdeS3I6bnU2QADAvQ5JatoJprONmM07M3uGB6fzx9/4vld
         7kZ5/R+XAc0oEi8ZwrFmVL7Es9eJipJVNj3Dv0T/x6S8uv8idtdF/OD87PamGrgRnpBu
         p+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378410; x=1768983210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l6eCARhoCy5RZ0rpOpVAWZCDGwcoewH/cPnAbp1TLY=;
        b=CnOMZ9MEQRsUPHMinRA0SK+nijQD+4izFLcaX6W6yRAZ++nih3OUHUbTnRIZaRMBO5
         jaGr62AfzTqkgvpIyK16IEUFIrk1VT4Tq4+zIEwjG4ZFFoYB30MW2B9EhDgl/j/plrFp
         v9Rf7W1Kjkxl2kCALQUBUCnXpqvec5awVs5omqh7OlnOj/k7lnvwOerHvikEfWovDrVl
         ApiJ9hDV5TnUYrJ7yaUVtNSscihymT6RaMqgSUmXPsc26XPwa46l6IwNfVPilYGnlSiC
         mTwQcVFchjJmC/VVpduOm3TUe4zZjvYcHEbHFbotPgdhk7xOynuuh9+kkXJ4TEcVXz4Y
         kieQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/OPM3xoLTCd04wTcU+6a6uZRH6fkK7+5cQcDIsRZLgYNQcIlO12GNT7GlQ1uOOzkOBaxRiBnG6srcmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDvB0qo3/JElUaRbm6I56xqgCsunJ0c5RKHsg5e3hjwzWXsEt
	XV2vfwAnUwg9l0vHJpV9wovEFMVju7K/vjlwHVR3iXHDzctj4Ft1gkEpnWxtTpqRvoQ9Y1I/SuX
	5VdcFjYijdBkfutdLBAF7vQ3wFdSkzSPLNIltdgARvwiWWQFw9UhRv1c6VeIi52+41w==
X-Gm-Gg: AY/fxX4D8rKGMQNaYiiRhzZaBE9FPos+qQkjtRZ3nU65ppAIgkwn2oz1DDfSJtQ8pm9
	yyUyRLNqppbtAXxQx90DBgEAImbQlDRX+kU7uW+B6RS1UTJmwCpPgduV4g9LpzG+3aVSI+2I59e
	La+afx8eDV+qYJp1IVSHo9Io3/a0TpqaRQbFOcuJMx2rzY/jv6PRl5oLZSLL9pTPO8sr1oidSEN
	MJgcBoQTkl6OmuArILXE/9THFtzUaEt9aDxlSyeMFpQG+py3q2dDbDJ7RQc6Nn/5spOWpC+au6i
	9IeqXGQRguhz3uC8OzWGG35k84kl6cHgQIHje1zvDcbRMvEk61UK+xG2wheCrKtZQTXMyWTtKnK
	zbqCsKtJwzzZonR4usWRDyXth/w==
X-Received: by 2002:a05:620a:f03:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c5316b37ccmr170155185a.32.1768378410315;
        Wed, 14 Jan 2026 00:13:30 -0800 (PST)
X-Received: by 2002:a05:620a:f03:b0:85e:24c3:a612 with SMTP id af79cd13be357-8c5316b37ccmr170152485a.32.1768378409769;
        Wed, 14 Jan 2026 00:13:29 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe76sm2407851066b.40.2026.01.14.00.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:13:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Tianping Fang <tianping.fang@mediatek.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: Fix I2C bus node names in examples
Date: Wed, 14 Jan 2026 09:13:23 +0100
Message-ID: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2544; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kJ6JoMuxxz8m7+gqy24BMxC84P3aMchfFqwPNv1E8DQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ1AivFlUqD5ADdLH+YG+gG3aTr3JllMR1QxTO
 VVhoa7m35CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWdQIgAKCRDBN2bmhouD
 10EwEACZYYyM2VLukY9l3saEG9yRWOUMVqzf2nc0p1MS7L2PYsrqU3Ka4k10uWbNIBv/OTlLYDE
 iufSeWPHv9ecrGN1s0fDfVQ39q0iKgey7sUV7MEM26ky9rm3PPGh2TyCmz3EFV0xz76wTb/0Vuz
 DD+oxLRQTP9hFu0sLKfrkNAoiDCccB4GQlDYZ+phLoeS5/gAntVahdqxmz+6tl4DQl595EmbAtK
 7iKrv4QFiZg2Kn1Ci4TfCr27Lu32mzl3TNHFtngaYZ4HXcyR8WC+1s5DWHTzm+Zotl+B+zSfqUM
 NW3xM2rJF6cX/xrfLyKF8NGlGR4txxQrFW3a7qaImVSfaCS/LDGdkcxK6hMjVbQ/JWRccj7yvMT
 gW4bp0/y9hJJul4Bk9lPy0KMsIVeJRCEyQ6RijksgdoAwm7CYl8GzFPOr1rmjqp8TZj2yy92w/A
 BrbuO3X2xEHBikeUPoIFvwpgLhsTvkZKNMwl+QTLe7OkPtVMGKA5qvYQPsFs0g7594/hfzlMgJL
 Tpqj0lsmKDyNvObXEn+9HdQKPHPeHr6lJIteQn3jWH/1IAkhqL8xZ/h5CZyUrveE9jkXBkVUp0F
 +01ZPR2z1PE+kAvhAVdh98Q36iNb1b2pk0PXXWQzqHfYWn73C0R8vYlu4ZgIcjJXnVREdqWGVxA NVyaBeRjRH9FODw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA2NCBTYWx0ZWRfX+o8729olzcXO
 BOEVIn11Qd2tCRb1aBdbxmG5QgCeaBTLYDZtjxWXOvy47CmzdyrZ8LGrKC1AAAobsbabKhCLe3y
 Fsy8nsjbEkWIIaAtyCSeHfIEfDgAGzIKSYyKDvYAugV8lKP7c55IdQoH/b/KzkmQWXO0Viv7FkM
 urEhxjZvAeCN2/9b94EEbOWvUML3ET1omflnNEoK0MeLrPeecliGB4EkJMk1iLaklXjjNNdVbfZ
 C6dfFQh4DgwIbRykKyD0NVVFZ9Ci7+FX56GJla1+tI3APsmSoHHg7f0sQgu85+gv7V7isN+wdAS
 o2/+3QHY/UuP3H1kihVV2Hcs2F5FiXqKu+UhwD19baeVsOVjRwHx1ASgF6lbJ5nmu0fCo97ggF3
 7DZfOJfvwU4F0BHPfsIS4ispD4aU+FiL62FTlQ+LxToy0VsCxozSMpNVg2lyIcumNgCsR7yweyT
 Ea0bQ/fJAGmr/Arc3Pw==
X-Proofpoint-ORIG-GUID: zr_FDifGY2UqPRQrrZHjp-vnioGaNbR4
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=6967502a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gJ7PcVzKR3cp7Bqf8_MA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zr_FDifGY2UqPRQrrZHjp-vnioGaNbR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140064

I2C bus node names are expected to be just "i2c", if there is just one
such node in given example.  Replace remaining bad examples with
scripted:

  git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/i2c[0-9] {/i2c {/'

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Like Rob's commit 20a72af11f41 ("dt-bindings: Fix SPI and I2C bus node
names in examples"). I checked also for SPI.

Rebased on Rob's tree - can you pick it up directly? Applies also on
linux-next, so I do not expect conflicts.
---
 .../bindings/embedded-controller/lenovo,yoga-c630-ec.yaml       | 2 +-
 Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml   | 2 +-
 Documentation/devicetree/bindings/usb/ite,it5205.yaml           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
index a029b38e8dc0..c88fbd6ad940 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
@@ -50,7 +50,7 @@ additionalProperties: false
 examples:
   - |+
     #include <dt-bindings/interrupt-controller/irq.h>
-    i2c1 {
+    i2c {
         clock-frequency = <400000>;
 
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
index a89f740214f7..dffd23ca4839 100644
--- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
@@ -95,7 +95,7 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
 
-    i2c0 {
+    i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
index 889710733de5..045fcb41ac4b 100644
--- a/Documentation/devicetree/bindings/usb/ite,it5205.yaml
+++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
@@ -49,7 +49,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-    i2c2 {
+    i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.51.0



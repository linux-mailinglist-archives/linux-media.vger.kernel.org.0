Return-Path: <linux-media+bounces-49990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C18CF7989
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB3D830B7348
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7321322B64;
	Tue,  6 Jan 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqSlT6PV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai5wk3pV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4754E322522
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692423; cv=none; b=oAaoxIaYnegPhewYXAjGjRicYqNM6n1ohIAaWCSAwlrgpSs0kUyNvIjcI32V5yht3l3KuUwpqAPEycHUChaPpOT0FrTZl6MWvZYYVSweM/qPgHaLUVast5und6QCo5PmFwAWpv6cVikyOAO0QcGyxk7Wu7JWC1uWSyIBGuQSLdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692423; c=relaxed/simple;
	bh=ZAVAsjW4UmOeQ/5umcVRpfmT1dJPXRUxpnxO1mVpNqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rgM2J84X4c14gFSZ+omU6tZEHhpMaxE8yWEHUklhYBOpmrfEfj3NPRKsnOsr83SGDiQVAlNkP69HDl3UxNBFmR0e0HLdXjheB1vv/JKRAgKUEYUCX0Ueht/Jy0IAh9pg+EWnsv8V21MS8e6fdPQJKyDrpC6kuDjG2Og1uOUxrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqSlT6PV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai5wk3pV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QCNf3214062
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LKmbSOml0pOKaR1oikau74
	bRsswwgJgYRuuOEyfoYNU=; b=eqSlT6PVldJ4kSOZQ6At0D4J5fdTbdqS8fpVlj
	mXGp6Pbuzo6ABpPBFDnfjKkVOce6u3RpNRS6Hx64RPFqiWwIvvppeEszFlNjG/dq
	woH8qFFctoxvWqfXvbDqiyiEQdlXBktdj9jcWxUz8BJNJAMAHZALTj734rb5JQgl
	C5eoyJ3n8RkGLaZWlSFY6Np32qTfoa4l9pRfM5XpVPVxPntZKsAZ53/i6WSXdeMl
	Iq/Iu2eSOqIlfjUQu5hYtEi5E0W9ZJN1EbuaXC38/Iz8rD1u5zj4S2kZZzSJfUHA
	qItIyLO1/w30AFozqKd7mqAk9IchR5+kak0gJYcw7GAgmn5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpnd9kae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:40:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb0ae16a63so92368685a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692417; x=1768297217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKmbSOml0pOKaR1oikau74bRsswwgJgYRuuOEyfoYNU=;
        b=ai5wk3pVL2Bp3Bjaof8rSz8TeEBow10tjxFhlN/DtDCzevldRu9flNYNyLxzv9gcMR
         Kmdr7Qw3y+ZyrzM/BHgNM4AZuJDyHFtZ30vPWFzHGAN97TJ5l2sNgLo/6RO8SQpFcp4T
         IPkMr31cS0GquHmA839nu9vXkpBbVbAZMa9dLy1uQGGDfduSoHTx4+MgeZTgPRMjgZQl
         P6r7Mx84foOl6odyxZ9twbGOFhERhKrLVWsCF4hhxdoeKOT+jCweOOM0BSm1c/jdxrdg
         fBfP4LuNQdey6LC6lXPKmGAeZAoLFMJSnCk1ARrG950mJ8+w7nPQCEmpZl85qvXr1Co0
         de4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692417; x=1768297217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKmbSOml0pOKaR1oikau74bRsswwgJgYRuuOEyfoYNU=;
        b=l4yfJTaSigw2hS038+K+m8Qr7cxNbewCGBcFU8CsJwz/MjwGYqSPJlXeV8VYQxoaiU
         J70A2kGkf9JIxzVjW1pTqwADXJ5EBSPg+0YlvexdKL8LUNgkO7OYe9K75sIMvvjvdR7d
         5jFUjG6E18W+WyoIthb23TFAyUI+Jb4eBKVXCzDnGV7I0//LrZDFfDVRXDEtYOe7vLAe
         JlbZDcXJ6XZKKkHZdZeXU8OocCZM+zsdycqOz8WHomCLumRM3KHHrwDRtVPmNdfbsVke
         lxbjdoaJhPRkrh0QVCeGuzDWiI3qc+9YfC2aIA5LnZuMKvGTiK8OyXEjEUESOcvPjwb9
         eeJA==
X-Forwarded-Encrypted: i=1; AJvYcCXfVCSZBw9A2bulKK8ocFaBuVGP7ggG3+9z+yYTgQuLawW8/1nEpc5XjsEMs8ItEKRKJCe3Eu5uL+WIUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqbX52DyUhdrGaEFm6ExXZzlO18YtMqmyDg7bt0ykgPyyn9VLi
	KTlNjJkp2YOviP1xwEApooHT+1x3NA7uWSMDtVJMz0e2tc37LXhAWCDj+02v+Mt3eL4XoTlxBsC
	dY6zWZyYtpGfNfd/zo/y6sdIqf1j9/wAxTfKc3peRibCfxf7Hy+1ILv4ZMK6JSmt5Yg==
X-Gm-Gg: AY/fxX5mZkfeIoO5eIKy4MBgOZ8e9H4OB/YGcCEvhtjxb4J5NPzEg3YdpW/1q14y5B8
	+J7rW4VvxbHJU+KrgNe2OUKvzYNRIqhmagU5NNqlNgYdrYgMkf8VIzQN0Qz7uM0XIkpnm/oTrYp
	NakUN1qm+7geEYdycM+fCOAbrOjN1Q/YHG39oK3Zfvk+7CopHih2devIwyhcS69qAU6d638A/Fj
	ctcogB9BHXFM/DKTKXbw3/z9m66PYvy+IJcjJKXqVakYQ/4fVlJWiKvFH203vMkj6rAun+Ijfmh
	zV/geH/jcRRWrsFCfF39aoTu3JKyyT9rNMnwn/P3tCST9Ca7mkksDooBTMC8r5NP95OEfJ0hHON
	FXP1Ki3Sjc0ZdESalGvWKLQuNrdSy1m4209nrhPPuXU73ehD6pcD8NziVrYyP0yjQwzQz6vz+d/
	VH
X-Received: by 2002:a05:620a:191d:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8c37eb6392emr265040985a.3.1767692417203;
        Tue, 06 Jan 2026 01:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFIo2k5jld9xQpS8SEC+jzw5CNL0areOi1qiADsjxSfI/XHpAAK7Y628jXQDaEinxdy5G7Pg==
X-Received: by 2002:a05:620a:191d:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8c37eb6392emr265039185a.3.1767692416717;
        Tue, 06 Jan 2026 01:40:16 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:16 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add CCI and imx577 sensor support for Talos evk
Date: Tue, 06 Jan 2026 17:39:52 +0800
Message-Id: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjYXGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eJcM0NTg/jUsmxdi9Sk1BTLVMs046RkJaCGgqLUtMwKsGHRsbW
 1AP63s9xcAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZAVAsjW4UmOeQ/5umcVRpfmT1dJPXRUxpnxO1mVpNqQ=;
 b=nRnHN1u2QHuSXcp9me4p6/b2YOVlHIXt6yEtgQn3gDr4HGk8AS+p9Do2+Ltw6mGbQDzPXuCDv
 I/vdOyVh9/WBsJeIH8NeLmtv2GUaFhrmJu1oBUE7F/5tSk4hEJT5siz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: m7_FppG7t7yGeOI2ujppJ6r0pEmDZ4ft
X-Proofpoint-GUID: m7_FppG7t7yGeOI2ujppJ6r0pEmDZ4ft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MSBTYWx0ZWRfX8302+lmLEs+M
 QaJDKhzE2OxXIHnzx+38+Vrw2GoTNUJev4YM65Fq+rVQ6rQPf5ggXxG6R7KdZGWyla0Q9k7cQIB
 o+Djm6q/Ae+JBnSXY/BQ28IrapS7TKrDpkldMv5fZOS1aqTWJ8NZul+CCtK6kVpEcCiEyNJj9FG
 c5NBBtnQTlvJojLGWyB6IcQ1+6w/W8tjRCIiA3RROfPpti5PXIkqFZJnPNxGFwAs114eW/TFa0B
 ceOh7jzrkLS40i6kMPpa+VUQht/fFKfuldu3NedaTrDfsFGp7EAqKqFKGTC6Nbo8KZrQvqGBHiI
 nrgQzQD4UMPMDf6lw2ihQLYZXV/Av82JCZ+HAHabaXyy9MuvdXHKOBP8imkwB8gxNLKOjkfn8wz
 NXoH+KX/D8xE30G9Oh4MM9iAtEc33l2ffYQiqNQD3JfG5GPN6jbRb3iZj2WBvVlHpIhzFznz+f/
 mcTGifd6t0QZNX45sRQ==
X-Authority-Analysis: v=2.4 cv=Jpz8bc4C c=1 sm=1 tr=0 ts=695cd881 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=m-n3JlnGHUGlcO4ZAO4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060081

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com/
https://lore.kernel.org/all/20251230130227.3503590-1-tessolveupstream@gmail.com/

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (4):
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  18 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso     |  63 +++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 100 +++++++++++++++++++++
 4 files changed, 183 insertions(+)
---
base-commit: ca0a5887956ccdd8b535b9819fee0bc62f0bba5b
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



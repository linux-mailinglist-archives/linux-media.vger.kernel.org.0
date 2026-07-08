Return-Path: <linux-media+bounces-67003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RwX/FB9hTmp9LgIAu9opvQ
	(envelope-from <linux-media+bounces-67003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:39:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD07277C2
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:39:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jYP9R7UQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TP+8JmD9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67003-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67003-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0F3C307AEDA
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC52478E51;
	Wed,  8 Jul 2026 14:33:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C74657E3
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:33:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521235; cv=none; b=bVW0e0afBZRUGkr39lXfUKyqkuajhwI/c8wT+30bnXvtd1Mb5sHYLaZF7aq+VWhNJFn30wld5PiPQk7m8qKBt1qSy0zx+eTP6HkVsRvRJXRNCohRqg/emeJ8arY9FpL6YNqcLQP4PkAEZZT7/3M77m7ZOR3m67YmYkyTktk8aU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521235; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0Lmpvdfigm38tFz118+Bido7YfoU8wJt3SQnJ9IgHn0e8md6L4vltCTR5KB2zaHd4pLhQy4H5cRlz4BS4j8HwC9rNRWLGH/Ly7TEzk2ndS4OiPws1SP3DxGzqcdPwP0nh7EorUncKpk7FHhDpGnkWTxzHG6C8yfyWAwHSBV1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYP9R7UQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TP+8JmD9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C39sW2605301
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 14:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=jYP9R7UQrgT2S7/8
	2XIicmxl41slyWb7eDfWaehFliYNxNFh9RyWngLe/hK7iwX0BeZZN0AAaiDD2bKU
	LUJb4P6aMpxobcgsAuSb/JEwm3sEHxIq76zPKUezLdopp1gU8fFM+0oM0q/Ycqyw
	1Vz1NiN5rbstim0xIGOn2QT/GL9aKPgRa0UHcQz+sXTIeEnl9Vg57HCRWvJMGmT5
	GNIkQQ6+7PMBLJhW4seXvJ6iYbCMkSiYtb8xWlo8KdxDJyxXlDPKR9hAUWo+IpdU
	8xCap5fKSpTGXKmcgZX5uY7jup/W5EdSJqCpQ3HjzO29X7KSFHkJv2V8nVdqwC/y
	oYpA1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5b548-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 14:33:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so8509251cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521232; x=1784126032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=TP+8JmD9ibz/b4BNrqyglQF3ifZRxj2GeMjNg3s/ZCTK85Xu6R6OnhG54mMAEXBGor
         JZ457eydGXuEejHFTqqaKi4Kcdbcw5KqgMPUUYUbr9eyEixftHNN59GLfSGAZoqe2ops
         O9tAI6DxGshHaM/vtraNGeJOG2mj3yM1MRW+CUE+irFeIhuVCMTvToJUnRruDETIm27r
         IiqInUuSd2XFSoF7Or6WE1xOHhvgJuWtL9XcfGhcWZ2zqjsKRDuW0fWHF75Et+56SzGh
         G4WOTnk1ULsl2jUteRqxxeb7/1LTQUK4fHkomlmRa6eDxY1Akxb2XSagj2x535tWtI4R
         ZGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521232; x=1784126032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=sKN9Rug6RCUBovslRxMSmPCw8RxA8sgTP8nPUmyXXRDyiCVweSjw3P4N5xnxlELGuk
         t4pD0HtLoukMQ2EbMxy4Fn5ycnlgDFyPJF9Xl8sx3EU1ce/Hx6W2qULj79TOS5NiHr60
         BPqU/3dXjAwhcApFDGvjO79A+6LXzGM+4rlnVaG3s2gSPZ6rbRajccO/fGOoI9j+jJ0h
         dYerhQgmiKnpuK0TEXSyaH1HGWKmI4SzyjplPB7LPG6fCm6v996od8HpgWpj8bE1EcJ0
         uhj8O5njUnAYJhOrkks0JAXyLUhwQKsVhFhZqg02+q0i+knb3f+Kxby//AZ+beDE6C3W
         pljA==
X-Gm-Message-State: AOJu0Ywz6Z+S5jwax6o36lsMpi3Gkn7n4+i7DWzjSGSx8/c66OUDxgnO
	SfLm95LCw1cjL6pVzNVGOqqSJgZFunGzJLedXs0HlBtu1h+imCLcEvT8GrUxOBfxBXv1q+cOBd5
	4Pl0LU9Yiq6hJvZSpiBF84lHHaGKyFVSihsMI0XTgCzIwE/EIxGA8YETLTro+lrsPNw==
X-Gm-Gg: AfdE7cmgheAtq5+ghNKNduFF/exTZI0ibK1kppft47taOqLMfq+tEfT3g5kQWjF4LNh
	z5rcEX0FhkVh6sWQRhCLzwEcjDiUmMvLYSVArgSIHSC10Jw3D53/1vQZZu2TCgnhlC5SKHEPcLQ
	OiO7oKyJRR6P+Ag3/2X1Nob86dKlsdb2Oev3xUg7J4pH63l3lhGhh6CeA1Tzr85AxZrvt7CcmSR
	xU5aW+5hmrZsq03gVEAsI2qc2n507mgHIzMPYlEt4PAitcIZYkbOe/I6XAGEvggZvdSDoWshv2M
	wOeMJSC6HXGZhFm5joyr18hWj/EGMZumhP0DR6BrXSO8tFHQKZFRaZBvp1S4zpIN/LyR5uf5pMS
	XyvCn0QdaNwmrxxZglwj6BoD5T+Gh0cBA1d3QDUQ0dtmEfXaQJACHTEhVmepXh5Qz59e4UlVKpq
	5qgig=
X-Received: by 2002:ac8:5f12:0:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-51c8b400f3fmr29170921cf.17.1783521231108;
        Wed, 08 Jul 2026 07:33:51 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-51c8b400f3fmr29170601cf.17.1783521230660;
        Wed, 08 Jul 2026 07:33:50 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d799dfsm8960807a12.17.2026.07.08.07.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:33:49 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 22:33:31 +0800
Subject: [PATCH v3 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-og0va1b-v3-1-de8e44455a42@oss.qualcomm.com>
References: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
In-Reply-To: <20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783521218; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=eOQlSqTcykO4M//Paj47OebtxtOxi9wvnK5xZ2N72tc4H9OFa9quCPN+CddBZxo8k5/X4/RBm
 udMqlrxvMMoDynl4QpFDMS4DKO6x8B86OondLn8L3o8bp22VIN1xWZv
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e5fd1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX519iQ9OW8gSW
 hvjZvgkxpm8XnigtlT+gVebIcNY5I/xCKc56ZAYE68/TNwgyonPyhO4DG6H7qbht9ANAH+e1TGa
 wEp3eqsNhtNDk29f8n8DkUGTNnBBG1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MyBTYWx0ZWRfX3LkpTmBsWsx9
 5LDx9yXho8mpalBc4PCE9FUEwJPN4k3y8hZxug5GF92NaLwSd92RGf0GdWGnrjN6jfek1bhKRn7
 2kL1SWqwEqGFv9sfqABrQU8iwTa+o0zSxFImaNAoXQj7qYx/AeHgbzadSYWShVXHCYlzIX84EiG
 aoQqmAy+j7t0VeSz5537fg8aaHygjbDe+amWcw7mdNK81laJCnxFoSqCbrCIeU1kC8oTKyViGh+
 fiOhlQi8PyJmzxEWA/U1gADBxHwY1Ro+0B52E7KD2Y7o9yfIttSmSJ87We0NxzIZZEo0sa71UP9
 HKkscK2EXwm8RBD87fa8P9dxwQAX2dpjjy3CIk6zhaCIXKf0USliiZPEwI4GsH4n3OiW+rQ3EUM
 J9EYIZpWN+4OrpFlsIQrQDjS8F/ckh3pJiAvy5iwbMWunMyZLzFrxAxbztXXXE5vQLUIi5CX8/4
 9b20l5dPV92G02YdmUQ==
X-Proofpoint-ORIG-GUID: KPSyGQe98AxvrkO2b1mHl_ifp32ExJUh
X-Proofpoint-GUID: KPSyGQe98AxvrkO2b1mHl_ifp32ExJUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67003-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c09:e001:a7::12fc:5321:from];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,129.46.232.65:received,209.85.160.199:received,205.220.168.131:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BBD07277C2

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1



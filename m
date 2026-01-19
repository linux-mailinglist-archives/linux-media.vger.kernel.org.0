Return-Path: <linux-media+bounces-51032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5FCD3A488
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 11:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E393830299F2
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA16263F5D;
	Mon, 19 Jan 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3m8NjWo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1TO+kSB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0335772D
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817709; cv=none; b=WzxXQgKwMSnD10KL+L/0oE1xncB506tsaWstqp7OSqWzRWM0VFT2SEiRe57m0sE0Q8pDvJHtBj+BtxovE+cIzQP9Yeyvh1uXcI4qUy7xzcHUsmAOy5FQFV9RkmgvE7Ekxup749j4LaODmOTI62TkvyEHvq87g4ck82gdcZ9HOCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817709; c=relaxed/simple;
	bh=MSqsntQVa4reSlOD+fOmXKQ/dnoBkLN23rXmDx23JBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O+aATyRc4KfuEpQgpL4e1rxCXYcohYxoGhSVAckLyWYTd26LktDwIXzrWs6ea/66Mnd+xrvXR3olxkrv4cGQfTFMYhcfckQvVrkeDRckMGowsefFDwii4t+pmEZUeEr/WixZmM/hOgKkPYPUA88RsZDrpZ2KwGMdLe5n4tAUiac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3m8NjWo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1TO+kSB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JA7UqW597652
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pVuW2oGjDFO6LozdlsMETP
	RLJ1f09+ogX3dPaJmC1sw=; b=e3m8NjWof74/IxAGqgB2Qdjjs4o5HRplUHnS5e
	rOJ69A4ouFLkxmeDh56EjN3m5ou8B9yHLmKIOVwQJ5N7ZwnRUErQckXQrsw6u01Z
	XAQyp3dZY5Yb5O9yY1lOq+J95KtJ/PYIPRSOCC76dWxDuEqvthHgNXuJVo9K9axu
	Z7H86HzBIMlLaY9kiDp05Qv9OSFG2FCLFajKvbL5JMPs4ilZw6uCdIKDTceuyns9
	uBV4m14Ixq5Iip9uPaRww8Lr/x/8epaufvGTsn47/oLYGV8N5wcL0xGLC5QKq8lO
	BevuXpT9KYam972/+ZMhuzWDI2MZtIgOifTzSXw364x4hkGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7g0sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 10:15:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-502a13e3e55so86778271cf.3
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817707; x=1769422507; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVuW2oGjDFO6LozdlsMETPRLJ1f09+ogX3dPaJmC1sw=;
        b=F1TO+kSB9oodhkD9wn9XXQqR6aKhGQ4b7W3HwgGu/OSoopL2KNwTS7lXpRSsJX8UU6
         ihEYEUgikF/VfzcPdmVoLYOPc/SqHNSlVoYKKTJ+MRf7a2CbBpzqE4ItHL9hrTSctlsC
         jWX4Js9SnstBp8IGWvxaLOcsSjMIOkUC68u1xCo9g8M76TtcJnmu3nqywEcR7Pb4KpvX
         Aa55BpB1dttH1uRuawOhOamZoJSmewWR1psqBET5eNl/q0r4JDp++dtkdPsNjXtOtMr3
         YzOh1aB1C3rybPrLMss972u/EyIcPNBcOWiglT1QXQ9+obFRK5iNsp794+on3QeNV4l/
         ec0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817707; x=1769422507;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVuW2oGjDFO6LozdlsMETPRLJ1f09+ogX3dPaJmC1sw=;
        b=xLH4YfgQffbx7j6VoukkhYgjfP6hHhuobqHnRKCKCfqvFQ0QywtnWw7UoR9x9t4hrG
         OL4SIJ/5ruZtDSF5jq8anFWnsYKg39QHK+zJ6T9xeUryEpgwsO5uLAX6D+k+M9b8K7Xo
         W/ocTtTNl5SM60JbGrxWNd64Xo/b6GtAw3ylFi3/c8UOs6ANwJrhEDCusMobRk9kqAG0
         f7H8uOIC7ZncCBGUnjWEWZZi09ijytp9ygdwalicBrg+ht/LvbmMzSf5UghpRWwhCnPT
         dyuXopb9LGnydhOJrK67NZS+GWxNgQwKLCNAh5I7e6MjNKsrPLE0aX42vZqSTefm6kuN
         Yt3g==
X-Gm-Message-State: AOJu0Yw9YWjroysFN0z+PLwOg1EfmucU2RTd5SyvKPtCOkUDFMRMD1aO
	7T2sLuZkQgmxKeZsqQZ8flDWPhO68KoyK3ueeW1r7QDhGggS1RAkgDIQ59Cll9fwfHZ/w9ENuR8
	0PM1z5SLmo4HfgoqUZQ+lYYpeWICb+Eoq+V2WiXew2Ijy+CgP3IlnxmXy2SIJeXcabA==
X-Gm-Gg: AY/fxX7QyABCWw4DkpAQcpkfOmi8J66qDDo9yRWuiGkLQRjo9G+5d33aVEMMLinjPqZ
	xrx2lkMLV2wpv0D1IJHVeIRzMrx2K40JjJ9S62ZI1grKg1YRlKXf+05WSc/YG+S9JB6KwjhY9tV
	cVG/y4+F9v6xfMRjWcWRjOwQU6DjPuwiA0a+1X8v9Lv3YgYBNTiE1bptShxEMZPYtc9MM/ADf/R
	YZN6Pn6FCArxByUMioe84zt2oSVwhvFRLMFxRnX2DA0o62xSXMvAHjmdW4ElEvTc00I2Y97pBhh
	H3Dz3fa8DROxviOrxGEaJwpjTSLJz32t21yzNfi7yJrp0uwwl9YAClN8pmWwv8gkpW0mgqvHEH4
	egi6brrNrWXThRuz/cD6a7mxoj2UYkZ2Mu3Bw9LhAtcMvdWiao7Wc3GYrpvvmsvgTJxWJYWShq2
	a8
X-Received: by 2002:ac8:7f56:0:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-502a1713848mr144197621cf.47.1768817706746;
        Mon, 19 Jan 2026 02:15:06 -0800 (PST)
X-Received: by 2002:ac8:7f56:0:b0:4ec:ef62:8c81 with SMTP id d75a77b69052e-502a1713848mr144197331cf.47.1768817706287;
        Mon, 19 Jan 2026 02:15:06 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d8640sm77208166d6.50.2026.01.19.02.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:15:05 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] media: i2c: imx412: power on timing adjust
Date: Mon, 19 Jan 2026 18:15:00 +0800
Message-Id: <20260119-imx412-v3-0-8b46929af773@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACQEbmkC/y2MQQ6CMBBFr0JmbZsOJZi68h6GBdIBJqGttoIYw
 t2txM1P3s/L2yBRZEpwKTaItHDi4DPoUwHd2PqBBNvMUKqyVohGsFsrLIWtz6jupre6qyHLj0g
 9r0fo1mQeOb1C/BzdBX/vP6GMqiqDWmqNSqB4k3fkBznxfA0pyefcTl1wTuaBZt/3L46NOImjA
 AAA
X-Change-ID: 20260119-imx412-d6710b9fd3c6
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768817703; l=1360;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=MSqsntQVa4reSlOD+fOmXKQ/dnoBkLN23rXmDx23JBo=;
 b=emopiKh1FdxoN1bZuBPrWV+ZABXBCMgXJyum0uN1G/s6U7FLZNwCW1qnSFUp/muX+76kvS9ku
 4XOb4dGM8D3CS/WJrg+V4OWZ2wYV+rz73sa6de3Qv6Q7xgWJ9sgGh7x
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfXxBuyyZfXhq4D
 0+BE4Wn1YdJKI4EPpXQZ105+yaYoR10itdBTAynFccAa+YiIOIn82HgN2mRnyz+5PM8OIPrrDmw
 9U3VwdwrQYY8Tfds8g5eMeA+oM7Jw1Xeuy6A7wkP+TUpnmYgGHRn8Bz8mO+Hu2g8U5sHujhVpAy
 NLERvz4Yo6pj4SRRsEGUBfHVTBSxyup4MUgDExR3QzPHnuAkc4HxDk2GWbMJ59Bv+mybWoVQEaD
 tOnUvdsM8cNeMHzaZFsO4kCo3olPIwupPGoF0UPzqheZ85inHiBNeRahouJfCbhrgh5q0GFlOor
 h8kSt+tEGLTo3WFFEcfGdeJGNe2crjHRxJ1Xj58R+B/k1+cuRqwGNpSmAycj87lY7favMMV5X6L
 U4WmZ4C04Zgc30SEAKtArikZauz193DciBBDoXXGbqRLn516LgjWOixuvRvUquS2d3d+Lj/euGE
 yGAo8x+D9hR9G6bloGQ==
X-Proofpoint-ORIG-GUID: zFLvQx6B-Lx_9IOToxsh9oaNZ_AA4s8V
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696e042b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Rz3T_L-m2ZCUWiLNYVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zFLvQx6B-Lx_9IOToxsh9oaNZ_AA4s8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190084

This series of patches mainly addresses two issues:
1. The potential inconsistency in the sensor driver's timing between the
first and second power-on.
If the reset GPIO happens to default to the deasserted state at the very
first power-up, the previous sequence could let the sensor run before
supplies/clock are fully stable, while subsequent power cycles would
differ because the driver explicitly toggles reset. This results in
inconsistent power-on sequences between the first and later power-ons.
2. The Arducam IMX577 sensor requires a longer reset time.

Changes in v3:
- Fix power on timing. -- Bryan.
- Add reset delay time for Arducam Imx577.
- Link to v2: https://lore.kernel.org/all/20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com/

Changes in v2:
- Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
- Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/

---
Wenmeng Liu (2):
      media: i2c: imx412: fix sensor power-on timing
      media: i2c: imx412: Extend the power-on waiting time

 drivers/media/i2c/imx412.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-imx412-d6710b9fd3c6

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>



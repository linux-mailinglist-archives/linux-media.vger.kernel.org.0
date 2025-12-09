Return-Path: <linux-media+bounces-48482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D634CB080E
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 17:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C9B13009FC6
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 16:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB12FC03F;
	Tue,  9 Dec 2025 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SW5GfTEp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOkv0d4w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F73002A0
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296395; cv=none; b=rwobM5uOyM2n64qVjsYS9oa2dJcsVsy6lBZOxjQnYeClJ1hAw8fS02akG9Uv+mbb3NrNg2HmMKfdIVYM8xoJVYWw6TnVSasA9OhpQ1zA6fk6NrYrA7vGJ5v9P9NiIbhrf7jbmSR1vES5K8esiye7JkUXtQ9NR5t9a0QjzpeVeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296395; c=relaxed/simple;
	bh=L174GWmru7ZF4OjbWwGfFdgE5zDp10ar9lX5+CU/Pw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VqnaeaxgCoBVCOsBRUYRrp6RfVZm7T7VEEqdNcUXf6Pe0YKz5NKAS1lY0kZVCVvsFGSzI0nNJ7ebKthcaWb6XpIaInUQoYaHyEiOWfucikpdcWgl2EUW+ZWRFii2sjEir49lFD6bQoFrgNvGD7xQ8wJKR2NySWMqcygy0GHUHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SW5GfTEp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOkv0d4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9G1CfW4160301
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 16:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcgKvC7JRfGFnDl4d1cl7qh9ZdiZ08n1nj3k1pmly2E=; b=SW5GfTEpkBMHYiF+
	ComXj80omqehfxrg9TY3284G4vDdb+Ezgn3VcD3y9QJ2xYTshmIPzolrQfchVIvM
	yKB9nsrUlyFODnTmaxS9keP1Qxen8LW3nYUesAEyT00Kj7KLSVJmZLYqDjUIiexd
	i9aV0/dNF/fhflENYRo4AKF8uJVKxSo3/1TxJGCzwxBh9iiqRww/ImrFLk1Dly2M
	4JpwnVwQ81xmdQGF9NLmPca7TbMbnr38w9iaO0b8WR0m69K2YsVaSjN7xuuQjuJE
	Vi5PgMzHTyRS7TqSlvoy4mw2DRamDqS+3uxcWa98TIUpik35jHNtTPTBTImymfjf
	kDKCWA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axpx180yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 16:06:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9371a5de388so2665527241.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765296391; x=1765901191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcgKvC7JRfGFnDl4d1cl7qh9ZdiZ08n1nj3k1pmly2E=;
        b=gOkv0d4w0HwaK/HsK9bYboW+JCKVzez6kttiJ0AVIVm6X1ujTPZuTKr+lNvPHt2d7x
         YRp520jxs7TueaFBD0ueslCxcnZ/9yRl5Qjk+BrJDVW25ugu79LtZBQ1tLScpDhQlGUZ
         lXPbsJ00RDNz0W1e397tsBlpF3xNsDZumJBXWfVJvh7SG74BcIoTSu00+Lk9iRGDy+tC
         nns4WHq/N0bZBsykYRzYlacCRZDisrRnsINhLjTIfjPqeh3+yKVXwJK8M2fvvsiLvdPX
         OTHzNG49thUhXGPjRGE6JncJ5xZGkXPwoizw8QfLTysLpUawBAQTorvxenMmdXOAI+23
         Q/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296391; x=1765901191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PcgKvC7JRfGFnDl4d1cl7qh9ZdiZ08n1nj3k1pmly2E=;
        b=RCyjeFzXjnjMsifRir7fEwaboku9yd45qciCVPFGDkB+w66kHpqJMX3h9HgpiBTjwH
         uq6bpibJGD/JCeXw7BgaBz8jZUP5vzfCt7Y3fsuzWUTIXYAkDovQySnKfpzNmukQgOwk
         HOhEuwEWZxVP8/o5XHuOm/YxD5OoxbBbplpFOZRHxE9vfoWz5ZjwC1rP8UkJL6Jh5tkZ
         fh0ubqwoVVnJJynyGpftryM9Sm9t4MhsjoM6devH8AU4c66pYLByiI+ZGt24frFHC5Or
         N5b0MI8OKtXP7kCcbWQ6cZT6sjN11UUfgbzZS9d77Fk1zCkFIlQe1Ieb6o/Y5VgyaCgH
         u/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu5sQ35CubQeTYm5va0LgEQy231hwfHVkPOmAynwG8IetDkhRQFGmsyXSW3k/fkxzp+7I63blFlNz9kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHX0F01qxfBHzS4+7G767dS1BSQdy5kzi/EeimqSnMzf8GFWaL
	WlFTA8n1WKxoNDUqCwbeZzJk58cyRpJsGi0Kp1JCsEGtvLmdF/CAEiIZJ7zTgv11DTtJqPbjIQI
	TeDYdmji1ypdyS4u3I/LiuSIBkZcDQ2/bTKtzlffdwd8Jup0CRGAwH7Yry3QGpUJcPQ==
X-Gm-Gg: ASbGnculHfgBLHjc31bx43w+LU8Ilv2Ra91Y9s/vJ2qfA4iMfY+2aG9r2PHgrwKtfZq
	BJVmUDZ3DIYGiXZaj3JftYMEzlFnkZYzi47vSgu2LDiZRCPhEyvFqsgsaeg8TjTpcLXaYsuA12h
	89kAJmwz/qrzO9OQCcN7YnAK7TN2QrLv7mWKfAimtaguv5a8txCV3r+/pUMx7YNNFi8B7Z+ukHA
	eIQorsjBaJncleigOEbT1dRbALPsTEImfscqcz5LFiNyicZCdxzQhwWI73lJEGsE8rpVbSAj8qc
	xFgsooN/aqMsI5wG2XQMY06GBcuQTt69YZKDOu6LrSCEJDfAJ1szw1p++BX+xj7Nkd+hzt9BnOA
	8RRWYhFJujVwZ+f3+4JLTpvf3+G3zGKJMQmvlF2wyQ6Obgbtgcs6D1NZppIzC0dy32Nwy6+RK44
	QYBpRbW2hNNKWJ6oGgQWQS7X4OTbxPuuuCerXmI+3yF+3Iaw==
X-Received: by 2002:a05:6122:1d54:b0:559:5ef5:b196 with SMTP id 71dfb90a1353d-55e846974a2mr2928941e0c.13.1765296391298;
        Tue, 09 Dec 2025 08:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8y8i6NIi/zLZoGQSXP19HWfbFC9YOHgJWNAUSeP81T3aN0pu44z0EHfMAC4QIBv/bGEookw==
X-Received: by 2002:a05:6122:1d54:b0:559:5ef5:b196 with SMTP id 71dfb90a1353d-55e846974a2mr2928870e0c.13.1765296390559;
        Tue, 09 Dec 2025 08:06:30 -0800 (PST)
Received: from t14s.space.revspace.nl (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b3599050sm14324838a12.17.2025.12.09.08.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:06:29 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
Date: Tue,  9 Dec 2025 17:06:20 +0100
Message-ID: <20251209160621.6854-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gduozJ1WXZEPjoLFK70DdX9_Iy9Hhs3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEyMCBTYWx0ZWRfXxnNkndIgPzzk
 FQiPweih6JVWS5UXwrKVgV9GkuORje+fEKUZCdKCqcbk7cEsu/ehrla7F6sHlydnBHiLJ0WN5eE
 XNFBroCqywrjVhIcyLDFHNUBhIB9WtJfTeSfUVD6VXYqY3K5LJcq8nXzkU6O+VELyemSK3P2Ohf
 /J2RZyqwoy6a5aZn6HZirUobFfPUX7vHPn2Mx+vJooQzySY8L96zpCQxzpZAcSuZyTpZZ3eKhvH
 YBVMA8+5kwz9bzEnocvA58t8WyJ3vLPQYs83xau1z7BXv1YqFx6+2cZAVqrd8XwskPcakgj471e
 QSQ7amah2cBtwNs6CYogK/c99WK2US50T1UcmHmu2TYRsrM+zEu6xmeVhHMEDe0Ulj0ZVt0clL2
 gasX9ESwid35H7IV0Jjv852jZ7wRRw==
X-Proofpoint-GUID: gduozJ1WXZEPjoLFK70DdX9_Iy9Hhs3P
X-Authority-Analysis: v=2.4 cv=Su6dKfO0 c=1 sm=1 tr=0 ts=69384908 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GbN0NnZvFBoPmIocWywA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090120

The Dell XPS 13 9350 and XPS 16 9640 both have an upside-down mounted
OV02C10 sensor. This rotation of 180° is reported in neither the SSDB nor
the _PLD for the sensor (both report a rotation of 0°).

Add a DMI quirk mechanism for upside-down sensors and add 2 initial entries
to the DMI quirk list for these 2 laptops.

Note the OV02C10 driver was originally developed on a XPS 16 9640 which
resulted in inverted vflip + hflip settings making it look like the sensor
was upright on the XPS 16 9640 and upside down elsewhere this has been
fixed in commit 69fe27173396 ("media: ov02c10: Fix default vertical flip").
This makes this commit a regression fix since now the video is upside down
on these Dell XPS models where it was not before.

Fixes: 69fe27173396 ("media: ov02c10: Fix default vertical flip")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 58ea01d40c0d..6463b2a47d78 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -5,6 +5,7 @@
 #include <acpi/acpi_bus.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
 #include <linux/platform_device.h>
@@ -99,6 +100,28 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
 
+/*
+ * DMI matches for laptops which have their sensor mounted upside-down
+ * without reporting a rotation of 180° in neither the SSDB nor the _PLD.
+ */
+static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 13 9350"),
+		},
+		.driver_data = "OVTI02C1",
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 9640"),
+		},
+		.driver_data = "OVTI02C1",
+	},
+	{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
@@ -249,6 +272,12 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 				     struct ipu_sensor_ssdb *ssdb)
 {
+	const struct dmi_system_id *dmi_id;
+
+	dmi_id = dmi_first_match(upside_down_sensor_dmi_ids);
+	if (dmi_id && acpi_dev_hid_match(adev, dmi_id->driver_data))
+		return 180;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
-- 
2.52.0



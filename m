Return-Path: <linux-media+bounces-48555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC84CB2CF5
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 510FF302F677
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0EA2F9C3E;
	Wed, 10 Dec 2025 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+xDVAM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZ/CQHky"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78E2FC000
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365887; cv=none; b=UosxRbh20OHfMTl19idaPO3VZVEgbsGF9JQTAwu1c9EKCkYMXh0jfviQVEFC/mAbGApfxNKEzSGUPQrH7xX9QLHL7NtHW9bzLWDaF5MjU3xjdz/A+Saqm0s5lH6Nebcn9geMzkFqID8ITZj0gmcKs5D8fVDFKEklLcqzVEm+ayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365887; c=relaxed/simple;
	bh=xUP8XzWIweXeY5tthMtwg5GemgkerL2mBixHq0gzRfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kG4GraLayilMYk4sxXaiMc0Rl3bEXes0+5YpNiX+YTw/2vyBD9SgpTRJAOb83Xil9qVEAgx4ByNDvj5+iRUw1OJWuC8SOI4pdGoEpp71xn3A8iMROncBPMG6pNClGLhRG3Dfatkq4V/3A1IVtIXwU3RI5z46kQML6Q+Btmsogkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+xDVAM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZ/CQHky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e1oB2493313
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8A4UmN9C1RmT+bHKjESVdg8JDmS/sCtWT2ZZfK7PdRs=; b=R+xDVAM5uz1jmZTT
	Ydzx8KHMA2KcSkbJS+WOU5v1n/vi0M6lBUxkWEQ1JKKb+yDJh7/s7qlYneDnqZ1F
	RFsiY/Gad2zYuLlVx0E1a15LrETjlHOZpUbnuwm5NciH9cee7CwXhfsefmxSIEtb
	/j9ZoEQks1ZSxW8xXcpsDM4M39xZHjUpKEXxbeekNuHj3cgKW6cNhYbYXBpqi7RC
	aEEIjshZSmroiNqqDPw8XEPsHNZeHT+J5qT1RI8kpATZ5DfTuUTqPuh1pNySPTKY
	44gdngryqGo1ds83SF0Y21IIc5TBuq9RCGeeo7jjvpbSOtKbJRY3lILrsxU5R+Cn
	nxqy9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xws5ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaf9e48ecso172513931cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765365883; x=1765970683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A4UmN9C1RmT+bHKjESVdg8JDmS/sCtWT2ZZfK7PdRs=;
        b=FZ/CQHkydbTXvynezresY58hkDL/N9TWCgETg8pjSBj48ekY0rmOrK9md/17BZIuSX
         rCbFevSFj4LeH0NVbaM8DP6ccpxHneEW25eZ5taw8QFUN3lezsDtDxRu5Jjl/Ys+m+GJ
         CR+d0sbjGugHomSqrqRi2IhU77jpAPwhb2s1ep7SyV9PEObP9dfiUGjuCs+kZh0e1kly
         4b66c3dTCHTOXKxUtasRs0bFOXYL4dxiXPd/4k0Bxl+zmgnpVWSEgo+aENbVkh3qA7fc
         9YnzVSkE0RKXMrCxVxtI4Hv0HRzjowEH8yslb9POft0Hc8xVzPndZMDyC22oOp9ypuvP
         S9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365883; x=1765970683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8A4UmN9C1RmT+bHKjESVdg8JDmS/sCtWT2ZZfK7PdRs=;
        b=Rh07RLbV0Ju82lKfj8lK2ins0ocBLv4yDsBRpXtkH4rJQeE/l+Yt3HiWRmfKoaa8aE
         JVOomnEQ/t58yj1yrWPUW5r/wehrXLqHiWfv9VyUKHCx0uLNLuk1WuplDPtOh+dFJBAi
         zI5kMFR8dAUnz19soHJE+NRzbKNr9+MKsM3t9SsFv+Z3WwD0WtF5+NLocb+gCKO7iML3
         OT3wnfwzvu6YGOsbzXNS+GWoZy+x0RMnTl3G0Og/UbnCs8ci9Zh0aiPDDE29ojp04161
         gWygNSOyVzVuIwKgSW1S1ovNVeLdeBTRJvOY32hRB+kEnN171/GfAwrvhLRMvYPQR2oy
         ceCA==
X-Forwarded-Encrypted: i=1; AJvYcCWMlwZzyyMICuKX7DqWqS7kRV7NtgGIlfW4OYqyCjAgayN/vy59bf3qfH8f1EHGLC0mTAazKiEiuhHMLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8slMVn10HdloMAExkZEexbTbp2Ntcig/Lrkws7RRrz/ztZG4w
	IwZLoyqsIoQb4Pe7kBkYB4BCPY7pdrQVAHd7BPLFRYKguxMJcp/P5xhWHkVCUHZqhJkGPki0/sD
	w5TKoEqPntO/UxtAUMKm8AWlq8QW7opDW0vLEof7qeAPGOs+Cgm7/CsFKz0bDX6cKbg==
X-Gm-Gg: ASbGncsCyz86GJ4fo1K6wDVy+FitF7on8mNKH5955F0fWg+lWLG7aPnml9D1z82/tVx
	Y1YsjndHy9wh2m2F197q0yOxw9nOd5dssHuOyYnoeiWw5FfFhB1S7QdFpiwyasBl1SXoeI50xG1
	7r/5y+NUAAt8sZOS5ZPa3zTV6zvGMIJg9M/Thm7TAVoMtlAC+SWObJT9f0+insVaYuub1qXuAhj
	LNDyk0fLvnZIH0E5AFCxgl5sPWN/xKtNreFTM1Cd6kCcUxOHCtJIJPdTjyax0KYgVNiEq8AiTl9
	V9OCsar+U8PiWdUuLdb2adX2KnAc2ly1ZueUoahCLK4KV0QutCBJ/SgYs/tTeYhv07XDBHOOBvb
	panFEiNtqqF6ojYM39l/60oLQXjRsqnRwY4obtIcNpipojgqV9eYHNv1GyWJ+U1ol4XoexX0LDn
	Uum+S43KF6EW+3n4AZWBLqmbpg
X-Received: by 2002:a05:622a:a05:b0:4ee:1857:2673 with SMTP id d75a77b69052e-4f1b1a09982mr24282131cf.35.1765365882687;
        Wed, 10 Dec 2025 03:24:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvqFYt9eLydcGuY9lV47+eP3sa0CMjo8qpb14v7pL7vN68cGfzQ1swYvSYCCexfPQD+SshPA==
X-Received: by 2002:a05:622a:a05:b0:4ee:1857:2673 with SMTP id d75a77b69052e-4f1b1a09982mr24281811cf.35.1765365882151;
        Wed, 10 Dec 2025 03:24:42 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e3fb1sm1696851266b.60.2025.12.10.03.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:24:41 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 4/5] media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
Date: Wed, 10 Dec 2025 12:24:35 +0100
Message-ID: <20251210112436.167212-5-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MSBTYWx0ZWRfX4JO6VJThe7Sj
 FOKILpKSsl7MsC/ej/mqtEg0p45+dmepoXHyZ/dnGiTaFIZFeDr5wkPt5tjH1FPqo7Qi4Juq/a9
 dm0SUmijF4XfLVodT6PK6dpDBFE3btsxwDNihkcIJgUkNxsoCaLz5g1trFKdVJbTacDL1ynw4u0
 D7TgICFtfqxcn879hmo6nYG1k1Lp3wahX4G5WgRI/YdsUBTZL07Vg7rdx44dInmwswyayVsO6Ug
 tuqJmuczbZ1k55C4ojL2oPBYAA7A5zE/urPUUYyrdTyYNqp6BOCfIGm/dyDRyWxgrFAQ7bgiGKo
 cYwbs4rRXmHDC0IOzTmGwk50oCv4ssPE+XstAtmrsTXXriStYvnPvJkR/hotJo1el+SrDe2xCxM
 pz0NQhz5SkUN46n+N1kwchxwiVRL/w==
X-Proofpoint-ORIG-GUID: J2BAnoGQdnSm13HOuffj2YyuhWvrNKG1
X-Proofpoint-GUID: J2BAnoGQdnSm13HOuffj2YyuhWvrNKG1
X-Authority-Analysis: v=2.4 cv=F/lat6hN c=1 sm=1 tr=0 ts=6939587b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=io_fNSwh-MQL7jGs-6kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100091

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

Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Fix fixes tag to use the correct commit hash
- Drop || COMPILE_TEST from Kconfig to fix compile errors when ACPI is disabled
---
 drivers/media/pci/intel/Kconfig      |  2 +-
 drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/Kconfig b/drivers/media/pci/intel/Kconfig
index d9fcddce028b..3f14ca110d06 100644
--- a/drivers/media/pci/intel/Kconfig
+++ b/drivers/media/pci/intel/Kconfig
@@ -6,7 +6,7 @@ source "drivers/media/pci/intel/ivsc/Kconfig"
 
 config IPU_BRIDGE
 	tristate "Intel IPU Bridge"
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	depends on I2C
 	help
 	  The IPU bridge is a helper library for Intel IPU drivers to
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



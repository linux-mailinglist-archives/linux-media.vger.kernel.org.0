Return-Path: <linux-media+bounces-47509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18682C7501A
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 16:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 81CFC31749
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 15:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B7B364EA2;
	Thu, 20 Nov 2025 15:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvx8OZlK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0137A364037
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651875; cv=none; b=DExQP9FafVc7g8nuxeYLybY9WOHu13Ms5ccXSKBHSJwg7xqDqToNAYVprSILLsGQPH/gN0gKuJ0FTFMj8lWtoUkxxfkGW2yagmTIvzphN4O1B2mdkHFCHhvBqRMd7eoslt6iAluiUF/iAS2Umn9TfFOz5E7TfNk8rzI/xQee4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651875; c=relaxed/simple;
	bh=V1bX16dTvEDrKt1tkmraZG4WsLCIF+fkegVkUd/oMdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WuB6E5PMFG/DuQv3IVUHg2hJ7ApeV4M2nZD8NC4HBQqdGgu/QEd2NXSEB5CxFlbp4txoyjMKUXh2+oOrbi7eDXNve2T/8sTAEzvlrOsP54abNlrjfUHWF+7TcbbnlCgaWoWiNR+m7ik7u6vOPYiwGDnaMd9VGu/C//k7w9LcS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvx8OZlK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32900c8bso618461f8f.0
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763651871; x=1764256671; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wer3mjbYfHeiw2QmUqtyCuHKc//t8hrbgPrVlZE/3+M=;
        b=cvx8OZlKluP9ZD6XJqLjRByau8PBaTk1hHNO3aVVKRxJC2f7KnrtaXVp2ivu6i/1tC
         Trt4iPFA40ZNOuqsWLn+xu4XQYjvrljw/kIqmMq9SbSR6epVolW4mSAxs+3SXI7CmEDL
         LPjzpa+ie8R7BCetcyAa4jbte96KYheGsqdzlG1zXiK1UTesbwuCVIsgLHpoE/hJD8gG
         QBUZ2cUMhpFznydl4hLGiVpNTgAwSLcOspUdwi5s42K4zJoxg/2Fe3gGoN8MM9YZiuJ9
         TrlfVc8OW4PykvqGj3y8lu/Jv/gy4xDOFuL99e0T5QfxAlLA4T827mAq0hFV13CNTfWs
         hIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651871; x=1764256671;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wer3mjbYfHeiw2QmUqtyCuHKc//t8hrbgPrVlZE/3+M=;
        b=vRARMvX28BMPZB0EVeN9KjH1NRkpWJjI1z/s9zcufrmJGMSOYUTZOyzpk1jjnZ+ykX
         T/BM9DamDjis85ZBOg+CZV7vu3A4MGSWjnxhFOQXANBEuyW671YlAm3MSaiyQt05E0WA
         GEQuw93mfnKJnUsOx3m7ehlAke9/RSr+g2YLJ9NzizraKmobylIUB5QTiHh+t9ah/E47
         6TQwrPyLUgouYti7PXmLYpN41xxp0ZVWWz8kHzusDHa8nJ04lazp+dtpQiFOdJR1ClFf
         j+ek2MIZcBw0Ummbhivf4JktKJ2DLjdcMI14rT6W/3Eqq6dmc0K+aWSrf2mqEaSv3Stw
         nafw==
X-Gm-Message-State: AOJu0YyIgMir0qOLdf9jwWXgjVnoHhWI0VwtkSvteY0Plk1oafxl9wmV
	0vEohI3zVwcC1j7JC2fkxqhb7goRAqu7uZ5sBW1laZhBO+U5yhJlMkizsoFS0A==
X-Gm-Gg: ASbGncuXtkFs+9PjX0nTf9PKTOMMGsaft7vyc0Lfe2CcHREZJyFRLvyRqKmizQuMVSu
	MBuglXz0C4QtHTywzTe2CrNKALFPQgFsr6dts7SHSrcxujPSX4vwOLseO3YE6ty8YRwPEFOpMmZ
	xvn/BWty93z7Hkl5LAW4RRGwjm9XeqNvl22mAV+NVEvHqXpigrfR2P/ma1pOjvcifwK9hUO/cpD
	ap6hYf02rnr85qZenTGOOlNHfsMoEHKxuwc9MWIGbuR0Uv55+ofvth0cvtejjC0ECAnGqzWhbRQ
	ZRCDAxNRZJvkk70EH6DTZyPqfQYBLVtBxzj4glM6CYuj4pPgurdHYVb9RNXRNNgsgJHnzz6oEte
	OUQZhLJ9bNvhKwNhSaNC1YMEy9enHeUTom9CGCXJ1stxJGwbJYcZauLQcWSkF/x3smYN6nbOlaU
	jxpQfvBMVINUKcXycgy+ljxnCxIoBxrLIA42ZHVVQsaYnycwf/KKLY3m0Oiv4d30xK/+4=
X-Google-Smtp-Source: AGHT+IGF7aXcu3sYjMGzilkcwQPKzgKO06qQyMKjKSHGyS3GiVtYEOhs7MzVbwc7DUiZit6UpZkFXA==
X-Received: by 2002:a05:6000:2f86:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-42cbb2aa2b8mr2786442f8f.47.1763651870665;
        Thu, 20 Nov 2025 07:17:50 -0800 (PST)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363c0sm5811098f8f.18.2025.11.20.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:17:50 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 20 Nov 2025 16:17:44 +0100
Subject: [PATCH v4l-utils] edid-decode: add more details to the AMD VSDB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-jorth-amd-v1-1-670ec8092d62@gmail.com>
X-B4-Tracking: v=1; b=H4sIABcxH2kC/x3MSwqAMAwA0atI1gbaoiJeRVxEG23EH62KULy7x
 eWDYSIE9sIBmiyC51uC7FuCzjMYHG0To9hkMMqUWhuF8+5Ph7RaJCYqlK0G1deQ+sPzKM//auE
 uFrxOWQJ07/sBr9Z8lmYAAAA=
X-Change-ID: 20251120-jorth-amd-aeaa40d6c0b8
To: linux-media@vger.kernel.org
Cc: Julian Orth <ju.orth@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763651869; l=9584;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=V1bX16dTvEDrKt1tkmraZG4WsLCIF+fkegVkUd/oMdc=;
 b=a+cUZ2aG3kFCTTUESlEhVwKggqe5NQ1HAV6PbPrWiw1WEZQpPI58/j/BLoEzYyTeMRt92tg61
 EsONwmVLtgjDVkRBiEwNK7FyPJmk7/d2tRhn2WXftWeTlS99ImHMPMr
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

These values have been determined through reverse engineering and might
be inaccurate.

Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
These values have been determined through reverse engineering and might
be inaccurate.

[1] contains the diff of the EDID database when regenerating everything
after applying this patch.

[1]: https://github.com/mahkoh/EDID/commit/271605f9a18b06e3df90b7c690f53e76256be8dd.diff
---
 utils/edid-decode/parse-cta-block.cpp | 183 +++++++++++++++++++++++++---------
 1 file changed, 137 insertions(+), 46 deletions(-)

diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
index 3783a32e..ecf32b9f 100644
--- a/utils/edid-decode/parse-cta-block.cpp
+++ b/utils/edid-decode/parse-cta-block.cpp
@@ -1576,60 +1576,151 @@ static void cta_hf_sbtmdb(const unsigned char *x, unsigned length)
 
 static void cta_amd(const unsigned char *x, unsigned length)
 {
-	// These Freesync values are reversed engineered by looking
-	// at existing EDIDs.
-	printf("    Version: %u\n", x[0]);
+    // x[00]          - major version
+    // x[01] & 0x01   - unknown, set in almost all EDIDs
+    // x[01] & 0x02   - set if x[05..=09] are valid
+    // x[01] & 0x04   - global backlight control support
+    // x[01] & 0x08   - local dimming support
+    // x[01] & 0x10   - FreeSync Panel Replay/PSR switch support
+    // x[01] & 0x20   - called the SPRS bit by AMD, related to Replay
+    // x[01] & 0x40   - FreeSync Panel Replay support
+    // x[01] & 0x80   - set if x[12..=14] are valid
+    // x[02]          - min refresh rate
+    // x[03]          - max refresh rate in versions < 3
+    // x[04]          - MCCS flags
+    // -- start of version 2 fields
+    // x[05] & 0x01   - unknown
+    // x[05] & 0x02   - unknown
+    // x[05] & 0x04   - PQ EOTF support
+    // x[05] & 0x08   - unknown
+    // x[05] & 0x10   - PQ-Interim EOTF support (unknown what that is but enumerated in ADL)
+    // x[05] & 0x20   - unknown but see the calculation of supported_tf below
+    // x[05] & 0xc0   - set to 1 if the display is Mini LED
+    //                  set to 2 if the display is OLED
+    // x[06]          - max luminance
+    // x[07]          - min luminance
+    // x[08]          -      if x[01] & 0x08 or display is OLED: max luminance without local dimming
+    //                  else if x[01] & 0x04                   : max luminance at min backlight
+    // x[09]          -      if x[01] & 0x08 or display is OLED: min luminance without local dimming
+    //                  else if x[01] & 0x04                   : min luminance at min backlight
+    // -- start of version 3 fields
+    // x[10]          - max refresh rate lower 8 bits in version >= 3
+    // x[11] & 0x03   - max refresh rate upper 2 bits in version >= 3
+    // x[11] & 0xfc   - unused
+    // -- end of version 3 mandatory fields, fields below will be parsed only if the VSDB
+    //    block is large enough
+    // x[12]          - unknown
+    // x[13]          - unknown
+    // x[14]          - unknown
+    // x[15] & 0x80   - x[15] & 0x7f is valid
+    // x[15] & 0x7f   - unknown
+    // x[16] & 0x80   - x[16] & 0x7f is valid
+    // x[16] & 0x7f   - DPCD (DisplayPort configuration data) register offset for
+    //                  proprietary AMD settings
+
+    if (length < 5) {
+        printf("    Data block is truncated (length = %d)\n", length);
+        return;
+    }
+
+    unsigned version = x[0];
+	printf("    Version: %u\n", version);
 
-	// Obtained from:
-	// https://github.com/torvalds/linux/commit/ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4
 	printf("    Feature Caps: 0x%02x\n", x[1]);
-	if (x[1] & 0x40)
-		printf("      Replay Supported\n");
-
+    bool hdr_fields_valid = false;
+    bool supports_local_dimming = false;
+    bool has_global_backlight_control = false;
+    if (version > 1) {
+        hdr_fields_valid = x[1] & 0x02;
+        has_global_backlight_control = x[1] & 0x04;
+        supports_local_dimming = x[1] & 0x08;
+        if (has_global_backlight_control)
+            printf("      Global Backlight Control Supported\n");
+        if (supports_local_dimming)
+            printf("      Local Dimming Supported\n");
+        if (version > 2) {
+            // Obtained from:
+            // https://github.com/torvalds/linux/commit/ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4
+            if (x[1] & 0x40)
+                printf("      FreeSync Panel Replay Supported\n");
+        }
+    }
+
+    unsigned short max_refresh_rate;
+    if (version > 2 && length > 0xb) {
+        max_refresh_rate = (x[0xb] & 3) << 8 | x[0xa];
+    } else {
+        max_refresh_rate = x[3];
+    }
 	printf("    Minimum Refresh Rate: %u Hz\n", x[2]);
-	printf("    Maximum Refresh Rate: %u Hz\n", x[3]);
+	printf("    Maximum Refresh Rate: %u Hz\n", max_refresh_rate);
 	// Freesync 1.x flags
 	// One or more of the 0xe6 bits signal that the VESA MCCS
 	// protocol is used to switch the Freesync range
 	printf("    Flags 1.x: 0x%02x%s\n", x[4],
 	       (x[4] & 0xe6) ? " (MCCS)" : "");
-	if (length >= 10) {
-		// Freesync 2.x flags
-		// Bit 2 no doubt indicates if the monitor supports Local Dimming
-		// There are probably also bits to signal support of the
-		// FreeSync2_scRGB and FreeSync2_Gamma22 HDR display modes.
-		// I suspect bits 0 and 1.
-		printf("    Flags 2.x: 0x%02x\n", x[5]);
-		// The AMD tone mapping tutorial referred to in the URL below
-		// mentions that the Freesync HDR info reports max/min
-		// luminance of the monitor with and without local dimming.
-		//
-		// https://gpuopen.com/learn/using-amd-freesync-premium-pro-hdr-code-samples/
-		//
-		// So I assume that the first two luminance values are
-		// the max/min luminance of the display and the next two
-		// luminance values are the max/min luminance values when
-		// local dimming is disabled. The values I get seem to
-		// support that.
-		printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
-		       x[6], 50.0 * pow(2, x[6] / 32.0));
-		printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
-		       x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
-		if (x[5] & 4) {
-			// One or both bytes can be 0. The meaning of that
-			// is unknown.
-			printf("    Maximum luminance (without local dimming): %u (%.3f cd/m^2)\n",
-			       x[8], 50.0 * pow(2, x[8] / 32.0));
-			printf("    Minimum luminance (without local dimming): %u (%.3f cd/m^2)\n",
-			       x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
-		} else {
-			// These bytes are always 0x08 0x2f. If these values
-			// represent max/min luminance as well, then these
-			// would map to 59.460 and 0.020 cd/m^2 respectively.
-			// I wonder if this somehow relates to SDR.
-			printf("    Unknown: 0x%02x 0x%02x\n", x[8], x[9]);
-		}
-	}
+
+    if (version < 2)
+        return;
+    if (length < 10) {
+        printf("    Data block is truncated (length = %d)\n", length);
+        return;
+    }
+
+    printf("    Flags 2.x: 0x%02x\n", x[5]);
+
+    if (!hdr_fields_valid)
+        return;
+
+    const unsigned TF_PQ2084         = 0x0004;
+    const unsigned TF_LINEAR_0_125   = 0x0020;
+    const unsigned TF_GAMMA_22       = 0x0080;
+
+    const unsigned CS_BT2020         = 0x0008;
+
+    // the calculation of supported_tf is a bit weird because it doesn't correspond to
+    // the description in the comment at the start of the function. but this is what ADL
+    // (AMD Display Library) reports
+    unsigned supported_tf = 0;
+    unsigned supported_cs = 0;
+    bool supports_hdr10 = x[5] & 0x34;
+    if (supports_hdr10) {
+        supported_tf |= TF_LINEAR_0_125 | TF_PQ2084;
+        supported_cs |= CS_BT2020;
+    }
+    if (x[5] & 0x04)
+        supported_tf |= TF_GAMMA_22;
+
+    if (supported_tf & TF_PQ2084)
+        printf("      ST 2084 (PQ) EOTF Supported\n");
+    if (supported_tf & TF_LINEAR_0_125)
+        printf("      Linear EOTF (Windows scRGB, 0.0 - 125.0) Supported\n");
+    if (supported_tf & TF_GAMMA_22)
+        printf("      Gamma 2.2 EOTF Supported\n");
+
+    if (supported_cs & CS_BT2020)
+        printf("      BT.2020 Gamut Supported\n");
+
+    bool is_mini_led = x[5] >> 5 == 1;
+    bool is_oled     = x[5] >> 5 == 2;
+    if (is_mini_led)
+        printf("      Display is Mini LED\n");
+    if (is_oled)
+        printf("      Display is OLED\n");
+
+    printf("    Maximum luminance: %u (%.3f cd/m^2)\n",
+           x[6], 50.0 * pow(2, x[6] / 32.0));
+    printf("    Minimum luminance: %u (%.3f cd/m^2)\n",
+           x[7], (50.0 * pow(2, x[6] / 32.0)) * pow(x[7] / 255.0, 2) / 100.0);
+    if (supports_local_dimming || is_oled || has_global_backlight_control) {
+        const char *type = "minimum backlight";
+        if (supports_local_dimming || is_oled)
+            type = "without local dimming";
+        printf("    Maximum luminance (%s): %u (%.3f cd/m^2)\n",
+               type, x[8], 50.0 * pow(2, x[8] / 32.0));
+        printf("    Minimum luminance (%s): %u (%.3f cd/m^2)\n",
+               type, x[9], (50.0 * pow(2, x[8] / 32.0)) * pow(x[9] / 255.0, 2) / 100.0);
+    }
 }
 
 static std::string display_use_case(unsigned char x)

---
base-commit: af4a91dea9a25f05af5a1b8a26064d7072ae7a79
change-id: 20251120-jorth-amd-aeaa40d6c0b8

Best regards,
-- 
Julian Orth <ju.orth@gmail.com>



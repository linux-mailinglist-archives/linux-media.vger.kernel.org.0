Return-Path: <linux-media+bounces-25293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E794A1BB2D
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 18:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44DC93A4BFC
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 17:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB431BD51F;
	Fri, 24 Jan 2025 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6bOKS/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B423B0
	for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737738390; cv=none; b=bcQHoJ1BwTkOf+w/PKXCdMR8f7382uOgMwMtgAFGB0W4bpwRInLqwqGRJH6uQn7cPdnwCMASulnhkM6bwv1ZiyT6hSvFQ9khFUM4M/ivl5Ojf745M85MV88o3oo0XVaIWdX40VyQidoOm4LacLoYBQP8KJnj6GsPFHUoppptWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737738390; c=relaxed/simple;
	bh=no8xuIuw4lwLg+yfpdXObOJnpSPglmLRpLuOQWOy13A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=enC8x7PsO2npqlTvvAfuVp/qxbA+hvgfzTcRnXxNmWunjG763vJk+DNuBuaNn6g+vX4MPoen2QP+z/k/dWlYxt2d2P5S4UVplbwvOweVD8qR9EipcV0g6Lz48CLvBLqV3lm14ZJ1CYDMuMxQWbYlSIyfgx954lZLl+dvM8Up4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6bOKS/X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso1876440e87.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jan 2025 09:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737738385; x=1738343185; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AR2kGVAyxD3rBCYWNcomlT1SiKZUiqB0kHtMT9GDBFw=;
        b=v6bOKS/Xe+NmqijFTHCI7YnLZCb7xEGCTXHSyXS60OdBPiXihYRGRAkXKyFbpOfXmH
         92xzQEijZGhW54V2QvwmIWe7RvBVT/rngt0BiN7OosnWKLqYVajxeNwjxhURWZSFghOM
         l1UhD6HYQYMt9PuSDAf2SFWfnulTIO17bparNlRwXL4CVl/ylYLLmUGNUYBokpwm6/+Q
         /MOYy51OvkFdaYjhTtvyJua5+M2w+h7+OAuPm5DVuo6rw7NNJfKm6oXKdZ63V1Pd44ly
         K3v/1Uy0Gjk6ARmeZlvpex5f5ziUfNCoczGwkzBOlFRmFhI2tBBTSYC5OOT4zldAn5Da
         lIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737738385; x=1738343185;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR2kGVAyxD3rBCYWNcomlT1SiKZUiqB0kHtMT9GDBFw=;
        b=gjD/yE/w/v+JwApWIB5OCrZEqf7U5OoJWY1+lyf5U9ZueIZ1YkkaEJGe7b8b6JXfMz
         PQBB3/Z6w4hFtI95rLmbuZWalC/MdvAje1O3Wq8uxmOODumcPNpo8ioCGM011Xb4XNxE
         zVAwvExgDeHU+mDLW2S3UMhzdo4pTjlWzPBb4JrCvKjTRI6fetzJzwldjuKClSzeaZHP
         qaJXmRkYYj2QB6WzrfU1vMumpPl74WiYTCOMvSy3UUpgx4+JE0207zprzoXmdQxweTNq
         t1TEQdPVJmewj5EZaFXG/s/npI/wvxfq+PLUhTO1VRo74ZW+JXoJF4iVi4K8KEkYX89u
         PCww==
X-Gm-Message-State: AOJu0YwS+fWdw+J5ApX20whW9gBdrfdim7eXKbJvFyqN+aV/uut5Lp7x
	A45oM+X/1oRicfxsL4GgKvpTOY4Rp1mpdEkdgFzQZDeWiYoZtSx676xw0kp63HQE0WtXj33eIav
	cI1E=
X-Gm-Gg: ASbGncv10h6B/X1pyy4UA6fQvpJqm0dbSl+oq+90HIy5S9vsOP8OcGjVRYram8czQhw
	md5M7JywhvYxYt8xSPMeT7VGujZgtSAv0sqdHW6CaWtXYZrGg5urooDdhvjRJM2ITks1NeEsBop
	K4633K0BXEU29mcNsAkQ4ZlOMH2Bpj/QVjwTk+2jgcFBbqIGbgOqaDmNp2zjK68oUNqCvmnbE9Q
	xQRNS62w4CZ8cpQzrpgiEHnq4aU3JrGWgui6VxLxObfsiuBgm+Dq+8dRMvsGEabzZ+rSpMG7k89
	OaQmaomdSaEurnIUd8GcOoIf4jfHPYFpGNIs8hpxTmnWDmnHXxVAlCr+gEh/cachUXAlbi7RhdD
	VlJnNHOEezwwmEw==
X-Google-Smtp-Source: AGHT+IFWyqcJBywcIs4amgQumg9mj+CXFTbLi6NzEFpk1DLzXtc81OVQ21tK+FDblM7IV/ukqkumHg==
X-Received: by 2002:a19:2d15:0:b0:543:baca:6f12 with SMTP id 2adb3069b0e04-543baca7025mr4209356e87.37.1737738385116;
        Fri, 24 Jan 2025 09:06:25 -0800 (PST)
Received: from rohan.lan (2001-14bb-c3-1bd4-e879-53c0-7bc3-b726.rev.dnainternet.fi. [2001:14bb:c3:1bd4:e879:53c0:7bc3:b726])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c837e228sm352092e87.216.2025.01.24.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 09:06:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 19:06:14 +0200
Subject: [PATCH v2] edid-decode: support parsing EDID-Like Data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-eld-support-v2-1-108c1b3a0837@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIXIk2cC/23MQQ7CIBCF4as0sxYDtFTtynuYLgiM7SQNkKE2m
 oa7i127/F/yvh0yMmGGodmBcaNMMdTQpwbcbMOEgnxt0FIbqWQvcPEiv1KKvIrO6q7F9nK7Kgf
 1kRif9D60x1h7prxG/hz4pn7rf2dTQglje4vSa+O8vi8ULMdz5AnGUsoXwlGsGacAAAA=
X-Change-ID: 20250106-eld-support-4a243e37981c
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17921;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=no8xuIuw4lwLg+yfpdXObOJnpSPglmLRpLuOQWOy13A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk8iJuwZPT0e+3qLfwZfMRVUKSHmp13q/okPls
 xFhN52DznWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5PIiQAKCRCLPIo+Aiko
 1dxuB/9YeH6eW3C0Tdmk3TZg7x82t35f4gyoCdJrXMDlwqMxv54DIHzAO1ip5HJpee7OwzctYUm
 pJBqYbEC6s/BzCCr0Ff3TQBOOwzudRS34qA00GhiDupn82zL3iPpDcf+u4XJ4vEiDUCS3n6OxXf
 p5Cto5MFu101SHjWQrjrezC5KpNjCpuBsxKcHOvxlwUoElU0oyBjqCOWqJEoa9mPMjwgjiFS4Mz
 /gTIn2PA27QO5uMMq1yKkOXd7OZl5+T9U9rWLr85nmLmSH3qYck9FFnb5pZJaH+/zOi97w2bNfH
 Ez1p+kdCJFCioblMI1+Beu1ZdD/hVUXgiCjyyzt0VFVsV4qy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

High Definition Audio spec defines a special data block, ELD, used to
provide audio-related information for the connected monitors. HDMI Codec
in Linux reuses ELD to provide data to userspace. Add support for
parsing ELD blobs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Mentioned HDA standard in the manual page (Hans)
- Described new option in the manual page (Hans)
- Described how to extract ELD on a running system (Hans)
- Dropped unused variable in parse_eld_baseline().
- Handle hex-encoded ELD and stdin as an argument.
- Link to v1: https://lore.kernel.org/r/20250106-eld-support-v1-1-5a6ae0d25cd2@linaro.org
---
 utils/edid-decode/edid-decode.1.in     |  25 ++++
 utils/edid-decode/edid-decode.cpp      | 237 ++++++++++++++++++++++++++++++++-
 utils/edid-decode/edid-decode.h        |   6 +
 utils/edid-decode/meson.build          |   1 +
 utils/edid-decode/parse-base-block.cpp |   2 +-
 utils/edid-decode/parse-cta-block.cpp  |   4 +-
 utils/edid-decode/parse-eld.cpp        |  97 ++++++++++++++
 7 files changed, 367 insertions(+), 5 deletions(-)

diff --git a/utils/edid-decode/edid-decode.1.in b/utils/edid-decode/edid-decode.1.in
index 04edf5ff3fed7e24fb4668f8870f6729fa7d8f15..1e4cd6ae1418a8ce5757bab13836f9ab7df520c9 100644
--- a/utils/edid-decode/edid-decode.1.in
+++ b/utils/edid-decode/edid-decode.1.in
@@ -161,6 +161,8 @@ CVT 1.2: VESA Coordinated Video Timings (CVT) Standard, Version 1.2
 CVT 1.2: VESA CVT v1.2 Errata E2
 .TP
 GTF 1.1: VESA Generalized Timing Formula Standard, Version: 1.1
+.TP
+HDA 1.0a: High Definition Audio Specification, Version 1.0a
 .RE
 
 .SH OPTIONS
@@ -215,6 +217,29 @@ HDMI Specification. Otherwise it is assumed to be a regular CTA-861 InfoFrame
 without a checksum.
 
 Note: this is still work-in-progress, specifically for the AVI and HDMI InfoFrames.
+.TP
+\fB\-E\fR, \fB\-\-eld\fR \fI<file>\fR
+Parse the given EDID-Like Data (ELD) file. This option can be used multiple
+times to parse multiple ELD files. Read data from stdin if '-' was passed as a
+filename.  If the EDID of the display to which these ELD files are generated is
+also given, then the conformity checks will take that EDID into account.
+
+On Linux systems ELD can be extracted via the amixer command (copy all hex after the 'values='):
+  $ amixer -c 0 controls | grep ELD
+  numid=6,iface=PCM,name='ELD',device=3
+  numid=12,iface=PCM,name='ELD',device=7
+  numid=18,iface=PCM,name='ELD',device=8
+  numid=24,iface=PCM,name='ELD',device=9
+  $ amixer -c 0 cget iface=PCM,name=ELD,device=3
+  numid=6,iface=PCM,name='ELD',device=3
+    ; type=BYTES,access=r--v----,values=95
+    : values=0x10,0x00,0x08,0x00,0x6d,0x10,0x00,0x01,0x00,0x02,0x00,0x00,0x00,0x00,
+    0x00,0x00,0x30,0xae,0xf1,0x61,0x4c,0x45,0x4e,0x20,0x54,0x33,0x32,0x68,0x2d,0x32,
+    0x30,0x0a,0x20,0x09,0x7f,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
+    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
+
 .TP
 \fB\-\-diagonal\fR \fI<inches>\fR
 Specify the diagonal of the display in inches. This will enable additional checks
diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
index 595eb28777da2f1589b0f9083436156aa12a6036..25d872a3958fd85f5c06371cbf9b17d6649bab84 100644
--- a/utils/edid-decode/edid-decode.cpp
+++ b/utils/edid-decode/edid-decode.cpp
@@ -43,6 +43,7 @@ enum Option {
 	OptI2CAdapter = 'a',
 	OptCheck = 'c',
 	OptCheckInline = 'C',
+	OptEld = 'E',
 	OptFBModeTimings = 'F',
 	OptHelp = 'h',
 	OptOnlyHexDump = 'H',
@@ -129,6 +130,7 @@ static struct option long_options[] = {
 	{ "list-rid-timings", required_argument, 0, OptListRIDTimings },
 	{ "list-rids", no_argument, 0, OptListRIDs },
 	{ "infoframe", required_argument, 0, OptInfoFrame },
+	{ "eld", required_argument, 0, OptEld },
 	{ 0, 0, 0, 0 }
 };
 
@@ -136,7 +138,8 @@ static void usage(void)
 {
 	printf("Usage: edid-decode <options> [in [out]]\n"
 	       "  [in]                  EDID file to parse. Read from standard input if none given\n"
-	       "                        and --infoframe was not used, or if the input filename is '-'.\n"
+	       "                        and neither --infoframe nor --eld was not used, or if the\n"
+	       "                        input filename is '-'.\n"
 	       "  [out]                 Output the read EDID to this file. Write to standard output\n"
 	       "                        if the output filename is '-'.\n"
 	       "\nOptions:\n"
@@ -225,6 +228,8 @@ static void usage(void)
 	       "  --list-rid-timings <rid> List all timings for RID <rid> or all known RIDs if <rid> is 0.\n"
 	       "  -I, --infoframe <file> Parse the InfoFrame from <file> that was sent to this display.\n"
 	       "                        This option can be specified multiple times for different InfoFrame files.\n"
+	       "  -E, --eld <file>      Parse the EDID-Like Data, ELD from <file> (or stdin if '-' was specified).\n"
+	       "                        This option can be specified multiple times for different ELD files.\n"
 	       "  -h, --help            Display this help message.\n");
 }
 #endif
@@ -1600,6 +1605,9 @@ int edid_state::parse_edid()
 static unsigned char infoframe[32];
 static unsigned if_size;
 
+static unsigned char eld[128];
+static unsigned eld_size;
+
 static bool if_add_byte(const char *s)
 {
 	char buf[3];
@@ -1724,6 +1732,212 @@ static void show_if_msgs(bool is_warn)
 	       s_msgs[0][is_warn].c_str());
 }
 
+static bool eld_add_byte(const char *s)
+{
+	char buf[3];
+
+	if (eld_size == sizeof(eld))
+		return false;
+	buf[0] = s[0];
+	buf[1] = s[1];
+	buf[2] = 0;
+	eld[eld_size++] = strtoul(buf, NULL, 16);
+	return true;
+}
+
+static bool extract_eld_hex(const char *s)
+{
+	for (; *s; s++) {
+		if (isspace(*s) || strchr(ignore_chars, *s))
+			continue;
+
+		if (*s == '0' && tolower(s[1]) == 'x') {
+			s++;
+			continue;
+		}
+
+		/* Read one or two hex digits from the log */
+		if (!isxdigit(s[0]))
+			break;
+
+		if (!isxdigit(s[1])) {
+			odd_hex_digits = true;
+			return false;
+		}
+		if (!eld_add_byte(s))
+			return false;
+		s++;
+	}
+	return eld_size;
+}
+
+static bool extract_eld(int fd)
+{
+	std::vector<char> eld_data;
+	char buf[128];
+
+	for (;;) {
+		ssize_t i = read(fd, buf, sizeof(buf));
+
+		if (i < 0)
+			return false;
+		if (i == 0)
+			break;
+		eld_data.insert(eld_data.end(), buf, buf + i);
+	}
+
+	if (eld_data.empty()) {
+		eld_size = 0;
+		return false;
+	}
+	// Ensure it is safely terminated by a 0 char
+	eld_data.push_back('\0');
+
+	const char *data = &eld_data[0];
+	const char *start;
+
+	/* Look for edid-decode output */
+	start = strstr(data, "edid-decode ELD (hex):");
+	if (start)
+		return extract_eld_hex(strchr(start, ':') + 1);
+
+	unsigned i;
+
+	/* Is the EDID provided in hex? */
+	for (i = 0; i < 32 && (isspace(data[i]) || strchr(ignore_chars, data[i]) ||
+			       tolower(data[i]) == 'x' || isxdigit(data[i])); i++);
+
+	if (i == 32)
+		return extract_eld_hex(data);
+
+	// Drop the extra '\0' byte since we now assume binary data
+	eld_data.pop_back();
+
+	eld_size = eld_data.size();
+
+	/* Assume binary */
+	if (eld_size > sizeof(eld)) {
+		fprintf(stderr, "Binary ELD length %u is greater than %zu.\n",
+			eld_size, sizeof(eld));
+		return false;
+	}
+	memcpy(eld, data, eld_size);
+	return true;
+}
+
+static int eld_from_file(const char *from_file)
+{
+#ifdef O_BINARY
+	// Windows compatibility
+	int flags = O_RDONLY | O_BINARY;
+#else
+	int flags = O_RDONLY;
+#endif
+	int fd;
+
+	memset(eld, 0, sizeof(eld));
+	eld_size = 0;
+
+	if (!strcmp(from_file, "-")) {
+		from_file = "stdin";
+		fd = 0;
+	} else if ((fd = open(from_file, flags)) == -1) {
+		perror(from_file);
+		return -1;
+	}
+
+	odd_hex_digits = false;
+	if (!extract_eld(fd)) {
+		if (!eld_size) {
+			fprintf(stderr, "ELD of '%s' was empty.\n", from_file);
+			return -1;
+		}
+		fprintf(stderr, "ELD extraction of '%s' failed: ", from_file);
+		if (odd_hex_digits)
+			fprintf(stderr, "odd number of hexadecimal digits.\n");
+		else
+			fprintf(stderr, "unknown format.\n");
+		return -1;
+	}
+	close(fd);
+
+	return 0;
+}
+
+static void show_eld_msgs(bool is_warn)
+{
+	printf("\n%s:\n\n", is_warn ? "Warnings" : "Failures");
+	if (s_msgs[0][is_warn].empty())
+		return;
+	printf("ELD:\n%s",
+	       s_msgs[0][is_warn].c_str());
+}
+
+int edid_state::parse_eld(const std::string &fname)
+{
+	int ret = eld_from_file(fname.c_str());
+	unsigned int min_size = 4;
+	unsigned baseline_size;
+	unsigned char ver;
+
+	if (ret)
+		return ret;
+
+	if (!options[OptSkipHexDump]) {
+		printf("edid-decode ELD (hex):\n\n");
+		hex_block("", eld, eld_size, false);
+		if (options[OptOnlyHexDump])
+			return 0;
+		printf("\n----------------\n\n");
+	}
+
+	if (eld_size < min_size) {
+		fail("ELD is too small to parse.\n");
+		return -1;
+	}
+
+	ver = eld[0] >> 3;
+	switch (ver) {
+	case 1:
+		warn("Obsolete Baseline ELD version (%d)\n", ver);
+		break;
+	case 2:
+		printf("Baseline ELD version: 861.D or below\n");
+		break;
+	default:
+		warn("Unsupported ELD version (%d)\n", ver);
+		break;
+	}
+
+	baseline_size = eld[2] * 4;
+	if (baseline_size > 80)
+		warn("ELD too big\n");
+
+	parse_eld_baseline(&eld[4], baseline_size);
+
+	if (!options[OptCheck] && !options[OptCheckInline])
+		return 0;
+
+	printf("\n----------------\n");
+
+	if (!options[OptSkipSHA] && strlen(STRING(SHA))) {
+		options[OptSkipSHA] = 1;
+		printf("\n");
+		print_version();
+	}
+
+	if (options[OptCheck]) {
+		if (warnings)
+			show_eld_msgs(true);
+		if (failures)
+			show_eld_msgs(false);
+	}
+
+	printf("\n%s conformity: %s\n",
+	       state.data_block.empty() ? "ELD" : state.data_block.c_str(),
+	       failures ? "FAIL" : "PASS");
+	return failures ? -2 : 0;
+}
 int edid_state::parse_if(const std::string &fname)
 {
 	int ret = if_from_file(fname.c_str());
@@ -2370,6 +2584,7 @@ int main(int argc, char **argv)
 	int adapter_fd = -1;
 	double hdcp_ri_sleep = 0;
 	std::vector<std::string> if_names;
+	std::vector<std::string> eld_names;
 	unsigned test_rel_duration = 0;
 	unsigned test_rel_msleep = 50;
 	unsigned idx = 0;
@@ -2514,6 +2729,9 @@ int main(int argc, char **argv)
 		case OptInfoFrame:
 			if_names.push_back(optarg);
 			break;
+		case OptEld:
+			eld_names.push_back(optarg);
+			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value.\n",
 				argv[optind]);
@@ -2573,7 +2791,7 @@ int main(int argc, char **argv)
 				ret = read_hdcp_ri(adapter_fd, hdcp_ri_sleep);
 			if (options[OptI2CTestReliability])
 				ret = test_reliability(adapter_fd, test_rel_duration, test_rel_msleep);
-		} else if (options[OptInfoFrame] && !options[OptGTF]) {
+		} else if ((options[OptInfoFrame] || options[OptEld]) && !options[OptGTF]) {
 			ret = 0;
 		} else {
 			ret = edid_from_file("-", stdout);
@@ -2636,6 +2854,21 @@ int main(int argc, char **argv)
 		if (r && !ret)
 			ret = r;
 	}
+
+	for (const auto &n : eld_names) {
+		if (show_line)
+			printf("\n================\n\n");
+		show_line = true;
+
+		state.warnings = state.failures = 0;
+		for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
+			s_msgs[i][0].clear();
+			s_msgs[i][1].clear();
+		}
+		int r = state.parse_eld(n);
+		if (r && !ret)
+			ret = r;
+	}
 	return ret;
 }
 
diff --git a/utils/edid-decode/edid-decode.h b/utils/edid-decode/edid-decode.h
index 0d71d544145ee6e55d1e50270c3317bb69c0fcf4..e64143deb79a7e58aba87c41a0d582e7bb236a2f 100644
--- a/utils/edid-decode/edid-decode.h
+++ b/utils/edid-decode/edid-decode.h
@@ -423,6 +423,7 @@ struct edid_state {
 	void check_base_block(const unsigned char *x);
 	void list_dmts();
 	void list_established_timings();
+	char *manufacturer_name(const unsigned char *x);
 
 	void data_block_oui(std::string block_name, const unsigned char *x, unsigned length, unsigned *ouinum,
 	                    bool ignorezeros = false, bool do_ascii = false, bool big_endian = false,
@@ -449,6 +450,8 @@ struct edid_state {
 	void cta_displayid_type_8(const unsigned char *x, unsigned length);
 	void cta_displayid_type_10(const unsigned char *x, unsigned length);
 	void cta_block(const unsigned char *x, std::vector<unsigned> &found_tags);
+	void cta_sadb(const unsigned char *x, unsigned length);
+	void cta_audio_block(const unsigned char *x, unsigned length);
 	void preparse_cta_block(unsigned char *x);
 	void parse_cta_block(const unsigned char *x);
 	void cta_resolve_svr(timings_ext &t_ext);
@@ -532,6 +535,9 @@ struct edid_state {
 	void parse_if_mpeg_source(const unsigned char *x, unsigned size);
 	void parse_if_ntsc_vbi(const unsigned char *x, unsigned size);
 	void parse_if_drm(const unsigned char *x, unsigned size);
+
+	int parse_eld(const std::string &fname);
+	void parse_eld_baseline(const unsigned char *x, unsigned size);
 };
 
 static inline void add_str(std::string &s, const std::string &add)
diff --git a/utils/edid-decode/meson.build b/utils/edid-decode/meson.build
index 807d4e873c05d944acbc4924a7e34bb30d97c3f0..d1ed5179413a4e464e6f3c946d714bbbdc0ea9e2 100644
--- a/utils/edid-decode/meson.build
+++ b/utils/edid-decode/meson.build
@@ -9,6 +9,7 @@ edid_decode_sources = [
 	'parse-ls-ext-block.cpp',
 	'parse-vtb-ext-block.cpp',
 	'parse-if.cpp',
+	'parse-eld.cpp',
 ]
 
 edid_decode_args = []
diff --git a/utils/edid-decode/parse-base-block.cpp b/utils/edid-decode/parse-base-block.cpp
index a2f0e7408ef8c87fd218a2dfcf5e2ee3eb55e3f6..0d7f7c212f65d7a81e5e771387e4e679b1e2e2f5 100644
--- a/utils/edid-decode/parse-base-block.cpp
+++ b/utils/edid-decode/parse-base-block.cpp
@@ -14,7 +14,7 @@
 
 #include "edid-decode.h"
 
-static char *manufacturer_name(const unsigned char *x)
+char *edid_state::manufacturer_name(const unsigned char *x)
 {
 	static char name[4];
 
diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
index 06bc07d30b0fb7a8ed73320e9cf91b9aca84cd73..ce47be7135272e8e81f3269f469e27c6c7b5e583 100644
--- a/utils/edid-decode/parse-cta-block.cpp
+++ b/utils/edid-decode/parse-cta-block.cpp
@@ -464,7 +464,7 @@ static std::string mpeg_h_3d_audio_level(unsigned char x)
 	return std::string("Unknown MPEG-H 3D Audio Level (") + utohex(x) + ")";
 }
 
-static void cta_audio_block(const unsigned char *x, unsigned length)
+void edid_state::cta_audio_block(const unsigned char *x, unsigned length)
 {
 	unsigned i, format, ext_format;
 
@@ -1824,7 +1824,7 @@ const char *cta_speaker_map[] = {
 	NULL
 };
 
-static void cta_sadb(const unsigned char *x, unsigned length)
+void edid_state::cta_sadb(const unsigned char *x, unsigned length)
 {
 	unsigned sad_deprecated = 0x7f000;
 	unsigned sad;
diff --git a/utils/edid-decode/parse-eld.cpp b/utils/edid-decode/parse-eld.cpp
new file mode 100644
index 0000000000000000000000000000000000000000..a569a278ef4f911b99de7ed2975dd038d40484a2
--- /dev/null
+++ b/utils/edid-decode/parse-eld.cpp
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Linaro Ltd. All rights reserved.
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+ */
+
+#include <stdio.h>
+
+#include "edid-decode.h"
+
+void edid_state::parse_eld_baseline(const unsigned char *x, unsigned size)
+{
+	unsigned mnl, sad_count, data;
+	unsigned char dummy_sadb[3] = {};
+	char *manufacturer;
+
+	printf("Baseline ELD:\n");
+
+	if (size < 16) {
+		fail("Baseline ELD too short (%d)\n", size);
+		return;
+	}
+
+	mnl = x[0] & 0x1f;
+
+	data = x[0] >> 5;
+	switch (data) {
+	case 0:
+		printf("  no CEA EDID Timing Extension present\n");
+		break;
+	case 1:
+		printf("  CEA EDID 861\n");
+		break;
+	case 2:
+		printf("  CEA EDID 861.A\n");
+		break;
+	case 3:
+		printf("  CEA EDID 861.B/C/D\n");
+		break;
+	default:
+		warn("Unsupported CEA EDID version (%d)\n", data);
+		break;
+	}
+
+	if (x[1] & 1)
+		printf("  HDCP Content Protection is supported\n");
+	if (x[1] & 2)
+		printf("  ACP / ISRC / ISRC2 packets are handled\n");
+
+	data = (x[1] >> 2) & 3;
+	switch (data) {
+	case 0:
+		printf("  HDMI connection\n");
+		break;
+	case 1:
+		printf("  DisplayPort connection\n");
+		break;
+	default:
+		warn("  Unrecognized connection type (%d)\n", data);
+	}
+
+	sad_count = x[1] >> 4;
+
+	if (x[2])
+		printf("  Audio latency: %d ms\n", x[2] * 2);
+	else
+		printf("  No Audio latency information\n");
+
+	printf("  Speaker Allocation:\n");
+	dummy_sadb[0] = x[3];
+	cta_sadb(dummy_sadb, sizeof(dummy_sadb));
+
+	printf("  Port ID:\n");
+	hex_block("    ", x + 0x4, 8);
+
+	manufacturer = manufacturer_name(x + 0x0c);
+	printf("  Manufacturer: %s\n", manufacturer);
+	printf("  Model: %u\n", (unsigned short)(x[0x0e] + (x[0x0f] << 8)));
+
+	if (0x10 + mnl >= size) {
+		fail("Manufacturer name overflow (MNL = %d)\n", mnl);
+		return;
+	}
+
+	printf("  Display Product Name: '%s'\n", extract_string(x + 0x10, mnl, true));
+
+	if (0x10 + mnl + (3 * sad_count) >= size) {
+		fail("Short Audio Descriptors overflow\n");
+		return;
+	}
+
+	if (sad_count != 0) {
+		printf("  Short Audio Descriptors:\n");
+		cta_audio_block(x + 0x10 + mnl, 3 * sad_count);
+	}
+}

---
base-commit: 8fb667bc4ec202529799cca28fff5b69d34cee19
change-id: 20250106-eld-support-4a243e37981c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



Return-Path: <linux-media+bounces-24267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7309A022A8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 351323A4DD8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 10:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EF81D9A56;
	Mon,  6 Jan 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QczbbSeW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4DC35951
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158145; cv=none; b=SqRpotbJIyBfM0ElZDhNHIGJmZZ1VohP3d5xAFv9E0qUqQFBLCQvYvR5ryrR2eZhFblUZIDFI/57RaEIZFdE7eH+VIpOfgkqljVUdALvajY95mG7snjOVy0e4dHAS61VfvmVFavVq92LXq3qfgqzXwJTIuE/My1qHlrbw4SH+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158145; c=relaxed/simple;
	bh=9dWUCjR8LdtkfXcr8VQhM3/6PxOykMNUoFjbnP5/2Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=efhtc2N324te+p1qXISw+oifz5iu4Nh6SAT9w9golpALdG7Fkh1nV0ilRgrO4ndVL1dYcWALV8X6KefUl0odgYAQ7Oo450rY4Rn1uAV028LdS46dHl2zsDx+w5n4bs4a3AtV/jPxEM0zGvxLFy2udTQtlW4yncB0lYFvoQbBXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QczbbSeW; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024ecc33dso318919e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736158141; x=1736762941; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apaMPshDhWZ3oX9gVKZYcAIKbn/Lg7/zvUG1lbKBe0g=;
        b=QczbbSeWZkgGVyatw8m+WL1kI9jKpMMDFWH85trSOslzrRXwe83Zid5OPn0f/lya+E
         dxxlsVLCtysfmrU7oS2E/lBcc3bJkHy8UZ2zEKZtVkApRAvW+fHlp6y7nnW1WeVXBYv6
         sou1bEm6jBCP7mXxB7bcx7xLkRpsAvm7LiKEZUBK5cFYqkJeJaCtlGfkSxDvwyP8PThc
         j6FurQxvlEcqmdkF8HDEsfmA/ftNbkTYbCKOgwLoLBcNaa65Kh0esxCZUBrON4Q/YsAJ
         cqRrOJDkhn1+GKr9GtPtJVGOcYWg1TTBKJMoIkJL9ZzWhq9k/Zr2npSJGmmuDFM1cvyU
         X+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158141; x=1736762941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apaMPshDhWZ3oX9gVKZYcAIKbn/Lg7/zvUG1lbKBe0g=;
        b=cS2w4eKMpPtuL/b3t/RF8ky2AA6Cc24xRW9hsCPeIpwSXEN+mas84zIK4EJHO0okTG
         EGv2rUKpkcbnEUHFscw+to5DHZmTjcIrWPCEG7DVOcsrMFcg86eQlV3HMESFxBERTEoN
         tM1DpLSQHUuuTNcOCM5b1UpbWYlS+1rxEumrX7t4Vgog3cNvQxFNu/w0Ei5od3JB0b7E
         ImYeEkXzrxTCEpEO+UBNj/Gw8eFXv7eeLNAhSZXN2WWPyoiax7umj0n+zUgzWAhiZYvh
         ruBX2e2K1iEyUGpK3vdHci/SPI8Re3ZV1dWRc2sUjqOlwnfE34CswYGJQcb1Z7H2lH8F
         xLfg==
X-Gm-Message-State: AOJu0YxqcJI8qMOTlOzECTPHy6+4Gmm47y4aydy3KRMBFDRdXd+YZPJ3
	Zji3+0626n/bKJR/CpEiXg/trzbLPZa2IG+dE7c27wNdwOxPlBDWiY3qafe2zzQDt89blXc2sWu
	uUWg=
X-Gm-Gg: ASbGnctg0rhYlNkibO4voWtx5IajIO8td88d8+YaFFD7xPkyQAZ0+BIPG7aiO9uRw/7
	GJXjNwxLX8JDQ+oELhRfiSqheWO8gD8gAUVpY/bXdprajEI3cxpcGw+4+osJrzwW/VdPSQ6eOpf
	bHx5ubxBICwMacrhRMVBwPJXw5S0EsBL8OPWcQyAVbCtLe/kMa2njj7RVu+GXYURsyniJ/4r2jN
	yLcgbCmgPPcMmF/hMAncEQnc8W5zGC/sP15TQB9wpzgiNMBTB+8gCGSzkxqN2uKZZuJVv07Mqf/
	rc9lN6jMePYpeHSKB5pu963+3dUi05o5csdaLZYhrxzM+ow6fofN/iM=
X-Google-Smtp-Source: AGHT+IHaAcBY0nfd+gulPNULyfZHXu2RXVJ9VWThHtjrAuhWIJwxQoe6Vpdc3uZPMBNg8Fb7IrNuUw==
X-Received: by 2002:a05:6512:3e16:b0:541:1c48:8c0d with SMTP id 2adb3069b0e04-5422959768fmr20085297e87.49.1736158141112;
        Mon, 06 Jan 2025 02:09:01 -0800 (PST)
Received: from rohan.lan (2001-14bb-c8-f82d-a883-af83-5ed4-8d25.rev.dnainternet.fi. [2001:14bb:c8:f82d:a883:af83:5ed4:8d25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422383200dsm4939621e87.256.2025.01.06.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:08:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 12:08:56 +0200
Subject: [PATCH] edid-decode: support parsing EDID-Like Data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-eld-support-v1-1-5a6ae0d25cd2@linaro.org>
X-B4-Tracking: v=1; b=H4sIALere2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwMz3dScFN3i0oKC/KISXZNEIxPjVGNzSwvDZCWgjoKi1LTMCrBp0bG
 1tQCBAjn+XQAAAA==
X-Change-ID: 20250106-eld-support-4a243e37981c
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14160;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9dWUCjR8LdtkfXcr8VQhM3/6PxOykMNUoFjbnP5/2Y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne6u6zjOWRoI3aHUZDTNSsFFzuW9G9UMGrTSnJ
 Fs8sct8lUuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3urugAKCRCLPIo+Aiko
 1cCqCACzOghHeKToIDLIjAkna/YFYidrXs6T/nr90jVQi2frcutrduLSS/ER1lazmeNzyDph5o4
 4JbWNeUOZzDEcGou2ilnmwTNdcPtbZU2/qbm05ozySF+O0qLt9ywLfyODdmQ1gjsNJVR+vTWliO
 TBvLlvuT/6p373TqahY8pP2yyj9j69WHoV0uh/J2wodRBFuijulCxKtpOevJnZ7gThanNPE5I7h
 UYyW9SBysvTzB7yWJYOgJDW3Yu7wnkPJyqGHccTVOsMLePQIP81QGi9C/WvsJAqW0gYqznEJysG
 WP7kuwfe39NQxw2O1KCnrcOdvUqFWPyTe4w/j5jlIybhUF8r
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

High Definition Audio spec defines a special data block, ELD, used to
provide audio-related information for the connected monitors. HDMI Codec
in Linux reuses ELD to provide data to userspace. Add support for
parsing ELD blobs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 utils/edid-decode/edid-decode.cpp      | 218 ++++++++++++++++++++++++++++++++-
 utils/edid-decode/edid-decode.h        |   6 +
 utils/edid-decode/meson.build          |   1 +
 utils/edid-decode/parse-base-block.cpp |   2 +-
 utils/edid-decode/parse-cta-block.cpp  |   4 +-
 utils/edid-decode/parse-eld.cpp        |  97 +++++++++++++++
 6 files changed, 323 insertions(+), 5 deletions(-)

diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
index 595eb28777da2f1589b0f9083436156aa12a6036..e1cee92650e1b447bff5c58e5700cfe9cec2452e 100644
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
@@ -1600,6 +1603,9 @@ int edid_state::parse_edid()
 static unsigned char infoframe[32];
 static unsigned if_size;
 
+static unsigned char eld[128];
+static unsigned eld_size;
+
 static bool if_add_byte(const char *s)
 {
 	char buf[3];
@@ -1724,6 +1730,195 @@ static void show_if_msgs(bool is_warn)
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
+		if (isspace(*s))
+			continue;
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
+	if ((fd = open(from_file, flags)) == -1) {
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
@@ -2370,6 +2565,7 @@ int main(int argc, char **argv)
 	int adapter_fd = -1;
 	double hdcp_ri_sleep = 0;
 	std::vector<std::string> if_names;
+	std::vector<std::string> eld_names;
 	unsigned test_rel_duration = 0;
 	unsigned test_rel_msleep = 50;
 	unsigned idx = 0;
@@ -2514,6 +2710,9 @@ int main(int argc, char **argv)
 		case OptInfoFrame:
 			if_names.push_back(optarg);
 			break;
+		case OptEld:
+			eld_names.push_back(optarg);
+			break;
 		case ':':
 			fprintf(stderr, "Option '%s' requires a value.\n",
 				argv[optind]);
@@ -2573,7 +2772,7 @@ int main(int argc, char **argv)
 				ret = read_hdcp_ri(adapter_fd, hdcp_ri_sleep);
 			if (options[OptI2CTestReliability])
 				ret = test_reliability(adapter_fd, test_rel_duration, test_rel_msleep);
-		} else if (options[OptInfoFrame] && !options[OptGTF]) {
+		} else if ((options[OptInfoFrame] || options[OptEld]) && !options[OptGTF]) {
 			ret = 0;
 		} else {
 			ret = edid_from_file("-", stdout);
@@ -2636,6 +2835,21 @@ int main(int argc, char **argv)
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
index c2ddd95837954b390adf3dbf66cc3e0b7c04087e..f7b10841b314c558685ed8ea19c0d87754bb9e4a 100644
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
index 0000000000000000000000000000000000000000..ba6275813ae56b6671af222b30f436d8998ba9ff
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
+	unsigned mnl, sad_count, data, i;
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
base-commit: f6270b7ce87eed140234db1119890cb90b781ed7
change-id: 20250106-eld-support-4a243e37981c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



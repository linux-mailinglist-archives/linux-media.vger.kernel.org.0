Return-Path: <linux-media+bounces-24269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06595A022C8
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 11:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6140018846CD
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 10:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A70159596;
	Mon,  6 Jan 2025 10:19:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D70E199391
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736158793; cv=none; b=XTf4n2bKOQUUAUq1PHvlQ1RWOGQlZjCE7iqt9vcqw1w00JrbR8xEwRM+QiDwOfGbRNfa5NPqufltWXj1kSK2R5xx9JoRbnuNuGNDma60sG3MifKMrq80Lc7oNesm2pTfVoAycugF5SOIRN/IBXmftFIeO9Hd+NAyTNenaPkHvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736158793; c=relaxed/simple;
	bh=FlQKUnbGtmRQSjtWabfGPsgiWhez0QU0t7Q4XIHAay4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGAyMl6zeLYBVnRlWUC8webWib26vFzgKrEqKi0E43ns3NSkZJL67sGTbz7htcH6AHDPuAlZxna9MCusoBggQoyZLzaoan5eeNVTWnDc+d17Oc7U89n7LzrSfeHXHVadeyqECQC35o27fnsWXmtt1hamBfz+m0GyM+NbbnFeoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59285C4CED2;
	Mon,  6 Jan 2025 10:19:52 +0000 (UTC)
Message-ID: <7020c0d4-43a0-421c-b6c0-d9615b53487e@xs4all.nl>
Date: Mon, 6 Jan 2025 11:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] edid-decode: support parsing EDID-Like Data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-media@vger.kernel.org
References: <20250106-eld-support-v1-1-5a6ae0d25cd2@linaro.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250106-eld-support-v1-1-5a6ae0d25cd2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

The patch looks good, but you also need to update edid-decode.1.in with the new option.

Also add an entry for the High Definition Audio spec to the STANDARD section
in that manpage.

Is this a freely available spec? If so, do you have a link? I found this:

https://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/high-definition-audio-specification.pdf

But it's from 2010, so I don't know if there is a newer version, or if there are errata/updates on top.

If the ELD data is exported to userspace, how is that done? Somewhere in /sys?
It is nice if that is also documented in the manpage.

Regards,

	Hans

On 06/01/2025 11:08, Dmitry Baryshkov wrote:
> High Definition Audio spec defines a special data block, ELD, used to
> provide audio-related information for the connected monitors. HDMI Codec
> in Linux reuses ELD to provide data to userspace. Add support for
> parsing ELD blobs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  utils/edid-decode/edid-decode.cpp      | 218 ++++++++++++++++++++++++++++++++-
>  utils/edid-decode/edid-decode.h        |   6 +
>  utils/edid-decode/meson.build          |   1 +
>  utils/edid-decode/parse-base-block.cpp |   2 +-
>  utils/edid-decode/parse-cta-block.cpp  |   4 +-
>  utils/edid-decode/parse-eld.cpp        |  97 +++++++++++++++
>  6 files changed, 323 insertions(+), 5 deletions(-)
> 
> diff --git a/utils/edid-decode/edid-decode.cpp b/utils/edid-decode/edid-decode.cpp
> index 595eb28777da2f1589b0f9083436156aa12a6036..e1cee92650e1b447bff5c58e5700cfe9cec2452e 100644
> --- a/utils/edid-decode/edid-decode.cpp
> +++ b/utils/edid-decode/edid-decode.cpp
> @@ -43,6 +43,7 @@ enum Option {
>  	OptI2CAdapter = 'a',
>  	OptCheck = 'c',
>  	OptCheckInline = 'C',
> +	OptEld = 'E',
>  	OptFBModeTimings = 'F',
>  	OptHelp = 'h',
>  	OptOnlyHexDump = 'H',
> @@ -129,6 +130,7 @@ static struct option long_options[] = {
>  	{ "list-rid-timings", required_argument, 0, OptListRIDTimings },
>  	{ "list-rids", no_argument, 0, OptListRIDs },
>  	{ "infoframe", required_argument, 0, OptInfoFrame },
> +	{ "eld", required_argument, 0, OptEld },
>  	{ 0, 0, 0, 0 }
>  };
>  
> @@ -136,7 +138,8 @@ static void usage(void)
>  {
>  	printf("Usage: edid-decode <options> [in [out]]\n"
>  	       "  [in]                  EDID file to parse. Read from standard input if none given\n"
> -	       "                        and --infoframe was not used, or if the input filename is '-'.\n"
> +	       "                        and neither --infoframe nor --eld was not used, or if the\n"
> +	       "                        input filename is '-'.\n"
>  	       "  [out]                 Output the read EDID to this file. Write to standard output\n"
>  	       "                        if the output filename is '-'.\n"
>  	       "\nOptions:\n"
> @@ -1600,6 +1603,9 @@ int edid_state::parse_edid()
>  static unsigned char infoframe[32];
>  static unsigned if_size;
>  
> +static unsigned char eld[128];
> +static unsigned eld_size;
> +
>  static bool if_add_byte(const char *s)
>  {
>  	char buf[3];
> @@ -1724,6 +1730,195 @@ static void show_if_msgs(bool is_warn)
>  	       s_msgs[0][is_warn].c_str());
>  }
>  
> +static bool eld_add_byte(const char *s)
> +{
> +	char buf[3];
> +
> +	if (eld_size == sizeof(eld))
> +		return false;
> +	buf[0] = s[0];
> +	buf[1] = s[1];
> +	buf[2] = 0;
> +	eld[eld_size++] = strtoul(buf, NULL, 16);
> +	return true;
> +}
> +
> +static bool extract_eld_hex(const char *s)
> +{
> +	for (; *s; s++) {
> +		if (isspace(*s))
> +			continue;
> +
> +		/* Read one or two hex digits from the log */
> +		if (!isxdigit(s[0]))
> +			break;
> +
> +		if (!isxdigit(s[1])) {
> +			odd_hex_digits = true;
> +			return false;
> +		}
> +		if (!eld_add_byte(s))
> +			return false;
> +		s++;
> +	}
> +	return eld_size;
> +}
> +
> +static bool extract_eld(int fd)
> +{
> +	std::vector<char> eld_data;
> +	char buf[128];
> +
> +	for (;;) {
> +		ssize_t i = read(fd, buf, sizeof(buf));
> +
> +		if (i < 0)
> +			return false;
> +		if (i == 0)
> +			break;
> +		eld_data.insert(eld_data.end(), buf, buf + i);
> +	}
> +
> +	if (eld_data.empty()) {
> +		eld_size = 0;
> +		return false;
> +	}
> +	// Ensure it is safely terminated by a 0 char
> +	eld_data.push_back('\0');
> +
> +	const char *data = &eld_data[0];
> +	const char *start;
> +
> +	/* Look for edid-decode output */
> +	start = strstr(data, "edid-decode ELD (hex):");
> +	if (start)
> +		return extract_eld_hex(strchr(start, ':') + 1);
> +
> +	// Drop the extra '\0' byte since we now assume binary data
> +	eld_data.pop_back();
> +
> +	eld_size = eld_data.size();
> +
> +	/* Assume binary */
> +	if (eld_size > sizeof(eld)) {
> +		fprintf(stderr, "Binary ELD length %u is greater than %zu.\n",
> +			eld_size, sizeof(eld));
> +		return false;
> +	}
> +	memcpy(eld, data, eld_size);
> +	return true;
> +}
> +
> +static int eld_from_file(const char *from_file)
> +{
> +#ifdef O_BINARY
> +	// Windows compatibility
> +	int flags = O_RDONLY | O_BINARY;
> +#else
> +	int flags = O_RDONLY;
> +#endif
> +	int fd;
> +
> +	memset(eld, 0, sizeof(eld));
> +	eld_size = 0;
> +
> +	if ((fd = open(from_file, flags)) == -1) {
> +		perror(from_file);
> +		return -1;
> +	}
> +
> +	odd_hex_digits = false;
> +	if (!extract_eld(fd)) {
> +		if (!eld_size) {
> +			fprintf(stderr, "ELD of '%s' was empty.\n", from_file);
> +			return -1;
> +		}
> +		fprintf(stderr, "ELD extraction of '%s' failed: ", from_file);
> +		if (odd_hex_digits)
> +			fprintf(stderr, "odd number of hexadecimal digits.\n");
> +		else
> +			fprintf(stderr, "unknown format.\n");
> +		return -1;
> +	}
> +	close(fd);
> +
> +	return 0;
> +}
> +
> +static void show_eld_msgs(bool is_warn)
> +{
> +	printf("\n%s:\n\n", is_warn ? "Warnings" : "Failures");
> +	if (s_msgs[0][is_warn].empty())
> +		return;
> +	printf("ELD:\n%s",
> +	       s_msgs[0][is_warn].c_str());
> +}
> +
> +int edid_state::parse_eld(const std::string &fname)
> +{
> +	int ret = eld_from_file(fname.c_str());
> +	unsigned int min_size = 4;
> +	unsigned baseline_size;
> +	unsigned char ver;
> +
> +	if (ret)
> +		return ret;
> +
> +	if (!options[OptSkipHexDump]) {
> +		printf("edid-decode ELD (hex):\n\n");
> +		hex_block("", eld, eld_size, false);
> +		if (options[OptOnlyHexDump])
> +			return 0;
> +		printf("\n----------------\n\n");
> +	}
> +
> +	if (eld_size < min_size) {
> +		fail("ELD is too small to parse.\n");
> +		return -1;
> +	}
> +
> +	ver = eld[0] >> 3;
> +	switch (ver) {
> +	case 1:
> +		warn("Obsolete Baseline ELD version (%d)\n", ver);
> +		break;
> +	case 2:
> +		printf("Baseline ELD version: 861.D or below\n");
> +		break;
> +	default:
> +		warn("Unsupported ELD version (%d)\n", ver);
> +		break;
> +	}
> +
> +	baseline_size = eld[2] * 4;
> +	if (baseline_size > 80)
> +		warn("ELD too big\n");
> +
> +	parse_eld_baseline(&eld[4], baseline_size);
> +
> +	if (!options[OptCheck] && !options[OptCheckInline])
> +		return 0;
> +
> +	printf("\n----------------\n");
> +
> +	if (!options[OptSkipSHA] && strlen(STRING(SHA))) {
> +		options[OptSkipSHA] = 1;
> +		printf("\n");
> +		print_version();
> +	}
> +
> +	if (options[OptCheck]) {
> +		if (warnings)
> +			show_eld_msgs(true);
> +		if (failures)
> +			show_eld_msgs(false);
> +	}
> +
> +	printf("\n%s conformity: %s\n",
> +	       state.data_block.empty() ? "ELD" : state.data_block.c_str(),
> +	       failures ? "FAIL" : "PASS");
> +	return failures ? -2 : 0;
> +}
>  int edid_state::parse_if(const std::string &fname)
>  {
>  	int ret = if_from_file(fname.c_str());
> @@ -2370,6 +2565,7 @@ int main(int argc, char **argv)
>  	int adapter_fd = -1;
>  	double hdcp_ri_sleep = 0;
>  	std::vector<std::string> if_names;
> +	std::vector<std::string> eld_names;
>  	unsigned test_rel_duration = 0;
>  	unsigned test_rel_msleep = 50;
>  	unsigned idx = 0;
> @@ -2514,6 +2710,9 @@ int main(int argc, char **argv)
>  		case OptInfoFrame:
>  			if_names.push_back(optarg);
>  			break;
> +		case OptEld:
> +			eld_names.push_back(optarg);
> +			break;
>  		case ':':
>  			fprintf(stderr, "Option '%s' requires a value.\n",
>  				argv[optind]);
> @@ -2573,7 +2772,7 @@ int main(int argc, char **argv)
>  				ret = read_hdcp_ri(adapter_fd, hdcp_ri_sleep);
>  			if (options[OptI2CTestReliability])
>  				ret = test_reliability(adapter_fd, test_rel_duration, test_rel_msleep);
> -		} else if (options[OptInfoFrame] && !options[OptGTF]) {
> +		} else if ((options[OptInfoFrame] || options[OptEld]) && !options[OptGTF]) {
>  			ret = 0;
>  		} else {
>  			ret = edid_from_file("-", stdout);
> @@ -2636,6 +2835,21 @@ int main(int argc, char **argv)
>  		if (r && !ret)
>  			ret = r;
>  	}
> +
> +	for (const auto &n : eld_names) {
> +		if (show_line)
> +			printf("\n================\n\n");
> +		show_line = true;
> +
> +		state.warnings = state.failures = 0;
> +		for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
> +			s_msgs[i][0].clear();
> +			s_msgs[i][1].clear();
> +		}
> +		int r = state.parse_eld(n);
> +		if (r && !ret)
> +			ret = r;
> +	}
>  	return ret;
>  }
>  
> diff --git a/utils/edid-decode/edid-decode.h b/utils/edid-decode/edid-decode.h
> index 0d71d544145ee6e55d1e50270c3317bb69c0fcf4..e64143deb79a7e58aba87c41a0d582e7bb236a2f 100644
> --- a/utils/edid-decode/edid-decode.h
> +++ b/utils/edid-decode/edid-decode.h
> @@ -423,6 +423,7 @@ struct edid_state {
>  	void check_base_block(const unsigned char *x);
>  	void list_dmts();
>  	void list_established_timings();
> +	char *manufacturer_name(const unsigned char *x);
>  
>  	void data_block_oui(std::string block_name, const unsigned char *x, unsigned length, unsigned *ouinum,
>  	                    bool ignorezeros = false, bool do_ascii = false, bool big_endian = false,
> @@ -449,6 +450,8 @@ struct edid_state {
>  	void cta_displayid_type_8(const unsigned char *x, unsigned length);
>  	void cta_displayid_type_10(const unsigned char *x, unsigned length);
>  	void cta_block(const unsigned char *x, std::vector<unsigned> &found_tags);
> +	void cta_sadb(const unsigned char *x, unsigned length);
> +	void cta_audio_block(const unsigned char *x, unsigned length);
>  	void preparse_cta_block(unsigned char *x);
>  	void parse_cta_block(const unsigned char *x);
>  	void cta_resolve_svr(timings_ext &t_ext);
> @@ -532,6 +535,9 @@ struct edid_state {
>  	void parse_if_mpeg_source(const unsigned char *x, unsigned size);
>  	void parse_if_ntsc_vbi(const unsigned char *x, unsigned size);
>  	void parse_if_drm(const unsigned char *x, unsigned size);
> +
> +	int parse_eld(const std::string &fname);
> +	void parse_eld_baseline(const unsigned char *x, unsigned size);
>  };
>  
>  static inline void add_str(std::string &s, const std::string &add)
> diff --git a/utils/edid-decode/meson.build b/utils/edid-decode/meson.build
> index c2ddd95837954b390adf3dbf66cc3e0b7c04087e..f7b10841b314c558685ed8ea19c0d87754bb9e4a 100644
> --- a/utils/edid-decode/meson.build
> +++ b/utils/edid-decode/meson.build
> @@ -9,6 +9,7 @@ edid_decode_sources = [
>  	'parse-ls-ext-block.cpp',
>  	'parse-vtb-ext-block.cpp',
>  	'parse-if.cpp',
> +	'parse-eld.cpp',
>  ]
>  
>  edid_decode_args = []
> diff --git a/utils/edid-decode/parse-base-block.cpp b/utils/edid-decode/parse-base-block.cpp
> index a2f0e7408ef8c87fd218a2dfcf5e2ee3eb55e3f6..0d7f7c212f65d7a81e5e771387e4e679b1e2e2f5 100644
> --- a/utils/edid-decode/parse-base-block.cpp
> +++ b/utils/edid-decode/parse-base-block.cpp
> @@ -14,7 +14,7 @@
>  
>  #include "edid-decode.h"
>  
> -static char *manufacturer_name(const unsigned char *x)
> +char *edid_state::manufacturer_name(const unsigned char *x)
>  {
>  	static char name[4];
>  
> diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
> index 06bc07d30b0fb7a8ed73320e9cf91b9aca84cd73..ce47be7135272e8e81f3269f469e27c6c7b5e583 100644
> --- a/utils/edid-decode/parse-cta-block.cpp
> +++ b/utils/edid-decode/parse-cta-block.cpp
> @@ -464,7 +464,7 @@ static std::string mpeg_h_3d_audio_level(unsigned char x)
>  	return std::string("Unknown MPEG-H 3D Audio Level (") + utohex(x) + ")";
>  }
>  
> -static void cta_audio_block(const unsigned char *x, unsigned length)
> +void edid_state::cta_audio_block(const unsigned char *x, unsigned length)
>  {
>  	unsigned i, format, ext_format;
>  
> @@ -1824,7 +1824,7 @@ const char *cta_speaker_map[] = {
>  	NULL
>  };
>  
> -static void cta_sadb(const unsigned char *x, unsigned length)
> +void edid_state::cta_sadb(const unsigned char *x, unsigned length)
>  {
>  	unsigned sad_deprecated = 0x7f000;
>  	unsigned sad;
> diff --git a/utils/edid-decode/parse-eld.cpp b/utils/edid-decode/parse-eld.cpp
> new file mode 100644
> index 0000000000000000000000000000000000000000..ba6275813ae56b6671af222b30f436d8998ba9ff
> --- /dev/null
> +++ b/utils/edid-decode/parse-eld.cpp
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Linaro Ltd. All rights reserved.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +
> +#include <stdio.h>
> +
> +#include "edid-decode.h"
> +
> +void edid_state::parse_eld_baseline(const unsigned char *x, unsigned size)
> +{
> +	unsigned mnl, sad_count, data, i;
> +	unsigned char dummy_sadb[3] = {};
> +	char *manufacturer;
> +
> +	printf("Baseline ELD:\n");
> +
> +	if (size < 16) {
> +		fail("Baseline ELD too short (%d)\n", size);
> +		return;
> +	}
> +
> +	mnl = x[0] & 0x1f;
> +
> +	data = x[0] >> 5;
> +	switch (data) {
> +	case 0:
> +		printf("  no CEA EDID Timing Extension present\n");
> +		break;
> +	case 1:
> +		printf("  CEA EDID 861\n");
> +		break;
> +	case 2:
> +		printf("  CEA EDID 861.A\n");
> +		break;
> +	case 3:
> +		printf("  CEA EDID 861.B/C/D\n");
> +		break;
> +	default:
> +		warn("Unsupported CEA EDID version (%d)\n", data);
> +		break;
> +	}
> +
> +	if (x[1] & 1)
> +		printf("  HDCP Content Protection is supported\n");
> +	if (x[1] & 2)
> +		printf("  ACP / ISRC / ISRC2 packets are handled\n");
> +
> +	data = (x[1] >> 2) & 3;
> +	switch (data) {
> +	case 0:
> +		printf("  HDMI connection\n");
> +		break;
> +	case 1:
> +		printf("  DisplayPort connection\n");
> +		break;
> +	default:
> +		warn("  Unrecognized connection type (%d)\n", data);
> +	}
> +
> +	sad_count = x[1] >> 4;
> +
> +	if (x[2])
> +		printf("  Audio latency: %d ms\n", x[2] * 2);
> +	else
> +		printf("  No Audio latency information\n");
> +
> +	printf("  Speaker Allocation:\n");
> +	dummy_sadb[0] = x[3];
> +	cta_sadb(dummy_sadb, sizeof(dummy_sadb));
> +
> +	printf("  Port ID:\n");
> +	hex_block("    ", x + 0x4, 8);
> +
> +	manufacturer = manufacturer_name(x + 0x0c);
> +	printf("  Manufacturer: %s\n", manufacturer);
> +	printf("  Model: %u\n", (unsigned short)(x[0x0e] + (x[0x0f] << 8)));
> +
> +	if (0x10 + mnl >= size) {
> +		fail("Manufacturer name overflow (MNL = %d)\n", mnl);
> +		return;
> +	}
> +
> +	printf("  Display Product Name: '%s'\n", extract_string(x + 0x10, mnl, true));
> +
> +	if (0x10 + mnl + (3 * sad_count) >= size) {
> +		fail("Short Audio Descriptors overflow\n");
> +		return;
> +	}
> +
> +	if (sad_count != 0) {
> +		printf("  Short Audio Descriptors:\n");
> +		cta_audio_block(x + 0x10 + mnl, 3 * sad_count);
> +	}
> +}
> 
> ---
> base-commit: f6270b7ce87eed140234db1119890cb90b781ed7
> change-id: 20250106-eld-support-4a243e37981c
> 
> Best regards,



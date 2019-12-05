Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F4A113E47
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbfLEJiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:38:46 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54509 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728707AbfLEJiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 04:38:16 -0500
Received: from [192.168.2.10] ([31.45.23.139])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cnaLiM9gFuT63cnaOibFqM; Thu, 05 Dec 2019 10:38:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575538692; bh=YBT47Dqgig2BvKx3JoooYQmsA0n6Kk7dX0EuD06elqk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QBVVuM1oYisby26dqi+r5FSe8a5QCfTekTxjNq5zslTMRXbnQBVk8B3D7oQV9UaBo
         zk0E5WYQaV4Jc850J+6ene+qXLYG5F9kxaV9r6SBD22EsDBaGmeXk+feyjLvL8R9+1
         zUSRrN89rv/5dmX0FPlHVRrKbipQomsVv+i1tyfYPlHrSxK+8ze9MRy0e36OhHcj04
         Dgb9YDnqVlBCI5EUFMo2Ol1RKpAKowwDFpMNYEeC0TDz1rM3yTQVBJ4D1fdEH6b+Va
         aj6WKzv5bYs8eCwcIPXefLkWGBcM+HOovxdZqOkG/EEAbiuYPsoRQiW/RygV6fk7wr
         JerA/MaCUcMbA==
Subject: Re: [PATCH 4/5] edid-decode: CTA extension block cleanup
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20191205073414.53672-1-joevt@shaw.ca>
 <20191205073414.53672-4-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <80287d44-f6ec-0200-5b8a-a2a9ee790510@xs4all.nl>
Date:   Thu, 5 Dec 2019 10:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205073414.53672-4-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDcqSCCpw408HjiCV6h6GiUwrAvFcNHzXh8fSQUD/CGoWr51+N820m7y1zkx02PPCG3nrt+gavDnRVrfLdv92nUJ4062le0Y70jD/IpFRK/WTpXsd1fC
 qL28UcfgxSFXthUcMMDuWEtwbtGG3Ft8JUeqYCXCs0hrHhUD0PahqG8n1JVFRMicCod8b5cAEVe4aOOElsnKHnP2HtByMUrnqds=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

I've committed the other patches, but I'm not sure about this one. I'll look at
it again when I have more time. I might make my own implementation based on
ideas of this patch.

BTW, I made a real mess with the back/front porch timings. Thanks for fixing that!

Regards,

	Hans

On 12/5/19 8:34 AM, joevt wrote:
> Reduced tag parsing code.
> Added OUI min block length checks.
> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  edid-decode.h       |   1 +
>  parse-cta-block.cpp | 336 ++++++++++++++++++--------------------------
>  2 files changed, 138 insertions(+), 199 deletions(-)
> 
> diff --git a/edid-decode.h b/edid-decode.h
> index 83ded83..758bdcf 100644
> --- a/edid-decode.h
> +++ b/edid-decode.h
> @@ -111,6 +111,7 @@ struct edid_state {
>  	void cta_y420cmdb(const unsigned char *x, unsigned length);
>  	void cta_vfpdb(const unsigned char *x, unsigned length);
>  	void cta_hdmi_block(const unsigned char *x, unsigned length);
> +	void cta_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum);
>  	void cta_block(const unsigned char *x);
>  	void preparse_cta_block(const unsigned char *x);
>  	void parse_cta_block(const unsigned char *x);
> diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
> index dea87c1..e52822a 100644
> --- a/parse-cta-block.cpp
> +++ b/parse-cta-block.cpp
> @@ -375,6 +375,11 @@ void edid_state::cta_svd(const unsigned char *x, unsigned n, int for_ycbcr420)
>  
>  		if (vic == 1 && !for_ycbcr420)
>  			has_cta861_vic_1 = 1;
> +
> +		// vics and has_vic are basically the same (if has_vic was not bool), except vics
> +		// is built after preparse (during parse) which allows errors for duplicates to be
> +		// output in parse order. has_vic is built during preparse and is used when vics
> +		// from other blocks need to be checked.
>  		if (++vics[vic][for_ycbcr420] == 2)
>  			fail("Duplicate %sVIC %u\n", for_ycbcr420 ? "YCbCr 4:2:0 " : "", vic);
>  		if (for_ycbcr420 && has_vic[0][vic])
> @@ -485,7 +490,6 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
>  {
>  	unsigned len_vic, len_3d;
>  
> -	printf(" (HDMI)\n");
>  	printf("    Source physical address %u.%u.%u.%u\n", x[3] >> 4, x[3] & 0x0f,
>  	       x[4] >> 4, x[4] & 0x0f);
>  
> @@ -1228,10 +1232,20 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
>  		x += 4;
>  	}
>  }
> +const unsigned kOUI_Unknown   = 1<<12;
> +const unsigned kOUI_HDMI      = 2<<12;
> +const unsigned kOUI_HDMIForum = 3<<12;
> +const unsigned kOUI_HDR10     = 4<<12;
>  
> -static const char *oui_name(unsigned oui)
> +static const char *oui_name(unsigned oui, unsigned *ouinum = NULL)
>  {
> +	unsigned ouinumscratch;
> +	if (!ouinum) ouinum = &ouinumscratch;
> +	*ouinum = kOUI_Unknown;
>  	switch (oui) {
> +	case 0x000c03: *ouinum = kOUI_HDMI      ; return "HDMI";
> +	case 0xc45dd8: *ouinum = kOUI_HDMIForum ; return "HDMI Forum";
> +	case 0x90848b: *ouinum = kOUI_HDR10     ; return "HDR10+";
>  	case 0x00001a: return "AMD";
>  	case 0x00044b: return "NVIDIA";
>  	case 0x000c6e: return "ASUS";
> @@ -1244,212 +1258,136 @@ static const char *oui_name(unsigned oui)
>  	}
>  }
>  
> +void edid_state::cta_oui(const char *block_name, const unsigned char *x, unsigned length, unsigned *ouinum)
> +{
> +	char buf[10];
> +	unsigned oui;
> +
> +	if (length < 3) {
> +		oui = 0xffffffff;
> +		sprintf(buf, "?");
> +	} else {
> +		oui = (x[2] << 16) + (x[1] << 8) + x[0];
> +		sprintf(buf, "0x%06x", oui);
> +	}
> +	
> +	const char *ouiname = oui_name(oui, ouinum);
> +	std::string name = std::string(block_name) + ", OUI " + buf;
> +	if (ouiname) name += std::string(" (") + ouiname + ")";
> +	data_block = name;
> +	
> +	if (oui == 0xffffffff)
> +		fail("CTA data block is not long enough to contain an OUI\n");
> +}
> +
> +#define data_block_o(n) cta_oui(n, x + 1 + extended, length - extended, &ouinum)
> +
>  void edid_state::cta_block(const unsigned char *x)
>  {
> -	static int last_block_was_hdmi_vsdb;
> -	static int have_hf_vsdb, have_hf_scdb;
> -	static int first_block = 1;
> +	static unsigned previous_cta_tag = 0;
> +	static bool have_hf_vsdb = false;
> +	static bool have_hf_scdb = false;
> +	static unsigned cta_block_number = 0;
> +
>  	unsigned length = x[0] & 0x1f;
> -	const char *name;
> -	unsigned oui;
> +	unsigned ouinum = 0;
> +	unsigned tag=(x[0] & 0xe0) >> 5;
> +	unsigned extended = tag == 0x07 ? 1 : 0;
> +	if (extended) tag = 0x700 + x[1];
> +
> +	switch (tag) {
> +	case 0x001: data_block = "Audio Data Block"; break;
> +	case 0x002: data_block = "Video Data Block"; break;
> +	case 0x003: data_block_o("Vendor-Specific Data Block"); break;
> +	case 0x004: data_block = "Speaker Allocation Data Block"; break;
> +	case 0x005: data_block = "VESA DTC Data Block"; break; // not implemented
> +
> +	case 0x700: data_block = "Video Capability Data Block"; break;
> +	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break;
> +	case 0x702: data_block = "VESA Video Display Device Data Block"; break; // not implemented
> +	case 0x703: data_block = "VESA Video Timing Block Extension"; break; // not implemented
> +	case 0x704: data_block = "Reserved for HDMI Video Data Block"; break; // reserved
> +	case 0x705: data_block = "Colorimetry Data Block"; break;
> +	case 0x706: data_block = "HDR Static Metadata Data Block"; break;
> +	case 0x707: data_block = "HDR Dynamic Metadata Data Block"; break;
> +
> +	case 0x70d: data_block = "Video Format Preference Data Block"; break;
> +	case 0x70e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
> +	case 0x70f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
> +	case 0x710: data_block = "Reserved for CTA Miscellaneous Audio Fields"; break; // reserved
> +	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); break; // no vendors implemented
> +	case 0x712: data_block = "HDMI Audio Data Block"; break;
> +	case 0x713: data_block = "Room Configuration Data Block"; break;
> +	case 0x714: data_block = "Speaker Location Data Block"; break;
> +
> +	case 0x720: data_block = "InfoFrame Data Block"; break;
> +
> +	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
> +	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
> +	default:
> +		     if (tag < 0x700) data_block = "Unknown CTA Data Block";
> +		else if (tag < 0x70d) data_block = "Unknown CTA Video-Related Data Block";
> +		else if (tag < 0x720) data_block = "Unknown CTA Audio-Related Data Block";
> +		else if (tag < 0x778) data_block = "Unknown CTA Data Block";
> +		else if (tag < 0x780) data_block = "Unknown CTA HDMI-Related Data Block";
> +		else                  data_block = "Unknown CTA Data Block";
> +		data_block += std::string(" (") + (extended ? "extended " : "") + "tag " + utohex(tag & 0xff) + ")";
> +	}
>  
> -	switch ((x[0] & 0xe0) >> 5) {
> -	case 0x01:
> -		data_block = "Audio Data Block";
> -		printf("  %s\n", data_block.c_str());
> -		cta_audio_block(x + 1, length);
> +	printf("  %s\n", data_block.c_str());
> +	
> +	tag |= ouinum;
> +	switch (tag) {
> +	case 0x001: cta_audio_block(x + 1, length); break;
> +	case 0x002: cta_svd(x + 1, length, 0); break;
> +	case 0x003|kOUI_HDMI:
> +		cta_hdmi_block(x + 1, length);
> +		if (edid_minor != 3)
> +			fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_minor);
>  		break;
> -	case 0x02:
> -		data_block = "Video Data Block";
> -		printf("  %s\n", data_block.c_str());
> -		cta_svd(x + 1, length, 0);
> +	case 0x003|kOUI_HDMIForum:
> +		if (previous_cta_tag != (0x003|kOUI_HDMI))
> +			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n");
> +		if (have_hf_scdb || have_hf_vsdb)
> +			fail("Duplicate HDMI Forum VSDB/SCDB\n");
> +		cta_hf_scdb(x + 4, length - 3);
> +		have_hf_vsdb = true;
>  		break;
> -	case 0x03:
> -		oui = (x[3] << 16) + (x[2] << 8) + x[1];
> -		printf("  Vendor-Specific Data Block, OUI 0x%06x", oui);
> -		name = oui_name(oui);
> -		if (oui == 0x000c03) {
> -			data_block = "Vendor-Specific Data Block (HDMI)";
> -			cta_hdmi_block(x + 1, length);
> -			last_block_was_hdmi_vsdb = 1;
> -			first_block = 0;
> -			if (edid_minor != 3)
> -				fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_minor);
> -			return;
> -		}
> -		if (oui == 0xc45dd8) {
> -			data_block = "Vendor-Specific Data Block (HDMI Forum)";
> -			if (!last_block_was_hdmi_vsdb)
> -				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n");
> -			if (have_hf_scdb || have_hf_vsdb)
> -				fail("Duplicate HDMI Forum VSDB/SCDB\n");
> -			printf(" (HDMI Forum)\n");
> -			cta_hf_scdb(x + 4, length - 3);
> -			have_hf_vsdb = 1;
> -		} else if (name) {
> -			data_block = std::string("Vendor-Specific Data Block (") + name + ")";
> -			printf(" (%s)\n", name);
> -			hex_block("    ", x + 4, length - 3);
> -		} else {
> -			printf("\n");
> -			hex_block("    ", x + 4, length - 3);
> -			data_block.clear();
> -			warn("Unknown Vendor-Specific Data Block, OUI 0x%06x\n", oui);
> -		}
> -		break;
> -	case 0x04:
> -		data_block = "Speaker Allocation Data Block";
> -		printf("  %s\n", data_block.c_str());
> -		cta_sadb(x + 1, length);
> -		break;
> -	case 0x05:
> -		printf("  VESA DTC Data Block\n");
> -		hex_block("  ", x + 1, length);
> -		break;
> -	case 0x07:
> -		printf("  Extended tag: ");
> -		switch (x[1]) {
> -		case 0x00:
> -			data_block = "Video Capability Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_vcdb(x + 2, length - 1);
> -			break;
> -		case 0x01:
> -			oui = (x[4] << 16) + (x[3] << 8) + x[2];
> -			printf("Vendor-Specific Video Data Block, OUI 0x%06x", oui);
> -			name = oui_name(oui);
> -			if (oui == 0x90848b) {
> -				data_block = "Vendor-Specific Video Data Block (HDR10+)";
> -				printf(" (HDR10+)\n");
> -				cta_hdr10plus(x + 5, length - 4);
> -			} else if (name) {
> -				data_block = std::string("Vendor-Specific Data Block (") + name + ")";
> -				printf(" (%s)\n", name);
> -				hex_block("    ", x + 5, length - 4);
> -			} else {
> -				printf("\n");
> -				hex_block("    ", x + 5, length - 4);
> -				data_block.clear();
> -				warn("Unknown Extended Vendor-Specific Data Block, OUI 0x%06x\n", oui);
> -			}
> -			break;
> -		case 0x02:
> -			printf("VESA Video Display Device Data Block\n");
> -			hex_block("  ", x + 2, length - 1);
> -			break;
> -		case 0x03:
> -			printf("VESA Video Timing Block Extension\n");
> -			hex_block("  ", x + 2, length - 1);
> -			break;
> -		case 0x04:
> -			printf("Reserved for HDMI Video Data Block\n");
> -			hex_block("  ", x + 2, length - 1);
> -			break;
> -		case 0x05:
> -			data_block = "Colorimetry Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_colorimetry_block(x + 2, length - 1);
> -			break;
> -		case 0x06:
> -			data_block = "HDR Static Metadata Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_hdr_static_metadata_block(x + 2, length - 1);
> -			break;
> -		case 0x07:
> -			data_block = "HDR Dynamic Metadata Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_hdr_dyn_metadata_block(x + 2, length - 1);
> -			break;
> -		case 0x0d:
> -			data_block = "Video Format Preference Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_vfpdb(x + 2, length - 1);
> -			break;
> -		case 0x0e:
> -			data_block = "YCbCr 4:2:0 Video Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_svd(x + 2, length - 1, 1);
> -			break;
> -		case 0x0f:
> -			data_block = "YCbCr 4:2:0 Capability Map Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_y420cmdb(x + 2, length - 1);
> -			break;
> -		case 0x10:
> -			printf("Reserved for CTA Miscellaneous Audio Fields\n");
> -			hex_block("  ", x + 2, length - 1);
> -			break;
> -		case 0x11:
> -			printf("Vendor-Specific Audio Data Block\n");
> -			hex_block("  ", x + 2, length - 1);
> -			break;
> -		case 0x12:
> -			data_block = "HDMI Audio Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_hdmi_audio_block(x + 2, length - 1);
> -			break;
> -		case 0x13:
> -			data_block = "Room Configuration Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_rcdb(x + 2, length - 1);
> -			break;
> -		case 0x14:
> -			data_block = "Speaker Location Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_sldb(x + 2, length - 1);
> -			break;
> -		case 0x20:
> -			printf("InfoFrame Data Block\n");
> -			cta_ifdb(x + 2, length - 1);
> -			break;
> -		case 0x78:
> -			data_block = "HDMI Forum EDID Extension Override Data Block";
> -			printf("%s\n", data_block.c_str());
> -			cta_hf_eeodb(x + 2, length - 1);
> -			// This must be the first CTA block
> -			if (!first_block)
> -				fail("Block starts at a wrong offset\n");
> -			break;
> -		case 0x79:
> -			data_block = "HDMI Forum Sink Capability Data Block";
> -			printf("%s\n", data_block.c_str());
> -			if (!last_block_was_hdmi_vsdb)
> -				fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n");
> -			if (have_hf_scdb || have_hf_vsdb)
> -				fail("Duplicate HDMI Forum VSDB/SCDB\n");
> -			if (x[2] || x[3])
> -				printf("  Non-zero SCDB reserved fields!\n");
> -			cta_hf_scdb(x + 4, length - 3);
> -			have_hf_scdb = 1;
> -			break;
> -		default:
> -			if (x[1] <= 12)
> -				printf("Unknown CTA Video-Related");
> -			else if (x[1] <= 31)
> -				printf("Unknown CTA Audio-Related");
> -			else if (x[1] >= 120 && x[1] <= 127)
> -				printf("Unknown CTA HDMI-Related");
> -			else
> -				printf("Unknown CTA");
> -			printf(" Data Block (extended tag 0x%02x, length %u)\n", x[1], length - 1);
> -			hex_block("    ", x + 2, length - 1);
> -			data_block.clear();
> -			warn("Unknown Extended CTA Data Block 0x%02x\n", x[1]);
> -			break;
> -		}
> +	case 0x004: cta_sadb(x + 1, length); break;
> +	case 0x700: cta_vcdb(x + 2, length - 1); break;
> +	case 0x701|kOUI_HDR10: cta_hdr10plus(x + 5, length - 4); break;
> +	case 0x705: cta_colorimetry_block(x + 2, length - 1); break;
> +	case 0x706: cta_hdr_static_metadata_block(x + 2, length - 1); break;
> +	case 0x707: cta_hdr_dyn_metadata_block(x + 2, length - 1); break;
> +	case 0x70d: cta_vfpdb(x + 2, length - 1); break;
> +	case 0x70e: cta_svd(x + 2, length - 1, 1); break;
> +	case 0x70f: cta_y420cmdb(x + 2, length - 1); break;
> +	case 0x712: cta_hdmi_audio_block(x + 2, length - 1); break;
> +	case 0x713: cta_rcdb(x + 2, length - 1); break;
> +	case 0x714: cta_sldb(x + 2, length - 1); break;
> +	case 0x720: cta_ifdb(x + 2, length - 1); break;
> +	case 0x778: 
> +		cta_hf_eeodb(x + 2, length - 1);
> +		// This must be the first CTA block
> +		if (cta_block_number != 0)
> +			fail("Block starts at a wrong offset\n");
>  		break;
> -	default: {
> -		unsigned tag = (*x & 0xe0) >> 5;
> -		unsigned length = *x & 0x1f;
> -		printf("  Unknown CTA tag 0x%02x, length %u\n", tag, length);
> -		hex_block("    ", x + 1, length);
> -		data_block.clear();
> -		warn("Unknown CTA Data Block %u\n", tag);
> +	case 0x779:
> +		if (previous_cta_tag != (0x003|kOUI_HDMI))
> +			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n");
> +		if (have_hf_scdb || have_hf_vsdb)
> +			fail("Duplicate HDMI Forum VSDB/SCDB\n");
> +		if (x[2] || x[3])
> +			printf("    Non-zero SCDB reserved fields!\n");
> +		cta_hf_scdb(x + 4, length - 3);
> +		have_hf_scdb = true;
>  		break;
> +	default:
> +		warn("Unknown %s\n", data_block.c_str());
> +		hex_block("    ", x + 1 + extended + (ouinum ? 3 : 0), length - (extended + (ouinum ? 3 : 0)));
>  	}
> -	}
> -	first_block = 0;
> -	last_block_was_hdmi_vsdb = 0;
> +	cta_block_number++;
> +	previous_cta_tag = tag;
>  }
>  
>  void edid_state::preparse_cta_block(const unsigned char *x)
> 


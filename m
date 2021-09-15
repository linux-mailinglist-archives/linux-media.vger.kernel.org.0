Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7643840C680
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 15:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhIONjO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 09:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbhIONjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 09:39:12 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C35DC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 06:37:52 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QV6jmsl6KpQdWQV6kmC8ZA; Wed, 15 Sep 2021 15:37:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631713070; bh=kgA1G4fj5hX+u/0YrQFbhwkOhmjpoIA6wLGQYYTieIk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GouQCJ9zWYR6iJZ9n9GUwv7RN4FGTMluE3RZCaYCDZQajnl/FfHvsT9z2v+by2baB
         VLfp8IsYYCoU+NgpxCWBjQd1XUxcSfWyelfYzdi5Zk8O2ZFf6zHuWngw2DYAuaQzzp
         vaMcigWMwoqCZCl/mNYLKzH1KqwgEufzCAMQcPcDcfI3L8YU1W/1upCOqlqhsji+7x
         lVok5ivYTpKyzKM05J9EEDNrZJDwR41EXs4Qo9sfO4FwIVh+JFj5RqmQZCefsEiLNW
         7ufrfezKIdN78lKZizHcC0uR4uwxqLBTORKUxR0dsNVQVPLXL+4LDvtmjEjend2MoF
         wu9krHdQY7Olw==
Subject: Re: [PATCH 11/11] edid-decode: cta and displayid changes
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-12-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ea0945c8-020c-4b3b-56be-4d197d606900@xs4all.nl>
Date:   Wed, 15 Sep 2021 15:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914121129.51451-12-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOPMdEF4iP0rOvaf4rNIG84rlTxYSsR2hcZ2Pqvo11Pz7os/SLIHTpFZwp6rj/5/QAd3nrYzT+geNRiQsCYDPOdbPvqg/v2pbUiR2ZBpf/Vgd55IZb6G
 1dIW9gx/11/MulriM2R6Wv1gVWmS9p5lKUPl/ruMTLUtRzOAEAdnL6huOYp/tbenT1bwldN3pTQd/UbBoHontibOryvtn6l8/ODd8BCc1YwRmsjpiAzAXuXN
 bAKK1Rr0/P1hAI98Yo2OdeVyIKWdQZUkEKOx/ApXSrLTSQ+7vuuOYzzYjyKI0j9yaohVOLTBH5AyyhHPCcSKvg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/09/2021 14:11, joevt wrote:
> Goal: make OUI blocks equal to normal blocks to simplify decoding and make handling of all types of blocks consistent. This will reduce duplicated code (only one place for checking duplicate blocks, only one place for handling unknown blocks, etc.)
> 
> oui.h
> - This contains a list of OUI and CID and PNP values.
> - It is included in various places with varying definitions of the oneoui macro.
> 
> edid-decode.h
> - Add list of OUI constants using oui.h.
> - Other changes described below.
> 
> parse-cta-block.cpp
> - Modified oui_name. Returns a name and a number for a OUI.
> - Added data_block_oui. For data blocks with an OUI, does size check, OUI endianness check, and PNP vs OUI check. Returns a value representing the OUI (if it is known).
> - Modify cta_block. Reduce code by flattening the switch statement. This means constructing a case value from three values.
>   Side effects include making reporting of "Only one instance of this Data Block is allowed." more consistant (always report this fail after the block type is output instead of sometimes before and sometimes after). See example acer-xv273k-dp2-corrupted.
>   First, get the extended type and append it to the tag type (i.e. add 0x700 if extended), then get the OUI if it's vendor specific, and convert it to a number that can be appended (bitwise or) to the tag/extended type value.
> 	- Init static variables
> 	- Replace last_block_was_hdmi_vsdb with previous_cta_tag; this means instead of remembering if the last block was hdmi vsdb, we just remember the previous block's tag.
> 	- Replace first_block with cta_block_number; this means instead of remembering if this is the first block or not, we just remember the current block number.
> 	- Remove name and oui, we'll just get the data_block string and a oui index directly.
> 	- Report OUI for extended tag 11h (Vendor-Specific Audio Data Block)
> 	- Fix capitalization of "Audio information is present" fail message.
> 	- Add bounds check on length field (must be at least 1 for extended tags).
> 	- Don't parse after OUI if there's not enough length for OUI.
> 	- Adjust x offsets in cta_hdmi_block so it is like other OUI extended blocks such that x points to after the OUI.
> 	- A block that outputs only hex is reported as an unknown block type even if we know the OUI. See example acer-xb321hk-dp.
> 
> parse-disableid-block.cpp
> - Add displayid_block to do a single data block - like cta_block does for cta extension block
> 	- Vendor specific data block for DisplayID 1.3 is assumed to be PNP (string order). See example apple-macbookpro-16inch-2019.
> 	- Vendor specific data block for DisplayID 2.0 is assumed to have OUI (little endian).
> 	- Interpret Vendor specific data block 0x7e or 0x7f even if DisplayID is not correct for that type (there's already a FAIL message to identify the problem). See example apple-xdr-6k.
> 	- Add bounds check: if length is < 3, only check x[1] if length is 2.
> 	  Don't report "Not enough bytes remain (1) for a DisplayID data block or the DisplayID filler is non-0." if the bytes are zero (also change the word "or" to "and"). See example apple-xdr-6k-tile0.
> 	- Report datablock name before failing.
> 	- For unknown vendor specific data blocks, don't output the OUI part as hex since the new data_block_oui function has already reported it. See example apple-macbookpro-16inch-2019.
> 	- Replace first_data_block with disp.block_number

I've decided not to merge this patch. It does too many things at the same time,
so it really should be split up into smaller pieces.

I'm also getting ugly lines like this:

Unknown CTA-861 Data Block (tag 0x00): Unknown block type: Unknown CTA-861 Data Block (tag 0x00).

or this:

Vendor-Specific Data Block (NVIDIA), OUI 00-04-4B: Unknown block type: Vendor-Specific Data Block (NVIDIA),
OUI 00-04-4B.

(which shouldn't be a warning anyway)

> 
> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
> ---
>  edid-decode.cpp           |  99 ++++++--
>  edid-decode.h             |  20 +-
>  oui.h                     |  20 ++
>  parse-cta-block.cpp       | 456 ++++++++++++++-----------------------
>  parse-displayid-block.cpp | 463 ++++++++++++++++++--------------------
>  5 files changed, 505 insertions(+), 553 deletions(-)

While it does reduce the code size a bit, it really isn't by all that much,
so I am not convinced that all the churn is worth it.

If this is split up into first fixes and small improvements, and then rework
the tag handling, then I can take another look at whether it makes sense to
apply this.

I've applied patches 1, 2, 3, 4, 6, 8, 9 and 10. The others need more work.

Regards,

	Hans

>  create mode 100644 oui.h
> 
> diff --git a/edid-decode.cpp b/edid-decode.cpp
> index 0c83e0e..ed3223d 100644
> --- a/edid-decode.cpp
> +++ b/edid-decode.cpp
> @@ -657,25 +657,90 @@ std::string utohex(unsigned char x)
>  	return buf;
>  }
>  
> -const char *oui_name(unsigned oui, bool reverse)
> +const char *oui_name(unsigned oui, unsigned *ouinum)
>  {
> -	if (reverse)
> -		oui = (oui >> 16) | (oui & 0xff00) | ((oui & 0xff) << 16);
> -
> +	unsigned ouinumscratch;
> +	if (!ouinum) ouinum = &ouinumscratch;
> +	const char *name;
>  	switch (oui) {
> -	case 0x00001a: return "AMD";
> -	case 0x000c03: return "HDMI";
> -	case 0x00044b: return "NVIDIA";
> -	case 0x000c6e: return "ASUS";
> -	case 0x0010fa: return "Apple";
> -	case 0x0014b9: return "MSTAR";
> -	case 0x00d046: return "Dolby";
> -	case 0x00e047: return "InFocus";
> -	case 0x3a0292: return "VESA";
> -	case 0x90848b: return "HDR10+";
> -	case 0xc45dd8: return "HDMI Forum";
> -	case 0xca125c: return "Microsoft";
> -	default: return NULL;
> +		#define oneoui(c,k,n) case c: *ouinum = kOUI_##k; name = n; break;
> +		#include "oui.h"
> +		default: *ouinum = 0; name = NULL;
> +	}
> +	return name;
> +}
> +
> +void edid_state::data_block_oui(std::string block_name, const unsigned char *x, unsigned length, bool ignorezeros, unsigned *ouinum, bool do_ascii, bool big_endian)
> +{
> +	std::string buf;
> +	char ascii[4];
> +	unsigned oui;
> +	const char *ouiname = NULL;
> +	bool matched_reverse = false;
> +	bool matched_ascii = false;
> +	bool valid_ascii = false;
> +
> +	if (big_endian)
> +		oui = ((length > 0 ? x[0] : 0) << 16) + ((length > 1 ? x[1] : 0) << 8) + (length > 2 ? x[2] : 0);
> +	else
> +		oui = ((length > 2 ? x[2] : 0) << 16) + ((length > 1 ? x[1] : 0) << 8) + (length > 0 ? x[0] : 0);
> +
> +	buf = ouitohex(oui);
> +	if (length < 3) {
> +		sprintf(ascii, "?"); // some characters are null
> +		if (ouinum) *ouinum = 0; // doesn't match a known OUI
> +	} else {
> +		valid_ascii = (x[0] >= 'A' && x[1] >= 'A' && x[2] >= 'A' && x[0] <= 'Z' && x[1] <= 'Z' && x[2] <= 'Z');
> +		sprintf(ascii, "%c%c%c", x[0], x[1], x[2]);
> +
> +		ouiname = oui_name(oui, ouinum);
> +		if (!ouiname) {
> +			big_endian = !big_endian;
> +			unsigned reversedoui = ((oui & 0xff) << 16) + (oui & 0x00ff00) + (oui >> 16);
> +			ouiname = oui_name(reversedoui, ouinum);
> +			if (ouiname) {
> +				oui = reversedoui;
> +				buf = ouitohex(oui);
> +				matched_reverse = true;
> +			}
> +			else if (do_ascii && valid_ascii)
> +			{
> +				unsigned asciioui = (x[0] << 24) + (x[1] << 16) + (x[2] << 8);
> +				ouiname = oui_name(asciioui, ouinum);
> +				if (ouiname) {
> +					matched_ascii = true;
> +				}
> +			}
> +		}
> +	}
> +
> +	std::string name;
> +	if (ouiname) {
> +		if (matched_ascii)
> +			name = block_name + " (" + ouiname + ")" + ", PNP ID '" + ascii + "'";
> +		else
> +			name = block_name + " (" + ouiname + ")" + ", OUI " + buf;
> +	} else if (do_ascii && valid_ascii) {
> +		name = block_name + ", PNP ID '" + ascii + "'";
> +	} else {
> +		name = block_name + ", OUI " + buf;
> +	}
> +	// assign string to data_block before outputting errors
> +	data_block = name;
> +	
> +	if (oui || !ignorezeros) {
> +		if (length < 3)
> +			fail("Data block length is not enough to contain an OUI.\n");
> +		if (ouiname && do_ascii && !valid_ascii)
> +			warn("Expected PNP ID but found OUI.\n");
> +		if (ouiname && matched_reverse)
> +			warn("Endian-ness (%s) of OUI is different than expected (%s).\n", big_endian ? "be" : "le", big_endian ? "le" : "be");
> +		if (!ouiname) {
> +			if (valid_ascii)
> +				warn("Unknown OUI %s (possible PNP %s).\n", buf.c_str(), ascii);
> +			else
> +				warn("Unknown OUI %s.\n", buf.c_str());
> +		}
>  	}
>  }
>  
> diff --git a/edid-decode.h b/edid-decode.h
> index 612d22a..9e6a955 100644
> --- a/edid-decode.h
> +++ b/edid-decode.h
> @@ -153,8 +153,10 @@ struct edid_state {
>  		// CTA-861 block state
>  		cta.has_vic_1 = cta.first_svd_might_be_preferred = cta.has_sldb =
>  			cta.has_hdmi = cta.has_vcdb = cta.has_vfpdb = false;
> -		cta.last_block_was_hdmi_vsdb = cta.have_hf_vsdb = cta.have_hf_scdb = false;
> -		cta.first_block = cta.first_svd = true;
> +		cta.have_hf_vsdb = cta.have_hf_scdb = false;
> +		cta.previous_cta_tag = 0xfff;
> +		cta.block_number = 0;
> +		cta.first_svd = true;
>  		cta.supported_hdmi_vic_codes = cta.supported_hdmi_vic_vsb_codes = 0;
>  		memset(cta.vics, 0, sizeof(cta.vics));
>  		memset(cta.preparsed_has_vic, 0, sizeof(cta.preparsed_has_vic));
> @@ -175,6 +177,7 @@ struct edid_state {
>  		dispid.is_display = dispid.has_product_identification =
>  			dispid.has_display_parameters = dispid.has_type_1_7 =
>  			dispid.has_display_interface_features = false;
> +		dispid.block_number = 0;
>  
>  		// Block Map block state
>  		block_map.saw_block_1 = false;
> @@ -257,9 +260,9 @@ struct edid_state {
>  		bool preparsed_sld;
>  		bool has_sldb;
>  		unsigned short preparsed_phys_addr;
> -		bool last_block_was_hdmi_vsdb;
> +		unsigned previous_cta_tag;
>  		bool have_hf_vsdb, have_hf_scdb;
> -		bool first_block;
> +		unsigned block_number;
>  		bool first_svd;
>  		unsigned supported_hdmi_vic_codes;
>  		unsigned supported_hdmi_vic_vsb_codes;
> @@ -282,6 +285,7 @@ struct edid_state {
>  		bool has_display_interface_features;
>  		vec_timings_ext preferred_timings;
>  		unsigned native_width, native_height;
> +		unsigned block_number;
>  		// Keep track of the found CTA-861 Tag/Extended Tag pairs.
>  		// The unsigned value is equal to: (tag << 8) | ext_tag
>  		std::set<unsigned> found_tags;
> @@ -331,6 +335,8 @@ struct edid_state {
>  	void list_dmts();
>  	void list_established_timings();
>  
> +	void data_block_oui(std::string block_name, const unsigned char *x, unsigned length, bool ignorezeros, unsigned *ouinum, bool do_ascii = false, bool big_endian = false);
> +
>  	void print_vic_index(const char *prefix, unsigned idx, const char *suffix, bool ycbcr420 = false);
>  	void hdmi_latency(unsigned char vid_lat, unsigned char aud_lat, bool is_ilaced);
>  	void cta_vcdb(const unsigned char *x, unsigned length);
> @@ -390,6 +396,7 @@ struct edid_state {
>  	void parse_displayid_type_10_timing(const unsigned char *x, unsigned sz,
>  					    bool is_cta = false);
>  	void preparse_displayid_block(const unsigned char *x);
> +	unsigned displayid_block(const unsigned version, const unsigned char *x, unsigned length);
>  	void parse_displayid_block(const unsigned char *x);
>  	void parse_displayid_vesa(const unsigned char *x);
>  	void parse_displayid_cta_data_block(const unsigned char *x);
> @@ -454,7 +461,7 @@ void hex_block(const char *prefix, const unsigned char *x, unsigned length,
>  	       bool show_ascii = true, unsigned step = 16);
>  std::string block_name(unsigned char block);
>  void calc_ratio(struct timings *t);
> -const char *oui_name(unsigned oui, bool reverse = false);
> +const char *oui_name(unsigned oui, unsigned *ouinum = NULL);
>  
>  bool timings_close_match(const timings &t1, const timings &t2);
>  const struct timings *find_dmt_id(unsigned char dmt_id);
> @@ -465,4 +472,7 @@ const struct timings *cta_close_match_to_vic(const timings &t, unsigned &vic);
>  unsigned char hdmi_vic_to_vic(unsigned char hdmi_vic);
>  char *extract_string(const unsigned char *x, unsigned len);
>  
> +#define oneoui(c,k,n) const unsigned kOUI_##k = __LINE__<<12;
> +#include "oui.h"
> +
>  #endif
> diff --git a/oui.h b/oui.h
> new file mode 100644
> index 0000000..c90f025
> --- /dev/null
> +++ b/oui.h
> @@ -0,0 +1,20 @@
> +// http://standards-oui.ieee.org/oui/oui.txt
> +oneoui(0x000c03, HDMI,         "HDMI"        )
> +oneoui(0xc45dd8, HDMIForum,    "HDMI Forum"  )
> +oneoui(0x90848b, HDR10,        "HDR10+"      )
> +oneoui(0x00001a, AMD,          "AMD"         )
> +oneoui(0x00044b, NVIDIA,       "NVIDIA"      )
> +oneoui(0x000c6e, ASUS,         "ASUS"        )
> +oneoui(0x0010fa, Apple,        "Apple"       )
> +oneoui(0x0014b9, MSTAR,        "MSTAR"       )
> +oneoui(0x00d046, Dolby,        "Dolby"       )
> +oneoui(0x00e047, InFocus,      "InFocus"     )
> +oneoui(0xca125c, Microsoft,    "Microsoft"   )
> +
> +// http://standards-oui.ieee.org/cid/cid.txt
> +oneoui(0x3a0292, VESA,         "VESA"        )
> +
> +// https://uefi.org/pnp_id_list
> +oneoui('APP\0' , asciiApple,   "Apple"       )
> +
> +#undef oneoui
> diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
> index 4edaa1d..9bc0c77 100644
> --- a/parse-cta-block.cpp
> +++ b/parse-cta-block.cpp
> @@ -652,57 +652,57 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
>  {
>  	unsigned len_vic, len_3d;
>  
> -	if (length < 4) {
> -		fail("Empty Data Block with length %u.\n", length);
> +	if (length < 1) {
> +		fail("Empty Data Block.\n");
>  		return;
>  	}
> -	printf("    Source physical address: %x.%x.%x.%x\n", x[3] >> 4, x[3] & 0x0f,
> -	       x[4] >> 4, x[4] & 0x0f);
> +	printf("    Source physical address: %x.%x.%x.%x\n", x[0] >> 4, x[0] & 0x0f,
> +	       x[1] >> 4, x[1] & 0x0f);
>  
> -	if (length < 6)
> +	if (length < 3)
>  		return;
>  
> -	if (x[5] & 0x80)
> +	if (x[2] & 0x80)
>  		printf("    Supports_AI\n");
> -	if (x[5] & 0x40)
> +	if (x[2] & 0x40)
>  		printf("    DC_48bit\n");
> -	if (x[5] & 0x20)
> +	if (x[2] & 0x20)
>  		printf("    DC_36bit\n");
> -	if (x[5] & 0x10)
> +	if (x[2] & 0x10)
>  		printf("    DC_30bit\n");
> -	if (x[5] & 0x08)
> +	if (x[2] & 0x08)
>  		printf("    DC_Y444\n");
>  	/* two reserved bits */
> -	if (x[5] & 0x01)
> +	if (x[2] & 0x01)
>  		printf("    DVI_Dual\n");
>  
> -	if (length < 7)
> +	if (length < 4)
>  		return;
>  
> -	printf("    Maximum TMDS clock: %u MHz\n", x[6] * 5);
> -	if (x[6] * 5 > 340)
> +	printf("    Maximum TMDS clock: %u MHz\n", x[3] * 5);
> +	if (x[3] * 5 > 340)
>  		fail("HDMI VSDB Max TMDS rate is > 340.\n");
>  
> -	if (length < 8)
> +	if (length < 5)
>  		return;
>  
> -	if (x[7] & 0x0f) {
> +	if (x[4] & 0x0f) {
>  		printf("    Supported Content Types:\n");
> -		if (x[7] & 0x01)
> +		if (x[4] & 0x01)
>  			printf("      Graphics\n");
> -		if (x[7] & 0x02)
> +		if (x[4] & 0x02)
>  			printf("      Photo\n");
> -		if (x[7] & 0x04)
> +		if (x[4] & 0x04)
>  			printf("      Cinema\n");
> -		if (x[7] & 0x08)
> +		if (x[4] & 0x08)
>  			printf("      Game\n");
>  	}
>  
> -	unsigned b = 8;
> -	if (x[7] & 0x80) {
> +	unsigned b = 5;
> +	if (x[4] & 0x80) {
>  		hdmi_latency(x[b], x[b + 1], false);
>  
> -		if (x[7] & 0x40) {
> +		if (x[4] & 0x40) {
>  			if (x[b] == x[b + 2] &&
>  			    x[b + 1] == x[b + 3])
>  				warn("Progressive and Interlaced latency values are identical, no need for both.\n");
> @@ -712,7 +712,7 @@ void edid_state::cta_hdmi_block(const unsigned char *x, unsigned length)
>  		b += 2;
>  	}
>  
> -	if (!(x[7] & 0x20))
> +	if (!(x[4] & 0x20))
>  		return;
>  
>  	bool mask = false;
> @@ -1990,293 +1990,169 @@ static void cta_hdmi_audio_block(const unsigned char *x, unsigned length)
>  	}
>  }
>  
> -void edid_state::cta_ext_block(const unsigned char *x, unsigned length,
> -			       bool duplicate)
> +#define data_block_o(n) do { data_block_oui(n, x, length, false, &ouinum); if (length < 3) return; length -= 3; x += 3; } while(0)
> +
> +void edid_state::cta_block(const unsigned char *x, bool duplicate)
>  {
> -	const char *name;
> -	unsigned oui;
> -	bool reverse = false;
> +	unsigned length = x[0] & 0x1f; // number of bytes after the tag/length byte
> +	unsigned ouinum = 0;
> +	unsigned tag=(x[0] & 0xe0) >> 5;
> +	unsigned extended = (tag == 0x07) ? 1 : 0;
> +	x++;
> +	if (extended) {
> +		if (!length) {
> +			fail("Extended tag cannot have length 0.\n");
> +			return;
> +		}
> +		length--;
> +		tag = 0x700 + x[0];
> +		x++;
> +	}
> +
>  	bool audio_block = false;
>  
> -	switch (x[0]) {
> -	case 0x00: data_block = "Video Capability Data Block"; break;
> -	case 0x01: data_block.clear(); break;
> -	case 0x02: data_block = "VESA Video Display Device Data Block"; break;
> -	case 0x03: data_block = "VESA Video Timing Block Extension"; break;
> -	case 0x04: data_block = "Reserved for HDMI Video Data Block"; break;
> -	case 0x05: data_block = "Colorimetry Data Block"; break;
> -	case 0x06: data_block = "HDR Static Metadata Data Block"; break;
> -	case 0x07: data_block = "HDR Dynamic Metadata Data Block"; break;
> -
> -	case 0x0d: data_block = "Video Format Preference Data Block"; break;
> -	case 0x0e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
> -	case 0x0f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
> -	case 0x10: data_block = "Reserved for CTA-861 Miscellaneous Audio Fields"; break;
> -	case 0x11: data_block.clear(); audio_block = true; break;
> -	case 0x12: data_block = "HDMI Audio Data Block"; audio_block = true; break;
> -	case 0x13: data_block = "Room Configuration Data Block"; audio_block = true; break;
> -	case 0x14: data_block = "Speaker Location Data Block"; audio_block = true; break;
> -
> -	case 0x20: data_block = "InfoFrame Data Block"; break;
> -
> -	case 0x34: data_block = "DisplayID Type VII Video Timing Data Block"; break;
> -	case 0x35: data_block = "DisplayID Type VIII Video Timing Data Block"; break;
> -	case 0x42: data_block = "DisplayID Type X Video Timing Data Block"; break;
> -
> -	case 0x78: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
> -	case 0x79: data_block = "HDMI Forum Sink Capability Data Block"; break;
> +	switch (tag) {
> +	case 0x001: data_block = "Audio Data Block"; audio_block = true; break;
> +	case 0x002: data_block = "Video Data Block"; break;
> +	case 0x003: data_block_o("Vendor-Specific Data Block"); break;
> +	case 0x004: data_block = "Speaker Allocation Data Block"; audio_block = true; break;
> +	case 0x005: data_block = "VESA Display Transfer Characteristics Data Block"; break;
> +
> +	case 0x700: data_block = "Video Capability Data Block"; break;
> +	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break;
> +	case 0x702: data_block = "VESA Video Display Device Data Block"; break;
> +	case 0x703: data_block = "VESA Video Timing Block Extension"; break; // not implemented
> +	case 0x704: data_block = "Reserved for HDMI Video Data Block"; break; // reserved
> +	case 0x705: data_block = "Colorimetry Data Block"; break;
> +	case 0x706: data_block = "HDR Static Metadata Data Block"; break;
> +	case 0x707: data_block = "HDR Dynamic Metadata Data Block"; break;
> +
> +	case 0x70d: data_block = "Video Format Preference Data Block"; break;
> +	case 0x70e: data_block = "YCbCr 4:2:0 Video Data Block"; break;
> +	case 0x70f: data_block = "YCbCr 4:2:0 Capability Map Data Block"; break;
> +	case 0x710: data_block = "Reserved for CTA-861 Miscellaneous Audio Fields"; break; // reserved
> +	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); audio_block = true; break; // no vendors implemented
> +	case 0x712: data_block = "HDMI Audio Data Block"; audio_block = true; break;
> +	case 0x713: data_block = "Room Configuration Data Block"; audio_block = true; break;
> +	case 0x714: data_block = "Speaker Location Data Block"; audio_block = true; break;
> +
> +	case 0x720: data_block = "InfoFrame Data Block"; break;
> +
> +	case 0x734: data_block = "DisplayID Type VII Video Timing Data Block"; break;
> +	case 0x735: data_block = "DisplayID Type VIII Video Timing Data Block"; break;
> +	case 0x742: data_block = "DisplayID Type X Video Timing Data Block"; break;
> +
> +	case 0x778: data_block = "HDMI Forum EDID Extension Override Data Block"; break;
> +	case 0x779: data_block = "HDMI Forum Sink Capability Data Block"; break;
>  	default:
> -		if (x[0] <= 12)
> -			printf("  Unknown CTA-861 Video-Related");
> -		else if (x[0] <= 31)
> -			printf("  Unknown CTA-861 Audio-Related");
> -		else if (x[0] >= 120 && x[0] <= 127)
> -			printf("  Unknown CTA-861 HDMI-Related");
> -		else
> -			printf("  Unknown CTA-861");
> -		printf(" Data Block (extended tag 0x%02x, length %u)\n", x[0], length);
> -		hex_block("    ", x + 1, length);
> -		data_block.clear();
> -		warn("Unknown Extended CTA-861 Data Block 0x%02x.\n", x[0]);
> -		return;
> -	}
> -
> -	switch (x[0]) {
> -	case 0x00:
> -	case 0x02:
> -	case 0x05:
> -	case 0x06:
> -	case 0x0d:
> -	case 0x0f:
> -	case 0x12:
> -	case 0x13:
> -	case 0x78:
> -	case 0x79:
> +		     if (tag < 0x700) data_block = "Unknown CTA-861 Data Block";
> +		else if (tag < 0x70d) data_block = "Unknown CTA-861 Video-Related Data Block";
> +		else if (tag < 0x720) data_block = "Unknown CTA-861 Audio-Related Data Block";
> +		else if (tag < 0x778) data_block = "Unknown CTA-861 Data Block";
> +		else if (tag < 0x780) data_block = "Unknown CTA-861 HDMI-Related Data Block";
> +		else                  data_block = "Unknown CTA-861 Data Block";
> +		data_block += std::string(" (") + (extended ? "extended " : "") + "tag " + utohex(tag & 0xff) + ")";
> +	}
> +
> +	printf("  %s:\n", data_block.c_str());
> +
> +	switch (tag) {
> +	case 0x004:
> +	case 0x005:
> +	case 0x700:
> +	case 0x702:
> +	case 0x705:
> +	case 0x706:
> +	case 0x70d:
> +	case 0x70f:
> +	case 0x712:
> +	case 0x713:
> +	case 0x778:
> +	case 0x779:
>  		if (duplicate)
>  			fail("Only one instance of this Data Block is allowed.\n");
> -		break;
>  	}
>  
> -
>  	// See Table 52 of CTA-861-G for a description of Byte 3
>  	if (audio_block && !(cta.byte3 & 0x40))
> -		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
> -
> -	if (data_block.length())
> -		printf("  %s:\n", data_block.c_str());
> -
> -	switch (x[0]) {
> -	case 0x00: cta_vcdb(x + 1, length); return;
> -	case 0x01:
> -		if (length < 3) {
> -			data_block = std::string("Vendor-Specific Video Data Block");
> -			fail("Invalid length %u < 3.\n", length);
> -			return;
> -		}
> -		oui = (x[3] << 16) + (x[2] << 8) + x[1];
> -		name = oui_name(oui);
> -		if (!name) {
> -			name = oui_name(oui, true);
> -			if (name)
> -				reverse = true;
> -		}
> -		if (!name) {
> -			printf("  Vendor-Specific Video Data Block, OUI %s:\n",
> -			       ouitohex(oui).c_str());
> -			hex_block("    ", x + 4, length - 3);
> -			data_block.clear();
> -			warn("Unknown Extended Vendor-Specific Video Data Block, OUI %s.\n",
> -			     ouitohex(oui).c_str());
> -			return;
> -		}
> -		data_block = std::string("Vendor-Specific Video Data Block (") + name + ")";
> -		if (reverse)
> -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
> -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
> -		if (oui == 0x90848b)
> -			cta_hdr10plus(x + 4, length - 3);
> -		else if (oui == 0x00d046)
> -			cta_dolby_video(x + 4, length - 3);
> -		else
> -			hex_block("    ", x + 4, length - 3);
> -		return;
> -	case 0x02: cta_vesa_vdddb(x + 1, length); return;
> -	case 0x05: cta_colorimetry_block(x + 1, length); return;
> -	case 0x06: cta_hdr_static_metadata_block(x + 1, length); return;
> -	case 0x07: cta_hdr_dyn_metadata_block(x + 1, length); return;
> -	case 0x0d: cta_vfpdb(x + 1, length); return;
> -	case 0x0e: cta_svd(x + 1, length, true); return;
> -	case 0x0f: cta_y420cmdb(x + 1, length); return;
> -	case 0x11:
> -		if (length < 3) {
> -			data_block = std::string("Vendor-Specific Audio Data Block");
> -			fail("Invalid length %u < 3.\n", length);
> -			return;
> -		}
> -		oui = (x[3] << 16) + (x[2] << 8) + x[1];
> -		name = oui_name(oui);
> -		if (!name) {
> -			name = oui_name(oui, true);
> -			if (name)
> -				reverse = true;
> -		}
> -		if (!name) {
> -			printf("  Vendor-Specific Audio Data Block, OUI %s:\n",
> -			       ouitohex(oui).c_str());
> -			hex_block("    ", x + 4, length - 3);
> -			data_block.clear();
> -			warn("Unknown Extended Vendor-Specific Audio Data Block, OUI %s.\n",
> -			     ouitohex(oui).c_str());
> -			return;
> -		}
> -		data_block = std::string("Vendor-Specific Audio Data Block (") + name + ")";
> -		if (reverse)
> -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
> -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
> -		if (oui == 0x00d046)
> -			cta_dolby_audio(x + 4, length - 3);
> +		fail("Audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
> +
> +	tag |= ouinum;
> +	switch (tag) {
> +	case 0x001: cta_audio_block(x, length); break;
> +	case 0x002: cta_svd(x, length, false); break;
> +	case 0x003|kOUI_HDMI:
> +		cta_hdmi_block(x, length);
> +		// The HDMI OUI is present, so this EDID represents an HDMI
> +		// interface. And HDMI interfaces must use EDID version 1.3
> +		// according to the HDMI Specification, so check for this.
> +		if (base.edid_minor != 3)
> +			fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
> +				 base.edid_minor);
> +		break;
> +	case 0x003|kOUI_HDMIForum:
> +		if (cta.previous_cta_tag != (0x003|kOUI_HDMI))
> +			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
> +		if (cta.have_hf_scdb || cta.have_hf_vsdb)
> +			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
> +		cta_hf_scdb(x, length);
> +		cta.have_hf_vsdb = true;
> +		break;
> +	case 0x003|kOUI_AMD: cta_amd(x, length); break;
> +	case 0x003|kOUI_Microsoft:
> +		if (length == 0x12)
> +			cta_microsoft(x, length);
>  		else
> -			hex_block("    ", x + 4, length - 3);
> -		return;
> -	case 0x12: cta_hdmi_audio_block(x + 1, length); return;
> -	case 0x13: cta_rcdb(x + 1, length); return;
> -	case 0x14: cta_sldb(x + 1, length); return;
> -	case 0x20: cta_ifdb(x + 1, length); return;
> -	case 0x34: cta_displayid_type_7(x + 1, length); return;
> -	case 0x35: cta_displayid_type_8(x + 1, length); return;
> -	case 0x42: cta_displayid_type_10(x + 1, length); return;
> -	case 0x78:
> -		cta_hf_eeodb(x + 1, length);
> +			goto dohex;
> +		break;
> +	case 0x004: cta_sadb(x, length); break;
> +	case 0x005: cta_vesa_dtcdb(x, length); break;
> +	case 0x700: cta_vcdb(x, length); break;
> +	case 0x701|kOUI_HDR10: cta_hdr10plus(x, length); break;
> +	case 0x701|kOUI_Dolby: cta_dolby_video(x, length); break;
> +	case 0x702: cta_vesa_vdddb(x, length); break;
> +	case 0x705: cta_colorimetry_block(x, length); break;
> +	case 0x706: cta_hdr_static_metadata_block(x, length); break;
> +	case 0x707: cta_hdr_dyn_metadata_block(x, length); break;
> +	case 0x70d: cta_vfpdb(x, length); break;
> +	case 0x70e: cta_svd(x, length, true); break;
> +	case 0x70f: cta_y420cmdb(x, length); break;
> +	case 0x711|kOUI_Dolby: cta_dolby_audio(x, length); break;
> +	case 0x712: cta_hdmi_audio_block(x, length); break;
> +	case 0x713: cta_rcdb(x, length); break;
> +	case 0x714: cta_sldb(x, length); break;
> +	case 0x720: cta_ifdb(x, length); break;
> +	case 0x734: cta_displayid_type_7(x, length); break;
> +	case 0x735: cta_displayid_type_8(x, length); break;
> +	case 0x742: cta_displayid_type_10(x, length); break;
> +	case 0x778:
> +		cta_hf_eeodb(x, length);
>  		// This must be the first CTA-861 block
> -		if (!cta.first_block)
> +		if (cta.block_number > 0)
>  			fail("Block starts at a wrong offset.\n");
> -		return;
> -	case 0x79:
> -		if (!cta.last_block_was_hdmi_vsdb)
> +		break;
> +	case 0x779:
> +		if (cta.previous_cta_tag != (0x003|kOUI_HDMI))
>  			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB.\n");
>  		if (cta.have_hf_scdb || cta.have_hf_vsdb)
>  			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
>  		if (length < 2) {
>  			data_block = std::string("HDMI Forum SCDB");
>  			fail("Invalid length %u < 2.\n", length);
> -			return;
> -		}
> -		if (x[1] || x[2])
> -			printf("  Non-zero SCDB reserved fields!\n");
> -		cta_hf_scdb(x + 3, length - 2);
> -		cta.have_hf_scdb = 1;
> -		return;
> -	}
> -
> -	hex_block("    ", x + 1, length);
> -}
> -
> -void edid_state::cta_block(const unsigned char *x, bool duplicate)
> -{
> -	unsigned length = x[0] & 0x1f;
> -	const char *name;
> -	unsigned oui;
> -	bool reverse = false;
> -	bool audio_block = false;
> -
> -	switch ((x[0] & 0xe0) >> 5) {
> -	case 0x01:
> -		data_block = "Audio Data Block";
> -		printf("  %s:\n", data_block.c_str());
> -		cta_audio_block(x + 1, length);
> -		audio_block = true;
> -		break;
> -	case 0x02:
> -		data_block = "Video Data Block";
> -		printf("  %s:\n", data_block.c_str());
> -		cta_svd(x + 1, length, false);
> -		break;
> -	case 0x03:
> -		oui = (x[3] << 16) + (x[2] << 8) + x[1];
> -		name = oui_name(oui);
> -		if (!name) {
> -			name = oui_name(oui, true);
> -			if (name)
> -				reverse = true;
> -		}
> -		if (!name) {
> -			printf("  Vendor-Specific Data Block, OUI %s:\n", ouitohex(oui).c_str());
> -			hex_block("    ", x + 4, length - 3);
> -			data_block.clear();
> -			warn("Unknown Vendor-Specific Data Block, OUI %s.\n",
> -			     ouitohex(oui).c_str());
> -			return;
> -		}
> -		data_block = std::string("Vendor-Specific Data Block (") + name + ")";
> -		if (reverse)
> -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order\n").c_str());
> -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str());
> -		if (oui == 0x000c03) {
> -			cta_hdmi_block(x + 1, length);
> -			cta.last_block_was_hdmi_vsdb = 1;
> -			cta.first_block = 0;
> -			// The HDMI OUI is present, so this EDID represents an HDMI
> -			// interface. And HDMI interfaces must use EDID version 1.3
> -			// according to the HDMI Specification, so check for this.
> -			if (base.edid_minor != 3)
> -				fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n",
> -				     base.edid_minor);
> -			return;
> -		}
> -		if (oui == 0xc45dd8) {
> -			if (!cta.last_block_was_hdmi_vsdb)
> -				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n");
> -			if (cta.have_hf_scdb || cta.have_hf_vsdb)
> -				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
> -			cta_hf_scdb(x + 4, length - 3);
> -			cta.have_hf_vsdb = 1;
> -			break;
> -		}
> -		if (oui == 0x00001a) {
> -			cta_amd(x + 4, length - 3);
> -			break;
> -		}
> -		if (oui == 0xca125c && length == 0x15) {
> -			cta_microsoft(x + 4, length - 3);
>  			break;
>  		}
> -		hex_block("    ", x + 4, length - 3);
> -		break;
> -	case 0x04:
> -		data_block = "Speaker Allocation Data Block";
> -		printf("  %s:\n", data_block.c_str());
> -		cta_sadb(x + 1, length);
> -		audio_block = true;
> -		if (duplicate)
> -			fail("Only one instance of this Data Block is allowed.\n");
> -		break;
> -	case 0x05:
> -		data_block = "VESA Display Transfer Characteristics Data Block";
> -		printf("  %s:\n", data_block.c_str());
> -		cta_vesa_dtcdb(x + 1, length);
> -		if (duplicate)
> -			fail("Only one instance of this Data Block is allowed.\n");
> -		break;
> -	case 0x07:
> -		cta_ext_block(x + 1, length - 1, duplicate);
> -		break;
> -	default: {
> -		unsigned tag = (*x & 0xe0) >> 5;
> -		unsigned length = *x & 0x1f;
> -
> -		printf("  Unknown CTA-861 tag 0x%02x, length %u\n", tag, length);
> -		hex_block("    ", x + 1, length);
> -		data_block.clear();
> -		warn("Unknown CTA-861 Data Block %u.\n", tag);
> +		if (x[0] || x[1])
> +			printf("  Non-zero SCDB reserved fields!\n");
> +		cta_hf_scdb(x + 2, length - 2);
> +		cta.have_hf_scdb = true;
>  		break;
> +dohex:
> +	default:
> +		hex_block("    ", x, length);
> +		warn("Unknown block type: %s.\n", data_block.c_str());
>  	}
> -	}
> -
> -	// See Table 52 of CTA-861-G for a description of Byte 3
> -	if (audio_block && !(cta.byte3 & 0x40))
> -		fail("audio information is present, but bit 6 of Byte 3 of the CTA-861 Extension header indicates no Basic Audio support.\n");
> -	cta.first_block = 0;
> -	cta.last_block_was_hdmi_vsdb = 0;
> +	cta.block_number++;
> +	cta.previous_cta_tag = tag;
>  }
>  
>  void edid_state::preparse_cta_block(const unsigned char *x)
> @@ -2392,11 +2268,11 @@ void edid_state::parse_cta_block(const unsigned char *x)
>  //				msg(!cta.has_hdmi, "If YCbCr support is indicated, then both 4:2:2 and 4:4:4 %s be supported.\n",
>  //				    cta.has_hdmi ? "shall" : "should");
>  			printf("  Native detailed modes: %u\n", x[3] & 0x0f);
> -			if (cta.first_block)
> +			if (cta.block_number == 0)
>  				cta.byte3 = x[3];
>  			else if (x[3] != cta.byte3)
>  				fail("Byte 3 must be the same for all CTA-861 Extension Blocks.\n");
> -			if (cta.first_block) {
> +			if (cta.block_number == 0) {
>  				unsigned native_dtds = x[3] & 0x0f;
>  
>  				cta.native_timings.clear();
> diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
> index 5c81294..ff7a6db 100644
> --- a/parse-displayid-block.cpp
> +++ b/parse-displayid-block.cpp
> @@ -1609,13 +1609,230 @@ void edid_state::preparse_displayid_block(const unsigned char *x)
>  	}
>  }
>  
> +#define data_block_o(n, a, b) data_block_oui(n, x + 3, len, tag == 0, &ouinum, a, b)
> +
> +unsigned edid_state::displayid_block(const unsigned version, const unsigned char *x, unsigned length)
> +{
> +	unsigned i;
> +	unsigned tag = x[0];
> +	unsigned ouinum = 0;
> +	unsigned len = (length < 3) ? 0 : x[2];
> +
> +	switch (tag) {
> +	// DisplayID 1.3:
> +	case 0x00: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", true, false); ouinum = 0; break;
> +	case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
> +	case 0x02: data_block = "Color Characteristics Data Block"; break;
> +	case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
> +	case 0x04: data_block = "Video Timing Modes Type 2 - Detailed Timings Data Block"; break;
> +	case 0x05: data_block = "Video Timing Modes Type 3 - Short Timings Data Block"; break;
> +	case 0x06: data_block = "Video Timing Modes Type 4 - DMT Timings Data Block"; break;
> +	case 0x07: data_block = "Supported Timing Modes Type 1 - VESA DMT Timings Data Block"; break;
> +	case 0x08: data_block = "Supported Timing Modes Type 2 - CTA-861 Timings Data Block"; break;
> +	case 0x09: data_block = "Video Timing Range Data Block"; break;
> +	case 0x0a: data_block = "Product Serial Number Data Block"; break;
> +	case 0x0b: data_block = "GP ASCII String Data Block"; break;
> +	case 0x0c: data_block = "Display Device Data Data Block"; break;
> +	case 0x0d: data_block = "Interface Power Sequencing Data Block"; break;
> +	case 0x0e: data_block = "Transfer Characteristics Data Block"; break;
> +	case 0x0f: data_block = "Display Interface Data Block"; break;
> +	case 0x10: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
> +	case 0x11: data_block = "Video Timing Modes Type 5 - Short Timings Data Block"; break;
> +	case 0x12: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
> +	case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
> +	// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
> +	// DisplayID 2.0
> +	case 0x20: data_block_o("Product Identification Data Block (" + utohex(tag) + ")", false, false); ouinum = 0; break;
> +	case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
> +	case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
> +	case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
> +	case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
> +	case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
> +	case 0x26: data_block = "Display Interface Features Data Block"; break;
> +	case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
> +	case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
> +	case 0x29: data_block = "ContainerID Data Block"; break;
> +	case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
> +	// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
> +	case 0x7e: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", false, true); break; // DisplayID 2.0
> +	case 0x7f: data_block_o("Vendor-Specific Data Block (" + utohex(tag) + ")", true, false); break; // DisplayID 1.3
> +	// 0x80 RESERVED
> +	case 0x81: data_block = "CTA-861 DisplayID Data Block (" + utohex(tag) + ")"; break;
> +	// 0x82 .. 0xff RESERVED
> +	default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
> +	}
> +
> +	if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
> +		fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
> +			 version >> 4, version & 0xf);
> +	if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
> +		fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
> +			 version >> 4, version & 0xf);
> +
> +	if (length < 3) {
> +		// report a problem when the remaining bytes are not 0.
> +		if (tag || (length > 1 && x[1])) {
> +			fail("Not enough bytes remain (%d) for a DisplayID data block and the DisplayID filler is non-0.\n", length);
> +		}
> +		return length;
> +	}
> +
> +	unsigned block_rev = x[1] & 0x07;
> +
> +	if (length < len + 3) {
> +		fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d)\n", len + 3, length);
> +		return length;
> +	}
> +
> +	if (!tag && !len) {
> +		// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
> +		if (!memchk(x, length)) {
> +			fail("Non-0 filler bytes in the DisplayID block.\n");
> +		}
> +		return length;
> +	}
> +
> +	printf("  %s:\n", data_block.c_str());
> +
> +	tag |= ouinum;
> +	switch (tag) {
> +	case 0x00: parse_displayid_product_id(x); break;
> +	case 0x01: parse_displayid_parameters(x); break;
> +	case 0x02: parse_displayid_color_characteristics(x); break;
> +	case 0x03:
> +		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
> +		   for (i = 0; i < len / 20; i++)
> +			   parse_displayid_type_1_7_timing(&x[3 + (i * 20)], false, block_rev);
> +		   break;
> +	case 0x04:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < len / 11; i++)
> +			   parse_displayid_type_2_timing(&x[3 + (i * 11)]);
> +		   break;
> +	case 0x05:
> +		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
> +		   for (i = 0; i < len / 3; i++)
> +			   parse_displayid_type_3_timing(&x[3 + (i * 3)]);
> +		   break;
> +	case 0x06:
> +		   check_displayid_datablock_revision(x[1], 0xc0, 1);
> +		   for (i = 0; i < len; i++)
> +			   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6, x[3 + i]);
> +		   break;
> +	case 0x07:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < min(len, 10) * 8; i++)
> +			   if (x[3 + i / 8] & (1 << (i % 8))) {
> +				   char type[16];
> +				   sprintf(type, "DMT 0x%02x", i + 1);
> +				   print_timings("    ", find_dmt_id(i + 1), type);
> +			   }
> +		   break;
> +	case 0x08:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < min(len, 8) * 8; i++)
> +			   if (x[3 + i / 8] & (1 << (i % 8))) {
> +				   char type[16];
> +				   sprintf(type, "VIC %3u", i + 1);
> +				   print_timings("    ", find_vic_id(i + 1), type);
> +			   }
> +		   break;
> +	case 0x09: parse_displayid_video_timing_range_limits(x); break;
> +	case 0x0a:
> +	case 0x0b: parse_displayid_string(x); break;
> +	case 0x0c: parse_displayid_display_device(x); break;
> +	case 0x0d: parse_displayid_intf_power_sequencing(x); break;
> +	case 0x0e: parse_displayid_transfer_characteristics(x); break;
> +	case 0x0f: parse_displayid_display_intf(x); break;
> +	case 0x10: parse_displayid_stereo_display_intf(x); break;
> +	case 0x11:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < len / 7; i++)
> +			   parse_displayid_type_5_timing(&x[3 + (i * 7)]);
> +		   break;
> +	case 0x12: parse_displayid_tiled_display_topology(x, false); break;
> +	case 0x13:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < len; i += (x[3 + i + 2] & 0x40) ? 17 : 14)
> +			   parse_displayid_type_6_timing(&x[3 + i]);
> +		   break;
> +	case 0x20: parse_displayid_product_id(x); break;
> +	case 0x21:
> +		   if (block_rev >= 1)
> +			   check_displayid_datablock_revision(x[1], 0x80, 1);
> +		   else
> +			   check_displayid_datablock_revision(x[1], 0x80, 0);
> +		   parse_displayid_parameters_v2(x, block_rev);
> +		   break;
> +	case 0x22: {
> +		   unsigned sz = 20;
> +
> +		   if (block_rev >= 2)
> +			   check_displayid_datablock_revision(x[1], 0x08, 2);
> +		   else if (block_rev == 1)
> +			   check_displayid_datablock_revision(x[1], 0x08, 1);
> +		   else
> +			   check_displayid_datablock_revision(x[1]);
> +		   sz += (x[1] & 0x70) >> 4;
> +		   if (block_rev >= 1 && (x[1] & 0x08))
> +			   printf("    These timings support DSC pass-through\n");
> +		   for (i = 0; i < len / sz; i++)
> +			   parse_displayid_type_1_7_timing(&x[3 + i * sz], true, block_rev);
> +		   break;
> +	}
> +	case 0x23:
> +		   if (block_rev)
> +			   check_displayid_datablock_revision(x[1], 0xe8, 1);
> +		   else
> +			   check_displayid_datablock_revision(x[1], 0xc8);
> +		   if (x[1] & 0x08) {
> +			   for (i = 0; i < len / 2; i++)
> +				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
> +								   x[3 + i * 2] |
> +								   (x[4 + i * 2] << 8));
> +		   } else {
> +			   for (i = 0; i < len; i++)
> +				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
> +								   x[3 + i]);
> +		   }
> +		   break;
> +	case 0x24:
> +		   check_displayid_datablock_revision(x[1]);
> +		   for (i = 0; i < len / 6; i++)
> +			   parse_displayid_type_9_timing(&x[3 + i * 6]);
> +		   break;
> +	case 0x25: parse_displayid_dynamic_video_timings_range_limits(x); break;
> +	case 0x26: parse_displayid_interface_features(x); break;
> +	case 0x27: parse_displayid_stereo_display_intf(x); break;
> +	case 0x28: parse_displayid_tiled_display_topology(x, true); break;
> +	case 0x29: parse_displayid_ContainerID(x); break;
> +	case 0x32: {
> +		   unsigned sz = 6 + ((x[1] & 0x70) >> 4);
> +
> +		   check_displayid_datablock_revision(x[1], 0x70);
> +		   for (i = 0; i < len / sz; i++)
> +			   parse_displayid_type_10_timing(&x[3 + i * sz], sz);
> +		   break;
> +	}
> +	case 0x81: parse_displayid_cta_data_block(x); break;
> +	case 0x7e|kOUI_VESA: parse_displayid_vesa(x); break;
> +	default: hex_block("    ", x + 3 + (ouinum ? 3 : 0), len - (ouinum ? 3 : 0)); break;
> +	}
> +
> +	if ((tag == 0x00 || tag == 0x20) &&
> +		(!dispid.is_base_block || dispid.block_number > 0))
> +		fail("%s is required to be the first DisplayID Data Block.\n",
> +			 data_block.c_str());
> +	dispid.block_number++;
> +	return len + 3;
> +}
> +
>  void edid_state::parse_displayid_block(const unsigned char *x)
>  {
>  	unsigned version = x[1];
>  	unsigned length = x[2];
>  	unsigned prod_type = x[3]; // future check: based on type, check for required data blocks
>  	unsigned ext_count = x[4];
> -	unsigned i;
>  
>  	printf("  Version: %u.%u\n  Extension Count: %u\n",
>  	       version >> 4, version & 0xf, ext_count);
> @@ -1647,246 +1864,10 @@ void edid_state::parse_displayid_block(const unsigned char *x)
>  		length = 121;
>  	}
>  
> -	unsigned offset = 5;
> -	bool first_data_block = true;
> -	while (length > 0) {
> -		unsigned tag = x[offset];
> -		unsigned oui = 0;
> -
> -		switch (tag) {
> -		// DisplayID 1.3:
> -		case 0x00: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
> -		case 0x01: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
> -		case 0x02: data_block = "Color Characteristics Data Block"; break;
> -		case 0x03: data_block = "Video Timing Modes Type 1 - Detailed Timings Data Block"; break;
> -		case 0x04: data_block = "Video Timing Modes Type 2 - Detailed Timings Data Block"; break;
> -		case 0x05: data_block = "Video Timing Modes Type 3 - Short Timings Data Block"; break;
> -		case 0x06: data_block = "Video Timing Modes Type 4 - DMT Timings Data Block"; break;
> -		case 0x07: data_block = "Supported Timing Modes Type 1 - VESA DMT Timings Data Block"; break;
> -		case 0x08: data_block = "Supported Timing Modes Type 2 - CTA-861 Timings Data Block"; break;
> -		case 0x09: data_block = "Video Timing Range Data Block"; break;
> -		case 0x0a: data_block = "Product Serial Number Data Block"; break;
> -		case 0x0b: data_block = "GP ASCII String Data Block"; break;
> -		case 0x0c: data_block = "Display Device Data Data Block"; break;
> -		case 0x0d: data_block = "Interface Power Sequencing Data Block"; break;
> -		case 0x0e: data_block = "Transfer Characteristics Data Block"; break;
> -		case 0x0f: data_block = "Display Interface Data Block"; break;
> -		case 0x10: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
> -		case 0x11: data_block = "Video Timing Modes Type 5 - Short Timings Data Block"; break;
> -		case 0x12: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
> -		case 0x13: data_block = "Video Timing Modes Type 6 - Detailed Timings Data Block"; break;
> -		// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
> -		// DisplayID 2.0
> -		case 0x20: data_block = "Product Identification Data Block (" + utohex(tag) + ")"; break;
> -		case 0x21: data_block = "Display Parameters Data Block (" + utohex(tag) + ")"; break;
> -		case 0x22: data_block = "Video Timing Modes Type 7 - Detailed Timings Data Block"; break;
> -		case 0x23: data_block = "Video Timing Modes Type 8 - Enumerated Timing Codes Data Block"; break;
> -		case 0x24: data_block = "Video Timing Modes Type 9 - Formula-based Timings Data Block"; break;
> -		case 0x25: data_block = "Dynamic Video Timing Range Limits Data Block"; break;
> -		case 0x26: data_block = "Display Interface Features Data Block"; break;
> -		case 0x27: data_block = "Stereo Display Interface Data Block (" + utohex(tag) + ")"; break;
> -		case 0x28: data_block = "Tiled Display Topology Data Block (" + utohex(tag) + ")"; break;
> -		case 0x29: data_block = "ContainerID Data Block"; break;
> -		case 0x32: data_block = "Video Timing Modes Type 10 - Formula-based Timings Data Block"; break;
> -		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
> -		case 0x7e: // DisplayID 2.0
> -		case 0x7f: // DisplayID 1.3
> -			if ((tag == 0x7e && version >= 0x20) ||
> -			    (tag == 0x7f && version < 0x20)) {
> -				oui = (x[offset + 3] << 16) + (x[offset + 4] << 8) + x[offset + 5];
> -				const char *name = oui_name(oui);
> -				bool reversed = false;
> -
> -				if (!name) {
> -					name = oui_name(oui, true);
> -					if (name)
> -						reversed = true;
> -				}
> -				if (name)
> -					data_block = std::string("Vendor-Specific Data Block (") + name + ")";
> -				else
> -					data_block = "Vendor-Specific Data Block, OUI " + ouitohex(oui);
> -				if (reversed)
> -					fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byte order.\n").c_str());
> -			} else {
> -				data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")";
> -			}
> -			break;
> -		// 0x80 RESERVED
> -		case 0x81: data_block = "CTA-861 DisplayID Data Block (" + utohex(tag) + ")"; break;
> -		// 0x82 .. 0xff RESERVED
> -		default:   data_block = "Unknown DisplayID Data Block (" + utohex(tag) + ")"; break;
> -		}
> -
> -		if (version >= 0x20 && (tag < 0x20 || tag == 0x7f))
> -			fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
> -			     version >> 4, version & 0xf);
> -		if (version < 0x20 && tag >= 0x20 && tag <= 0x7e)
> -			fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
> -			     version >> 4, version & 0xf);
> -
> -		if (length < 3) {
> -			// report a problem when the remaining bytes are not 0.
> -			if (tag || x[offset + 1]) {
> -				fail("Not enough bytes remain (%d) for a DisplayID data block or the DisplayID filler is non-0.\n", length);
> -			}
> -			break;
> -		}
> -
> -		unsigned block_rev = x[offset + 1] & 0x07;
> -		unsigned len = x[offset + 2];
> -
> -		if (length < len + 3) {
> -			fail("The length of this DisplayID data block (%d) exceeds the number of bytes remaining (%d).\n", len + 3, length);
> -			break;
> -		}
> -
> -		if (!tag && !len) {
> -			// A Product Identification Data Block with no payload bytes is not valid - assume this is the end.
> -			if (!memchk(x + offset, length)) {
> -				fail("Non-0 filler bytes in the DisplayID block.\n");
> -			}
> -			break;
> -		}
> -
> -		printf("  %s:\n", data_block.c_str());
> -
> -		switch (tag) {
> -		case 0x00: parse_displayid_product_id(x + offset); break;
> -		case 0x01: parse_displayid_parameters(x + offset); break;
> -		case 0x02: parse_displayid_color_characteristics(x + offset); break;
> -		case 0x03:
> -			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
> -			   for (i = 0; i < len / 20; i++)
> -				   parse_displayid_type_1_7_timing(&x[offset + 3 + (i * 20)], false, block_rev);
> -			   break;
> -		case 0x04:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < len / 11; i++)
> -				   parse_displayid_type_2_timing(&x[offset + 3 + (i * 11)]);
> -			   break;
> -		case 0x05:
> -			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev & 1);
> -			   for (i = 0; i < len / 3; i++)
> -				   parse_displayid_type_3_timing(&x[offset + 3 + (i * 3)]);
> -			   break;
> -		case 0x06:
> -			   check_displayid_datablock_revision(x[offset + 1], 0xc0, 1);
> -			   for (i = 0; i < len; i++)
> -				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6, x[offset + 3 + i]);
> -			   break;
> -		case 0x07:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < min(len, 10) * 8; i++)
> -				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
> -					   char type[16];
> -					   sprintf(type, "DMT 0x%02x", i + 1);
> -					   print_timings("    ", find_dmt_id(i + 1), type);
> -				   }
> -			   break;
> -		case 0x08:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < min(len, 8) * 8; i++)
> -				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
> -					   char type[16];
> -					   sprintf(type, "VIC %3u", i + 1);
> -					   print_timings("    ", find_vic_id(i + 1), type);
> -				   }
> -			   break;
> -		case 0x09: parse_displayid_video_timing_range_limits(x + offset); break;
> -		case 0x0a:
> -		case 0x0b: parse_displayid_string(x + offset); break;
> -		case 0x0c: parse_displayid_display_device(x + offset); break;
> -		case 0x0d: parse_displayid_intf_power_sequencing(x + offset); break;
> -		case 0x0e: parse_displayid_transfer_characteristics(x + offset); break;
> -		case 0x0f: parse_displayid_display_intf(x + offset); break;
> -		case 0x10: parse_displayid_stereo_display_intf(x + offset); break;
> -		case 0x11:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < len / 7; i++)
> -				   parse_displayid_type_5_timing(&x[offset + 3 + (i * 7)]);
> -			   break;
> -		case 0x12: parse_displayid_tiled_display_topology(x + offset, false); break;
> -		case 0x13:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < len; i += (x[offset + 3 + i + 2] & 0x40) ? 17 : 14)
> -				   parse_displayid_type_6_timing(&x[offset + 3 + i]);
> -			   break;
> -		case 0x20: parse_displayid_product_id(x + offset); break;
> -		case 0x21:
> -			   if (block_rev >= 1)
> -				   check_displayid_datablock_revision(x[offset + 1], 0x80, 1);
> -			   else
> -				   check_displayid_datablock_revision(x[offset + 1], 0x80, 0);
> -			   parse_displayid_parameters_v2(x + offset, block_rev);
> -			   break;
> -		case 0x22: {
> -			   unsigned sz = 20;
> -
> -			   if (block_rev >= 2)
> -				   check_displayid_datablock_revision(x[offset + 1], 0x08, 2);
> -			   else if (block_rev == 1)
> -				   check_displayid_datablock_revision(x[offset + 1], 0x08, 1);
> -			   else
> -				   check_displayid_datablock_revision(x[offset + 1]);
> -			   sz += (x[offset + 1] & 0x70) >> 4;
> -			   if (block_rev >= 1 && (x[offset + 1] & 0x08))
> -				   printf("    These timings support DSC pass-through\n");
> -			   for (i = 0; i < len / sz; i++)
> -				   parse_displayid_type_1_7_timing(&x[offset + 3 + i * sz], true, block_rev);
> -			   break;
> -		}
> -		case 0x23:
> -			   if (block_rev)
> -				   check_displayid_datablock_revision(x[offset + 1], 0xe8, 1);
> -			   else
> -				   check_displayid_datablock_revision(x[offset + 1], 0xc8);
> -			   if (x[offset + 1] & 0x08) {
> -				   for (i = 0; i < len / 2; i++)
> -					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
> -									   x[offset + 3 + i * 2] |
> -									   (x[offset + 4 + i * 2] << 8));
> -			   } else {
> -				   for (i = 0; i < len; i++)
> -					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
> -									   x[offset + 3 + i]);
> -			   }
> -			   break;
> -		case 0x24:
> -			   check_displayid_datablock_revision(x[offset + 1]);
> -			   for (i = 0; i < len / 6; i++)
> -				   parse_displayid_type_9_timing(&x[offset + 3 + i * 6]);
> -			   break;
> -		case 0x25: parse_displayid_dynamic_video_timings_range_limits(x + offset); break;
> -		case 0x26: parse_displayid_interface_features(x + offset); break;
> -		case 0x27: parse_displayid_stereo_display_intf(x + offset); break;
> -		case 0x28: parse_displayid_tiled_display_topology(x + offset, true); break;
> -		case 0x29: parse_displayid_ContainerID(x + offset); break;
> -		case 0x32: {
> -			   unsigned sz = 6 + ((x[offset + 1] & 0x70) >> 4);
> -
> -			   check_displayid_datablock_revision(x[offset + 1], 0x70);
> -			   for (i = 0; i < len / sz; i++)
> -				   parse_displayid_type_10_timing(&x[offset + 3 + i * sz], sz);
> -			   break;
> -		}
> -		case 0x81: parse_displayid_cta_data_block(x + offset); break;
> -		case 0x7e:
> -			if (oui == 0x3a0292) {
> -				parse_displayid_vesa(x + offset);
> -				break;
> -			}
> -			// fall-through
> -		default: hex_block("    ", x + offset + 3, len); break;
> -		}
> -
> -		if ((tag == 0x00 || tag == 0x20) &&
> -		    (!dispid.is_base_block || !first_data_block))
> -			fail("%s is required to be the first DisplayID Data Block.\n",
> -			     data_block.c_str());
> -		length -= len + 3;
> -		offset += len + 3;
> -		first_data_block = false;
> +	unsigned len;
> +	for (const unsigned char *y = x + 5; length > 0; y += len) {
> +		len = displayid_block(version, y, length);
> +		length -= len;
>  	}
>  
>  	/*
> 


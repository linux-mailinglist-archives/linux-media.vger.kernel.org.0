Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EC540D5F0
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 11:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbhIPJRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 05:17:45 -0400
Received: from omta001.cacentral1.a.cloudfilter.net ([3.97.99.32]:33068 "EHLO
        omta001.cacentral1.a.cloudfilter.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237255AbhIPJRR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 05:17:17 -0400
Received: from shw-obgw-4002a.ext.cloudfilter.net ([10.228.9.250])
        by cmsmtp with ESMTP
        id QXjXmOYF8czbLQnUomuYeD; Thu, 16 Sep 2021 09:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shaw.ca; s=s20180605;
        t=1631783754; bh=pJ+NrCAxx/pYlnLo4WXBY3cpOD9xfTyOFBfkQheOeSs=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=I0MGBo85QQ2AyzT+bvTAW2miJ24DUhbJ6M89PprJ0pWxgE73Mlc/RGjg6z9HqYFic
         eFzVbiv3mBAXdZCaIE/7XZnRkSqlyVZvbhxY5k1+kHZMG/tWMsXQXakZ4EWiwU98ba
         IOOqtos5F8YD2st2gQRKcTNSbjX+SgKPH0qaun1D3gubmviuZ1giD9RygFvdfWmg+0
         19Y8oZIbPUPNcuMHI67IyVE5T8RuDjG7bUEUPHhZjtyUFAuNx6sBprnCwN7YFa1cSO
         lSzV+cay3u4ceAOXaCoaTNd1Fy14cKbNFmVx+Xmts55ccJ5wMJ8/ie6MIVBEnpXF02
         XqK7qE+XzkzZA==
Received: from [192.168.0.100] ([70.71.78.228])
        by cmsmtp with ESMTPA
        id QnUmm6g8bxCNkQnUnmxyfz; Thu, 16 Sep 2021 09:15:54 +0000
Authentication-Results: ; auth=pass (LOGIN) smtp.auth=joevt@shaw.ca
X-Authority-Analysis: v=2.4 cv=Xe/qcK15 c=1 sm=1 tr=0 ts=61430b4a
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=IkcTkHD0fZMA:10 a=xOd6jRPJAAAA:8 a=_Dj-zB-qAAAA:8 a=o83nqyVRAAAA:8
 a=dw0t6H4-AAAA:8 a=ZtgMAFTjaNzNEOVXb5UA:9 a=QEXdDO2ut3YA:10 a=OfxEP1nZo_MA:10
 a=BvQNaqepJnAA:10 a=p2IOnBAzwV8vXciPbnnL:22 a=c-cOe7UV8MviEfHuAVEQ:22
 a=wVJa4CU9-Z26yuRAZDil:22
User-Agent: Microsoft-MacOutlook/16.53.21091200
Date:   Thu, 16 Sep 2021 02:15:51 -0700
Subject: Re: [PATCH 11/11] edid-decode: cta and displayid changes
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <A845376A-2C4A-426E-A1E0-2199D49F07B1@shaw.ca>
Thread-Topic: [PATCH 11/11] edid-decode: cta and displayid changes
References: <20210914121129.51451-1-joevt@shaw.ca>
 <20210914121129.51451-12-joevt@shaw.ca>
 <ea0945c8-020c-4b3b-56be-4d197d606900@xs4all.nl>
In-Reply-To: <ea0945c8-020c-4b3b-56be-4d197d606900@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4xfHdyxS5qEOQZP5L3P60MXHJX5g8XccesghXDicM/EbdZ7xhlr65xpwulpERY87I7HVOIiPqNcUyUJROhJ0UD287pWcXpaLpie7QcB36SEafG0R42pLJO
 Ct189EiHPhen56N/MgarWMzLL8BfVybmWN2nmmprRRCHp4++AtZ9AA/YxWPVCF6HVXbTTEHQZuNNbDCzzS2zwECodHzhVjkpwrjrL43+2aXP3HBdNpnPKqfx
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1) Regarding large changes:
I will try making smaller changes with commits that build on each other. Gi=
t is good for code changes but not for code moving/rearranging. Many of the =
changes don't actually change anything (wanting to keep the output the same =
as before). Some fixes are easier to apply after doing the rearranging so I'=
ll think about what order to make each change.


2) Regarding code reduction:
The code reduction for cta tag parsing (288 lines originally) is 43%. Not i=
nsignificant.
The code reduction for displayid tag parsing (241 lines originally) is 8% w=
hich is not as much (no extended tags and only one oui), but it's nice that =
it's arranged like cta tag parsing.


3) Regarding ugly lines:
The ugly lines were because of hex_block issues discussed in [PATCH 07/11].=
 What you should see (when hex_block is working properly) is something like =
this:

  Unknown CTA-861 Data Block (tag 0x00):
WARN: Unknown block type: Unknown CTA-861 Data Block (tag 0x00).

The warning is "Unknown block type: %s\n" where %s is the block type which =
is determined in the first switch statement.

Here's an example from _EDID_BNQ_802e with non-zero length hex:
Before patches:

  Unknown CTA-861 tag 0x00, length 5
    c0 00 e6 06 05                                  '.....'
WARN: Unknown CTA-861 Data Block 0.

Length is unnecessary since you can just count the hex bytes.
Block 0 sounds like it's referring to block index 0 instead of block tag 0x=
00.
After all patches:

  Unknown CTA-861 Data Block (tag 0x00):
    c0 00 e6 06 05                                  '.....'
WARN: Unknown block type: Unknown CTA-861 Data Block (tag 0x00).

With these changes, we have a consistent naming scheme for the block type (=
having " Data Block" suffix and adding tag in cases where the name is not en=
ough to determine the tag) and the warning refers to that block type. Might =
be better if the warning comes after the block type instead of after the hex=
.


4) Regarding the NVIDIA oui:
You are saying that only blocks with an invalid tag should have the unknown=
 block type warning. Not knowing how to parse a tag/oui should not be the ca=
use of a warning. I can agree with that. If the user sees only hex then they=
 know that edid-decode doesn't know how to decode it.



=EF=BB=BFOn 2021-09-15, 6:37 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    On 14/09/2021 14:11, joevt wrote:
    > Goal: make OUI blocks equal to normal blocks to simplify decoding and=
 make handling of all types of blocks consistent. This will reduce duplicate=
d code (only one place for checking duplicate blocks, only one place for han=
dling unknown blocks, etc.)
    >=20
    > oui.h
    > - This contains a list of OUI and CID and PNP values.
    > - It is included in various places with varying definitions of the on=
eoui macro.
    >=20
    > edid-decode.h
    > - Add list of OUI constants using oui.h.
    > - Other changes described below.
    >=20
    > parse-cta-block.cpp
    > - Modified oui_name. Returns a name and a number for a OUI.
    > - Added data_block_oui. For data blocks with an OUI, does size check,=
 OUI endianness check, and PNP vs OUI check. Returns a value representing th=
e OUI (if it is known).
    > - Modify cta_block. Reduce code by flattening the switch statement. T=
his means constructing a case value from three values.
    >   Side effects include making reporting of "Only one instance of this=
 Data Block is allowed." more consistant (always report this fail after the =
block type is output instead of sometimes before and sometimes after). See e=
xample acer-xv273k-dp2-corrupted.
    >   First, get the extended type and append it to the tag type (i.e. ad=
d 0x700 if extended), then get the OUI if it's vendor specific, and convert =
it to a number that can be appended (bitwise or) to the tag/extended type va=
lue.
    > 	- Init static variables
    > 	- Replace last_block_was_hdmi_vsdb with previous_cta_tag; this means=
 instead of remembering if the last block was hdmi vsdb, we just remember th=
e previous block's tag.
    > 	- Replace first_block with cta_block_number; this means instead of r=
emembering if this is the first block or not, we just remember the current b=
lock number.
    > 	- Remove name and oui, we'll just get the data_block string and a ou=
i index directly.
    > 	- Report OUI for extended tag 11h (Vendor-Specific Audio Data Block)
    > 	- Fix capitalization of "Audio information is present" fail message.
    > 	- Add bounds check on length field (must be at least 1 for extended =
tags).
    > 	- Don't parse after OUI if there's not enough length for OUI.
    > 	- Adjust x offsets in cta_hdmi_block so it is like other OUI extende=
d blocks such that x points to after the OUI.
    > 	- A block that outputs only hex is reported as an unknown block type=
 even if we know the OUI. See example acer-xb321hk-dp.
    >=20
    > parse-disableid-block.cpp
    > - Add displayid_block to do a single data block - like cta_block does=
 for cta extension block
    > 	- Vendor specific data block for DisplayID 1.3 is assumed to be PNP =
(string order). See example apple-macbookpro-16inch-2019.
    > 	- Vendor specific data block for DisplayID 2.0 is assumed to have OU=
I (little endian).
    > 	- Interpret Vendor specific data block 0x7e or 0x7f even if DisplayI=
D is not correct for that type (there's already a FAIL message to identify t=
he problem). See example apple-xdr-6k.
    > 	- Add bounds check: if length is < 3, only check x[1] if length is 2=
.
    > 	  Don't report "Not enough bytes remain (1) for a DisplayID data blo=
ck or the DisplayID filler is non-0." if the bytes are zero (also change the=
 word "or" to "and"). See example apple-xdr-6k-tile0.
    > 	- Report datablock name before failing.
    > 	- For unknown vendor specific data blocks, don't output the OUI part=
 as hex since the new data_block_oui function has already reported it. See e=
xample apple-macbookpro-16inch-2019.
    > 	- Replace first_data_block with disp.block_number

    I've decided not to merge this patch. It does too many things at the sa=
me time,
    so it really should be split up into smaller pieces.

    I'm also getting ugly lines like this:

    Unknown CTA-861 Data Block (tag 0x00): Unknown block type: Unknown CTA-=
861 Data Block (tag 0x00).

    or this:

    Vendor-Specific Data Block (NVIDIA), OUI 00-04-4B: Unknown block type: =
Vendor-Specific Data Block (NVIDIA),
    OUI 00-04-4B.

    (which shouldn't be a warning anyway)

    >=20
    > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
    > ---
    >  edid-decode.cpp           |  99 ++++++--
    >  edid-decode.h             |  20 +-
    >  oui.h                     |  20 ++
    >  parse-cta-block.cpp       | 456 ++++++++++++++----------------------=
-
    >  parse-displayid-block.cpp | 463 ++++++++++++++++++------------------=
--
    >  5 files changed, 505 insertions(+), 553 deletions(-)

    While it does reduce the code size a bit, it really isn't by all that m=
uch,
    so I am not convinced that all the churn is worth it.

    If this is split up into first fixes and small improvements, and then r=
ework
    the tag handling, then I can take another look at whether it makes sens=
e to
    apply this.

    I've applied patches 1, 2, 3, 4, 6, 8, 9 and 10. The others need more w=
ork.

    Regards,

    	Hans

    >  create mode 100644 oui.h
    >=20
    > diff --git a/edid-decode.cpp b/edid-decode.cpp
    > index 0c83e0e..ed3223d 100644
    > --- a/edid-decode.cpp
    > +++ b/edid-decode.cpp
    > @@ -657,25 +657,90 @@ std::string utohex(unsigned char x)
    >  	return buf;
    >  }
    > =20
    > -const char *oui_name(unsigned oui, bool reverse)
    > +const char *oui_name(unsigned oui, unsigned *ouinum)
    >  {
    > -	if (reverse)
    > -		oui =3D (oui >> 16) | (oui & 0xff00) | ((oui & 0xff) << 16);
    > -
    > +	unsigned ouinumscratch;
    > +	if (!ouinum) ouinum =3D &ouinumscratch;
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
    > +		#define oneoui(c,k,n) case c: *ouinum =3D kOUI_##k; name =3D n; break;
    > +		#include "oui.h"
    > +		default: *ouinum =3D 0; name =3D NULL;
    > +	}
    > +	return name;
    > +}
    > +
    > +void edid_state::data_block_oui(std::string block_name, const unsign=
ed char *x, unsigned length, bool ignorezeros, unsigned *ouinum, bool do_asc=
ii, bool big_endian)
    > +{
    > +	std::string buf;
    > +	char ascii[4];
    > +	unsigned oui;
    > +	const char *ouiname =3D NULL;
    > +	bool matched_reverse =3D false;
    > +	bool matched_ascii =3D false;
    > +	bool valid_ascii =3D false;
    > +
    > +	if (big_endian)
    > +		oui =3D ((length > 0 ? x[0] : 0) << 16) + ((length > 1 ? x[1] : 0) <=
< 8) + (length > 2 ? x[2] : 0);
    > +	else
    > +		oui =3D ((length > 2 ? x[2] : 0) << 16) + ((length > 1 ? x[1] : 0) <=
< 8) + (length > 0 ? x[0] : 0);
    > +
    > +	buf =3D ouitohex(oui);
    > +	if (length < 3) {
    > +		sprintf(ascii, "?"); // some characters are null
    > +		if (ouinum) *ouinum =3D 0; // doesn't match a known OUI
    > +	} else {
    > +		valid_ascii =3D (x[0] >=3D 'A' && x[1] >=3D 'A' && x[2] >=3D 'A' && x[0] <=
=3D 'Z' && x[1] <=3D 'Z' && x[2] <=3D 'Z');
    > +		sprintf(ascii, "%c%c%c", x[0], x[1], x[2]);
    > +
    > +		ouiname =3D oui_name(oui, ouinum);
    > +		if (!ouiname) {
    > +			big_endian =3D !big_endian;
    > +			unsigned reversedoui =3D ((oui & 0xff) << 16) + (oui & 0x00ff00) + =
(oui >> 16);
    > +			ouiname =3D oui_name(reversedoui, ouinum);
    > +			if (ouiname) {
    > +				oui =3D reversedoui;
    > +				buf =3D ouitohex(oui);
    > +				matched_reverse =3D true;
    > +			}
    > +			else if (do_ascii && valid_ascii)
    > +			{
    > +				unsigned asciioui =3D (x[0] << 24) + (x[1] << 16) + (x[2] << 8);
    > +				ouiname =3D oui_name(asciioui, ouinum);
    > +				if (ouiname) {
    > +					matched_ascii =3D true;
    > +				}
    > +			}
    > +		}
    > +	}
    > +
    > +	std::string name;
    > +	if (ouiname) {
    > +		if (matched_ascii)
    > +			name =3D block_name + " (" + ouiname + ")" + ", PNP ID '" + ascii +=
 "'";
    > +		else
    > +			name =3D block_name + " (" + ouiname + ")" + ", OUI " + buf;
    > +	} else if (do_ascii && valid_ascii) {
    > +		name =3D block_name + ", PNP ID '" + ascii + "'";
    > +	} else {
    > +		name =3D block_name + ", OUI " + buf;
    > +	}
    > +	// assign string to data_block before outputting errors
    > +	data_block =3D name;
    > +	
    > +	if (oui || !ignorezeros) {
    > +		if (length < 3)
    > +			fail("Data block length is not enough to contain an OUI.\n");
    > +		if (ouiname && do_ascii && !valid_ascii)
    > +			warn("Expected PNP ID but found OUI.\n");
    > +		if (ouiname && matched_reverse)
    > +			warn("Endian-ness (%s) of OUI is different than expected (%s).\n"=
, big_endian ? "be" : "le", big_endian ? "le" : "be");
    > +		if (!ouiname) {
    > +			if (valid_ascii)
    > +				warn("Unknown OUI %s (possible PNP %s).\n", buf.c_str(), ascii);
    > +			else
    > +				warn("Unknown OUI %s.\n", buf.c_str());
    > +		}
    >  	}
    >  }
    > =20
    > diff --git a/edid-decode.h b/edid-decode.h
    > index 612d22a..9e6a955 100644
    > --- a/edid-decode.h
    > +++ b/edid-decode.h
    > @@ -153,8 +153,10 @@ struct edid_state {
    >  		// CTA-861 block state
    >  		cta.has_vic_1 =3D cta.first_svd_might_be_preferred =3D cta.has_sldb =3D
    >  			cta.has_hdmi =3D cta.has_vcdb =3D cta.has_vfpdb =3D false;
    > -		cta.last_block_was_hdmi_vsdb =3D cta.have_hf_vsdb =3D cta.have_hf_scdb=
 =3D false;
    > -		cta.first_block =3D cta.first_svd =3D true;
    > +		cta.have_hf_vsdb =3D cta.have_hf_scdb =3D false;
    > +		cta.previous_cta_tag =3D 0xfff;
    > +		cta.block_number =3D 0;
    > +		cta.first_svd =3D true;
    >  		cta.supported_hdmi_vic_codes =3D cta.supported_hdmi_vic_vsb_codes =3D =
0;
    >  		memset(cta.vics, 0, sizeof(cta.vics));
    >  		memset(cta.preparsed_has_vic, 0, sizeof(cta.preparsed_has_vic));
    > @@ -175,6 +177,7 @@ struct edid_state {
    >  		dispid.is_display =3D dispid.has_product_identification =3D
    >  			dispid.has_display_parameters =3D dispid.has_type_1_7 =3D
    >  			dispid.has_display_interface_features =3D false;
    > +		dispid.block_number =3D 0;
    > =20
    >  		// Block Map block state
    >  		block_map.saw_block_1 =3D false;
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
    > =20
    > +	void data_block_oui(std::string block_name, const unsigned char *x,=
 unsigned length, bool ignorezeros, unsigned *ouinum, bool do_ascii =3D false,=
 bool big_endian =3D false);
    > +
    >  	void print_vic_index(const char *prefix, unsigned idx, const char *=
suffix, bool ycbcr420 =3D false);
    >  	void hdmi_latency(unsigned char vid_lat, unsigned char aud_lat, boo=
l is_ilaced);
    >  	void cta_vcdb(const unsigned char *x, unsigned length);
    > @@ -390,6 +396,7 @@ struct edid_state {
    >  	void parse_displayid_type_10_timing(const unsigned char *x, unsigne=
d sz,
    >  					    bool is_cta =3D false);
    >  	void preparse_displayid_block(const unsigned char *x);
    > +	unsigned displayid_block(const unsigned version, const unsigned cha=
r *x, unsigned length);
    >  	void parse_displayid_block(const unsigned char *x);
    >  	void parse_displayid_vesa(const unsigned char *x);
    >  	void parse_displayid_cta_data_block(const unsigned char *x);
    > @@ -454,7 +461,7 @@ void hex_block(const char *prefix, const unsigned=
 char *x, unsigned length,
    >  	       bool show_ascii =3D true, unsigned step =3D 16);
    >  std::string block_name(unsigned char block);
    >  void calc_ratio(struct timings *t);
    > -const char *oui_name(unsigned oui, bool reverse =3D false);
    > +const char *oui_name(unsigned oui, unsigned *ouinum =3D NULL);
    > =20
    >  bool timings_close_match(const timings &t1, const timings &t2);
    >  const struct timings *find_dmt_id(unsigned char dmt_id);
    > @@ -465,4 +472,7 @@ const struct timings *cta_close_match_to_vic(cons=
t timings &t, unsigned &vic);
    >  unsigned char hdmi_vic_to_vic(unsigned char hdmi_vic);
    >  char *extract_string(const unsigned char *x, unsigned len);
    > =20
    > +#define oneoui(c,k,n) const unsigned kOUI_##k =3D __LINE__<<12;
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
    > @@ -652,57 +652,57 @@ void edid_state::cta_hdmi_block(const unsigned =
char *x, unsigned length)
    >  {
    >  	unsigned len_vic, len_3d;
    > =20
    > -	if (length < 4) {
    > -		fail("Empty Data Block with length %u.\n", length);
    > +	if (length < 1) {
    > +		fail("Empty Data Block.\n");
    >  		return;
    >  	}
    > -	printf("    Source physical address: %x.%x.%x.%x\n", x[3] >> 4, x[3=
] & 0x0f,
    > -	       x[4] >> 4, x[4] & 0x0f);
    > +	printf("    Source physical address: %x.%x.%x.%x\n", x[0] >> 4, x[0=
] & 0x0f,
    > +	       x[1] >> 4, x[1] & 0x0f);
    > =20
    > -	if (length < 6)
    > +	if (length < 3)
    >  		return;
    > =20
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
    > =20
    > -	if (length < 7)
    > +	if (length < 4)
    >  		return;
    > =20
    > -	printf("    Maximum TMDS clock: %u MHz\n", x[6] * 5);
    > -	if (x[6] * 5 > 340)
    > +	printf("    Maximum TMDS clock: %u MHz\n", x[3] * 5);
    > +	if (x[3] * 5 > 340)
    >  		fail("HDMI VSDB Max TMDS rate is > 340.\n");
    > =20
    > -	if (length < 8)
    > +	if (length < 5)
    >  		return;
    > =20
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
    > =20
    > -	unsigned b =3D 8;
    > -	if (x[7] & 0x80) {
    > +	unsigned b =3D 5;
    > +	if (x[4] & 0x80) {
    >  		hdmi_latency(x[b], x[b + 1], false);
    > =20
    > -		if (x[7] & 0x40) {
    > +		if (x[4] & 0x40) {
    >  			if (x[b] =3D=3D x[b + 2] &&
    >  			    x[b + 1] =3D=3D x[b + 3])
    >  				warn("Progressive and Interlaced latency values are identical, n=
o need for both.\n");
    > @@ -712,7 +712,7 @@ void edid_state::cta_hdmi_block(const unsigned ch=
ar *x, unsigned length)
    >  		b +=3D 2;
    >  	}
    > =20
    > -	if (!(x[7] & 0x20))
    > +	if (!(x[4] & 0x20))
    >  		return;
    > =20
    >  	bool mask =3D false;
    > @@ -1990,293 +1990,169 @@ static void cta_hdmi_audio_block(const unsi=
gned char *x, unsigned length)
    >  	}
    >  }
    > =20
    > -void edid_state::cta_ext_block(const unsigned char *x, unsigned leng=
th,
    > -			       bool duplicate)
    > +#define data_block_o(n) do { data_block_oui(n, x, length, false, &ou=
inum); if (length < 3) return; length -=3D 3; x +=3D 3; } while(0)
    > +
    > +void edid_state::cta_block(const unsigned char *x, bool duplicate)
    >  {
    > -	const char *name;
    > -	unsigned oui;
    > -	bool reverse =3D false;
    > +	unsigned length =3D x[0] & 0x1f; // number of bytes after the tag/len=
gth byte
    > +	unsigned ouinum =3D 0;
    > +	unsigned tag=3D(x[0] & 0xe0) >> 5;
    > +	unsigned extended =3D (tag =3D=3D 0x07) ? 1 : 0;
    > +	x++;
    > +	if (extended) {
    > +		if (!length) {
    > +			fail("Extended tag cannot have length 0.\n");
    > +			return;
    > +		}
    > +		length--;
    > +		tag =3D 0x700 + x[0];
    > +		x++;
    > +	}
    > +
    >  	bool audio_block =3D false;
    > =20
    > -	switch (x[0]) {
    > -	case 0x00: data_block =3D "Video Capability Data Block"; break;
    > -	case 0x01: data_block.clear(); break;
    > -	case 0x02: data_block =3D "VESA Video Display Device Data Block"; bre=
ak;
    > -	case 0x03: data_block =3D "VESA Video Timing Block Extension"; break;
    > -	case 0x04: data_block =3D "Reserved for HDMI Video Data Block"; break=
;
    > -	case 0x05: data_block =3D "Colorimetry Data Block"; break;
    > -	case 0x06: data_block =3D "HDR Static Metadata Data Block"; break;
    > -	case 0x07: data_block =3D "HDR Dynamic Metadata Data Block"; break;
    > -
    > -	case 0x0d: data_block =3D "Video Format Preference Data Block"; break=
;
    > -	case 0x0e: data_block =3D "YCbCr 4:2:0 Video Data Block"; break;
    > -	case 0x0f: data_block =3D "YCbCr 4:2:0 Capability Map Data Block"; br=
eak;
    > -	case 0x10: data_block =3D "Reserved for CTA-861 Miscellaneous Audio F=
ields"; break;
    > -	case 0x11: data_block.clear(); audio_block =3D true; break;
    > -	case 0x12: data_block =3D "HDMI Audio Data Block"; audio_block =3D true=
; break;
    > -	case 0x13: data_block =3D "Room Configuration Data Block"; audio_bloc=
k =3D true; break;
    > -	case 0x14: data_block =3D "Speaker Location Data Block"; audio_block =
=3D true; break;
    > -
    > -	case 0x20: data_block =3D "InfoFrame Data Block"; break;
    > -
    > -	case 0x34: data_block =3D "DisplayID Type VII Video Timing Data Block=
"; break;
    > -	case 0x35: data_block =3D "DisplayID Type VIII Video Timing Data Bloc=
k"; break;
    > -	case 0x42: data_block =3D "DisplayID Type X Video Timing Data Block";=
 break;
    > -
    > -	case 0x78: data_block =3D "HDMI Forum EDID Extension Override Data Bl=
ock"; break;
    > -	case 0x79: data_block =3D "HDMI Forum Sink Capability Data Block"; br=
eak;
    > +	switch (tag) {
    > +	case 0x001: data_block =3D "Audio Data Block"; audio_block =3D true; br=
eak;
    > +	case 0x002: data_block =3D "Video Data Block"; break;
    > +	case 0x003: data_block_o("Vendor-Specific Data Block"); break;
    > +	case 0x004: data_block =3D "Speaker Allocation Data Block"; audio_blo=
ck =3D true; break;
    > +	case 0x005: data_block =3D "VESA Display Transfer Characteristics Dat=
a Block"; break;
    > +
    > +	case 0x700: data_block =3D "Video Capability Data Block"; break;
    > +	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break=
;
    > +	case 0x702: data_block =3D "VESA Video Display Device Data Block"; br=
eak;
    > +	case 0x703: data_block =3D "VESA Video Timing Block Extension"; break=
; // not implemented
    > +	case 0x704: data_block =3D "Reserved for HDMI Video Data Block"; brea=
k; // reserved
    > +	case 0x705: data_block =3D "Colorimetry Data Block"; break;
    > +	case 0x706: data_block =3D "HDR Static Metadata Data Block"; break;
    > +	case 0x707: data_block =3D "HDR Dynamic Metadata Data Block"; break;
    > +
    > +	case 0x70d: data_block =3D "Video Format Preference Data Block"; brea=
k;
    > +	case 0x70e: data_block =3D "YCbCr 4:2:0 Video Data Block"; break;
    > +	case 0x70f: data_block =3D "YCbCr 4:2:0 Capability Map Data Block"; b=
reak;
    > +	case 0x710: data_block =3D "Reserved for CTA-861 Miscellaneous Audio =
Fields"; break; // reserved
    > +	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); audio=
_block =3D true; break; // no vendors implemented
    > +	case 0x712: data_block =3D "HDMI Audio Data Block"; audio_block =3D tru=
e; break;
    > +	case 0x713: data_block =3D "Room Configuration Data Block"; audio_blo=
ck =3D true; break;
    > +	case 0x714: data_block =3D "Speaker Location Data Block"; audio_block=
 =3D true; break;
    > +
    > +	case 0x720: data_block =3D "InfoFrame Data Block"; break;
    > +
    > +	case 0x734: data_block =3D "DisplayID Type VII Video Timing Data Bloc=
k"; break;
    > +	case 0x735: data_block =3D "DisplayID Type VIII Video Timing Data Blo=
ck"; break;
    > +	case 0x742: data_block =3D "DisplayID Type X Video Timing Data Block"=
; break;
    > +
    > +	case 0x778: data_block =3D "HDMI Forum EDID Extension Override Data B=
lock"; break;
    > +	case 0x779: data_block =3D "HDMI Forum Sink Capability Data Block"; b=
reak;
    >  	default:
    > -		if (x[0] <=3D 12)
    > -			printf("  Unknown CTA-861 Video-Related");
    > -		else if (x[0] <=3D 31)
    > -			printf("  Unknown CTA-861 Audio-Related");
    > -		else if (x[0] >=3D 120 && x[0] <=3D 127)
    > -			printf("  Unknown CTA-861 HDMI-Related");
    > -		else
    > -			printf("  Unknown CTA-861");
    > -		printf(" Data Block (extended tag 0x%02x, length %u)\n", x[0], len=
gth);
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
    > +		     if (tag < 0x700) data_block =3D "Unknown CTA-861 Data Block";
    > +		else if (tag < 0x70d) data_block =3D "Unknown CTA-861 Video-Related =
Data Block";
    > +		else if (tag < 0x720) data_block =3D "Unknown CTA-861 Audio-Related =
Data Block";
    > +		else if (tag < 0x778) data_block =3D "Unknown CTA-861 Data Block";
    > +		else if (tag < 0x780) data_block =3D "Unknown CTA-861 HDMI-Related D=
ata Block";
    > +		else                  data_block =3D "Unknown CTA-861 Data Block";
    > +		data_block +=3D std::string(" (") + (extended ? "extended " : "") + =
"tag " + utohex(tag & 0xff) + ")";
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
    > =20
    > -
    >  	// See Table 52 of CTA-861-G for a description of Byte 3
    >  	if (audio_block && !(cta.byte3 & 0x40))
    > -		fail("audio information is present, but bit 6 of Byte 3 of the CTA=
-861 Extension header indicates no Basic Audio support.\n");
    > -
    > -	if (data_block.length())
    > -		printf("  %s:\n", data_block.c_str());
    > -
    > -	switch (x[0]) {
    > -	case 0x00: cta_vcdb(x + 1, length); return;
    > -	case 0x01:
    > -		if (length < 3) {
    > -			data_block =3D std::string("Vendor-Specific Video Data Block");
    > -			fail("Invalid length %u < 3.\n", length);
    > -			return;
    > -		}
    > -		oui =3D (x[3] << 16) + (x[2] << 8) + x[1];
    > -		name =3D oui_name(oui);
    > -		if (!name) {
    > -			name =3D oui_name(oui, true);
    > -			if (name)
    > -				reverse =3D true;
    > -		}
    > -		if (!name) {
    > -			printf("  Vendor-Specific Video Data Block, OUI %s:\n",
    > -			       ouitohex(oui).c_str());
    > -			hex_block("    ", x + 4, length - 3);
    > -			data_block.clear();
    > -			warn("Unknown Extended Vendor-Specific Video Data Block, OUI %s.\=
n",
    > -			     ouitohex(oui).c_str());
    > -			return;
    > -		}
    > -		data_block =3D std::string("Vendor-Specific Video Data Block (") + n=
ame + ")";
    > -		if (reverse)
    > -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byt=
e order\n").c_str());
    > -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str(=
));
    > -		if (oui =3D=3D 0x90848b)
    > -			cta_hdr10plus(x + 4, length - 3);
    > -		else if (oui =3D=3D 0x00d046)
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
    > -			data_block =3D std::string("Vendor-Specific Audio Data Block");
    > -			fail("Invalid length %u < 3.\n", length);
    > -			return;
    > -		}
    > -		oui =3D (x[3] << 16) + (x[2] << 8) + x[1];
    > -		name =3D oui_name(oui);
    > -		if (!name) {
    > -			name =3D oui_name(oui, true);
    > -			if (name)
    > -				reverse =3D true;
    > -		}
    > -		if (!name) {
    > -			printf("  Vendor-Specific Audio Data Block, OUI %s:\n",
    > -			       ouitohex(oui).c_str());
    > -			hex_block("    ", x + 4, length - 3);
    > -			data_block.clear();
    > -			warn("Unknown Extended Vendor-Specific Audio Data Block, OUI %s.\=
n",
    > -			     ouitohex(oui).c_str());
    > -			return;
    > -		}
    > -		data_block =3D std::string("Vendor-Specific Audio Data Block (") + n=
ame + ")";
    > -		if (reverse)
    > -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byt=
e order\n").c_str());
    > -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str(=
));
    > -		if (oui =3D=3D 0x00d046)
    > -			cta_dolby_audio(x + 4, length - 3);
    > +		fail("Audio information is present, but bit 6 of Byte 3 of the CTA=
-861 Extension header indicates no Basic Audio support.\n");
    > +
    > +	tag |=3D ouinum;
    > +	switch (tag) {
    > +	case 0x001: cta_audio_block(x, length); break;
    > +	case 0x002: cta_svd(x, length, false); break;
    > +	case 0x003|kOUI_HDMI:
    > +		cta_hdmi_block(x, length);
    > +		// The HDMI OUI is present, so this EDID represents an HDMI
    > +		// interface. And HDMI interfaces must use EDID version 1.3
    > +		// according to the HDMI Specification, so check for this.
    > +		if (base.edid_minor !=3D 3)
    > +			fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\n=
",
    > +				 base.edid_minor);
    > +		break;
    > +	case 0x003|kOUI_HDMIForum:
    > +		if (cta.previous_cta_tag !=3D (0x003|kOUI_HDMI))
    > +			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\n=
");
    > +		if (cta.have_hf_scdb || cta.have_hf_vsdb)
    > +			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
    > +		cta_hf_scdb(x, length);
    > +		cta.have_hf_vsdb =3D true;
    > +		break;
    > +	case 0x003|kOUI_AMD: cta_amd(x, length); break;
    > +	case 0x003|kOUI_Microsoft:
    > +		if (length =3D=3D 0x12)
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
    > +		if (cta.previous_cta_tag !=3D (0x003|kOUI_HDMI))
    >  			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB.\n=
");
    >  		if (cta.have_hf_scdb || cta.have_hf_vsdb)
    >  			fail("Duplicate HDMI Forum VSDB/SCDB.\n");
    >  		if (length < 2) {
    >  			data_block =3D std::string("HDMI Forum SCDB");
    >  			fail("Invalid length %u < 2.\n", length);
    > -			return;
    > -		}
    > -		if (x[1] || x[2])
    > -			printf("  Non-zero SCDB reserved fields!\n");
    > -		cta_hf_scdb(x + 3, length - 2);
    > -		cta.have_hf_scdb =3D 1;
    > -		return;
    > -	}
    > -
    > -	hex_block("    ", x + 1, length);
    > -}
    > -
    > -void edid_state::cta_block(const unsigned char *x, bool duplicate)
    > -{
    > -	unsigned length =3D x[0] & 0x1f;
    > -	const char *name;
    > -	unsigned oui;
    > -	bool reverse =3D false;
    > -	bool audio_block =3D false;
    > -
    > -	switch ((x[0] & 0xe0) >> 5) {
    > -	case 0x01:
    > -		data_block =3D "Audio Data Block";
    > -		printf("  %s:\n", data_block.c_str());
    > -		cta_audio_block(x + 1, length);
    > -		audio_block =3D true;
    > -		break;
    > -	case 0x02:
    > -		data_block =3D "Video Data Block";
    > -		printf("  %s:\n", data_block.c_str());
    > -		cta_svd(x + 1, length, false);
    > -		break;
    > -	case 0x03:
    > -		oui =3D (x[3] << 16) + (x[2] << 8) + x[1];
    > -		name =3D oui_name(oui);
    > -		if (!name) {
    > -			name =3D oui_name(oui, true);
    > -			if (name)
    > -				reverse =3D true;
    > -		}
    > -		if (!name) {
    > -			printf("  Vendor-Specific Data Block, OUI %s:\n", ouitohex(oui).c=
_str());
    > -			hex_block("    ", x + 4, length - 3);
    > -			data_block.clear();
    > -			warn("Unknown Vendor-Specific Data Block, OUI %s.\n",
    > -			     ouitohex(oui).c_str());
    > -			return;
    > -		}
    > -		data_block =3D std::string("Vendor-Specific Data Block (") + name + =
")";
    > -		if (reverse)
    > -			fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong byt=
e order\n").c_str());
    > -		printf("  %s, OUI %s:\n", data_block.c_str(), ouitohex(oui).c_str(=
));
    > -		if (oui =3D=3D 0x000c03) {
    > -			cta_hdmi_block(x + 1, length);
    > -			cta.last_block_was_hdmi_vsdb =3D 1;
    > -			cta.first_block =3D 0;
    > -			// The HDMI OUI is present, so this EDID represents an HDMI
    > -			// interface. And HDMI interfaces must use EDID version 1.3
    > -			// according to the HDMI Specification, so check for this.
    > -			if (base.edid_minor !=3D 3)
    > -				fail("The HDMI Specification requires EDID 1.3 instead of 1.%u.\=
n",
    > -				     base.edid_minor);
    > -			return;
    > -		}
    > -		if (oui =3D=3D 0xc45dd8) {
    > -			if (!cta.last_block_was_hdmi_vsdb)
    > -				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB.\=
n");
    > -			if (cta.have_hf_scdb || cta.have_hf_vsdb)
    > -				fail("Duplicate HDMI Forum VSDB/SCDB.\n");
    > -			cta_hf_scdb(x + 4, length - 3);
    > -			cta.have_hf_vsdb =3D 1;
    > -			break;
    > -		}
    > -		if (oui =3D=3D 0x00001a) {
    > -			cta_amd(x + 4, length - 3);
    > -			break;
    > -		}
    > -		if (oui =3D=3D 0xca125c && length =3D=3D 0x15) {
    > -			cta_microsoft(x + 4, length - 3);
    >  			break;
    >  		}
    > -		hex_block("    ", x + 4, length - 3);
    > -		break;
    > -	case 0x04:
    > -		data_block =3D "Speaker Allocation Data Block";
    > -		printf("  %s:\n", data_block.c_str());
    > -		cta_sadb(x + 1, length);
    > -		audio_block =3D true;
    > -		if (duplicate)
    > -			fail("Only one instance of this Data Block is allowed.\n");
    > -		break;
    > -	case 0x05:
    > -		data_block =3D "VESA Display Transfer Characteristics Data Block";
    > -		printf("  %s:\n", data_block.c_str());
    > -		cta_vesa_dtcdb(x + 1, length);
    > -		if (duplicate)
    > -			fail("Only one instance of this Data Block is allowed.\n");
    > -		break;
    > -	case 0x07:
    > -		cta_ext_block(x + 1, length - 1, duplicate);
    > -		break;
    > -	default: {
    > -		unsigned tag =3D (*x & 0xe0) >> 5;
    > -		unsigned length =3D *x & 0x1f;
    > -
    > -		printf("  Unknown CTA-861 tag 0x%02x, length %u\n", tag, length);
    > -		hex_block("    ", x + 1, length);
    > -		data_block.clear();
    > -		warn("Unknown CTA-861 Data Block %u.\n", tag);
    > +		if (x[0] || x[1])
    > +			printf("  Non-zero SCDB reserved fields!\n");
    > +		cta_hf_scdb(x + 2, length - 2);
    > +		cta.have_hf_scdb =3D true;
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
    > -		fail("audio information is present, but bit 6 of Byte 3 of the CTA=
-861 Extension header indicates no Basic Audio support.\n");
    > -	cta.first_block =3D 0;
    > -	cta.last_block_was_hdmi_vsdb =3D 0;
    > +	cta.block_number++;
    > +	cta.previous_cta_tag =3D tag;
    >  }
    > =20
    >  void edid_state::preparse_cta_block(const unsigned char *x)
    > @@ -2392,11 +2268,11 @@ void edid_state::parse_cta_block(const unsign=
ed char *x)
    >  //				msg(!cta.has_hdmi, "If YCbCr support is indicated, then both 4=
:2:2 and 4:4:4 %s be supported.\n",
    >  //				    cta.has_hdmi ? "shall" : "should");
    >  			printf("  Native detailed modes: %u\n", x[3] & 0x0f);
    > -			if (cta.first_block)
    > +			if (cta.block_number =3D=3D 0)
    >  				cta.byte3 =3D x[3];
    >  			else if (x[3] !=3D cta.byte3)
    >  				fail("Byte 3 must be the same for all CTA-861 Extension Blocks.\=
n");
    > -			if (cta.first_block) {
    > +			if (cta.block_number =3D=3D 0) {
    >  				unsigned native_dtds =3D x[3] & 0x0f;
    > =20
    >  				cta.native_timings.clear();
    > diff --git a/parse-displayid-block.cpp b/parse-displayid-block.cpp
    > index 5c81294..ff7a6db 100644
    > --- a/parse-displayid-block.cpp
    > +++ b/parse-displayid-block.cpp
    > @@ -1609,13 +1609,230 @@ void edid_state::preparse_displayid_block(co=
nst unsigned char *x)
    >  	}
    >  }
    > =20
    > +#define data_block_o(n, a, b) data_block_oui(n, x + 3, len, tag =3D=3D 0=
, &ouinum, a, b)
    > +
    > +unsigned edid_state::displayid_block(const unsigned version, const u=
nsigned char *x, unsigned length)
    > +{
    > +	unsigned i;
    > +	unsigned tag =3D x[0];
    > +	unsigned ouinum =3D 0;
    > +	unsigned len =3D (length < 3) ? 0 : x[2];
    > +
    > +	switch (tag) {
    > +	// DisplayID 1.3:
    > +	case 0x00: data_block_o("Product Identification Data Block (" + uto=
hex(tag) + ")", true, false); ouinum =3D 0; break;
    > +	case 0x01: data_block =3D "Display Parameters Data Block (" + utohex(=
tag) + ")"; break;
    > +	case 0x02: data_block =3D "Color Characteristics Data Block"; break;
    > +	case 0x03: data_block =3D "Video Timing Modes Type 1 - Detailed Timin=
gs Data Block"; break;
    > +	case 0x04: data_block =3D "Video Timing Modes Type 2 - Detailed Timin=
gs Data Block"; break;
    > +	case 0x05: data_block =3D "Video Timing Modes Type 3 - Short Timings =
Data Block"; break;
    > +	case 0x06: data_block =3D "Video Timing Modes Type 4 - DMT Timings Da=
ta Block"; break;
    > +	case 0x07: data_block =3D "Supported Timing Modes Type 1 - VESA DMT T=
imings Data Block"; break;
    > +	case 0x08: data_block =3D "Supported Timing Modes Type 2 - CTA-861 Ti=
mings Data Block"; break;
    > +	case 0x09: data_block =3D "Video Timing Range Data Block"; break;
    > +	case 0x0a: data_block =3D "Product Serial Number Data Block"; break;
    > +	case 0x0b: data_block =3D "GP ASCII String Data Block"; break;
    > +	case 0x0c: data_block =3D "Display Device Data Data Block"; break;
    > +	case 0x0d: data_block =3D "Interface Power Sequencing Data Block"; br=
eak;
    > +	case 0x0e: data_block =3D "Transfer Characteristics Data Block"; brea=
k;
    > +	case 0x0f: data_block =3D "Display Interface Data Block"; break;
    > +	case 0x10: data_block =3D "Stereo Display Interface Data Block (" + u=
tohex(tag) + ")"; break;
    > +	case 0x11: data_block =3D "Video Timing Modes Type 5 - Short Timings =
Data Block"; break;
    > +	case 0x12: data_block =3D "Tiled Display Topology Data Block (" + uto=
hex(tag) + ")"; break;
    > +	case 0x13: data_block =3D "Video Timing Modes Type 6 - Detailed Timin=
gs Data Block"; break;
    > +	// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
    > +	// DisplayID 2.0
    > +	case 0x20: data_block_o("Product Identification Data Block (" + uto=
hex(tag) + ")", false, false); ouinum =3D 0; break;
    > +	case 0x21: data_block =3D "Display Parameters Data Block (" + utohex(=
tag) + ")"; break;
    > +	case 0x22: data_block =3D "Video Timing Modes Type 7 - Detailed Timin=
gs Data Block"; break;
    > +	case 0x23: data_block =3D "Video Timing Modes Type 8 - Enumerated Tim=
ing Codes Data Block"; break;
    > +	case 0x24: data_block =3D "Video Timing Modes Type 9 - Formula-based =
Timings Data Block"; break;
    > +	case 0x25: data_block =3D "Dynamic Video Timing Range Limits Data Blo=
ck"; break;
    > +	case 0x26: data_block =3D "Display Interface Features Data Block"; br=
eak;
    > +	case 0x27: data_block =3D "Stereo Display Interface Data Block (" + u=
tohex(tag) + ")"; break;
    > +	case 0x28: data_block =3D "Tiled Display Topology Data Block (" + uto=
hex(tag) + ")"; break;
    > +	case 0x29: data_block =3D "ContainerID Data Block"; break;
    > +	case 0x32: data_block =3D "Video Timing Modes Type 10 - Formula-based=
 Timings Data Block"; break;
    > +	// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
    > +	case 0x7e: data_block_o("Vendor-Specific Data Block (" + utohex(tag=
) + ")", false, true); break; // DisplayID 2.0
    > +	case 0x7f: data_block_o("Vendor-Specific Data Block (" + utohex(tag=
) + ")", true, false); break; // DisplayID 1.3
    > +	// 0x80 RESERVED
    > +	case 0x81: data_block =3D "CTA-861 DisplayID Data Block (" + utohex(t=
ag) + ")"; break;
    > +	// 0x82 .. 0xff RESERVED
    > +	default:   data_block =3D "Unknown DisplayID Data Block (" + utohex(t=
ag) + ")"; break;
    > +	}
    > +
    > +	if (version >=3D 0x20 && (tag < 0x20 || tag =3D=3D 0x7f))
    > +		fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
    > +			 version >> 4, version & 0xf);
    > +	if (version < 0x20 && tag >=3D 0x20 && tag <=3D 0x7e)
    > +		fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
    > +			 version >> 4, version & 0xf);
    > +
    > +	if (length < 3) {
    > +		// report a problem when the remaining bytes are not 0.
    > +		if (tag || (length > 1 && x[1])) {
    > +			fail("Not enough bytes remain (%d) for a DisplayID data block and=
 the DisplayID filler is non-0.\n", length);
    > +		}
    > +		return length;
    > +	}
    > +
    > +	unsigned block_rev =3D x[1] & 0x07;
    > +
    > +	if (length < len + 3) {
    > +		fail("The length of this DisplayID data block (%d) exceeds the num=
ber of bytes remaining (%d)\n", len + 3, length);
    > +		return length;
    > +	}
    > +
    > +	if (!tag && !len) {
    > +		// A Product Identification Data Block with no payload bytes is no=
t valid - assume this is the end.
    > +		if (!memchk(x, length)) {
    > +			fail("Non-0 filler bytes in the DisplayID block.\n");
    > +		}
    > +		return length;
    > +	}
    > +
    > +	printf("  %s:\n", data_block.c_str());
    > +
    > +	tag |=3D ouinum;
    > +	switch (tag) {
    > +	case 0x00: parse_displayid_product_id(x); break;
    > +	case 0x01: parse_displayid_parameters(x); break;
    > +	case 0x02: parse_displayid_color_characteristics(x); break;
    > +	case 0x03:
    > +		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
    > +		   for (i =3D 0; i < len / 20; i++)
    > +			   parse_displayid_type_1_7_timing(&x[3 + (i * 20)], false, block=
_rev);
    > +		   break;
    > +	case 0x04:
    > +		   check_displayid_datablock_revision(x[1]);
    > +		   for (i =3D 0; i < len / 11; i++)
    > +			   parse_displayid_type_2_timing(&x[3 + (i * 11)]);
    > +		   break;
    > +	case 0x05:
    > +		   check_displayid_datablock_revision(x[1], 0, block_rev & 1);
    > +		   for (i =3D 0; i < len / 3; i++)
    > +			   parse_displayid_type_3_timing(&x[3 + (i * 3)]);
    > +		   break;
    > +	case 0x06:
    > +		   check_displayid_datablock_revision(x[1], 0xc0, 1);
    > +		   for (i =3D 0; i < len; i++)
    > +			   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6, x[3 + i]);
    > +		   break;
    > +	case 0x07:
    > +		   check_displayid_datablock_revision(x[1]);
    > +		   for (i =3D 0; i < min(len, 10) * 8; i++)
    > +			   if (x[3 + i / 8] & (1 << (i % 8))) {
    > +				   char type[16];
    > +				   sprintf(type, "DMT 0x%02x", i + 1);
    > +				   print_timings("    ", find_dmt_id(i + 1), type);
    > +			   }
    > +		   break;
    > +	case 0x08:
    > +		   check_displayid_datablock_revision(x[1]);
    > +		   for (i =3D 0; i < min(len, 8) * 8; i++)
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
    > +		   for (i =3D 0; i < len / 7; i++)
    > +			   parse_displayid_type_5_timing(&x[3 + (i * 7)]);
    > +		   break;
    > +	case 0x12: parse_displayid_tiled_display_topology(x, false); break;
    > +	case 0x13:
    > +		   check_displayid_datablock_revision(x[1]);
    > +		   for (i =3D 0; i < len; i +=3D (x[3 + i + 2] & 0x40) ? 17 : 14)
    > +			   parse_displayid_type_6_timing(&x[3 + i]);
    > +		   break;
    > +	case 0x20: parse_displayid_product_id(x); break;
    > +	case 0x21:
    > +		   if (block_rev >=3D 1)
    > +			   check_displayid_datablock_revision(x[1], 0x80, 1);
    > +		   else
    > +			   check_displayid_datablock_revision(x[1], 0x80, 0);
    > +		   parse_displayid_parameters_v2(x, block_rev);
    > +		   break;
    > +	case 0x22: {
    > +		   unsigned sz =3D 20;
    > +
    > +		   if (block_rev >=3D 2)
    > +			   check_displayid_datablock_revision(x[1], 0x08, 2);
    > +		   else if (block_rev =3D=3D 1)
    > +			   check_displayid_datablock_revision(x[1], 0x08, 1);
    > +		   else
    > +			   check_displayid_datablock_revision(x[1]);
    > +		   sz +=3D (x[1] & 0x70) >> 4;
    > +		   if (block_rev >=3D 1 && (x[1] & 0x08))
    > +			   printf("    These timings support DSC pass-through\n");
    > +		   for (i =3D 0; i < len / sz; i++)
    > +			   parse_displayid_type_1_7_timing(&x[3 + i * sz], true, block_re=
v);
    > +		   break;
    > +	}
    > +	case 0x23:
    > +		   if (block_rev)
    > +			   check_displayid_datablock_revision(x[1], 0xe8, 1);
    > +		   else
    > +			   check_displayid_datablock_revision(x[1], 0xc8);
    > +		   if (x[1] & 0x08) {
    > +			   for (i =3D 0; i < len / 2; i++)
    > +				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
    > +								   x[3 + i * 2] |
    > +								   (x[4 + i * 2] << 8));
    > +		   } else {
    > +			   for (i =3D 0; i < len; i++)
    > +				   parse_displayid_type_4_8_timing((x[1] & 0xc0) >> 6,
    > +								   x[3 + i]);
    > +		   }
    > +		   break;
    > +	case 0x24:
    > +		   check_displayid_datablock_revision(x[1]);
    > +		   for (i =3D 0; i < len / 6; i++)
    > +			   parse_displayid_type_9_timing(&x[3 + i * 6]);
    > +		   break;
    > +	case 0x25: parse_displayid_dynamic_video_timings_range_limits(x); b=
reak;
    > +	case 0x26: parse_displayid_interface_features(x); break;
    > +	case 0x27: parse_displayid_stereo_display_intf(x); break;
    > +	case 0x28: parse_displayid_tiled_display_topology(x, true); break;
    > +	case 0x29: parse_displayid_ContainerID(x); break;
    > +	case 0x32: {
    > +		   unsigned sz =3D 6 + ((x[1] & 0x70) >> 4);
    > +
    > +		   check_displayid_datablock_revision(x[1], 0x70);
    > +		   for (i =3D 0; i < len / sz; i++)
    > +			   parse_displayid_type_10_timing(&x[3 + i * sz], sz);
    > +		   break;
    > +	}
    > +	case 0x81: parse_displayid_cta_data_block(x); break;
    > +	case 0x7e|kOUI_VESA: parse_displayid_vesa(x); break;
    > +	default: hex_block("    ", x + 3 + (ouinum ? 3 : 0), len - (ouinum =
? 3 : 0)); break;
    > +	}
    > +
    > +	if ((tag =3D=3D 0x00 || tag =3D=3D 0x20) &&
    > +		(!dispid.is_base_block || dispid.block_number > 0))
    > +		fail("%s is required to be the first DisplayID Data Block.\n",
    > +			 data_block.c_str());
    > +	dispid.block_number++;
    > +	return len + 3;
    > +}
    > +
    >  void edid_state::parse_displayid_block(const unsigned char *x)
    >  {
    >  	unsigned version =3D x[1];
    >  	unsigned length =3D x[2];
    >  	unsigned prod_type =3D x[3]; // future check: based on type, check fo=
r required data blocks
    >  	unsigned ext_count =3D x[4];
    > -	unsigned i;
    > =20
    >  	printf("  Version: %u.%u\n  Extension Count: %u\n",
    >  	       version >> 4, version & 0xf, ext_count);
    > @@ -1647,246 +1864,10 @@ void edid_state::parse_displayid_block(const=
 unsigned char *x)
    >  		length =3D 121;
    >  	}
    > =20
    > -	unsigned offset =3D 5;
    > -	bool first_data_block =3D true;
    > -	while (length > 0) {
    > -		unsigned tag =3D x[offset];
    > -		unsigned oui =3D 0;
    > -
    > -		switch (tag) {
    > -		// DisplayID 1.3:
    > -		case 0x00: data_block =3D "Product Identification Data Block (" + ut=
ohex(tag) + ")"; break;
    > -		case 0x01: data_block =3D "Display Parameters Data Block (" + utohex=
(tag) + ")"; break;
    > -		case 0x02: data_block =3D "Color Characteristics Data Block"; break;
    > -		case 0x03: data_block =3D "Video Timing Modes Type 1 - Detailed Timi=
ngs Data Block"; break;
    > -		case 0x04: data_block =3D "Video Timing Modes Type 2 - Detailed Timi=
ngs Data Block"; break;
    > -		case 0x05: data_block =3D "Video Timing Modes Type 3 - Short Timings=
 Data Block"; break;
    > -		case 0x06: data_block =3D "Video Timing Modes Type 4 - DMT Timings D=
ata Block"; break;
    > -		case 0x07: data_block =3D "Supported Timing Modes Type 1 - VESA DMT =
Timings Data Block"; break;
    > -		case 0x08: data_block =3D "Supported Timing Modes Type 2 - CTA-861 T=
imings Data Block"; break;
    > -		case 0x09: data_block =3D "Video Timing Range Data Block"; break;
    > -		case 0x0a: data_block =3D "Product Serial Number Data Block"; break;
    > -		case 0x0b: data_block =3D "GP ASCII String Data Block"; break;
    > -		case 0x0c: data_block =3D "Display Device Data Data Block"; break;
    > -		case 0x0d: data_block =3D "Interface Power Sequencing Data Block"; b=
reak;
    > -		case 0x0e: data_block =3D "Transfer Characteristics Data Block"; bre=
ak;
    > -		case 0x0f: data_block =3D "Display Interface Data Block"; break;
    > -		case 0x10: data_block =3D "Stereo Display Interface Data Block (" + =
utohex(tag) + ")"; break;
    > -		case 0x11: data_block =3D "Video Timing Modes Type 5 - Short Timings=
 Data Block"; break;
    > -		case 0x12: data_block =3D "Tiled Display Topology Data Block (" + ut=
ohex(tag) + ")"; break;
    > -		case 0x13: data_block =3D "Video Timing Modes Type 6 - Detailed Timi=
ngs Data Block"; break;
    > -		// 0x14 .. 0x7e RESERVED for Additional VESA-defined Data Blocks
    > -		// DisplayID 2.0
    > -		case 0x20: data_block =3D "Product Identification Data Block (" + ut=
ohex(tag) + ")"; break;
    > -		case 0x21: data_block =3D "Display Parameters Data Block (" + utohex=
(tag) + ")"; break;
    > -		case 0x22: data_block =3D "Video Timing Modes Type 7 - Detailed Timi=
ngs Data Block"; break;
    > -		case 0x23: data_block =3D "Video Timing Modes Type 8 - Enumerated Ti=
ming Codes Data Block"; break;
    > -		case 0x24: data_block =3D "Video Timing Modes Type 9 - Formula-based=
 Timings Data Block"; break;
    > -		case 0x25: data_block =3D "Dynamic Video Timing Range Limits Data Bl=
ock"; break;
    > -		case 0x26: data_block =3D "Display Interface Features Data Block"; b=
reak;
    > -		case 0x27: data_block =3D "Stereo Display Interface Data Block (" + =
utohex(tag) + ")"; break;
    > -		case 0x28: data_block =3D "Tiled Display Topology Data Block (" + ut=
ohex(tag) + ")"; break;
    > -		case 0x29: data_block =3D "ContainerID Data Block"; break;
    > -		case 0x32: data_block =3D "Video Timing Modes Type 10 - Formula-base=
d Timings Data Block"; break;
    > -		// 0x2a .. 0x7d RESERVED for Additional VESA-defined Data Blocks
    > -		case 0x7e: // DisplayID 2.0
    > -		case 0x7f: // DisplayID 1.3
    > -			if ((tag =3D=3D 0x7e && version >=3D 0x20) ||
    > -			    (tag =3D=3D 0x7f && version < 0x20)) {
    > -				oui =3D (x[offset + 3] << 16) + (x[offset + 4] << 8) + x[offset + =
5];
    > -				const char *name =3D oui_name(oui);
    > -				bool reversed =3D false;
    > -
    > -				if (!name) {
    > -					name =3D oui_name(oui, true);
    > -					if (name)
    > -						reversed =3D true;
    > -				}
    > -				if (name)
    > -					data_block =3D std::string("Vendor-Specific Data Block (") + name=
 + ")";
    > -				else
    > -					data_block =3D "Vendor-Specific Data Block, OUI " + ouitohex(oui)=
;
    > -				if (reversed)
    > -					fail((std::string("OUI ") + ouitohex(oui) + " is in the wrong b=
yte order.\n").c_str());
    > -			} else {
    > -				data_block =3D "Unknown DisplayID Data Block (" + utohex(tag) + ")=
";
    > -			}
    > -			break;
    > -		// 0x80 RESERVED
    > -		case 0x81: data_block =3D "CTA-861 DisplayID Data Block (" + utohex(=
tag) + ")"; break;
    > -		// 0x82 .. 0xff RESERVED
    > -		default:   data_block =3D "Unknown DisplayID Data Block (" + utohex(=
tag) + ")"; break;
    > -		}
    > -
    > -		if (version >=3D 0x20 && (tag < 0x20 || tag =3D=3D 0x7f))
    > -			fail("Use of DisplayID v1.x tag for DisplayID v%u.%u.\n",
    > -			     version >> 4, version & 0xf);
    > -		if (version < 0x20 && tag >=3D 0x20 && tag <=3D 0x7e)
    > -			fail("Use of DisplayID v2.0 tag for DisplayID v%u.%u.\n",
    > -			     version >> 4, version & 0xf);
    > -
    > -		if (length < 3) {
    > -			// report a problem when the remaining bytes are not 0.
    > -			if (tag || x[offset + 1]) {
    > -				fail("Not enough bytes remain (%d) for a DisplayID data block or=
 the DisplayID filler is non-0.\n", length);
    > -			}
    > -			break;
    > -		}
    > -
    > -		unsigned block_rev =3D x[offset + 1] & 0x07;
    > -		unsigned len =3D x[offset + 2];
    > -
    > -		if (length < len + 3) {
    > -			fail("The length of this DisplayID data block (%d) exceeds the nu=
mber of bytes remaining (%d).\n", len + 3, length);
    > -			break;
    > -		}
    > -
    > -		if (!tag && !len) {
    > -			// A Product Identification Data Block with no payload bytes is n=
ot valid - assume this is the end.
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
    > -		case 0x02: parse_displayid_color_characteristics(x + offset); brea=
k;
    > -		case 0x03:
    > -			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev=
 & 1);
    > -			   for (i =3D 0; i < len / 20; i++)
    > -				   parse_displayid_type_1_7_timing(&x[offset + 3 + (i * 20)], fa=
lse, block_rev);
    > -			   break;
    > -		case 0x04:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < len / 11; i++)
    > -				   parse_displayid_type_2_timing(&x[offset + 3 + (i * 11)]);
    > -			   break;
    > -		case 0x05:
    > -			   check_displayid_datablock_revision(x[offset + 1], 0, block_rev=
 & 1);
    > -			   for (i =3D 0; i < len / 3; i++)
    > -				   parse_displayid_type_3_timing(&x[offset + 3 + (i * 3)]);
    > -			   break;
    > -		case 0x06:
    > -			   check_displayid_datablock_revision(x[offset + 1], 0xc0, 1);
    > -			   for (i =3D 0; i < len; i++)
    > -				   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6, =
x[offset + 3 + i]);
    > -			   break;
    > -		case 0x07:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < min(len, 10) * 8; i++)
    > -				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
    > -					   char type[16];
    > -					   sprintf(type, "DMT 0x%02x", i + 1);
    > -					   print_timings("    ", find_dmt_id(i + 1), type);
    > -				   }
    > -			   break;
    > -		case 0x08:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < min(len, 8) * 8; i++)
    > -				   if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
    > -					   char type[16];
    > -					   sprintf(type, "VIC %3u", i + 1);
    > -					   print_timings("    ", find_vic_id(i + 1), type);
    > -				   }
    > -			   break;
    > -		case 0x09: parse_displayid_video_timing_range_limits(x + offset); =
break;
    > -		case 0x0a:
    > -		case 0x0b: parse_displayid_string(x + offset); break;
    > -		case 0x0c: parse_displayid_display_device(x + offset); break;
    > -		case 0x0d: parse_displayid_intf_power_sequencing(x + offset); brea=
k;
    > -		case 0x0e: parse_displayid_transfer_characteristics(x + offset); b=
reak;
    > -		case 0x0f: parse_displayid_display_intf(x + offset); break;
    > -		case 0x10: parse_displayid_stereo_display_intf(x + offset); break;
    > -		case 0x11:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < len / 7; i++)
    > -				   parse_displayid_type_5_timing(&x[offset + 3 + (i * 7)]);
    > -			   break;
    > -		case 0x12: parse_displayid_tiled_display_topology(x + offset, fals=
e); break;
    > -		case 0x13:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < len; i +=3D (x[offset + 3 + i + 2] & 0x40) ? 17 =
: 14)
    > -				   parse_displayid_type_6_timing(&x[offset + 3 + i]);
    > -			   break;
    > -		case 0x20: parse_displayid_product_id(x + offset); break;
    > -		case 0x21:
    > -			   if (block_rev >=3D 1)
    > -				   check_displayid_datablock_revision(x[offset + 1], 0x80, 1);
    > -			   else
    > -				   check_displayid_datablock_revision(x[offset + 1], 0x80, 0);
    > -			   parse_displayid_parameters_v2(x + offset, block_rev);
    > -			   break;
    > -		case 0x22: {
    > -			   unsigned sz =3D 20;
    > -
    > -			   if (block_rev >=3D 2)
    > -				   check_displayid_datablock_revision(x[offset + 1], 0x08, 2);
    > -			   else if (block_rev =3D=3D 1)
    > -				   check_displayid_datablock_revision(x[offset + 1], 0x08, 1);
    > -			   else
    > -				   check_displayid_datablock_revision(x[offset + 1]);
    > -			   sz +=3D (x[offset + 1] & 0x70) >> 4;
    > -			   if (block_rev >=3D 1 && (x[offset + 1] & 0x08))
    > -				   printf("    These timings support DSC pass-through\n");
    > -			   for (i =3D 0; i < len / sz; i++)
    > -				   parse_displayid_type_1_7_timing(&x[offset + 3 + i * sz], true=
, block_rev);
    > -			   break;
    > -		}
    > -		case 0x23:
    > -			   if (block_rev)
    > -				   check_displayid_datablock_revision(x[offset + 1], 0xe8, 1);
    > -			   else
    > -				   check_displayid_datablock_revision(x[offset + 1], 0xc8);
    > -			   if (x[offset + 1] & 0x08) {
    > -				   for (i =3D 0; i < len / 2; i++)
    > -					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
    > -									   x[offset + 3 + i * 2] |
    > -									   (x[offset + 4 + i * 2] << 8));
    > -			   } else {
    > -				   for (i =3D 0; i < len; i++)
    > -					   parse_displayid_type_4_8_timing((x[offset + 1] & 0xc0) >> 6,
    > -									   x[offset + 3 + i]);
    > -			   }
    > -			   break;
    > -		case 0x24:
    > -			   check_displayid_datablock_revision(x[offset + 1]);
    > -			   for (i =3D 0; i < len / 6; i++)
    > -				   parse_displayid_type_9_timing(&x[offset + 3 + i * 6]);
    > -			   break;
    > -		case 0x25: parse_displayid_dynamic_video_timings_range_limits(x + =
offset); break;
    > -		case 0x26: parse_displayid_interface_features(x + offset); break;
    > -		case 0x27: parse_displayid_stereo_display_intf(x + offset); break;
    > -		case 0x28: parse_displayid_tiled_display_topology(x + offset, true=
); break;
    > -		case 0x29: parse_displayid_ContainerID(x + offset); break;
    > -		case 0x32: {
    > -			   unsigned sz =3D 6 + ((x[offset + 1] & 0x70) >> 4);
    > -
    > -			   check_displayid_datablock_revision(x[offset + 1], 0x70);
    > -			   for (i =3D 0; i < len / sz; i++)
    > -				   parse_displayid_type_10_timing(&x[offset + 3 + i * sz], sz);
    > -			   break;
    > -		}
    > -		case 0x81: parse_displayid_cta_data_block(x + offset); break;
    > -		case 0x7e:
    > -			if (oui =3D=3D 0x3a0292) {
    > -				parse_displayid_vesa(x + offset);
    > -				break;
    > -			}
    > -			// fall-through
    > -		default: hex_block("    ", x + offset + 3, len); break;
    > -		}
    > -
    > -		if ((tag =3D=3D 0x00 || tag =3D=3D 0x20) &&
    > -		    (!dispid.is_base_block || !first_data_block))
    > -			fail("%s is required to be the first DisplayID Data Block.\n",
    > -			     data_block.c_str());
    > -		length -=3D len + 3;
    > -		offset +=3D len + 3;
    > -		first_data_block =3D false;
    > +	unsigned len;
    > +	for (const unsigned char *y =3D x + 5; length > 0; y +=3D len) {
    > +		len =3D displayid_block(version, y, length);
    > +		length -=3D len;
    >  	}
    > =20
    >  	/*
    >=20




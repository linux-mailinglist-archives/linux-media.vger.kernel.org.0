Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBCB114221
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 15:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfLEOBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 09:01:05 -0500
Received: from smtp-out-no.shaw.ca ([64.59.134.13]:58808 "EHLO
        smtp-out-no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEOBF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 09:01:05 -0500
X-Greylist: delayed 487 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Dec 2019 09:01:02 EST
Received: from [192.168.0.100] ([70.71.78.228])
        by shaw.ca with ESMTPA
        id crYqiB7zCkqGXcrYsip7sj; Thu, 05 Dec 2019 06:52:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1575553975;
        bh=DJT39nNVdURWTLuL5A9DkiiZ/UFgbUGui+ch+SBdT9Y=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=aR4Opu0x33VNtqtQPUbiUdErk255i/OnLiGRLSxM3KSwfsTEOh/gw1zza0qbrvzAL
         Sg+6M/ns/A+KH96iI0p52X/FNU6ZAddgmn4dcL3MnH+FzuSMVLdxqtlzotcwuw+oDV
         0kEoCQLbl2yqkn9QLVWxdPr64jgue52qZwcncJHQCcGq2aLwj1Bo7hxNuETJ2fazmh
         F+/ZLeGQt/x0U+xhldJ29c8DGLjDj5+iZlvQo70jZHNONu5ONOgenHyzyiee+wfRQE
         XBVPNlquwGUjoeI/JD+EV87DTd1Yh2sMSRw0YZsJWcAWvKgykLqRhBF9M6+eaaCH+s
         OsX4Uox7OaxQw==
X-Authority-Analysis: v=2.3 cv=c/jVvi1l c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=_Dj-zB-qAAAA:8
 a=ujqgGjsmusDE-sT7dOgA:9 a=acmeQTkrlxHidF7m:21 a=wj7d55HjVHAknlUM:21
 a=QEXdDO2ut3YA:10 a=itKHPHTafuwA:10 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/10.1f.0.191110
Date:   Thu, 05 Dec 2019 05:52:49 -0800
Subject: Re: [PATCH 4/5] edid-decode: CTA extension block cleanup
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <CD275765-EA6D-4370-9769-93609CF70E59@shaw.ca>
Thread-Topic: [PATCH 4/5] edid-decode: CTA extension block cleanup
References: <20191205073414.53672-1-joevt@shaw.ca>
 <20191205073414.53672-4-joevt@shaw.ca>
 <80287d44-f6ec-0200-5b8a-a2a9ee790510@xs4all.nl>
In-Reply-To: <80287d44-f6ec-0200-5b8a-a2a9ee790510@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4wfFZDJD/r4HNhKLNAuH8WViBAcCZjPQMxpj+6Z6lKmvk7AlbLiKAHzB2Bvq6mxFeSnqUKHbt1G5r5WqzlogvzivTk7JwPHRqx/cC/IQH8XAamluE+baj7
 0DAaRPlBZainmpYj2jgu3ZYiN7XCkyD/buGKG3K0AXV4/YKyaU50BmcK/xadWzOBAULJWsm6mp1jyvYXSevxb9+Ycc9jEX5F2Sc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I did some evil things with the switch statement but I think it at least lo=
oks nice (for some definitions of nice).

The main idea is to be more like DisplayID. First, there's a switch to get =
the data_block name. The data_block name is required for error handling so i=
t is obtained first. Instead of a nested switch, it combines the tag and ext=
ended tag bytes. The switch obtains an oui for vendor specific data blocks. =
There's three tags that parse oui (I added oui parsing for audio but none of=
 those are decoded) and now they all use the same oui function.

Second, there's a separate switch for the decode part. This switch combines=
 tag, extended tag, and oui. The duplicate code was unduplicated. There's on=
ly one default for outputting hex of unparsed data blocks (instead of 12) - =
whether they have a normal tag, extended tag, a tag with an oui, or an exten=
ded tag with an oui.


=EF=BB=BFOn 2019-12-05, 1:38 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    Hi Joe,
   =20
    I've committed the other patches, but I'm not sure about this one. I'll=
 look at
    it again when I have more time. I might make my own implementation base=
d on
    ideas of this patch.
   =20
    BTW, I made a real mess with the back/front porch timings. Thanks for f=
ixing that!
   =20
    Regards,
   =20
    	Hans
   =20
    On 12/5/19 8:34 AM, joevt wrote:
    > Reduced tag parsing code.
    > Added OUI min block length checks.
    >=20
    > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
    > ---
    >  edid-decode.h       |   1 +
    >  parse-cta-block.cpp | 336 ++++++++++++++++++------------------------=
--
    >  2 files changed, 138 insertions(+), 199 deletions(-)
    >=20
    > diff --git a/edid-decode.h b/edid-decode.h
    > index 83ded83..758bdcf 100644
    > --- a/edid-decode.h
    > +++ b/edid-decode.h
    > @@ -111,6 +111,7 @@ struct edid_state {
    >  	void cta_y420cmdb(const unsigned char *x, unsigned length);
    >  	void cta_vfpdb(const unsigned char *x, unsigned length);
    >  	void cta_hdmi_block(const unsigned char *x, unsigned length);
    > +	void cta_oui(const char *block_name, const unsigned char *x, unsign=
ed length, unsigned *ouinum);
    >  	void cta_block(const unsigned char *x);
    >  	void preparse_cta_block(const unsigned char *x);
    >  	void parse_cta_block(const unsigned char *x);
    > diff --git a/parse-cta-block.cpp b/parse-cta-block.cpp
    > index dea87c1..e52822a 100644
    > --- a/parse-cta-block.cpp
    > +++ b/parse-cta-block.cpp
    > @@ -375,6 +375,11 @@ void edid_state::cta_svd(const unsigned char *x,=
 unsigned n, int for_ycbcr420)
    > =20
    >  		if (vic =3D=3D 1 && !for_ycbcr420)
    >  			has_cta861_vic_1 =3D 1;
    > +
    > +		// vics and has_vic are basically the same (if has_vic was not boo=
l), except vics
    > +		// is built after preparse (during parse) which allows errors for =
duplicates to be
    > +		// output in parse order. has_vic is built during preparse and is =
used when vics
    > +		// from other blocks need to be checked.
    >  		if (++vics[vic][for_ycbcr420] =3D=3D 2)
    >  			fail("Duplicate %sVIC %u\n", for_ycbcr420 ? "YCbCr 4:2:0 " : "", =
vic);
    >  		if (for_ycbcr420 && has_vic[0][vic])
    > @@ -485,7 +490,6 @@ void edid_state::cta_hdmi_block(const unsigned ch=
ar *x, unsigned length)
    >  {
    >  	unsigned len_vic, len_3d;
    > =20
    > -	printf(" (HDMI)\n");
    >  	printf("    Source physical address %u.%u.%u.%u\n", x[3] >> 4, x[3]=
 & 0x0f,
    >  	       x[4] >> 4, x[4] & 0x0f);
    > =20
    > @@ -1228,10 +1232,20 @@ static void cta_hdmi_audio_block(const unsign=
ed char *x, unsigned length)
    >  		x +=3D 4;
    >  	}
    >  }
    > +const unsigned kOUI_Unknown   =3D 1<<12;
    > +const unsigned kOUI_HDMI      =3D 2<<12;
    > +const unsigned kOUI_HDMIForum =3D 3<<12;
    > +const unsigned kOUI_HDR10     =3D 4<<12;
    > =20
    > -static const char *oui_name(unsigned oui)
    > +static const char *oui_name(unsigned oui, unsigned *ouinum =3D NULL)
    >  {
    > +	unsigned ouinumscratch;
    > +	if (!ouinum) ouinum =3D &ouinumscratch;
    > +	*ouinum =3D kOUI_Unknown;
    >  	switch (oui) {
    > +	case 0x000c03: *ouinum =3D kOUI_HDMI      ; return "HDMI";
    > +	case 0xc45dd8: *ouinum =3D kOUI_HDMIForum ; return "HDMI Forum";
    > +	case 0x90848b: *ouinum =3D kOUI_HDR10     ; return "HDR10+";
    >  	case 0x00001a: return "AMD";
    >  	case 0x00044b: return "NVIDIA";
    >  	case 0x000c6e: return "ASUS";
    > @@ -1244,212 +1258,136 @@ static const char *oui_name(unsigned oui)
    >  	}
    >  }
    > =20
    > +void edid_state::cta_oui(const char *block_name, const unsigned char=
 *x, unsigned length, unsigned *ouinum)
    > +{
    > +	char buf[10];
    > +	unsigned oui;
    > +
    > +	if (length < 3) {
    > +		oui =3D 0xffffffff;
    > +		sprintf(buf, "?");
    > +	} else {
    > +		oui =3D (x[2] << 16) + (x[1] << 8) + x[0];
    > +		sprintf(buf, "0x%06x", oui);
    > +	}
    > +	
    > +	const char *ouiname =3D oui_name(oui, ouinum);
    > +	std::string name =3D std::string(block_name) + ", OUI " + buf;
    > +	if (ouiname) name +=3D std::string(" (") + ouiname + ")";
    > +	data_block =3D name;
    > +	
    > +	if (oui =3D=3D 0xffffffff)
    > +		fail("CTA data block is not long enough to contain an OUI\n");
    > +}
    > +
    > +#define data_block_o(n) cta_oui(n, x + 1 + extended, length - extend=
ed, &ouinum)
    > +
    >  void edid_state::cta_block(const unsigned char *x)
    >  {
    > -	static int last_block_was_hdmi_vsdb;
    > -	static int have_hf_vsdb, have_hf_scdb;
    > -	static int first_block =3D 1;
    > +	static unsigned previous_cta_tag =3D 0;
    > +	static bool have_hf_vsdb =3D false;
    > +	static bool have_hf_scdb =3D false;
    > +	static unsigned cta_block_number =3D 0;
    > +
    >  	unsigned length =3D x[0] & 0x1f;
    > -	const char *name;
    > -	unsigned oui;
    > +	unsigned ouinum =3D 0;
    > +	unsigned tag=3D(x[0] & 0xe0) >> 5;
    > +	unsigned extended =3D tag =3D=3D 0x07 ? 1 : 0;
    > +	if (extended) tag =3D 0x700 + x[1];
    > +
    > +	switch (tag) {
    > +	case 0x001: data_block =3D "Audio Data Block"; break;
    > +	case 0x002: data_block =3D "Video Data Block"; break;
    > +	case 0x003: data_block_o("Vendor-Specific Data Block"); break;
    > +	case 0x004: data_block =3D "Speaker Allocation Data Block"; break;
    > +	case 0x005: data_block =3D "VESA DTC Data Block"; break; // not imple=
mented
    > +
    > +	case 0x700: data_block =3D "Video Capability Data Block"; break;
    > +	case 0x701: data_block_o("Vendor-Specific Video Data Block"); break=
;
    > +	case 0x702: data_block =3D "VESA Video Display Device Data Block"; br=
eak; // not implemented
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
    > +	case 0x710: data_block =3D "Reserved for CTA Miscellaneous Audio Fiel=
ds"; break; // reserved
    > +	case 0x711: data_block_o("Vendor-Specific Audio Data Block"); break=
; // no vendors implemented
    > +	case 0x712: data_block =3D "HDMI Audio Data Block"; break;
    > +	case 0x713: data_block =3D "Room Configuration Data Block"; break;
    > +	case 0x714: data_block =3D "Speaker Location Data Block"; break;
    > +
    > +	case 0x720: data_block =3D "InfoFrame Data Block"; break;
    > +
    > +	case 0x778: data_block =3D "HDMI Forum EDID Extension Override Data B=
lock"; break;
    > +	case 0x779: data_block =3D "HDMI Forum Sink Capability Data Block"; b=
reak;
    > +	default:
    > +		     if (tag < 0x700) data_block =3D "Unknown CTA Data Block";
    > +		else if (tag < 0x70d) data_block =3D "Unknown CTA Video-Related Data=
 Block";
    > +		else if (tag < 0x720) data_block =3D "Unknown CTA Audio-Related Data=
 Block";
    > +		else if (tag < 0x778) data_block =3D "Unknown CTA Data Block";
    > +		else if (tag < 0x780) data_block =3D "Unknown CTA HDMI-Related Data =
Block";
    > +		else                  data_block =3D "Unknown CTA Data Block";
    > +		data_block +=3D std::string(" (") + (extended ? "extended " : "") + =
"tag " + utohex(tag & 0xff) + ")";
    > +	}
    > =20
    > -	switch ((x[0] & 0xe0) >> 5) {
    > -	case 0x01:
    > -		data_block =3D "Audio Data Block";
    > -		printf("  %s\n", data_block.c_str());
    > -		cta_audio_block(x + 1, length);
    > +	printf("  %s\n", data_block.c_str());
    > +	
    > +	tag |=3D ouinum;
    > +	switch (tag) {
    > +	case 0x001: cta_audio_block(x + 1, length); break;
    > +	case 0x002: cta_svd(x + 1, length, 0); break;
    > +	case 0x003|kOUI_HDMI:
    > +		cta_hdmi_block(x + 1, length);
    > +		if (edid_minor !=3D 3)
    > +			fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_min=
or);
    >  		break;
    > -	case 0x02:
    > -		data_block =3D "Video Data Block";
    > -		printf("  %s\n", data_block.c_str());
    > -		cta_svd(x + 1, length, 0);
    > +	case 0x003|kOUI_HDMIForum:
    > +		if (previous_cta_tag !=3D (0x003|kOUI_HDMI))
    > +			fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n"=
);
    > +		if (have_hf_scdb || have_hf_vsdb)
    > +			fail("Duplicate HDMI Forum VSDB/SCDB\n");
    > +		cta_hf_scdb(x + 4, length - 3);
    > +		have_hf_vsdb =3D true;
    >  		break;
    > -	case 0x03:
    > -		oui =3D (x[3] << 16) + (x[2] << 8) + x[1];
    > -		printf("  Vendor-Specific Data Block, OUI 0x%06x", oui);
    > -		name =3D oui_name(oui);
    > -		if (oui =3D=3D 0x000c03) {
    > -			data_block =3D "Vendor-Specific Data Block (HDMI)";
    > -			cta_hdmi_block(x + 1, length);
    > -			last_block_was_hdmi_vsdb =3D 1;
    > -			first_block =3D 0;
    > -			if (edid_minor !=3D 3)
    > -				fail("The HDMI Specification uses EDID 1.3, not 1.%u\n", edid_mi=
nor);
    > -			return;
    > -		}
    > -		if (oui =3D=3D 0xc45dd8) {
    > -			data_block =3D "Vendor-Specific Data Block (HDMI Forum)";
    > -			if (!last_block_was_hdmi_vsdb)
    > -				fail("HDMI Forum VSDB did not immediately follow the HDMI VSDB\n=
");
    > -			if (have_hf_scdb || have_hf_vsdb)
    > -				fail("Duplicate HDMI Forum VSDB/SCDB\n");
    > -			printf(" (HDMI Forum)\n");
    > -			cta_hf_scdb(x + 4, length - 3);
    > -			have_hf_vsdb =3D 1;
    > -		} else if (name) {
    > -			data_block =3D std::string("Vendor-Specific Data Block (") + name +=
 ")";
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
    > -		data_block =3D "Speaker Allocation Data Block";
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
    > -			data_block =3D "Video Capability Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_vcdb(x + 2, length - 1);
    > -			break;
    > -		case 0x01:
    > -			oui =3D (x[4] << 16) + (x[3] << 8) + x[2];
    > -			printf("Vendor-Specific Video Data Block, OUI 0x%06x", oui);
    > -			name =3D oui_name(oui);
    > -			if (oui =3D=3D 0x90848b) {
    > -				data_block =3D "Vendor-Specific Video Data Block (HDR10+)";
    > -				printf(" (HDR10+)\n");
    > -				cta_hdr10plus(x + 5, length - 4);
    > -			} else if (name) {
    > -				data_block =3D std::string("Vendor-Specific Data Block (") + name =
+ ")";
    > -				printf(" (%s)\n", name);
    > -				hex_block("    ", x + 5, length - 4);
    > -			} else {
    > -				printf("\n");
    > -				hex_block("    ", x + 5, length - 4);
    > -				data_block.clear();
    > -				warn("Unknown Extended Vendor-Specific Data Block, OUI 0x%06x\n"=
, oui);
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
    > -			data_block =3D "Colorimetry Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_colorimetry_block(x + 2, length - 1);
    > -			break;
    > -		case 0x06:
    > -			data_block =3D "HDR Static Metadata Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_hdr_static_metadata_block(x + 2, length - 1);
    > -			break;
    > -		case 0x07:
    > -			data_block =3D "HDR Dynamic Metadata Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_hdr_dyn_metadata_block(x + 2, length - 1);
    > -			break;
    > -		case 0x0d:
    > -			data_block =3D "Video Format Preference Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_vfpdb(x + 2, length - 1);
    > -			break;
    > -		case 0x0e:
    > -			data_block =3D "YCbCr 4:2:0 Video Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_svd(x + 2, length - 1, 1);
    > -			break;
    > -		case 0x0f:
    > -			data_block =3D "YCbCr 4:2:0 Capability Map Data Block";
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
    > -			data_block =3D "HDMI Audio Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_hdmi_audio_block(x + 2, length - 1);
    > -			break;
    > -		case 0x13:
    > -			data_block =3D "Room Configuration Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_rcdb(x + 2, length - 1);
    > -			break;
    > -		case 0x14:
    > -			data_block =3D "Speaker Location Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_sldb(x + 2, length - 1);
    > -			break;
    > -		case 0x20:
    > -			printf("InfoFrame Data Block\n");
    > -			cta_ifdb(x + 2, length - 1);
    > -			break;
    > -		case 0x78:
    > -			data_block =3D "HDMI Forum EDID Extension Override Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			cta_hf_eeodb(x + 2, length - 1);
    > -			// This must be the first CTA block
    > -			if (!first_block)
    > -				fail("Block starts at a wrong offset\n");
    > -			break;
    > -		case 0x79:
    > -			data_block =3D "HDMI Forum Sink Capability Data Block";
    > -			printf("%s\n", data_block.c_str());
    > -			if (!last_block_was_hdmi_vsdb)
    > -				fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n=
");
    > -			if (have_hf_scdb || have_hf_vsdb)
    > -				fail("Duplicate HDMI Forum VSDB/SCDB\n");
    > -			if (x[2] || x[3])
    > -				printf("  Non-zero SCDB reserved fields!\n");
    > -			cta_hf_scdb(x + 4, length - 3);
    > -			have_hf_scdb =3D 1;
    > -			break;
    > -		default:
    > -			if (x[1] <=3D 12)
    > -				printf("Unknown CTA Video-Related");
    > -			else if (x[1] <=3D 31)
    > -				printf("Unknown CTA Audio-Related");
    > -			else if (x[1] >=3D 120 && x[1] <=3D 127)
    > -				printf("Unknown CTA HDMI-Related");
    > -			else
    > -				printf("Unknown CTA");
    > -			printf(" Data Block (extended tag 0x%02x, length %u)\n", x[1], le=
ngth - 1);
    > -			hex_block("    ", x + 2, length - 1);
    > -			data_block.clear();
    > -			warn("Unknown Extended CTA Data Block 0x%02x\n", x[1]);
    > -			break;
    > -		}
    > +	case 0x004: cta_sadb(x + 1, length); break;
    > +	case 0x700: cta_vcdb(x + 2, length - 1); break;
    > +	case 0x701|kOUI_HDR10: cta_hdr10plus(x + 5, length - 4); break;
    > +	case 0x705: cta_colorimetry_block(x + 2, length - 1); break;
    > +	case 0x706: cta_hdr_static_metadata_block(x + 2, length - 1); break=
;
    > +	case 0x707: cta_hdr_dyn_metadata_block(x + 2, length - 1); break;
    > +	case 0x70d: cta_vfpdb(x + 2, length - 1); break;
    > +	case 0x70e: cta_svd(x + 2, length - 1, 1); break;
    > +	case 0x70f: cta_y420cmdb(x + 2, length - 1); break;
    > +	case 0x712: cta_hdmi_audio_block(x + 2, length - 1); break;
    > +	case 0x713: cta_rcdb(x + 2, length - 1); break;
    > +	case 0x714: cta_sldb(x + 2, length - 1); break;
    > +	case 0x720: cta_ifdb(x + 2, length - 1); break;
    > +	case 0x778:=20
    > +		cta_hf_eeodb(x + 2, length - 1);
    > +		// This must be the first CTA block
    > +		if (cta_block_number !=3D 0)
    > +			fail("Block starts at a wrong offset\n");
    >  		break;
    > -	default: {
    > -		unsigned tag =3D (*x & 0xe0) >> 5;
    > -		unsigned length =3D *x & 0x1f;
    > -		printf("  Unknown CTA tag 0x%02x, length %u\n", tag, length);
    > -		hex_block("    ", x + 1, length);
    > -		data_block.clear();
    > -		warn("Unknown CTA Data Block %u\n", tag);
    > +	case 0x779:
    > +		if (previous_cta_tag !=3D (0x003|kOUI_HDMI))
    > +			fail("HDMI Forum SCDB did not immediately follow the HDMI VSDB\n"=
);
    > +		if (have_hf_scdb || have_hf_vsdb)
    > +			fail("Duplicate HDMI Forum VSDB/SCDB\n");
    > +		if (x[2] || x[3])
    > +			printf("    Non-zero SCDB reserved fields!\n");
    > +		cta_hf_scdb(x + 4, length - 3);
    > +		have_hf_scdb =3D true;
    >  		break;
    > +	default:
    > +		warn("Unknown %s\n", data_block.c_str());
    > +		hex_block("    ", x + 1 + extended + (ouinum ? 3 : 0), length - (e=
xtended + (ouinum ? 3 : 0)));
    >  	}
    > -	}
    > -	first_block =3D 0;
    > -	last_block_was_hdmi_vsdb =3D 0;
    > +	cta_block_number++;
    > +	previous_cta_tag =3D tag;
    >  }
    > =20
    >  void edid_state::preparse_cta_block(const unsigned char *x)
    >=20
   =20
   =20



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB231088B2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 07:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfKYGaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 01:30:23 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.138]:39009 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfKYGaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 01:30:22 -0500
Received: from [192.168.0.100] ([70.71.78.228])
        by shaw.ca with ESMTPA
        id Z7sxieRWuRnrKZ7szic61W; Sun, 24 Nov 2019 23:30:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574663413;
        bh=2n6yVg1Nq+uIH6qjajOLWkebz1kxlyvaIF1qgDqVNn8=;
        h=Date:Subject:From:To:CC:References:In-Reply-To;
        b=EYzb+GuAZfKvfASRP1zSHzH/B67m/Bokdt2mO1ojK/IPmxcEdhZfbYp6gjuIGd64N
         GLXPDBPuOuhHMT8+/IKdUDHn0yge+SmCvjh6JIE5xQVWE6LFigWYdmJdd3ao2e01/k
         E9xmOIRSxRtOXPGXMKZVlorYXGDbH3McB+YObz1Q5ACAT9IFw1bQvLDsBmJALJEDkE
         h5C7SyETyYZOoX4tzR1csMgXZW6NcO0nCjJuLr3000hURp85ioLzKyzxFx5Xs7WZIk
         6kyMS8OhVrApczDz5hyHTXV6bq0mhso1WP6X4qSUhgg+R6VkuYkf0DYuuinWDEelcr
         +/DyzhcZcVhPw==
X-Authority-Analysis: v=2.3 cv=L7FjvNb8 c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=_Dj-zB-qAAAA:8
 a=BIw6gxMGEEJ_jLjU3qcA:9 a=h1PnKD07Bh6ZC4bP:21 a=w3I0MSUiPGhy2WFY:21
 a=QEXdDO2ut3YA:10 a=c-cOe7UV8MviEfHuAVEQ:22
User-Agent: Microsoft-MacOutlook/10.1f.0.191110
Date:   Sun, 24 Nov 2019 22:30:04 -0800
Subject: Re: [PATCH 09/10] edid-decode: DisplayID additions
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>
Message-ID: <FB99DB7A-A105-4FC5-A6FE-2FF8D20A1420@shaw.ca>
Thread-Topic: [PATCH 09/10] edid-decode: DisplayID additions
References: <20191123164604.268-1-joevt@shaw.ca> <20191123164604.268-10-joevt@shaw.ca>
In-Reply-To: <86c236e0-76b6-a41f-cb08-d90952b36e2c@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4wfF/z5lAWdhdhasBUsQOB+jb1rIV0X7StW7clfZmXncJa+/ZhCN3HT7xUB5xRhZcA29Lbu49WcGmL/LzOi87jd41CecagPjRh5obByzHkKta1x+tZpsmL
 OJawRpN67TxAssDEsn7shRcXOgiUUPnr8EfFwXbnIae0K3agMBx2gf/Y7w2kCDbtZ9ZyQ1btjXN2YEuuU66Nbdcr41mWxm6G3EA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1)
Yes, my displayid_vesa_dmt_timings contains the same info as displayid_vesa=
_dmt.

displayid_vesa_dmt was added after I had created parse_displayid_timing whi=
ch uses displayid_vesa_dmt_timings and displayid_cta_timings for " Type 1 VE=
SA DMT Timings Block" and " CTA Timings Block".

Three options:
a) remove displayid_vesa_dmt_timings
b) keep parse_displayid_timing, displayid_vesa_dmt_timings, and displayid_c=
ta_timings; remove displayid_vesa_dmt.
c) replace displayid_cta_timings with a displayid_cta array containing elem=
ents of the same type as displayid_vesa_dmt; rewrite parse_displayid_timing =
to use displayid_vesa_dmt  (like "Type 1 VESA DMT Timings Block" does), and =
displayid_cta : only problem here is that cta has floats for refresh rate.

1a is probably the best choice as suggested by the answer to your next ques=
tion:

2)
Yes, displayid_cta_timings is identical to edid_cta_modes1 (only the first =
64 VICs are used). I don't think I noticed that before. My displayid_cta_tim=
ings contains extra info about refresh rates that are not integer (23.97/24H=
z, 59.94/60Hz, 29.97/30Hz, 119.88/120Hz, 239.76/240Hz). It also shows the 14=
40 wide timings are double clocked from 720. It has the correct interlaced f=
lag for VIC 44 and 45. Perhaps that info could be placed into edid_cta_modes=
1 and edid_cta_modes2 (we could also add info about the H and V blanking fro=
nt porch, width, and back porch). Then displayid_cta_timings can be removed.=
 Then we do 1a above and rewrite parse_displayid_timing to use edid_cta_mode=
s1 (with the modifications from displayid_cta_timings)

3)
See #1 above. The "#if 0" is there to show how I used parse_displayid_timin=
g with displayid_vesa_dmt_timings before displayid_vesa_dmt was created. The=
 changes suggested in #2 will remove that.


=EF=BB=BFOn 2019-11-24, 2:03 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

=C2=A0=C2=A0=C2=A0 Hi Joe,
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0I have a few comments about this patch. See below:
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0On 11/23/19 5:46 PM, joevt wrote:
=C2=A0=C2=A0=C2=A0 > - Decode "Display Parameters Block". Example in lg-ultrafine-5k*
=C2=A0=C2=A0=C2=A0 > - Decode "CTA Timings Block". Similar to "Type 1 VESA DMT Timings =
Block".
=C2=A0=C2=A0=C2=A0 > - Decode "GP ASCII String Block". Example in dell-up2715k-mdp-swit=
chresx
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0> - Added DisplayID 2.0 tags:
=C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0 - Decode "Display Interface Features Data Block". Example =
in acer-xv273k* but it appears to be missing the "additional combinations co=
unt" byte.
=C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0 - Decode "ContainerID Data Block". Example in lg-ultrafine=
-5k*
=C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0 - Unknown DisplayID blocks are dumped as hex.
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0> - Show DisplayID tag hex byte to make it possible to distinguish =
between DisplayID 1.3 and 2.0 spec blocks of the same name.
=C2=A0=C2=A0=C2=A0 > - Show DisplayID product type.
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0> Signed-off-by: Joe van Tunen <joevt@shaw.ca>
=C2=A0=C2=A0=C2=A0 > ---
=C2=A0=C2=A0=C2=A0 >=C2=A0 edid-decode.c | 525 ++++++++++++++++++++++++++++++++++++++++++++=
++++--
=C2=A0=C2=A0=C2=A0 >=C2=A0 1 file changed, 504 insertions(+), 21 deletions(-)
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0> diff --git a/edid-decode.c b/edid-decode.c
=C2=A0=C2=A0=C2=A0 > index 2f2f1c5..29f8f88 100644
=C2=A0=C2=A0=C2=A0 > --- a/edid-decode.c
=C2=A0=C2=A0=C2=A0 > +++ b/edid-decode.c
=C2=A0=C2=A0=C2=A0 > @@ -55,6 +55,7 @@ static int did_detailed_timing =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_name_descriptor =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_serial_string =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_ascii_string =3D 0;
=C2=A0=C2=A0=C2=A0 > +static int has_GP_ascii_string =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_range_descriptor =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_preferred_timing =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_checksum =3D 1;
=C2=A0=C2=A0=C2=A0 > @@ -64,6 +65,7 @@ static int has_valid_cvt =3D 1;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_serial_number =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_serial_string =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_ascii_string =3D 0;
=C2=A0=C2=A0=C2=A0 > +static int has_valid_GP_ascii_string =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_name_descriptor =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_detailed_blocks =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int has_valid_descriptor_ordering =3D 1;
=C2=A0=C2=A0=C2=A0 > @@ -2528,6 +2530,53 @@ static int parse_cta(const unsigned char *x=
)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
=C2=A0=C2=A0=C2=A0 >=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +
=C2=A0=C2=A0=C2=A0 > +static const char *feature_support_flags[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "De-interlacing",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Support ACP, ISRC1, or ISRC2packets",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Fixed pixel format",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Fixed timing",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Power management (DPM)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Audio input override",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Separate audio inputs provided",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Audio support on video interface"
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void print_flag_lines(const char *indent, const char *labe=
l, unsigned char flag_byte, const char **flags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flag_byte) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("%s\n", label);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < 8;=
 i++) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flag_byte & (1<<i)) {
=C2=A0 =C2=A0=C2=A0> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("%s%s\n", indent, flags[i])=
;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void parse_displayid_parameters(const unsigned char *x) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int revisionflags=3Dx[1];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len=3Dx[2];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (revisionflags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Unexpected =
revision and flags (0x%02x !=3D 0)\n", revisionflags);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len !=3D 12) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is d=
ifferent than expected (%d !=3D 12)\n", len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Image size:=
 %.1f mm x %.1f mm\n", ((x[4]<<8) + x[3]) / 10.0, ((x[6]<<8) + x[5]) / 10.0)=
;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Pixels: %d =
x %d\n", (x[8]<<8) + x[7], (x[10]<<8) + x[9]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flag_lines("=C2=A0=C2=A0=
=C2=A0 ", "=C2=A0 Feature support flags:", x[11], feature_support_flags);
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x[12] !=3D 0xff) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Gamma: %.2f\n", ((x[12] + 100.0) / 100.0));
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Aspect rati=
o: %.2f\n", ((x[13] + 100.0) / 100.0));
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Dynamic bpc=
 native: %d\n", (x[14] & 0xf) + 1);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Dynamic bpc=
 overall: %d\n", ((x[14] >> 4) & 0xf) + 1);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } // else
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 >=C2=A0 static void parse_displayid_detailed_timing(const unsigned char =
*x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned ha, hbl, hso, hspw;
=C2=A0=C2=A0=C2=A0 > @@ -2713,18 +2762,343 @@ static const struct {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {2560, 1600, 120, 16, 10, 203217, 552750, 1},
=C2=A0=C2=A0=C2=A0 >=C2=A0 };
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +const char *displayid_vesa_dmt_timings[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x350@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x400@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x400@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x480@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x480@72Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x480@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x480@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@56Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@72Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "800x600@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "848x480@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@43Hz (INT)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@70Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1024x768@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1152x864@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x768@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x768@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x768@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x768@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x768@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x800@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x800@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x800@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x800@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x800@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x960@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x960@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x960@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x1024@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x1024@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x1024@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x1024@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1360x768@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1360x768@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1400x1050@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1400x1050@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1400x1050@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1400x1050@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1400x1050@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x900@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x900@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x900@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x900@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x900@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@65Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@70Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1600x1200@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1680x1050@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1680x1050@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1680x1050@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1680x1050@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1680x1050@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1792x1344@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1792x1344@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1792x1344@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1856x1392@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1856x1392@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1856x1392@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1200@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1200@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1200@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1200@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1200@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1440@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1440@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1440@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2560x1600@60Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2560x1600@60Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2560x1600@75Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2560x1600@85Hz",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2560x1600@120Hz (RB)",
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0Isn't this effectively the same as the displayid_vesa_dmt array?
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +
=C2=A0=C2=A0=C2=A0 > +const char *displayid_cta_timings[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "640x480p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080i@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x240p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x240p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x480i@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x480i@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x240p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x240p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x480p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x480p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080i@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x288p@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x288p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x576i@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x576i@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x288p@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x288p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x576p@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1440x576p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@23.97/24Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@25Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@29.97/30Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x480p@59.94/60Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x480p@59.94/60Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x576p@50Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "2880x576p@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080i@50Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080i@100Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@100Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@100Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@100Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@100Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@100Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080i@119.88/120Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@119.88/120Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@119.88/120Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@119.88/120Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@119.88/120Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@119.88/120Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@200Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x576p@200Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@200Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x576i@200Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@239.76/240Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720x480p@239.76/240Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@239.76/240Hz 4:3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "720(1440)x480i@239.76/240Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@23.97/24Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@25Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1280x720p@29.97/30Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@120Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1920x1080p@100Hz 16:9",
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0And this is the same as edid_cta_modes1[].
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +
=C2=A0=C2=A0=C2=A0 > +static void parse_displayid_timing(const unsigned char *x, int ex=
pectedlen, const char** list)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int revisionflags=3Dx[1];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len=3Dx[2];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (revisionflags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Unexpected =
revision and flags (0x%02x !=3D 0)\n", revisionflags);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len > expectedlen) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is g=
reater than expected (%d > %d)\n", len, expectedlen);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (len < expectedlen) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is l=
ess than expected (%d < %d)\n", len, expectedlen);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x +=3D 3;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < len * 8; i++) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x[i>>3] & (1<<(i&7=
))) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((i>>3) < expectedlen) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 %s\n", list[i]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 #%d\n", i+1);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void parse_displayid_gp_string(const unsigned char *x)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int revisionflags=3Dx[1];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (revisionflags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Unexpected =
revision and flags (0x%02x !=3D 0)\n", revisionflags);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static const char *bpc444[] =3D {"6", "8", "10", "12", "14", "16", =
NULL, NULL};
=C2=A0=C2=A0=C2=A0 > +static const char *bpc4xx[] =3D {"8", "10", "12", "14", "16", NULL,=
 NULL, NULL};
=C2=A0=C2=A0=C2=A0 > +static const char *audiorates[] =3D {"32", "44.1", "48", NULL, NULL=
, NULL, NULL, NULL};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static const char *colorspace_eotf_combinations[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sRGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.601",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.709/BT.1886",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Adobe RGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "DCI-P3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.2020",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.2020/SMPTE ST 2084"
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static const char *colorspace_eotf_reserved[] =3D {NULL, NULL, NULL=
, NULL, NULL, NULL, NULL, NULL};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static const char *colorspaces[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Undefined",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sRGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.601",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.709",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Adobe RGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "DCI-P3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.2020",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Custom"
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static const char *eotfs[] =3D {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Undefined",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sRGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.601",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.1886",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Adobe RGB",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "DCI-P3",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BT.2020",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Gamma function",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "SMPTE ST 2084",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Hybrid Log",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Custom"
=C2=A0=C2=A0=C2=A0 > +};
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void print_flags(const char *label, unsigned char flag_byt=
e, const char **flags, int reverse)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flag_byte) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("%s: ", label);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int countflags =3D 0;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < 8;=
 i++) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flag_byte & (1<<(reverse?7-i:i))) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (countflags)
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf(", ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flags[i])
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("%s", flags[i]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("Undefined(%d)", i);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 countflags++;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void parse_displayid_interface_features(const unsigned cha=
r *x)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int revisionflags=3Dx[1];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len=3Dx[2];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (revisionflags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Unexpected =
revision and flags (0x%02x !=3D 0)\n", revisionflags);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len < 9) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is l=
ess than expected (%d < 9)\n", len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Support=
ed bpc for RGB encoding", x[3], bpc444, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted bpc for YCbCr 4:4:4 encoding", x[4], bpc444, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted bpc for YCbCr 4:2:2 encoding", x[5], bpc4xx, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted bpc for YCbCr 4:2:0 encoding", x[6], bpc4xx, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x[7])
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Minimum pixel rate at which YCbCr 4:2:0 encoding is sup=
ported: %.3f MHz\n", 74.25 * x[7]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted audio capability and features (kHz)", x[8], audiorates, 1);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted color space and EOTF standard combination 1", x[9], colorspace_eotf_comb=
inations, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_flags("=C2=A0 Suppor=
ted color space and EOTF standard combination 2", x[10], colorspace_eotf_res=
erved, 0);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i =3D 0;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len >=3D 9 && x[11] =
> 0) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Supported color space and EOTF additional combinations:=
");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 1; i <=3D x[11]; i++) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i > 7) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("\n=C2=A0 Number of additional color space and EOTF combinations (%d) is gr=
eater than allowed (7).", x[11]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (9 + i > len) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("\n=C2=A0 Number of additional color space and EOTF combinations (%d) is to=
o many to fit in block (%d).", x[11], len - 9);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *colorspace =3D "Out of r=
ange";
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *eotf =3D "Out of range";
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int colorspace_index =3D (x[11 + i] =
>> 4) & 0xf;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int eotf_index =3D x[11 + i] & 0xf;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (colorspace_index < sizeof(colo=
rspaces) / sizeof(colorspaces[0])) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
lorspace =3D colorspaces[colorspace_index];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (eotf_index < sizeof(eotfs) / s=
izeof(eotfs[0])) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eo=
tf =3D eotfs[eotf_index];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (i > 1)
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf(", ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!strcmp(colorspace, eotf)) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("%s", colorspace);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
intf("%s/%s", colorspace, eotf);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 } // for
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } // x[11]
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len > 9 + i) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is greater than expected (%d > %d)\n", len, 9 + =
i);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + 11 + i, len - 9 - i);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (len !=3D 9 + =
i)=C2=A0 {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is unexpected (%d !=3D %d)\n", len, 9 + i);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +static void parse_displayid_ContainerID(const unsigned char *x)
=C2=A0=C2=A0=C2=A0 > +{
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int revisionflags=3Dx[1];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len=3Dx[2];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (revisionflags) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Unexpected =
revision and flags (0x%02x !=3D 0)\n", revisionflags);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x +=3D 3;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len !=3D 16) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Length is u=
nexpected (%d !=3D 16)\n", len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 %02x%02x%02=
x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x\n",x[0],x[1],x[2],=
x[3],x[4],x[5],x[6],x[7],x[8],x[9],x[10],x[11],x[12],x[13],x[14],x[15]);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +}
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 >=C2=A0 static int parse_displayid(const unsigned char *x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned char *orig =3D x;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned version =3D x[1];
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned length =3D x[2];
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned producttype =3D x[3];
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned ext_count =3D x[4];
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned i;
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cur_block =3D "DisplayID";
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Length %u, version %u.%u, extension count %=
u\n",
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 length, version >> 4, version & 0xf, ex=
t_count);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Length %u, version %u.%u, type %u, extension c=
ount %u\n",
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 length, version >> 4, version & 0xf, prod=
ucttype, ext_count);
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0>=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned offset =3D 5;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (length > 0) {
=C2=A0=C2=A0=C2=A0 > @@ -2734,33 +3108,49 @@ static int parse_displayid(const unsigned =
char *x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (len =3D=3D 0)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (tag) {
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DisplayID 1.3:
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Product ID Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Product ID Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 1:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Parameters Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Parameters Block (%02Xh):\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_parameters(x + offset);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 2:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Color Characteristics Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Color Characteristics Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 3: {
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 1 Detailed Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 1 Detailed Timings Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < len / 20; i++) {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_detailed_timing=
(&x[offset + 3 + (i * 20)]);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 4:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 2 Detailed Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 2 Detailed Timings Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 5:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 3 Short Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 3 Short Timings Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 6:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 4 DMT Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 4 DMT Timings Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 7:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 1 VESA DMT Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 1 VESA DMT Timings Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #if 0
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_timing(x + offset, 10, displayid_vesa_dmt_timings)=
;
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0What is the reason for the #if 0?
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0I now get a warning that displayid_vesa_dmt_timings is unused.
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #else
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < min(len, 10) * 8; i++) {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (x[offset + 3 + i / 8] & (1 =
<< (i % 8))) {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 printf("=C2=A0 %ux%u%s@%uHz %s%u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
=C2=A0=C2=A0=C2=A0 > @@ -2779,33 +3169,51 @@ static int parse_displayid(const unsigned =
char *x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 max_pixclk_khz =3D max(max_pixclk_khz, displayid_vesa_dmt[i].pixclk_khz);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #endif
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 8:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("CTA Timings Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("CTA Timings Block (%02Xh):\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_timing(x + offset, 8, displayid_cta_timings);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 9:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Video Timing Range Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Video Timing Range Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xa:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Product Serial Number Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Product Serial Number Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xb:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("GP ASCII String Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("GP ASCII String Block (%02Xh): %s\n", tag, extract_string(=
"GP ASCII String", x + offset + 3, &has_valid_GP_ascii_string, len));
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 has_GP_ascii_string =3D 1;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_gp_string(x + offset);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xc:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Device Data Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Device Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xd:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Interface Power Sequencing Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Interface Power Sequencing Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xe:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Transfer Characteristics Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Transfer Characteristics Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0xf:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Interface Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Interface Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x10:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Stereo Display Interface Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Stereo Display Interface Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x12: {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned capabilities =3D x[offset + 3];
=C2=A0=C2=A0=C2=A0 > @@ -2817,7 +3225,7 @@ static int parse_displayid(const unsigned ch=
ar *x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned tile_height =3D x[offset + 9] | (x[offset + 10] << 8);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned pix_mult =3D x[offset + 11];
=C2=A0=C2=A0=C2=A0 >=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Tiled Display Topology Block\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Tiled Display Topology Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Capabilities: 0x%08x\n", capabilities);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Num horizontal tiles: %u Num vertical tiles: %u\n", =
num_h_tile + 1, num_v_tile + 1);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 Tile location: %u, %u\n", tile_h_location, tile_v_lo=
cation);
=C2=A0=C2=A0=C2=A0 > @@ -2841,8 +3249,80 @@ static int parse_displayid(const unsigned c=
har *x)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DisplayID 2.0
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x20:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Product ID Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x21:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Parameters Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x22:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 7 Timing - Detailed Timing Data Block (%02Xh)\n", tag=
);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x23:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 8 Timing - Enumerated Timing Code Data Block (%02Xh)\=
n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x24:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Type 9 Timing - Formula-based Timing Data Block (%02Xh)\n"=
, tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x25:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Dynamic Video Timing Range Limits Data Block (%02Xh)\n", t=
ag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x26:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Display Interface Features Data Block (%02Xh):\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_interface_features(x + offset);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x27:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Stereo Display Interface Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0 =C2=A0> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x28:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Tiled Display Topology Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x29:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("ContainerID Data Block (%02Xh):\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 parse_displayid_ContainerID(x + offset);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 2Ah .. 7Dh RESERVED=
 for Additional VESA-defined Data Blocks
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x7e: // DisplayI=
D 2.0
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x7f: // DisplayI=
D 1.3
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Vendor-specific Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 7Fh .. 80h RESERVED
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0x81:
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("CTA DisplayID Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 > +
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // 82h .. FFh RESERVED
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
=C2=A0=C2=A0=C2=A0 > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Unknown DisplayID Data Block 0x%x\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("Unknown DisplayID Data Block (%02Xh)\n", tag);
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("=C2=A0 ");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hex_block(x + offset + 3, len);
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 length -=3D len + 3;
=C2=A0=C2=A0=C2=A0 > @@ -3687,6 +4167,7 @@ static int edid_from_file(const char *from_f=
ile, const char *to_file,
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0!has_valid_range_descriptor ||
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0(has_name_descriptor && !has_valid_name_des=
criptor) ||
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0(has_serial_string && !has_valid_serial_str=
ing) ||
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (has_GP_ascii_string &=
& !has_valid_GP_ascii_string) ||
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0(has_ascii_string && !has_valid_ascii_strin=
g)) {
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conformant =3D 0;
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("EDID block =
does not conform:\n");
=C2=A0=C2=A0=C2=A0 > @@ -3709,6 +4190,8 @@ static int edid_from_file(const char *from_f=
ile, const char *to_file,
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\tInvalid Monitor Name descriptor\n");
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (has_ascii_strin=
g && !has_valid_ascii_string)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\tInvalid ASCII string\n");
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (has_GP_ascii_strin=
g && !has_valid_GP_ascii_string)
=C2=A0=C2=A0=C2=A0 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\tInvalid GP ASCII string\n");
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (has_serial_stri=
ng && !has_valid_serial_string)
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("\tInvalid serial string\n");
=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0 >=20
=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0Regards,
=C2=A0=C2=A0=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
=C2=A0=C2=A0=C2=A0=20



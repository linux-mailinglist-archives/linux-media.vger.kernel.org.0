Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35B86108A9B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 10:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfKYJPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 04:15:15 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47349 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725991AbfKYJPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 04:15:15 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZASYiQnkAecrtZASbiI1VM; Mon, 25 Nov 2019 10:15:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574673310; bh=JRimo0yQJQxjx3j563U+jPwafkSNAVnUFilgDemmoTw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=CAWnNFgtuA5QPzao2oMkBa1OLx3C2lte1SImKq8kPCDyKusAWiybtgTJeZ0Q9jRhe
         3GB/6zAlKrtKADshP3KZ0OqBOI/FhGW8HubY5aHB0PBqMUPICOmP2ipe/gc50Blte3
         QbyVvkT2wvqbjAHBwIElkT+gFoAUkANGwArLOUjzRE+eWak4FhX8Z6g/wIPydKKCL/
         svM2T3vP5X+FLsJZSi/hwHckZsQoWXLdz8TH3swFO65RVFjtOTEoY+1ebUoZY6EG0j
         8yYKJlcO+Hfe46jOVvXTC0FAlPUmE95IwEBSMa1/GHiq3Wch1JCpshdTiRvmz/Hyh4
         ITlhqhVPwaD+w==
Subject: Re: [PATCH 09/10] edid-decode: DisplayID additions
To:     Joe van Tunen <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20191123164604.268-1-joevt@shaw.ca>
 <20191123164604.268-10-joevt@shaw.ca>
 <FB99DB7A-A105-4FC5-A6FE-2FF8D20A1420@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d930b5a1-5870-fbab-5bcf-8151aa66bbfd@xs4all.nl>
Date:   Mon, 25 Nov 2019 10:15:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <FB99DB7A-A105-4FC5-A6FE-2FF8D20A1420@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG4W6X0QpQRWpm3j9pzjbuKqLolSPxDJnQ6KdNg54gbr2xHE3vivSEEatl4Q8u4Et1QlgF+536wzm0lUaFbqZ9UXpzfhTM6KYHD30n2vn8ycxp82FcwP
 WrmhEY1Z5c4AePyiS0YfXrkUho/vHCqyd8BMl8E0V8XFouNZIDs8Rvo53MvAox05vTqm1sb/VRSjnevVTz6dvJRRQIjlE2bdc1Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/25/19 7:30 AM, Joe van Tunen wrote:
> 1)
> Yes, my displayid_vesa_dmt_timings contains the same info as displayid_vesa_dmt.
> 
> displayid_vesa_dmt was added after I had created parse_displayid_timing which uses displayid_vesa_dmt_timings and displayid_cta_timings for " Type 1 VESA DMT Timings Block" and " CTA Timings Block".
> 
> Three options:
> a) remove displayid_vesa_dmt_timings
> b) keep parse_displayid_timing, displayid_vesa_dmt_timings, and displayid_cta_timings; remove displayid_vesa_dmt.
> c) replace displayid_cta_timings with a displayid_cta array containing elements of the same type as displayid_vesa_dmt; rewrite parse_displayid_timing to use displayid_vesa_dmt  (like "Type 1 VESA DMT Timings Block" does), and displayid_cta : only problem here is that cta has floats for refresh rate.
> 
> 1a is probably the best choice as suggested by the answer to your next question:
> 
> 2)
> Yes, displayid_cta_timings is identical to edid_cta_modes1 (only the first 64 VICs are used). I don't think I noticed that before. My displayid_cta_timings contains extra info about refresh rates that are not integer (23.97/24Hz, 59.94/60Hz, 29.97/30Hz, 119.88/120Hz, 239.76/240Hz). 

Those 59.94/60 timings are implied in the CTA standard. Any frame rate that can be divided by 6 can
also be multiplied by 1000/1001 to get an alternate reduced frame rate.

I fixed the VIC 44/45: I missed that those are interlaced timings, it's now corrected in the table.

It also shows the 1440 wide timings are double clocked from 720. It has the correct interlaced flag for VIC 44 and 45. Perhaps that info
could be placed into edid_cta_modes1 and edid_cta_modes2 (we could also add info about the H and V blanking front porch, width, and back
porch). Then displayid_cta_timings can be removed. Then we do 1a above and rewrite parse_displayid_timing to use edid_cta_modes1 (with the
modifications from displayid_cta_timings)

edid-decode really needs a single struct that is used to represent a timings in these timing tables.
You can start by using the same struct for displayid_vesa_dmt and edid_cta_modes1/2. The string in
edid_cta_modes1/2 can be dropped since it can be regenerated from the data in the struct.

So do an initial patch converting the three tables to the same struct, then
a second patch for these DisplayID additions.

Regards,

	Hans

> 
> 3)
> See #1 above. The "#if 0" is there to show how I used parse_displayid_timing with displayid_vesa_dmt_timings before displayid_vesa_dmt was created. The changes suggested in #2 will remove that.
> 
> 
> ﻿On 2019-11-24, 2:03 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:
> 
>     Hi Joe,
>     
>     I have a few comments about this patch. See below:
>     
>     On 11/23/19 5:46 PM, joevt wrote:
>     > - Decode "Display Parameters Block". Example in lg-ultrafine-5k*
>     > - Decode "CTA Timings Block". Similar to "Type 1 VESA DMT Timings Block".
>     > - Decode "GP ASCII String Block". Example in dell-up2715k-mdp-switchresx
>     > 
>     > - Added DisplayID 2.0 tags:
>     >     - Decode "Display Interface Features Data Block". Example in acer-xv273k* but it appears to be missing the "additional combinations count" byte.
>     >     - Decode "ContainerID Data Block". Example in lg-ultrafine-5k*
>     >     - Unknown DisplayID blocks are dumped as hex.
>     > 
>     > - Show DisplayID tag hex byte to make it possible to distinguish between DisplayID 1.3 and 2.0 spec blocks of the same name.
>     > - Show DisplayID product type.
>     > 
>     > Signed-off-by: Joe van Tunen <joevt@shaw.ca>
>     > ---
>     >  edid-decode.c | 525 ++++++++++++++++++++++++++++++++++++++++++++++++--
>     >  1 file changed, 504 insertions(+), 21 deletions(-)
>     > 
>     > diff --git a/edid-decode.c b/edid-decode.c
>     > index 2f2f1c5..29f8f88 100644
>     > --- a/edid-decode.c
>     > +++ b/edid-decode.c
>     > @@ -55,6 +55,7 @@ static int did_detailed_timing = 0;
>     >  static int has_name_descriptor = 0;
>     >  static int has_serial_string = 0;
>     >  static int has_ascii_string = 0;
>     > +static int has_GP_ascii_string = 0;
>     >  static int has_range_descriptor = 0;
>     >  static int has_preferred_timing = 0;
>     >  static int has_valid_checksum = 1;
>     > @@ -64,6 +65,7 @@ static int has_valid_cvt = 1;
>     >  static int has_valid_serial_number = 0;
>     >  static int has_valid_serial_string = 0;
>     >  static int has_valid_ascii_string = 0;
>     > +static int has_valid_GP_ascii_string = 0;
>     >  static int has_valid_name_descriptor = 0;
>     >  static int has_valid_detailed_blocks = 0;
>     >  static int has_valid_descriptor_ordering = 1;
>     > @@ -2528,6 +2530,53 @@ static int parse_cta(const unsigned char *x)
>     >         return ret;
>     >  }
>     >  
>     > +
>     > +static const char *feature_support_flags[] = {
>     > +      "De-interlacing",
>     > +      "Support ACP, ISRC1, or ISRC2packets",
>     > +      "Fixed pixel format",
>     > +      "Fixed timing",
>     > +      "Power management (DPM)",
>     > +      "Audio input override",
>     > +      "Separate audio inputs provided",
>     > +      "Audio support on video interface"
>     > +};
>     > +
>     > +static void print_flag_lines(const char *indent, const char *label, unsigned char flag_byte, const char **flags) {
>     > +      if (flag_byte) {
>     > +                      printf("%s\n", label);
>     > +                      for (int i = 0; i < 8; i++) {
>     > +                                      if (flag_byte & (1<<i)) {
>     > +                                                      printf("%s%s\n", indent, flags[i]);
>     > +                                      }
>     > +                      }
>     > +      }
>     > +}
>     > +
>     > +static void parse_displayid_parameters(const unsigned char *x) {
>     > +      int revisionflags=x[1];
>     > +      int len=x[2];
>     > +      if (revisionflags) {
>     > +                      printf("  Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
>     > +      }
>     > +      if (len != 12) {
>     > +                      printf("  Length is different than expected (%d != 12)\n", len);
>     > +                      printf("  ");
>     > +                      hex_block(x + 3, len);
>     > +      } else {
>     > +                      printf("  Image size: %.1f mm x %.1f mm\n", ((x[4]<<8) + x[3]) / 10.0, ((x[6]<<8) + x[5]) / 10.0);
>     > +                      printf("  Pixels: %d x %d\n", (x[8]<<8) + x[7], (x[10]<<8) + x[9]);
>     > +                      print_flag_lines("    ", "  Feature support flags:", x[11], feature_support_flags);
>     > +
>     > +                      if (x[12] != 0xff) {
>     > +                                      printf("  Gamma: %.2f\n", ((x[12] + 100.0) / 100.0));
>     > +                      }
>     > +                      printf("  Aspect ratio: %.2f\n", ((x[13] + 100.0) / 100.0));
>     > +                      printf("  Dynamic bpc native: %d\n", (x[14] & 0xf) + 1);
>     > +                      printf("  Dynamic bpc overall: %d\n", ((x[14] >> 4) & 0xf) + 1);
>     > +      } // else
>     > +}
>     > +
>     >  static void parse_displayid_detailed_timing(const unsigned char *x)
>     >  {
>     >         unsigned ha, hbl, hso, hspw;
>     > @@ -2713,18 +2762,343 @@ static const struct {
>     >         {2560, 1600, 120, 16, 10, 203217, 552750, 1},
>     >  };
>     >  
>     > +const char *displayid_vesa_dmt_timings[] = {
>     > +      "640x350@85Hz",
>     > +      "640x400@85Hz",
>     > +      "720x400@85Hz",
>     > +      "640x480@60Hz",
>     > +      "640x480@72Hz",
>     > +      "640x480@75Hz",
>     > +      "640x480@85Hz",
>     > +      "800x600@56Hz",
>     > +      "800x600@60Hz",
>     > +      "800x600@72Hz",
>     > +      "800x600@75Hz",
>     > +      "800x600@85Hz",
>     > +      "800x600@120Hz (RB)",
>     > +      "848x480@60Hz",
>     > +      "1024x768@43Hz (INT)",
>     > +      "1024x768@60Hz",
>     > +      "1024x768@70Hz",
>     > +      "1024x768@75Hz",
>     > +      "1024x768@85Hz",
>     > +      "1024x768@120Hz (RB)",
>     > +      "1152x864@75Hz",
>     > +      "1280x768@60Hz (RB)",
>     > +      "1280x768@60Hz",
>     > +      "1280x768@75Hz",
>     > +      "1280x768@85Hz",
>     > +      "1280x768@120Hz (RB)",
>     > +      "1280x800@60Hz (RB)",
>     > +      "1280x800@60Hz",
>     > +      "1280x800@75Hz",
>     > +      "1280x800@85Hz",
>     > +      "1280x800@120Hz (RB)",
>     > +      "1280x960@60Hz",
>     > +      "1280x960@85Hz",
>     > +      "1280x960@120Hz (RB)",
>     > +      "1280x1024@60Hz",
>     > +      "1280x1024@75Hz",
>     > +      "1280x1024@85Hz",
>     > +      "1280x1024@120Hz (RB)",
>     > +      "1360x768@60Hz",
>     > +      "1360x768@120Hz (RB)",
>     > +      "1400x1050@60Hz (RB)",
>     > +      "1400x1050@60Hz",
>     > +      "1400x1050@75Hz",
>     > +      "1400x1050@85Hz",
>     > +      "1400x1050@120Hz (RB)",
>     > +      "1440x900@60Hz (RB)",
>     > +      "1440x900@60Hz",
>     > +      "1440x900@75Hz",
>     > +      "1440x900@85Hz",
>     > +      "1440x900@120Hz (RB)",
>     > +      "1600x1200@60Hz",
>     > +      "1600x1200@65Hz",
>     > +      "1600x1200@70Hz",
>     > +      "1600x1200@75Hz",
>     > +      "1600x1200@85Hz",
>     > +      "1600x1200@120Hz (RB)",
>     > +      "1680x1050@60Hz (RB)",
>     > +      "1680x1050@60Hz",
>     > +      "1680x1050@75Hz",
>     > +      "1680x1050@85Hz",
>     > +      "1680x1050@120Hz (RB)",
>     > +      "1792x1344@60Hz",
>     > +      "1792x1344@75Hz",
>     > +      "1792x1344@120Hz (RB)",
>     > +      "1856x1392@60Hz",
>     > +      "1856x1392@75Hz",
>     > +      "1856x1392@120Hz (RB)",
>     > +      "1920x1200@60Hz (RB)",
>     > +      "1920x1200@60Hz",
>     > +      "1920x1200@75Hz",
>     > +      "1920x1200@85Hz",
>     > +      "1920x1200@120Hz (RB)",
>     > +      "1920x1440@60Hz",
>     > +      "1920x1440@75Hz",
>     > +      "1920x1440@120Hz (RB)",
>     > +      "2560x1600@60Hz (RB)",
>     > +      "2560x1600@60Hz",
>     > +      "2560x1600@75Hz",
>     > +      "2560x1600@85Hz",
>     > +      "2560x1600@120Hz (RB)",
>     > +};
>     
>     Isn't this effectively the same as the displayid_vesa_dmt array?
>     
>     > +
>     > +const char *displayid_cta_timings[] = {
>     > +      "640x480p@59.94/60Hz 4:3",
>     > +      "720x480p@59.94/60Hz 4:3",
>     > +      "720x480p@59.94/60Hz 16:9",
>     > +      "1280x720p@59.94/60Hz 16:9",
>     > +      "1920x1080i@59.94/60Hz 16:9",
>     > +      "720(1440)x480i@59.94/60Hz 4:3",
>     > +      "720(1440)x480i@59.94/60Hz 16:9",
>     > +      "720(1440)x240p@59.94/60Hz 4:3",
>     > +      "720(1440)x240p@59.94/60Hz 16:9",
>     > +      "2880x480i@59.94/60Hz 4:3",
>     > +      "2880x480i@59.94/60Hz 16:9",
>     > +      "2880x240p@59.94/60Hz 4:3",
>     > +      "2880x240p@59.94/60Hz 16:9",
>     > +      "1440x480p@59.94/60Hz 4:3",
>     > +      "1440x480p@59.94/60Hz 16:9",
>     > +      "1920x1080p@59.94/60Hz 16:9",
>     > +      "720x576p@50Hz 4:3",
>     > +      "720x576p@50Hz 16:9",
>     > +      "1280x720p@50Hz 16:9",
>     > +      "1920x1080i@50Hz 16:9",
>     > +      "720(1440)x576i@50Hz 4:3",
>     > +      "720(1440)x576i@50Hz 16:9",
>     > +      "720(1440)x288p@50Hz 4:3",
>     > +      "720(1440)x288p@50Hz 16:9",
>     > +      "2880x576i@50Hz 4:3",
>     > +      "2880x576i@50Hz 16:9",
>     > +      "2880x288p@50Hz 4:3",
>     > +      "2880x288p@50Hz 16:9",
>     > +      "1440x576p@50Hz 4:3",
>     > +      "1440x576p@50Hz 16:9",
>     > +      "1920x1080p@50Hz 16:9",
>     > +      "1920x1080p@23.97/24Hz 16:9",
>     > +      "1920x1080p@25Hz 16:9",
>     > +      "1920x1080p@29.97/30Hz 16:9",
>     > +      "2880x480p@59.94/60Hz 4:3",
>     > +      "2880x480p@59.94/60Hz 16:9",
>     > +      "2880x576p@50Hz 4:3",
>     > +      "2880x576p@50Hz 16:9",
>     > +      "1920x1080i@50Hz 16:9",
>     > +      "1920x1080i@100Hz 16:9",
>     > +      "1280x720p@100Hz 16:9",
>     > +      "720x576p@100Hz 4:3",
>     > +      "720x576p@100Hz 16:9",
>     > +      "720(1440)x576i@100Hz 4:3",
>     > +      "720(1440)x576i@100Hz 16:9",
>     > +      "1920x1080i@119.88/120Hz 16:9",
>     > +      "1280x720p@119.88/120Hz 16:9",
>     > +      "720x480p@119.88/120Hz 4:3",
>     > +      "720x480p@119.88/120Hz 16:9",
>     > +      "720(1440)x480i@119.88/120Hz 4:3",
>     > +      "720(1440)x480i@119.88/120Hz 16:9",
>     > +      "720x576p@200Hz 4:3",
>     > +      "720x576p@200Hz 16:9",
>     > +      "720(1440)x576i@200Hz 4:3",
>     > +      "720(1440)x576i@200Hz 16:9",
>     > +      "720x480p@239.76/240Hz 4:3",
>     > +      "720x480p@239.76/240Hz 16:9",
>     > +      "720(1440)x480i@239.76/240Hz 4:3",
>     > +      "720(1440)x480i@239.76/240Hz 16:9",
>     > +      "1280x720p@23.97/24Hz 16:9",
>     > +      "1280x720p@25Hz 16:9",
>     > +      "1280x720p@29.97/30Hz 16:9",
>     > +      "1920x1080p@120Hz 16:9",
>     > +      "1920x1080p@100Hz 16:9",
>     > +};
>     
>     And this is the same as edid_cta_modes1[].
>     
>     > +
>     > +static void parse_displayid_timing(const unsigned char *x, int expectedlen, const char** list)
>     > +{
>     > +      int revisionflags=x[1];
>     > +      int len=x[2];
>     > +      if (revisionflags) {
>     > +                      printf("  Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
>     > +      }
>     > +      if (len > expectedlen) {
>     > +                      printf("  Length is greater than expected (%d > %d)\n", len, expectedlen);
>     > +      } else if (len < expectedlen) {
>     > +                      printf("  Length is less than expected (%d < %d)\n", len, expectedlen);
>     > +      }
>     > +      x += 3;
>     > +      for (int i = 0; i < len * 8; i++) {
>     > +                      if (x[i>>3] & (1<<(i&7))) {
>     > +                                      if ((i>>3) < expectedlen) {
>     > +                                                      printf("  %s\n", list[i]);
>     > +                                      } else {
>     > +                                                      printf("  #%d\n", i+1);
>     > +                                      }
>     > +                      }
>     > +      }
>     > +}
>     > +
>     > +static void parse_displayid_gp_string(const unsigned char *x)
>     > +{
>     > +      int revisionflags=x[1];
>     > +      if (revisionflags) {
>     > +                      printf("  Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
>     > +      }
>     > +}
>     > +
>     > +static const char *bpc444[] = {"6", "8", "10", "12", "14", "16", NULL, NULL};
>     > +static const char *bpc4xx[] = {"8", "10", "12", "14", "16", NULL, NULL, NULL};
>     > +static const char *audiorates[] = {"32", "44.1", "48", NULL, NULL, NULL, NULL, NULL};
>     > +
>     > +static const char *colorspace_eotf_combinations[] = {
>     > +      "sRGB",
>     > +      "BT.601",
>     > +      "BT.709/BT.1886",
>     > +      "Adobe RGB",
>     > +      "DCI-P3",
>     > +      "BT.2020",
>     > +      "BT.2020/SMPTE ST 2084"
>     > +};
>     > +
>     > +static const char *colorspace_eotf_reserved[] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
>     > +
>     > +static const char *colorspaces[] = {
>     > +      "Undefined",
>     > +      "sRGB",
>     > +      "BT.601",
>     > +      "BT.709",
>     > +      "Adobe RGB",
>     > +      "DCI-P3",
>     > +      "BT.2020",
>     > +      "Custom"
>     > +};
>     > +
>     > +static const char *eotfs[] = {
>     > +      "Undefined",
>     > +      "sRGB",
>     > +      "BT.601",
>     > +      "BT.1886",
>     > +      "Adobe RGB",
>     > +      "DCI-P3",
>     > +      "BT.2020",
>     > +      "Gamma function",
>     > +      "SMPTE ST 2084",
>     > +      "Hybrid Log",
>     > +      "Custom"
>     > +};
>     > +
>     > +static void print_flags(const char *label, unsigned char flag_byte, const char **flags, int reverse)
>     > +{
>     > +      if (flag_byte) {
>     > +                      printf("%s: ", label);
>     > +                      int countflags = 0;
>     > +                      for (int i = 0; i < 8; i++) {
>     > +                                      if (flag_byte & (1<<(reverse?7-i:i))) {
>     > +                                                      if (countflags)
>     > +                                                                      printf(", ");
>     > +                                                      if (flags[i])
>     > +                                                                      printf("%s", flags[i]);
>     > +                                                      else
>     > +                                                                      printf("Undefined(%d)", i);
>     > +                                                      countflags++;
>     > +                                      }
>     > +                      }
>     > +                      printf("\n");
>     > +      }
>     > +}
>     > +
>     > +static void parse_displayid_interface_features(const unsigned char *x)
>     > +{
>     > +      int revisionflags=x[1];
>     > +      int len=x[2];
>     > +      if (revisionflags) {
>     > +                      printf("  Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
>     > +      }
>     > +      if (len < 9) {
>     > +                      printf("  Length is less than expected (%d < 9)\n", len);
>     > +                      printf("  ");
>     > +                      hex_block(x + 3, len);
>     > +      } else {
>    > +                      print_flags("  Supported bpc for RGB encoding", x[3], bpc444, 0);
>     > +                      print_flags("  Supported bpc for YCbCr 4:4:4 encoding", x[4], bpc444, 0);
>     > +                      print_flags("  Supported bpc for YCbCr 4:2:2 encoding", x[5], bpc4xx, 0);
>     > +                      print_flags("  Supported bpc for YCbCr 4:2:0 encoding", x[6], bpc4xx, 0);
>     > +                      if (x[7])
>     > +                                      printf("  Minimum pixel rate at which YCbCr 4:2:0 encoding is supported: %.3f MHz\n", 74.25 * x[7]);
>     > +                      print_flags("  Supported audio capability and features (kHz)", x[8], audiorates, 1);
>     > +                      print_flags("  Supported color space and EOTF standard combination 1", x[9], colorspace_eotf_combinations, 0);
>     > +                      print_flags("  Supported color space and EOTF standard combination 2", x[10], colorspace_eotf_reserved, 0);
>     > +                      int i = 0;
>     > +                      if (len >= 9 && x[11] > 0) {
>     > +                                      printf("  Supported color space and EOTF additional combinations:");
>     > +                                      for (i = 1; i <= x[11]; i++) {
>     > +                                                      if (i > 7) {
>     > +                                                                      printf("\n  Number of additional color space and EOTF combinations (%d) is greater than allowed (7).", x[11]);
>     > +                                                                      break;
>     > +                                                      } else if (9 + i > len) {
>     > +                                                                      printf("\n  Number of additional color space and EOTF combinations (%d) is too many to fit in block (%d).", x[11], len - 9);
>     > +                                                                      break;
>     > +                                                      }
>     > +
>     > +                                                      const char *colorspace = "Out of range";
>     > +                                                      const char *eotf = "Out of range";
>     > +                                                      int colorspace_index = (x[11 + i] >> 4) & 0xf;
>     > +                                                      int eotf_index = x[11 + i] & 0xf;
>     > +                                                      if (colorspace_index < sizeof(colorspaces) / sizeof(colorspaces[0])) {
>     > +                                                                      colorspace = colorspaces[colorspace_index];
>     > +                                                      }
>     > +                                                      if (eotf_index < sizeof(eotfs) / sizeof(eotfs[0])) {
>     > +                                                                      eotf = eotfs[eotf_index];
>     > +                                                      }
>     > +
>     > +                                                      if (i > 1)
>     > +                                                                      printf(", ");
>     > +                                                      if (!strcmp(colorspace, eotf)) {
>     > +                                                                      printf("%s", colorspace);
>     > +                                                      } else {
>     > +                                                                      printf("%s/%s", colorspace, eotf);
>     > +                                                      }
>     > +                                      } // for
>     > +                                      printf("\n");
>     > +                      } // x[11]
>     > +                      if (len > 9 + i) {
>     > +                                      printf("  Length is greater than expected (%d > %d)\n", len, 9 + i);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + 11 + i, len - 9 - i);
>     > +                      } else if (len != 9 + i)  {
>     > +                                      printf("  Length is unexpected (%d != %d)\n", len, 9 + i);
>     > +                      }
>     > +      }
>     > +}
>     > +
>     > +static void parse_displayid_ContainerID(const unsigned char *x)
>     > +{
>     > +      int revisionflags=x[1];
>     > +      int len=x[2];
>     > +      if (revisionflags) {
>     > +                      printf("  Unexpected revision and flags (0x%02x != 0)\n", revisionflags);
>     > +      }
>     > +      x += 3;
>     > +      if (len != 16) {
>     > +                      printf("  Length is unexpected (%d != 16)\n", len);
>     > +                      printf("  ");
>     > +                      hex_block(x, len);
>     > +      } else {
>     > +                      printf("  %02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x\n",x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7],x[8],x[9],x[10],x[11],x[12],x[13],x[14],x[15]);
>     > +      }
>     > +}
>     > +
>     >  static int parse_displayid(const unsigned char *x)
>     >  {
>     >         const unsigned char *orig = x;
>     >         unsigned version = x[1];
>     >         unsigned length = x[2];
>     > +      unsigned producttype = x[3];
>     >         unsigned ext_count = x[4];
>     >         unsigned i;
>     >  
>     >         cur_block = "DisplayID";
>     >  
>     > -       printf("Length %u, version %u.%u, extension count %u\n",
>     > -              length, version >> 4, version & 0xf, ext_count);
>     > +      printf("Length %u, version %u.%u, type %u, extension count %u\n",
>     > +             length, version >> 4, version & 0xf, producttype, ext_count);
>     >  
>     >         unsigned offset = 5;
>     >         while (length > 0) {
>     > @@ -2734,33 +3108,49 @@ static int parse_displayid(const unsigned char *x)
>     >                         if (len == 0)
>     >                                         break;
>     >                         switch (tag) {
>     > +                      
>     > +                      // DisplayID 1.3:
>     >                         case 0:
>     > -                                       printf("Product ID Block\n");
>     > +                                      printf("Product ID Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 1:
>     > -                                       printf("Display Parameters Block\n");
>     > +                                      printf("Display Parameters Block (%02Xh):\n", tag);
>     > +                                      parse_displayid_parameters(x + offset);
>     >                                         break;
>     >                         case 2:
>     > -                                       printf("Color Characteristics Block\n");
>     > +                                      printf("Color Characteristics Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 3: {
>     > -                                       printf("Type 1 Detailed Timings Block\n");
>     > +                                      printf("Type 1 Detailed Timings Block (%02Xh)\n", tag);
>     >                                         for (i = 0; i < len / 20; i++) {
>     >                                                         parse_displayid_detailed_timing(&x[offset + 3 + (i * 20)]);
>     >                                         }
>     >                                         break;
>     >                         }
>     >                         case 4:
>     > -                                       printf("Type 2 Detailed Timings Block\n");
>     > +                                      printf("Type 2 Detailed Timings Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 5:
>     > -                                       printf("Type 3 Short Timings Block\n");
>     > +                                      printf("Type 3 Short Timings Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 6:
>     > -                                       printf("Type 4 DMT Timings Block\n");
>     > +                                      printf("Type 4 DMT Timings Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 7:
>     > -                                       printf("Type 1 VESA DMT Timings Block\n");
>     > +                                      printf("Type 1 VESA DMT Timings Block (%02Xh)\n", tag);
>     > +                                      #if 0
>     > +                                      parse_displayid_timing(x + offset, 10, displayid_vesa_dmt_timings);
>     
>     What is the reason for the #if 0?
>     
>     I now get a warning that displayid_vesa_dmt_timings is unused.
>     
>     > +                                      #else
>     >                                         for (i = 0; i < min(len, 10) * 8; i++) {
>     >                                                         if (x[offset + 3 + i / 8] & (1 << (i % 8))) {
>     >                                                                         printf("  %ux%u%s@%uHz %s%u:%u HorFreq: %.3f kHz Clock: %.3f MHz\n",
>     > @@ -2779,33 +3169,51 @@ static int parse_displayid(const unsigned char *x)
>     >                                                                         max_pixclk_khz = max(max_pixclk_khz, displayid_vesa_dmt[i].pixclk_khz);
>     >                                                         }
>     >                                         }
>     > +                                      #endif
>     >                                         break;
>     >                         case 8:
>     > -                                       printf("CTA Timings Block\n");
>     > +                                      printf("CTA Timings Block (%02Xh):\n", tag);
>     > +                                      parse_displayid_timing(x + offset, 8, displayid_cta_timings);
>     >                                         break;
>     >                         case 9:
>     > -                                       printf("Video Timing Range Block\n");
>     > +                                      printf("Video Timing Range Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0xa:
>     > -                                       printf("Product Serial Number Block\n");
>     > +                                      printf("Product Serial Number Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0xb:
>     > -                                       printf("GP ASCII String Block\n");
>     > +                                      printf("GP ASCII String Block (%02Xh): %s\n", tag, extract_string("GP ASCII String", x + offset + 3, &has_valid_GP_ascii_string, len));
>     > +                                      has_GP_ascii_string = 1;
>     > +                                      parse_displayid_gp_string(x + offset);
>     >                                         break;
>     >                         case 0xc:
>     > -                                       printf("Display Device Data Block\n");
>     > +                                      printf("Display Device Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0xd:
>     > -                                       printf("Interface Power Sequencing Block\n");
>     > +                                      printf("Interface Power Sequencing Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0xe:
>     > -                                       printf("Transfer Characteristics Block\n");
>     > +                                      printf("Transfer Characteristics Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0xf:
>     > -                                       printf("Display Interface Block\n");
>     > +                                      printf("Display Interface Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0x10:
>     > -                                       printf("Stereo Display Interface Block\n");
>     > +                                      printf("Stereo Display Interface Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         case 0x12: {
>     >                                         unsigned capabilities = x[offset + 3];
>     > @@ -2817,7 +3225,7 @@ static int parse_displayid(const unsigned char *x)
>     >                                         unsigned tile_height = x[offset + 9] | (x[offset + 10] << 8);
>     >                                         unsigned pix_mult = x[offset + 11];
>     >  
>     > -                                       printf("Tiled Display Topology Block\n");
>     > +                                      printf("Tiled Display Topology Block (%02Xh)\n", tag);
>     >                                         printf("  Capabilities: 0x%08x\n", capabilities);
>     >                                         printf("  Num horizontal tiles: %u Num vertical tiles: %u\n", num_h_tile + 1, num_v_tile + 1);
>     >                                         printf("  Tile location: %u, %u\n", tile_h_location, tile_v_location);
>     > @@ -2841,8 +3249,80 @@ static int parse_displayid(const unsigned char *x)
>     >                                         }
>     >                                         break;
>     >                         }
>     > +
>     > +                      // DisplayID 2.0
>     > +                      case 0x20:
>     > +                                      printf("Product ID Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x21:
>     > +                                      printf("Display Parameters Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x22:
>     > +                                      printf("Type 7 Timing - Detailed Timing Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x23:
>     > +                                      printf("Type 8 Timing - Enumerated Timing Code Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x24:
>     > +                                      printf("Type 9 Timing - Formula-based Timing Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x25:
>     > +                                      printf("Dynamic Video Timing Range Limits Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x26:
>     > +                                      printf("Display Interface Features Data Block (%02Xh):\n", tag);
>     > +                                      parse_displayid_interface_features(x + offset);
>     > +                                      break;
>     > +                      case 0x27:
>     > +                                      printf("Stereo Display Interface Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x28:
>     > +                                      printf("Tiled Display Topology Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +                      case 0x29:
>     > +                                      printf("ContainerID Data Block (%02Xh):\n", tag);
>     > +                                      parse_displayid_ContainerID(x + offset);
>     > +                                      break;
>     > +
>     > +                      // 2Ah .. 7Dh RESERVED for Additional VESA-defined Data Blocks
>     > +
>     > +                      case 0x7e: // DisplayID 2.0
>     > +                      case 0x7f: // DisplayID 1.3
>     > +                                      printf("Vendor-specific Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +
>     > +                      // 7Fh .. 80h RESERVED
>     > +
>     > +                      case 0x81:
>     > +                                      printf("CTA DisplayID Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     > +                                      break;
>     > +
>     > +                      // 82h .. FFh RESERVED
>     > +                      
>     >                         default:
>     > -                                       printf("Unknown DisplayID Data Block 0x%x\n", tag);
>     > +                                      printf("Unknown DisplayID Data Block (%02Xh)\n", tag);
>     > +                                      printf("  ");
>     > +                                      hex_block(x + offset + 3, len);
>     >                                         break;
>     >                         }
>     >                         length -= len + 3;
>     > @@ -3687,6 +4167,7 @@ static int edid_from_file(const char *from_file, const char *to_file,
>     >             !has_valid_range_descriptor ||
>     >             (has_name_descriptor && !has_valid_name_descriptor) ||
>     >             (has_serial_string && !has_valid_serial_string) ||
>     > +                      (has_GP_ascii_string && !has_valid_GP_ascii_string) ||
>     >             (has_ascii_string && !has_valid_ascii_string)) {
>     >                         conformant = 0;
>     >                         printf("EDID block does not conform:\n");
>     > @@ -3709,6 +4190,8 @@ static int edid_from_file(const char *from_file, const char *to_file,
>     >                                         printf("\tInvalid Monitor Name descriptor\n");
>     >                         if (has_ascii_string && !has_valid_ascii_string)
>     >                                         printf("\tInvalid ASCII string\n");
>     > +                      if (has_GP_ascii_string && !has_valid_GP_ascii_string)
>     > +                                      printf("\tInvalid GP ASCII string\n");
>     >                         if (has_serial_string && !has_valid_serial_string)
>     >                                         printf("\tInvalid serial string\n");
>     >         }
>     > 
>     
>     Regards,
>     
>                 Hans
>     
> 
> 


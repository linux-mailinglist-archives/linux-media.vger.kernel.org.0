Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E564E1037DB
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 11:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfKTKrh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 05:47:37 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:36967 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728840AbfKTKrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 05:47:36 -0500
Received: from [IPv6:2001:983:e9a7:1:80a8:a262:ee30:c31e]
 ([IPv6:2001:983:e9a7:1:80a8:a262:ee30:c31e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id XNWGiLADRcs92XNWHi43lN; Wed, 20 Nov 2019 11:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574246854; bh=/IDFZIk5ye86Tmf69Zm8yEiJ5ctLfuR4E9+NlVq/jrU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T9QVdoGzwQT8EgHWBdL33Pkwc85339D6vsE717xyV+JYDouquRweOw2cvNIEiN4gA
         aoKmrgrcKsncVEvl5lnkgSv3ukfcyVXLcaGpmBEblTr/F1kwco66y+vlj3LoJOMMMO
         tT7sbd6yGm2Nk0o0EGJo9cEjbR3TxQUMKK3Rs7N6X8zOF2sBMKuHVcdi2A87hjn6yt
         7J6WU9watEDMh3dMv2nR/XVspgRQDBtBC93f4FVZrGVC0CLI1vErtXWuphwpVuvYQo
         kZq72LnvcqWa3RlGlCnaCRXWmvpz3IfIXaJrItSouda2k7OON4vejnnT4H91+BU3SB
         t+7qPcjhwcNJQ==
Subject: Re: edid-decode bugs
To:     Joe van Tunen <joevt@shaw.ca>, linux-media@vger.kernel.org
References: <E84FF0A7-50B4-4E8B-B30E-50210ACD6388@shaw.ca>
 <b0a4d267-5810-c92f-86f2-c15c350fa264@xs4all.nl>
 <7FCD3C5C-8228-46E3-884B-DE9E4EFAB127@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <819a7741-2794-3496-f669-54f42793cff9@xs4all.nl>
Date:   Wed, 20 Nov 2019 11:47:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7FCD3C5C-8228-46E3-884B-DE9E4EFAB127@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHP9Oan8FR1kIxtaaTVkebIjB5mRfEt2yNv9JeF+WlcyhMBbuHyhvuyybNL5nakLVxHpDbWI6LZH+doTIdTiYLagY19KFvKQDGSHbc5X/CuLur0n3Gb+
 KVyE4i5Ubhd8m7Y2alY09oILCQTr68v6aVfyT7AKgYgPUDykDCI21etazq2fpqh3X2dvO8pC836cyYELqldyYMYVqe4Kh1d3Wajq2HOw368uvKQiifNe9/ns
 XpDLCHtzO0ejuDmi9zvwXBQydYyLzkBBjhD0vQyXLQzsGRmdDhLdB7LT51qZe25r
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ah, I see why the diff.txt didn't apply: there is some TAB to space mangling going on.

Make sure your editor preserves TAB characters and doesn't replace them by spaces.

On 11/20/19 11:27 AM, Joe van Tunen wrote:
> There might be a problem with the git diff command output (I’m using macOS Catalina 10.15.0). I tried it again - it appears I mistakenly included the last line that says "(END)" and maybe you just need to remove it? I included an ancestor file in the zip. With that, a three-way merge can be done (left, right, ancestor, merge result) where left and right are my file and your file and ancestor is the one I used when creating my file and is an ancestor to both my file and your file (actually, I think it is your file since you haven't made changes recently).
> 
> The compiler is clang in macOS Catalina 10.15.0. I think it complains when "h" (normally for "short") is used for "char" ("hh" expected) or "int" ("" expected). This is a problem for architectures/compilers/calling conventions that push a different number of bytes on the stack for these different sized parameters (vaargs) of the *printf type variadic functions. Do such architectures/compilers/calling conventions exist?
> 
> gcc -v -Wall -o edid-decode edid-decode.c
> Apple clang version 11.0.0 (clang-1100.0.33.12)
> ...
> edid-decode.c:1059:28: warning: format specifies type 'unsigned short' but the argument has type 'unsigned char' [-Wformat]
>         printf("Checksum: 0x%hx", check);
>                             ~~~   ^~~~~
>                             %hhx
> edid-decode.c:1065:34: warning: format specifies type 'unsigned short' but the argument has type 'int' [-Wformat]
>                 printf(" (should be 0x%hx)\n", -sum & 0xff);
>                                       ~~~      ^~~~~~~~~~~
>                                       %x
> edid-decode.c:3519:36: warning: format specifies type 'short' but the argument has type 'unsigned char' [-Wformat]
>         printf("EDID version: %hd.%hd\n", edid[0x12], edid[0x13]);
>                               ~~~         ^~~~~~~~~~
>                               %hhu
> edid-decode.c:3519:48: warning: format specifies type 'short' but the argument has type 'unsigned char' [-Wformat]
>         printf("EDID version: %hd.%hd\n", edid[0x12], edid[0x13]);
>                                   ~~~                 ^~~~~~~~~~
>                                   %hhu
> edid-decode.c:3554:32: warning: format specifies type 'short' but the argument has type 'int' [-Wformat]
>                                 printf("Model year %hd\n", edid[0x11] + 1990);
>                                                    ~~~     ^~~~~~~~~~~~~~~~~
>                                                    %d
> edid-decode.c:3558:42: warning: format specifies type 'short' but the argument has type 'unsigned char' [-Wformat]
>                                         printf("Made in week %hd of %hd\n", edid[0x10], edid[0x11] + 1990);
>                                                              ~~~            ^~~~~~~~~~
>                                                              %hhu
> edid-decode.c:3558:54: warning: format specifies type 'short' but the argument has type 'int' [-Wformat]
>                                         printf("Made in week %hd of %hd\n", edid[0x10], edid[0x11] + 1990);
>                                                                     ~~~                 ^~~~~~~~~~~~~~~~~
>                                                                     %d
> edid-decode.c:3560:35: warning: format specifies type 'short' but the argument has type 'int' [-Wformat]
>                                         printf("Made in year %hd\n", edid[0x11] + 1990);
>                                                              ~~~     ^~~~~~~~~~~~~~~~~
>                                                              %d

I'll look a bit more into this. gcc handles this fine, but I'll see what I can do.

> 
> The SwitchResX EDID is included to show how it uses the "GP ASCII String Block (0Bh)" DisplayID block. You already have a Dell UP2715K EDID, but you're missing two of the three variants (there is two for dual cable DisplayPort input and one for Mini DisplayPort). I'm not sure which variant this modified EDID belongs to. I do have this display. I can get the EDIDs if you still want them.

Yes please.

> 
> The Acer XV273K has two DisplayPort ports. The EDIDs show a different "Source physical address" for each in the CTA block. The Acer has a dual cable 4K 144Hz mode selectable from the onscreen display menu which modifies the EDIDs for the two DisplayPort ports and adds a "Tiled Display Topology Block (12h)" block to each. I did not include the EDID for the HDMI port. The numbers 2,3,5,6 are used to make the file names unique. They come from the order the EDIDs were loaded by my EDIDUtil script. https://gist.github.com/joevt/32e5efffe3459958759fb702579b9529

Differences in the Source physical address are normal between inputs and can be ignored. So I need only one.

> 
> The LG UltraFine 5K (v2) is also a dual cable display. Therefore, each EDID has a "Tiled Display Topology Block (12h)" block. The two DisplayPort 1.2 signals arrive via Thunderbolt 3. The v2 has a different product ID (5b74) than the v1 (5b11). The v2 uses the Titan Ridge Thunderbolt 3 controller so it can accept USB-C DisplayPort alt mode input for 4K resolution. I don't know if there's a USB-C single cable EDID - it could be the same as one of the Thunderbolt EDIDs.
> 
> You have the two EDIDs for the Dell UP3218K which is also a dual cable display but uses DisplayPort 1.4. It appears to have two refresh rates for the dual cable 8K mode: 48 and 60Hz.
> 
> The LG UltraFine 5K does not have an onscreen menu option to switch between inputs. Therefore the second EDID is a reduced EDID compared to the first. The same is true of the Dell UP2715K. On the other hand, the Acer XV273K and Dell UP3218K have menu options to switch between inputs, therefore the EDIDs of the second input of the display are similar to the EDIDs of the first input of the same display (the Acer has one inexplicable difference in the YCbCr 4:2:0 Capability Map Data Block).
> 
> The new Apple Pro Display XDR is also a dual cable display that uses DisplayPort 1.4 but over Thunderbolt 3. I only have the EDIDs from the override files included in macOS. From those files, it appears to be able to support dual cable 5K and 6K resolutions. I wonder how that will appear in the EDID (EDIDs in the macOS override files don't include tiled timings and topologies). It might be the first display to have two different tile sizes. It has multiple refresh rates for the tiled modes like the Dell UP3218K.
> 
> I forgot to include the DisplayPort EDID for the Kogan KALED24144F. It has a timing descriptor in the CTA extension block with a negative horizontal back porch value that looks like this:
> Detailed mode: Clock 326.660 MHz, 598 mm x 336 mm
>                1920 2008 2052 2040 ( 88  44 -12) hborder 0

What on earth does a negative horizontal backporch value mean? I've never seen that.

>                1080 1084 1089 1112 (  4   5  23) vborder 0
>                -hsync -vsync 
>                VertFreq: 144.000 Hz, HorFreq: 160.127 kHz
> The HDMI EDID of the same display doesn't include a 1080p 144Hz mode.
> 
> I wasn't sure if you wanted the EDIDs or what naming convention to use for the different EDIDs of the same display.

<vendor>-<model>-<input type>

So: lg-32ud99-w-dp, samsung-ue48ju7090-hdmi, etc.

All lower case.

In any case, my original comment remains: please split this up in multiple patches.
This patch is too big to review. There is some good things in here, esp. the DisplayID 2.0
additions (this was on my own TODO list).

Regards,

	Hans

> 
> 
> ﻿On 2019-11-19, 4:44 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:
> 
>     Hi Joe,
>     
>     Thank you for the patch, but it doesn't apply.
>     
>     Please make sure you use the latest edid-decode version from the git repo
>     (git://linuxtv.org/edid-decode.git).
>     
>     Ideally I'd like four patches: one for the bug fixes, one for the additions, one
>     for the changes and one for the minor changes, just as you grouped them below.
>     
>     It makes it easier to review for me.
>     
>     The EDIDs can also be added as a separate patch, but if you are not that familiar with git,
>     then I can do that as well, using your .zip.
>     
>     BTW, for the 'Use %hhx or %hhu' change: what compiler do you use? I've never seen warnings
>     for that by the gcc compiler. If you are using gcc, do you specify extra compiler options?
>     
>     I see that you have one EDID marked as "modified by SwitchResX". Do you have the original
>     EDID from the display as well? I'm uncertain whether I want to have a 'modified' EDID in
>     the example EDID dataset. But regardless of that, I would like to have the unmodified version
>     as well.
>     
>     I also see for the Acer two versions: 144 mode off/on: what does that mean?
>     
>     And what's the difference between EDID_ACR_472_6b1_5.bin and EDID_ACR_472_6b1_6.bin? Just a
>     different input? Same question for the LG.
>     
>     Regards,
>     
>     	Hans
>     
>     
>     On 11/19/19 1:07 PM, Joe van Tunen wrote:
>     > I think I’ve found 2 or 3 bugs in edid-decode. I've attached the fixes and some example EDIDs. I've also made some other changes. I've never made a linux patch before so please let me know how to proceed.
>     > 
>     > Bug Fixes:
>     > 
>     > - Corrected horizontal range in "Monitor Ranges" - was using incorrect bits for 255 offsets.
>     > - Fixed DisplayID type 1 timing calculations which were missing the +1 increment for pix_clock,ha,hbl,hso,hspw,va,vbl,vso,vspw.
>     > - Made refresh rate floating point instead of integer in detailed timings in descriptors.
>     > 
>     > Additions:
>     > 
>     > - Added DisplayID GP ASCII String (used by EDIDs modified by SwitchResX)
>     > - "YCbCr 4:2:0 Capability Map Data Block " now outputs the modes that support YCbCr 4:2:0 instead of just indexes of the modes. Indexes start from one and refer to timings in "Video Data Block". The code assumes that "Video Data Block" appears before "YCbCr 4:2:0 Capability Map Data Block".
>     > - Unknown CTA blocks are dumped as hex.
>     > - Decode "Display Parameters block".
>     > - Decode "Display Interface Features Data Block".
>     > - Decode "ContainerID Data Block".
>     > - Unknown DisplayID blocks are dumped as hex.
>     > 
>     > Changes:
>     > 
>     > - Change all horizontal frequencies to be displayed in kHz (Hz=vertical, kHz=horizontal, MHz=pixelclock) like they are in "Monitor Ranges".
>     > - For timings, added front porch, pulse width, and back porch numbers in parenthesis (smaller integers are easier to comprehend, useful when comparing or editing timings in SwitchResX or other editors, negative values will be more appearant).
>     > - Added missing VertFreq and HorFreq values to DisplayID type 1 timings.
>     > - Added product type to DisplayID.
>     > - Added DisplayID tag hex byte to make it possible to distinguish between DisplayID 1.3 and 2.0 spec blocks of the same name.
>     > - Remove double space when "(native)" is not output.
>     > 
>     > Minor changes:
>     > 
>     > - Use %hhx or %hhu for unsigned char parameters in printf. Use %x or %d for int parameters. Eliminates printf warnings.
>     > - Moved inner loop of cta_svd into a new function cta_svd_one so that it can be reused by cta_y420cmdb.
>     > - Added hex_block for blocks of data with that are not decoded.
>     > - Added feature_support_flags, print_flag_lines, parse_displayid_parameters.
>     > - Renamed conformant_extension to nonconformant_extension in parse_extension because boolean value of 1 = nonconformant according to return result of parse_cta and parse_displayid; matches interpretation in edid_from_file.
>     > 
>     
>     
> 
> 


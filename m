Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341FC103779
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 11:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfKTK1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 05:27:14 -0500
Received: from smtp-out-so.shaw.ca ([64.59.136.138]:45666 "EHLO
        smtp-out-so.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728201AbfKTK1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 05:27:14 -0500
Received: from [192.168.0.100] ([70.71.78.228])
        by shaw.ca with ESMTPA
        id XNCXihW5v17ZDXNCaihxqv; Wed, 20 Nov 2019 03:27:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shaw.ca;
        s=s20180605; t=1574245632;
        bh=P3xHnfbwAF1r8fsAsbWK4f5kIPgr78BvSd31fXwJRxc=;
        h=Date:Subject:From:To:References:In-Reply-To;
        b=CTNpJMLMPxrHV2GtNszBFl2F1oPSTzqWVYtSyxLgPhbcg0FTxSO5CzaRkbGaWwoBA
         Kh0X2AofptxsLBTzVdDDjkVSnvIGNrfoTQdnOOCyh8TS6caWDR9ABBRlKGshqxTtx6
         K7C57akYL/PMRwLh3nuQFBmJ6VINrMn35a31EKj6rHaoEvkwsvDvtnfogW7njl4gBX
         vo7Sk/vbcg8Kq4N5TZpOPwhOxRy2aAIpPHPqXwOfQ3k8kcXdFIlkf8rEHg14JZYVKM
         Mzo8X3UmA1YyisOf8/q6EwqcWMFwRRZljTgaQFS2f+9WXwG2+ngoDBWsj/uZ0zOy6h
         sUuwxT2uYxSqg==
X-Authority-Analysis: v=2.3 cv=ZsqT1OzG c=1 sm=1 tr=0
 a=qDatE6m/3wxSEG8Wq7h0zQ==:117 a=qDatE6m/3wxSEG8Wq7h0zQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=EqOTydxkAAAA:20
 a=xq3W2uTSAAAA:8 a=NkG4PDFKbXKgp3jz1SoA:9 a=EXnWOZkR5Icts8Ye:21
 a=gydBA7m1XeYDtZay:21 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
User-Agent: Microsoft-MacOutlook/10.1f.0.191110
Date:   Wed, 20 Nov 2019 02:27:06 -0800
Subject: Re: edid-decode bugs
From:   Joe van Tunen <joevt@shaw.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>
Message-ID: <7FCD3C5C-8228-46E3-884B-DE9E4EFAB127@shaw.ca>
Thread-Topic: edid-decode bugs
References: <E84FF0A7-50B4-4E8B-B30E-50210ACD6388@shaw.ca>
 <b0a4d267-5810-c92f-86f2-c15c350fa264@xs4all.nl>
In-Reply-To: <b0a4d267-5810-c92f-86f2-c15c350fa264@xs4all.nl>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-CMAE-Envelope: MS4wfCWeKihXDnVuK60JWrjy6xDCW0wrBR3ZaWURfH+kh0tFr7XMpYCMfO6US0fg1U5ud+uAv2MocCFblQfIzZRztSohIkGYBcUNQ3bpqhKorgbZWjnxDDg7
 s5D/rbTjusxU1IBFwpfcpl+8IMgDPTX4bUwKOFcp3ul6naBc7dNqTZ3XGQGA47RbvSO0Cug1tvdSC6ahhI/6YY+qYGmbOSzbZT8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There might be a problem with the git diff command output (I=E2=80=99m using macO=
S Catalina 10.15.0). I tried it again - it appears I mistakenly included the=
 last line that says "(END)" and maybe you just need to remove it? I include=
d an ancestor file in the zip. With that, a three-way merge can be done (lef=
t, right, ancestor, merge result) where left and right are my file and your =
file and ancestor is the one I used when creating my file and is an ancestor=
 to both my file and your file (actually, I think it is your file since you =
haven't made changes recently).

The compiler is clang in macOS Catalina 10.15.0. I think it complains when =
"h" (normally for "short") is used for "char" ("hh" expected) or "int" ("" e=
xpected). This is a problem for architectures/compilers/calling conventions =
that push a different number of bytes on the stack for these different sized=
 parameters (vaargs) of the *printf type variadic functions. Do such archite=
ctures/compilers/calling conventions exist?

gcc -v -Wall -o edid-decode edid-decode.c
Apple clang version 11.0.0 (clang-1100.0.33.12)
...
edid-decode.c:1059:28: warning: format specifies type 'unsigned short' but =
the argument has type 'unsigned char' [-Wformat]
        printf("Checksum: 0x%hx", check);
                            ~~~   ^~~~~
                            %hhx
edid-decode.c:1065:34: warning: format specifies type 'unsigned short' but =
the argument has type 'int' [-Wformat]
                printf(" (should be 0x%hx)\n", -sum & 0xff);
                                      ~~~      ^~~~~~~~~~~
                                      %x
edid-decode.c:3519:36: warning: format specifies type 'short' but the argum=
ent has type 'unsigned char' [-Wformat]
        printf("EDID version: %hd.%hd\n", edid[0x12], edid[0x13]);
                              ~~~         ^~~~~~~~~~
                              %hhu
edid-decode.c:3519:48: warning: format specifies type 'short' but the argum=
ent has type 'unsigned char' [-Wformat]
        printf("EDID version: %hd.%hd\n", edid[0x12], edid[0x13]);
                                  ~~~                 ^~~~~~~~~~
                                  %hhu
edid-decode.c:3554:32: warning: format specifies type 'short' but the argum=
ent has type 'int' [-Wformat]
                                printf("Model year %hd\n", edid[0x11] + 199=
0);
                                                   ~~~     ^~~~~~~~~~~~~~~~=
~
                                                   %d
edid-decode.c:3558:42: warning: format specifies type 'short' but the argum=
ent has type 'unsigned char' [-Wformat]
                                        printf("Made in week %hd of %hd\n",=
 edid[0x10], edid[0x11] + 1990);
                                                             ~~~           =
 ^~~~~~~~~~
                                                             %hhu
edid-decode.c:3558:54: warning: format specifies type 'short' but the argum=
ent has type 'int' [-Wformat]
                                        printf("Made in week %hd of %hd\n",=
 edid[0x10], edid[0x11] + 1990);
                                                                    ~~~    =
             ^~~~~~~~~~~~~~~~~
                                                                    %d
edid-decode.c:3560:35: warning: format specifies type 'short' but the argum=
ent has type 'int' [-Wformat]
                                        printf("Made in year %hd\n", edid[0=
x11] + 1990);
                                                             ~~~     ^~~~~~=
~~~~~~~~~~~
                                                             %d

The SwitchResX EDID is included to show how it uses the "GP ASCII String Bl=
ock (0Bh)" DisplayID block. You already have a Dell UP2715K EDID, but you're=
 missing two of the three variants (there is two for dual cable DisplayPort =
input and one for Mini DisplayPort). I'm not sure which variant this modifie=
d EDID belongs to. I do have this display. I can get the EDIDs if you still =
want them.

The Acer XV273K has two DisplayPort ports. The EDIDs show a different "Sour=
ce physical address" for each in the CTA block. The Acer has a dual cable 4K=
 144Hz mode selectable from the onscreen display menu which modifies the EDI=
Ds for the two DisplayPort ports and adds a "Tiled Display Topology Block (1=
2h)" block to each. I did not include the EDID for the HDMI port. The number=
s 2,3,5,6 are used to make the file names unique. They come from the order t=
he EDIDs were loaded by my EDIDUtil script. https://gist.github.com/joevt/32=
e5efffe3459958759fb702579b9529

The LG UltraFine 5K (v2) is also a dual cable display. Therefore, each EDID=
 has a "Tiled Display Topology Block (12h)" block. The two DisplayPort 1.2 s=
ignals arrive via Thunderbolt 3. The v2 has a different product ID (5b74) th=
an the v1 (5b11). The v2 uses the Titan Ridge Thunderbolt 3 controller so it=
 can accept USB-C DisplayPort alt mode input for 4K resolution. I don't know=
 if there's a USB-C single cable EDID - it could be the same as one of the T=
hunderbolt EDIDs.

You have the two EDIDs for the Dell UP3218K which is also a dual cable disp=
lay but uses DisplayPort 1.4. It appears to have two refresh rates for the d=
ual cable 8K mode: 48 and 60Hz.

The LG UltraFine 5K does not have an onscreen menu option to switch between=
 inputs. Therefore the second EDID is a reduced EDID compared to the first. =
The same is true of the Dell UP2715K. On the other hand, the Acer XV273K and=
 Dell UP3218K have menu options to switch between inputs, therefore the EDID=
s of the second input of the display are similar to the EDIDs of the first i=
nput of the same display (the Acer has one inexplicable difference in the YC=
bCr 4:2:0 Capability Map Data Block).

The new Apple Pro Display XDR is also a dual cable display that uses Displa=
yPort 1.4 but over Thunderbolt 3. I only have the EDIDs from the override fi=
les included in macOS. From those files, it appears to be able to support du=
al cable 5K and 6K resolutions. I wonder how that will appear in the EDID (E=
DIDs in the macOS override files don't include tiled timings and topologies)=
. It might be the first display to have two different tile sizes. It has mul=
tiple refresh rates for the tiled modes like the Dell UP3218K.

I forgot to include the DisplayPort EDID for the Kogan KALED24144F. It has =
a timing descriptor in the CTA extension block with a negative horizontal ba=
ck porch value that looks like this:
Detailed mode: Clock 326.660 MHz, 598 mm x 336 mm
               1920 2008 2052 2040 ( 88  44 -12) hborder 0
               1080 1084 1089 1112 (  4   5  23) vborder 0
               -hsync -vsync=20
               VertFreq: 144.000 Hz, HorFreq: 160.127 kHz
The HDMI EDID of the same display doesn't include a 1080p 144Hz mode.

I wasn't sure if you wanted the EDIDs or what naming convention to use for =
the different EDIDs of the same display.


=EF=BB=BFOn 2019-11-19, 4:44 AM, "Hans Verkuil" <hverkuil@xs4all.nl> wrote:

    Hi Joe,
   =20
    Thank you for the patch, but it doesn't apply.
   =20
    Please make sure you use the latest edid-decode version from the git re=
po
    (git://linuxtv.org/edid-decode.git).
   =20
    Ideally I'd like four patches: one for the bug fixes, one for the addit=
ions, one
    for the changes and one for the minor changes, just as you grouped them=
 below.
   =20
    It makes it easier to review for me.
   =20
    The EDIDs can also be added as a separate patch, but if you are not tha=
t familiar with git,
    then I can do that as well, using your .zip.
   =20
    BTW, for the 'Use %hhx or %hhu' change: what compiler do you use? I've =
never seen warnings
    for that by the gcc compiler. If you are using gcc, do you specify extr=
a compiler options?
   =20
    I see that you have one EDID marked as "modified by SwitchResX". Do you=
 have the original
    EDID from the display as well? I'm uncertain whether I want to have a '=
modified' EDID in
    the example EDID dataset. But regardless of that, I would like to have =
the unmodified version
    as well.
   =20
    I also see for the Acer two versions: 144 mode off/on: what does that m=
ean?
   =20
    And what's the difference between EDID_ACR_472_6b1_5.bin and EDID_ACR_4=
72_6b1_6.bin? Just a
    different input? Same question for the LG.
   =20
    Regards,
   =20
    	Hans
   =20
   =20
    On 11/19/19 1:07 PM, Joe van Tunen wrote:
    > I think I=E2=80=99ve found 2 or 3 bugs in edid-decode. I've attached the fi=
xes and some example EDIDs. I've also made some other changes. I've never ma=
de a linux patch before so please let me know how to proceed.
    >=20
    > Bug Fixes:
    >=20
    > - Corrected horizontal range in "Monitor Ranges" - was using incorrec=
t bits for 255 offsets.
    > - Fixed DisplayID type 1 timing calculations which were missing the +=
1 increment for pix_clock,ha,hbl,hso,hspw,va,vbl,vso,vspw.
    > - Made refresh rate floating point instead of integer in detailed tim=
ings in descriptors.
    >=20
    > Additions:
    >=20
    > - Added DisplayID GP ASCII String (used by EDIDs modified by SwitchRe=
sX)
    > - "YCbCr 4:2:0 Capability Map Data Block " now outputs the modes that=
 support YCbCr 4:2:0 instead of just indexes of the modes. Indexes start fro=
m one and refer to timings in "Video Data Block". The code assumes that "Vid=
eo Data Block" appears before "YCbCr 4:2:0 Capability Map Data Block".
    > - Unknown CTA blocks are dumped as hex.
    > - Decode "Display Parameters block".
    > - Decode "Display Interface Features Data Block".
    > - Decode "ContainerID Data Block".
    > - Unknown DisplayID blocks are dumped as hex.
    >=20
    > Changes:
    >=20
    > - Change all horizontal frequencies to be displayed in kHz (Hz=3Dvertic=
al, kHz=3Dhorizontal, MHz=3Dpixelclock) like they are in "Monitor Ranges".
    > - For timings, added front porch, pulse width, and back porch numbers=
 in parenthesis (smaller integers are easier to comprehend, useful when comp=
aring or editing timings in SwitchResX or other editors, negative values wil=
l be more appearant).
    > - Added missing VertFreq and HorFreq values to DisplayID type 1 timin=
gs.
    > - Added product type to DisplayID.
    > - Added DisplayID tag hex byte to make it possible to distinguish bet=
ween DisplayID 1.3 and 2.0 spec blocks of the same name.
    > - Remove double space when "(native)" is not output.
    >=20
    > Minor changes:
    >=20
    > - Use %hhx or %hhu for unsigned char parameters in printf. Use %x or =
%d for int parameters. Eliminates printf warnings.
    > - Moved inner loop of cta_svd into a new function cta_svd_one so that=
 it can be reused by cta_y420cmdb.
    > - Added hex_block for blocks of data with that are not decoded.
    > - Added feature_support_flags, print_flag_lines, parse_displayid_para=
meters.
    > - Renamed conformant_extension to nonconformant_extension in parse_ex=
tension because boolean value of 1 =3D nonconformant according to return resul=
t of parse_cta and parse_displayid; matches interpretation in edid_from_file=
.
    >=20
   =20
   =20



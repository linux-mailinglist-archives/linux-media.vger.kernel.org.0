Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEC9B1024C5
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2019 13:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfKSMoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Nov 2019 07:44:14 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51441 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbfKSMoO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Nov 2019 07:44:14 -0500
Received: from [IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7]
 ([IPv6:2001:983:e9a7:1:9879:d2e2:f0e2:9c7])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X2raiDabocs92X2rbizQ91; Tue, 19 Nov 2019 13:44:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574167452; bh=7mgSgkUpHp/qvoldfVaV060mTj+2lWWPtb5BP6bp+ys=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QEo5vUPBqpyM2Ux03H9h7wB5ZHl6N7gt5Kl8quUY+mXA41m3JQ8RN5DV58MWy90zu
         HMUTiTfEy+EBy0Fu7NjHcK1ErnMwS/aco3nKCXiYNfUzo+Nj37wE1m6D6rHYDbca3L
         tkmi0b4Bc73wXS/t5UdpiZaJtyaSvyih2zzgDPxE+YGjmoX5aPmN2ew82Paz2apuRw
         sF26a7QFslYjs3jnRvLCnLVOXLcrFbo76VseYjM6LiSDoBgFiauYuXD7oDEnjfuSDv
         5sQ3AypMYLbul6vxXaEcqu5ecKrLGaRsaw09U5COEwn2KHy3dwBP5h2i0Wbzxds8ej
         2jmimI0jOajVQ==
Subject: Re: edid-decode bugs
To:     Joe van Tunen <joevt@shaw.ca>, linux-media@vger.kernel.org
References: <E84FF0A7-50B4-4E8B-B30E-50210ACD6388@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b0a4d267-5810-c92f-86f2-c15c350fa264@xs4all.nl>
Date:   Tue, 19 Nov 2019 13:44:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <E84FF0A7-50B4-4E8B-B30E-50210ACD6388@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOJEOgYT9ZbQRFmBqU4gMBQCtyb0a8lxD/g2K/b6okjHrHfdOnBQhWHDOAU9BdH8K1d9CRIPZJE/pmHEV0aqPsPzKwkht3PdweNqIIL6Vdf3v1SyVjgt
 +NSqaK7Po96VniH/RA2lyRbBH+k2yGJ9dQSQ/pY76z5OOdc6wOHkjAKiC02NxFvi7rEUn3AhzIGsXXHXT8ZyfL0BXXAc//WQv00RS537caimjtIsyU9yERKq
 eGwqXDEru2eeyhtDpgwLSlfM2HIp+9q68G0ESjEDR0CKo8gq3hkju1jvJ6wFPHLr
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

Thank you for the patch, but it doesn't apply.

Please make sure you use the latest edid-decode version from the git repo
(git://linuxtv.org/edid-decode.git).

Ideally I'd like four patches: one for the bug fixes, one for the additions, one
for the changes and one for the minor changes, just as you grouped them below.

It makes it easier to review for me.

The EDIDs can also be added as a separate patch, but if you are not that familiar with git,
then I can do that as well, using your .zip.

BTW, for the 'Use %hhx or %hhu' change: what compiler do you use? I've never seen warnings
for that by the gcc compiler. If you are using gcc, do you specify extra compiler options?

I see that you have one EDID marked as "modified by SwitchResX". Do you have the original
EDID from the display as well? I'm uncertain whether I want to have a 'modified' EDID in
the example EDID dataset. But regardless of that, I would like to have the unmodified version
as well.

I also see for the Acer two versions: 144 mode off/on: what does that mean?

And what's the difference between EDID_ACR_472_6b1_5.bin and EDID_ACR_472_6b1_6.bin? Just a
different input? Same question for the LG.

Regards,

	Hans


On 11/19/19 1:07 PM, Joe van Tunen wrote:
> I think I’ve found 2 or 3 bugs in edid-decode. I've attached the fixes and some example EDIDs. I've also made some other changes. I've never made a linux patch before so please let me know how to proceed.
> 
> Bug Fixes:
> 
> - Corrected horizontal range in "Monitor Ranges" - was using incorrect bits for 255 offsets.
> - Fixed DisplayID type 1 timing calculations which were missing the +1 increment for pix_clock,ha,hbl,hso,hspw,va,vbl,vso,vspw.
> - Made refresh rate floating point instead of integer in detailed timings in descriptors.
> 
> Additions:
> 
> - Added DisplayID GP ASCII String (used by EDIDs modified by SwitchResX)
> - "YCbCr 4:2:0 Capability Map Data Block " now outputs the modes that support YCbCr 4:2:0 instead of just indexes of the modes. Indexes start from one and refer to timings in "Video Data Block". The code assumes that "Video Data Block" appears before "YCbCr 4:2:0 Capability Map Data Block".
> - Unknown CTA blocks are dumped as hex.
> - Decode "Display Parameters block".
> - Decode "Display Interface Features Data Block".
> - Decode "ContainerID Data Block".
> - Unknown DisplayID blocks are dumped as hex.
> 
> Changes:
> 
> - Change all horizontal frequencies to be displayed in kHz (Hz=vertical, kHz=horizontal, MHz=pixelclock) like they are in "Monitor Ranges".
> - For timings, added front porch, pulse width, and back porch numbers in parenthesis (smaller integers are easier to comprehend, useful when comparing or editing timings in SwitchResX or other editors, negative values will be more appearant).
> - Added missing VertFreq and HorFreq values to DisplayID type 1 timings.
> - Added product type to DisplayID.
> - Added DisplayID tag hex byte to make it possible to distinguish between DisplayID 1.3 and 2.0 spec blocks of the same name.
> - Remove double space when "(native)" is not output.
> 
> Minor changes:
> 
> - Use %hhx or %hhu for unsigned char parameters in printf. Use %x or %d for int parameters. Eliminates printf warnings.
> - Moved inner loop of cta_svd into a new function cta_svd_one so that it can be reused by cta_y420cmdb.
> - Added hex_block for blocks of data with that are not decoded.
> - Added feature_support_flags, print_flag_lines, parse_displayid_parameters.
> - Renamed conformant_extension to nonconformant_extension in parse_extension because boolean value of 1 = nonconformant according to return result of parse_cta and parse_displayid; matches interpretation in edid_from_file.
> 


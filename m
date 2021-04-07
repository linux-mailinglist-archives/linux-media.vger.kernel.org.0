Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2026356821
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 11:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350165AbhDGJe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 05:34:29 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56013 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233469AbhDGJeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 05:34:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U4ZclQEXaMxedU4ZflHDpf; Wed, 07 Apr 2021 11:34:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617788053; bh=ppTZMUtSsdy7wF18hhXKD880ROYMi2NCiNouAgPVj6E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Gppimv+qfURdvouYKalCBGZK1PkuJ+jyWKTXUvcbbePuWlfarWmvp5KLDJbn0PEf8
         MXO8niJ4MV25NeqTlUd27oH05xVwk0vmVPNUaBkVtBEllH/S9aBal8vLBlS2XNgzLu
         9c61D0r0fs+Q4NATh6BlTXmkaHryYS3V/8QIm1mPtBv53N8STPhcRQRKh35PrCmCJD
         ls1qg/oFjOt8a0D5RlsEwi2lPHqvRulWtlbqOLBOPqKVWq6mAZbIwLiDqLCZ2sUkI4
         Tra6SIOnzFt2O2CEpNF7lH6cQA3MzjmxNPxWQWUn6YtrAXywr//fx1cq2ottZwaIG6
         4H1An4XLryF8w==
Subject: Re: Call for an EDID parsing library
To:     Pekka Paalanen <ppaalanen@gmail.com>,
        dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
References: <20210407114404.13b41822@eldfell>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
Date:   Wed, 7 Apr 2021 11:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407114404.13b41822@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHxjC/CYCrxztRUly51HZ4AM5e1q+bjKt/2LE1YcjODPOR5QyCjFv5qWQF/eYACebtkRtSZJEGRuWX9OAoaCdvUL3MP4HNGj41toUguMYNoINPelgasG
 nYBhprtz0jhn2YXg/vDPk/GlhDID9vYXCELBU62Zn+64J2lmZIM4lbIaK3bqxD2DP+FODjgvTNnnHaGpWlPU5RQf0MSbh0azJouPRf7TuSj/TI0QWQG3jsl1
 FANZfA4P79Pn5i/LS8PPot6ksbIkrcdaG84ZBFA4KbHfZApHhgEysXhcWzrqZlfn4o5ak2b6uSsU+RsCiKkqmNhRraLJJqi1SGh/dKP0UtMUqO/Ffae34X/I
 tE8B69dL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pekka,

On 07/04/2021 10:44, Pekka Paalanen wrote:
> Hi all,
> 
> with display servers proliferating thanks to Wayland, and the Linux
> kernel exposing only a very limited set of information based on EDID
> (rightfully so!), the need to interpret EDID blobs is spreading even
> more. I would like to start the discussion about starting a project to
> develop a shared library for parsing EDID blobs. This is not the first
> time either, other people have suggested it years and years ago already,
> but apparently it didn't quite materialise as far as I know.
> 
> Right now, it seems that more or less every display server and other
> KMS application is hand-rolling its own EDID parsing code, even for the
> most trivial information (monitor make, model, and serial number). With
> HDR and color management support coming to Wayland, the need to parse
> more things out of EDID will only increase. These things are not
> exposed by the kernel, and most of these things have no use for the
> kernel either.
> 
> My personal motivation for this is that I don't want to be developing
> or reviewing yet another partial EDID parser implementation in Weston.
> 
> I recall ponderings about sharing the same EDID parsing code between
> the kernel and userspace, but I got the feeling that it would be a
> hindrance in process more than a benefit from sharing code. It would
> need to live in the kernel tree, to be managed with the kernel
> development process, use the kernel "standard libraries", and adhere to
> kernel programming style - all which are good and fine, but maybe also
> more restricting than useful in this case. Therefore I would suggest a
> userspace-only library.
> 
> Everyone hand-rolling their own parsing code has the obvious
> disadvantages. In the opposite, I would expect a new shared EDID
> parsing library and project to:
> - be hosted under gitlab.freedesktop.org
> - be MIT licensed
> - offer at least a C ABI
> - employ mandatory Gitlab CI to ensure with sample EDID blobs that it
>   cannot regress
> 
> Prior art can be found in various places. I believe Xorg xserver has
> its battle-tested EDID parsing code. Ajax once played with the idea in
> https://cgit.freedesktop.org/~ajax/libminitru/ . Then we have
> https://git.linuxtv.org/edid-decode.git too which has code and test
> data but not a C ABI (right?).

Correct, I moved it to C++. It was never designed to be a library, it
was primarily meant to turn an EDID into a human readable format.

And these days it is also a very powerful tool to verify EDIDs.

It is the most complete EDID parser I know based on the various standards.

> It does not necessarily need to be a new project. Would edid-decode
> project be open to adding a C library ABI?

I would be open to that. The best way would be to create a C library that
turns the EDID blocks into C structures, while edid-decode itself remains
C++ and uses the C library to do the parsing. While edid-decode supports
a large range of Extension Blocks, a C library could probably limit itself
to the base block, CTA-861 blocks and DisplayID blocks.

> 
> edid-decode is already MIT licensed and seems to have a lot of code,
> too, but that's all I know for now.

It is as far as I know the most complete parser.

> 
> Would there be anyone interested to take lead or work on a project like
> this?

I can assist/advice and do code reviews, but I don't have the time myself
to do the actual work.

> 
> Personally I don't think I'd be working on it, but I would be really
> happy to use it in Weston.
> 
> Should it be a new project, or grow inside edid-decode or something
> else?

I think it would make sense if it is grown as a library used by edid-decode.
The edid-decode utility is under active maintenance and follows the latest
EDID standards, so that will probably help the quality of the library. My
main requirement would be that the edid-decode functionality is not
affected, especially the conformity checks are still performed. And that
support for new/updated EDID standards can easily be implemented, but that's
exactly what you would want in an edid library.

> 
> I believe MIT license is important to have wide adoption of it. C ABI
> similarly. Also that it would be a "small" library without heavy
> dependencies.

It shouldn't need any dependencies. edid-decode doesn't need any either
except for -lm, which is probably not needed for the library part.

> What do you think? Could anyone spare their time for this?

Didn't you just volunteer? :-) :-)

Regards,

	Hans

> 
> Who would be interested in using it if this library appeared?
> 
> 
> Thanks,
> pq
> 


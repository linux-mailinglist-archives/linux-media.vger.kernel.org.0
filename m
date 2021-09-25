Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4794180B6
	for <lists+linux-media@lfdr.de>; Sat, 25 Sep 2021 11:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237010AbhIYJHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Sep 2021 05:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbhIYJHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Sep 2021 05:07:35 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360E3C061570
        for <linux-media@vger.kernel.org>; Sat, 25 Sep 2021 02:06:00 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id U3d3m6AOgdDnlU3d8m71Ic; Sat, 25 Sep 2021 11:05:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1632560758; bh=UIr7D/AJFDtuphk/CUBRB/FwfnKzB6DRTb09ngFAAwI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pWifB/xXFymnyqhGuC/5h97hFdzE4k979HRYhFxP8WA7x3QIzb538FjLcGLe2XOA8
         5Kk48DuNEPCUYE2r6ikHTgXF3QWZhMRYBY+KaEt78AUuFCLPqDVfTFUqxxVs3OS/Lx
         fjJVkZBoRBDZU8dZ5crH3wKUp8eVrA2xarZ2lf6D4lOC9lsThCT6JI91DsVUA6qKjI
         hz9jMSJMwtUfpxqiugQVbiYN1E1tlbAnyaCXWIX1WEstj0Jc63PCstk4IULGXtB+cf
         BS4tzOs55Tn38DE3GQ/2jPcio0TXDotF+O76H1Gpc6eEQJ+ykvAhfpdxJJI3fyEX9E
         d0dWmKIVdcAGQ==
Subject: Re: [PATCH 00/28] bug fixes, additions, changes
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20210924233149.10028-1-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9a50dfa4-1767-7b99-94c6-b6abfa528a44@xs4all.nl>
Date:   Sat, 25 Sep 2021 11:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210924233149.10028-1-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP1Hl1i91Y+NdiSuYCJNdPg8CrvU9gLJxEoWfdy443eFfOGW7c8jdI4WuBwFBvT6HRGSXCSd7qtyy2ituT5IJsR47T/TQc4Twh95P4ZVzDx5xlwQzSTx
 zB11bZiRlxRNER6A3s3K/b+mjnUjW+TH2uaH8Ra8RKvt1jviFH/oSIqtAoiAXHZGtoI0KKUXcdde5upjv/r0sRhzPe2DSZ7B1ah7lBA0Q9KI9+uuIYPJiATR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

This series is missing patches 20-28 (at least, I never received them, and neither
did they appear on the linux-media mailinglist).

It also needs to be rebased to the latest edid-decode git repo master branch since
it no longer applies.

Regards,

	Hans

On 25/09/2021 01:31, joevt wrote:
> - Patch 02/28 replaces my previous patch 05/11.
> It adds a new warning message.
> 
> - The problem with my previous patch 07/11 is addressed in patch 01/28 and 04/28 (and maybe elsewhere).
> 
> - Patches 06/28 to 26/28 replace my previous patch 11/11 (broken down into smaller steps this time).
> They contain some corrections.
> 
> - Includes some other changes.
> 
> 
> joevt (28):
>   edid-decode: remove unnecessary length check
>   edid-decode: fix standard timing vertical pixels
>   edid-decode: exclude oui from _block functions
>   edid-decode: check cta_hdr10plus length
>   edid-decode: Capitalize fail sentence
>   edid-decode: Replace return with break in switch
>   edid-decode: extended tag length check
>   edid-decode: Output block type before fail
>   edid-decode: update Microsoft expected length
>   edid-decode: Capitalize fail sentence
>   edid-decode: make all OUI handlers the same
>   edid-decode: move OUI parsing to separate function
>   edid-decode: move unknown block warning
>   edid-decode: remove cta_ext_block
>   edid-decode: change unknown CTA block names
>   edid-decode: move audio fail/warn messages
>   edid-decode: replace first_block with block_number
>   edid-decode: move parse_displayid_block inner loop
>   edid-decode: remove offset from displayid_block
>   edid-decode: displayid_block len fixes
>   edid-decode: ignore DisplayID version for OUI check.
>   edid-decode: DisplayID non-0 filler fixes
>   edid-decode: DisplayID length checks
>   edid-decode: make OUI enum
>   edid-decode: more OUI changes
>   edid-decode: remove extra vendor field
>   edid-decode: re-add one EDID
>   edid-decode: add interesting EDID
> 
>  data/apple-imac-retina-4k-21.5-inch-late-2015 | Bin 0 -> 256 bytes
>  data/vizio-m60c3-hdmi-onkyo-txnr555           | Bin 0 -> 256 bytes
>  edid-decode.cpp                               | 106 +++-
>  edid-decode.h                                 |  32 +-
>  oui.h                                         |  20 +
>  parse-base-block.cpp                          |   5 +-
>  parse-cta-block.cpp                           | 482 +++++++----------
>  parse-displayid-block.cpp                     | 498 +++++++++---------
>  8 files changed, 553 insertions(+), 590 deletions(-)
>  create mode 100644 data/apple-imac-retina-4k-21.5-inch-late-2015
>  create mode 100644 oui.h
> 


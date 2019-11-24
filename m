Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A86C10830F
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 12:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfKXLMT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 06:12:19 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:49183 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726673AbfKXLMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 06:12:19 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YpoMiFzf6LwWdYpoPiT0EX; Sun, 24 Nov 2019 12:12:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574593937; bh=P2WDD3Hs74oOP+K2BrxQQP3KD0ndfSRIowsT5rZ7WdA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kn4saRXcnZ272vjBpPDbq+GfHA5iLzeYogZZWkTZdCKk+cPGLjOCjQqCk3fONy098
         xYXIiHI+rD6on418elCwPM/nu8V2x33O5k/0dHtpUudp2YQXPUUtv7RbxpqLZqN9Km
         +kyxKANrhdBe++dtQqqSkJdORdbuY2p1DseodB2QzzhOG0LTGVKgiJbcz5Ua1kBSKC
         T0G8+FRkQGWNJdosLef/PlLyUmJ9f2ha7fbXpRaWpJycUUalZJK5aTCSWcBG4ako9V
         SmYSpO2L2o3HfOu9WNqkWbR/d592HsRFL2MU8RhYdCRzg4npZ2cGKXwA/VHgOR79iw
         GlsiOUAkPEmRA==
Subject: Re: [PATCH 00/10] edid-decode: bug fixes, additions, changes
To:     joevt <joevt@shaw.ca>
Cc:     linux-media@vger.kernel.org
References: <20191123164604.268-1-joevt@shaw.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <454f6b55-1679-1997-0da3-77b140312792@xs4all.nl>
Date:   Sun, 24 Nov 2019 12:12:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191123164604.268-1-joevt@shaw.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCowgip6D30QQF1FQrLv8GKywM2ELGPhSCRbf19vLX3K4THEqdjIhILWtQ+T5lS2eBgkZychv1GHf/hRzol00dVVFyoGFD7IzuLYvDUyaayK6W4ou/sx
 0cAMguBAoocFCb2WdimBAXjlqhPYEUpJEh5q8HuCc8ZRmJiIB90IxxQmFQ0grcVgksirp64ToZVcS4E8d3JKerYBCnX7Z7Xk2vg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

On 11/23/19 5:45 PM, joevt wrote:
> This patchset is a set of bug-fixes, additions, and changes I've made while examining various EDIDs I have encountered.
> 
> joevt (10):
>   edid-decode: change horizontal refresh rates to kHz
>   edid-decode: correct horizontal range in Monitor Ranges
>   edid-decode: correct calculation of DisplayID type 1 timings
>   edid-decode: add front porch, pulse width, and back porch
>   edid-decode: output timings for YCbCr 4:2:0 cmdb
>   edid-decode: Dump hex of unknown CTA Vendor-Specific blocks
>   edid-decode: cleanup printf format string compiler warnings
>   edid-decode: Dump hex of non-decoded extension blocks
>   edid-decode: DisplayID additions
>   edid-decode: add example EDIDs

I merged patches 1-4, and 6-8.

The others need a bit more work.

Note that I made some slight changes to some of the patches for stylistic
reasons. It's noted in the commit log.

Regards,

	Hans

> 
>  data/acer-xv273k-dp1                          | Bin 0 -> 384 bytes
>  data/acer-xv273k-dp1-tile0                    | Bin 0 -> 384 bytes
>  data/acer-xv273k-dp2                          | Bin 0 -> 384 bytes
>  data/acer-xv273k-dp2-tile1                    | Bin 0 -> 384 bytes
>  data/dell-p2415q-dp-mdp                       | Bin 0 -> 256 bytes
>  data/dell-p2415q-hdmi1.4                      | Bin 0 -> 256 bytes
>  data/dell-p2415q-hdmi2.0                      | Bin 0 -> 256 bytes
>  data/dell-up2715k-dp1-tile1                   | Bin 0 -> 384 bytes
>  data/dell-up2715k-dp2-tile0                   | Bin 0 -> 256 bytes
>  data/dell-up2715k-mdp                         | Bin 0 -> 256 bytes
>  data/dell-up2715k-mdp-switchresx              | Bin 0 -> 384 bytes
>  data/kogan-kaled24144f-dp                     | Bin 0 -> 256 bytes
>  data/kogan-kaled24144f-hdmi                   | Bin 0 -> 256 bytes
>  data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0 | Bin 0 -> 384 bytes
>  data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1 | Bin 0 -> 256 bytes
>  edid-decode.c                                 | 758 ++++++++++++++++--
>  16 files changed, 671 insertions(+), 87 deletions(-)
>  create mode 100644 data/acer-xv273k-dp1
>  create mode 100644 data/acer-xv273k-dp1-tile0
>  create mode 100644 data/acer-xv273k-dp2
>  create mode 100644 data/acer-xv273k-dp2-tile1
>  create mode 100644 data/dell-p2415q-dp-mdp
>  create mode 100644 data/dell-p2415q-hdmi1.4
>  create mode 100644 data/dell-p2415q-hdmi2.0
>  create mode 100644 data/dell-up2715k-dp1-tile1
>  create mode 100644 data/dell-up2715k-dp2-tile0
>  create mode 100644 data/dell-up2715k-mdp
>  create mode 100644 data/dell-up2715k-mdp-switchresx
>  create mode 100644 data/kogan-kaled24144f-dp
>  create mode 100644 data/kogan-kaled24144f-hdmi
>  create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp1-tile0
>  create mode 100644 data/lg-ultrafine-5k-v2-thunderbolt-dp2-tile1
> 


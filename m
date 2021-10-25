Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815DB43968F
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhJYMrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 08:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbhJYMra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 08:47:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9D7C061745;
        Mon, 25 Oct 2021 05:45:07 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ezLamN9JyUo2HezLbmIfLC; Mon, 25 Oct 2021 14:45:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1635165903; bh=MIrPmlZMXbntaIfNzNiL+53Ms2d0qAt5qT61zPsRcbQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m+LHcJME2HJ9EGk9IY8grmg1yD4Ju2weXMHpTdctYcDZ1f3MIo8GHOYiT9xJuM20z
         PGrgbqcIvJ1DmiN8w5eNx+gMw91DBp6MV6Ucjx+sAxdP/bKcAoRWHLoSAHeMvXCu92
         cTVk4gumwFPGp+LzJxVZqPz++WMsNK2xRhnCfOl1NLlihSCI55nj0UZPPA4XqGEdZV
         BMOQnyUq1DhLZMCvK3hdB2D+/ioyZ05F58mjr+4WM2IkMMsUSSPUqMtu12vArOiIwl
         2AFCXK/tkY7TiKyJYEjZesB+hH0drxjYZc3RPxUTdT1tq9UBkS7IgRSARxNBhOhi1+
         bMqRvvK/XbmsA==
Subject: Re: [PATCH v2 00/10] staging: media: zoran: fusion in one module
To:     Corentin Labbe <clabbe@baylibre.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20211013185812.590931-1-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <da925d73-fdf0-3962-3841-a1dd53b5c5dd@xs4all.nl>
Date:   Mon, 25 Oct 2021 14:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG4yLNWqnYNBP9/1n40nSetLdb+rU3jaz1ZDe2tK5Z8747Kg5+iSFSKeNp69iojMjYf8Q/XAlZFW9QUFkOnWaqd2etvO+PbYJnYieGVwd8wTN8u2qkYx
 mE7RyI7qYfdNTklpdzSqQu8kVhzm9pouB45Zri1vUBhJHecpHSxod+pWetwy/s8ZuFk73+mIGFNNs8aX+Eb+0Qirm5iRU9oZsmjFzCoyLr+3qn9W95FEvtSr
 pMPKYMFwnJj0Blv2b+B/xZ50TH1ePxcwO2yY39MAjBK/xNC33xO2P0JJEHc5PwMGCNjzWI5kbwvZFL5QkrTJEzodM5Ihi1hpSTairWzdb0VDLxo2e72IXCr8
 33mE1IkGRoqlTjgeBbF/k6thPWfylWpHm+Pzhomptk0dbV/zSkVPue7AKq5wLzlzk1zwyW0HMQP8FfKV1WboMs4UJjYWKte/TcDXUH8ck1FO55j21dOZYCOx
 wRrmcoxHlCgNsJyVrltcdi+Hdq35o9Ud8N6IjdvzC5Hw7beS97rfl24OqXw=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

On 13/10/2021 20:58, Corentin Labbe wrote:
> Hello
> 
> The main change of this serie is to fusion all zoran related modules in
> one.
> This fixes the load order problem when everything is built-in.
> 
> Regards
> 
> Changes since v1:
> - add missing debugfs cleaning
> - clean some remaining module_get/put functions which made impossible to
>   remove the zoran module
> - added the two latest patchs

Something weird is wrong with this series. I have a DC30, but loading this with:

modprobe zr36067 card=3

results in this error message in the kernel log:

[   58.645557] zr36067: module is from the staging directory, the quality is unknown, you have been warned.
[   58.646658] zr36067 0000:03:00.0: Zoran MJPEG board driver version 0.10.1
[   58.646793] zr36067 0000:03:00.0: Zoran ZR36057 (rev 1), irq: 18, memory: 0xf4000000
[   58.648821] zr36067 0000:03:00.0: Initializing i2c bus...
[   58.662420] vpx3220 22-0047: vpx3216b found @ 0x8e (DC30[0])
[   58.737445] zr36067 0000:03:00.0: Fail to get encoder

This works before, so why this is now failing is not clear to me.

It does work with 'card=0', but I really have a DC30.

If I test with 'card=0' then the rmmod issue is now solved.

Regards,

	Hans

> 
> Corentin Labbe (10):
>   staging: media: zoran: move module parameter checks to zoran_probe
>   staging: media: zoran: use module_pci_driver
>   staging: media: zoran: rename debug module parameter
>   staging: media: zoran: add debugfs
>   staging: media: zoran: videocode: remove procfs
>   staging: media: zoran: fusion all modules
>   staging: media: zoran: remove vidmem
>   staging: media: zoran: move videodev alloc
>   staging: media: zoran: move config select on primary kconfig
>   staging: media: zoran: introduce zoran_i2c_init
> 
>  drivers/staging/media/zoran/Kconfig        |  46 +--
>  drivers/staging/media/zoran/Makefile       |   8 +-
>  drivers/staging/media/zoran/videocodec.c   |  68 +----
>  drivers/staging/media/zoran/videocodec.h   |   6 +-
>  drivers/staging/media/zoran/zoran.h        |   6 +-
>  drivers/staging/media/zoran/zoran_card.c   | 328 ++++++++++++++-------
>  drivers/staging/media/zoran/zoran_driver.c |   5 +-
>  drivers/staging/media/zoran/zr36016.c      |  24 +-
>  drivers/staging/media/zoran/zr36016.h      |   2 +
>  drivers/staging/media/zoran/zr36050.c      |  21 +-
>  drivers/staging/media/zoran/zr36050.h      |   2 +
>  drivers/staging/media/zoran/zr36060.c      |  21 +-
>  drivers/staging/media/zoran/zr36060.h      |   2 +
>  13 files changed, 291 insertions(+), 248 deletions(-)
> 


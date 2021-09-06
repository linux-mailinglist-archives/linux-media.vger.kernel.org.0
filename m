Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4325401A4F
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 13:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbhIFLFE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 07:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhIFLFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 07:05:03 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0918C061575;
        Mon,  6 Sep 2021 04:03:58 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NCPsm6vHllQKhNCPtmQzSN; Mon, 06 Sep 2021 13:03:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630926237; bh=mDvtFV9UjP+KgBf+7q8PbDmYnyjvS8LhvtNWmmO4/Uk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=h7YHvb1CK1GEjunBsOYuF/d6z4r+chqjsNh4lVpvYcvwoggkr4d9tYKnqKfINSEkt
         oo+pfgRxAFKClLK8f7S5Cxmb+6WBbilsxULb2HqKSrdzNG2S4OPrqQhobmFdiJ76XA
         UjIEQnAOGIIRaiKIs1IMMxISszv0m84Hmrpg0g3u+g9oRRIRjpW3Hs6qUHrzadWh/r
         M1BMshXgsVbw6VB0fcF2oKPxtmysahQJ7qv2zXi0XQBOyFCnZ3Krl7G3yHkpjF463j
         F7l655g6L9dcZQ5xWMWXvEm+Ra7SahOoRKdIqsBfr+N+Rlsy9Whja/YFCR6NYZG+8h
         M2tVIjrgQSzKw==
Subject: Re: [PATCH 0/8] staging: media: zoran: fusion in one module
To:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20210903191540.3052775-1-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <efe035cc-1839-210f-c0d4-4d58801aa65c@xs4all.nl>
Date:   Mon, 6 Sep 2021 13:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJIXL08RwQgMNMzOYbe0M0VJlLntr2uNqP+LLvSAcYVjylm6uej9Wx4ry4BYBNOsaxT/1woOlqCnq/HGjhbnPEot+2QLc9CggTOnJLFl8Io7omw+8BB8
 mGgN2mJrKsxT1QWv3Wav2WvQeSKCDOjGtPVjZnxkcKCCloHzN+HUPdkEvciFs2VX5enEbb6BWK8b/XtG/JijRKRwyEnC+2WP4a7GNmjxAHPzHnvgbUKbsAaU
 vKgmsnxUXksAcIfM/GlTYRh2XqsWniIpRrHkYMBkYkBjwHmud7iu53p5qNvfwluIkJn//RrJXHrZ/opgKXK5lDFXfDhGI/XzP5QQSAv3y9zEbta4h2+XKEJr
 qGItXiPM+S8oWacsLHcDVlW2TNlzCYyQoqzsNmgNRbBazbvAESHGyA5StVfaACqcpndLDGaVkBRjX6xe/tY380px5hnViikZFiieqbsW6JZ3g54H6K0jEvMz
 9nJcfvc1bcJ9S9QjAnMQq8c3KsyLj4i0Irt470PW/ozYNJ1yZf2nxW0P7Q8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

I finally had the opportunity to test the staging zoran driver.

I found several issues when running v4l2-compliance -s (I posted a patch
for that), but more seriously is the fact that trying to capture MJPG
at resolutions 384x288 or less just hangs my PC. It works OK with 768x576.

I discovered this when running 'v4l2-compliance -s -a -f'.

BTW, why isn't the initial format equal to MJPG 768x576?
I would expect that for these boards that should be the default format.

Another issue is that the TODO should mention that for video output there
should be a second video device node. And that's really something that
has to be done before the zoran driver can be moved out of staging.

It shouldn't be that hard to implement, I think.

Right now it is impossible to run the compliance test for the output, since
it doesn't even see it as an output.

Regards,

	Hans

On 03/09/2021 21:15, Corentin Labbe wrote:
> Hello
> 
> The main change of this serie is to fusion all zoran related modules in
> one.
> This fixes the load order problem when everything is built-in.
> 
> Regards
> 
> Corentin Labbe (8):
>   staging: media: zoran: move module parameter checks to zoran_probe
>   staging: media: zoran: use module_pci_driver
>   staging: media: zoran: rename debug module parameter
>   staging: media: zoran: add debugfs
>   staging: media: zoran: videocode: remove procfs
>   staging: media: zoran: fusion all modules
>   staging: media: zoran: remove vidmem
>   staging: media: zoran: move videodev alloc
> 
>  drivers/staging/media/zoran/Kconfig        |  24 +-
>  drivers/staging/media/zoran/Makefile       |   8 +-
>  drivers/staging/media/zoran/videocodec.c   |  60 +----
>  drivers/staging/media/zoran/videocodec.h   |   5 +
>  drivers/staging/media/zoran/zoran.h        |   7 +-
>  drivers/staging/media/zoran/zoran_card.c   | 259 +++++++++++++--------
>  drivers/staging/media/zoran/zoran_driver.c |   5 +-
>  drivers/staging/media/zoran/zr36016.c      |  23 +-
>  drivers/staging/media/zoran/zr36016.h      |   2 +
>  drivers/staging/media/zoran/zr36050.c      |  20 +-
>  drivers/staging/media/zoran/zr36050.h      |   2 +
>  drivers/staging/media/zoran/zr36060.c      |  20 +-
>  drivers/staging/media/zoran/zr36060.h      |   2 +
>  13 files changed, 229 insertions(+), 208 deletions(-)
> 


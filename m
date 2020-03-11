Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE791819B1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbgCKN0w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:26:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46425 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729558AbgCKN0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:26:52 -0400
Received: from [IPv6:2001:420:44c1:2577:d578:21fa:bf61:c876]
 ([IPv6:2001:420:44c1:2577:d578:21fa:bf61:c876])
        by smtp-cloud7.xs4all.net with ESMTPA
        id C1NmjUCJkEE3qC1NpjPzQP; Wed, 11 Mar 2020 14:26:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583933210; bh=d4zk5YWXejQ8kjLxF1sj4FKOLbv++IgtZnhKk9AS/l4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Aixh6akpxMOsjNu9RgfbsGafMaaTKSBDtJy6Lzk7i4pLVGz4Gm/4UIT/EWOETfYAS
         ZAkSmHroYI5d4yJ7/L02YkZTJet1Vp56SorwGirz7NitUyWUHqIlUMPocBWQbhNXAV
         PhUEIe42ubVI41va/Sc/tEjdeFlyXaE4YxKwrWNydqforvsAt3p3Ga/2EUIqda++En
         Z+M0p3Ng39h916/aC06gmRlV18ZJTyE5qlAKu8lO99nRnFSln2AgDJP7Gv1b0sMeVr
         ZnCCanSAKgT42cO3+9167M4f4k1D0M2XV4FtG6AKxwiii0khEo3sQ/mTYM1yFacvtt
         tqXoIf7rC1kDg==
Subject: Re: [PATCH v2 0/1] Virtio Video V4L2 driver
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        linux-media@vger.kernel.org
Cc:     virtio-dev@lists.oasis-open.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, egranata@google.com, fziglio@redhat.com,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c4d7622b-e396-3920-0e14-5a73a0225c0f@xs4all.nl>
Date:   Wed, 11 Mar 2020 14:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218202753.652093-1-dmitry.sepp@opensynergy.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfADoSisLI3D7g4efSivmeW6JWdvVKJLlAoP0SrXsfclrkCLX8/cA0oUYw/fDHrV0fBiCT/fAyakptZ3gopDcXQtitlIcaRhc27dQNWxGy/0mFin9Bph5
 rfHwIH0/um50LItNKgWD7Z/cIII+cIbkyRe0PwyVnfKUpEQyVCjKlidJNZTpRt9rmXajTMHk2XcJ8FaKM7GXL5IJkLpN56tc7gp8y/C3fHO+m4Wq2xk/uAah
 Lc6oUl7KyDhAN7o6invofM1GhjzCoiNQVuawuHHdS8wW4lRWNJWYVdQU3LAKvP11HqIRJPs4guI0xt/MIfSc4cUzhTlZBYXm0iKWAnb+U96w7bBsCAf1a4L/
 ErA2Y0ynn4q4F04POA0HyS0LL4/14sE6X9y5RzKxfOgPxCIkoFduGicyFT5Q7v8iFtWPkJ2e0Cz+xn6N1Jo/cxVgl1K5SZTYw2olPnLXMg1hhP1/NyPuQlqb
 plGO4UwLdpHaGuN014FKOiVrOEOVjNt7ntdIRvvA69SnXX9wd4/11SQOVHCSvaczDnC8+zpezfdXefQRXzjpEdnpjj9wlEl/1kZRxa+6Hf/3EbAMx6IpJwbc
 tHnYZmtUFAHA7P+WlMgE7vIHGHWZaxseuCFOduzC9WHFTP20DyoMHq1kBQk65wG74pFUHNe1sPFRn+oYYq1yGcTloqEhFOX8EA7lySNfwcjDYrayZMkeeZxD
 VSFDG0ZcOOAr7+z/2hqopuTOVDZSt2EocnRda2B4phiW7JqCvTsNbDEOj3gEIXr6B5xf4Uamc11/+n7CfIx15HVAXYYVKxgoEmsWHkPunRX+GtEFR8UbRJPn
 LjO/u+9YxsYpr2QDPuym0BpzhJ+YgiFpVQbbGNAd5wyJxlvuwTywd2a6u4OsbLE129GDAlc3pK/xsTy/aOmTTiaBCtlsxV/nvIsNAjhH/qfnCrBbL3ESUq8v
 Lg0Yvg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On 2/18/20 9:27 PM, Dmitry Sepp wrote:
> Hi all,
> 
> This is a v4l2 virtio video driver for the virtio-video device
> specification v3 [1].
> 
> The first version of the driver was introduced here [2].
> 
> Changes v1 -> v2:
> * support the v3 spec (mostly)
> * add a module parameter to ask for pages from ZONE_DMA
> 
> What is not implemented:
> * Plane layout flags should be used to propagate number of planes to
>   user-space
> * There is no real use of stream creation with bitstream format in the
>   parameter list. The driver just uses the first bitstream format from
>   the list.
> * Setting bitrate is done in a different way compared to the spec. This
>   is because it has been already agreed on that the way the spec
>   currently describes it requires changes.
> 
> Potential improvements:
> * Do not send stream_create from open. Use corresponding state machine
>   condition to do this.
> * Do not send stream_destroy from close. Do it in reqbufs(0).
> * Cache format and control settings. Reduce calls to the device.

Some general notes:

Before this can be merged it needs to pass v4l2-compliance.

I also strongly recommend adding support for V4L2_PIX_FMT_FWHT to
allow testing with the vicodec emulation driver. This will also
allow testing all sorts of corner cases without requiring special
hardware.

Regards,

	Hans

> 
> Best regards,
> Dmitry.
> 
> [1] https://markmail.org/message/dmw3pr4fuajvarth
> [2] https://markmail.org/message/wnnv6r6myvgb5at6
> 
> 


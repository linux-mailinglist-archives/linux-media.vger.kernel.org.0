Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91F1618A23A
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCRSS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:18:59 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46289 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgCRSS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:18:59 -0400
Received: by mail-ot1-f67.google.com with SMTP id 111so26493687oth.13;
        Wed, 18 Mar 2020 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tiyv0aKR6j2TLesbwyHNfIWZmAkPT6pi+C5JlyYu++0=;
        b=PZEx1pweHbCnbJQo11kRsfEOajWdXG0zpR8tGzk2tYzhl8+jzizYJv0Hu4JUYKjVA6
         32EKJ5J2ES2oyTjANDKmD4g+XROVcm0f9UwqkBX3PoQoWUD4/9bQ0EF83qo00JLQBAru
         gmjp/anrYY+WS8t3rdY6p2OHr5VO68nsOdJ3ohIjH5NnMUuM1ZxUnQh5/mNfDRwiFz/q
         YnQ7gIB6ozY6lynkPsNBUczvYDdWO1yS0p9s3yMXBNMycRKtjROHyMMzRApKijlnZzi5
         pda87I3ay06bHiGBmZ74jIURhtxVEhLdop9R/QwTBLEIpLsE49WNsXBxWHfanp3O21fF
         GhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tiyv0aKR6j2TLesbwyHNfIWZmAkPT6pi+C5JlyYu++0=;
        b=DrZU0rSWYD29Xuw1kmu57HpmB41E5V+fSlUujDCW76e8z/6hDgcUSY0/CKg6Y6/Pee
         d8WWuPE/jb72v8Q+RgcPIR0OxWb0W4OIcfPu2vwFITTtTr81Rv7BonUrsZ/5++MKpQ39
         FdKG+2m5fSUZ/IA3091OnqOB6D1R9kZ+0rUDaE+xQV1klh8fdecpL1Db/DH6ouW1IjtV
         pAImKkIgAocBXD0dgh/DVpW9j/TEqgieLJI4EPT3P7FiAoSiHpvcxKRKhZJA+ClHeyw+
         kdksuZBi3uY0mUlcpIEgsXiiDm2v2PxaTM+rjxIGJdrqg9yI5QinzJ/uxf05gb9tVjHJ
         Nfwg==
X-Gm-Message-State: ANhLgQ2PESNavQekszKODyvboyzBUCUrUJNLlf8G9KnFFg9adtbCEZWX
        wXJotZAnJvnNmxjFHuSKbcz5d159tbBUUeSYf7s=
X-Google-Smtp-Source: ADFU+vuI3X2ynLTGzpukv5D35hyKQIKy/YVmt9q7FP9hzqmpSOzhC/D3EjCvWq5I3FI5lL9PYhpcoJlxNi5kzPl0QUM=
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr5100904otl.325.1584555538509;
 Wed, 18 Mar 2020 11:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 18 Mar 2020 18:18:32 +0000
Message-ID: <CA+V-a8ugTMi2UZsb1aLeo532T55uLNFT00NyvniDSx0Ly8kCdQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] media: v4l2-async: Accept endpoints and devices
 for fwnode matching
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Mar 18, 2020 at 12:25 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Hello,
>
> This patch series is the second version of fwnode endpoint matching
> support in v4l2-async. The first version was a single patch and can be
> found at [1].
>
> Compared to v1, two additional changes have been made, which I have kept
> as separate patches for now as they're under discussion. On top of the
> base patch (1/4), patches 2/4 and 3/4 log a message when an heterogenous
> match is detected. This should help speeding up the transition. Patch
> 4/4 moves away from checking the node name to determine if a fwnode is
> an endpoint, as requesting by Sakari.
>
> [1] https://lore.kernel.org/linux-media/20200318001726.GQ2527@pendragon.ideasonboard.com/T/#mfd71ee449a34f4f453941d5ec9a11f02cfb9e494
>
> Laurent Pinchart (4):
>   media: v4l2-async: Accept endpoints and devices for fwnode matching
>   media: v4l2-async: Pass notifier pointer to match functions
>   media: v4l2-async: Log message in case of heterogenous fwnode match
>   media: v4l2-async: Don't check fwnode name to detect endpoint
>
>  drivers/media/v4l2-core/v4l2-async.c | 81 +++++++++++++++++++++++++---
>  1 file changed, 73 insertions(+), 8 deletions(-)
>
Thank you for the patches,

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

> --
> Regards,
>
> Laurent Pinchart
>

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF3EC8F8B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 19:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfJBRP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 13:15:58 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:34210 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBRP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 13:15:58 -0400
Received: by mail-vs1-f50.google.com with SMTP id d3so12483563vsr.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ApUTFNpNUbxIwBULzTYv/vEuPSjVAPc3COyEiocqIus=;
        b=f8EHSSm/iSF0DvEnmm70kdugNZEGokiwKJUP0fx9JBtJ3AsuoTk5MGyd0VL76SX7is
         KlP+Q/Ohdo6UUn2waJPyxL478s8e4zzc+x4tN1dFf/slYmbli6JBdfFUj92J1L+N3VKL
         ypfxfbP6qvDNAkvbtHaMQlmk8u3yTPZq2lAvKW3zgnOCnbu+Lhh0dOqYd51rZ4EB3E0c
         CLyt2g/nsGW8KTNeDy89+dUUsX0geaEHxdwPm48Uavlj2+DdnLoQxSJOCq0cn781UIyB
         gyFSGzhRc6NgQYVzZxP/PqjLuJgDbHLjoQgdMNrCM95vM+PseChzARmXNTztVHSB0l05
         G7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApUTFNpNUbxIwBULzTYv/vEuPSjVAPc3COyEiocqIus=;
        b=MFVv6BgmCV3er81mS3twGjCJmHk33QJ6qppomWskumaKXCBtnzycLT7aX/IVeUPr8C
         r6tFOUa9rv2poNx5U03HSs8z1Ww4OdEdLmePYpItAYHtJcc5eiV/0VGd/uBErg7X04V0
         07n/koI7IIlBldXmaOr3JU8UlPVXpKqtFqyCZqLAAR1Mg7Al7vYhQd1o6iDvsq3Wngwf
         WINxCLQCD8noLMV1bDhay+c7eCCmJa+qZ9HoDp14vCz+6tK50JfutHUclMbTiDI6TS+o
         GRUe984dmbifHmwMmcDIpYMx3ONf4Ya/H1UoGIdLDBx3PkOYHAHAFrXCJ+uTTMwRKVwF
         /XTg==
X-Gm-Message-State: APjAAAWAvv9JSHkskA9VV27hlREnswHY3pj52T/nexxcJf9G1dx8/txP
        +AYSxU4q5iRkVQZexieOWoPds7xshoayfQ21pZdXBEc0
X-Google-Smtp-Source: APXvYqyKNhWveGK11VzyzRqjLjP+N91mbx4gb8oubANhP0cbJqEmAsIoMERj6Mch/x69v2Z+I0a6AzUhpHjbCjRTDWQ=
X-Received: by 2002:a67:e254:: with SMTP id w20mr2513536vse.39.1570036556963;
 Wed, 02 Oct 2019 10:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <201910021929.ij7Rrmvk%lkp@intel.com> <20191002130102.97852-1-szakharchenko@digital-loggers.com>
 <20191002140814.GB5262@pendragon.ideasonboard.com> <CADYCxoOzwRQctuVaqEx40WgFLo4PY0sV4R11r+pn+Wu0jLzPng@mail.gmail.com>
In-Reply-To: <CADYCxoOzwRQctuVaqEx40WgFLo4PY0sV4R11r+pn+Wu0jLzPng@mail.gmail.com>
From:   Sergey Zakharchenko <doublef.mobile@gmail.com>
Date:   Wed, 2 Oct 2019 21:15:45 +0400
Message-ID: <CADYCxoNTBmX8RYf18xmX0B8xD_LvNJbZ5buyAgo5E9v14B3S_A@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Add a quirk to force GEO GC6500
 Camera bits-per-pixel value
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sergey Zakharchenko <szakharchenko@digital-loggers.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin Bodo <martin@digital-loggers.com>,
        "Logan, Peter" <peter.logan@intel.com>,
        Auke Kok <auke-jan.h.kok@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sergey Zakharchenko <doublef.mobile@gmail.com>:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> > Do you think it would make sense to do this by default, without
> > requiring a quirk ? Or are there cases where this calculation would lead
> > to incorrect results while the bpp reported by the camera would be right
> > ?
>
> The loop is a simplified version of the v4l2_fill_pixfmt() loop. The
> calculation might need some checking, and might be invalid, in case
> block_w/block_h format fields are significant (not 0 and not 1),
> because then effective bits-per-pixel would seemingly be fractional,
> and depend on the image dimensions if they weren't aligned; however I
> see no formats using the block_w/block_h fields defined so far.

It's likely possible to directly replace the bpp-using computation in
https://github.com/torvalds/linux/blob/2874c5fd284268364ece81a7bd936f3c8168e567/drivers/media/usb/uvc/uvc_driver.c#L636
with a call to v4l2_fill_pixfmt() and the sizeimage it returns.
However, bpp is used elsewhere, and it's hard to tell what it should
be taken to be to in the hypothetical exotic cases I'm considering, so
I'm reluctant to go that route.

I'm going to send v3 in an hour unless there are other suggestions.

Best regards,

-- 
Sergey Zakharchenko
Digital Loggers, Inc.

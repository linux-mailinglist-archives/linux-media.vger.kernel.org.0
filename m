Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3B70C8C23
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfJBOyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:54:53 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:34672 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBOyw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:54:52 -0400
Received: by mail-vk1-f175.google.com with SMTP id d126so4383153vkb.1
        for <linux-media@vger.kernel.org>; Wed, 02 Oct 2019 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTNU2QdY7xS3AqARhhtWIF99bezUFT0DWNXAG4BhYao=;
        b=AL1Px05k1xNmXAnuG4S1ivQSwaIMO1Y9mmqPX8G8yPOE33szgf2lpiijq/JRQLxwIY
         9GEn9NPmJAEOzwzGBgzWdTQjsNlvPN5byYWbf7s46yV9AWgPrzKea8uNOppACzqb/nAt
         yS90RLOZYBsfVJ7t/iAmMnEwf1ReP0kAYrEqqfBSmAkZnIkGgCy3Hsos0pyZBCEwSS+x
         CMhGz9HZZyTQqUMpGeLJZSTYCyFPicicLxwfeyNV+BWU7ip+6kQaDwEUs+QbpGlafw/V
         0qRWtJ5ULZ30XnSvESGiHeRLV84JsEQnSF5d3tfDCJwGMKv0FdujmjNEynqBR5nTyu8g
         yo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTNU2QdY7xS3AqARhhtWIF99bezUFT0DWNXAG4BhYao=;
        b=hBU+xeJsVjxAT7B5HYtVKbb/VEYzuBktlULckUlTR2hp30lgG9z889KoZ4cRqsClG1
         wSlltPPc6KGAGQFi1r2uPRmhizp2jlnNxDgWpptrFkg35/vZTbj9znIgGlHauFdgXNEG
         EdVFXvMCdt0QgpySA7nD97RYLGPIm1jctdN7oPgeoq+g3z0WQVhl20uYW4y27i41TBNu
         wo9l4dMnBYY9XDNOyWwZXgebEtODHjN4PHFmWxSWO7xW+bAgkrIJ30qp+hXrPW8FzQgN
         uv04Lrgwv2bsPIQF5BadtWPDihNNqll7KCS6mBZWdSqpHM4h/xLaIkj65O7VTI1TggEf
         AThA==
X-Gm-Message-State: APjAAAVChWeWP7w69Sij+X8e4+ZpMxiSi1eWonxW6za0rAoaaNf1/Ib3
        rxQhCy89p/IWzjMvXZpb9UA3FcsLI8zGf46UUK0=
X-Google-Smtp-Source: APXvYqwNzv20JyctGQovUz45DIvNazhYzT4CMOswRmTMqDu/gJmhRlr/euWv7ajNWX4MPFod1A5d2WnPsux6tkkszws=
X-Received: by 2002:a1f:5243:: with SMTP id g64mr2222234vkb.26.1570028091599;
 Wed, 02 Oct 2019 07:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <201910021929.ij7Rrmvk%lkp@intel.com> <20191002130102.97852-1-szakharchenko@digital-loggers.com>
 <20191002140814.GB5262@pendragon.ideasonboard.com>
In-Reply-To: <20191002140814.GB5262@pendragon.ideasonboard.com>
From:   Sergey Zakharchenko <doublef.mobile@gmail.com>
Date:   Wed, 2 Oct 2019 18:54:39 +0400
Message-ID: <CADYCxoOzwRQctuVaqEx40WgFLo4PY0sV4R11r+pn+Wu0jLzPng@mail.gmail.com>
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

Hi Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
> Do you think it would make sense to do this by default, without
> requiring a quirk ? Or are there cases where this calculation would lead
> to incorrect results while the bpp reported by the camera would be right
> ?

I don't nearly have the experience with a broad range of webcams
required to answer this question. At the very least that would tax
well-behaved cameras with a tiny but unnecessary bit of initial
computations.

The loop is a simplified version of the v4l2_fill_pixfmt() loop. The
calculation might need some checking, and might be invalid, in case
block_w/block_h format fields are significant (not 0 and not 1),
because then effective bits-per-pixel would seemingly be fractional,
and depend on the image dimensions if they weren't aligned; however I
see no formats using the block_w/block_h fields defined so far.

AFAICT the division should need no rounding for the raw formats
currently listed; just being cautious there.

> Could you please keep the entries sorted by idVendor/idProduct ?
> As this is the only device using this quirk, you can drop
> uvc_quirk_force_bpp and use
>
>         .driver_info            = UVC_INFO_QUIRK(UVC_QUIRK_FORCE_BPP) },

All makes sense and will be adjusted, thanks for the review!

Best regards,

--
Sergey Zakharchenko
Digital Loggers, Inc.

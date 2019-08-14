Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27348D181
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfHNKwT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:52:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33207 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfHNKwS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:52:18 -0400
Received: by mail-oi1-f193.google.com with SMTP id u15so72236258oiv.0
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BFvHPaEBpVtDvsWsYTlc9ktuYlykq2Vr8qmG0BvJYjQ=;
        b=nZvbfydpf2sDd0yKC1kYDe7pbTYf0RoRnG/RwmCKjN4PumO0LUNsXhUwuGjilZjqI1
         nYaRqSAEFEqavuSSKxdcN6kkX0m9c+6ArZfhoviiE37qwBpKRFUYF1jWToMixOQkSFJA
         qjm9yWN0hOS0n1/MvltJKRhnYLeknjuIHfB2FapfoPmgfnZwA7iW8k1TPD/LjKXYhe9N
         LlJ/dFJnU5Cp3WbO2Hsls6hry/vs4ggNY6JdYejq6jRP16HM2bLhWwe+CfZ+ncYIWh/W
         aKRjnNGCAknT7MYibajbR+rmDfl110as88QeipfeOBKHgbL5EXpAQ/t1FmK+vXzStbvi
         GnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BFvHPaEBpVtDvsWsYTlc9ktuYlykq2Vr8qmG0BvJYjQ=;
        b=hkKGVK4MsHcXSKeVP69omBAwBpW1iqzH9k+hpEbVFlbHBub5mRwMvwFLIZaisLFAIw
         zCKm1rwfWp2By01yujAno12SA7IHy30Tiv1meEUWoVZ3o3GEWG6tkGV223fbHGjJmpq+
         2teKCYZGpZwbOQlaziUuWnZX0PsjWWsSS4XJrIOHEwQtgR6x7lWdrXKxP9vD0bkofnQr
         ULmt8NeXjqpp80PeoGzIp84YZ7ZD2tkRtTVOevUe02lOucTmi8BubhoU2nbM5uRVMhgf
         x7sLxxDQqB0J29YGSLTp7xhbqqJOPYeJ1yYCdBUimO38GvB1xKkgirk+KNv4tyeArVK+
         G0Aw==
X-Gm-Message-State: APjAAAXwW1h8J9eNjrsfq1Ysm+Wmydzfwcdic7Lj5NUtPrlllG7IUkff
        kMK5TQXmZkwEFtHerrefW6fWGgT8APgFYMQxWIto7A==
X-Google-Smtp-Source: APXvYqy9mUtI5PPGciU9JdBXtN+uZK4N0zN7cuSjarKrVdkZREuIQs1m8ssHSkm+3oY9x9IO0S8JUsNE8p8fudmw790=
X-Received: by 2002:a02:a88e:: with SMTP id l14mr2649335jam.105.1565779938039;
 Wed, 14 Aug 2019 03:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com> <20190813110300.83025-5-darekm@google.com>
 <20190813112014.GE13294@shell.armlinux.org.uk>
In-Reply-To: <20190813112014.GE13294@shell.armlinux.org.uk>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 14 Aug 2019 12:52:06 +0200
Message-ID: <CALFZZQGXrQh-RnuMihfpTPxhpVohRFnrkQ0V_fJo00SAM16yTg@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] drm: tda998x: use cec_notifier_conn_(un)register
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello.

On Tue, Aug 13, 2019 at 1:20 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> This also doesn't make sense: tda998x_destroy() is the opposite of
> tda998x_create().  However, tda998x_connector_destroy() is the
> opposite of tda998x_connector_create().
>
> By moving the CEC creation code into tda998x_connector_create(), you
> are creating the possibility for the following sequence to mess up
> CEC and leak:
>
>         tda998x_create()
>         tda998x_connector_create()
>         tda998x_connector_destroy()
>         tda998x_connector_create()
>         tda998x_connector_destroy()
>         tda998x_destroy()
>
> Anything you create in tda998x_connector_create() must be cleaned up
> by tda998x_connector_destroy().
>
Thank you.

I've just sent out another revision of the patch, where registration
and deregistration is symmetric. Please take a look.

Best regards.

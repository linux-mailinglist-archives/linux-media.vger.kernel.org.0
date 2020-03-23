Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D2C18EDBC
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 02:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgCWBwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 21:52:22 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44462 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgCWBwW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 21:52:22 -0400
Received: by mail-qt1-f194.google.com with SMTP id x16so1300301qts.11
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2020 18:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frX3aSnCvwMZYRYwhP/kfk1qsbj5tle094zp7qlON38=;
        b=NQ85FxbA9U5l5Ssf8mI7RFw4jUu8WtueIFxNaFqnl/woz9cGtlOFoQe60Sa92vagm3
         Fcgyirf30WxvE+i6AflMUDjZiq84Wx2wfHWvJIqr3YeVcSaKZPgf/QFr5acS1Kp4kl/d
         6O5I3he6Sa1Zgs8+8qvkl1YaxF92rv9RSW0G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frX3aSnCvwMZYRYwhP/kfk1qsbj5tle094zp7qlON38=;
        b=ugrS0CW7zD6hV7DVQrQB0vxrPNaKhX02NdmyJmkLHVpQlqvVuM8UwkA31RcL9IllIm
         2gICvoamN2vi78hytlQ5kfuLtx+hOj/eMjMIlmv2J+ojO9x3qCf/0OLVP2sYzm6rzOdS
         JlwocZHEwYKWpG/upHkRZeqoIc6vZ+CCfPpQAZzEm0K/2eKCpH6XUv/RHuTJ4TyYohJJ
         nD/2+CCP5WfehZoggE8L+8IfVG226FpNl+NqLdWNXWtJnZjAGQxY3COHvhx/sY/VBebB
         mnKn9fMnjqn3s3eZVc5miWxWITl7zdxdUrmXLFEoT6KuWAoJKrnMZJBT5YGwlmKS77nr
         4o8w==
X-Gm-Message-State: ANhLgQ1QyZfBrUd76EbkVkqE8PSKFQQfTQT/qH5eKc5WeXMBT+BphsD6
        xN+DG9yrRWPSl5PVsTiylfdf5wco30Js1kEjHGoCNg==
X-Google-Smtp-Source: ADFU+vsK11eSwW9pQKP54E3Rv6+fws/ZejMZbRqwR/vwnn0FZOuF6lMpAbLSnVfh4EDcsqNG0GwBaJt4aVnWYqZEXlw=
X-Received: by 2002:ac8:7769:: with SMTP id h9mr294273qtu.234.1584928341110;
 Sun, 22 Mar 2020 18:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200319021823.57219-1-stevensd@chromium.org> <20200320064143.4b2kyskr5clxsczs@sirius.home.kraxel.org>
In-Reply-To: <20200320064143.4b2kyskr5clxsczs@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Mon, 23 Mar 2020 10:52:09 +0900
Message-ID: <CAD=HUj4j7gEkHjQPt3aMy_X_m7pZ8CboDTjZtsO1RcfgN0JT5A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Cross-device resource sharing
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     virtio-comment@lists.oasis-open.org,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for taking a look at this. I've opened a github issue.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/76

Thanks,
David

On Fri, Mar 20, 2020 at 3:41 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Mar 19, 2020 at 11:18:21AM +0900, David Stevens wrote:
> > Hi all,
> >
> > This is the next iteration of patches for adding support for sharing
> > resources between different virtio devices. The corresponding Linux
> > implementation is [1].
> >
> > In addition to these patches, the most recent virtio-video patchset
> > includes a patch for importing objects into that device [2].
>
> Looks good to me.
>
> So, open a github issue to kick the TC vote process and get this merged?
> (see virtio-spec/.github/PULL_REQUEST_TEMPLATE.md).
>
> cheers,
>   Gerd
>

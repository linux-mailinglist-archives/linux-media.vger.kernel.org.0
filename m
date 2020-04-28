Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826CE1BB3C8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 04:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgD1CPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 22:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726262AbgD1CPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 22:15:42 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3E0C03C1A8
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 19:15:42 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id v18so9667410qvx.9
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 19:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qjpfbRytZyeo0NEeT7L64ywSvRr9/JiXyn8JtkVE5g=;
        b=U4Peu2w3y+2zYOTOoHw3XWC+B1oefKr0deto2utH575i/QwhRJLZ4YHWI6JRy2LBVA
         Ws6cyeuIcFw46pmzdkFfrvM8ErCQVa8TcFrp54foK4AqdagD1YGfZzp2bQ7GbXtG+05e
         CKUca7uEm2uKXsl+UxDfa3/hkbYPWPLd6dVb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qjpfbRytZyeo0NEeT7L64ywSvRr9/JiXyn8JtkVE5g=;
        b=UuGRBWK62VZEzf5kWiAMfxTOOC1oSI4/suqOWyuYvC9mpRJyte6jOqDa7iLaomLJz1
         HyjxpClnrXrEWVsmHZmEl44nB9vRMYlOzSADn1Mp8DF8QdmCxSnvchJCufIRFO627gK6
         9VQLnSWSMi/FyPlxWpNNoOV0hfZIEELkXpYrp11zA9q77vkg4mIVZx/+HdqxqZU9s7E2
         CjsQpova8GsV5P2mygMLQRsaEC9niU22Oovu6z6fNlambuMwvbGTwBjeFW/YoMniNltD
         GsKcbuoldo9HyWkztLfpiDxx6CsBInDZVAGYU0rt6eEXn7As65oW+AwySuKV0SXhpMyZ
         oW0Q==
X-Gm-Message-State: AGi0PuZF89drNHPA4dXuVBus58TYqg6I8ejCZjnYPqK8dHQHtuRKEp5I
        SqDg1O/ylemKDYhp5U1Nq/JYno3tn+gO/iQJ6+mrFA==
X-Google-Smtp-Source: APiQypI11PrfSdZV+AHi0vP5wMOtWWuPtxdnUDT7N+gy4iwKkfuUSHYvgLSde6jmWMAR3cyhI5lOBrMJqr8uUs4lYTw=
X-Received: by 2002:ad4:45ae:: with SMTP id y14mr26110317qvu.145.1588040141593;
 Mon, 27 Apr 2020 19:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200319021823.57219-1-stevensd@chromium.org> <20200320064143.4b2kyskr5clxsczs@sirius.home.kraxel.org>
In-Reply-To: <20200320064143.4b2kyskr5clxsczs@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 28 Apr 2020 11:15:30 +0900
Message-ID: <CAD=HUj4xUzNw67R233XM3ruaG2cqxF9nWv0xDgML27-CxwuHoQ@mail.gmail.com>
Subject: [virtio-comment] Request vote for the patch: Cross-device resource sharing
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

Request for a vote.

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

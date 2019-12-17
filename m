Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B607A122C6A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 13:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfLQM7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 07:59:41 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42867 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQM7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 07:59:41 -0500
Received: by mail-qk1-f195.google.com with SMTP id z14so8131433qkg.9
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 04:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bZpGkKAkvfd+jX4DG0vMQ2qfrG6ll9qDalxUKn1b3E=;
        b=YMCJELu631QRNTqwkjAcCOyFtrMLDTS5TMyx6OvxxAkDtKxhgfrna//TtU2raSRNzY
         gwQWOfT1HpZvRZBEsApA0YfgTjyjxYUXxUx9xKZoFDLhlO3noHCZIPQyYpJgt+zfy9qr
         aPs71Gjd0r2qzgILwvNDn4unYX33ibUDXggyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bZpGkKAkvfd+jX4DG0vMQ2qfrG6ll9qDalxUKn1b3E=;
        b=MbJpVbd5YNrWZ3MpBG8ig0nT3IMvL86sZ8WLmP5ntAxmrJWnctPlFKAJazEgMJWEwk
         8hHr32YyxTAZiGB38WLDcRnU2kmKNZsZwo+Zd0TLsbOHXYPg0WW92o/ut0Q2szUuyzy/
         JvwYSuAoyI1tKPFs6AzcKsa303dopbd/4PmF8U0PSbDMmAClufqPPOKAHr/q8+zU/U1A
         4pNr6kV7pi8O2h1nn380Ng0O6LlPSW2IXfH7Dwtq3ITii70g8t9rSpjBcW1nTGSgiBSB
         6aPPJI3rkCnlnKUIRjr6cSWUObpBpI0x4x+rFSVOlnE4FlWURs7OG5y3zqPDb94MECMQ
         67Iw==
X-Gm-Message-State: APjAAAV1rGDmPxZCGtqaO8NdVpBYfnq2MMWOwex2fdut35xw5Y3jOeR7
        +SUXDL7Sm6ugOa9h6uZx5kpcfPcpIXytX/WKmcJ9UQ==
X-Google-Smtp-Source: APXvYqyb1xxZ9FokZNGah/UIpAaFRfxJfgV4qwKVLTBXmZOACLUgrXPPiNzDxSLuRgoM0J8lMuMLN3unMTrUaERb+JU=
X-Received: by 2002:a05:620a:910:: with SMTP id v16mr4862526qkv.194.1576587580491;
 Tue, 17 Dec 2019 04:59:40 -0800 (PST)
MIME-Version: 1.0
References: <d65bec5074eda5f389668e28922c1609@hostfission.com>
 <CAAFQd5AWqYaNWfYQ2hepjg7OD8y8ehHn0guusAR8JYefc+BNaw@mail.gmail.com>
 <CAEUnVG77y2DrV5kLTHDy1xio+yzMGv9j=M0c4388vH_LUaiXLg@mail.gmail.com>
 <CAD=HUj40Jb2cy8EP=24coO-CPUvq6ib+01bvXHn1G9GD8KuenA@mail.gmail.com>
 <20191211092625.jzqx2ukphhggwavo@sirius.home.kraxel.org> <CAD=HUj7d3SWqCH=57ymy-BVd6xdJWc=WSqHAFyQXt-3MjchEAA@mail.gmail.com>
 <20191212094121.by7w7fywlzdfoktn@sirius.home.kraxel.org> <CAD=HUj6YYupjdxxz2mgMmE2DcKhXP-qdhRORvUNTmzcORRrLzg@mail.gmail.com>
 <20191212133048.4nbmuwhbq5z2ai6o@sirius.home.kraxel.org> <CAD=HUj623MyeZ7VmrYTfig9oiyNhipidpvhuuurs3VgGBgjZpQ@mail.gmail.com>
 <20191216134728.czulyb6yvrkokrqv@sirius.home.kraxel.org>
In-Reply-To: <20191216134728.czulyb6yvrkokrqv@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 17 Dec 2019 21:59:29 +0900
Message-ID: <CAD=HUj4us6_cEv40EVRLd5K5cGW7GsN10EFWifmog-pq9_RC8Q@mail.gmail.com>
Subject: Re: [virtio-dev] Re: guest / host buffer sharing ...
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dylan Reid <dgreid@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Geoffrey McRae <geoff@hostfission.com>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > > Of course only virtio drivers would try step (2), other drivers (when
> > > sharing buffers between intel gvt device and virtio-gpu for example)
> > > would go straight to (3).
> >
> > For virtio-gpu as it is today, it's not clear to me that they're
> > equivalent. As I read it, the virtio-gpu spec makes a distinction
> > between the guest memory and the host resource. If virtio-gpu is
> > communicating with non-virtio devices, then obviously you'd just be
> > working with guest memory. But if it's communicating with another
> > virtio device, then there are potentially distinct guest and host
> > buffers that could be used. The spec shouldn't leave any room for
> > ambiguity as to how this distinction is handled.
>
> Yep.  It should be the host side buffer.

I agree that it should be the host side buffer. I just want to make
sure that the meaning of 'import' is clear, and to establish the fact
that importing a buffer by uuid is not necessarily the same thing as
creating a new buffer in a different device from the same sglist (for
example, sharing a guest sglist might require more flushes).

-David

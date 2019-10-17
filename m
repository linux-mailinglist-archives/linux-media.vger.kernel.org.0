Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D9ADA702
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 10:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438643AbfJQIL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 04:11:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33120 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408175AbfJQIL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 04:11:56 -0400
Received: by mail-ed1-f67.google.com with SMTP id c4so1032049edl.0
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hAaDphIXcbmeNKLuFPVaieGBYOFPq6cAzb7Icl+ZA6E=;
        b=ToKN6lVy9PXjXqrSIDYVJvWw0QhzEYW5LDGOeBugTWof/bkE44aUTpE+m70cR96nWi
         kvdDPZ3N6fSyK3kcGDhqIv8xHT1CgMcvCFEZ0KPLga82JeWnw1uOpm5GIkbto+4NKSbE
         D60OfGn9+6gSei4btV0Oc3VY5/7LMhRdnu/yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hAaDphIXcbmeNKLuFPVaieGBYOFPq6cAzb7Icl+ZA6E=;
        b=EfpsI4lnu+3BZG38utY7JwruaqZwbkU2EyIqFir4XCJVGQn0lL9CtmK8NYNamXbvyx
         S3OG75Z0E9MvjjDFQKtBJgxJTJ+rqTMBRtM8q16B887717mPFUA6OdSrmXEsA1QTWIPO
         DvpN8iRr1+X4iEzcQQ3NwXQUwfqKDD3Lht4LwKunRZsZkEuD/OqUCZ2Yyw3YAokQ9Igl
         vF58b4I+u6W9U6oc6TM+5r1zFzOJGqpNno3dbyhSaRp1yPhDZ5/7X5pm62rCRs8hPYt+
         SaYobgD2Ah3SPSQXFvA015AuD49WiU2qZ+x0BVNkNlMyTuo1fkAiD0A74eItl6MFnAbq
         ySxg==
X-Gm-Message-State: APjAAAXp64loHi+PsG8uBJG/+dr+X+tU1QyP4qn9zJZzRc4ZDzbNJVOg
        YnjcBCJFFHLR07uN52tN7jMtWMENtDmHsw==
X-Google-Smtp-Source: APXvYqyURHeA/NHY86r2K/FukTGBbUMsRFAQhgqlKAXnwea811VnfXTfIu/0yfF1ukEqvY9STuO17w==
X-Received: by 2002:a17:907:393:: with SMTP id ss19mr2267201ejb.62.1571299912745;
        Thu, 17 Oct 2019 01:11:52 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id j9sm71581edt.15.2019.10.17.01.11.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 01:11:51 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 7so1528455wme.1
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 01:11:50 -0700 (PDT)
X-Received: by 2002:a1c:2e50:: with SMTP id u77mr1830102wmu.64.1571299910437;
 Thu, 17 Oct 2019 01:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <4037801.MZecyecTDs@os-lin-dmo> <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
 <15135216.K0K410U5qv@os-lin-dmo> <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
 <20191017071952.s3dq2oxdiy3khp5w@sirius.home.kraxel.org>
In-Reply-To: <20191017071952.s3dq2oxdiy3khp5w@sirius.home.kraxel.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 17 Oct 2019 17:11:38 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ByuyTDqwiBeT7U7cVA8omOPGRRxb2tB8=J-u7WYU-urQ@mail.gmail.com>
Message-ID: <CAAFQd5ByuyTDqwiBeT7U7cVA8omOPGRRxb2tB8=J-u7WYU-urQ@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        David Stevens <stevensd@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 17, 2019 at 4:19 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > That said, Chrome OS would use a similar model, except that we don't
> > use ION. We would likely use minigbm backed by virtio-gpu to allocate
> > appropriate secure buffers for us and then import them to the V4L2
> > driver.
>
> What exactly is a "secure buffer"?  I guess a gem object where read
> access is not allowed, only scanout to display?  Who enforces this?
> The hardware?  Or the kernel driver?

In general, it's a buffer which can be accessed only by a specific set
of entities. The set depends on the use case and the level of security
you want to achieve. In Chrome OS we at least want to make such
buffers completely inaccessible for the guest, enforced by the VMM,
for example by not installing corresponding memory into the guest
address space (and not allowing transfers if the virtio-gpu shadow
buffer model is used).

Beyond that, the host memory itself could be further protected by some
hardware mechanisms or another hypervisor running above the host OS,
like in the ARM TrustZone model. That shouldn't matter for a VM guest,
though.

>
> It might make sense for virtio-gpu to know that concept, to allow guests
> ask for secure buffers.
>
> And of course we'll need some way to pass around identifiers for these
> (and maybe other) buffers (from virtio-gpu device via guest drivers to
> virtio-vdec device).  virtio-gpu guest driver could generate a uuid for
> that, attach it to the dma-buf and also notify the host so qemu can
> maintain a uuid -> buffer lookup table.

That could be still a guest physical address. Like on a bare metal
system with TrustZone, there could be physical memory that is not
accessible to the CPU.

Best regards,
Tomasz

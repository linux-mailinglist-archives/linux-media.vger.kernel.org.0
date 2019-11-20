Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 062BB10397E
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 13:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbfKTMFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 07:05:45 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42051 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfKTMFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 07:05:44 -0500
Received: by mail-ed1-f66.google.com with SMTP id m13so20057082edv.9
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EIAxtINR2+zXYlLUtuUhPt0/bKbdnOmWECKoASACwyc=;
        b=SZBSjO0HZtPg1H6inYc7QepIwQk3r1qfPZlM7zmth9EbaNxtNZix9BUYDJEYPbOEVh
         tTIiPAP2moqK1T7oL/xoozNlIiPmne+JM12oAf/tDk1dtDp4tiCVRPJiWvmFZWMVNmOZ
         qY4gCVNg/YWaHQlTIAW/zPdU8URPIpxZrSjqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EIAxtINR2+zXYlLUtuUhPt0/bKbdnOmWECKoASACwyc=;
        b=toZflFmFFW0BifujeciUMZAhj772FjLP7HjNZQpQNnCxOEgKdLyfMfvMGjq7UzY49B
         9RZuydtxGurbIrKMzvx74qg0uoSFZBYLQmXcZhVpkvJg7OjzkNSLj7+hCHUXfPxUzJlE
         TZtwrKIr47Jek4k4LUOzqO8oBKMOfx9XWIsLHdMYt/jSNIAQr45Do/LMsZKZ4TVdC78R
         TLZVMHeiELFdYmpBLskw2YInuHVvn54lh+ly3f2Ie53sNImdxLX4kXme+2RXF5aABfe6
         4OhvkSKJZuorsHsoVpyLNHqfGBatw754lvP6GSWIRS/GybxZPdic4A0VcAaDKAku6uqE
         Z3KA==
X-Gm-Message-State: APjAAAWAMsMj+8IIUchyOApx4AlGM4SfZVV6uX0Cpq9NelVj3ID+bP0r
        ETbLfLGlaSSmukeR+m8i2jO2H5YvKkXdjg==
X-Google-Smtp-Source: APXvYqyzeQrKhIcTfMqyOsZw2KI9OWaKu3QL4PnoyQL7g7If+rHctDLbEmjWQojxNi52NnT8u7aTOQ==
X-Received: by 2002:a17:906:8697:: with SMTP id g23mr5075186ejx.177.1574251542165;
        Wed, 20 Nov 2019 04:05:42 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id v5sm1382341edd.90.2019.11.20.04.05.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 04:05:42 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id l7so27840483wrp.6
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:05:42 -0800 (PST)
X-Received: by 2002:a5d:4946:: with SMTP id r6mr2767405wrs.155.1574251104342;
 Wed, 20 Nov 2019 03:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain> <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org> <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <CAEkmjvU8or7YT7CCBe7aUx-XQ3yJpUrY4CfBOnqk7pUH9d9RGQ@mail.gmail.com>
In-Reply-To: <CAEkmjvU8or7YT7CCBe7aUx-XQ3yJpUrY4CfBOnqk7pUH9d9RGQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 20:58:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ASJ0yEXY-V0j+c8nBQ1Q=k9SUU48AZ_8haLezUb_yN-A@mail.gmail.com>
Message-ID: <CAAFQd5ASJ0yEXY-V0j+c8nBQ1Q=k9SUU48AZ_8haLezUb_yN-A@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To:     Frank Yang <lfy@google.com>
Cc:     Stefan Hajnoczi <stefanha@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>, geoff@hostfission.com,
        virtio-dev@lists.oasis-open.org, Alex Lau <alexlau@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        qemu-devel <qemu-devel@nongnu.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frank,

On Fri, Nov 8, 2019 at 12:10 AM Frank Yang <lfy@google.com> wrote:
>
> So I'm not really sure why people are having issues sharing buffers that =
live on the GPU. Doesn't that show up as some integer ID on the host, and s=
ome $GuestFramework (dmabuf, gralloc) ID on the guest, and it all works out=
 due to maintaining the correspondence in your particular stack of virtual =
devices? For example, if you want to do video decode in hardware on an Andr=
oid guest, there should be a gralloc buffer whose handle contains enough in=
formation to reconstruct the GPU buffer ID on the host, because gralloc is =
how processes communicate gpu buffer ids to each other on Android.

I don't think we really have any issues with that. :)

We just need a standard for:
a) assignment of buffer IDs that the guest can refer to,
b) making all virtual devices understand the IDs from a) when such are
passed to them by the guest.

>
> BTW, if we have a new device just for this, this should also be more flex=
ible than being udmabuf on the host. There are other OSes than Linux. Keep =
in mind, also, that across different drivers even on Linux, e.g., NVIDIA pr=
oprietary, dmabuf might not always be available.
>
> As for host CPU memory that is allocated in various ways, I think Android=
 Emulator has built a very flexible/general solution, esp if we need to sha=
re a host CPU buffer allocated via something thats not completely under our=
 control, such as Vulkan. We reserve a PCI BAR for that and map memory dire=
ctly from the host Vk drier into there, via the address space device. It's
>
> https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-=
master-dev/hw/pci/goldfish_address_space.c
> https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-=
master-dev/android/android-emu/android/emulation/address_space_device.cpp#2=
05

I recall that we already agreed on exposing host memory to the guests
using PCI BARs. There should be work-in-progress patches for
virtio-gpu to use that instead of shadow buffers and transfers.

>
> Number of copies is also completely under the user's control, unlike ivsh=
mem. It also is not tied to any particular device such as gpu or codec. Sin=
ce the memory is owned by the host and directly mapped to the guest PCI wit=
hout any abstraction, it's contiguous, it doesn't carve out guest RAM, does=
n't waste CMA, etc.

That's one of the reasons we use host-based allocations in VMs running
on Chrome OS. That said, I think everyone here agrees that it's a good
optimization that should be specified and implemented.

P.S. The common mailing list netiquette recommends bottom posting and
plain text emails.

Best regards,
Tomasz

>
> On Thu, Nov 7, 2019 at 4:13 AM Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
>>
>> On Wed, Nov 6, 2019 at 1:50 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> > > In the graphics buffer sharing use case, how does the other side
>> > > determine how to interpret this data?
>> >
>> > The idea is to have free form properties (name=3Dvalue, with value bei=
ng
>> > a string) for that kind of metadata.
>> >
>> > > Shouldn't there be a VIRTIO
>> > > device spec for the messaging so compatible implementations can be
>> > > written by others?
>> >
>> > Adding a list of common properties to the spec certainly makes sense,
>> > so everybody uses the same names.  Adding struct-ed properties for
>> > common use cases might be useful too.
>>
>> Why not define VIRTIO devices for wayland and friends?
>>
>> This new device exposes buffer sharing plus properties - effectively a
>> new device model nested inside VIRTIO.  The VIRTIO device model has
>> the necessary primitives to solve the buffer sharing problem so I'm
>> struggling to see the purpose of this new device.
>>
>> Custom/niche applications that do not wish to standardize their device
>> type can maintain out-of-tree VIRTIO devices.  Both kernel and
>> userspace drivers can be written for the device and there is already
>> VIRTIO driver code that can be reused.  They have access to the full
>> VIRTIO device model, including feature negotiation and configuration
>> space.
>>
>> Stefan
>>

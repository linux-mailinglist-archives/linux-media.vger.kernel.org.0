Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17B61045EF
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 22:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKTVlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 16:41:37 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:45746 "EHLO
        mail1.hostfission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfKTVlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 16:41:36 -0500
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
        by mail1.hostfission.com (Postfix) with ESMTP id 57CB048935;
        Thu, 21 Nov 2019 08:41:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
        s=mail; t=1574286093;
        bh=vdmNDvFJG+uN3BOYkIlMzOzKYWZSVq6JXRAOaJP6Xes=;
        h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
        b=npoq6EsJ//w3LYqDsb9NPnhk3eUQ/1GZzjrsNNyH1wG4E2ZQEGRAXMhSgCxj1+74G
         xf8QIOaq8XDooRyTPZg8DStS6jcAiKYQKsBqULG9osJpzk7EoVWc3ddEFJ2wajEz6z
         IPlvcMoTWiBUmEtoZoYDLV7t3l4hvY8I/g4yJwWY=
Received: by www1.hostfission.com (Postfix, from userid 1000)
        id 4A90E81B14; Thu, 21 Nov 2019 08:41:33 +1100 (AEDT)
To:     Tomasz Figa <tfiga@chromium.org>
Subject: Re: guest / host buffer sharing ...
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Nov 2019 08:41:33 +1100
From:   Geoffrey McRae <geoff@hostfission.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        David Stevens <stevensd@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel <qemu-devel@nongnu.org>
In-Reply-To: <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <CAD=HUj7EsxrkSubmY6HE4aYJOykVKtmGXjMjeGqnoJw1KZUc5Q@mail.gmail.com>
 <20191106124101.fsfxibdkypo4rswv@sirius.home.kraxel.org>
 <72712fe048af1489368f7416faa92c45@hostfission.com>
 <CAAFQd5Cpb=3HRL3NbgxP+S259nkNEuA=u75ew1JQTzvVUU5NeQ@mail.gmail.com>
Message-ID: <d65bec5074eda5f389668e28922c1609@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.2.3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2019-11-20 23:13, Tomasz Figa wrote:
> Hi Geoffrey,
> 
> On Thu, Nov 7, 2019 at 7:28 AM Geoffrey McRae <geoff@hostfission.com> 
> wrote:
>> 
>> 
>> 
>> On 2019-11-06 23:41, Gerd Hoffmann wrote:
>> > On Wed, Nov 06, 2019 at 05:36:22PM +0900, David Stevens wrote:
>> >> > (1) The virtio device
>> >> > =====================
>> >> >
>> >> > Has a single virtio queue, so the guest can send commands to register
>> >> > and unregister buffers.  Buffers are allocated in guest ram.  Each buffer
>> >> > has a list of memory ranges for the data. Each buffer also has some
>> >>
>> >> Allocating from guest ram would work most of the time, but I think
>> >> it's insufficient for many use cases. It doesn't really support things
>> >> such as contiguous allocations, allocations from carveouts or <4GB,
>> >> protected buffers, etc.
>> >
>> > If there are additional constrains (due to gpu hardware I guess)
>> > I think it is better to leave the buffer allocation to virtio-gpu.
>> 
>> The entire point of this for our purposes is due to the fact that we 
>> can
>> not allocate the buffer, it's either provided by the GPU driver or
>> DirectX. If virtio-gpu were to allocate the buffer we might as well
>> forget
>> all this and continue using the ivshmem device.
> 
> I don't understand why virtio-gpu couldn't allocate those buffers.
> Allocation doesn't necessarily mean creating new memory. Since the
> virtio-gpu device on the host talks to the GPU driver (or DirectX?),
> why couldn't it return one of the buffers provided by those if
> BIND_SCANOUT is requested?
> 

Because in our application we are a user-mode application in windows
that is provided with buffers that were allocated by the video stack in
windows. We are not using a virtual GPU but a physical GPU via vfio
passthrough and as such we are limited in what we can do. Unless I have
completely missed what virtio-gpu does, from what I understand it's
attempting to be a virtual GPU in its own right, which is not at all
suitable for our requirements.

This discussion seems to have moved away completely from the original
simple feature we need, which is to share a random block of guest
allocated ram with the host. While it would be nice if it's contiguous
ram, it's not an issue if it's not, and with udmabuf (now I understand
it) it can be made to appear contigous if it is so desired anyway.

vhost-user could be used for this if it is fixed to allow dynamic
remapping, all the other bells and whistles that are virtio-gpu are
useless to us.

>> 
>> Our use case is niche, and the state of things may change if vendors
>> like
>> AMD follow through with their promises and give us SR-IOV on consumer
>> GPUs, but even then we would still need their support to achieve the
>> same
>> results as the same issue would still be present.
>> 
>> Also don't forget that QEMU already has a non virtio generic device
>> (IVSHMEM). The only difference is, this device doesn't allow us to
>> attain
>> zero-copy transfers.
>> 
>> Currently IVSHMEM is used by two projects that I am aware of, Looking
>> Glass and SCREAM. While Looking Glass is solving a problem that is out
>> of
>> scope for QEMU, SCREAM is working around the audio problems in QEMU 
>> that
>> have been present for years now.
>> 
>> While I don't agree with SCREAM being used this way (we really need a
>> virtio-sound device, and/or intel-hda needs to be fixed), it again is 
>> an
>> example of working around bugs/faults/limitations in QEMU by those of 
>> us
>> that are unable to fix them ourselves and seem to have low priority to
>> the
>> QEMU project.
>> 
>> What we are trying to attain is freedom from dual boot Linux/Windows
>> systems, not migrate-able enterprise VPS configurations. The Looking
>> Glass project has brought attention to several other bugs/problems in
>> QEMU, some of which were fixed as a direct result of this project 
>> (i8042
>> race, AMD NPT).
>> 
>> Unless there is another solution to getting the guest GPUs 
>> frame-buffer
>> back to the host, a device like this will always be required. Since 
>> the
>> landscape could change at any moment, this device should not be a LG
>> specific device, but rather a generic device to allow for other
>> workarounds like LG to be developed in the future should they be
>> required.
>> 
>> Is it optimal? no
>> Is there a better solution? not that I am aware of
>> 
>> >
>> > virtio-gpu can't do that right now, but we have to improve virtio-gpu
>> > memory management for vulkan support anyway.
>> >
>> >> > properties to carry metadata, some fixed (id, size, application), but
>> >>
>> >> What exactly do you mean by application?
>> >
>> > Basically some way to group buffers.  A wayland proxy for example would
>> > add a "application=wayland-proxy" tag to the buffers it creates in the
>> > guest, and the host side part of the proxy could ask qemu (or another
>> > vmm) to notify about all buffers with that tag.  So in case multiple
>> > applications are using the device in parallel they don't interfere with
>> > each other.
>> >
>> >> > also allow free form (name = value, framebuffers would have
>> >> > width/height/stride/format for example).
>> >>
>> >> Is this approach expected to handle allocating buffers with
>> >> hardware-specific constraints such as stride/height alignment or
>> >> tiling? Or would there need to be some alternative channel for
>> >> determining those values and then calculating the appropriate buffer
>> >> size?
>> >
>> > No parameter negotiation.
>> >
>> > cheers,
>> >   Gerd

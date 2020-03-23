Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E7C18F5B9
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 14:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728385AbgCWN2Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 23 Mar 2020 09:28:16 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:54771 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgCWN2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 09:28:16 -0400
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
        by plasma.jpberlin.de (Postfix) with ESMTP id 4FE1FBA32B;
        Mon, 23 Mar 2020 14:28:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id WJGZGc0gbrGQ; Mon, 23 Mar 2020 14:28:09 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 793D8BAE9C;
        Mon, 23 Mar 2020 14:28:09 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS02.open-synergy.com
 (10.25.10.18) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 14:28:08 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>
CC:     Gerd Hoffmann <kraxel@redhat.com>,
        <virtio-dev@lists.oasis-open.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Subject: Re: [PATCH v3 1/2] virtio-video: Add virtio video device specification
Date:   Mon, 23 Mar 2020 14:28:08 +0100
Message-ID: <8121654.T7Z3S40VBb@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <CAD90VcaYi2KawNOewRaL1QihUjgja6nLyzU+0R7nsHPN3voXDA@mail.gmail.com>
References: <20200206102058.247258-1-keiichiw@chromium.org> <CAPBb6MVPjgLkbVjOY6O3srywNm8Zb1pMR2pGM1NinByhgFaZ_A@mail.gmail.com> <CAD90VcaYi2KawNOewRaL1QihUjgja6nLyzU+0R7nsHPN3voXDA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Keiichi,

On Montag, 23. März 2020 13:07:54 CET Keiichi Watanabe wrote:
> Hi everyone,
> 
> I have implemented a virtio-video device following my v3 spec in
> crosvm, which worked well together with Dmitry's driver [1]. I've
> started preparing v4 proposal to address problems found while
> implementing the driver and the devices.

Great news!

> 
> Regarding v3 protocol, I'm thinking about how we can differentiate
> 'parameters' and 'controls' in the virtio-video spec?
> In the previous discussion, we decided to have a profile, level and
> bitrate as controls because we want to query supported values for each
> field.
> But, I don't think it's a good criteria because it'd be possible to
> query other values in params.

Could you elaborate on this? Do you now how the design could look like or it 
is just an idea? AFAIR during the discussion of OpenSynergy's original v1 spec 
your point was to separate something that we call 'controls' now to reduce the 
command data size and make command handling less error prone.

On one hand if don't really see any difference in params vs controls it would 
for sure make sense to remove one of the two. On the other hand I'd of course 
like to avoid moving back in forth, especially when it comes to such a major 
driver rework.

> 
> So, I'm thinking about what should be the difference between params
> and controls. If no difference, we should deprecate
> virtio_video_params and have every field there as a control value
> instead.

I deem we should then deprecate controls instead. Params seem to be more 
abstract. Width and height don't sound like a control for me.

> If we add a new command to get and set multiple controls at once, this
> change won't cause overhead.
> 

How would we do this? Provide a flexible array member where each entry has a 
type field first?

What can also make sense is to potentially join set and get calls (probably 
provide 'get' stuff automatically within a response to 'set'). Anyway set and 
get are currently used in conjunction all the time.

Best regards,
Dmitry.

> What do you think? Is there anything I missed?
> If it sounds fine, I'll remove virtio_video_params from the v4 spec
> proposal.
> 
> Best regards,
> Keiichi
> 
> [1]: https://patchwork.linuxtv.org/patch/61717/



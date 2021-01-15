Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CC52F8191
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 18:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbhAORGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 12:06:02 -0500
Received: from mx1.opensynergy.com ([217.66.60.4]:25933 "EHLO
        mx1.opensynergy.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbhAORGB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 12:06:01 -0500
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 Jan 2021 12:06:00 EST
Received: from SR-MAILGATE-02.opensynergy.com (localhost.localdomain [127.0.0.1])
        by mx1.opensynergy.com (Proxmox) with ESMTP id CC044A1374;
        Fri, 15 Jan 2021 17:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opensynergy.com;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:from:from:in-reply-to:message-id:mime-version:references
        :reply-to:subject:subject:to:to; s=srmailgate02; bh=e72g7Lb0jr1i
        a5HP4Dynq30r3UBdiBylZ0Y9FLP1CNs=; b=2kprhc4ym2KOCQsqLkXpyTlrGjuv
        4nhxGAxPSxJZJCLkCdFjz0MMl4KZnndxDym8E1OM2/hPlfd8cp6uqWNjh3f0yz7b
        6MljgQ8AmJ8Vf8JyJ1M+aFuf3/F2n0xexQhxLUgiCclOmeOXDa+3siAxOuiZNfNz
        YfPApokXE6mJ5EL+IJJZrsicqfq3JOZAIRULf03iX1AL5nksdT2HiL6CpzZaHKmz
        nN6+76GD3BAy36dVqsmoB1wqSdD/x1txPNOGy+UFWZtapR6zKfP8EGH3PEAApFqT
        XTo2PIYOHiuiilcgY+6na9lz0W97gGB+zTecPStV/07nN7SMzyf8KtBkJg==
Subject: Re: [virtio-dev] [PATCH RFC v4 0/1] Virtio Video Device Specification
To:     Keiichi Watanabe <keiichiw@chromium.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Gerd Hoffmann <kraxel@redhat.com>,
        =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, <uril@redhat.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        <virtio-dev@lists.oasis-open.org>,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Mike Holmes <mike.holmes@linaro.org>, <dmitry.sepp@outlook.com>
References: <20200623111325.237158-1-keiichiw@chromium.org>
 <87czy7l6uu.fsf@linaro.org>
 <CAD90Vca=VPVM7+Cj-2cK3SWaSR_Ciajt7oOr0OyB-34bL15ewg@mail.gmail.com>
From:   Matti Moell <Matti.Moell@opensynergy.com>
Message-ID: <f3b177a7-1792-25ff-5bef-9e6b7fb4bde3@opensynergy.com>
Date:   Fri, 15 Jan 2021 17:55:50 +0100
MIME-Version: 1.0
In-Reply-To: <CAD90Vca=VPVM7+Cj-2cK3SWaSR_Ciajt7oOr0OyB-34bL15ewg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-01.open-synergy.com (10.26.10.21) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 15.01.21 15:25, Keiichi Watanabe wrote:
> I think the driver implementation is necessary for the spec to be
> merged, but it's not yet clear when we can spend time implementing
> drivers. It's likely to be after April or so.
> 
> IIRC, OpenSynergy folks, who implemented the v3 driver, also had some
> plan to implement the driver with the v5 spec.
> Matti, do you have any update on it? I'd really appreciate it if we
> could keep working for upstream together.

Hey Keiichi and Alex!

Yeah, I think for us it'll also be in the March/April timeline before we
can start looking at it again, there's quite a few loose ends when going
from v3 to v5 so it'll probably take a while to get it in shape and make
sure that all the comments from the drivers v2 are properly addressed.

I'm not 100% sure how to proceed but perhaps it makes sense to jointly
iterate on the driver sources together once the v5 is mostly agreed. Any
suggestions welcome.

Cheers,

		Matti


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9445DDA63E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408072AbfJQHTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42056 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408044AbfJQHTy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:19:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D5F7B8553A;
        Thu, 17 Oct 2019 07:19:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com [10.36.116.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1BC10013A1;
        Thu, 17 Oct 2019 07:19:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 9251D11AAA; Thu, 17 Oct 2019 09:19:52 +0200 (CEST)
Date:   Thu, 17 Oct 2019 09:19:52 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        stevensd@chromium.org, virtio-dev@lists.oasis-open.org,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
Message-ID: <20191017071952.s3dq2oxdiy3khp5w@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <4037801.MZecyecTDs@os-lin-dmo>
 <CAAFQd5CfNK1oisDaOWaW+9NTQOLn1EHPrPzvxMPcSxLkBgv3Ww@mail.gmail.com>
 <15135216.K0K410U5qv@os-lin-dmo>
 <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DuChujakwmhtQ8v2CSLFqVYjLz9eGHuqrQnJ7apft+3Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 17 Oct 2019 07:19:54 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> That said, Chrome OS would use a similar model, except that we don't
> use ION. We would likely use minigbm backed by virtio-gpu to allocate
> appropriate secure buffers for us and then import them to the V4L2
> driver.

What exactly is a "secure buffer"?  I guess a gem object where read
access is not allowed, only scanout to display?  Who enforces this?
The hardware?  Or the kernel driver?

It might make sense for virtio-gpu to know that concept, to allow guests
ask for secure buffers.

And of course we'll need some way to pass around identifiers for these
(and maybe other) buffers (from virtio-gpu device via guest drivers to
virtio-vdec device).  virtio-gpu guest driver could generate a uuid for
that, attach it to the dma-buf and also notify the host so qemu can
maintain a uuid -> buffer lookup table.

cheers,
  Gerd


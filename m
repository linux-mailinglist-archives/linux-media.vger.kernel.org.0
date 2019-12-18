Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCC5123FC8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 07:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfLRGoA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 01:44:00 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57407 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725797AbfLRGoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 01:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576651438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MWWPVk1Mn5UqEuYqBkdrxKiG5uNiUL897VhoZETgHCM=;
        b=IWRxwLX46zrH5yVrizc3ZrEsRfewBtTslJovEMQsa9G7zwCRZX0DvAyMZJBykfABi+moun
        g4gkFBR8ANm8P7U+sXxsH4C/om0sgKXNocEqB1AqmVbunEBHkciRcaNPIgUYd71euOGCVD
        AkLVLgQY2a37KKWk3M19uaCR3j10lzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-3E3GPwp_O8-pAs9I6aKUVg-1; Wed, 18 Dec 2019 01:43:15 -0500
X-MC-Unique: 3E3GPwp_O8-pAs9I6aKUVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B1E610054E3;
        Wed, 18 Dec 2019 06:43:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com [10.36.117.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 512D226DC3;
        Wed, 18 Dec 2019 06:43:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 82DB931E2B; Wed, 18 Dec 2019 07:43:10 +0100 (CET)
Date:   Wed, 18 Dec 2019 07:43:10 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [RFC RESEND] virtio-video: Add virtio video device
 specification
Message-ID: <20191218064310.kf5gl4zxdfvihm5d@sirius.home.kraxel.org>
References: <20191105191919.167345-1-dmitry.sepp@opensynergy.com>
 <20191217133945.oxnassyjr6hwtjbf@sirius.home.kraxel.org>
 <CAD90VcaXDXgmJ1-aDMu-o_zFCaJ4+rxN0FxHh7x6Q8MTPAr-jw@mail.gmail.com>
 <15520793.X85Ks0aH1j@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15520793.X85Ks0aH1j@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 17, 2019 at 05:13:59PM +0100, Dmitry Sepp wrote:
> Hi,
> 
> On Dienstag, 17. Dezember 2019 15:09:16 CET Keiichi Watanabe wrote:
> > Hi,
> > 
> > Thanks Tomasz and Gerd for the suggestions and information.
> > 
> > On Tue, Dec 17, 2019 at 10:39 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >   Hi,
> > >   
> > > > On the host side, the encode and decode APIs are different as well, so
> > > > having separate implementation decoder and encoder, possibly just
> > > > sharing some helper code, would make much more sense.
> > > 
> > > When going down that route I'd suggest to use two device ids (even when
> > > specifying both variants in one spec section and one header file due to
> > > the overlaps) instead of feature flags.
> > 
> > Sounds good. It makes sense to use different device IDs for different
> > devices.
> Does this mean one driver handles both? Or we have two separate drivers?

That is the driver writers choice.  You can have a single kernel module
registering as driver for both IDs.  Or you can have two kernel modules,
each registering for one of the IDs, possibly with a third library
module with helper code for common bits like buffer management.

cheers,
  Gerd


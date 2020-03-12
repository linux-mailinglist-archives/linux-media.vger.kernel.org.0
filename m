Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F44B182F93
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 12:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgCLLsz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 12 Mar 2020 07:48:55 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:59465 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLLsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 07:48:55 -0400
Received: from gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
        by plasma.jpberlin.de (Postfix) with ESMTP id D0FE9B9A08;
        Thu, 12 Mar 2020 12:48:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([91.198.250.140])
        by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
        with ESMTP id 8s9p-ZFrkGl4; Thu, 12 Mar 2020 12:48:50 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 31E39B786B;
        Thu, 12 Mar 2020 12:48:50 +0100 (CET)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 12 Mar
 2020 12:48:49 +0100
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     <linux-media@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
CC:     <virtio-dev@lists.oasis-open.org>, <acourbot@chromium.org>,
        <alexlau@chromium.org>, <daniel@ffwll.ch>, <dgreid@chromium.org>,
        <dstaessens@chromium.org>, <egranata@google.com>,
        <fziglio@redhat.com>, <keiichiw@chromium.org>, <kraxel@redhat.com>,
        <marcheu@chromium.org>, <posciak@chromium.org>,
        <spice-devel@lists.freedesktop.org>, <stevensd@chromium.org>,
        <tfiga@chromium.org>, <uril@redhat.com>,
        <samiullah.khawaja@opensynergy.com>, <kiran.pawar@opensynergy.com>,
        Nikolay Martyanov <Nikolay.Martyanov@opensynergy.com>
Subject: Re: [PATCH v2 1/1] video_video: Add the Virtio Video V4L2 driver
Date:   Thu, 12 Mar 2020 12:48:49 +0100
Message-ID: <12620787.dW097sEU6C@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <6f8c37b1-8dc4-e3bb-01ed-4ebedaf90915@xs4all.nl>
References: <20200218202753.652093-1-dmitry.sepp@opensynergy.com> <20719772.EfDdHjke4D@os-lin-dmo> <6f8c37b1-8dc4-e3bb-01ed-4ebedaf90915@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Originating-IP: [10.25.255.1]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

One more thing:

> GFP_DMA? That's unusual. I'd expect GFP_DMA32. All V4L2 drivers use that.

GFP_DMA32 had no effect for me on arm64. Probably I need to recheck.

Best regards,
Dmitry. 

On Donnerstag, 12. März 2020 11:18:26 CET Hans Verkuil wrote:
> On 3/12/20 11:15 AM, Dmitry Sepp wrote:
> > Hi Hans,
> > 
> > Thank you for your great detailed review!
> > 
> > I won't provide inline answers as your comments totally make sense. There
> > is> 
> > only one thing I want to mention:
> >>> +	struct video_plane_format plane_format[VIRTIO_VIDEO_MAX_PLANES];
> >> 
> >> Why is this virtio specific? Any reason for not using VIDEO_MAX_PLANES?
> > 
> > I'd say this is because VIDEO_MAX_PLANES does not exist outside of the
> > Linux OS, so for whatever other system we need a virtio specific
> > definition.
> OK, good reason :-)
> 
> It's probably a good thing to add a comment where VIRTIO_VIDEO_MAX_PLANES is
> defined that explains this.
> 
> Regards,
> 
> 	Hans



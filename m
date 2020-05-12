Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330511CF40C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 14:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgELMKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 08:10:32 -0400
Received: from plasma4.jpberlin.de ([80.241.57.33]:57325 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELMKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 08:10:31 -0400
Received: from spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117])
        by plasma.jpberlin.de (Postfix) with ESMTP id B5C41AAD56;
        Tue, 12 May 2020 14:10:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id eNaeXbqYB0iV; Tue, 12 May 2020 14:10:21 +0200 (CEST)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "webmail.opensynergy.com", Issuer "GeoTrust EV RSA CA 2018" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 242FCBC243;
        Tue, 12 May 2020 14:10:21 +0200 (CEST)
Received: from os-lin-dmo.localnet (10.25.255.1) by MXS01.open-synergy.com
 (10.25.10.17) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 12 May
 2020 14:10:20 +0200
From:   Dmitry Sepp <dmitry.sepp@opensynergy.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Keiichi Watanabe <keiichiw@chromium.org>,
        Saket Sinha <saket.sinha89@gmail.com>,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        <virtio-dev@lists.oasis-open.org>,
        "Alex Lau" <alexlau@chromium.org>,
        Kiran Pawar <Kiran.Pawar@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>,
        <libcamera-devel@lists.libcamera.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [libcamera-devel] [virtio-dev] Re: Fwd: Qemu Support for Virtio Video V4L2 driver
Date:   Tue, 12 May 2020 14:10:20 +0200
Message-ID: <64045565.OWohDWQxgf@os-lin-dmo>
Organization: OpenSynergy
In-Reply-To: <20200511143136.GC5830@pendragon.ideasonboard.com>
References: <CAK25hWN3kJcW-dcpryFrvZ50t7Y0Z=MZM66-8NMuhwjRpNo2aQ@mail.gmail.com> <CAD90VcYJe7+R256RdOQKxFQciq54+PwbyDRF1cynjOzdQBrq-g@mail.gmail.com> <20200511143136.GC5830@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.25.255.1]
X-Rspamd-Queue-Id: B5C41AAD56
X-Rspamd-Score: 1.14 / 15.00 / 200.00
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Montag, 11. Mai 2020 16:31:36 CEST Laurent Pinchart wrote:
> 
> I don't think this would be the right level of abstraction. The V4L2 API
> is way too low-level when it comes to camera paravirtualization (and may
> not be the only API we'll have in the future). I thus recommend
> virtualizing cameras with a higher-level API, more or less on top of
> libcamera or the Android camera HAL (they both sit at the same level in
> the camera stack). Anything lower than that won't be practical.
> 

I think the the main thing to do first would be to define the logic of such 
virtio-camera device and the set of mandatory features. Host-side API is a bit 
of a side topic. But libcamera fits the best though.

Best regards,
Dmitry.



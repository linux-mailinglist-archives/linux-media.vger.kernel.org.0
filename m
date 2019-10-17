Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06917DA9D9
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 12:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392702AbfJQKWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 06:22:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36460 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726248AbfJQKWk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 06:22:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7A49E308624A;
        Thu, 17 Oct 2019 10:22:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com [10.36.116.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2D56161F21;
        Thu, 17 Oct 2019 10:22:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 629E311AAA; Thu, 17 Oct 2019 12:22:39 +0200 (CEST)
Date:   Thu, 17 Oct 2019 12:22:39 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org,
        Alexandre Courbot <acourbot@chromium.org>,
        alexlau@chromium.org, dgreid@chromium.org,
        =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [virtio-dev] [PATCH] [RFC RESEND] vdec: Add virtio video decode
 device specification
Message-ID: <20191017102239.7ekykhe5ngbsqabz@sirius.home.kraxel.org>
References: <20190919093404.182015-1-keiichiw@chromium.org>
 <20190923085637.bsaevedklweijgya@sirius.home.kraxel.org>
 <CAAFQd5Ba-REZU9=rdm3J6NRqqeAUFdCV7SJ_WdO2BHyKNBN7TQ@mail.gmail.com>
 <20191014121914.lyptm3gdmekvcu6v@sirius.home.kraxel.org>
 <CAAFQd5CaxYoXQ6z4pmdTG3FDN8ccEk3sHMnSkoNwL2==hk6znQ@mail.gmail.com>
 <20191017074416.wrndxdwntynqmpm4@sirius.home.kraxel.org>
 <CAAFQd5Dh-VE2v=uX1bqKywwELxrH1a9wsRAine2=AVe3gQFt4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Dh-VE2v=uX1bqKywwELxrH1a9wsRAine2=AVe3gQFt4w@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 17 Oct 2019 10:22:40 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > I doubt you can handle pci memory bars like regular ram when it comes to
> > dma and iommu support.  There is a reason we have p2pdma in the first
> > place ...
> 
> The thing is that such bars would be actually backed by regular host
> RAM. Do we really need the complexity of real PCI bar handling for
> that?

Well, taking shortcuts because of virtualization-specific assumptions
already caused problems in the past.  See the messy iommu handling we
have in virtio-pci for example.

So I don't feel like going the "we know it's just normal pages, so lets
simplify things" route.

Beside that hostmap isn't important for secure buffers, we wouldn't
allow the guest mapping them anyway ;)

cheers,
  Gerd


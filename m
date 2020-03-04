Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A168178C38
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 09:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgCDIFw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 03:05:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30909 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725271AbgCDIFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Mar 2020 03:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583309151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kEXp+MsDMiIQ48dZsIdgW3c7/qT3rYq7zxn6pOdg4xA=;
        b=Z+9ouQCQ7uUhd6LOZxj37nz54snx51YAFSHnUeF8JFo0RESNiHOgiKl3gQXXD4ZpzqyyrB
        5UQlN0JIsiTBdr0ApmIwvhE4XlNTVDiYoqSf/i4oENm7waeeFeX0vRUgPf8Aoecr6yA+iP
        PON63liHTYiolpXayHC8SlBybsvKtC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-LfdfQ2d3O6mP8LQD7TgVEQ-1; Wed, 04 Mar 2020 03:05:49 -0500
X-MC-Unique: LfdfQ2d3O6mP8LQD7TgVEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6149E801E6C;
        Wed,  4 Mar 2020 08:05:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com [10.36.116.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41D545DA60;
        Wed,  4 Mar 2020 08:05:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 7778C17506; Wed,  4 Mar 2020 09:05:43 +0100 (CET)
Date:   Wed, 4 Mar 2020 09:05:43 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gurchetan Singh <gurchetansingh@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org, virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] [PATCH v2 4/4] drm/virtio: Support virtgpu exported
 resources
Message-ID: <20200304080543.jtf3kcfp6cyegkag@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
 <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
 <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 03, 2020 at 11:42:22AM +0900, David Stevens wrote:
> > cmd_p->hdr.ctx_id =
> >
> > Before this completion of this hypercall, this resource can be
> > considered context local, while afterward it can be considered
> > "exported".
> 
> Maybe I'm misunderstanding render contexts, but exporting a resource
> doesn't seem related to render contexts.

It isn't indeed.  Binding resources to contexts might need dma-buf
imports/exports on the host side, but that is another story and not
related to dma-buf exports inside the guest.

cheers,
  Gerd


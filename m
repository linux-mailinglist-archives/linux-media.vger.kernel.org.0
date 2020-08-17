Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D442464D0
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 12:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgHQKuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 06:50:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26999 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727957AbgHQKuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 06:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597661420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SE4dvYNlVB9CSOQDs5hxirUGYULeutap5ZzZDBWVkqE=;
        b=T6QmfjF/wbnhJQIreC+53ydC2IzRKGELCo0QaC1ZwMQJeZSEeWzP2Urj6JgpQnLogYbJMO
        J6wBW+uMv5dPhvohS5W8b3ImAQTar8+UxEjomgNiX4DkS5HBhvkdNR+Jf5bZ4+cZ72chKU
        fJLotOaGdnxPeMoXU02QRer68SYsD9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-meOXaXeZPg-AMW_PNZAmuA-1; Mon, 17 Aug 2020 06:50:18 -0400
X-MC-Unique: meOXaXeZPg-AMW_PNZAmuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CB11014DEE;
        Mon, 17 Aug 2020 10:50:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com [10.36.112.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CD94A10013D5;
        Mon, 17 Aug 2020 10:50:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id E51B79D5A; Mon, 17 Aug 2020 12:50:08 +0200 (CEST)
Date:   Mon, 17 Aug 2020 12:50:08 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org,
        alex.williamson@redhat.com
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device
 resources
Message-ID: <20200817105008.mi3ukh6kxgi37gjs@sirius.home.kraxel.org>
References: <20200609012518.198908-1-stevensd@chromium.org>
 <20200609055021-mutt-send-email-mst@kernel.org>
 <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 23, 2020 at 10:31:28AM +0900, David Stevens wrote:
> Unless there are any remaining objections to these patches, what are
> the next steps towards getting these merged? Sorry, I'm not familiar
> with the workflow for contributing patches to Linux.

Sorry, just have been busy and not paying as much attention to drm
patches as usual.  Playing catch-up now.  Queued for drm-misc-next,
unless something goes wrong in my testing the patches should land
in linux-next soon and be merged upstream in the next merge window.

take care,
  Gerd


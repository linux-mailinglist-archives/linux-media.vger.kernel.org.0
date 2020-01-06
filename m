Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29F1B130EE4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 09:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgAFIrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 03:47:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29688 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725446AbgAFIrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 03:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578300436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LuwmtFiuk4QC6AlCiv2QuDvl6ZNYkiBQJ/wWpvPHom0=;
        b=SLxAWrN2T5lktIaY+V0PuNTxElms5HK1+m6RXCB0tEs0DYQbKX80zlMG9Biq60JV507FpR
        +nX/tWCaOWI0VOurkj1Kv2SCmOqebAjLvYKWLo7rJuxyrdOgaO/TYHmnPd7SGECzX1WrKq
        ZnQS1Dx+/SelmuNSEveyRsbA8RKMpIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Xg-vGluqNHK1In-eZEA4YA-1; Mon, 06 Jan 2020 03:47:13 -0500
X-MC-Unique: Xg-vGluqNHK1In-eZEA4YA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D070100550E;
        Mon,  6 Jan 2020 08:47:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com [10.36.116.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 876D660F89;
        Mon,  6 Jan 2020 08:47:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 66A356DF9; Mon,  6 Jan 2020 09:47:01 +0100 (CET)
Date:   Mon, 6 Jan 2020 09:47:01 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Dmitry Sepp <dmitry.sepp@opensynergy.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, egranata@google.com, fziglio@redhat.com,
        hverkuil@xs4all.nl, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com
Subject: Re: [PATCH v2 1/1] virtio-video: Add virtio video device
 specification
Message-ID: <20200106084701.3v5eew3bh4nh67sc@sirius.home.kraxel.org>
References: <20191218130214.170703-1-keiichiw@chromium.org>
 <20191218130214.170703-2-keiichiw@chromium.org>
 <2358784.0s52YacUgI@os-lin-dmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2358784.0s52YacUgI@os-lin-dmo>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> How should one deal with multiplanar formats? Do we create one resource per 
> plane? Otherwise we need a way to send mem entries for each plane in one 
> request.

DRM uses arrays of handles and offsets (see struct drm_framebuffer).  A
handle references a gem object (roughly the same as a resource), and the
offset specifies the start of the plane within the gem object.  That
allows both a single gem object with planes stored at different offsets
and one gem object per plane.  virtio-video could do the same, or pick
one of the two approaches and support only that.

cheers,
  Gerd


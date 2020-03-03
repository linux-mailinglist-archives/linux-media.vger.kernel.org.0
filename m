Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA44176AB1
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 03:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgCCCmd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 21:42:33 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35558 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgCCCmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 21:42:33 -0500
Received: by mail-qk1-f196.google.com with SMTP id 145so2015757qkl.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2020 18:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PxaU6jH+BrctxPkuy+TtnDFu4GnDn0I+fDbnzM1efjY=;
        b=lPebr/apS3a3XvJ4XcWg2p+1jVRErhkCzaWWg6wU7yc5QNOeEvIf5BudVhVxW66Euf
         /6ylI3gzJxuJK7fsCbK7mC/7V5Yx8ND0/jBwvSFydsUmqZf6y1sr7BGOQvcFetjCcXwO
         arVONmL2HlRo7X9WIG9l6bIYjr03Nc0Y4hlBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PxaU6jH+BrctxPkuy+TtnDFu4GnDn0I+fDbnzM1efjY=;
        b=UroQILSMZ64qUCFdsHh0L/x98XG/h6kgoMTPbTxlFTW2KfCEBsYZkJg11um22AYgeJ
         ar/URUp2bRpxlVGv+d0520zB1U+3kxDKE/BmmaDoDpT7FBOD7iZ9+9DCYkEuCbelwPrx
         vWEhGXpVZ1ekcDjpG6uc4jJGhpzjaKU8dNy6c/o4ibROjEaPUIELv6DQazainEk51bGl
         JHYClvVAVcoe8CEDjciwnvP9TO30vBLJbAHZ0P2bJVWkmqLtxPnJ8WLtZ5sSrN/8yYrU
         KMMxOQ5A83xw8+EOE4fFp0590RveCCz7i7H4KFEr7E+y/QIoD3kjplZPyQfSdpkQdfSu
         gYWw==
X-Gm-Message-State: ANhLgQ2otcb0r3xxOVvq0b7SdYdFk598t9V4z/2DIDl8tHbNMxAk3j2k
        vPQFllRMohHw/A1VyvC5HETvX8oDBDPKLijRi1c8DA==
X-Google-Smtp-Source: ADFU+vv4vCMIfBV1h9ntADBFoWjuRnbldiM2bxqn1DU2ahDSFshoqIRAbcIuxA4EMjtDxDlwrF99sqmXWP5yAgEJ6LA=
X-Received: by 2002:a37:9c01:: with SMTP id f1mr2223210qke.194.1583203352379;
 Mon, 02 Mar 2020 18:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20200302121524.7543-1-stevensd@chromium.org> <20200302121524.7543-5-stevensd@chromium.org>
 <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
In-Reply-To: <CAAfnVBk46vsP77hx3kUHqVCPG8Eakh7Kgi0kEHZtrHD-0bHzqQ@mail.gmail.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 3 Mar 2020 11:42:22 +0900
Message-ID: <CAD=HUj5-0CE-tm4meQ_Y7KB4Df41v=kBH2GTStYJptTOSp1yVw@mail.gmail.com>
Subject: Re: [virtio-dev] [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
To:     Gurchetan Singh <gurchetansingh@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> cmd_p->hdr.ctx_id =
>
> Before this completion of this hypercall, this resource can be
> considered context local, while afterward it can be considered
> "exported".

Maybe I'm misunderstanding render contexts, but exporting a resource
doesn't seem related to render contexts. The other resource management
operations (e.g. creation, attaching a backing) don't take render
contexts, and exporting a resource seems like the same sort of
operation. It's not clear to me why exporting a resource would affect
what render contexts a resource has been attached to, nor why the
render contexts a resource has been attached to would affect exporting
the resource. Also, from an implementation perspective, I don't see
any struct virtio_gpu_fpriv to get the ctx_id from.

-David

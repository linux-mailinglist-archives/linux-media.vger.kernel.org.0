Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D411F15BA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 11:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgFHJni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 05:43:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58247 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729267AbgFHJng (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 05:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591609415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
        b=in4Xqh0bprheN2mejL2opuVWZslUMYnP4BSpYhfMy4+JwIkqhOGH4GpDoKXhwMr2Mo7q6u
        HBuqojjgHTu0dmIqcerwrxafsn+FAbejl86wKUNa75UrNkT0i0cLuh/fHp0xwA31D3w7UU
        VeGJjFyE2msRwUfW5FXaWtry/N6W2/8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-yiIfSruUO460eKTuy7fIkg-1; Mon, 08 Jun 2020 05:43:32 -0400
X-MC-Unique: yiIfSruUO460eKTuy7fIkg-1
Received: by mail-wm1-f71.google.com with SMTP id l2so3737214wmi.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2020 02:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
        b=FIipPoUdeJAzUtVPp86Kq9qnns6OKLeM5KOTEL7KMwq12jw457E3/dii6tz/KidZP9
         IYeeZF7XBfs1+OEoLb2KJD1LCxnVpUXp4XOUcH2jZdm0Xrby7fiwEMtZhlS0GlUyKW/K
         3zUv/sIRxamI4LupFwVtROXVNzDmJQk057MgQ8gytjZe/4WXkFcwx8zWEBLGsjUeT1jv
         7SaxUqSWxrYWqymfh8KBrOHfX+AttVot4A8IZcsX2CHOsFAWyFlY4Wm4gDUovCaX3FOg
         pXk0ofTMP4UN7t17k9rLzOpkEXRLL0FiSxE1ifL25KZE06xLLTQZ9/U9ryEEtKsz03lV
         0rGQ==
X-Gm-Message-State: AOAM533qOa9eUjW8ri4Y/m06ihZYsgWmjxYHF5wIs5WvMhMaB6b6vmNz
        90Z1tDvrDUqpxzYR9GwSKL2WKKbuN+ATUeozXh3a5pH5MFh4y4EZJfiYo3WJmn1Q95eqYtkwvk9
        ID8oK0+XtagG37d7r1QNQK6g=
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017570wmc.1.1591609411312;
        Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9ub5wP+xupLuBkOQ4No1b88FQ9dkWFcatrNsLpDTfEgifdZsj9YIaaEa0/E6d/CL6f3lWtw==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017554wmc.1.1591609411160;
        Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
        by smtp.gmail.com with ESMTPSA id u9sm18951734wme.16.2020.06.08.02.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 02:43:30 -0700 (PDT)
Date:   Mon, 8 Jun 2020 05:43:27 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608054234-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > +             vgdev->has_resource_assign_uuid = true;
> > > +     }
> >
> >
> > Just a question: this relies on DMA bufs so I assume it is
> > not really assumed to work when DMA API is bypassed, right?
> > Rather than worry what does it mean, how about just
> > disabling  this feature without PLATFORM_DMA for now?
> 
> By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?

Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
future will be renamed to VIRTIO_F_PLATFORM_ACCESS.


> Virtio-gpu
> depends on DRM, which selects that feature. So I think DMA bufs should
> always be available when virtio-gpu is present.
> 
> -David


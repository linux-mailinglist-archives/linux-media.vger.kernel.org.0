Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7B0171164
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 08:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbgB0HYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 02:24:39 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37017 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgB0HYj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 02:24:39 -0500
Received: by mail-lj1-f193.google.com with SMTP id q23so2159231ljm.4
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 23:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1fYhwtQugourf/YHI26V7fjd8Ko33Z1d0MTgj5fBllA=;
        b=WSbKcFqJ4JsgtMOnaqrCgpReGO+t6fT/urco7XNmD5aegv/hWCBT/JQ0uj9QyoXC9h
         yoJbfsBZasuYfjDQ9poaaVlBtFBLNnd1PlRiS83x9XRHzkH8rfK0PVPxEd6ZWA1f7zlh
         Vzvqz29hSWlCg6SjL81UiPpokRvDbCbkyoFSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1fYhwtQugourf/YHI26V7fjd8Ko33Z1d0MTgj5fBllA=;
        b=aW5wjQ/CbfcrJYizvKtuL8xnKotVsTdnQELMa9S49Zj5eFZzMs2lh+2Z8QZvwAv22x
         Pg3JZLKKinP938E2bHHTSxlE/l52Ra2S1xW6JP9sNhHCwHlNh4LNa0NHRRUkkDnytmaS
         UUiPfO3HCmtHMvFSHfHwoJpj4gEMWaj318r5o9pIGDHl4oE7uvuHjDmJiYQcSvN/QJpk
         vi+cX+bY1m4WVAtTBGzdIIDUvkrC3aAvNlrHnQTSIHN+mizUxDpPLYfRVEIB6NosS3QG
         UkuDEzpIETPNFxzxAmbtylwh3q5cAbae5/6yQZHToFTe3CCLqxBsN+jYfl7xr9yHUhzH
         QgoA==
X-Gm-Message-State: ANhLgQ2Z8MTZKVq9NktsxM3gUtnXa4B5EAP/zesZiJGRmUrIQqE9aeEZ
        7B/gLv1QtNV/91VW2IPuHNelFJpFlFWRRF9IK8Ip72weHrA=
X-Google-Smtp-Source: ADFU+vtNCr/250cISpJsBUpbs9vkqScUP52zZPdToAzJT1L+kZY3XIt5c86eam0t5V7qTMZ7noC06DquWvXrtlRtrac=
X-Received: by 2002:a2e:8e6e:: with SMTP id t14mr1910977ljk.149.1582788276864;
 Wed, 26 Feb 2020 23:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-3-keiichiw@chromium.org> <20200225100144.c3rmtmq7kqyskkq7@sirius.home.kraxel.org>
In-Reply-To: <20200225100144.c3rmtmq7kqyskkq7@sirius.home.kraxel.org>
From:   Keiichi Watanabe <keiichiw@chromium.org>
Date:   Thu, 27 Feb 2020 16:24:25 +0900
Message-ID: <CAD90VcaFyd2bFJUYzDF7OMsm+sWFFJuAHAqCk9hFEWnR8p+zVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] virtio-video: Define a feature for exported
 objects from different virtio devices
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     virtio-dev@lists.oasis-open.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dylan Reid <dgreid@chromium.org>,
        David Staessens <dstaessens@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>,
        Enrico Granata <egranata@google.com>,
        Frediano Ziglio <fziglio@redhat.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        spice-devel@lists.freedesktop.org,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>, uril@redhat.com,
        Samiullah Khawaja <samiullah.khawaja@opensynergy.com>,
        Kiran Pawar <kiran.pawar@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, Feb 25, 2020 at 7:01 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +        /*
> > +         * Followed by either
> > +         * - struct virtio_video_mem_entry entries[]
> > +         *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
> > +         * - struct virtio_video_object_entry entries[]
> > +         *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT
>
> Wouldn't that be a single virtio_video_object_entry?
> Or could it be one per plane?

It depends on the value of "planes_layout" in virtio_video_resource_create.
I have documented this restriction as follows:

> +If \field{planes_layout} is VIRTIO_VIDEO_PLANES_LAYOUT_SINGLE_BUFFER,
> +the number of \field{virtio_video_object_entry} MUST be one. If it is
> +VIRTIO_VIDEO_PLANES_LAYOUT_PER_PLANE, the number MUST be equal to
> +\field{num_planes}.

Best regards,
Keiichi


>
> cheers,
>   Gerd
>

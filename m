Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3044016BE29
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 11:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729790AbgBYKB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 05:01:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29707 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729183AbgBYKB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 05:01:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582624915;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=floPe8uFtiBcRJNt3b3yPKjP5sCVEHNZouWGo4bWZp8=;
        b=bcQDQ9DFgy1EDbWr1IicTYJ4kMxXLlsZntr6k6fNDy5+OTriBJ2wMVbSUovodFv1kJF7AB
        SIOne1kj6AZrGHBhHh4avcOON+NiLYqTT+OlgxPYGhw4T4I5jtR5EhM+VwDef4uYQNq8vI
        OQhpotMYUu7GpSAjHrTRkx1o8Wb0bl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-ojrg6253Px6GKeMLJa8bFQ-1; Tue, 25 Feb 2020 05:01:51 -0500
X-MC-Unique: ojrg6253Px6GKeMLJa8bFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA94B1050478;
        Tue, 25 Feb 2020 10:01:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com [10.36.116.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E1C5360C18;
        Tue, 25 Feb 2020 10:01:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id BF82C1744A; Tue, 25 Feb 2020 11:01:44 +0100 (CET)
Date:   Tue, 25 Feb 2020 11:01:44 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Keiichi Watanabe <keiichiw@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        acourbot@chromium.org, alexlau@chromium.org, daniel@ffwll.ch,
        dgreid@chromium.org, dstaessens@chromium.org,
        dmitry.sepp@opensynergy.com, egranata@google.com,
        fziglio@redhat.com, hverkuil@xs4all.nl, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com
Subject: Re: [PATCH v3 2/2] virtio-video: Define a feature for exported
 objects from different virtio devices
Message-ID: <20200225100144.c3rmtmq7kqyskkq7@sirius.home.kraxel.org>
References: <20200206102058.247258-1-keiichiw@chromium.org>
 <20200206102058.247258-3-keiichiw@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206102058.247258-3-keiichiw@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> +        /*
> +         * Followed by either
> +         * - struct virtio_video_mem_entry entries[]
> +         *   for VIRTIO_VIDEO_MEM_TYPE_GUEST_PAGES
> +         * - struct virtio_video_object_entry entries[]
> +         *   for VIRTIO_VIDEO_MEM_TYPE_VIRTIO_OBJECT

Wouldn't that be a single virtio_video_object_entry?
Or could it be one per plane?

cheers,
  Gerd


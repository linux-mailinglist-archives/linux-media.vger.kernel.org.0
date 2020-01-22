Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C97C144D92
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 09:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgAVIYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 03:24:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50783 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725868AbgAVIYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 03:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579681448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9CB3c1RgKQtL6GIuLgiLd8m8lbT5ybTkGXxDqzVPwqI=;
        b=b+1ssyPicT+tn8L2boq+f2aiCEcZcxr9s5vnCJa1R7g87DT1u7YrVIYNDPdy4KKY0YTozW
        RgvBbj5UT9ChOGC8116q/MfidnMrJ1IpR4B4s5KGg1AgpM7OkaQtJyeWtwsdfwz7F0HTgO
        Br9DOA4zDtEEBJHSql5CFTRVcELWZ6Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-qO8yowT7PQC6_Q0HqSGXYQ-1; Wed, 22 Jan 2020 03:24:07 -0500
X-MC-Unique: qO8yowT7PQC6_Q0HqSGXYQ-1
Received: by mail-wm1-f72.google.com with SMTP id q26so1060431wmq.8
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2020 00:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9CB3c1RgKQtL6GIuLgiLd8m8lbT5ybTkGXxDqzVPwqI=;
        b=UnorgxzM5zkeV0KtTp/0AUn06ClsqCPa38JgJlZyVFbkt/WuJlr6ayGZ/S8jwSeUVd
         bQnAQZpPDq5BgVBqjJJz9EFmDyhzYfESFZh+LzvZatxClFLePtZ5vAHbkFCUyTbK3A0Z
         l+lij/1NJvWWpWAgOcajZmWEf6qSX8IIHty1cmfDQ9oqVAOeT0gRqv48LEnbZE9ffyhX
         qiYGSu8eQM3WhhKe/nUgtSLQHwTqPPkRnR3Haa5dIMEonFinae4Szs0aL24oVCdzH9B2
         k+PYi+e9L91b0Vz/u3ykK27ct1TqQrqIOTTfsOyAZuHBHsjTSCF90cxJJStHga4hTJO7
         w+pg==
X-Gm-Message-State: APjAAAUYjVnXIlEDJtj+XQAERp58MJ1Imj9rrRHZadLQnLW1CB4StcBP
        ZGBC3V2FdbyxaAQMe6+SXtYzXZ19lxKrIrnS4/QNWn6zv456RQDaLwF6ToIbDUxD6N2SXTG1UUp
        gcnB+vl4TB3n2aZSIjIrzn/g=
X-Received: by 2002:a7b:c935:: with SMTP id h21mr1559234wml.173.1579681446093;
        Wed, 22 Jan 2020 00:24:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4pGRQw2MOBdhkwrpfKACw+YIDKNWHU3FopMP3GQ2nRE7TttIAWR9UgHuwDTfrOFfiAUcvkw==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr1559210wml.173.1579681445926;
        Wed, 22 Jan 2020 00:24:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
        by smtp.gmail.com with ESMTPSA id e6sm58416087wru.44.2020.01.22.00.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 00:24:05 -0800 (PST)
Date:   Wed, 22 Jan 2020 03:24:02 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [virtio-dev][RFC PATCH v2 0/2] Cross-device resource sharing
Message-ID: <20200122032328-mutt-send-email-mst@kernel.org>
References: <CAD=HUj71Z_eQUj93LZYOAc+Prj9ohym1oJtiLWzCy5=T-cNxCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj71Z_eQUj93LZYOAc+Prj9ohym1oJtiLWzCy5=T-cNxCQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 22, 2020 at 04:16:15PM +0900, David Stevens wrote:
> This RFC comes from the recent discussion on buffer sharing [1],
> specifically about the need to share resources between different
> virtio devices. For a concrete use case, this can be used to share
> virtio-gpu allocated buffers with the recently proposed virtio video
> device [2], without the need to memcpy decoded frames through the
> guest.
> 
> [1] https://markmail.org/thread/jeh5xjjxvylyrbur
> [2] https://markmail.org/thread/yb25fim2dqfuktgf


Wrong list- this belongs on virtio-comment.
dev is for implementation discussions.

> Changes v1 -> v2:
> Rename exported resource to exported object
> Rename the virtio-gpu export command
> 
> David Stevens (2):
>   content: define what an exported object is
>   virtio-gpu: add the ability to export resources
> 
>  content.tex    | 18 ++++++++++++++++++
>  virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> ---------------------------------------------------------------------
> To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org


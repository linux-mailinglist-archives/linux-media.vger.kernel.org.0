Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1951C20A1F2
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 17:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405798AbgFYPat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 11:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405787AbgFYPas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 11:30:48 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88407C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 08:30:48 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so6392943ejb.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 08:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0CFr8jzBzEkamA0nfO1v7fQEbEWs3FBjMcmzi4CDti0=;
        b=WJ8asht9a2bkKvjvqDVdRvxV8wwmqFaKK+ZBX62IL9uEpDarnfWyH8HXt2mgBTuz1V
         2IQjA6TRIvuXb2/XC8KADmNHTJfxRlA3uWmPoi7EBxtS3OUAD2lZ51uMFNVbYyyixdv9
         XdIW9PohcTMAZEV3Rk2AOTRvPMKqmUdQth4c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0CFr8jzBzEkamA0nfO1v7fQEbEWs3FBjMcmzi4CDti0=;
        b=BEIhSriL7eJ5IzbsQ2oRNP2ijK7TIZbsgbXrDpS24sPbmmkVMkUzLc7iQdg5MPgXq3
         JwIXgYntIAqRjyacie8cKxvWXna1e+QT5CX9njNiMPGo28v3YfMuIj1MUKpRid+C6Gu5
         OqtPDicDYdYgCY6gGIPpB5So/EhdHs585XQ28rjw9yIPU0vwvBXNTJgX1PXI6+5Kri9j
         eBv8Y0GqgZwg51knfNmO87tsC1/3kQRyqv+WMa/7+bpTKx93hqH0WWVPoBUDajHScW3e
         SUv3bSLAWyhrrBxE4Mf9FbX5DQjt7pbPzDQ/+yrlidPkmakSp+oeiW8g6OT0Z8bFvD4V
         RI5Q==
X-Gm-Message-State: AOAM530fWtVdgpRHLkZy4B63pvCecuOIn8t7Y2U8Y5IgfVlEnp6F5d2A
        o9pyQwE5PNRFPng5QJayZEeuYRdSFDc=
X-Google-Smtp-Source: ABdhPJx/42P36fJ1CH48l0hbf8ZCTxVeNirj9Oo33Z1N8YyVe5TidrDJmvl6fK4XLmd2R+D36Vkkww==
X-Received: by 2002:a17:906:4b54:: with SMTP id j20mr26246457ejv.259.1593099046900;
        Thu, 25 Jun 2020 08:30:46 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id md8sm17355351ejb.4.2020.06.25.08.30.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 08:30:46 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 22so5998497wmg.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 08:30:45 -0700 (PDT)
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr3725834wmm.183.1593099045444;
 Thu, 25 Jun 2020 08:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200623182809.1375-1-ezequiel@collabora.com> <20200623182809.1375-3-ezequiel@collabora.com>
In-Reply-To: <20200623182809.1375-3-ezequiel@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 25 Jun 2020 17:30:33 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DmsE4jvXNWVqRMifx48oLhQohm-sYYJNpsx2_ipb3Niw@mail.gmail.com>
Message-ID: <CAAFQd5DmsE4jvXNWVqRMifx48oLhQohm-sYYJNpsx2_ipb3Niw@mail.gmail.com>
Subject: Re: [RFC 2/7] fixup! media: uapi: h264: update reference lists
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 23, 2020 at 8:29 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Align v4l2_h264_reference to 32-bits, giving some room
> for future extensions.
>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec.rst  |  3 +++
>  drivers/media/v4l2-core/v4l2-ctrls.c             | 16 ++++++++++++++++
>  include/media/h264-ctrls.h                       |  7 +++++--
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> index 6c36d298db20..7af12447a5b0 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> @@ -1943,6 +1943,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
>      * - __u8
>        - ``index``
>        -
> +    * - __u32
> +      - ``reserved``
> +      - Applications and drivers must set this to zero.

__u16?

Best regards,
Tomasz

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888D844FED3
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 07:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236344AbhKOGs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 01:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhKOGr6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 01:47:58 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEE1C061767
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 22:45:03 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id i6so32683289uae.6
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 22:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m9H+3SNDJR+XZqqu8ZCe/GuzGKqSuyusz+/yend6Is4=;
        b=nQHr1GrZ82k88zxEm97aywPYP/oMimrq1JAipcdFeakpuKcgdREQoAeGLMpnhS4IM+
         AcWpi7IGqCOtDrP5p8mY7nOgU8ORpW+ZiBS6L7JASeCPGcpVJEgJp5iI7c6uYMh63H7Q
         BCPv1P4poOt6+qNx6+WkoOFBlVrOXcXxXjZjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m9H+3SNDJR+XZqqu8ZCe/GuzGKqSuyusz+/yend6Is4=;
        b=T2s+pl5fiaqCaWYtNcbNoMI+QhzzluvKQRVCJYvwlWdIJ6DWYHc1hP1Jffdgj3qTo1
         /Nb38TOQEiqYbFGnGN969ZTz0mR441nTn3y6KCzMi+lyZ5hcrIQT1HMt1WZnvsIftHpT
         aawJVafJWcl2Ik9vDk3hG44V8EDYlNPnxZ+VkAOX0IXjRcGmxMd7LbT6fNGGBKY/s/Rq
         hjnA0yBEEgy1WT2+ts91In/7VD1N1o1rWs4FUEO0j1gvZ4/Q/9Wkr6wZTz2p3nnA/3ps
         TLrUg6InJtlyxnBrkgzklcqfommSo9FbW5zQyuauqwMQNSYCrUmOeQfY/y+ENdqxakCX
         mkyQ==
X-Gm-Message-State: AOAM532w89lPmGN60sZxCuXJFw5GzT8BJQiJw7E/pb3eLiLSLN1u/0ZS
        M2hdSeemy6WMhZ+gTgS7z5Qu0wBQEoLPMQ==
X-Google-Smtp-Source: ABdhPJxa4CHxgA4JdC3SagQ9mwzFee/1HANfdPndcFOPOAc5J1/w3MyIORrVYBUMzruJOpKk1y9K/w==
X-Received: by 2002:ab0:7259:: with SMTP id d25mr55397141uap.8.1636958702680;
        Sun, 14 Nov 2021 22:45:02 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 23sm7970915vkk.17.2021.11.14.22.45.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 22:45:01 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id m19so3790740vko.12
        for <linux-media@vger.kernel.org>; Sun, 14 Nov 2021 22:45:01 -0800 (PST)
X-Received: by 2002:a05:6122:da0:: with SMTP id bc32mr55142586vkb.4.1636958700620;
 Sun, 14 Nov 2021 22:45:00 -0800 (PST)
MIME-Version: 1.0
References: <20210120083143.766189-1-acourbot@chromium.org> <874k8k9wsi.fsf@redhat.com>
In-Reply-To: <874k8k9wsi.fsf@redhat.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 15 Nov 2021 15:44:50 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUD_oYeUt8_bGRwAPCPam40Jtktz2F7+A3SO5PFRdUsiw@mail.gmail.com>
Message-ID: <CAPBb6MUD_oYeUt8_bGRwAPCPam40Jtktz2F7+A3SO5PFRdUsiw@mail.gmail.com>
Subject: Re: [virtio-dev] [RFC PATCH v5] virtio-video: Add virtio video device specification
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     virtio-dev@lists.oasis-open.org, linux-media@vger.kernel.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, egranata@google.com, kraxel@redhat.com,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        kiran.pawar@opensynergy.com, enric.balletbo@collabora.com,
        alex.bennee@linaro.org, Matti.Moell@opensynergy.com,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Dmitry Sepp <dmitry.sepp@opensynergy.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Cornelia,

On Wed, Nov 10, 2021 at 6:37 PM Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Wed, Jan 20 2021, Alexandre Courbot <acourbot@chromium.org> wrote:
>
> > From: Keiichi Watanabe <keiichiw@chromium.org>
> >
> > The virtio video encoder and decoder devices are virtual devices that
> > support video encoding and decoding respectively. Although they are
> > different devices, they use the same protocol.
> >
> > Signed-off-by: Dmitry Sepp <dmitry.sepp@opensynergy.com>
> > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> > Here is the new revision of the virtio-video specification. Compared to
> > v4 some extra simplification work has been performed, and all stream
> > settings are now consolidated under the parameters. Hopefully this can
> > be used as the basis to write a new version of the Linux driver and
> > virtual device, or maybe even to drop that RFC tag! :)
>
> It seems that there has not been any followup on this, has there?
>
> I assume that there is still interest (after all, the ids have already
> been reservered); let me add some quick comments from the spec pov (I
> don't really know anything about how video is supposed to work here.)

Thanks for the comments ; they come at the right time as we are
currently working on what will become the v6 of this draft. The
precision about the use of normative sections in particular is
welcome.

Although other work keeps getting in the way I hope to post v6
sometime this week. We are also thinking of updating our current
implementation of an older protocol version to provide a working
proof-of-concept, although this will likely take some more time to be
done.

Cheers,
Alex.

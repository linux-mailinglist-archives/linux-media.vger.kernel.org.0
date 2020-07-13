Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390DC21DAE0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 17:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbgGMP4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 11:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgGMP4B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 11:56:01 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0325C061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 08:56:01 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id l63so11342550oih.13
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KJwvSYWoWDkN35u71y4ODaHWxVlDrck10Sd0PYp8JB8=;
        b=kCMQpToX6Ti19kjjqU3/m3aePquWWV1/Ga1S9xRfCQJdave0wjUUhMdwl9hNc4B0fd
         LBEswGCaQzZrdHFpbg5ssjMO04oH/iNMfEshtAAE5LfglPXFqENVtde9ByCfp4tCZX7/
         rtR8y8nFp3HQ/QfumhSbA7UztFxclyulo5khAOUdidKn4ZybR8W0KSmsACdEaPLtCU/s
         T2pn6Ir7OrWAkr9eHt+fUrbhW93QN4i3nfLxRVaw3q287exbfi738/cqDzXve/EhyffZ
         S9jWE66kaF3xqXdTs+x0aoOVRgxgT7K3jNknbbgVlXAnXoZI1XMM//AVEnDt03y/9CTM
         ucWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KJwvSYWoWDkN35u71y4ODaHWxVlDrck10Sd0PYp8JB8=;
        b=W53HQR3qZFSi2Ab7JwOcPeMCfa7JiQBP4lWeb5dNJnzFB5KF4/JmPSJjei0L81TA0y
         TnU8+eoe4/zCUh7BaDjlDE07PK9crsO9q2eDqG/sVdYHQuh8pa7YrYH940hRbWWnes9G
         nYi55es+wv/MdobjpEg4T3k2dYdKzL9NkrxydFNQBJ8mKVg0sejqmlW1xKZmOM+EEbrT
         Sc6wguJssMuPZb9rRdD8MyzNppch4cEmp7+dd2TzNwJAQWJGeB6ngyplrDb9Fk+J/hFT
         VAK8yoVGeq6XaRVnyJORuPpWCH0wR7PntsP7gCxg3q2Ton6GeU84E/5fBnIdTgb7GkkO
         vztw==
X-Gm-Message-State: AOAM532TP783RHKhn0rynYudThdF9lFAeqE6SY/dEfBXFYV90CI5XsMI
        nNOBHz/+1QoXbB1Dp6Q3v/zPcJVzDv+hgok3r8IVmw==
X-Google-Smtp-Source: ABdhPJxG5twj23Ffcyls5m+48bFNBeD2hBEALr+Z1Hax/CwValhFKUkphCjEWkOshDnXOu3RR1CE8IcA5Ox/ht9o3Nc=
X-Received: by 2002:a05:6808:ab8:: with SMTP id r24mr17108oij.133.1594655761260;
 Mon, 13 Jul 2020 08:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl> <20200713113048.1150542-2-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200713113048.1150542-2-hverkuil-cisco@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 13 Jul 2020 17:55:50 +0200
Message-ID: <CAG3jFytwGeu5EyxWwfF8FyZ=LK-3Nzsr00Y9-=u4N0WN5w3zdw@mail.gmail.com>
Subject: Re: [PATCHv3 1/7] videobuf2-v4l2.c: add vb2_video_unregister_device
 helper function
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Helen Koike <helen.koike@collabora.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

Thanks for submitting this.

> If a driver calls (_)vb2_fop_release(), then such a driver should also
> call vb2_video_unregister_device() instead of video_unregister_device().
> This helper will all vb2_queue_release() if a filehandle is marked as
> owner of the queue. This ensures that at unregister time any streaming
> is cancelled and all buffers are returned to userspace.

Nit: "This helper will all vb2_queue_release()" wording is a bit confusing.

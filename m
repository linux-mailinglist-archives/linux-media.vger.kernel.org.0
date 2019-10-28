Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37AEE7935
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 20:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730788AbfJ1T31 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 15:29:27 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:37992 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbfJ1T31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 15:29:27 -0400
Received: by mail-io1-f48.google.com with SMTP id u8so12034327iom.5
        for <linux-media@vger.kernel.org>; Mon, 28 Oct 2019 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vZyO6oUnRM5QCWv8Tj0U2eoY8KE3W2oe2H1OhiD1LEY=;
        b=MKxJZLS+nDjSdUWNVmV07IYdOaBNMKKHsaXFK4Isz3iRJgy2lkd8srJk6XLH+0UKJM
         e9MONkRQ22KqlDhXFCoyp0awoRE1jgUqEtSe6LFz3wiHanrrZDW0M3n/lyHXXlh92/x4
         gVqFEmi+cZ3ySxc9T1JuekfTONfxZL10KaZ8ckyjU9Sh/umGtN/jugm2BPal3c7fJel7
         rYPoGFfQ44l+db0sHjrpOhKwBMKF4iJ82WGIJDRV53DGOm+1/6I1xFQmoV9a17jgRG+v
         QRNNSICJdVvIJ4W2b/wqlBVri0iiXmQVBmGWJQtQJ92rceE4qJ4OWxOV76TtVYfUL9jR
         K+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vZyO6oUnRM5QCWv8Tj0U2eoY8KE3W2oe2H1OhiD1LEY=;
        b=r/Gj/CtAUeUaZROCuhq+R6Qzb4SAJhqYQM2zabwJmqatJ43cEjnB3mS53/sz36CQcD
         fEbZQ2P1pI8NKKbxtYTVy2t0kgWmGu2gwnT40uyy77oY79b+j02CQraPd9VRUvdRmA4K
         DaTKr98vUjl7pw1uOJP1AxGbup6uzhxyX5ES8JljM97RGIollVCAYej3Dj6X+Hd7mbnm
         ibmwCc1Vu5lOq9A+gyhFfCe0oAeXZuVCMS8jI2vnmSZrJFfL38Hk4/C/636M4n4a9fZ4
         fLcncmDe8sdnFT/pNitkB+lNn5ujbdddE7YBie55YbBDq8tgVOTeLs7nXIlVrZFBQn4T
         aTUA==
X-Gm-Message-State: APjAAAUK7pXVwIFoFBPkUoZcbK26v9I4OAvPDEm6m/aZ/cxM/iTdb/ji
        AbyrbUEpTB2ydfR9bRHYoMRmnjOP/1v+aC7pLm9XBQ==
X-Google-Smtp-Source: APXvYqyJxgevfK2t1q+5Yi4AyUe6XK99TIlppAyg9mRbAgx6g6kxQV+N6nzIuGzCpzCLBn4eNVT/sgMIYI/IQEQaxdc=
X-Received: by 2002:a5d:9952:: with SMTP id v18mr15419147ios.58.1572290966022;
 Mon, 28 Oct 2019 12:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKr-8DDt26RmQpVcfa4fj=vuGY1H-_DD4UWpsaPq6wH7A@mail.gmail.com>
In-Reply-To: <CAHCN7xKr-8DDt26RmQpVcfa4fj=vuGY1H-_DD4UWpsaPq6wH7A@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 28 Oct 2019 14:29:14 -0500
Message-ID: <CAHCN7xLgwTM8sU1uxKCRUKdtOc63RJs3e7nWHZ98_R_vp4ahmw@mail.gmail.com>
Subject: Re: i.MX6Q LVDS colors wrong when HDMI connected when V4L2 Streaming
 with KMSSINK
To:     linux-media <linux-media@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 28, 2019 at 2:12 PM Adam Ford <aford173@gmail.com> wrote:
>
> I have an i.MX6Q with an OV5640 camera connected via CSI-2.
>
> I can stream live video to LVDS just fine when HDMI is NOT connected
> with G-Streamer and kmssink.  However, when HDMI is connected, I can
> stream just fine to the HDMI, but when I try to stream to the LVDS
> using KMSSINK, the colors are wrong.
>
> If I use fbdev instead of kmssink, the colors are correct, but I would
> prefer to use KMSSINK.
>
> I have tried using v4l2convert to change the format, but I keep
> getting errors that the format I try is not supported.
>
> Might someone have any suggestions on how to stream to both HDMI and
> LVDS without having the wrong color on the LVDS?
>
>
> # display on hdmi
> gst-launch-1.0 -v v4l2src ! kmssink name=imx-drm connector-id=54 sync=0
>
> # display on LVDS
> gst-launch-1.0 -v v4l2src ! kmssink name=imx-drm connector-id=56 sync=0
>
>
I should have noted that if I stream to fbdevsink, the colors are
correct on both screens simultaneously.

> thanks,
>
> adam

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C162FA8FF
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 19:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731302AbhARSij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 13:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbhARShs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 13:37:48 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4738C061573
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 10:37:07 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b10so19257473ljp.6
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d4UhRkL63IYIvTQz7Jn3KAp7Q6ZJmuRzTOlnY7mYcHE=;
        b=t1sjK4b27xNUqKPNbiuKsRgAKe5c3vXgffrA1g1UnNpoG7B9e90hYkcfr60y0OmvC3
         qwfBX1Uq2t88wDuyFz/2ZHgyUxdBVDrk6x8s7MMhi5QxhmSLDUzyxUUPCy62XZ93O3PO
         t21mCkgOCap+LJzvvNhw0y4/49vlS57kRpoaArjS9bmCT0UgK4t4E/hfQGUeeI1w4xOd
         Kn2kC96Y2WUQzRM1ID+KpgTxPXVak0OG2SCPpUwR9Ou7lGDzJffEKPi5ebDjqpCIZPsQ
         KUYjgRPNCCduULdch4JdvWI5MFZUqlAWOpeQ0i6ysJcjxS1aXZW8EqgYsrdhplRSPbaG
         b5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d4UhRkL63IYIvTQz7Jn3KAp7Q6ZJmuRzTOlnY7mYcHE=;
        b=SwudjtYu9nW5TuL5zsbzLMktYCWJJEQ+30E4sIbsKAYqi7j7H19uLjOWLOrpFdQm2Y
         jt9oAC23PDYZatNgeCr0yXgMBUuGnUOlFFew4m4UHY7TMvYlc3qrqAgJsAGkPeMOFJ/m
         TpA9c4y25CPbSBPzR1SIcMXR5fo0u9p8uKc/PrCaUL2k4T2VTd+JEo9lA9/S6yXrfflw
         DrZdfNk0jdzUs+o811YiTJv+gNekyfMJfShlB4pK0A1d3c157Oe1PqdlR6RMznzP4Rz5
         Y5VNALKRiHLc8j0YG1J7ictXTAY0Kvdok81qyT52c4BxnW60ps5p/xdlShQf0J8S4LIQ
         F6dw==
X-Gm-Message-State: AOAM532qjrQZ92/r5N9zm3N32Jv0nTXmxFvF3CeMe+e1QZ4NPw8DFLDK
        S6JWmHv/rBzBNwrmyEwa4vGOymOti9sic3fei5b9q9TpPP6McA==
X-Google-Smtp-Source: ABdhPJzoN1VOIXjU4jUo7QvLEajGepgIYbtPtpUzDb32oC0HZZDWIvexQCJbb3aN/MCkBY0ql1MJQongTMfHv0dUoGo=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr388046ljo.490.1610995026150;
 Mon, 18 Jan 2021 10:37:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5A3Dr2SF_u9z9p1dAwBrrPXTqkdVqZuBR0v6iYRPcJEig@mail.gmail.com>
 <CAOMZO5B=2z5sHWQvb0872v4f7YYN8Aq4ptf4YuDmoebJBtEY+w@mail.gmail.com>
 <f8d2536fb5dadf7b7bdb4bfb6b3aaadf68318a88.camel@ndufresne.ca>
 <CAOMZO5DBRGqn5DTsMG3RRHdN1HMo7CtP6HYw3PajK3A6Y6iCoQ@mail.gmail.com>
 <CAKQmDh-KgO4TameRQs_D3_rdW8n0oY-ZLmbsQzWQPOkUJdiObw@mail.gmail.com>
 <CAOMZO5DCzodXDVygMfnhJi=DF3W64NZJQxLBT6LoOJ_V6NJ9Hg@mail.gmail.com>
 <4366a936909a3f33788719f00441e81b1f3576f7.camel@pengutronix.de>
 <CAOMZO5CyDtEW4Uo3u9ANRro5fV4DBx3WLKDc_ok8HB41mNKF5w@mail.gmail.com> <180eccb13a035e6245da319b285c6cd622fb30ec.camel@pengutronix.de>
In-Reply-To: <180eccb13a035e6245da319b285c6cd622fb30ec.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 18 Jan 2021 15:36:54 -0300
Message-ID: <CAOMZO5Cu_=vEe23R+siqcH2UKPUvaBnCo=WD5FvKcSmbdX6Tbg@mail.gmail.com>
Subject: Re: Coda: imx53 plays video with incorrect colors
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, Jan 18, 2021 at 12:29 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Please try forcing decoder output to NV12 instead of I420.

Your suggestion works, thank you. After applying your IPU patch and
using this Gstreamer pipeline:

gst-launch-1.0 filesrc location=/media/clip.mp4 ! qtdemux ! h264parse
! v4l2h264dec ! video/x-raw,format=NV12  !  kmssink

The video is played with correct colors.

Can we make the NV12 format be used automatically so that a simple
'gst-play-1.0 /media/clip.mp4' works?

> Yes. Please try if the following patch makes it work:

With this Gstreamer patch, I don't see the segfault anymore, but it
plays in black-and-white.

Thanks

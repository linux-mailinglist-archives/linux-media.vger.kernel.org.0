Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61842E7C8C
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 22:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgL3VGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 16:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgL3VGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 16:06:48 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C756C061573
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 13:06:08 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x20so40243625lfe.12
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 13:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INI0pIr8ywwPuyAn0ik8dIyKrRHDKlPBEOgSlHCB/ow=;
        b=sAvBd+GZi9olhMC6Wg4U1UMP5ormZzi7nmCPx8epA69Gdm7qoFzN4qhyjaHfPnHhfJ
         fqyLeDPbTMTWWgsrs8xGzDPAjRU/xsR0xnLEmEysNt/oVjE/Shv6nZL4EWbvQiz6jB1N
         Bw+h4724vdvg2UUS5wpcG4Z9ttk7trLaXZpz2AKdtGKjyqnfqXkXMhRpg72CVhDn6xO0
         /UbsVfeMn0ocKzj6thzPmcas2h+KALrXrZOp0SowIuluIIktPn3V7iQmNWDtPjhDEoHL
         i7DfWwMfKJIY/HmGBCrMDtJy9fCs3npYZyAsa0wOFJrFLw0gu23jShEg3b62JjkjNyTX
         eWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INI0pIr8ywwPuyAn0ik8dIyKrRHDKlPBEOgSlHCB/ow=;
        b=gefoLDVynb+Ysf3/qwUcAPPz9b0ZhnlIL780MwWHoMO/cUZQYQR6KejnJ04po/MRbi
         8BxaTxFnw/9KxRYxlK6NoGhErdmN2YNq1/0pKIexB64PFZHqFNiNCXhqBLC+meSrg9cV
         eQgGi/Or6tsfoGGZxqTPp4JWFwaJlE9T5ObyWJRYIuJPf9rlKvl6ORSHctLaxpY09e2n
         XD3ENZ/3OwNNXwhKbJOW5VRwz0atHlujNLQIFlZgF1fRbRepuXH0+GRlno5fIrVZICjk
         ag7p1VR/usUP07fWAKWzuq9+mgMzdzTVkwc/xSi1m5dXCMPK4yATEzuIBxV9QlA+yEjk
         +z7w==
X-Gm-Message-State: AOAM533ILOXUbjlUaCEyghUibZzm04C4PTDOavkP08XoDckuVRC4VMiG
        qZtOFi3h5s04/Avpslu33lSfPvXKu4AR0OcvyNsTjYj5aB0Blw==
X-Google-Smtp-Source: ABdhPJw+M8T8FFDxLFfyFZAJ5ZYHNKXl0DwfF3SBUet2+AXv+IsBzI2A6TjkcNeIBpvkVv30IVrneMMql24xiPP0Ai8=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr18056425lfg.295.1609362366505;
 Wed, 30 Dec 2020 13:06:06 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D2bEc+g=OVs_cQjcFkurzk6Hj8pZP3F9U8Kdqc4_FP0A@mail.gmail.com>
 <X+zom8wMYLikJXpq@t450s.lan>
In-Reply-To: <X+zom8wMYLikJXpq@t450s.lan>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 30 Dec 2020 18:05:55 -0300
Message-ID: <CAOMZO5CmiytRB3e65SHeuQNYz1DsoS=j_zUv_B6QkUpAVS7mWw@mail.gmail.com>
Subject: Re: Using kmssink with mxsfb-drm
To:     Gary Bisson <bisson.gary@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gary,

On Wed, Dec 30, 2020 at 5:52 PM Gary Bisson <bisson.gary@gmail.com> wrote:

> Have you tried adding 'can-scale=false' as kmssink parameter?

Thanks for this hint, it does work now :-)

gst-launch-1.0 videotestsrc ! kmssink connector-id=35 name=mxsfb-drm
can-scale=false

Thanks for your help!

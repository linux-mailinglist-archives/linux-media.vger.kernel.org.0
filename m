Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FB31D9658
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 14:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgESMcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 08:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgESMcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 08:32:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CBCC08C5C0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 05:32:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l17so15718185wrr.4
        for <linux-media@vger.kernel.org>; Tue, 19 May 2020 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdwmU3KGXT5f5o7NdwOK4CXVwLEMnmMDFMRkP/u02Ok=;
        b=C+YCuNMI+IeJNKCuZxW8pOjMv0yk68ESbJLXLWYwEeFYnomGMW4IimrtIDPp/QQga0
         Itz0xrTkM5Qvr/WS3JAMFgKH8PijxvQHFjgwTp6dWORFKLXbG9hRdwbft+DH/3s2c06t
         usuT1PGwmGodGtMi9YOHn9KFWUzy9GRiOENsxf1/t67pc97Ds0KL3ZL9h1dXGlpBNy9R
         9pvpD2DLwXDmSlF7ut8+PUcCX4mw3oYraQciwwCGcwaCII7fbRntnauEkdrjBI81B3fA
         pn7GakuiLTwnPhWSHKpF5vcLV26dwnzM3VmR7S/hZcqdrWklEyCEHaQnYzoMmJrmdvzU
         h8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdwmU3KGXT5f5o7NdwOK4CXVwLEMnmMDFMRkP/u02Ok=;
        b=JgdVzJmn6orXdrDMLhK2kiLhWI08eJs6WFIfASOp7rgVHjVh7ef0eVxgjqWVY4ijzo
         fBsRtjOKK7pjOjnO9DZJl5DPnEXTTJ1tgwUgj4w/qB3ul1A6PsLQodWonykqkLMOtKvd
         PfJi11ud+ImCX3akPor/+bnOQxbl4uOy+i3fU0Oc1dI5wXo+sl1yCYgkn7x2uSNKGund
         P026yl8bM5OBV14e4FS68sOAszflADU1qmCZV/LogueBlK20mxcuc/xd+ooHd2/93LrM
         ZJjQTS1iPCjZ+lDVzftf3bJ737YRG2TOn+TIEpcMUkN3zdBFDPAsOq269l2LU7s85dQY
         DvdA==
X-Gm-Message-State: AOAM531ny9QEh+vX0XkxrmMVWbwEPgJqzLvhNJJFtSvdWmcSKz6vc4kf
        bXB20KuMe3CAPpvJyMowaF78ZIJJKDeI22+FRcpUcA==
X-Google-Smtp-Source: ABdhPJx2fr4K5LGcj/g0jd/aF1DvmTDhxOcscCPb5OZe3Pw1o3fVerWyQHhbJV+rjqm18qMsvlxUmQcYtUlZ1KCrzOA=
X-Received: by 2002:a5d:6988:: with SMTP id g8mr24440250wru.47.1589891534608;
 Tue, 19 May 2020 05:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200519120105.7930-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20200519120105.7930-1-sakari.ailus@linux.intel.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 May 2020 13:31:57 +0100
Message-ID: <CAPY8ntAjaOFDxnFjg4G0nnfXruw-hoQdPJmLy3kY8M7R-NPBKA@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Mark ov5647 driver as "Orphan"
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, 19 May 2020 at 13:02, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The old maintainer's e-mail address is no longer working. Mark the driver
> as orphan.

If you're wanting someone to pick up ownership for that one, then I'll
volunteer as it is the Pi v1 camera module.
We now have it working with libcamera which required a number of
extensions and improvements. Those should be upstreamed soon via Ideas
On Board.

  Dave

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a7bb6e22d5da..f9efe5d43438 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12431,9 +12431,8 @@ T:      git git://linuxtv.org/media_tree.git
>  F:     drivers/media/i2c/ov5640.c
>
>  OMNIVISION OV5647 SENSOR DRIVER
> -M:     Luis Oliveira <lolivei@synopsys.com>
>  L:     linux-media@vger.kernel.org
> -S:     Maintained
> +S:     Orphan
>  T:     git git://linuxtv.org/media_tree.git
>  F:     drivers/media/i2c/ov5647.c
>
> --
> 2.20.1
>

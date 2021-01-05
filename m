Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC922EB697
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 00:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbhAEX6r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 18:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbhAEX6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 18:58:47 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BEAC061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 15:58:06 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id dk8so2771370edb.1
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgJfXmrKmHjZED3B4c1+qVp+BJ/e1ZQWTRhGBsvgwE8=;
        b=V/29dK6dTr1eENLT+Vui4S077OPrZoUeg/a2qZQP51tgQ5f6eXfi46pzhK2iGaoVSZ
         DsZT8qWsDJnTEoSkYI36D6BmjzkIV5QTOQjI2EHkoH31Tn8h+qrhWhWmU+cMtLXcikUU
         mAlR3bbVzAOgd+IsYtixQ5cKijJDFc0CpJAWK5SbKYYzRZip5koxG29iC11xqd4o1bk3
         l273UJ0g3IXgH/DKY1KMOfuD+QebjWKEHAtXC4pD5Y/B/fQClcLUEeKy4JslxlQ/54Hm
         lEo3f9aR5FBQA/H0rkmL98a5ZUK10Ofsk68+400HnCvTookNNiiXK56dcnGWnM5aIg2D
         peBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgJfXmrKmHjZED3B4c1+qVp+BJ/e1ZQWTRhGBsvgwE8=;
        b=Q+7i3AKqaxOiGLdbPpG64XpvEstDuXbxvyBm8eJfmTaLcrAN52TJZFJaY18tG8lmcl
         yYg86T0voGkRol+rEmt7v8y0qqa0X6gprb5tAY6peIAIppsX7j1WEvsheYuf5PtADOt0
         ZPCw1DVO2GXK0ab6gYLZab7mtD7y0xaGgiKlL/9+epf19SdWZHbf8ItgEgT03lAavSd6
         02pczlEX7BToNEzPmG0NOG9utagInj2zHjoOhzwHz4W1CdbgYZt0hPEJv6rDWh3lAlQV
         Qi4VdcsS4YjuLMfwVOqe9783pQuxnav3KtBRjd2lU+tP7IvksTg2vs//FY+rLdYWb5t/
         jIYQ==
X-Gm-Message-State: AOAM530lj+tVRDohPPhoeJr6Famn5IZi86OakMh/bpzG94pgrO3jD6gl
        Wc9DVSXt52fRjrjKFB0EwKJQwsbhULuD5v95cAFfWw==
X-Google-Smtp-Source: ABdhPJz/c0yrRcTZhptCmWX91XM/Kf2DHMLZaJFWakzjtZQyGLikRU74YOgAoM/RQhcVdBjQc2jOYzUye0lJ/LC0kkw=
X-Received: by 2002:a05:6402:1ac4:: with SMTP id ba4mr2071103edb.383.1609891085689;
 Tue, 05 Jan 2021 15:58:05 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU1Du8JpEMqGC+BMyD3D+wVAUP42PXqa=_unrD7L4YfDAA@mail.gmail.com>
 <30a04077-869b-9b58-a69f-15b19a3f6bd4@gmail.com>
In-Reply-To: <30a04077-869b-9b58-a69f-15b19a3f6bd4@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 5 Jan 2021 15:57:54 -0800
Message-ID: <CAJ+vNU2nwb2BiUVx4UZHG0AP27NtbTij_Skcm0kW=_9YTAxuQw@mail.gmail.com>
Subject: Re: IMX frame interval monitor (FIM) available on ipu{1,2}_ic_prp{enc,vf}
 capture nodes?
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 2, 2021 at 9:55 AM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Hi Tim,
>
> I gave this a shot a while ago, but I recall struggling with some
> locking problems. I haven't been able to return to it. I've updated the
> imx/add-fim-to-prpencvf branch to latest media-tree master branch
> (5.11.0-rc1), in my github fork [1]. The patches against master are:
>
> 0001-media-imx.rst-update-doc-to-reflect-FIM-changes.patch
> 0002-media-imx-prpencvf-attach-FIM.patch
> 0003-WIP.patch
>
> The last patch was my first attempts to debug the locking problems.
>
> I don't have access to imx6 hardware any longer, so I can't progress any
> further on it at this point.
>
> Steve
>
> [1] git@github.com:slongerbeam/mediatree.git

Steve,

Thanks for the patches!

I have found via experimentation that if you are using the VDIC to
de-interlace and you loose/regain the signal to the adv7180 it will
roll endlesslessly. However if you are doing raw capture the video
will sync up within a few seconds (240 lines * 16.6ms-per-frame =
3.8secs max I suspect). Thus the simplest solution for users who
suffer from this may just be to capture raw and upscale.

Best regards,

Tim

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1993239F4D7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 13:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhFHLYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 07:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhFHLYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 07:24:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D739C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 04:22:11 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r198so28158012lff.11
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4hFbLjz7TcihGcm/73u+e3noOX5Om5bqL5IfdgNHugM=;
        b=IvStIAq/7pwFsCNXsH23gDJFjrpRiBx2yLjqIgli0UKgpOBbGYrhKRa3McjJKKVoL9
         7T8Q1FmMTl/NTOe8T8XZ1joLbqKA75AVgBFDGkE3DR5F9Z+zhtU1MOGCQYc0A8G5m6Y6
         5ev+61yioaU3zrHLuJhVZre6T73pU5Qf6pl8o9zMsfDQgD+Zu8xOYmk5dCEntBqKf5hQ
         OTLJPFfQniyiLQimYVicjE0Ldj5uXLXnL6wyXHtFcvbjaEM4cX/Yxpd0kiuy7YVwasgc
         VXPR9BtdolbzttlggjiDVl7xLvfhnmnhi42i9VTxz4PPw/qfxXeI2NmlYyFNlTJ2T+jd
         QpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hFbLjz7TcihGcm/73u+e3noOX5Om5bqL5IfdgNHugM=;
        b=Ei23ig9Uac5cm7lk+qWzS0sWthT92Edl87DLz2sni00JfLmQqU5/TVuergcpur25YX
         0Qo+XJxkTyT1vZEy6PgnhTsYYdveGbAm2jKwtw7SuwGEH8NDxOz0txf1icmb2dxhZd94
         FCXwNTV6WgLhL53+Qgdsht4ElfVOmo28phCLUVCp0aFsNzNm8aB2c5K4Rnkq2ujjxGYW
         6Rf7ZcjpYp0+VUrXZsGdQXAsEPu6aI2KBPFSkli6G2Nv7hrF6CvE65nvCOU1hOtjWg8K
         M/0I9fakEWU3dAkbRgyCECEAXQj98A7XAix7K046pItZnF+rVst+2KYk+0ejAsC/UP+Q
         IdEQ==
X-Gm-Message-State: AOAM531F8Zi/bXHNmVu5W5dQu9NP2bmxyTIFttTaLaNWfYBMHnq1Takl
        K7lcrgDCDDmMP3u3C9VhIFhZnGBeqk9UDWEvBnw=
X-Google-Smtp-Source: ABdhPJzby+Ab/FaXMzmd0bnaFd7AWRnLBytUFkkuojH5cb01Kt0ZZL0lhG1OSGB0CNORbqXHP/yKFo5FY9p98tGbJA4=
X-Received: by 2002:a19:c211:: with SMTP id l17mr2084572lfc.500.1623151329825;
 Tue, 08 Jun 2021 04:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A0nV2bubWt3EzkaWVBoD96YNTYB10y-qB79mX2pTBu0w@mail.gmail.com>
 <CAOMZO5CfCZcngeOj4yEV+g5s6Wy4F0=wCu3PD3LyZAUMz9V2LQ@mail.gmail.com>
 <CAOMZO5C6ai+Vze6e4o1WYCa42p2YK5_cjo99Q7qKc50E+ebgSA@mail.gmail.com>
 <cad89872382bad67fdd8e12c392d023bff2a3ff9.camel@pengutronix.de>
 <768ccb5c-a02f-576a-29ab-57e3c6d46d26@gmail.com> <dfc1ab86-ac5a-4b4e-4cb6-6b99679aaf1e@kontron.de>
In-Reply-To: <dfc1ab86-ac5a-4b4e-4cb6-6b99679aaf1e@kontron.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Jun 2021 08:21:58 -0300
Message-ID: <CAOMZO5DcygOuqgy7tVJgkM6XSrZBTYZBjkmdVH4NJWpS8G-DDg@mail.gmail.com>
Subject: Re: Unable to capture adv7280-m on i.MX6Q
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Ian Arkver <ian.arkver.dev@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Tue, Jun 8, 2021 at 7:55 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> > Frieder's moved adv writes should maybe be inside if (enable) though, with the else write-to-clear as well. Maybe gst sends a stream off?
>
> There's an "if(!enable)" before that and it has "return 0". So it should be fine without "if(enable)".

There is a missing if (state->chip_info->flags &
ADV7180_FLAG_MIPI_CSI2) though. to prevent the csi writes to happen on
non-MIPI ADV7180 parts.

I will fix it when submitting upstream (if I get this to work though :-)

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EFB382283
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 03:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhEQBYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 21:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhEQBYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 21:24:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0874C061573
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 18:22:47 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u20so5223314ljo.4
        for <linux-media@vger.kernel.org>; Sun, 16 May 2021 18:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yrWR3GjFgwsDZZR4dl9tPHryd85TvJD0lLZ8WpYL1EM=;
        b=MHX8aEhtGwYPyQR4n53z2FXJxdAvTJoW6IodlWLvPCHtiAkYlUKWLgDw/vD5RuWCEj
         +3kzXhcKz7kriOTHPvASwWv7wUiExUtvU+81M2oR+fQXr2cpZuWqfpc/Ikk8HS4aIE/q
         5BUMPKgMUna4ZHm/+zuDZ//CehSP8Op83TdyMDENEif8GyiYu/zVN9fSPUEFbn9SUFLM
         SdOt7DuY4XJi5XcZlRSdYzMnDdKlOwT9+lxL0YBKLZ8tp4MuIrRMwmBBln6y2qFS6V5l
         QCq7C4ufzt1FCTAyRAh+X3rwfsyurTdSIpZBervNWbpAZehtAs19SmmxK+qjebxZ4BLy
         xCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yrWR3GjFgwsDZZR4dl9tPHryd85TvJD0lLZ8WpYL1EM=;
        b=mu9QnB/m1WbDA/r3K5lnjy5ZwLntI+Wl3dGRPP5+VGZSRfOUPwS+nLZ8YEtlFCq+Pu
         fqiw/XTJwWVJRZ3z6vQqq6AymHSBnXI/hFLD4P2+WQ90H/7CYCUpEtBzGAs3lmmsSvxD
         ebTPJRezP2s/7k47hfGRtSxGe9qVUuZ0vbt6DI/GaQvZZ7oUb4WJoM0lYNiGKhC2ylh6
         hW0atngjy51q0yf4ogahtjJOIFWHVmpL6y0Kug8QlIWSzGBtg3Ala+5lv56vtWcmJIGU
         wTx6vMnYyJFrPDCjUZGgRbv01dMcmbP4w2IoWWPKdQx4myU3O1Pkm7jXhzgpcYaEZTti
         GRXA==
X-Gm-Message-State: AOAM531pgWXoGvnYsf/tOOjBJdOD8HUasYDxDMTCS1yOCfROHuWoQl+G
        +Ef1n1ijkGv/JSsONXVoeH1MQYZUOqpfi9sryis=
X-Google-Smtp-Source: ABdhPJwRFKONgFS8N36rwQFIo9gRzLIXc4okQJ+7ma79BT3rSJ7fQrgnUn55UQPT5/dpy5OA3MORfsse70D3DGLi9xI=
X-Received: by 2002:a2e:9f14:: with SMTP id u20mr46616023ljk.53.1621214566252;
 Sun, 16 May 2021 18:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BDzjfMrg5Eh_esi=ixtP1g87nk5mu3i0zJZ2=aa08Uig@mail.gmail.com>
In-Reply-To: <CAOMZO5BDzjfMrg5Eh_esi=ixtP1g87nk5mu3i0zJZ2=aa08Uig@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 16 May 2021 22:22:34 -0300
Message-ID: <CAOMZO5BpBSzM6rMz=kjzY3XkS4HRcLGdHRFmtaWva7Mp3ZHQVw@mail.gmail.com>
Subject: Re: ADV7280-M probe failure
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Matthew Michilot <matthew.michilot@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 16, 2021 at 11:22 AM Fabio Estevam <festevam@gmail.com> wrote:

> Does anyone have any suggestions as to why these registers writes fail
> only on the ADV7280-M connected to the MIPI CSI2 port case?

I have fixed the probe issue and will submit the fix soon.

Thanks

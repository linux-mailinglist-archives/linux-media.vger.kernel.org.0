Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B129D285DED
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 13:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgJGLN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 07:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgJGLN4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 07:13:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18001C061755
        for <linux-media@vger.kernel.org>; Wed,  7 Oct 2020 04:13:56 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a9so1812598lfc.7
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2020 04:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjDhQrGZmxdEwP6PTrTiLCA9UXW72cJtihexkHoOh8c=;
        b=BUssyzmW1QNY3FoBkQeM0TYG88Y3UuSjqUQjj4RT3dRrlNgCDxOlyg4h3NtETJJFBq
         8jJOZySPBoTtXURirXbDH2rdNfOdYiztQS6TYWi+5jzgtmvRNaPMGpEjK0A5oQGKX+GM
         XFVzGHKW+q47GEBYs/acJ8CUZk47CHWk04JjnHmcossPZ0NvpQddvRNcInM7LvSq49yw
         GDKiThAJR8v6yg6rn3uUJa+Z21zzYAVdO3MfalFixge3IcRugpK/z4Lv5OkXd+ADPnY0
         YgSLaFcIFsJuISaRBtpA/8tUce4W3GziJQspg5sysRyMtYn/puVREw3xsdtk8RdrdwWu
         RM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjDhQrGZmxdEwP6PTrTiLCA9UXW72cJtihexkHoOh8c=;
        b=i5qoKYGeL4X/WKhccnwRUdA6qOf/5PMo6jfp3nNkIAZCvSmu35OOAF66OG8uUBm4bc
         2oTDnGpHSBDR0pDrWCASjmUvyASc5Sr3OCPZNGzIcTsr6WFD7agGesTNB5C8V12HiFAp
         rrMP44hYX3JPPzRCNrLAfwyy9gw3TrJ9yKE0UhfmoDS6vojvhaMOx/4vdh+oLwqA2xB8
         V1E7fYCOho3HNJjrqpJ6eoNQCBbIMStk0hcfK/hZrwU5Rxoy36yfSLgmyX9AX88v++oy
         +BrianTbytQw7Ge3XSTJ3K9WgRZoDksDG/u0uA2WRHzOdWjETDhxr8f/Yxxvw7gbXvh1
         Q5cg==
X-Gm-Message-State: AOAM533MbBT0EnVa3FQO3uiDyWc6w3AY31yzDe0AuQ2VtITVU+WpuDwq
        8sSbV3iqtp7I59aT+CgNrlnFAUapqMEC7bfFk+5wnsQpYO8=
X-Google-Smtp-Source: ABdhPJzM5MrjTVnSk9FJfqKBhDuK0Y6/DhfPFEI6m6zxgTKFZ4S0OECbJmn6seQVQp5SK8scQ7rTLgwKJKyMQX4MUbk=
X-Received: by 2002:a19:4289:: with SMTP id p131mr733111lfa.244.1602069234439;
 Wed, 07 Oct 2020 04:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201007103544.22807-1-ezequiel@collabora.com>
In-Reply-To: <20201007103544.22807-1-ezequiel@collabora.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 7 Oct 2020 08:13:43 -0300
Message-ID: <CAOMZO5DpGXoyXm0D63BL84qMAnPkNOiUcmYsmp9QdogePrLxZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] CODA timeout fix & assorted changes
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>, Benjamin.Bara@skidata.com,
        Lucas Stach <l.stach@pengutronix.de>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Wed, Oct 7, 2020 at 8:01 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi all,
>
> The main motivation for this series is to address a PIC_RUN
> timeout, which we managed to link with a hardware bitstream
> buffer underrun condition.
>
> Upon further investigation we discovered that the underrun
> was produced by a subtle issue in the way buffer_meta's were
> being tracked.
>
> The issue is fixed by patch "5/6 coda: coda_buffer_meta housekeeping fix".
>
> Patches 1 to 4 are mostly cleanups and minor cosmetic changes.

Shouldn't the fix be the first patch in the series so that it can be
backported to stable?

Thanks

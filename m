Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 900CF365AC
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfFEUlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 16:41:17 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:42106 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEUlQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 16:41:16 -0400
Received: by mail-vs1-f67.google.com with SMTP id z11so16546071vsq.9;
        Wed, 05 Jun 2019 13:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EhtXy4UWQwP12EecpVe4mAF89wcEtevNoGW2PWVKNj8=;
        b=XzH/f0bGQr9JHNffSaN3NDiFUdpNEfh7aYqpjMqiUq16LYB77Xxozu8hBwhsuhaSB/
         d3isnhvTzK1bz7oTh+OjXNGO69DbSrFu4oDJzI8pzwhpmAMqM6QtAv+21v6TNG7qnFyQ
         fzwRtlb9VFlBZ4MvDCKiVOvaR53GbUzLgWCXxxXVCvGJL3feaiqU4H7pTsWxD9afyrkl
         gHbcBQ4vU+ZUjqA1BGGnQ5gXCWd7MrRy/po+fXivghdoC8rUkoUKE2KcNnpe9FLtdurk
         Wa9ICHl5yaoSHqo3eE32fz651T09R+ifNGfQY9t+mcsA1X+WlUuLnAkrjP7M70YloKkC
         KUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhtXy4UWQwP12EecpVe4mAF89wcEtevNoGW2PWVKNj8=;
        b=XG8AuKtII4N+pucFcmhtkq344bhMVj2AVPpAZ7tKuXH1387A2xNzQeSYgWc+Tu5S23
         rRh/wO43B3aNOcLnmB++kS3YOK0K6i2E4wajjrid4t2el91RDvGZOZvADJKCUijOuHRg
         hCR7+BsnkdHH+KZKb8VrQw3RNIXTC/ykkCXcIh6cIajMAHKzXi6fRUK4YW3z4D0RMKGV
         cnojeqAV1Sq+2HBCHo+KQifaBUt5xBaisPbKLgWRV0sUP+fhEbQEk6HLBe0lahJO3cI9
         oZR8KOLKbZJD8U8t2WtYsUxsmW7EPcGBcn1MYPouruw681VegXO877gagy6y25aD0zd5
         Pulw==
X-Gm-Message-State: APjAAAVIen+qrMs/44k6IdbyIeTD3ChWPcWTrsT0P/nuBBKNBW5Ghj3E
        gcij5XuZKzK9OKd5ZOE5AmtUDkElfInDbamFSFo=
X-Google-Smtp-Source: APXvYqwsaHTIZZ1e295x7b77gVgiPmxiSewtzvTkvz+RIRW3NkAJ1BXravjDUzEsPMM4euyle8zQouERJF/btpGDIHU=
X-Received: by 2002:a67:7143:: with SMTP id m64mr22339994vsc.131.1559767275349;
 Wed, 05 Jun 2019 13:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190605161436.3ac174f3@canb.auug.org.au> <4857750b-a4f4-8539-218c-7e9ac1a6006e@infradead.org>
In-Reply-To: <4857750b-a4f4-8539-218c-7e9ac1a6006e@infradead.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 5 Jun 2019 17:41:07 -0300
Message-ID: <CAOMZO5Db6Lh1L9Fw8QXfuQVLHq_c6Y8YBqy9_1=wjs=vSHTMjA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 5 (staging/media/imx/)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,

On Wed, Jun 5, 2019 at 4:37 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> on x86_64:
>
> ld: drivers/staging/media/imx/imx-media-internal-sd.o: in function `imx_media_register_ipu_internal_subdevs':
> imx-media-internal-sd.c:(.text+0xd1): undefined reference to `ipu_get_num'

Thanks for reporting this problem.

I will submit a fix.

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D0D5F7CE
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 14:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfGDMQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 08:16:50 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34910 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfGDMQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 08:16:50 -0400
Received: by mail-lf1-f65.google.com with SMTP id p197so4127051lfa.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2019 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1dBsomcaTZpQJ9SeOAJxw204HoA/Z9myB9VERBUW7xo=;
        b=M2EsNG8RnOmH73jjYaIwqDbeWFO1dcuBmplZJM8qzqr3SNQ6KANVZQSu2Du66QOJjo
         y7btstMzBCc55Khtw2GSkcEPzLUHJxIZ0NLE7WP7eOf0Kan3nAzIacMioqXgADatnLIN
         zNZUUklbUva5svaMz4q+9n8C39wMxRi26O/RVOpTSgk+2FzyrLZltUX7l8b5wdcc7o4p
         Em0m3UDTAUTcyZvE7zpUv5PS+fIhGd4EUjdObnbYMxagRLH8ds+CC002lAsKBOhEX41v
         9CGy/QhL3+4n6ymAVhNvJ7EJ3HOX5mfQJb7CthLY4BNRn04C+8d0S8RKz/gREW28zn/7
         aFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1dBsomcaTZpQJ9SeOAJxw204HoA/Z9myB9VERBUW7xo=;
        b=eMyMsVUmykFoiTu+ZW6j216vPBLwrSQndVjxy+/ca2nP/8zW2d4F7Ee9Hn4A1Sfull
         3r7huIuKVc872xEXdypqq4BfX4e9GdT/xD213TC+WAv7kof2bhrIync831PVLSRdScgI
         NvEnFExE83ozvkcSWXGcLSgZGefeoxRYsIeS66a4q9s4qSEVW3c6oRAGSSmqlgrpqva3
         tONFYd/K+C4nFkU8OskCsxAmGd5MGLucEg6IoKi0ABCkWVrhyFg3rDVfm8jH+9Q5dIrt
         0zU/1fBgX7VN3/RcftRvoiUEiTQIttgp5RDlmsP1WXweC5Kj7SscARg1BOGWVIhbG+9W
         gYXQ==
X-Gm-Message-State: APjAAAVOY7dpM/a8b2fPbSpZDYFn62mAvTDdq0JPoLiTMiw33GVnxT5Y
        GCRqCkL5CVYLREwvLbivSC2cJlyWfNRiScDE4Fg=
X-Google-Smtp-Source: APXvYqxeo7etUknd2C9mDvvHcEozat84KbKUPy9bEwBpAg8jwpvjNkA39Riy68BtWvwzwi0hn/DoLDpw1nlYPCngE4g=
X-Received: by 2002:a05:6512:21e:: with SMTP id a30mr10398757lfo.107.1562242608401;
 Thu, 04 Jul 2019 05:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235614.26587-1-festevam@gmail.com> <20190626235614.26587-2-festevam@gmail.com>
 <20190627162742.t2ehnbrqaorv7v6v@valkosipuli.retiisi.org.uk>
 <CAOMZO5B9KMtbc8WLfLQi6dMM-mTi3ca0WFHvEVJ6G0stEm3uWQ@mail.gmail.com> <CALrbgYGyLggYOvFjqWc84PXx=6ceubeducHvsrfvpc3w8MFP7g@mail.gmail.com>
In-Reply-To: <CALrbgYGyLggYOvFjqWc84PXx=6ceubeducHvsrfvpc3w8MFP7g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 4 Jul 2019 09:16:38 -0300
Message-ID: <CAOMZO5BzTtUA+TxZ1j+j2te3DygOhu20Vh-XCsNX3Zik_C57Qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: ov5645: Use regulator_bulk() functions
To:     Todor Tomov <todor.too@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        hverkuil-cisco@xs4all.nl, Todor Tomov <todor.tomov@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Todor,

On Mon, Jul 1, 2019 at 6:29 PM Todor Tomov <todor.too@gmail.com> wrote:

> Thank you for the patch.
> The question about using the regulator_bulk API seems to come
> regularly from time to time.
> This has been discussed on [1] and I believe the conclusion has been
> that the regulator_bulk API doesn't guarantee the order of enabling of
> the regulators. So in theory this is possible to cause problems in
> some corner cases and we have agreed to leave the order explicit.

Thanks for the explanation.

I was not aware that the regulator bulk API did not guarantee the
order of enabling regulators, so this patch can be discarded.

I think we probably need to get rid of regulator bulk API in the
ov5640 driver as well.

Will prepare a patch for ov5640 soon.

Thanks

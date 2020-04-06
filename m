Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF4DE19F821
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 16:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgDFOlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 10:41:12 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34589 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgDFOlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 10:41:12 -0400
Received: by mail-lj1-f195.google.com with SMTP id p10so14995031ljn.1
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMRUCn8rsO+bPjKn1qdcEfpo/bYh1EFDH0NFxh4JbbE=;
        b=mfr+TXU78iDq73NbT7sj0j0S0+Vl+r2prJC1kOrZfRdJodNJFZybhVcUvj/QrRSOKb
         uKbSw6WqyLZb57ys+pjUvlcPndXyEzsHhqIkcjMIOFU+BfPcXa76zabIga3r4Sq5meVv
         XTd9G66jY5EjwimjkiElBE550hxLVkIk4qQ6P/kZwKXgk+kXG2JN77XCFj2mu9Nng4by
         uAniCzgqTzL8tmFFUp7Hij3jQMdAcXWv6O/3yKtw9/OjXKe5LlJl2CTj1+QScqrt+W6+
         4X/z5W/0PqBrEGDVx31YRRhOpyHpUvY5Tzx2Rb8eWGNASkPo1ow5CifyGqBXuazNgoeT
         6gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMRUCn8rsO+bPjKn1qdcEfpo/bYh1EFDH0NFxh4JbbE=;
        b=rH3jG+qvJ+DowzDfAZ7xW2iiw6+xILrBPwKNONYoGwDpqe72IuHqz7aVBQLYdXUWZa
         85xdNcxxRfoNxbEotKJXPWBVg2prYfesA4fUGycPyfpfiDIiCsh9nw4S6BCQ3FWA46pj
         JuvOTSIPovqJIiXsvrJCQcWRzH8PTozTEACNJpm5FyfLq/81hF5nGNCgjs6XuaWagrrr
         tdMjw7o+0pKuPbnrDtWN40z9evs8ozre/+wTE7tmrxtvgwv8iyIIq8MKI4Vc0k3YbsKf
         A5C2V1i3ygqT6Pjccb7i3RHknS0E5atvliqrkt8M1dEaAegWTC1TLdjxLGkbjtOAiSsz
         qLKQ==
X-Gm-Message-State: AGi0Pua7XbYAaN4tDymTpynVP68+IJlp3OxKYOE43jpSVA8vutUvOzX6
        iRMFH4KRafSfRsArOT4UlDpWFfmOECbCSk0dunc=
X-Google-Smtp-Source: APiQypJ188rU6svptxJ91HlyWVWl94vuFQDl3ZXSyggPk3lDRguh8+3XLXQVsPseFRjh0psdTHQS9LkZfvtcVBykjnk=
X-Received: by 2002:a2e:9819:: with SMTP id a25mr4177482ljj.288.1586184070321;
 Mon, 06 Apr 2020 07:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
In-Reply-To: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 6 Apr 2020 11:41:33 -0300
Message-ID: <CAOMZO5CUf5aqaqzTJDjQa1scK1vKQR5YJb40a+TET7dzVRJDLQ@mail.gmail.com>
Subject: Re: imx6: Cannot register mem2mem
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 6, 2020 at 10:37 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am running kernel 5.6.2 on an imx6qp sabresd, but I cannot get the
> mem2mem element from imx-media-csc-scaler.c to probe.
>
> I don't see imx6_media_probe_complete() getting called, hence
> imx_media_csc_scaler_device_init() is never called and no mem2mem
> element is registered.
>
> Any ideas as to how to get mem2mem registered on i.MX6?

It seems that v4l2_async_notifier_can_complete() is always false, so
v4l2_async_notifier_call_complete() is never called.

If I change it like this:

--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -213,10 +213,6 @@ v4l2_async_notifier_try_complete(struct
v4l2_async_notifier *notifier)
        if (!notifier->v4l2_dev)
                return 0;

-       /* Is everything ready? */
-       if (!v4l2_async_notifier_can_complete(notifier))
-               return 0;
-
        return v4l2_async_notifier_call_complete(notifier);
 }

Then the mem2mem driver can be successfully probed:

[    4.601350] imx-media: Registered ipu_ic_pp csc/scaler as /dev/video11

Any suggestions?

Thanks

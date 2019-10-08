Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A05CEFFA
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 02:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfJHAql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 20:46:41 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:36054 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJHAqk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 20:46:40 -0400
Received: by mail-lf1-f46.google.com with SMTP id x80so10605400lff.3
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 17:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EMgkUv8tiwcm8RfuaXrSf8LjONxeFRaFW/qBoEfrN+0=;
        b=XQvrOnIH6KEv4+q1dZF1+iSV9ZVFvigVo/z0UqyWwxgv9Q+6Hm37NVM/5TPWdh4yhM
         2bEO8WAkfmD1PcplhOuy2gKwHhm8zqjpt1SALYDQK20yCJ6yMc2PDQf7frun9xLBDtEm
         dQR9uv8CKwKvhPvbrKuCLhSiNzlnSBN7y/jliv8EtJeD2flG39389sbaruVpDA1BJoZH
         Hxb8i7s+dCGEUsmNFgPJoEeIc8cfPylm5T/lZkLLWgZdlYoaOnRkQQPGnWV7iA3mz4Le
         Qc0Vlh9Tp9aTp522QN0TryiUlRjvx9KzzbzPJeFehqUlm0IMRvMHobbOAVrGMTTpnstZ
         A+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMgkUv8tiwcm8RfuaXrSf8LjONxeFRaFW/qBoEfrN+0=;
        b=pZZ+B4eqDVyLfkqFMcrwg8A2AP19zps0rRbSV6hK/9gSn5QBP534X5WUdAODH/lSe6
         9IESEN8AX5jYYwtKsMH1dpiaGSxvf7KZcdVzdqwL6sX5v17hrLrpSGtUNJn70vAcnvwe
         JhZxHmuBqN2bC6j7RKLOZK1lkHDbZp3pmX4jpF91dWd5rWKg2gJaPWcE949yjydk/eK0
         Wr8lM+Ot8rUleLq/m2jDHEvc3RnbfCD3s/0EyxdCLaPEZGEfubQvItBak3FPuOoMV3hq
         zoff3IxC0XZbsmnXPL0ZdO1fLZpLiHljL2t7yFn3sh3/ECa0xo0IUYn9Pdv7osjlLQds
         mt3Q==
X-Gm-Message-State: APjAAAX3Dv5Ps4DGFjq9JATL78p6f1Lk0R2UYK37zJ2CFOvdPbS/3/+9
        BayI/kryd6FoGCpmiZQVlKHGBrhHtXG9PSDJm2M=
X-Google-Smtp-Source: APXvYqzfjn4K4f3gd0VERbSe1XT3gBORfNQ5Hiv64Qk0LzC/xRK5LttLieJBj4R55Zl7vM0mu5n/Hbp4vD272fCS0DM=
X-Received: by 2002:a19:6556:: with SMTP id c22mr18160693lfj.90.1570495598723;
 Mon, 07 Oct 2019 17:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
In-Reply-To: <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 7 Oct 2019 21:46:27 -0300
Message-ID: <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Mon, Oct 7, 2019 at 9:37 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> The adv7180 driver in 5.3.x doesn't support seq-bt, only alternate. So
> pad format should be "[fmt:UYVY2X8/720x240 field:alternate]".

Thanks for the suggestion. After changing to field:alternate I get:

# gst-launch-1.0 v4l2src ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
'/dev/video0' does not support progressive interlacing
Additional debug info:
../../../gst-plugins-good-1.14.4/sys/v4l2/gstv4l2object.c(3813):
gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants interleaved interlacing
Execution ended after 0:00:00.020459489
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...

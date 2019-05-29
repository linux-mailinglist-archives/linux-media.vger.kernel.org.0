Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B83F2E809
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 00:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfE2WTf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 18:19:35 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37330 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfE2WTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 18:19:35 -0400
Received: by mail-vs1-f68.google.com with SMTP id o5so3117214vsq.4
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mxeKNukw6HODAhd0dhvcTdWfCOKofPGW+kW+R49bnM=;
        b=Lzyw13sQ+H1pfkaWrXuv1DalnwMfX1Kyailk0ZgAdQsgs98keltZCz4/VCmRLvLIvv
         E1nn1c9nCadusCs/zmvNgjbo1sHmD4dH+XeOqUcPcbJ45GRX8cXx8rnZz9xQmqOLKrCk
         wxeQ/vd1xiM2atpUaThCDzusYT74Lrxkb1zMJ+5a2If8wyoFi79V6PeCY2OFaQ7ntJtS
         8+5JzMQnTvQ65kQdLnyikC33rlqIdrx6Wbr0E/oHieKWdF7KpZlz6cDt++pgY6Uz2MVM
         LChYZs9y7W/Dci/ldvb0Ypt1E+XKoTqNmXKOaQHFP9futQP6AirefyIJ+gMvdZ1pnViN
         plPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mxeKNukw6HODAhd0dhvcTdWfCOKofPGW+kW+R49bnM=;
        b=PQAfjRmKkLh5Bx69IdvnnMT1motaIecq266SFA3B3bBrthBwdGbfNit4FvC92FnDMJ
         7f5P6F1IPudYlYhWShF+pKzErNL8HR/ekBqAaD5CTW7f3DZjz6sKwxF07vN0LRQHhamX
         99JYV97sSwxvB2x5dfNAFdZ+IN8relpd/udirDJWbhVvuDfokWgXC0Yu/x7J6ydBarAS
         gB6WI9q/BXeHq1OgyZ7g/HHSJVkoVL1a8lXaARDCUD67oSiNILO4fXaOtk/lhDVwGdqM
         TmRHUbJDDpQo5xzCjTEA+BenRMx4IAyHvhgqY7XuWjFtZ6V88cIpPMLv94OWL6GnXn69
         m48g==
X-Gm-Message-State: APjAAAVG8xoY4BZo9kiO4urqpc/p8gu00PtPYIN4ZbTZmidTB1lwCI4/
        JLcZzpqQp+ng+WJR/DQzLdHW58obIvNGOq5B2kA=
X-Google-Smtp-Source: APXvYqxB6jtWDIClba7L3XkDzU4t1LbrtFyf+fMpdYS3tiaYaO3T52w5/YluI8vtUBagp/VcNyployVXQ1Wul4I++M0=
X-Received: by 2002:a67:7143:: with SMTP id m64mr78695vsc.131.1559168374081;
 Wed, 29 May 2019 15:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
In-Reply-To: <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 29 May 2019 19:19:23 -0300
Message-ID: <CAOMZO5AjvxR0LZQe2odVh29JtpkRkHJN5NwfUaA-wB-Fm0k_vQ@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

On Wed, May 29, 2019 at 5:55 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:

> I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.
>
> Performance is still much worse than the Freescale baseline.
>
> I am not at all worried about vpu scaler performance, after all v8 is an
> in-progress patch.
>
> I am much more concerned about the CODA h264 slowdown. My 1080p30 test
> video runs at half the speed compared to the Freescale kernel. The best it
> can do is 28fps, which results in visible 'jerks' in the video. Note that
> this is without using the scaler.
>
> Questions:
> - is the performance slowdown a known issue?
> - is there anything I've missed in the gstreamer pipelines below?
> - is there anything I can do to help?
>
> A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
> $ time gst-launch-1.0 filesrc
> location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux !
> h264parse ! v4l2h264dec ! kmssink can-scale=0 sync=0
> real 0m 32.01s

In my tests I had to pass 'capture-io-mode=dmabuf' to get a smooth
video playback.

Please check the explanation from Philipp at:
http://gstreamer-devel.966125.n4.nabble.com/IMX-Scaler-CSC-m2m-driver-td4671175.html

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D3F2E6AE
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 22:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfE2Uzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 16:55:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45094 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfE2Uzf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 16:55:35 -0400
Received: by mail-ot1-f67.google.com with SMTP id t24so3447425otl.12
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YKMosVB2QL4Mqyc2CmzYDhT4j5dORdWOg5byve2F4Wo=;
        b=j+pZzPy/ZJP7qUr4gFNwpVaTAIKMxKK5GA9Um5wHCw6wcYgnGq2CWHBY5Onvm6FiQp
         3GCs15hS53TvgcG6Sky4ZMTN9I5QWB61A4Qx0GWaJf9+ppsusuLdZOYsZLv9+o8QiWEf
         mccnc+7UZcPD+gbEKWP4uvT5V8kzr2/GY6FIjI4vcxYDNVxMYUDjT718vPsWPj+9tTnD
         YJR6pDmb6+mfoGhe7oMcKqLeWlciQJHV5vZbnlwdCTodFria9cVPaJWK8I0GIvaSrVXQ
         87tTBJ40otQzIPrIpdo1KYWbP35BAOVLh7YyWX9wzVZYIl4kWhxE9rvjGuwqO2RJfXmJ
         YhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YKMosVB2QL4Mqyc2CmzYDhT4j5dORdWOg5byve2F4Wo=;
        b=tgApYV24syiXizu7/Wz2BoMwiLUv4Y4PPDsB44K2qzD3wIgHrumUE26qlhQZsh0Jaf
         rOOjMl+U+jFWV6oCDC7hKXO0ZiyKCyaFzwzuWL2gqObS7TZqmgj8ny8cId3LcL40JSz8
         srKYU/q45an15TcTMgHVlRoEObEapeqrHjziFUaaSwZUHFdnpWndv9lcpcCjpJr0fhpi
         HvNW083LiyOlmF6ueIkV3Y7z7AXwNGZkOfTPUBJBK64mqyzMnWMhEZeSCgSFG7+jc+c0
         h7yKp0KO+8U8lN7NhDBQvzAY/jwCLT5mqDa4PTqzf6wWVO7s6m3Bazpzd7DcmlP27MN8
         epsw==
X-Gm-Message-State: APjAAAU6z2er6Nko/Cks5+FAVDuQAHN9+YLpTXvwu9Gr7NXX++fklCRy
        6N0AUIcVoY4npoYfOXxV44ljZ925y7dqst20XtM=
X-Google-Smtp-Source: APXvYqzBrJ7tggMPqZ9dOel6K98oco7CysqQwQJHZY7gfwjXpZjRdWNmtIS8shGyDxyRSnVAr5P6Eqnw9pKFXh/XPgw=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr31348087oto.224.1559163334497;
 Wed, 29 May 2019 13:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 29 May 2019 16:55:23 -0400
Message-ID: <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Philipp and Fabio,

On Wed, May 29, 2019 at 12:53 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Does this patch from Philipp fix the problem?
> https://git.pengutronix.de/cgit/pza/linux/commit/?h=imx-drm/fixes&id=137caa702f2308f7ef03876e164b0d0f3300712a

I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.

Performance is still much worse than the Freescale baseline.

I am not at all worried about vpu scaler performance, after all v8 is an
in-progress patch.

I am much more concerned about the CODA h264 slowdown. My 1080p30 test
video runs at half the speed compared to the Freescale kernel. The best it
can do is 28fps, which results in visible 'jerks' in the video. Note that
this is without using the scaler.

Questions:
- is the performance slowdown a known issue?
- is there anything I've missed in the gstreamer pipelines below?
- is there anything I can do to help?

A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
$ time gst-launch-1.0 filesrc
location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux !
h264parse ! v4l2h264dec ! kmssink can-scale=0 sync=0
real 0m 32.01s

B) Freescale kernel:
$ time gst-launch-0.10 filesrc
location=/home/default/jellyfish-10-mbps-hd-h264.mkv ! decodebin !
mfw_v4lsink sync=0
Running time 0:00:14.781129554 render fps 59.941

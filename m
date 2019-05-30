Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F52530471
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfE3V7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:59:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38444 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfE3V7Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:59:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id s19so7183588otq.5
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U58pfpDsRofxHqxnUaKCYBB7e9RDYJThRvdjVgqxrCk=;
        b=S9eXJfZusE4Ncy72dEfa3qGKl7k0BfrWf4NqHgQa967nKllQc7fmQ+lMhZxkoCt1sW
         JXXsHGxh5pqFq/SY82aEzKr9XBtpxAbBkQo8uAU22R7imcmL6efWuKnt1B7UT8keiz4h
         tQo+J0kaadwL8wGxkH7HLJx0o7ESRBEdSxEdiu68IqlWQfgR5u4tBDpsKLjHOGrTmxMu
         7nOK/yMCOWUW2fj/UGLaceFLaldx2BUO5cI/eu749p0n3XjYj5hZB99x7IIlqn3k5AGU
         OJH0ofWMqn1gzgPn2RV39KWfbv/wghWs9mh6R59oRpHcxNOB2IUe+ojQhwvlMztjyZHR
         pIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U58pfpDsRofxHqxnUaKCYBB7e9RDYJThRvdjVgqxrCk=;
        b=Nf/h4SWgOyP4IAd+p5K/I0z+9lkXPaxVHWZZ2W8imguNHp7gAIRwsnD4yFEbwlMxNI
         WPTDoXjrLNzuBk/BwILgLrEsoXI3wazcOi24bCtdQsv4WS/68ItmWOEau+o8Kip/sI8R
         SpZQzo7H+eEUQ3omgnvjvfU2wVXDwM8dViXTmt/ihx4Atzpv1dxFjY5CPyRmwzLoTqnn
         A4+Fyv0tRfbu3i03Tzg3hE0h9fA3h2JcgL7/P4PjOksbhFl18ViN83l+79i5wmGaX1+9
         SDNIhnDr4qTl88S9QpjtEJsXgGlvVIBZCkxt08aMUZEgZe1G3a/oOSCYLhnbOpsiGEAD
         gB+w==
X-Gm-Message-State: APjAAAXvLweIxIv557gtafHdtO60i96D6/vY2pMfyuBI9Ut9GlYtY8sy
        i5cdQ26Y79faVYlIaROBrn9WkcSqMK8vnDP4F82msLb1
X-Google-Smtp-Source: APXvYqzYB7AFwxqSumrziyshC2LCBBoDbQ2IzAwAzcK6Uh6kiDExieuqspqxuSIDeKDcL/3Ww8xKEpdTxbKjoVMDQis=
X-Received: by 2002:a9d:6e0f:: with SMTP id e15mr4605038otr.0.1559252089416;
 Thu, 30 May 2019 14:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com> <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
In-Reply-To: <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 30 May 2019 17:34:38 -0400
Message-ID: <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Nicholas and Fabio, thank you so much for your help !

On Thu, May 30, 2019 at 5:09 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Just for your information, I tested with this pipeline, with kernel
> "5.2.0-rc2-00024-gbec7550cca10":
>
> Execution ended after 0:00:12.860395248

I noticed that my mainline kernel was using imx-sdma firmware from ROM,
but the Freescale kernel was downloading version 1.1 from the filesystem.

So after d/l-ing the latest imx-sdma firmware and adding that to my
4.19 mainline kernel, my performance is now identical to yours !
Fantastic !

# dmesg | grep imx-sdma
[    1.202715] imx-sdma 20ec000.sdma: loaded firmware 3.3
# time gst-launch-1.0 filesrc
location=/home/default/jellyfish-10-mbps-hd-h264.mkv !
matroskademux ! h264parse ! v4l2h264dec ! fakevideosink sync=0
Execution ended after 0:00:12.851651008

Unfortunately I cannot load any imx-sdma firmware on the latest mainline
kernel. Right after the firmware is loaded, reads seem to get corrupted
and the whole kernel crashes / hangs.

I am currently bisecting to find the offending commit:
v.4.20 good
v5.0 bad

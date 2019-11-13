Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B780AFAA30
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 07:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKMGay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 01:30:54 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38985 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfKMGay (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 01:30:54 -0500
Received: by mail-ot1-f66.google.com with SMTP id w24so194654otk.6
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2019 22:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCjB/6F99zqoN4KoTxmWPg28xMT44B2/glemKgEW/uQ=;
        b=DkYCtpQVgFOXZJu36bTIb40Q7m2L6QD+ubRypA5YOyBi7LMMeC5uL0cxhy4BZ37KDE
         ssTJ0NRw18RSRUwqx/aOlsuEPGks2IsKwE98u82XkN3EVtr0G3JuZ2s7yVdxN/F0LQwJ
         2YQLwc5pMeXsLt2SeqK9X+ktPI7xhxDQIg/VTiQ2dgj1nhdq1VUa9RldG5pv4ts2eMLn
         CdHSIsGlCVdlMr85yZCDsSxsd8BiYnovpvFbwtMv014dkA410RotoI0rGS57HhDlN4tJ
         bpSwuf9Tcr0o2AePlOVqcLXt560UTn+nC43wPQvDvIOZ227jDBcS/ukhrXRcBy892/QK
         0/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCjB/6F99zqoN4KoTxmWPg28xMT44B2/glemKgEW/uQ=;
        b=dd/yE0HCpMMhTu9Tg+gsgcXRrPUb3cVf1iupVvnmYTgT6NSuwbW5jpuafB92V4k5Nx
         pik3MjKP5Qigrfk5ydeo1BVF+UMSxJPK/+mpsU29L8xqCwlCoZ6n8sKpmBsABT8E+Smy
         r+6jROcPq3RJzCqbr2zEZCpE/gMW65GHILHB134qy2c5sQmAwCvbxmXARzVljW5sRiAH
         kiclm0dzLIXTlBALo7DKCxYd/xd3iKD+TuoQEWc5By8cdOzGnCcJzM1gznHBX2uXwm5N
         jWhImZcwe/9tjh+r7ALnQsGlR62XdwL/ZMkKpAa4ji04ICNKJW1dpD4n5NdROp6x7wpl
         RUig==
X-Gm-Message-State: APjAAAU7hR03kLFwUNlV/62NRmyaEUY6ug+LhP9aliUUu3QvND04rmkM
        gxHzlTUYnux45tsmpJXCoExQFeHr6As9uw6XQh2tRg==
X-Google-Smtp-Source: APXvYqytGZusgOyy+wmPXlbhOEUWov4yMKH2sjFoZwLqmZWnIqaGuENf8EFwEQFt2109WRsiroqEFRduBsYqTAECeUY=
X-Received: by 2002:a9d:5c07:: with SMTP id o7mr1486817otk.33.1573626651864;
 Tue, 12 Nov 2019 22:30:51 -0800 (PST)
MIME-Version: 1.0
References: <CAPBb6MWXj+PNbJ0_m6O6wnYf6Z9NcYwr49qbSowG66NB-23k2g@mail.gmail.com>
 <20191112115343.1b1908ce@collabora.com>
In-Reply-To: <20191112115343.1b1908ce@collabora.com>
From:   Alexandre Courbot <acourbot@google.com>
Date:   Wed, 13 Nov 2019 15:30:40 +0900
Message-ID: <CAPBb6MVmUAmp5kmtqOx=V=1NJHyDyK28FD=rtoZEXdXvfZ2-9g@mail.gmail.com>
Subject: Re: H264 stateless reference frames ordering lists
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 12, 2019 at 7:53 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Alexandre,
>
> On Tue, 12 Nov 2019 19:14:22 +0900
> Alexandre Courbot <acourbot@google.com> wrote:
>
> > Hi Boris and Ezequiel,
> >
> > Patch c3adb85745ca6 has removed the ref_pic_list_* members from the
> > v4l2_ctrl_h264_decode_params struct. The MT8183 stateless decoder
> > driver I am working on still relies on these lists and I am trying (a
> > bit late to the game) to remove them from the Chromium OS kernel UAPI
> > in order to match upstream.
> >
> > I have dug into the discussion that resulted in this removal and could
> > not really find how these are supposed to be reconstructed and on the
> > basis on which information. The commit log for the above-mentioned
> > patch mentions that "generic helpers will be provided for drivers that
> > need this list". I could not find any in the kernel so far, do you
> > have any code available at the moment? Or any idea on how these can be
> > reconstructed? The process seems to involve reading the DPB itself as
> > well as reordering information from the slice parameters, and seems to
> > be a bit involved to be done in the kernel, but maybe I am missing
> > something here.
>
> The code is here [1], and it should indeed be extracted and put in a
> generic v4l2_h264 lib at some point (should happen soon, since we need
> the same logic for the rkvdec driver).
>
> Let me know if you have any questions.

Thanks - not sure how I missed it. I have tried adapting the code for
MT8183 and it seems to be working perfectly there as well.

Regarding the lib to make this code available to other drivers, I was
thinking about doing it on top of
https://patchwork.kernel.org/patch/11076405/ but is this patch still
being worked on?

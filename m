Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78ADD2F49EF
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 12:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbhAMLVp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 06:21:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbhAMLVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 06:21:45 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB18C061794;
        Wed, 13 Jan 2021 03:21:05 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id a9so672185ybn.9;
        Wed, 13 Jan 2021 03:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8EVbvCtl9PmUOlq0jo+O/+7pKifzumAbXxH2B8FMID4=;
        b=GHq+I+a3wfYULS/IOzQvGr8EB0tnXNPfPX/OZlLyHX9yoW+0C9zA8D3eiK8Ydd/acn
         8Pho7MVTGLzwVUcfSapKsjDDjR+RXjy2iZC0TTOXyQrXeuW0R9+gKxPOL+b3Qyl3i6Md
         ZwJ6tpra43P31FjuhE35VYWM4OiUhDUVowmI0Gw7oRgxGsP1lduMWSF+fTrNeffEkXRC
         ruiZAT3AirZ3oG+SeCw/SiFe/jbAdI6YKCb6bh+mr4jhFkqMjM208iHETTkV0EduZ/hA
         QCm0o7AJC9w0JjynZAo0vBA/belopyFsPpos0/4V7PXyAkzoznCIkHkM/KfTOaKSoEEP
         ZqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8EVbvCtl9PmUOlq0jo+O/+7pKifzumAbXxH2B8FMID4=;
        b=qHnXJH1Qvh3jOcSu/KWD2ml1cnMkqhkmWc0xwHYGfeHYkEwvPUetcgRVh0lKjEqLnK
         cuAmc3Zh4P0CPNMFZJ7J0sPyDzhEgj9IrMHcMlNQfBYbh2ApUiOq9Pj9XTxvda0Ye76E
         5xJe3Lssnvp1cNAjuHsOTEsx//zhVERiBi4qXQgQ8+A5p7/aLPTyhVDJN1/Yc1IvGde9
         Xc2EJ3KthK7LCob3vDchHddXWWBLiSMZLyqwOSb2tAYrSUWc07vVt5mHvokdqR+iAkUU
         ADn0fRywxyeiU8b0hGkL7ePEq0hbHXkbfdWJC3luKuKkD8OESi2sJejzoaxtjor/a0Qe
         kyFg==
X-Gm-Message-State: AOAM533RWPi2GNB2/vKHfBePp+2S7Cy+0272QDW4sXRgBBIdlL1Ri3XX
        vFZSwEnB3FOJftqv95cURAG7MgqsOiu6JR11HNg=
X-Google-Smtp-Source: ABdhPJzhmPgs2jD8F7hyuKZAycQ7RslAcwKkTIHQNTjC+BEb/NdGTOwHCSxwItTohqo7zvRbyYMqHyEN+0KXqnGg7LU=
X-Received: by 2002:a25:df05:: with SMTP id w5mr2596834ybg.477.1610536864366;
 Wed, 13 Jan 2021 03:21:04 -0800 (PST)
MIME-Version: 1.0
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
 <X/6mhQfPRt0QoorO@kroah.com>
In-Reply-To: <X/6mhQfPRt0QoorO@kroah.com>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Wed, 13 Jan 2021 19:20:38 +0800
Message-ID: <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 3:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 13, 2021 at 01:04:44PM +0800, =E6=85=95=E5=86=AC=E4=BA=AE wro=
te:
> > Hi developers,
> >
> > I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> > "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
> > same root cause.
> > The reason is that the PoCs after minimization has a high similarity
> > with the other. And their stack trace only diverges at the last
> > function call. The following is some analysis for this bug.
> >
> > The following code in the mceusb_process_ir_data is the vulnerable
> > -----------------------------------------------------------------------=
---------------------------------------------------
> > for (; i < buf_len; i++) {
> >      switch (ir->parser_state) {
> >      case SUBCMD:
> >              ir->rem =3D mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> >              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> >                                                    ir->rem + 2, false);
> >              if (i + ir->rem < buf_len)
> >              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> > -----------------------------------------------------------------------=
---------------------------------------------------
> >
> > The first report crashes at a shift operation(1<<*hi) in mceusb_handle_=
command.
> > -----------------------------------------------------------------------=
---------------------------------------------------
> > static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
> > {
> > u8 *hi =3D &buf_in[2]; /* read only when required */
> > if (cmd =3D=3D MCE_CMD_PORT_SYS) {
> >       switch (subcmd) {
> >       case MCE_RSP_GETPORTSTATUS:
> >               if (buf_in[5] =3D=3D 0)
> >                      ir->txports_cabled |=3D 1 << *hi;
> > -----------------------------------------------------------------------=
---------------------------------------------------
> >
> > The second report crashes at another shift operation (1U << data[0])
> > in mceusb_dev_printdata.
> > -----------------------------------------------------------------------=
---------------------------------------------------
> > static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int bu=
f_len,
> > int offset, int len, bool out)
> > {
> > data   =3D &buf[offset] + 2;
> >
> >           period =3D DIV_ROUND_CLOSEST((1U << data[0] * 2) *
> >                         (data[1] + 1), 10);
> > -----------------------------------------------------------------------=
---------------------------------------------------
> >
> > >From the analysis, we can know the data[0] and *hi access the same
> > memory cell - ``ir->buf_in[i+1]``. So the root cause should be that it
> > misses the check of ir->buf_in[i+1].
> >
> > For the patch of this bug, there is one from anant.thazhemadam@gmail.co=
m:
> > -----------------------------------------------------------------------=
---------------------------------------------------
> > diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> > index f1dbd059ed08..79de721b1c4a 100644
> > --- a/drivers/media/rc/mceusb.c
> > +++ b/drivers/media/rc/mceusb.c
> > @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> > mceusb_dev *ir, u8 *buf_in)
> >   switch (subcmd) {
> >   /* the one and only 5-byte return value command */
> >   case MCE_RSP_GETPORTSTATUS:
> > - if (buf_in[5] =3D=3D 0)
> > + if ((buf_in[5] =3D=3D 0) && (*hi <=3D 32))
> >   ir->txports_cabled |=3D 1 << *hi;
> >   break;
> > -----------------------------------------------------------------------=
---------------------------------------------------
> > I tried this patch in the second crash report and found it does not
> > work. I think we should add another filter for the value in
> > ``ir->buf_in[i+1]``.
> >
> > With this grouping, I think developers can take into consideration the
> > issue in mceusb_dev_printdata and generate a complete patch for this
> > bug.
>
> Why not create a patch yourself and submit it?  That way you get the
> correct credit for solving the problem.
>

I have sent a simple but working patch to the corresponding
developers. We can take it as a base to discuss.

And this email is to provide some information about bug duplication
for developers as I am doing some research on crash deduplication. I
want to get some credits if our grouping information is useful for
some kernel developers.

> thanks,
>
> greg k-h

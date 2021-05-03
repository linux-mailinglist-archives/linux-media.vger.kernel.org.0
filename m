Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F02371438
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 13:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbhECLZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 07:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhECLZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 07:25:57 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02945C06174A;
        Mon,  3 May 2021 04:25:04 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id n25so5843460edr.5;
        Mon, 03 May 2021 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=knt6vWHo3Uj9cGiLX5t1iWlkbrbmGDexPXvsirP3gBU=;
        b=f2pNQmGBJ6vwotjefwr4TVubUxj1ShRHQ8lp33DYsNEd96igYago331AQsECObh3vm
         0cm1/uoQ2pP45jTG8JtFoMZiGsxP1g4F8GIES/gY/Rk1zHwN3tD5JWSv26/Tx02iVGNn
         41lHeiJLkvHNdt9eXebNgyKIDD8a8zW7F1JI8trWPG6n1S/BhjVLV1Rx9RLKhd9WnDmo
         wCdlQzSKhkp2Oi1+W9BB9T5T/HxTpjpopvTQKEAoFwloe5sV1GgytTB9owgULXU0Zs3o
         QuD7IFjBC56raoDEjZAxiFpGI+MObX3P83WAKePAeGpNF9ulGhhwg0l1YvpLKf7Qi6RS
         lDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=knt6vWHo3Uj9cGiLX5t1iWlkbrbmGDexPXvsirP3gBU=;
        b=I18cqZYfDS9MVA5o8HNGarwg8f/K4wLZ9uJ1zxY1RjH0ADFI0Tafp+LHd7joXQCMlV
         fIhfZi54bi8Uwygg9aE6cxGAZS6mcpNbuB/pDpGa+Qph5j1Ifcya50MY+L0UvXcuu3kW
         WlP/aL4Yg/KSTfmduyeMR1Fd1wb2psK2+lrtqFBKS8dzc/u3AWt7SsBoBNzEDsssfgRi
         zPD9xSki5p8WJVoakOByftrB6Fee6V7ck5vYo4eCrezR7vZBGXk/WzF1ecJ+883CBvLG
         7hgKFCPq86hzdvA2gCuBobrUDdWaQnV/i1wRgKP5ZLODv/xAsNNTJ6nFeqBOlUPD0HP8
         J80g==
X-Gm-Message-State: AOAM5323MjS5L96THNor10UBHg8lQ9G4pRy5Nrnu4XYiK2ylwZIkInYX
        3EFiYYiUFS8OVo3qvU8DVsityTsE8i5h0n22AN0=
X-Google-Smtp-Source: ABdhPJwHpkaeRli5zjAXGUwE14KSNbe06Zvd0kVdpMDN92faWlCGm5CTXez0U+RbEqSPOQWw/riS2U0Mifuk6JeScMI=
X-Received: by 2002:a50:f41a:: with SMTP id r26mr16398820edm.339.1620041102625;
 Mon, 03 May 2021 04:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
 <X/6mhQfPRt0QoorO@kroah.com> <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
 <CAD-N9QVAaVozZuPSG9YKjEYreRX3PEoW0UM3Dwhko_-tVTpK0Q@mail.gmail.com> <20210503092803.GA15275@gofer.mess.org>
In-Reply-To: <20210503092803.GA15275@gofer.mess.org>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Mon, 3 May 2021 19:24:35 +0800
Message-ID: <CAD-N9QVAKD3eVghy_Lj-aTnkB51NhWTci2gtBJZOnKsE6J3u=w@mail.gmail.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
To:     Sean Young <sean@mess.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg KH <gregkh@linuxfoundation.org>, jr@memlen.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 3, 2021 at 5:28 PM Sean Young <sean@mess.org> wrote:
>
> HI,
>
> On Sun, May 02, 2021 at 10:29:25PM +0800, =E6=85=95=E5=86=AC=E4=BA=AE wro=
te:
> > Hi kernel developers,
> >
> > I found one interesting follow-up for these two crash reports. In the
> > syzbot dashboard, they are fixed with different patches. Each patch
> > fixes at the failure point - mceusb_handle_command  and
> > mceusb_dev_printdata. For patch details, please have a look at the
> > crash reports [1] and [2].
> >
> > Recall the vulnerability below, and kernel crashes both at the case
> > SUBCMD with incorrect value in ir_buf_in[i+2]. I still think they
> > share the same root cause and fixing this bug needs two patches at the
> > same time.
> >
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
> > I wonder if developers can see two crash reports in the very
> > beginning, they may craft different patches which fix this bug in the
> > root cause. Meanwhile, if developers can see those crash reports in
> > advance, this may save some time for developers since only one takes
> > time to analyze this bug. If you have any issues about this statement,
> > please let me know.
>
> I am sorry, I have a hard time following. As far as I am aware, the issue
> with mceusb_dev_printdata() have been resolved. If you think there is sti=
ll
> is an issue, please do send a patch and then we can discuss it. As far as=
 I
> know there is noone else working on this.

Hi Sean,

Sorry for the bad logic. Let me organize my logic about these two
crashes and the underlying bug.

First, let's sync on the same page. In this thread, I would like to
prove to you guys these two crash reports share the same root cause -
they both miss the sanity check of the same field from user space.

Second, if you agree with the first point, let's move on. If we can
know the duplication information before, you and James Reynolds, who
fixes another crash at mceusb_handle_command do not need to analyze it
twice. And I think either your patch or the patch developed by James
Reynolds only fixes the crash reports at the failure point, without
completely fixing the underlying bug.

Please let me know if you have any questions about the above text.
Thanks in advance.


>
> This mceusb_dev_printdata() function has been very troublesome, maybe it
> could be written in a different way.
>
> Thanks,
>
> Sean
>
> >
> >
> > [1] UBSAN: shift-out-of-bounds in mceusb_dev_printdata
> > https://syzkaller.appspot.com/bug?id=3Ddf1efbbf75149f5853ecff1938ffd313=
4f269119
> > [2] UBSAN: shift-out-of-bounds in mceusb_dev_recv
> > https://syzkaller.appspot.com/bug?id=3D50d4123e6132c9563297ecad0479eaad=
7480c172
> >
> > On Wed, Jan 13, 2021 at 7:20 PM =E6=85=95=E5=86=AC=E4=BA=AE <mudonglian=
gabcd@gmail.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 3:51 PM Greg KH <gregkh@linuxfoundation.org> =
wrote:
> > > >
> > > > On Wed, Jan 13, 2021 at 01:04:44PM +0800, =E6=85=95=E5=86=AC=E4=BA=
=AE wrote:
> > > > > Hi developers,
> > > > >
> > > > > I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> > > > > "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share=
 the
> > > > > same root cause.
> > > > > The reason is that the PoCs after minimization has a high similar=
ity
> > > > > with the other. And their stack trace only diverges at the last
> > > > > function call. The following is some analysis for this bug.
> > > > >
> > > > > The following code in the mceusb_process_ir_data is the vulnerabl=
e
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > > for (; i < buf_len; i++) {
> > > > >      switch (ir->parser_state) {
> > > > >      case SUBCMD:
> > > > >              ir->rem =3D mceusb_cmd_datasize(ir->cmd, ir->buf_in[=
i]);
> > > > >              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> > > > >                                                    ir->rem + 2, f=
alse);
> > > > >              if (i + ir->rem < buf_len)
> > > > >              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > >
> > > > > The first report crashes at a shift operation(1<<*hi) in mceusb_h=
andle_command.
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > > static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_=
in)
> > > > > {
> > > > > u8 *hi =3D &buf_in[2]; /* read only when required */
> > > > > if (cmd =3D=3D MCE_CMD_PORT_SYS) {
> > > > >       switch (subcmd) {
> > > > >       case MCE_RSP_GETPORTSTATUS:
> > > > >               if (buf_in[5] =3D=3D 0)
> > > > >                      ir->txports_cabled |=3D 1 << *hi;
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > >
> > > > > The second report crashes at another shift operation (1U << data[=
0])
> > > > > in mceusb_dev_printdata.
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > > static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, =
int buf_len,
> > > > > int offset, int len, bool out)
> > > > > {
> > > > > data   =3D &buf[offset] + 2;
> > > > >
> > > > >           period =3D DIV_ROUND_CLOSEST((1U << data[0] * 2) *
> > > > >                         (data[1] + 1), 10);
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > >
> > > > > >From the analysis, we can know the data[0] and *hi access the sa=
me
> > > > > memory cell - ``ir->buf_in[i+1]``. So the root cause should be th=
at it
> > > > > misses the check of ir->buf_in[i+1].
> > > > >
> > > > > For the patch of this bug, there is one from anant.thazhemadam@gm=
ail.com:
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > > diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.=
c
> > > > > index f1dbd059ed08..79de721b1c4a 100644
> > > > > --- a/drivers/media/rc/mceusb.c
> > > > > +++ b/drivers/media/rc/mceusb.c
> > > > > @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> > > > > mceusb_dev *ir, u8 *buf_in)
> > > > >   switch (subcmd) {
> > > > >   /* the one and only 5-byte return value command */
> > > > >   case MCE_RSP_GETPORTSTATUS:
> > > > > - if (buf_in[5] =3D=3D 0)
> > > > > + if ((buf_in[5] =3D=3D 0) && (*hi <=3D 32))
> > > > >   ir->txports_cabled |=3D 1 << *hi;
> > > > >   break;
> > > > > -----------------------------------------------------------------=
---------------------------------------------------------
> > > > > I tried this patch in the second crash report and found it does n=
ot
> > > > > work. I think we should add another filter for the value in
> > > > > ``ir->buf_in[i+1]``.
> > > > >
> > > > > With this grouping, I think developers can take into consideratio=
n the
> > > > > issue in mceusb_dev_printdata and generate a complete patch for t=
his
> > > > > bug.
> > > >
> > > > Why not create a patch yourself and submit it?  That way you get th=
e
> > > > correct credit for solving the problem.
> > > >
> > >
> > > I have sent a simple but working patch to the corresponding
> > > developers. We can take it as a base to discuss.
> > >
> > > And this email is to provide some information about bug duplication
> > > for developers as I am doing some research on crash deduplication. I
> > > want to get some credits if our grouping information is useful for
> > > some kernel developers.
> > >
> > > > thanks,
> > > >
> > > > greg k-h

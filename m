Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04F2370D69
	for <lists+linux-media@lfdr.de>; Sun,  2 May 2021 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhEBOap (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 May 2021 10:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhEBOap (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 May 2021 10:30:45 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6050FC06174A;
        Sun,  2 May 2021 07:29:53 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id i3so3437248edt.1;
        Sun, 02 May 2021 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vI2o2nm4OeL9ajTjnyLwB7QFhckzeMxOWKBp3ZKbyuM=;
        b=Q4wuvj/PmwR0/xKOTRey6dMN4YzDSfkIsUmv/ri7lxqznLTA9bYbrKmyytZX32KzpN
         udL6SW34S9uJUEAjoLIW4lGJ4I6/CSbvhDmhPCxc3fuKd97MorVZiM8pDHTuQ3GEd1u3
         6PXZo3hko5mlSWSOwIBiPEVUb1O3eEJ37jCRIPZ1ai5o+z+Wjy36uXizkVe0vsKXz3TO
         5BRJAUaZYIdKy278usUctFvZXFWY0nif+XYIevST1vBiTbhygIy+Qcy83l8l22SdmBBa
         K2m43od/umdLg2Xj/4apbRcyJvEd0ZSMRoAUUiOgFxKcP/2whs0M6nxD9lDrVev5IfGP
         ailA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vI2o2nm4OeL9ajTjnyLwB7QFhckzeMxOWKBp3ZKbyuM=;
        b=P8DnnsplSxKoprph0XDhd7irQb9prZXoZAZfNqbwIIyqp+VMalIFMX6Hpv+R7zO0bQ
         9k7UwDAn2xl3M8roNeZKQ82zXrCHHSmCqIn84FrmtKkKvhcVaum8T80ibngOxK98roAj
         vq3mWA5HHtFDDz4SovCr44gnglldOBFmyodMR7XTpUXELLawRrjaAYk1BTEaHbmRGgqo
         lO9rzqIbIgyTkfGNZneAMhye/AgyJYewohlqi7uja0/+iuxZkZLYQgiym+uaK+Eil2mq
         Reulsc3yGtNkncwR2ZmyyMSdje1kYCeYBvc/JIEu4GGlMJXHujzumENHeqLIjOAz+Di0
         x3Eg==
X-Gm-Message-State: AOAM533dPzeBVhXdMntT+X9dXbygmiXclsedA0esc6gRliJTw3Y4yU5j
        jYbIKXczONSIpGd0P/7p6W36hJZ0WLrPqyvVM9s=
X-Google-Smtp-Source: ABdhPJzqWGS4fp9ZIIIKP++KIqpASks5DoUp1YSC5AISYTjDm6E9hUDr3Yc1sWtt0jJWju3oRXV0+JVwRrUTORlxZ6c=
X-Received: by 2002:aa7:d806:: with SMTP id v6mr15879267edq.309.1619965792031;
 Sun, 02 May 2021 07:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
 <X/6mhQfPRt0QoorO@kroah.com> <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
In-Reply-To: <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Sun, 2 May 2021 22:29:25 +0800
Message-ID: <CAD-N9QVAaVozZuPSG9YKjEYreRX3PEoW0UM3Dwhko_-tVTpK0Q@mail.gmail.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Sean Young <sean@mess.org>, jr@memlen.com
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi kernel developers,

I found one interesting follow-up for these two crash reports. In the
syzbot dashboard, they are fixed with different patches. Each patch
fixes at the failure point - mceusb_handle_command  and
mceusb_dev_printdata. For patch details, please have a look at the
crash reports [1] and [2].

Recall the vulnerability below, and kernel crashes both at the case
SUBCMD with incorrect value in ir_buf_in[i+2]. I still think they
share the same root cause and fixing this bug needs two patches at the
same time.

---------------------------------------------------------------------------=
-----------------------------------------------
for (; i < buf_len; i++) {
     switch (ir->parser_state) {
     case SUBCMD:
             ir->rem =3D mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
             mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
                                                   ir->rem + 2, false);
             if (i + ir->rem < buf_len)
             mceusb_handle_command(ir, &ir->buf_in[i - 1]);
---------------------------------------------------------------------------=
-----------------------------------------------

I wonder if developers can see two crash reports in the very
beginning, they may craft different patches which fix this bug in the
root cause. Meanwhile, if developers can see those crash reports in
advance, this may save some time for developers since only one takes
time to analyze this bug. If you have any issues about this statement,
please let me know.


[1] UBSAN: shift-out-of-bounds in mceusb_dev_printdata
https://syzkaller.appspot.com/bug?id=3Ddf1efbbf75149f5853ecff1938ffd3134f26=
9119
[2] UBSAN: shift-out-of-bounds in mceusb_dev_recv
https://syzkaller.appspot.com/bug?id=3D50d4123e6132c9563297ecad0479eaad7480=
c172

On Wed, Jan 13, 2021 at 7:20 PM =E6=85=95=E5=86=AC=E4=BA=AE <mudongliangabc=
d@gmail.com> wrote:
>
> On Wed, Jan 13, 2021 at 3:51 PM Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> >
> > On Wed, Jan 13, 2021 at 01:04:44PM +0800, =E6=85=95=E5=86=AC=E4=BA=AE w=
rote:
> > > Hi developers,
> > >
> > > I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> > > "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
> > > same root cause.
> > > The reason is that the PoCs after minimization has a high similarity
> > > with the other. And their stack trace only diverges at the last
> > > function call. The following is some analysis for this bug.
> > >
> > > The following code in the mceusb_process_ir_data is the vulnerable
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > > for (; i < buf_len; i++) {
> > >      switch (ir->parser_state) {
> > >      case SUBCMD:
> > >              ir->rem =3D mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> > >              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> > >                                                    ir->rem + 2, false=
);
> > >              if (i + ir->rem < buf_len)
> > >              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > >
> > > The first report crashes at a shift operation(1<<*hi) in mceusb_handl=
e_command.
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > > static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
> > > {
> > > u8 *hi =3D &buf_in[2]; /* read only when required */
> > > if (cmd =3D=3D MCE_CMD_PORT_SYS) {
> > >       switch (subcmd) {
> > >       case MCE_RSP_GETPORTSTATUS:
> > >               if (buf_in[5] =3D=3D 0)
> > >                      ir->txports_cabled |=3D 1 << *hi;
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > >
> > > The second report crashes at another shift operation (1U << data[0])
> > > in mceusb_dev_printdata.
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > > static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int =
buf_len,
> > > int offset, int len, bool out)
> > > {
> > > data   =3D &buf[offset] + 2;
> > >
> > >           period =3D DIV_ROUND_CLOSEST((1U << data[0] * 2) *
> > >                         (data[1] + 1), 10);
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > >
> > > >From the analysis, we can know the data[0] and *hi access the same
> > > memory cell - ``ir->buf_in[i+1]``. So the root cause should be that i=
t
> > > misses the check of ir->buf_in[i+1].
> > >
> > > For the patch of this bug, there is one from anant.thazhemadam@gmail.=
com:
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > > diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> > > index f1dbd059ed08..79de721b1c4a 100644
> > > --- a/drivers/media/rc/mceusb.c
> > > +++ b/drivers/media/rc/mceusb.c
> > > @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> > > mceusb_dev *ir, u8 *buf_in)
> > >   switch (subcmd) {
> > >   /* the one and only 5-byte return value command */
> > >   case MCE_RSP_GETPORTSTATUS:
> > > - if (buf_in[5] =3D=3D 0)
> > > + if ((buf_in[5] =3D=3D 0) && (*hi <=3D 32))
> > >   ir->txports_cabled |=3D 1 << *hi;
> > >   break;
> > > ---------------------------------------------------------------------=
-----------------------------------------------------
> > > I tried this patch in the second crash report and found it does not
> > > work. I think we should add another filter for the value in
> > > ``ir->buf_in[i+1]``.
> > >
> > > With this grouping, I think developers can take into consideration th=
e
> > > issue in mceusb_dev_printdata and generate a complete patch for this
> > > bug.
> >
> > Why not create a patch yourself and submit it?  That way you get the
> > correct credit for solving the problem.
> >
>
> I have sent a simple but working patch to the corresponding
> developers. We can take it as a base to discuss.
>
> And this email is to provide some information about bug duplication
> for developers as I am doing some research on crash deduplication. I
> want to get some credits if our grouping information is useful for
> some kernel developers.
>
> > thanks,
> >
> > greg k-h

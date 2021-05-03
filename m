Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D643712FA
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 11:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhECJ3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 05:29:24 -0400
Received: from gofer.mess.org ([88.97.38.141]:37753 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231523AbhECJ3K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 05:29:10 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BEB21C63DD; Mon,  3 May 2021 10:28:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620034083; bh=3Lqh525HUZgW/IOmgNPErIBSMpq4pjo2qRROx5FNK/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hH06HIWxHE1Q4YAmW3DFjF5VOK/M3Si3dtxwuu5EdtK1mOEHJ4aKvyCuMG9wD6PVj
         2Cc6Gac8IZ/F0ZcOnlixAl8TAjBN1teAe3iA37LCks+5pGT7S4HJ3pMt2r2PAeZw7H
         n8O2UcBn/O1riavUyz3g7K5+x+e12OeGPDDGUVg00UfT7l2x9ksojmSu7AYG54eyF3
         ScLFewD6WaCHOGW7KypkoNF2B5vm99sZC+EM1ieNq9mRrpsG6jlyFmVvyxsou6zfT4
         mEYpwlZodWcqpLwWmxUizdy4jWjiLHOpegB8cFVPutl/B7m2tAZnhh8RLwSh1qpGuO
         aOyJanVDI19Bw==
Date:   Mon, 3 May 2021 10:28:03 +0100
From:   Sean Young <sean@mess.org>
To:     =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg KH <gregkh@linuxfoundation.org>, jr@memlen.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
Message-ID: <20210503092803.GA15275@gofer.mess.org>
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
 <X/6mhQfPRt0QoorO@kroah.com>
 <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
 <CAD-N9QVAaVozZuPSG9YKjEYreRX3PEoW0UM3Dwhko_-tVTpK0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QVAaVozZuPSG9YKjEYreRX3PEoW0UM3Dwhko_-tVTpK0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI,

On Sun, May 02, 2021 at 10:29:25PM +0800, 慕冬亮 wrote:
> Hi kernel developers,
> 
> I found one interesting follow-up for these two crash reports. In the
> syzbot dashboard, they are fixed with different patches. Each patch
> fixes at the failure point - mceusb_handle_command  and
> mceusb_dev_printdata. For patch details, please have a look at the
> crash reports [1] and [2].
> 
> Recall the vulnerability below, and kernel crashes both at the case
> SUBCMD with incorrect value in ir_buf_in[i+2]. I still think they
> share the same root cause and fixing this bug needs two patches at the
> same time.
> 
> --------------------------------------------------------------------------------------------------------------------------
> for (; i < buf_len; i++) {
>      switch (ir->parser_state) {
>      case SUBCMD:
>              ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
>              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
>                                                    ir->rem + 2, false);
>              if (i + ir->rem < buf_len)
>              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> --------------------------------------------------------------------------------------------------------------------------
> 
> I wonder if developers can see two crash reports in the very
> beginning, they may craft different patches which fix this bug in the
> root cause. Meanwhile, if developers can see those crash reports in
> advance, this may save some time for developers since only one takes
> time to analyze this bug. If you have any issues about this statement,
> please let me know.

I am sorry, I have a hard time following. As far as I am aware, the issue
with mceusb_dev_printdata() have been resolved. If you think there is still
is an issue, please do send a patch and then we can discuss it. As far as I
know there is noone else working on this.

This mceusb_dev_printdata() function has been very troublesome, maybe it
could be written in a different way.

Thanks,

Sean

> 
> 
> [1] UBSAN: shift-out-of-bounds in mceusb_dev_printdata
> https://syzkaller.appspot.com/bug?id=df1efbbf75149f5853ecff1938ffd3134f269119
> [2] UBSAN: shift-out-of-bounds in mceusb_dev_recv
> https://syzkaller.appspot.com/bug?id=50d4123e6132c9563297ecad0479eaad7480c172
> 
> On Wed, Jan 13, 2021 at 7:20 PM 慕冬亮 <mudongliangabcd@gmail.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 3:51 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 01:04:44PM +0800, 慕冬亮 wrote:
> > > > Hi developers,
> > > >
> > > > I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> > > > "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
> > > > same root cause.
> > > > The reason is that the PoCs after minimization has a high similarity
> > > > with the other. And their stack trace only diverges at the last
> > > > function call. The following is some analysis for this bug.
> > > >
> > > > The following code in the mceusb_process_ir_data is the vulnerable
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > > for (; i < buf_len; i++) {
> > > >      switch (ir->parser_state) {
> > > >      case SUBCMD:
> > > >              ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> > > >              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> > > >                                                    ir->rem + 2, false);
> > > >              if (i + ir->rem < buf_len)
> > > >              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > >
> > > > The first report crashes at a shift operation(1<<*hi) in mceusb_handle_command.
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > > static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
> > > > {
> > > > u8 *hi = &buf_in[2]; /* read only when required */
> > > > if (cmd == MCE_CMD_PORT_SYS) {
> > > >       switch (subcmd) {
> > > >       case MCE_RSP_GETPORTSTATUS:
> > > >               if (buf_in[5] == 0)
> > > >                      ir->txports_cabled |= 1 << *hi;
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > >
> > > > The second report crashes at another shift operation (1U << data[0])
> > > > in mceusb_dev_printdata.
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > > static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
> > > > int offset, int len, bool out)
> > > > {
> > > > data   = &buf[offset] + 2;
> > > >
> > > >           period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
> > > >                         (data[1] + 1), 10);
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > >
> > > > >From the analysis, we can know the data[0] and *hi access the same
> > > > memory cell - ``ir->buf_in[i+1]``. So the root cause should be that it
> > > > misses the check of ir->buf_in[i+1].
> > > >
> > > > For the patch of this bug, there is one from anant.thazhemadam@gmail.com:
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > > diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> > > > index f1dbd059ed08..79de721b1c4a 100644
> > > > --- a/drivers/media/rc/mceusb.c
> > > > +++ b/drivers/media/rc/mceusb.c
> > > > @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> > > > mceusb_dev *ir, u8 *buf_in)
> > > >   switch (subcmd) {
> > > >   /* the one and only 5-byte return value command */
> > > >   case MCE_RSP_GETPORTSTATUS:
> > > > - if (buf_in[5] == 0)
> > > > + if ((buf_in[5] == 0) && (*hi <= 32))
> > > >   ir->txports_cabled |= 1 << *hi;
> > > >   break;
> > > > --------------------------------------------------------------------------------------------------------------------------
> > > > I tried this patch in the second crash report and found it does not
> > > > work. I think we should add another filter for the value in
> > > > ``ir->buf_in[i+1]``.
> > > >
> > > > With this grouping, I think developers can take into consideration the
> > > > issue in mceusb_dev_printdata and generate a complete patch for this
> > > > bug.
> > >
> > > Why not create a patch yourself and submit it?  That way you get the
> > > correct credit for solving the problem.
> > >
> >
> > I have sent a simple but working patch to the corresponding
> > developers. We can take it as a base to discuss.
> >
> > And this email is to provide some information about bug duplication
> > for developers as I am doing some research on crash deduplication. I
> > want to get some credits if our grouping information is useful for
> > some kernel developers.
> >
> > > thanks,
> > >
> > > greg k-h

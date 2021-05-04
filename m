Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F55372767
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 10:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhEDImV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 04:42:21 -0400
Received: from gofer.mess.org ([88.97.38.141]:49641 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229916AbhEDImV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 04:42:21 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C22C3C645F; Tue,  4 May 2021 09:41:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620117684; bh=OM5xZktMxlFpeUx0Uz4eNTL0omIVepTrzyoxNTKT3Qc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KrirSAfQ3FxYbJu34wLPw6RGXr/Q1A9XaxuvyAATqG/vTDdzxeB57qKsPsmm1l0Td
         yJtDGVpxib00but2RSgBW+ybnUN0F24WaHCZvK/EDGS3ofbxKAuzp39YCBKjbSks/q
         79/rzGtpQdYp93Ywx8hmcdx9gnVV87Y+fvTR4tLi2qm0IVW75VxvreDV1ARbAv2u49
         u8cTSxvLOu76zkJnHFEsXyZtGAg5KyvTchEINO849E3WGUwM3hjgK8gJP0iMFuAdND
         v3ACLkOxdkUWJgFf5QRs74wUufETo2chWJ1cUQZL8tY7jSSkrirwa+7BLLmFiASLjR
         AGu7sQdnxIELA==
Date:   Tue, 4 May 2021 09:41:24 +0100
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
Message-ID: <20210504084124.GB26294@gofer.mess.org>
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
 <X/6mhQfPRt0QoorO@kroah.com>
 <CAD-N9QUuvxa3CCqru08O2x9p-AJp54qo-e-9O49YGQwQEWKLdA@mail.gmail.com>
 <CAD-N9QVAaVozZuPSG9YKjEYreRX3PEoW0UM3Dwhko_-tVTpK0Q@mail.gmail.com>
 <20210503092803.GA15275@gofer.mess.org>
 <CAD-N9QVAKD3eVghy_Lj-aTnkB51NhWTci2gtBJZOnKsE6J3u=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QVAKD3eVghy_Lj-aTnkB51NhWTci2gtBJZOnKsE6J3u=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 03, 2021 at 07:24:35PM +0800, 慕冬亮 wrote:
> On Mon, May 3, 2021 at 5:28 PM Sean Young <sean@mess.org> wrote:
> >
> > HI,
> >
> > On Sun, May 02, 2021 at 10:29:25PM +0800, 慕冬亮 wrote:
> > > Hi kernel developers,
> > >
> > > I found one interesting follow-up for these two crash reports. In the
> > > syzbot dashboard, they are fixed with different patches. Each patch
> > > fixes at the failure point - mceusb_handle_command  and
> > > mceusb_dev_printdata. For patch details, please have a look at the
> > > crash reports [1] and [2].
> > >
> > > Recall the vulnerability below, and kernel crashes both at the case
> > > SUBCMD with incorrect value in ir_buf_in[i+2]. I still think they
> > > share the same root cause and fixing this bug needs two patches at the
> > > same time.
> > >
> > > --------------------------------------------------------------------------------------------------------------------------
> > > for (; i < buf_len; i++) {
> > >      switch (ir->parser_state) {
> > >      case SUBCMD:
> > >              ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
> > >              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
> > >                                                    ir->rem + 2, false);
> > >              if (i + ir->rem < buf_len)
> > >              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> > > --------------------------------------------------------------------------------------------------------------------------
> > >
> > > I wonder if developers can see two crash reports in the very
> > > beginning, they may craft different patches which fix this bug in the
> > > root cause. Meanwhile, if developers can see those crash reports in
> > > advance, this may save some time for developers since only one takes
> > > time to analyze this bug. If you have any issues about this statement,
> > > please let me know.
> >
> > I am sorry, I have a hard time following. As far as I am aware, the issue
> > with mceusb_dev_printdata() have been resolved. If you think there is still
> > is an issue, please do send a patch and then we can discuss it. As far as I
> > know there is noone else working on this.
> 
> Hi Sean,
> 
> Sorry for the bad logic. Let me organize my logic about these two
> crashes and the underlying bug.
> 
> First, let's sync on the same page. In this thread, I would like to
> prove to you guys these two crash reports share the same root cause -
> they both miss the sanity check of the same field from user space.

So you mean:
[1] UBSAN: shift-out-of-bounds in mceusb_dev_printdata
https://syzkaller.appspot.com/bug?id=df1efbbf75149f5853ecff1938ffd3134f269119
[2] UBSAN: shift-out-of-bounds in mceusb_dev_recv
https://syzkaller.appspot.com/bug?id=50d4123e6132c9563297ecad0479eaad7480c172

1) So these bugs are not crashes -- shift out of bounds is the error.
2) The "bug" is that garbage will be printed to the kernel log when
   garbage data is received. I'm not sure it is a bug.
2) The data comes from the usb device, not user space
3) They are both fixed
4) They are in different parts of the code

> Second, if you agree with the first point, let's move on. If we can
> know the duplication information before, you and James Reynolds, who
> fixes another crash at mceusb_handle_command do not need to analyze it
> twice. And I think either your patch or the patch developed by James
> Reynolds only fixes the crash reports at the failure point, without
> completely fixing the underlying bug.

Please send a patch which shows this is the case.

> Please let me know if you have any questions about the above text.
> Thanks in advance.

Thanks,

Sean

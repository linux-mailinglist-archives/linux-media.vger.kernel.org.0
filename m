Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462DC1370FF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgAJPVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 10:21:39 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:44173 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbgAJPVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 10:21:38 -0500
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MgeXk-1jJU2H14VI-00h7Yf; Fri, 10 Jan 2020 16:21:37 +0100
Received: by mail-qk1-f180.google.com with SMTP id z14so2127774qkg.9;
        Fri, 10 Jan 2020 07:21:36 -0800 (PST)
X-Gm-Message-State: APjAAAWRtTDVL2BkweDS7o+nrg8gpULb6WSNA3zWSSan6BRR5sKBI6dP
        oCBaswEHO5+D3Ep74M7MrYCIRylb0tXDvds8xu4=
X-Google-Smtp-Source: APXvYqxSgcGBQK+tkeWMU2jn5QS6q8AIe0DuLAWuh/dj+ivOIV5/alMrbKn0qhZMQok6A0tTJ0ciEf6xGfK5TXH33Ek=
X-Received: by 2002:a05:620a:a5b:: with SMTP id j27mr3688833qka.286.1578669696060;
 Fri, 10 Jan 2020 07:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20200107084659.uyaucu73yd5rhim3@kili.mountain>
 <CAK8P3a1iUADRcjWEMZjVuCKyESXA7fHEypvFK7vEQ0CseXfmtg@mail.gmail.com> <20200107151651.GA27042@kadam>
In-Reply-To: <20200107151651.GA27042@kadam>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 10 Jan 2020 16:21:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NFgJ1Em3k8N6MRtYeWMby4w=Ku22=dmXUjWZt=axJiQ@mail.gmail.com>
Message-ID: <CAK8P3a1NFgJ1Em3k8N6MRtYeWMby4w=Ku22=dmXUjWZt=axJiQ@mail.gmail.com>
Subject: Re: [bug report] compat_ioctl: move CDROM_SEND_PACKET handling into scsi
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-block <linux-block@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1bTlgwmVU0eIZNQegFBAkNJXlseBkTbghT17Idg47oWfboLHoOV
 dZPfflICBF56oPg8e8mB78Y5bJz0Mo0fu6yH9ELrkzLH6jcZRFOShcUs9zwSu9LZfd9q7YN
 VqhoIy59c+T9Xyiln6T7Fpys5vjqBpxhNWFdC2qdsgEMh4wH6F+urAVIV8ot3ZvFy4i/Zx5
 /E1Mv3PVZQf8C5xyXkNkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:24qKiPfrG+c=:s9xYFiIQa/CZk5uvE++3iw
 6iWxbIcwndnt1h9nfPX4SQ7sxnIuqvvCHZIM98lhB5f/ItjaUy2VmvUwjY9viNEhuP0xiRzPV
 5YVz9niS8w4nppKwwjXD1GDkl1cegoWX0vHmptKLTMASEtU0okkVzw4ET6SOEgT7eiGWM0lMI
 490PivkQ034VLwjcaHlayhiu1+bXv5L2o6PmWewyHdtQHmWUWKmz6cQC2V3vkgcmj/KOLRSGC
 KsBU2KALyqPQ90Ie00BLIKi4cnNoTrK5j4IDhjQk9/udl++asH9cxo/bhhMavkRpdj0dJHsNA
 U5gzO1mMqIcad6rwkmyrADrpP46SZ/PyhpgK76WvELellh5RUi5/IVL++BQUf1sMvw90RUrdL
 r1PR7tsonVgNwClWUgTkSAJWYFSXjibZx+EGtp1SWN0QckJydQuEo0ABAGOHCfGi2iKid3TA1
 YuS0iWPLMGmuyL2LVNNb8jFcuZCvEdFuPrkXdvgSpo8vZsQSJnqOLcI0Bnyy3A/Xjr4r0en68
 cKgPAVFCcu0oegEyqCW7XEEKl01L6uehLxDOAsDwBC94h0TJdjM5Vvj0l1mnsbqYh1xxmiFQT
 JBLFMHMDu3ab7Xlc8PJfSgBVmuRc0F+EoKukam6DFuoV84Z3+kqr3aiwQ2sivWzoMLTjX0Weo
 zdAlHLhz7wYhQQXvvE+8xiUMvrWNhpXarWogJHb5fIDrXoICyRH+mtqbfGzSEDWsNfTd05Kb0
 RJ3SJZxNZaJWWB88xKVEpAPSnUKpx20oxoDZejXdC2QOGzkSL00eoPHI6eXUxQaeknTfD/wsG
 5SMDJiy7kvS5/kaNtGLhEAW4qQChTd+LO36PMZwYqC9GslEEGmEbV9tDvcPYU9iCSXeauRrpK
 FF05upNyqcdkQZu0snvA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 7, 2020 at 4:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Tue, Jan 07, 2020 at 04:03:12PM +0100, Arnd Bergmann wrote:
> > On Tue, Jan 7, 2020 at 9:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > Hello Arnd Bergmann,
> > >
> > > The patch f3ee6e63a9df: "compat_ioctl: move CDROM_SEND_PACKET
> > > handling into scsi" from Nov 28, 2019, leads to the following static
> > > checker warning:
> > >
> > >         block/scsi_ioctl.c:703 scsi_put_cdrom_generic_arg()
> > >         warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> > >
> > > block/scsi_ioctl.c
> > >    686  static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
> > >    687                                        void __user *arg)
> > >    688  {
> > >    689  #ifdef CONFIG_COMPAT
> > >    690          if (in_compat_syscall()) {
> > >    691                  struct compat_cdrom_generic_command cgc32 = {
> > >    692                          .buffer         = (uintptr_t)(cgc->buffer),
> > >    693                          .buflen         = cgc->buflen,
> > >    694                          .stat           = cgc->stat,
> > >    695                          .sense          = (uintptr_t)(cgc->sense),
> > >    696                          .data_direction = cgc->data_direction,
> > >    697                          .quiet          = cgc->quiet,
> > >    698                          .timeout        = cgc->timeout,
> > >    699                          .reserved[0]    = (uintptr_t)(cgc->reserved[0]),
> > >    700                  };
> > >
> > > It's possible that initializations like this don't clear out the struct
> > > hole but I haven't seen a compiler which is affected.  So maybe it's
> > > fine?
> >
> > I thlought we already rely on this to initialize the entire structure, but
> > trying out a test case shows that it does happen:
>
> There aren't that many cases where we rely on it to happen.  Under 20
> so far as Smatch can detect.  I'm not really certain what the correct
> approach is to deal with them...  I think they pretty much all work
> fine with existing compilers.

After looking a bit more into this, I'm now fairly convinced this is a
real problem. On gcc, this is prevented from causing too much harm
by the structleak plugin, but that is not always enabled.

I'll send fixes for the ones I recently introduced. Can you send me a list
of the other instances that smatch finds? Maybe I can take a look at
those as well.

      Arnd

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 740BC35A50
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 12:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfFEKOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 06:14:25 -0400
Received: from casper.infradead.org ([85.118.1.10]:43670 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfFEKOZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 06:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m0sIXLFzSAfIrEXaXFue9blbUsqtX9lLblTE1dAG10k=; b=C4OhBAaLDWrRiLxo4cZx9Sz+lr
        c5XBP6tmeYcyBwSgOU0y//iH5IBy40CYjNcoNJ08jMz0sgg1ujjQjkrbdywwwBrwNAe5Vw80XjdWE
        Q7sbK7CQVQ64wrlbk2N0b6bxKTkfDUWZC+j13o5Ub8apmU7xQDTXRwiRarsjFnG0WxM5rMqlVMDSC
        l6r33NC2X0lAp7TCg0ebmB4FUKMRrTKkMqEYHroD8LXsdzg6CdiVQ+u2p+2NzZ0JBHLOwnueSsexu
        UHnZubC4750nf8zCCDFd+ot7HNH2Xl7uMuQe+Yb5KrrnbfSGMJaiWmKDenh4HRuG79/ohFtcn9x/e
        OtMZNOBQ==;
Received: from [179.182.172.34] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYSvz-0001tS-17; Wed, 05 Jun 2019 10:14:19 +0000
Date:   Wed, 5 Jun 2019 07:14:13 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
Message-ID: <20190605071413.779bd821@coco.lan>
In-Reply-To: <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
        <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
        <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
        <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
        <20190604134213.GA26263@kroah.com>
        <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
        <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
        <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
        <20190605051040.GA22760@kroah.com>
        <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 04 Jun 2019 22:22:05 -0700
Joe Perches <joe@perches.com> escreveu:

> On Wed, 2019-06-05 at 07:10 +0200, Greg KH wrote:
> > On Wed, Jun 05, 2019 at 01:10:41PM +0900, Masahiro Yamada wrote:  
> > > On Wed, Jun 5, 2019 at 3:21 AM Arnd Bergmann <arnd@arndb.de> wrote:  
> []
> > > This means we cannot reliably use uint{8,16,32,64}_t in UAPI headers.  
> > 
> > We should not be doing that as they are in the userspace "namespace" of
> > variables, not in the kernel namespace.  We've been over this many times
> > in the past :(  
> 
> Just not very successfully...
> 
> $ git grep -w -P 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> 342


> $ git grep -w -P --name-only 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> 13

Out of curiosity, I decided to check those occurrences...

About half of those 13 files are false-positives:

- bpf.h, pps.h and amdgpu_drm.h use those int types only inside comments;
- drm.h and coda.h have their own typedefs for those int types;
- vmwgfx_drm.h includes drm.h (which has the typedefs).

So, only 6 headers actually use posix types in a way that it seems that 
it would require including stdint.h:

- include/uapi/linux/fuse.h

  This one explicitly includes stdint.h if !__KERNEL__

- include/uapi/linux/netfilter_bridge/ebtables.h,
  include/uapi/linux/sctp.h,
  include/uapi/scsi/scsi_netlink.h and
  include/uapi/scsi/scsi_netlink_fc.h

  They include linux/types.h unconditionally, relying on
  scripts/headers_install.sh to remove it;

- include/uapi/scsi/scsi_bsg_fc.h

  It doesn't include anything. In other words, it assumes that the c file 
  would include either linux/types.h or stdint.h.

---

Not saying that this is a good idea, but, as we have already a script that
it is meant to sanitize uAPI header files when installing them
(scripts/headers_install.sh), one could modify it (or convert to perl/python)
in a way that it would be doing something like[1]:

	sed -E
		...
		-e 's,//(.*),/* \1 */,'

[1] the actual rule should be more complex than that, in order to avoid 
replacing // inside /**/ comments.

Thanks,
Mauro

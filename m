Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520AD428767
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 09:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhJKHGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 03:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbhJKHGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 03:06:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98A6C0613E8
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 00:04:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id y3so19644501wrl.1
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=du8QhncD3/8fEKWYuS9xbEo9XYz4mqp2LK0z+3qErJw=;
        b=mcXEIlsaPuULrUMzeX39RcAhbqTtTfElSCJS3WVgjfxAL9tZHwPbopwoXpNwOojWvu
         W/109PJmzQWyKESOoQptXGJgi6vLRw3ePcmqxZ7Moxm96ZMb1G+QnBY4ctdpFstCut5C
         dDnpw3Ptxu//YElmTFSsSh/OLOYkyFOwVHnSxPZ+LvUqgI7cWZIpJkft35Rcj0m3bHW1
         u0mcB7xoAIky3nwZZNwa6AHL1DTfpTCS26qiMSvVdtnypakaeRgO4cqDANsv+lMPR1b/
         slf+9itOKhiTtMlKTji76nAQDp8js7DY/T0FTqmbBm6n0HjMAQVs+dZe+ytr0GrNae4t
         x/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=du8QhncD3/8fEKWYuS9xbEo9XYz4mqp2LK0z+3qErJw=;
        b=FHgtkOCQzEEpXtsFC7eRe6bcoryH1VD5idRY+kRrcuryED2WsvMG/yVdT7gIVN7XZG
         FDXEiLZCBZ5vfChp5ajAsuZErMjObqhTTbXAhc0beE1yQi8X3RB9s8KuuvMuAeUleIdM
         CZE1uiAqoiHqoeuH4HQJbeSBWjWyrKpgrWdDYXKFWv7+ONViBzXfsLpNwbhERpUqk5Be
         Y34/uKk9ZMwKIJEHjfUe1EuQnP3ETgMXikL5LgwGtjwmR9rUJ3RofuaQibfsE5kFQygz
         1HwwCxqJwQeuCSBWayjDMDLExIUopCafB8kWlG8XCZgls6DfJpI7r/bcPyQ9n4oBMEWf
         oCgw==
X-Gm-Message-State: AOAM532MIiSwwIn9OvdahBMVmP48DMCOm75RpHWJ/OyhrPCuGc6nUm9d
        Xrfg0r/pNlVCz5s8k7O/SGY=
X-Google-Smtp-Source: ABdhPJxMJ2uYUJkht+pCADr1MZqe3PlCBbSqVW71DPcm0BN2QsLs+duucXukcoyGivjscHe1jnAXwQ==
X-Received: by 2002:adf:aa88:: with SMTP id h8mr22628450wrc.112.1633935864505;
        Mon, 11 Oct 2021 00:04:24 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id e8sm9620052wrg.48.2021.10.11.00.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 00:04:24 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Mon, 11 Oct 2021 09:04:23 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Security Officers <security@kernel.org>
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <YWPh9zin9JuQinwd@eldamar.lan>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
 <20210816072721.GA10534@kili>
 <20210901104026.GB2129@kadam>
 <YT39LBTgGL/b/V5N@eldamar.lan>
 <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
 <20210913152302.76d57784@coco.lan>
 <YUeFVpGsWFpSPUsM@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUeFVpGsWFpSPUsM@eldamar.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, Sep 19, 2021 at 08:45:42PM +0200, Salvatore Bonaccorso wrote:
> Hi Dan,
> 
> On Mon, Sep 13, 2021 at 03:23:02PM +0200, Mauro Carvalho Chehab wrote:
> > Em Sun, 12 Sep 2021 11:26:10 -0700
> > Linus Torvalds <torvalds@linuxfoundation.org> escreveu:
> > 
> > > On Sun, Sep 12, 2021 at 6:14 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
> > > >
> > > > On Wed, Sep 01, 2021 at 01:40:26PM +0300, Dan Carpenter wrote:  
> > > > > On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:  
> > > > > > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > > > > > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > > > > > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > > > > > be an additional check for that.
> > > > > >
> > > > > > I also added checks for the "write_pos".  I don't think these are
> > > > > > required because "read_pos" and "write_pos" are tied together so
> > > > > > checking one ought to be enough.  
> > > 
> > > They may be in sync at a fixed offset, but the buffer length of the
> > > read ("int length") is not in sync with the buffer length for the
> > > write ("sizeof(c->operand)").
> > > 
> > > So I do think the write pos limit checking is actually necessary and needed.
> > > 
> > > > > > RESEND: this patch got lost somehow.  
> > > > >
> > > > > What the heck?  Someone on patchwork just marked this patch as obsolete
> > > > > again!!!  
> > > 
> > > Can we please make sure patchwork has some logging so that that kind
> > > of thing shows _who_ did this?
> > 
> > I've been wanting a feature like that on patchwork for years. Basically,
> > when there's more then a single person capable of accessing a patchwork
> > instance, there's no way to log who changed the status, nor to control who
> > can delegate a patch to someone else or not.
> > 
> > At least for me, touching patchwork is very hard, as the the entire login
> > logic, as well as the database model itself, is abstracted by Django. So,
> > I can't simply change a SQL insert clause there to add something else to
> > their logs nor to change the sent email that it is pushed when a patch
> > status changed.
> > 
> > I ended adding an internal log to indicate when I do some changes on my
> > patchwork instance via script a couple of years ago.
> > 
> > > > Someone knows what is going on here, i.e. what is the problem?  
> > > 
> > > Dan, can you just send that fix to me directly, with the fixed commit
> > > message (see above), and we can close this.
> > 
> > Feel free to add my:
> > 
> > 	Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> I'm sorry for prodding again, I guess I'm becoming a bit annoying :-/
> 
> Dan, could you sent the patch with the above to Linus directly so it
> can show up in at least 5.15-rc3? I guess it's now to late for
> 5.15-rc2.

It looks this is still not yet applied up to 5.15-rc5, if I'm not
mistaken.

Regards,
Salvatore

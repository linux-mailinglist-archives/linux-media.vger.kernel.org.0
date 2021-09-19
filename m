Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B892410CF3
	for <lists+linux-media@lfdr.de>; Sun, 19 Sep 2021 20:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbhISSrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Sep 2021 14:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhISSrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Sep 2021 14:47:11 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12965C061574
        for <linux-media@vger.kernel.org>; Sun, 19 Sep 2021 11:45:46 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x6so24620423wrv.13
        for <linux-media@vger.kernel.org>; Sun, 19 Sep 2021 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=drpg7YBGnaAbRmge+cSF4APeRN+YB14Bio0RJmTeKiE=;
        b=e9yPuOmNpAtBJM74zJ3YRSCpfRfzCiUoc/zMId+AK7rR/dkQiQyS5W4ZTiXNA7wqhv
         xUQBrLgsPG+kWO7aCZ9R0VoxXB2hZOPKO507z35Tf/T8l3P11BgXwWwXOkwlLktsUw7s
         wkFjinQ+fVbd7Wtn0OAKWNxX0kux1YlMX2y0xB0Umgb54tUyGG4gQ+7vyjA64zmSq8WG
         XulG0ItL65f3FZk/NWFBzz4/nvzKBwRyHH0JZVEy3ylVdAFYswBZaWtcDzs0TWqg4Ta9
         V6y59R8qQrKfpUmTL3+Lhc72SAorTMWxVKfEhos0bKnbO9EwYcV+JNPnuUF6McJhio0u
         L5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=drpg7YBGnaAbRmge+cSF4APeRN+YB14Bio0RJmTeKiE=;
        b=FsOwJmfblukm45VuST8Z2XE9ustzV4sPA9fWmUGZDcyAV2imVWhazuhnCkiMQQyBDJ
         b/mzndY2Uiit5ZENB5Ap5HqFDPOwye1bvMqPWEpWDDiusxs+BMXZSX1jhhQL2lH3gZ16
         rpYw7RNVC/dkI5TlV/YEQK3X2UbkzR/R/71TOTRLwBJSylqEsFPnB6MkwoDExiyNquh/
         Utb0dQpCHzMUURHqcSorlaB6y7aObLUSESXflsLbG2AQ3PCrVik0sv5cgWANmm5aYwPF
         O5dhZjYJ+nEv/sALvfsmscNroczBa870smyKWZtdohMHsv0RoPCUbVzQi/jPvccHSGg5
         RTIg==
X-Gm-Message-State: AOAM5300EhOd2zjILIf1849m7ozJdksqDg+GqVc6vVJpXJ9IhzcEB4/u
        FD8lGqy7sooAm+3OTUNked0=
X-Google-Smtp-Source: ABdhPJz3J51kUFsnP8NZfoISrBZzFItEHv99BVdITaYtwfEFcRPm4ztgOjzExMcF1EQwKlFT3pINuw==
X-Received: by 2002:adf:b781:: with SMTP id s1mr23863177wre.319.1632077144509;
        Sun, 19 Sep 2021 11:45:44 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id m1sm12492048wmq.10.2021.09.19.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 11:45:43 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sun, 19 Sep 2021 20:45:42 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Security Officers <security@kernel.org>
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
Message-ID: <YUeFVpGsWFpSPUsM@eldamar.lan>
References: <YRoNTX3Krtw9NdkI@eldamar.lan>
 <20210816072721.GA10534@kili>
 <20210901104026.GB2129@kadam>
 <YT39LBTgGL/b/V5N@eldamar.lan>
 <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
 <20210913152302.76d57784@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913152302.76d57784@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Mon, Sep 13, 2021 at 03:23:02PM +0200, Mauro Carvalho Chehab wrote:
> Em Sun, 12 Sep 2021 11:26:10 -0700
> Linus Torvalds <torvalds@linuxfoundation.org> escreveu:
> 
> > On Sun, Sep 12, 2021 at 6:14 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
> > >
> > > On Wed, Sep 01, 2021 at 01:40:26PM +0300, Dan Carpenter wrote:  
> > > > On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:  
> > > > > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > > > > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > > > > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > > > > be an additional check for that.
> > > > >
> > > > > I also added checks for the "write_pos".  I don't think these are
> > > > > required because "read_pos" and "write_pos" are tied together so
> > > > > checking one ought to be enough.  
> > 
> > They may be in sync at a fixed offset, but the buffer length of the
> > read ("int length") is not in sync with the buffer length for the
> > write ("sizeof(c->operand)").
> > 
> > So I do think the write pos limit checking is actually necessary and needed.
> > 
> > > > > RESEND: this patch got lost somehow.  
> > > >
> > > > What the heck?  Someone on patchwork just marked this patch as obsolete
> > > > again!!!  
> > 
> > Can we please make sure patchwork has some logging so that that kind
> > of thing shows _who_ did this?
> 
> I've been wanting a feature like that on patchwork for years. Basically,
> when there's more then a single person capable of accessing a patchwork
> instance, there's no way to log who changed the status, nor to control who
> can delegate a patch to someone else or not.
> 
> At least for me, touching patchwork is very hard, as the the entire login
> logic, as well as the database model itself, is abstracted by Django. So,
> I can't simply change a SQL insert clause there to add something else to
> their logs nor to change the sent email that it is pushed when a patch
> status changed.
> 
> I ended adding an internal log to indicate when I do some changes on my
> patchwork instance via script a couple of years ago.
> 
> > > Someone knows what is going on here, i.e. what is the problem?  
> > 
> > Dan, can you just send that fix to me directly, with the fixed commit
> > message (see above), and we can close this.
> 
> Feel free to add my:
> 
> 	Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I'm sorry for prodding again, I guess I'm becoming a bit annoying :-/

Dan, could you sent the patch with the above to Linus directly so it
can show up in at least 5.15-rc3? I guess it's now to late for
5.15-rc2.

Regards,
Salvatore

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3186166BFE5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 14:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjAPNgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 08:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjAPNgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 08:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B4C1D923
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673876126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tAvUK0431qrdIjMrDzQc6oNNmBkY0t1HYoQvy6bKAsE=;
        b=euKAHBBlTN22FhbEnPTxGRkNIXnUi2q2JC0he9RSik6N+2xexdFDgZqqZhustQyOHtxM7n
        c1ZMXUNXcXA7ER2uoSZ3pWXf7B20twEt/lUnB+NdTJjATmfhvqZjQbR4ZeUaGTaBP1/5Ei
        KE79oJmqDye/+d3JeS1AHNK3CPgpmec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-TCktV_WFPEaYMZfgItsh5Q-1; Mon, 16 Jan 2023 08:35:24 -0500
X-MC-Unique: TCktV_WFPEaYMZfgItsh5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F05C2804136;
        Mon, 16 Jan 2023 13:35:24 +0000 (UTC)
Received: from calimero.vinschen.de (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EFF8A14171B8;
        Mon, 16 Jan 2023 13:35:23 +0000 (UTC)
Received: by calimero.vinschen.de (Postfix, from userid 500)
        id 751CFA8088F; Mon, 16 Jan 2023 14:35:22 +0100 (CET)
Date:   Mon, 16 Jan 2023 14:35:22 +0100
From:   Corinna Vinschen <vinschen@redhat.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Message-ID: <Y8VSmox2xCbYltXp@calimero.vinschen.de>
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
 <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Jan 16 11:08, Hans Verkuil wrote:
> Hi Corinna,
> 
> On 16/01/2023 10:53, Corinna Vinschen wrote:
> > Hi Hans,
> > 
> > I only learned about this yesterday, so I hope I'm not too late.
> > 
> > Please don't do that.  You're about to remove working drivers used by a
> > lot of people.
> > 
> > If you remove them from the Linux kernel, you will leave *lots* of DVB-C
> > and DVB-S card users behind.  They will update their TV recording
> > machines to a newer system at one point and suddenly their ability to
> > record from TV is gone forever.
> > 
> > I'm personally affected by this as well.  We're using a machine with
> > four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
> > the VDR package.  This card is apparently handled by the code under
> > drivers/staging/media/deprecated/saa7146.
> > 
> > If this code goes away, we will have to keep the machine running on
> > an old kernel for a long time.
> > 
> > I'm fortunate that I even learned about this developement, being a
> > developer myself, but how's a normal user to know that a Linux driver
> > they are using every day is about to be removed from the kernel?  Again,
> > please don't break the equipment of us users of these DVB-C and DVB-S
> > cards for the future.  
> 
> I've dropped the PR for now.

I'm really glad to read that.

> Is the concern specifically for the saa7146
> based hardware?
> 
> I.e., from Red Hat's point of view, are there any concerns about removing
> vpfe_capture, tm6000, zr364xx, stkwebcam, fsl-viu, cpia2 and meye?

I'm not part of the Red Hat media team, so I can't answer that, sorry.  

The problem is that there are no usage numbers anywhere.  I don't know
which of these drivers are still in use and which aren't.  I only know
for certain for our saa7146 based cards @home.  Terratec was the market
leader for quite some time, so there are lots of Terratec cards and
budget cards from third party vendors in the wild.

> The core problem with saa7146 (and the other deprecated drivers) is that
> it is using the old videobuf framework, which has known problems and we
> want (need!) to get rid of it, either by dropping drivers or converting
> them.
> 
> One partial solution would be to drop analog video support from saa7146,
> since that's the bit that uses this framework. DVB would remain working,
> but analog video support would die, unless someone steps up to do the
> conversion from vb1 to vb2.

Maybe I'm biased, but who has actually still access to analog TV?  I'm
not sure about that, but in Germany, analog TV over terrestrial antenna
has been dropped about 2005.  Analog satellite has gone 2012.  Analog
cable took until 2019.  I don't know about other regions.

> So support for the old MXB, Hexium Gemini and Hexium Orion would die, but
> for the other DVB devices it would stay alive.

So, yeah, from my POV this might be an option.

> I'm honestly quite surprised that these old DVB PCI cards are still in
> use, I did not expect that.

There isn't a really well-working alternative, unless you plug in lots
of USB devices instead.  Even more important these days, the cards are
still working, despite their age.  There's really no good reason to
throw them into the dustbin and buy something new, instead of trying to
use working equipment as long as possible to save waste.


Thanks,
Corinna


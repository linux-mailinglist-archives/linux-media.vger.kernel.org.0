Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B79566CDD5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 18:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbjAPRnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 12:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234769AbjAPRm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 12:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8464B42DFE
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 09:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673889425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0+dLtGTXUViq/gmgpbdj6/cMmsjip86JU34DOryZ1Rc=;
        b=QcKur2q/biqIWh3FGnr16Lb/Ipppk5u0e6/k8xk0YVAh7SVeWcinxqwupp65ZkXkP8QDT7
        bI69OhsKA/wb2cpmx8bWrJy7BBiRTEXgaZr40hVr4oPltCyPKDadX7qhSuIzmZgRfc3C2G
        ErLGzc8bXnT08H+zmE+sZBMkJ9EPDHA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-VE7WCJaoMfi9rD2ZesHFfw-1; Mon, 16 Jan 2023 12:17:02 -0500
X-MC-Unique: VE7WCJaoMfi9rD2ZesHFfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39FA2857F43;
        Mon, 16 Jan 2023 17:17:02 +0000 (UTC)
Received: from calimero.vinschen.de (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id ED0742026D4B;
        Mon, 16 Jan 2023 17:17:01 +0000 (UTC)
Received: by calimero.vinschen.de (Postfix, from userid 500)
        id 69A99A8088F; Mon, 16 Jan 2023 18:17:00 +0100 (CET)
Date:   Mon, 16 Jan 2023 18:17:00 +0100
From:   Corinna Vinschen <vinschen@redhat.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Message-ID: <Y8WGjBgXb+8laexA@calimero.vinschen.de>
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
 <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
 <Y8VSmox2xCbYltXp@calimero.vinschen.de>
 <dac6a072-39f4-96c5-cb13-171c54213937@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dac6a072-39f4-96c5-cb13-171c54213937@xs4all.nl>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Jan 16 15:39, Hans Verkuil wrote:
> On 16/01/2023 14:35, Corinna Vinschen wrote:
> > On Jan 16 11:08, Hans Verkuil wrote:
> >> On 16/01/2023 10:53, Corinna Vinschen wrote:
> >>> I only learned about this yesterday, so I hope I'm not too late.
> >>>
> >>> Please don't do that.  You're about to remove working drivers used by a
> >>> lot of people.
> >>> [...]
> >>> I'm fortunate that I even learned about this developement, being a
> >>> developer myself, but how's a normal user to know that a Linux driver
> >>> they are using every day is about to be removed from the kernel?  Again,
> >>> please don't break the equipment of us users of these DVB-C and DVB-S
> >>> cards for the future.  
> >>
> >> I've dropped the PR for now.
> > 
> > I'm really glad to read that.
> > 
> >> [...]
> >> One partial solution would be to drop analog video support from saa7146,
> >> since that's the bit that uses this framework. DVB would remain working,
> >> but analog video support would die, unless someone steps up to do the
> >> conversion from vb1 to vb2.
> > 
> > Maybe I'm biased, but who has actually still access to analog TV?  I'm
> > not sure about that, but in Germany, analog TV over terrestrial antenna
> > has been dropped about 2005.  Analog satellite has gone 2012.  Analog
> > cable took until 2019.  I don't know about other regions.
> 
> Analog TV is almost certainly still used in places.
> 
> But it's not so much about TV as it is about analog video in general, so
> also capturing from S-Video or composite connectors. That's definitely
> still used.

Ok.  I was too TV focused, apparently.  Yeah, S-Video recording still
makes sense.

> >> So support for the old MXB, Hexium Gemini and Hexium Orion would die, but
> >> for the other DVB devices it would stay alive.
> > 
> > So, yeah, from my POV this might be an option.
> > 
> >> I'm honestly quite surprised that these old DVB PCI cards are still in
> >> use, I did not expect that.
> > 
> > There isn't a really well-working alternative, unless you plug in lots
> > of USB devices instead.  Even more important these days, the cards are
> > still working, despite their age.  There's really no good reason to
> > throw them into the dustbin and buy something new, instead of trying to
> > use working equipment as long as possible to save waste.
> 
> OK, I'll make a new PR that keeps the saa7146 for now, and work on removing
> analog video support from saa7146.

That sounds great to me.  Thanks for your understanding!


Best,
Corinna


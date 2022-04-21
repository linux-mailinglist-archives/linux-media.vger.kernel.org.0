Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006C750A3E7
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 17:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389998AbiDUPY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 11:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbiDUPYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 11:24:55 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71B03F31A
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 08:22:05 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 233B6121205;
        Thu, 21 Apr 2022 15:22:04 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id A7C04120BB7;
        Thu, 21 Apr 2022 15:22:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650554523; a=rsa-sha256;
        cv=none;
        b=0OwiDxXzeD7RW2i7GISr6ArhIi0KZ1PxkasNcGG5TG9YQd6bp853Wp0FPcgSNb3EiuFvxP
        aZFYhY4ziLri0IKeRrB8v95gcaOov+U9pCTwnPV/IfVw+N6k0JfuHVufmEmxisbwNkf+VL
        MKhXMgLmuRS+V4nY3iZM68AGJRuqAH/FHb1UbGTk3kIGd39elxhUiRAgWXRJwRsQH89h/C
        U5PZE2SlIpyR45E05fq0H/og8HUjdJUlDNmX96WbxmC1LUxnQ3bURFDGkP9f1kWDJ4q/2K
        zEijyDyh5VLRgUadUTgYnBjEMa9eByDqAd71WsrYnIOtg7X/nVnRLDGZC1W45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650554523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=YpK0IB0ISdK2Q+IAE4RyhzfZLNmrH3FCsTZtzMJjiEM=;
        b=7o9MUZJfufB2zueungao+vWZtz5Q1qA+49Fu8Eb89+B9ozdqUvA/7XeYomaoq6ctr8PHSd
        FJp+5m6+hOQq1Q29GSqYglVc6r7R7iSdZRhFSbY8N0UFO73mqDrAtxT0mv9LiV1xMQQjVp
        kCBg3uUrq7JRzoSmQR6ujVFh5FA14rtPUFN2KsLtz1FRq0jmaI+GJrMfnlPmwZfaqrsULc
        0y0s2izEkh4T056ErmrR81BdJnErvRzSMF9+/UvH9DquWprKz2qdvry5h6uuZAYTCU7auT
        OGnDNLVnJAsLgK9yPKrhB6w4K6+KyeENzuiQju8hsO+E3HHt8OpqvMJJCsTGIw==
ARC-Authentication-Results: i=1;
        rspamd-7968956b8c-krz2z;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Soft-Lonely: 4f2287555838409e_1650554523973_4074984897
X-MC-Loop-Signature: 1650554523973:1017771326
X-MC-Ingress-Time: 1650554523972
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.121.210.138 (trex/6.7.1);
        Thu, 21 Apr 2022 15:22:03 +0000
Received: from fedora (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4Kkh9654PMz1N9;
        Thu, 21 Apr 2022 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650554523;
        bh=YpK0IB0ISdK2Q+IAE4RyhzfZLNmrH3FCsTZtzMJjiEM=;
        h=Date:From:To:Cc:Subject:Content-Type;
        b=dQDGdo94HXpqlcVZlUO2Gpcg070aN2YmnIWOsfgG5LvsBSqJsX57NZZa3Io9t43bm
         Z1tNy2KCcCaThMvvvwkV4GTfUjHU+C9jTpTvmkhWd1hsSnQq6S8yzgv8diKWbPAJCr
         IIYfHaG6eOxfQJaSe7IF4X1etJNPcedV3Y/+z4EZ7CZKCcUAF1s8iLchRVEcXvGUqc
         EiBGpPf8JesXgu1ZOJzBSo72ny4bJeCywDJyIrMljXlZJ5dfXiDqfCQJf4Y/gk3GpM
         WDLOQB5ugZ+rLBu9/6OkHfHzgEMHtXOUFjJSW1M07yTC4d+WLGytQuz7yjHK7J9owx
         m9uAp1TK1a4Xw==
Date:   Thu, 21 Apr 2022 11:22:00 -0400
From:   Ian Cowan <ian@linux.cowan.aero>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <YmF2mM+Lqv/HOgFl@fedora>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
 <20220421142153.GA2462@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421142153.GA2462@kadam>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 21, 2022 at 05:21:54PM +0300, Dan Carpenter wrote:
> On Wed, Apr 20, 2022 at 08:23:16PM -0400, Ian Cowan wrote:
> > This is a patch to refactor the zoran debugging function. This function
> > existed in all of the changed files and they also all import the
> > videocodec header file. This patch moves the dprintk function into the
> > videocodec header file and out of each of the individual files.
> > 
> > -#define dprintk(num, format, args...) \
> > -	do { \
> > -		if (videocodec_debug >= num) \
> > -			printk(format, ##args); \
> > -	} while (0)
> > -
[ snip ]
> 
> > +/* Print debug information based on the specified level of debugging */
> > +#define dprintk(debug, num, format, args...) \
> > +do { \
> > +	if (debug > num) \
> > +		printk(format, ##args); \
> > +} while (0)
> > +
> 
> I don't like the new format.  It needs to have a KERN_DEBUG at the
> start.  Passing the param_module is awkward.  No one knows what the
> magic "num" things are.

I was going to put KERN_DEBUG at the beginning, but it appears that some
of the calls already include KERN_ERR, KERN_WARNING, or KERN_INFO, but
most of them do not. Would it be better to split these into multiple
macros or use printk in those specific spots that difer?

> Using a module parameter is old school badness.  The standard dev_dbg()
> macros are better and more flexible.  Just use them instead.
> 
> regards,
> dan carpenter
> 

For using the dev_dbg() macro, do you define this in the header file
(i.e. for this it would be videocodec.h), or where should this be
included from?

---
Ian Cowan

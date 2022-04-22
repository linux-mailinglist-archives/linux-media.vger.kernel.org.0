Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA7450ACCC
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 02:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442942AbiDVAdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 20:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiDVAdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 20:33:23 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B9643EC5
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 17:30:29 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 34C6D8016BA;
        Fri, 22 Apr 2022 00:30:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 940C98017AB;
        Fri, 22 Apr 2022 00:30:28 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650587428; a=rsa-sha256;
        cv=none;
        b=QJc5m358nihCgV6QUeWkcIV8V/kUqeCw0xuUquEto3N8nu+MZ7RpSZ+PcPuGl3HRMOcal/
        Lsru7dKQz4acTOWpsTBnPuyEh/lGmxVX9x3enwZj75Rrs8pnYRyZxL7JI258f0QAlAkOnK
        wI8JsWfT4VNuVwcz21DpHNZ6wU84B6YRkxcLtZYlz7/cbQZSWYjVQOVLXox6RXRx6bvGtT
        bZIRhTitNRk6DaDxiM0QS7VXq/3PSPrmdACiyI8JqykxsN3n6b0UiUwEnx0YFwj4CEM997
        8m0/hN2cASX0moTnDyGkjgstdvZkeJb262DHSR3zDSzpLtpRhp2fhDG/jugsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650587428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=5f+2TYzBuKPjVaWd9BBCif69ALhTyjNVbFxGPBPuCEY=;
        b=hyn9Sp4rjGtcM8bpr4ZjoDaEiK85NXxmv7evl78FjR9hhbYDV2Ym2w1ZGJUHgIwjzyA5U3
        2dYqKZHREcy1ejBFbFK1JupzoTcl5OiYU7gf66Em4ybgEkMnmqyaXc/Aclny7CGHsPBtQ8
        ZUmcPUwXvJb1V1+34WD+/rBCilBB1Ha1E/V+yKvO8PrUci5Mjvp2pv+41nfzHmJoZWTj6h
        FDQzdLUGRTlDeJGmdq5w/ulogKkSIJ9Z/GzZ0UYRfVkiYsG/9YuB2k5Jhr+YFAPQoyjwp0
        XD9XNUIYWXvvf7jAr6XmBtdPc1Ou/ZB+GGiZj4vBhzRMVKbkBDsDL36tEnpv4g==
ARC-Authentication-Results: i=1;
        rspamd-7968956b8c-5vmkl;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Madly-Ruddy: 27ea94fa65877d33_1650587429008_3161149047
X-MC-Loop-Signature: 1650587429008:980140766
X-MC-Ingress-Time: 1650587429008
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.96.96.20 (trex/6.7.1);
        Fri, 22 Apr 2022 00:30:28 +0000
Received: from fedora (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KkwKv53Thz1QX;
        Thu, 21 Apr 2022 17:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650587428;
        bh=5f+2TYzBuKPjVaWd9BBCif69ALhTyjNVbFxGPBPuCEY=;
        h=Date:From:To:Cc:Subject:Content-Type;
        b=SNBNO965iC8ELI7Edq+KHcQ2QTqbzjH6VDHuEAh3LSEpj718kmbUJrjjLylDeQTEW
         24FUB6YTKu3r0WMOrUVGFc5TUEFGwHRFn9vPaFOuChzm7ggYkYr/nl0trzIk7tChoS
         GgsJcNel2RgLuMqP7vpKQJbj4fOQFWKcwsmAwapr4RYzqEhl9XlJx7oawISxtn7X/e
         kuw5sLFPh+eznCPw2lcQSoD6b5x1x9fRoibk49x0/v0KXCmoaynWhfpWU9PnloM9Mo
         Xhr3TPGDghyP/wDLlmFwMnL9gl9dnev3XGCSXqwf1e/+e0SNz4SVi4O+Jy1GR1msIm
         DWMRGSaeco1NQ==
Date:   Thu, 21 Apr 2022 20:30:25 -0400
From:   Ian Cowan <ian@linux.cowan.aero>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <YmH3IZhUrvEzZlZU@fedora>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
 <20220421142153.GA2462@kadam>
 <YmF2mM+Lqv/HOgFl@fedora>
 <20220421155203.GB2462@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421155203.GB2462@kadam>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 21, 2022 at 06:52:04PM +0300, Dan Carpenter wrote:
> On Thu, Apr 21, 2022 at 11:22:00AM -0400, Ian Cowan wrote:
> > 
> > For using the dev_dbg() macro, do you define this in the header file
> > (i.e. for this it would be videocodec.h), or where should this be
> > included from?
> 
> dev_dbg() is defined in include/linux/dev_printk.h.  Look around at how
> it's used.  pr_debug() might be an option, but I don't know if we will
> accept that, we prefer dev_dbg().
> 
> regards,
> dan carpenter
> 

I'm about to submit the modified patch, but I went and looked and we
cannot use dev_dbg() because these specific drivers do not have any
association with a device struct. The best we can do is use the pr_X()
functions which I have updated in the modified patch. That still removes
the module params and the repetitive dprintk() definition.

---
Ian Cowan

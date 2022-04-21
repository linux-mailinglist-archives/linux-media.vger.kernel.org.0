Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E409F50A800
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 20:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391204AbiDUSYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 14:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377142AbiDUSYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 14:24:11 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8993A46B18
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 11:21:20 -0700 (PDT)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 6C3EF561317;
        Thu, 21 Apr 2022 18:14:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a217.dreamhost.com (unknown [127.0.0.6])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 6E86D560672;
        Thu, 21 Apr 2022 18:14:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1650564841; a=rsa-sha256;
        cv=none;
        b=Ez4QihA5rm042mrgYA9iZQY6WEr1TG6hw2FpZEDLx2CRG9i4vFfjD8ai9jkqEsYmXpArIp
        AJawpqvnqFGcBtV4tR8D/aIt3Yr60Rswnv4VI8yiZc2LFZt3TtRfzBQ7JABEaXovnibAVP
        ezpOGPtNwdyOfe0Jl80AgBZListKC4Lgo6IDwlE+F5zd0X02eKXMU2rK8s13alHxStEIx9
        NEo44TEv7ZaLIqIOPr0v8m2sjUg/wRbYFQsptFeDBnKecWf3JtQi/P14ZqrTgSp4jAQacC
        j98JdE3c5hc/9Hh7WcCQ9RDAJ56mzDKlSavWiq0sidPLeTsAdgHRRCxOWkumHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1650564841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:dkim-signature;
        bh=FNhNt0OO8+NlPGDHgZLKBtaMEMHbXxrGKn/UfnYWjbo=;
        b=UlmKO3r6kQ2aPtuRa2qMHKykV//8YOpXW5vMCnvXAo2x2g34f6sFnKwmXMwlhXUxXnNPAo
        L8TZqfkjppYnR3BYBxqjbGZYdWqUl4KdcgqJGvBfoy5Kwg77FonNcArpYNpMpU+JFSRIV7
        WMtUr6ljlWCYn6YMLXJNszCWNRbpnKlYkf6yxFTeZM/6m93a7iBKhmEG2QEJex2B+D7jOO
        aF35xis4osP/x7wWFdDZDM+VaGkf5VikVxmzS32JIEWYn6SNBu8Q4HBGtX99ar3LyWmkGD
        KjELWfeuMa+GgqW8dllzSfHAFjE2sM+MFDF1x9Uktr4PG5iLsQINsh7f3g4CsA==
ARC-Authentication-Results: i=1;
        rspamd-58ff8d7479-bqpr8;
        auth=pass smtp.auth=dreamhost smtp.mailfrom=ian@linux.cowan.aero
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|ian@linux.cowan.aero
X-MailChannels-Auth-Id: dreamhost
X-Tart-Squirrel: 6a3894f104bb04fb_1650564841794_2734342223
X-MC-Loop-Signature: 1650564841793:3729074847
X-MC-Ingress-Time: 1650564841793
Received: from pdx1-sub0-mail-a217.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.101.255.132 (trex/6.7.1);
        Thu, 21 Apr 2022 18:14:01 +0000
Received: from fedora (unknown [69.12.38.97])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ian@linux.cowan.aero)
        by pdx1-sub0-mail-a217.dreamhost.com (Postfix) with ESMTPSA id 4KklzX40Ylz1MB;
        Thu, 21 Apr 2022 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.cowan.aero;
        s=dreamhost; t=1650564841;
        bh=FNhNt0OO8+NlPGDHgZLKBtaMEMHbXxrGKn/UfnYWjbo=;
        h=Date:From:To:Cc:Subject:Content-Type;
        b=uhlbfgNtmqOvZeIykCpsviK5vksbHjQBFSb2wBWlyy1sq5sXheWTEZ0yxp8RSkacI
         g8h6MGUBG3mYi5GydVPiQaRPQdFBCoetlSAgOH5dNm2WnF+kY4iYIJfbvh747W5s/g
         jARCkVcMy8Sh4EBW5DOtPsezu5lUAfq98TRhVxZkFkPqN31PcyQ03fh+Q3kinpEn9A
         l3dO88C84fIwJDE6bVaCPh3ovBmg+YW41koA9hHwn0J++Cnb0yzCkgusHI/cI810kL
         utT83jEuDyqZGbU/CcNRdrNkOkprVIDrY4RivcdZzhZOmHyWcl8+pN9SR3z+Nfsmcd
         Czjfyv7JVZDBw==
Date:   Thu, 21 Apr 2022 14:13:58 -0400
From:   Ian Cowan <ian@linux.cowan.aero>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <YmGe5vM+ictu+7ve@fedora>
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

Okay, I will make these few changes and resubmit.

---
Ian Cowan

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4B4624603
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 16:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbiKJPev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 10:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiKJPe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 10:34:29 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5492E0A5
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 07:33:37 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id h133-20020a1c218b000000b003cf4d389c41so3687952wmh.3
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeYphl7lBZ5hIGppp1mwTv7T3IKyvqmSt3rYHk9f3fw=;
        b=gAowFuVLueyw4SHm/QaYWTWVZ4odtRKR5jvqIDjxpxfIqk9hMSdwdEqa9SDiciIGpZ
         o7DC478k1f0CBa/hzEmHsK6PILrXn7N+/fc/Qj3p7Qm1qJjvl42l9jlv8z99OT8wteyz
         pY05c8fgA1PusoUagg7K0HJ+28pK385L13H9BV/jXxSeJLUa7Cuue//H/8zkxERyfjgG
         vu3XXVIBxSh7H/f6cePqFokGm7X8B10A4cGllbvIkpTaIE/w3JF8cBh/XPSf8gp/QWtA
         qisQzrRErnBrh6LwLqwhrg78ICm5q+U/YMOTaTiCgp54UUpd0bJiQiFiEg8ulo4Ay6pA
         8r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeYphl7lBZ5hIGppp1mwTv7T3IKyvqmSt3rYHk9f3fw=;
        b=vc34kAt3QfFYULKjN8SKcfCKp0PrOcimF6f26s1abBGaCWgeJVACNxecWm7qqTK7lc
         CX32tKyvunNgQ9mvX5+gAZhjry+X4ge8J/Yr2Jla5vGoHq9O5N6tLkpzaDNN6dU9Hnmt
         5cP34kZOlSXntfuIgf/MKUdc3fL+eCFmKM39OaMOFCPU51aHq13goH6kD6LS7yz1MIXW
         XvXJTfDCgTErs8kXnZlyJspZyo3FguskrPSMxCiYivwgCRmImrsGAGuSFVroZhsjMryG
         4dQshIUxBG8B5dZqrZCDgn/+EeXEnA4DaKD0DI5OwpMaVxWKZPslK4ldAymUbIjTLytc
         +KAw==
X-Gm-Message-State: ANoB5pmqB7O/vhyxrIslz1yQuVHvYTZ7RcYfI9lhmh4YKTQme8VucpmY
        0FxKiOwf6sFDFWbqQQ8trhA=
X-Google-Smtp-Source: AA0mqf4VYQCyZ+IsRLoL152scLLasmY1W9nrn0BwQ2/PBVIML30CIO12/OThHIdIV2JhN/DXCnbz2Q==
X-Received: by 2002:a05:600c:13c5:b0:3cf:a972:d809 with SMTP id e5-20020a05600c13c500b003cfa972d809mr15147141wmg.122.1668094416356;
        Thu, 10 Nov 2022 07:33:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bj19-20020a0560001e1300b002302dc43d77sm16639575wrb.115.2022.11.10.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:33:35 -0800 (PST)
Date:   Thu, 10 Nov 2022 18:33:32 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     oe-kbuild@lists.linux.dev, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y20ZzOkfAov8KoHU@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
 <Y2z4n8b+tEtzNR/4@kadam>
 <Y20ErxBkDVVGzYim@kadam>
 <Y20FWdCTPiKWOdNd@kadam>
 <2cb3af44-8624-ded7-a904-5261f619f436@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb3af44-8624-ded7-a904-5261f619f436@foss.st.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 10, 2022 at 04:04:34PM +0100, Benjamin MUGNIER wrote:
> On 11/10/22 15:06, Dan Carpenter wrote:
> > On Thu, Nov 10, 2022 at 05:03:27PM +0300, Dan Carpenter wrote:
> >> On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
> >>> On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> >>>> After running smatch on my tree I couldn't reproduce this warning:
> >>>>   warn: pm_runtime_get_sync() also returns 1 on success
> >>>> I'm using the latest smatch cloned from github. Do you append some
> >>>> options to kchecker to get this output ?
> >>>
> >>> TL;DR: Thanks for the report!  I will fix it later this week.
> >>>
> >>
> >> [ snip ]
> >>
> >>> It creates a fake environment to test what !ret means
> >>> for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
> >>> the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
> >>>
> >>> Smatch shouldn't be printing warnings from inside the fake environment.
> >>
> >> Nope.  That's not it...  It already has code to not print from a fake
> >> environment (unless you're in debug mode).  It's a mystery how the
> >> kbuild bot triggered this warning.
> >>
> >> :(
> > 
> > Ah...  Seeing your patch helped me figure it out.  The kbuild bot does
> > not have the cross function db built so when it sees:
> > 
> > 	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);
> > 
> > Then it doesn't see that "ret" is modified.  On my system I have the
> > DB so I don't see the warning.
> 
> I also have the DB, so that explains why.
> 
> However, 'vgxy61_write_reg' does not always modify 'ret'. In fact it's
> worse, at the beginning it checks if it not 0 in 'vgxy61_write_multiple'
> and returns if it's not:
>   if (err && *err)
>     return *err;
> with 'err' being an alias to 'ret'.
> 
> I did this to avoid checking all my i2c writes. I just send a bunch of
> them and check the return code at the end. But if one i2c write fails,
> 'err' is filled and all following writes are aborted due to the code above.

Yeah.  I could have written the way you are saying but the way it's
working now is the Correct Way[tm].  ;)

> 
> To summarize: if 'pm_runtime_get_sync' ever returned 1, no i2c write was
> performed. That's why I needed to set 'ret' to 0 in my patch.
> 
> 
> The warning spared me from debugging this, thanks a lot.

Yep.  It's like a stopped watch which is correct by mistake.

> Could this warning be produced even with having the DB?

The problem is that there isn't a way to tell whether "if (ret < 0) " is
intentional or not.  I've actually modified it now to warn about that so
I'll look at those tomorrow and hand audit them.  But I'm not optimistic
that there is a way to tell bugs from features in this case.

regards,
dan carpenter


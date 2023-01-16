Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2EF66CF69
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 20:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbjAPTOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 14:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjAPTOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 14:14:48 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 805002B081
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 11:14:47 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 375E11B002E3;
        Mon, 16 Jan 2023 21:14:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1673896485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BNTBozArzOH4oFq20640DeE+6wtz4uk6ThICVlEEOOM=;
        b=R8GYQ3z5mvmo+T9vq0zXQKPclN6aE4gW9H8zet5T3CziqbHaUgRpkoVBxQjcbNqC4t1o97
        dSuE8AdJs0Rowj2Vj8V965o+e4AR+xf6vcjT21z51FJwwfTkFZCnXEzHN/9kcqOz0BNp7s
        HSDJ9oO459mvVMIgpoxVGmEsP68d2CVB7p6GgfbfM29tFjmjuNSK6PnJV2IaRbYXPfe9wQ
        6e7wlcBq0gUCWvIfzaHHr5isfeW82MHBFjml7xAdJ3j20oqvS/oFHyEv05C5lApOm+JHCZ
        X4EF5Ul0k02co8E5SrmMT+91OafMSFJ1vxHaW2tz4DBEZWPgUZS9zM7bgtodGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1673896485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BNTBozArzOH4oFq20640DeE+6wtz4uk6ThICVlEEOOM=;
        b=ua57k06YAtJRIkWTih7PP4+ujzwlQ36rPI+2S5fgcDPis6BGQX8nE28lTX8tpiPrJBE7On
        FpN+WUwbWl5GhYHhbjzOqyeJ1zk1w5WWNW2b5s8okMwZDHSCX9MTYYFekmUH6O/MMsYLKt
        Jlhsd8T905hJcLMl1VPfCAb/1ixz/SKJ98cFGrU8a42Ja1CczvDM3oDFvwFSAwMUZHd7XC
        TGWcHDcLYxsrn9U+wgZRP+NqaR/pNlbkTFoztxHW0FRy7LdlRIeckCjfE9OoGe0Okh+X3Y
        hBELNYcDfkXvz5GPXAw+nw7qw+DMd7YrjCxenQjF1oWJiDbT7NZ154W+gtBy5Q==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1673896485; a=rsa-sha256;
        cv=none;
        b=JQrN6NbpoNK5+fI1RFZw/Ph/ZVqUdUUtLhyDmkE5JTdrilUmow4iDKuV1Amk+bRoB+32QI
        ++OoMQb1k7/jXXDPSdOE9V55ftxeDBETyoCOrNl72jj4n8NgkVOfVJ5pqWds6byQb4XVgK
        kzlSMxF6A4gokHmQ2KFh4FTMQOJii5UCZ76KTqV4k/Hj6RI2Futm68Yj7xCzwCvicgwOsE
        ta26pFl5y19bhHb+D/C4goC7NBV3FLNRPneYEUFuD05tujV+VFtL/vh5xZia4aaoqjDAWq
        MUrMsiOURl/x45zcRGi2I2aDHp5+ADbqCmnd5HYHGqec5808GHbWC7JBZcOZEw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A32F5634C91;
        Mon, 16 Jan 2023 21:14:44 +0200 (EET)
Date:   Mon, 16 Jan 2023 21:14:44 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jai Luthra <j-luthra@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v4 1/2] media: ov5640: Fix soft reset sequence and timings
Message-ID: <Y8WiJLvRiBnmmapc@valkosipuli.retiisi.eu>
References: <20230103122736.18479-1-j-luthra@ti.com>
 <20230103122736.18479-2-j-luthra@ti.com>
 <20230103170738.hldmc6pu4s2jch3e@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103170738.hldmc6pu4s2jch3e@uno.localdomain>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 03, 2023 at 06:07:38PM +0100, Jacopo Mondi wrote:
> > +	/* software standby: allows registers programming;
> > +	 * exit at restore_mode() for CSI, s_stream(1) for DVP
> > +	 */
> 
> Multiline comments are usually written as
> 
> 	/*
>          * Software standby: allows registers programming;
> 	 * exit at restore_mode() for CSI, s_stream(1) for DVP
> 	 */
> 
> It's a trivial change, I'm not collecting patches so I can't offer to
> change it when doing so, but maybe Sakari could help with that so that
> you don't have to send a new version ? (if that's the only comment you
> receive ofc)

Works for me.

> 
> The patch looks good to me
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonaboard.com>

Thanks!

-- 
Sakari Ailus

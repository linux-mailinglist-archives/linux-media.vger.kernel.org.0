Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA2462D73D
	for <lists+linux-media@lfdr.de>; Thu, 17 Nov 2022 10:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239581AbiKQJlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 04:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239671AbiKQJlA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 04:41:00 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB4259177
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 01:41:00 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id D3A9D20034;
        Thu, 17 Nov 2022 11:40:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1668678058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4jQgGBwxoD8A/qSsVrht2oslLRZA9lYae0tMN2tdr+E=;
        b=VO+Jeo3IabPM8gmxjLamXITuizLpNSV8b/VXIBmIeTNKWw8UcT4mcz0dXyCsd/2FIN0XeT
        MdMIcWnVvmu6gJNKg+Mu7r/CAg3xSXZJESzsUZxV1TgHUuy2nJ/m+2VAkZPrBFKKqqA29s
        u8vCO3ZGLF0ADfupDBdCH1qOJOh67ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1668678058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4jQgGBwxoD8A/qSsVrht2oslLRZA9lYae0tMN2tdr+E=;
        b=IJpB0iFDoy4GJQFqG6GjcVAzwOzdVyKFGca2Xg/qxzyTippStP+sI/2HznnkjT59PZVQ3n
        dMJniZEVUGA4p6Xbk/DDyxnMF79CDW9GgexmFY9IacVkY0I81lX3WiJWK4LC2E6SuShDul
        TrUKA9y71Mh9ddFD4p1MNMjl7z2nTrI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1668678058; a=rsa-sha256; cv=none;
        b=X9MiNJJgH8FTL72tP4q062K+8ocrNTC14LVAjLTLhY3NQouV9UBOvXxO+/6vEosFii2l/3
        Y2JgYbDIcdYtYxioCpNv7sAuAyeel9Y2gnIzxUYUuI7EvnGeTszS/GHZAkZyzKWauMyhbB
        a5Y0mDsRH1qR6WrAdicP23YM0RPa0O8=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 34824634C96;
        Thu, 17 Nov 2022 11:40:57 +0200 (EET)
Date:   Thu, 17 Nov 2022 11:40:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] media: Add regulator support to ov9282
Message-ID: <Y3YBqQgr+Hk1H+Sy@valkosipuli.retiisi.eu>
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
 <CAPY8ntCeh7=q2gL_4SK6jq=Mx7KfTt5YF-BkeMvv73tRGjzNPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCeh7=q2gL_4SK6jq=Mx7KfTt5YF-BkeMvv73tRGjzNPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Nov 16, 2022 at 04:50:27PM +0000, Dave Stevenson wrote:
> On Wed, 5 Oct 2022 at 16:21, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > The sensor takes 3 voltage supply rails, so add the relevant
> > configuration to the device tree bindings and driver.
> 
> A gentle ping to this patchset.
> The other patchset for ov9282 that added functionality has been merged
> and made a pull request already, and Patchwork was reporting this one
> as "Under review" for longer than that one was.
> The DT side is ack'ed, and the driver changes are pretty trivial.

Oops.

Thanks for the ping. These are in my tree now.

-- 
Kind regards,

Sakari Ailus

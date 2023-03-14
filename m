Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D3F6B92BA
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 13:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbjCNMK3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 08:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbjCNMKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 08:10:18 -0400
X-Greylist: delayed 382 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Mar 2023 05:09:44 PDT
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0FD5617E;
        Tue, 14 Mar 2023 05:09:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4PbXP45k5BzyVg;
        Tue, 14 Mar 2023 14:08:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1678795720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X3YvPxHbI3RAoUHK+3p6RsY7oYN+m0VVSvVONDpbYyg=;
        b=XF94RFmXl8bcQ4c4q6wKMNdxF3ATibu9hSYiUgbmOmZlgDIFvc9uDGAYS4j2iZkS2oRMeC
        8VPEo9a5Gk78dHK2ZDmDPvpjdFtygDTUOH3221zb9mPfKwzAWy9KRKtl7yRazdCFzk+k5x
        K5uoo0KQgVJzqsadsSkeEan4/AYIKA8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1678795720; a=rsa-sha256; cv=none;
        b=LY6KNv0QxONCPXHacs6j3mlbcO5QFxltEdfwKAp5eBVXviE/YkXmRTFgL3KiMy6G8xFJf8
        h/MXP0VGinvmlDuSFSKKf1V19sU0IpYpSLjREGcvYn3xdvnVg+X5D+fjiRu4PIhET6Jl8Y
        HrdnhDqwMmqdzhF5pRLR2wP5bGvmX5w=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1678795720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=X3YvPxHbI3RAoUHK+3p6RsY7oYN+m0VVSvVONDpbYyg=;
        b=h1h6GW0XbiczgnOR5/N3cPEhNCXBgQvTKF/UEgIgKI7u5ECD8cD4V1ID+G083NEjdO2Lzv
        yzcc4T22vh0RDj+KWHyFnL0nyalZDbtF2pivoKA6hKlRp2JysQe7q1CnSpJEmojuNSjd9e
        qpX0xPBkjDN5y8/sfsEtucZ28PkrStE=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 26BEA634C91;
        Tue, 14 Mar 2023 14:07:38 +0200 (EET)
Date:   Tue, 14 Mar 2023 14:07:37 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: i2c: ov2685: Make reset gpio optional
Message-ID: <ZBBjiQNJhzPu4h1Y@valkosipuli.retiisi.eu>
References: <20230129-ov2685-improvements-v2-0-210400f2b63e@z3ntu.xyz>
 <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
 <CAPY8ntDvviyCox5_WpmOcgMgHuok9LcF1NSgRkfcHFcSgGVuSw@mail.gmail.com>
 <4481296.cEBGB3zze1@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4481296.cEBGB3zze1@z3ntu.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Wed, Feb 01, 2023 at 06:28:47PM +0100, Luca Weiss wrote:
> On Mittwoch, 1. Februar 2023 18:24:10 CET Dave Stevenson wrote:
> > Hi Luca
> > 
> > On Wed, 1 Feb 2023 at 17:07, Luca Weiss <luca@z3ntu.xyz> wrote:
> > > In some setups XSHUTDOWN is connected to DOVDD when it's unused,
> > > therefore treat the reset gpio as optional.
> > 
> > The binding doc [1] says that reset-gpios is a required property.
> > Making it optional should therefore have a patch for the binding
> > first, and then a patch updating the driver.
> > Unfortunately my understanding is that means converting it to YAML as
> > well due to the txt docs being frozen.
> 
> I already have the docs converted somewhere, I will send that separately. Hope 
> that's okay.

I took the rest of the three patches, there doesn't seem to be a dependency
between these. I'd suggest to merge new versions of this and the other
patch into a single set.

-- 
Kind regards,

Sakari Ailus

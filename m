Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD49633117
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 01:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbiKVABU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 19:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiKVABO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 19:01:14 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242BB1D30E
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 16:01:14 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C22D52024D;
        Tue, 22 Nov 2022 02:01:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1669075270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pOgZxu6oA+xdulcsE1WdCwefVGW+WLE2mFPGCRIlrB8=;
        b=rPKXPIh9lSYAgaZ57RrAs5SAnyiA00kmQ9pvfq+K64JlzfQ3MTxSeMbv82QoJ/VIltB4Dx
        dDpDJ7SA7Bq8eb18lEl15pUT3ML9/jrVQeAcuecdmQHQAdHGiB9SArV8QGJAtYfdtd3Ye7
        kYcHyoi8UXQfP4eJo+c4ToaHS+hAfZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1669075270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pOgZxu6oA+xdulcsE1WdCwefVGW+WLE2mFPGCRIlrB8=;
        b=BOidMXEhLy5fvL+bTEsJAiHPzHyXjszigrENFM7JX+uTWKiMqrKX58DjMVuq+rnJIj1IwD
        GQvDMjh23kbAE89EydT60OA+3gi7+IrFo1AWiEAa2slr7EAanUWZUEfv5Qy5Iqxv0I7IhL
        r5vTSwXTYvaWi7vo8B5Rmqk7v9NAd2A=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1669075270; a=rsa-sha256; cv=none;
        b=QG+Gvw9oSjEJ/J+o8J89HJKQFqPCzkkdHIZh/4fsOe0jRNEA1DYmwjuQh5Z6agx9xr/jVZ
        7v7M7oBgFF2sAaFEDNgZmHbqIV/FBORgGyJQMGDHoCQjJNv9UzpMZwnn0gCBKjIqfMfuVD
        hxk3gwD050P7UNNJl2lTiXWazd/ATtQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35E82634C91;
        Tue, 22 Nov 2022 02:01:10 +0200 (EET)
Date:   Tue, 22 Nov 2022 02:01:10 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 00/10] media: ar0521: Add analog gain, rework clock
 tree
Message-ID: <Y3wRRrqcCT6Cw2FC@valkosipuli.retiisi.eu>
References: <20221104142452.117135-1-jacopo@jmondi.org>
 <20221121174933.fousgbqgmgxvvdmf@uno.localdomain>
 <Y3wMAVlpal8SHJuF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3wMAVlpal8SHJuF@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

On Tue, Nov 22, 2022 at 01:38:41AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> On Mon, Nov 21, 2022 at 06:49:33PM +0100, Jacopo Mondi wrote:
> > I just noticed patch 10/10 was missing.
> > 
> > Now sent in reply to this thread.
> > 
> > While at it, gentle ping to see if this can make it for 6.2 ?
> 
> I'm drowning in reviews, so you'll need another volunteer.

I rather thought the set is good as there are no comments for almost three
weeks. It's in my tree now, I expect to send a PR soon...

-- 
Regards,

Sakari Ailus

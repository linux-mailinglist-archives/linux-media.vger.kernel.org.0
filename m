Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAAF586171
	for <lists+linux-media@lfdr.de>; Sun, 31 Jul 2022 22:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbiGaUry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Jul 2022 16:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiGaUrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Jul 2022 16:47:53 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED8A65E8
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 13:47:51 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id B2A0F20337;
        Sun, 31 Jul 2022 23:47:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1659300468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMBiblLs+PrwsyUSTNH56VxnL3Jc0LWnXPB3gjs+1M0=;
        b=TGIHOQ8o1FjLiQ+n08yeX9dUn6/94wplSxPE5hdY5YnxlOxxYUUueYfuenNDyuQ/aJRzPH
        RUiKcRS4w0HiMVuo/LmzrHnHo5MiPS7DZqWlt38KCnOfAy1viWJjal+Uy2mAazCbp57ejD
        /RtUgG22CWrNTwM9rG+/RMzGW0huWbA=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 29C3A634C97;
        Sun, 31 Jul 2022 23:47:48 +0300 (EEST)
Date:   Sun, 31 Jul 2022 23:47:47 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 00/30] v4l: routing and streams support
Message-ID: <Yubqc1biiQTE3gvY@valkosipuli.retiisi.eu>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1659300468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMBiblLs+PrwsyUSTNH56VxnL3Jc0LWnXPB3gjs+1M0=;
        b=WZv40khS4EMY57v7TtpUmF3NK0ZlBygibRrTYzw2Y+47/E6lMK3XlxSmPhzN3Fh2rqH92V
        h7LTfTFpY2twDrQsro1YZAY/EdVkrvkeMfiHyoX8Hr2Fbq6Cjtfkc7vYfPJpRw3xjUYl0Q
        sZydISo75AfuohHaoBUcXQa7J0PWN5c=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1659300468; a=rsa-sha256; cv=none;
        b=lqqpk+g0ru0xeXXG5+hVGw3c5i36dYw1eKOgQNVApZEgo+E3n3WbhxiN3CbYvvUt9Iwlm0
        eFph7bVtFlOvJ3lOtv5sokxLPyF0N1/F7sf5q5E4q+Gi/ri3PH6Hg16qAutWYTc8t1lquV
        WseooXxPC+jLUvX0sDwD4O2YKCJsnNY=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Jul 27, 2022 at 01:36:09PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> This is v12 of the streams series. The v11 can be found from:

Thanks for the update. This continues to be a set that will need changes
before merging, hopefully less so than in the past. But at the same time I
think there are a number of patches early in the set that could be merged
now. Specifically I mean patches 1--5 and 7.

I'll pick those if there are no objections once we have rc1 in media tree.
That should at least make it a little easier to work with the rest.

-- 
Terveisin,

Sakari Ailus

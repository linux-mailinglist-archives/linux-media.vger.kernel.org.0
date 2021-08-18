Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D693F0C81
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 22:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbhHRUQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 16:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbhHRUQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 16:16:25 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57389C061764
        for <linux-media@vger.kernel.org>; Wed, 18 Aug 2021 13:15:50 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dbd1vftgng281pd4yskly-3.rev.dnainternet.fi [IPv6:2001:14ba:8eb:1240:ab2d:b956:f00:7a12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5F579200CE;
        Wed, 18 Aug 2021 23:15:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1629317747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZQ/waZgJwLCEzD0vKdhEjQNqAq65vN1RjzSS2C3sGcY=;
        b=C+UGn3YtMdsAxR4A9zeUGrESIsr9H/Cnt9sWDzG5Qx7bqNzzML/YBICIZ6mq75XqAiNlZF
        x2GXswnMrdsZofJOl0u8oPfw1IAoI4hjsv8ctGGgMYticnXc/9Jkug64xkDFlUBpAFnJPt
        vzAmIx1w6Lbb75tMwFDl4+ifUBAupAA=
Received: from valkosipuli.retiisi.eu (unknown [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2685B634C3A;
        Wed, 18 Aug 2021 23:13:31 +0300 (EEST)
Date:   Wed, 18 Aug 2021 23:15:46 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Driver for ON Semi AR0521 camera sensor
Message-ID: <YR1qckqUpUwnm3IT@valkosipuli.retiisi.eu>
References: <m3im0s9rks.fsf@t19.piap.pl>
 <YR01VfIM5o1PmcWY@valkosipuli.retiisi.eu>
 <YR053s0EoYrz/RcP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YR053s0EoYrz/RcP@pendragon.ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1629317747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZQ/waZgJwLCEzD0vKdhEjQNqAq65vN1RjzSS2C3sGcY=;
        b=KmHu+q13MsxDoH5Kb+yOL93O9VJpwawNyQDuG5Dd5VHXu4MjLq0FewQhQ3qruLrDuFpNvH
        F5JArj2eB4MbABujiCG4eEvxIjkpu1EqNHse2YDM4bL3YFUsIRBn0U3FfRQN4ZePAajL0H
        81rQmnlXOxd8niJckiSikJwcMkQzX4M=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1629317747; a=rsa-sha256; cv=none;
        b=uWFWJ2c3zluOAW5WF6iGWC05gWKr1y2ARuLiDG89Lttarv1PEzl1pIfmYR+NLzzOeA+ys+
        PmBAG18+gzjgMRSX3QuqvFE9BilWtpjvZw72U+CV3/pCgmvKKOJIGX2rZDRxVK5BQJi9HV
        XAJNVU2soQjtwmLmVm+fWjOp0KMBqb0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 18, 2021 at 07:48:30PM +0300, Laurent Pinchart wrote:
> > > +static const char *mhz(u32 value)
> > > +{
> > > +	static char buff[32];
> > > +
> > > +	if (value % 1000)
> > > +		sprintf(buff, "%u.%06u", value / (1000 * 1000), value % (1000 * 1000));
> > > +	else if (value % (1000 * 1000))
> > > +		sprintf(buff, "%u.%03u", value / (1000 * 1000), (value / 1000) % 1000);
> > > +	else
> > > +		sprintf(buff, "%u", value / (1000 * 1000));
> > > +	return buff;
> > 
> > Sorry, you can't do that. buff is allocated in the stack and the memory is
> > no longer available once the function returns.
> 
> It's a static char array, so it won't be allocated on the stack, but
> it's still bad practice as it's not thread-safe. Given that it's used in

Ah, yeah. I missed the static there.

> two debugging messages only, I'd hardcode the %u.06%u format in the
> callers.

Or just plain number in Hz. Both are fine though.

-- 
Sakari Ailus

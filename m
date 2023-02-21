Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74E4969E273
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 15:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233358AbjBUOhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 09:37:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbjBUOhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 09:37:01 -0500
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC852A9B5
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:36:46 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id CEAFC2018F;
        Tue, 21 Feb 2023 16:36:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1676990203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rLjywdujy109m+R48PbMqHncwxC03tnlXoxjODFAaPU=;
        b=Bx0nKcRDK1xdAjaDpLEuYwiBIJEgZv/uOE6qyyZVO6dZnJGu95HTbBj7n/R/hcUbF1IiF5
        og4L0fC06uQutQUbk+lTgFGPVa+m5tLWT1M6yLB2lz41liFxNbUm7+uZnNv9AGwG4II4UN
        NMwXtL5Vr/TW/lE/ulv6IPa1xZHWwGs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1676990203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rLjywdujy109m+R48PbMqHncwxC03tnlXoxjODFAaPU=;
        b=Z/MOaRkBk2yHtSxxIyV64jfFpD154Eeism/xAlh2V13Y5A2P0vNPY6dkFxT1dUUFsJWZyi
        Ye/EECv4LNGoxevkwsAzEOwXDAtCzJPpAiKW1tiKoRb9p1ti9+oyqsp1F8ABp9k6PueG9S
        Ncz+AXiIcyKlMaZXvmaYq0VhAy4h83o=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1676990203; a=rsa-sha256; cv=none;
        b=XQcHZyNKgRg+9T+MiXeI2aE95B1nCUUjRrUOLpzbEv2jdPijU0TuLk/jZZtnTbq9+dZx8T
        Akc13CdLT2gLrOlJvjykTwTBhy9/yqIy7GeJ0CWGfeKWdPvB29ZinRvttTM3sEACwXsO2c
        l8TMdUmj9BLtTxDDWk5szGIdh9v4h5c=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5816D634C91;
        Tue, 21 Feb 2023 16:36:34 +0200 (EET)
Date:   Tue, 21 Feb 2023 16:36:34 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v9 0/7] Switch build system to meson
Message-ID: <Y/TW8u5zxuoOkykr@valkosipuli.retiisi.eu>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Feb 21, 2023 at 04:31:57PM +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v8, minor review comments have been taken into account (see
> the detailed changelog in patch 3/7 for more information), and a build
> breakage when cross-compiling due to incorrect handling of config.h has
> been fixed. Better handling of config.h is also included in patch 7/7,
> on top of the removal of autotools support.
> 
> As far as I can tell, meson support is now ready. I can address review
> comments in a v10 if there are any, but I'd like to merge it soon to
> avoid another painful rebase. I'll be available to fix issues on top if
> any problem is encountered later.

Thanks for the update, again.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

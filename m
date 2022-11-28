Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2AD63AA40
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiK1N6s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiK1N6r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:58:47 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526D92B6;
        Mon, 28 Nov 2022 05:58:46 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 46AE320335;
        Mon, 28 Nov 2022 15:58:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1669643923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fjhSV9eVKOK8jVAdgZB5oP8tArGtwRVNHCNvz0wa3qs=;
        b=FCmSDafEbTDpvfu/Af/WuiwcUyg1olZVkDsoX8MmSrQ1mG479jc0feshKOo4rDdFrwBfrN
        rQWvZj+whnIPxc1eAvN+pouADJ9q35MECI/bmYF2vfEF0dt6tmL4CVU/3QvO3QV9/7zDcY
        eTP3NxfrXnS7E1ikhz2Yi0QV0gC0pro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1669643923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fjhSV9eVKOK8jVAdgZB5oP8tArGtwRVNHCNvz0wa3qs=;
        b=jx5p/62ThNv1g3Ao4AW5mvqcZA7Y+DUuL3VWFl2EiNshist/eErOywx0+yBCXtgvpENN3h
        shd8P9csoooCI96AxihGPSWQMdFKOdwplvky+5O3F/XPOuGtapQ0IwiUnkyb/bbeUpqZHx
        jmyfCNFWWZfMgOLkXfiaXQLZcpE7sQI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1669643923; a=rsa-sha256; cv=none;
        b=WNGMWQK1It8GpjsmiMWrdUehfq8mYlJ/O++AEfscczB2L9WrvaIqIi840Pe01cxIenychg
        2q9Ys8eGyTqBsCNNsMUZHWw4WwpBYiQMSjU4Np92XQBfqV7ltVBTDa7DhitSYGo+Rm5MWm
        U/+S8J1PnL1BBhJZo9OdDSUlIh+vyfo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 81EE0634C8E;
        Mon, 28 Nov 2022 15:58:42 +0200 (EET)
Date:   Mon, 28 Nov 2022 15:58:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/2] ov9282: Add ov9281 support
Message-ID: <Y4S+kroyBqhohW22@valkosipuli.retiisi.eu>
References: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
 <538d4c30-aa78-ed05-4c46-84018fd9afdd@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <538d4c30-aa78-ed05-4c46-84018fd9afdd@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Nov 28, 2022 at 02:52:28PM +0100, Hans Verkuil wrote:
> Hi Alexander,
> 
> On 11/24/22 11:29, Alexander Stein wrote:
> > Hello all,
> > 
> > This is v5 of the ov9281 support series. Thanks for the feedback I received
> > over the time.
> > 
> > Changes in v5:
> > * Removed unrelated patches from the series
> > * Squashed previous patch 3 & 6 (now patch 2)
> > * Removed error handling for device_get_match_data() call
> > * Added Kieran's r-b to patch 2
> > 
> > Best regards,
> > Alexander
> > 
> > Alexander Stein (2):
> >   media: dt-bindings: media: Add compatible for ov9281
> >   media: i2c: ov9282: Add ov9281 compatible
> > 
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 5 ++++-
> >  drivers/media/i2c/ov9282.c                                   | 5 ++++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> 
> With the latest staging tree I am now getting these smatch and sparse warnings:
> 
> sparse:
> 
> drivers/media/i2c/ov9282.c:267:24: warning: symbol 'common_regs_list' was not declared. Should it be static?
> drivers/media/i2c/ov9282.c:145: warning: Function parameter or member 'crop' not described in 'ov9282_mode'
> drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'supplies' not described in 'ov9282'
> drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'pixel_rate' not described in 'ov9282'
> drivers/media/i2c/ov9282.c:190: warning: Function parameter or member 'noncontinuous_clock' not described in 'ov9282'
> 
> smatch also has this:
> 
> drivers/media/i2c/ov9282.c:1262 ov9282_power_on() warn: 'ov9282->inclk' from clk_prepare_enable() not released on lines: 1252.
> 
> Can you take a look and post a patch on top fixing this?

The two patches aren't the culprit. I've seen a report on this, too. Let's
continue on the other thread once found.

-- 
Kind regards,

Sakari Ailus

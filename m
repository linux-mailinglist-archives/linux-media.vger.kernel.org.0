Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3935D583DFA
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 13:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbiG1LsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 07:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236421AbiG1LsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 07:48:01 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C4351438;
        Thu, 28 Jul 2022 04:48:00 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5F588203D5;
        Thu, 28 Jul 2022 14:47:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1659008877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+tHy9h65vJZQaaGgoTKb8eP0eWKQ+deaT4/swsvy4MQ=;
        b=d2cc2CT5N3dF3OFA118+wXEOORCKUNq80P0AhQlRbt1gbApuvi/bhdtKspP7ph4s881kDX
        amCxca7Aj/PTFmE/pb7/I7XH0P4r4m/7FAY8kWFgpINufv3LkxYuCl6FXKQvI+UzI6y74Z
        nIhZwCc9yz43q8q3Dl7vfgHfusJ433Q=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DED3E634C97;
        Thu, 28 Jul 2022 14:47:56 +0300 (EEST)
Date:   Thu, 28 Jul 2022 14:47:56 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] media: i2c: ov9282: Set v4l2 subdev name
 according to sensor model
Message-ID: <YuJ3bMxaIp9tEgsN@valkosipuli.retiisi.eu>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
 <20220722131947.2456988-7-alexander.stein@ew.tq-group.com>
 <YtqrJp8qZOwYdUrZ@valkosipuli.retiisi.eu>
 <5587982.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5587982.DvuYhMxLoT@steina-w>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1659008877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+tHy9h65vJZQaaGgoTKb8eP0eWKQ+deaT4/swsvy4MQ=;
        b=FruJqP/tcsHtJltxJyRs5KwE5J30PIFOzg+7rg5T0G31ghvTxF6cF250ZlOD/n722oGMlG
        xa2ggrm1QbP1b66+fmtlzGL3qxCMfgLDtia9xtJQQmuEsa6wcQ/Xlb22VsbRNB23NQHnNC
        mkHptxbhUtzFIaYEWXp5m7RJKeCTN2g=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1659008877; a=rsa-sha256; cv=none;
        b=oWHG9VQD8iljm5Unp6XhAf7Vg/1jKsyv9uAW5HRzYuh+9U0f2wyL3GxwqO0lS3K0TjOW4v
        1IlGgipgdpy7Z/r1H1oTBRQadoFWkQkEydDNzG6cpF6HugO4EU5oNJ8B/QdD0zcHbf/w2t
        AWCk2gxl+llz79UOolfvbUujohXrIEs=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Mon, Jul 25, 2022 at 08:38:57AM +0200, Alexander Stein wrote:
> Hi Sakari,
> 
> Am Freitag, 22. Juli 2022, 15:50:30 CEST schrieb Sakari Ailus:
> > Hi Alexander,
> > 
> > On Fri, Jul 22, 2022 at 03:19:46PM +0200, Alexander Stein wrote:
> > > To distinguish ov9281 & ov9282 the name has to be explicitly set.
> > > i2c_client already has the name parsed from the compatible.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > 
> > >  drivers/media/i2c/ov9282.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index 352dbe21a902..dbc0a4cd060f 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -1047,6 +1047,7 @@ static int ov9282_probe(struct i2c_client *client)
> > > 
> > >  	/* Initialize subdev */
> > >  	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
> > > 
> > > +	v4l2_i2c_subdev_set_name(&ov9282->sd, client, client->name, NULL);
> > 
> > Could you instead do this based on the compatible string in the driver,
> > using device_get_match_data()? The approach works on non-OF systems, too.
> 
> I actually don't like doing the same as of_modalias_node() is doing.
> Until non-OF support is added (if ever), I don't see any benefit in doing so 
> right now.

client->name will be wrong on un-OF; putting this string to device match
data is a better option. It'll be about the same number of lines, too.

-- 
Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B001C389611
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 21:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhESTDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 15:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbhESTDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 15:03:13 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302FAC06175F
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 12:01:51 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 3F7442018E;
        Wed, 19 May 2021 22:01:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1621450908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ssvzXEsTKxPNH609zlUP6Nsybv42jNeVLh7L5JxWZfI=;
        b=SW2nBVMYKVvaJiSWDfemtc3eAlRWw2lFhRGuXO49KKvLibv9lqPH7xpomgtozqaM7sCJMP
        AeHJXo6VxosCg6XpQPD6PQpk2vmHWiQotFBLd5MfaTppZTQ/FZ3TLNQ50ubLjp0q90xAlk
        +G9pYOD5c3EwXBptS5KgBkGv7oxOfKE=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CB0D3634C87;
        Wed, 19 May 2021 21:58:20 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1ljRS1-0000O0-0N; Wed, 19 May 2021 22:01:49 +0300
Date:   Wed, 19 May 2021 22:01:49 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <20210519190148.GK3@valkosipuli.retiisi.eu>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
 <20210517100240.3323-3-david.plowman@raspberrypi.com>
 <20210519190121.GJ3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519190121.GJ3@valkosipuli.retiisi.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1621450908; a=rsa-sha256; cv=none;
        b=hGH/gEoyKsxpAeq9ZOLoaVQY0L9m21VjFaloCXSxNFd4xiymSeVCGyx7znAPOjomnmdfsT
        LXiLWLtFknDU0xl+2HxSimsOujUmCeHllziCGS03G/VvnrtMBlj4VwfUClkOBIzl1wMUTa
        xVDJcJKxnXjW5mJZSzwC9E/dOU0iWec=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1621450908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ssvzXEsTKxPNH609zlUP6Nsybv42jNeVLh7L5JxWZfI=;
        b=UH4g33qpiHpmMKGYrV5h9fjD69NE33QwS8zZhm9c7mDrlnDPZra1TZvs2bJ/WWkXb48qzv
        /RISqJgpfLvpP78zLb35+c51N8vf2YvhtAB0btSrmouO/fxYxo1qMY5Tvqzd5s9xQ4thSm
        qWPN0klAiufZblDZolbNnOCd1cnGiL8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added Laurent to cc.

On Wed, May 19, 2021 at 10:01:21PM +0300, Sakari Ailus wrote:
> Hi David,
> 
> Thanks for the patch.
> 
> Cc'ing Laurent, too.
> 
> On Mon, May 17, 2021 at 11:02:40AM +0100, David Plowman wrote:
> > Add documentation for each of the controls
> > 
> > V4L2_CID_NOTIFY_GAIN_RED
> > V4L2_CID_NOTIFY_GAIN_GREENR
> > V4L2_CID_NOTIFY_GAIN_BLUE
> > V4L2_CID_NOTIFY_GAIN_GREENB
> > 
> > These controls are required by sensors that need to know what colour
> > gains will be applied to pixels by downstream processing (such as by
> > an ISP), though the sensor does not apply these gains itself.
> > 
> > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > ---
> >  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index de43f5c8486d..f824d6c36ae8 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -72,3 +72,31 @@ Image Source Control IDs
> >      * - __u32
> >        - ``height``
> >        - Height of the area.
> > +
> > +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> > +    Notify the sensor what gain will be applied to red pixels by the
> > +    subsequent processing (such as by an ISP). The sensor is merely
> > +    informed of this value in case it performs processing that requires
> > +    it, but it is not applied to the output pixels themselves. The
> > +    units are determined by the sensor driver.
> 
> I wonder if this should say the default value should reflect gain of 1. It
> probably wouldn't hurt at least.
> 
> > +
> > +``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
> > +    Notify the sensor what gain will be applied to green pixels (on
> > +    red rows) by subsequent processing (such as by an ISP). The sensor
> > +    is merely informed of this value in case it performs processing
> > +    that requires it, but it is not applied to the output pixels
> > +    themselves. The units are determined by the sensor driver.
> > +
> > +``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
> > +    Notify the sensor what gain will be applied to blue pixels by the
> > +    subsequent processing (such as by an ISP). The sensor is merely
> > +    informed of this value in case it performs processing that requires
> > +    it, but it is not applied to the output pixels themselves. The
> > +    units are determined by the sensor driver.
> > +
> > +``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
> > +    Notify the sensor what gain will be applied to green pixels (on
> > +    blue rows) by subsequent processing (such as by an ISP). The sensor
> > +    is merely informed of this value in case it performs processing
> > +    that requires it, but it is not applied to the output pixels
> > +    themselves. The units are determined by the sensor driver.
> 
> -- 
> Kind regards,
> 
> Sakari Ailus

-- 
Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98C3B785470
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 11:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjHWJmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 05:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236070AbjHWJlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 05:41:22 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CB64692
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 02:36:17 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4RW1LN5X8Dzycj;
        Wed, 23 Aug 2023 12:36:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1692783373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K7HnIW2cG0nzMOhEYOkL0rvcAqxt+r1SexiW/o8e1CA=;
        b=JMgZdiUzHmgI7gDSMZwUEG7foeCVUuufF4uYbVTB9QZOfYqU2hGqCGdpexCTf1n9qUjCDU
        mepaBh9cPy3hiDr9gv0R2QvP4DJDmywAb8mBEkSz8ukhA0Xu5kHrbgCPRZT1GGKC6FvjW0
        KPSTmxLT7xk/PI+LLuCGquja6UtgETQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1692783373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K7HnIW2cG0nzMOhEYOkL0rvcAqxt+r1SexiW/o8e1CA=;
        b=GH5hW9oVIymVUbVW/UbHlsfHhRaXECJXMutlFIZKOIzinnC0KU353p7MyXzoTjyzUgA6MG
        lwy2jYixb7ymiVWyY9+b9QpixxAxyYbPSHoMGk7oH/6GETrF4FFOlK48d+J8vEMqU/A6rR
        B/U1pdR2B/W9VUGuhUQo+hl1dXXbGUI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1692783373; a=rsa-sha256; cv=none;
        b=lOUNF3/Hz+cDn3PE6P86YMrXhXgnu02N4RhYfseJuzzgQWYEAzjNpJQq6ly5gmusNtCxk9
        URKyzWJKiMmwv2Yv+7hwebSiLiWKBamGn5dUPqcwXMTn42Ih9NCwOaGxDQ1n94TqNcbccQ
        ZQ7tEptd8GKgL2YXu48SBymEkYS2q4U=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D51BA634C93;
        Wed, 23 Aug 2023 12:36:10 +0300 (EEST)
Date:   Wed, 23 Aug 2023 09:36:10 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume
 operations
Message-ID: <ZOXTCmANOotlO1nF@valkosipuli.retiisi.eu>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
 <ZOXLBAXVSZsyyNuN@valkosipuli.retiisi.eu>
 <20230823091446.GG4143@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823091446.GG4143@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Aug 23, 2023 at 12:14:46PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Wed, Aug 23, 2023 at 09:01:56AM +0000, Sakari Ailus wrote:
> > On Tue, Aug 22, 2023 at 06:58:47PM +0100, Dave Stevenson wrote:
> > > On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> > > >
> > > > There is no need to stop streaming at system suspend time, or restart it
> > > > when the system is resumed, as the host-side driver is responsible for
> > > > stopping and restarting the pipeline in a controlled way by calling the
> > > > .s_stream() operation. Drop the system suspend and resume handlers, and
> > > > simplify the .s_stream() handler as a result.
> > > 
> > > I'll believe you, but the docs for power management in camera sensor
> > > drivers [1] state
> > > "Please see examples in e.g. drivers/media/i2c/ov8856.c and
> > > drivers/media/i2c/ccs/ccs-core.c. The two drivers work in both ACPI
> > > and DT based systems."
> > > 
> > > Looking at CCS we find the suspend hook stopping streaming [2], and
> > > resume hook starting it [3]. Same in ov8856 [4].
> > > 
> > > Could you reference the documentation that states that the host-side
> > > driver is responsible for starting and stopping? Is this an ACPI vs DT
> > > difference?
> > 
> > There's no difference between DT and ACPI, no.
> 
> The comment about drivers working with both ACPI- and DT-based systems
> was related, as far as I understand, to usage of runtime PM, I don't
> think it was related to system PM at all.
> 
> > Starting streaming on resume from system suspend is haphazard as there's no
> > guarantee on the timing of resuming devices (if the suspend and resume
> > independently), or similarly if the receiver driver explicitly starts
> > streaming, there's no guarantee the sub-device driver has resumed.
> > 
> > So I think we'd need more than what currently exists on the framework side
> > to do this reliably --- at least when it comes to CSI-2.
> 
> Device links help here. See for instance mxc_isi_async_notifier_bound()
> in drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c. Ideally this
> shouldn't be handled by drivers but by the V4L2 core though. In any
> case, the sensors don't need to deal with it, enforcing correct ordering
> is an issue for the connected receiver.

Nice idea. Perhaps this could be integrated somehow to the V4L2 async
framework? And it depends on streaming control --- if you don't have
streaming ongoing, then you don't need that dependency. Also errors in
resuming should only be related to the devices that failed to resume. It's
going to get complicated.

> 
> Sakari, you didn't explicitly answer whether you think that system
> suspend/resume handlers are needed or not for camera sensor drivers.
> What is your opinion on this ?

Streaming needs to be explicitly started and stopped by the downstream
pipeline, so camera sensors shouldn't need suspend or resume handlers (at
least for this reason).

-- 
Regards,

Sakari Ailus

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A987854C9
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 12:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbjHWKBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 06:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbjHWKA6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 06:00:58 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE11E4E
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:00:55 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RW1tt0qL7z49Q2c;
        Wed, 23 Aug 2023 13:00:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1692784854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UW5ZkYKoTQgrvG7Ff0rLoiMaQ0OK0J3JOhD3JnYftSQ=;
        b=g/y5o/hdm6kA6/ag9LW5vrTFfOXPQAcP3TXPxl0yIaEkHdTmSQTy6A5amLQhn82SJkxNBt
        MYnlRZwLa1B7Z/tz8Kj8qTLuPtRJZIB23Fv8CSOPsg+2ENHhphMYdwD91798yMEPjs8EFD
        +xaNzmopDYrNWjw5sEE/5HudIinL9i9YUjYDqaQFyNenP9KSsDoDN4OhmUSv4wFzOJx6Hf
        2MtjsT1h+cPdunL5JLxg4FXuB26B6Z8+ZLblSdi6XM8rpgDNgY2OjE3K4e7lXxv2f6IO9p
        IhoCLvzqBwMtjqOWEqYgVC3MPOzLiENih0YTQV6q20mVyq03Zgh94wpV9TUmhQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1692784854; a=rsa-sha256;
        cv=none;
        b=M7iSw4LHibv4upXrOlUrCRFLNb1gHc2BdIXufhhewHxGdDeUfo1PUi6ofXio9II5aRa3K6
        FLB2ij4Lj5GOlq3Yh+sc8ds9FdNLrFvGib9NbgVTTuV+4DN8S4IaLax2wWI3oj06z/rRrn
        08vZcKlEuJRGR9fDs2vOWVTeSRxxbiYA8axEubni96Gnd7aC656jLoOHJm+shrrhQDhZPM
        apgK+kuEAVC2Cv94SUBHaVT42lrM/r6zrR2etVaDPuTWgvFH3ESXf2IrOgHa3+Jq1gsMsL
        iRr6rbdGQfLNkQtAWSp/9wpb8Q34++bT7S5LWek7F7kbNHtNAeKsYBJ3Il61OA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1692784854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UW5ZkYKoTQgrvG7Ff0rLoiMaQ0OK0J3JOhD3JnYftSQ=;
        b=c/iEKuGnYx0bzGMMF0qNZj2/fICY53P8zuI0juDWIihkuLOFf0oAVxQd7z345WsmuosmjZ
        xphrF5mnPvWY+ECWF8j5Q1aZcFO5CbgmbS+SGUVDXH2PDpVEUyO3A/Hz8kY6Pq2LLeWq03
        4sW2M9LUCOTrv/1x3XxOysr9lADvvnk6foR1lUeAVaxZ/oESBevzSk3nR/zMhVASqFENpq
        RjvGOtDjGAHBUoy5McFG3B90O2JIblIfjxcFO0BmXpvw8KR+7Yt/BHau8T+X/Ztx35nXF1
        P0sWrMk6sJoaXy4jFCXi4Vk+ejEc+Hg0i3DFy/fZ6SmG4oBz7VnW3Xpf0kyhrw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 64F42634C93;
        Wed, 23 Aug 2023 13:00:53 +0300 (EEST)
Date:   Wed, 23 Aug 2023 10:00:53 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 14/18] media: i2c: imx219: Drop system suspend/resume
 operations
Message-ID: <ZOXY1ZGyWTUebaNF@valkosipuli.retiisi.eu>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntBX5P5SOitehxN-AGb9OaGQkSaW-z4a2R+HZ7LiKDP_Tg@mail.gmail.com>
 <ZOXLBAXVSZsyyNuN@valkosipuli.retiisi.eu>
 <20230823091446.GG4143@pendragon.ideasonboard.com>
 <ZOXTCmANOotlO1nF@valkosipuli.retiisi.eu>
 <20230823095700.GI4143@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823095700.GI4143@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Aug 23, 2023 at 12:57:00PM +0300, Laurent Pinchart wrote:
> On Wed, Aug 23, 2023 at 09:36:10AM +0000, Sakari Ailus wrote:
> > On Wed, Aug 23, 2023 at 12:14:46PM +0300, Laurent Pinchart wrote:
> > > On Wed, Aug 23, 2023 at 09:01:56AM +0000, Sakari Ailus wrote:
> > > > On Tue, Aug 22, 2023 at 06:58:47PM +0100, Dave Stevenson wrote:
> > > > > On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> > > > > >
> > > > > > There is no need to stop streaming at system suspend time, or restart it
> > > > > > when the system is resumed, as the host-side driver is responsible for
> > > > > > stopping and restarting the pipeline in a controlled way by calling the
> > > > > > .s_stream() operation. Drop the system suspend and resume handlers, and
> > > > > > simplify the .s_stream() handler as a result.
> > > > > 
> > > > > I'll believe you, but the docs for power management in camera sensor
> > > > > drivers [1] state
> > > > > "Please see examples in e.g. drivers/media/i2c/ov8856.c and
> > > > > drivers/media/i2c/ccs/ccs-core.c. The two drivers work in both ACPI
> > > > > and DT based systems."
> > > > > 
> > > > > Looking at CCS we find the suspend hook stopping streaming [2], and
> > > > > resume hook starting it [3]. Same in ov8856 [4].
> > > > > 
> > > > > Could you reference the documentation that states that the host-side
> > > > > driver is responsible for starting and stopping? Is this an ACPI vs DT
> > > > > difference?
> > > > 
> > > > There's no difference between DT and ACPI, no.
> > > 
> > > The comment about drivers working with both ACPI- and DT-based systems
> > > was related, as far as I understand, to usage of runtime PM, I don't
> > > think it was related to system PM at all.
> > > 
> > > > Starting streaming on resume from system suspend is haphazard as there's no
> > > > guarantee on the timing of resuming devices (if the suspend and resume
> > > > independently), or similarly if the receiver driver explicitly starts
> > > > streaming, there's no guarantee the sub-device driver has resumed.
> > > > 
> > > > So I think we'd need more than what currently exists on the framework side
> > > > to do this reliably --- at least when it comes to CSI-2.
> > > 
> > > Device links help here. See for instance mxc_isi_async_notifier_bound()
> > > in drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c. Ideally this
> > > shouldn't be handled by drivers but by the V4L2 core though. In any
> > > case, the sensors don't need to deal with it, enforcing correct ordering
> > > is an issue for the connected receiver.
> > 
> > Nice idea. Perhaps this could be integrated somehow to the V4L2 async
> > framework? And it depends on streaming control --- if you don't have
> > streaming ongoing, then you don't need that dependency. Also errors in
> > resuming should only be related to the devices that failed to resume. It's
> > going to get complicated.
> 
> I think the dependency should always be there, regardless of whether
> there's an active stream or not. It doesn't hurt to ensure the CSI-2 RX
> will always get suspended before the sensor.

If you have multiple sensor sub-devices and only a single receiver device
(with multiple receivers), what do you do if one of the sensors fails to
resume? I'd think this should be handled similarly to probe case --- but we
know we have things to fix there.

> 
> > > Sakari, you didn't explicitly answer whether you think that system
> > > suspend/resume handlers are needed or not for camera sensor drivers.
> > > What is your opinion on this ?
> > 
> > Streaming needs to be explicitly started and stopped by the downstream
> > pipeline, so camera sensors shouldn't need suspend or resume handlers (at
> > least for this reason).
> 
> \o/ That's the answer I was hoping for :-)

I don't think it could work otherwise. :-) This should be easy, too:
receiver drivers do this already when starting and stopping streaming.

-- 
Regards,

Sakari Ailus

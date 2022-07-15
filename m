Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49884575D96
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 10:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbiGOIgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 04:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbiGOIgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 04:36:17 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286F92A412
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 01:36:16 -0700 (PDT)
Received: from localhost (dynamic-089-204-154-199.89.204.154.pool.telefonica.de [89.204.154.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sebastianfricke)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C2BC6601A3F;
        Fri, 15 Jul 2022 09:36:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657874174;
        bh=MD2jLoOLtr6IEYS0tw8FS3te00HR76dClOStH9GFcTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JNGHZJYIgqVLfH0n3lWMrtoUk5rYKsJVGrH4fXjMqkUekpglMHweLijVittcYZ65K
         dY+f8ozQFgV0hIrXoQEDb8OLWrDuv1Eyt5Yde09FZa3KHLG4wWOpj85HDg5sdpIB7o
         Lz6nsC6UyEfQoMrKvQLk3tCbqCffls/nMszUsaA6ss7GJqBelo/3gqX8/BgQpAcoap
         +VIVnjlGurasE1xjxM+Gr3R/QLPQRCLTnZSUG4Vpq2nORqcUBOXKD/vdnJDT5uczdN
         NWezpnpP09eR/XHiNhHefDPZcCfmK5Q9c1dUlC4Ak/3bT2OtwH/R3fTbOPI56/ijYs
         66mym/fGX1QEw==
Date:   Fri, 15 Jul 2022 10:36:10 +0200
From:   Sebastian Fricke <sebastian.fricke@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Message-ID: <20220715083610.z42qixl576artetw@basti-XPS-13-9310>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

On 15.07.2022 10:15, Hans Verkuil wrote:
>Hi all,
>
>The Linux Foundation organized a meeting room for us to use on Monday September 12
>at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
>see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>
>To attend this Media Summit no registration is required for the OSSE, but you do need
>to register with me by sending me an email. There is a maximum of 20 participants.
>
>I send out a request for topics in May and got quite a few replies:
>
>https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
>
>If you have more ideas for topics, then reply either to that message (preferred) or this
>one.
>
>See here for more details about the conference:
>
>https://events.linuxfoundation.org/open-source-summit-europe/
>
>It is primarily meant for media developers to meet face-to-face. Whether there will
>be a possibility to participate remotely is not certain at this time. Past experience
>shows that meetings like this are a poor fit for remote attendance, unless you have
>a meeting room that is designed for such purposes, which we don't have.

Could it be possible to record the meetings? I think it might be
valuable for others to get an overview of what is happening in the
subsystem and in which direction certain parts are going.
I believe this is especially the case for developers like me that are
new in the subsystem and who wouldn't be able to contribute
constructively to a design discussion yet.

>
>The actual agenda will depend on who will attend, I hope to be able to put that
>together around mid August. But the link above with the 'Request for Topics' thread
>will give a good indication of what to expect.
>
>So, if you want to attend, then let me know by email. Please reply as soon as possible,
>even if you are not entirely certain yet if you can attend.
>
>The health and safety regulations will be those of the OSSE LF:
>
>https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
>
>Code of conduct:
>
>https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
>
>A final note: the total cost is at most $650 (depends on the number of people):
>that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
>
>It would be nice if this can be sponsored by one or more companies. I'll ask
>my manager if Cisco can contribute to this (once he's back from vacation), but
>if other companies want to contribute as well, then let me know and we can
>split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".
>
>Regards,
>
>	Hans

Greetings,
Sebastian

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10BC457950E
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 10:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbiGSINb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 04:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiGSINb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 04:13:31 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4699B25A
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 01:13:30 -0700 (PDT)
Received: from [IPV6:2a01:e0a:120:3210:4c1b:55c5:fbe4:60fc] (unknown [IPv6:2a01:e0a:120:3210:4c1b:55c5:fbe4:60fc])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 57B6966019EC;
        Tue, 19 Jul 2022 09:13:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1658218408;
        bh=LG1xao6fC7uBTe2f7ZnHuRc4pu1OcjQDX99WlECIQJ4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YsKmseaSHL1rHmiQJRcsJDZ5g1xoLJksmKkQkRMQtu9x8zSBS5g5GnYdgEomzo/gZ
         o2eHEx678c23kCfUgx8FZe2BvhXxKE4FeKvKX6/3fXY7Nam0B0DrYCNipsPqFPox45
         AKI94jSLVvFVMDG9bRUCVRkpK+10mkrxo9mGigAHmriAaxw5sQozFQO993hw/xRfWJ
         0nVckJjm/aBceOFzSNh+iHXH5mFDy6aewmuTiVOOl7GUeESEEQM8Mb4wg972aLy++r
         MbPB07YBMV8g2VqYpaj4ze5xQ9gkhkniW0t2hfeAWQkNA2qFKg5XFJ2v20lonh4SMM
         uXeVjpWdPVsaw==
Message-ID: <0cba6b5c-b6f8-eb4c-f309-c102fadc959f@collabora.com>
Date:   Tue, 19 Jul 2022 10:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Le 15/07/2022 à 10:15, Hans Verkuil a écrit :
> Hi all,
>
> The Linux Foundation organized a meeting room for us to use on Monday September 12
> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>
> To attend this Media Summit no registration is required for the OSSE, but you do need
> to register with me by sending me an email. There is a maximum of 20 participants.

I would like to participate.

Regards,
Benjamin

>
> I send out a request for topics in May and got quite a few replies:
>
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
>
> If you have more ideas for topics, then reply either to that message (preferred) or this
> one.
>
> See here for more details about the conference:
>
> https://events.linuxfoundation.org/open-source-summit-europe/
>
> It is primarily meant for media developers to meet face-to-face. Whether there will
> be a possibility to participate remotely is not certain at this time. Past experience
> shows that meetings like this are a poor fit for remote attendance, unless you have
> a meeting room that is designed for such purposes, which we don't have.
>
> The actual agenda will depend on who will attend, I hope to be able to put that
> together around mid August. But the link above with the 'Request for Topics' thread
> will give a good indication of what to expect.
>
> So, if you want to attend, then let me know by email. Please reply as soon as possible,
> even if you are not entirely certain yet if you can attend.
>
> The health and safety regulations will be those of the OSSE LF:
>
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
>
> Code of conduct:
>
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
>
> A final note: the total cost is at most $650 (depends on the number of people):
> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
>
> It would be nice if this can be sponsored by one or more companies. I'll ask
> my manager if Cisco can contribute to this (once he's back from vacation), but
> if other companies want to contribute as well, then let me know and we can
> split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".
>
> Regards,
>
> 	Hans

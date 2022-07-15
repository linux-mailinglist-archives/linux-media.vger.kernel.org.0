Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9AD575F6E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 12:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiGOKfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 06:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGOKfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 06:35:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF03753BB
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 03:35:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bp15so8255119ejb.6
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kMVA8476YEi/XeWhtUaSJQZbPEGHAPSi4kixYCoLL90=;
        b=hHb84zKYyAsBsGcz1YIEI8PdzQB8/KuF8eylK0DoYLDfv6YOmVf21lrQ1DpSnSpG9r
         U+WR0NvUVPAgClqatOZ43O5jTG7u+1xcgJJ4sJ3nwCEVmITwFwgysy1yNO8lTBN7Yh7h
         hYSN41cmI15UtX5ID56yRiLEGdAoqBRn4bCtXM6xAh0ZWvUiUtEJEmVg/u9W6PYLd4ZZ
         dM8g+If8EAKY/ocjvnlgLKwpvIoiyWM7h7+xSNhOc8nrvdDzcsjrW5xRyNhIlBJUAscW
         nzo8SNI0WqULKh73e+DmC2MdaNp+ZpD1Aj9m2IQ/suAemZB+c32ru7TzlMiyV5DF3AE7
         2MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kMVA8476YEi/XeWhtUaSJQZbPEGHAPSi4kixYCoLL90=;
        b=8M3WgW0HMUooV0zibjrP4Ex/MEY5qyKWWbvXvyXWhI9t4srMCuNjWesiLC9YJ8y4bQ
         WTO3bsNH04u4YKPjelvJSgv4pl2X4lA8JHrOpaUrdP+E3OgDI8zLUFXDz1XrBES0KgDI
         R5YEYo9fHtdWczy41a3hkwCE74IZ6ahipZ4OfXF/qy2BAGzqqMCLzW8GNrU8ZIgl4pwD
         Bp3F0R4mXXBsGLMOlwZgPeeb0L7FIEWXwWkuIaaFDpAw4hEqFvtbSAWWvdi8HrnrxFsl
         GSo4kcd1K2N0I3bqLk50Nr3vY4bKJhJFU6a9cZy9dPE7ayOy1Wj2Zy/i3F0PJTTsb72s
         aRXA==
X-Gm-Message-State: AJIora/8sp+GGc78MDaMxTuL4ketT0NgRchJ39tJ2mGov24g1OVz0cKg
        G/sDlQd2dwXYaAKgLM3BnXaQSnbESDfjK8KE9AZBdA==
X-Google-Smtp-Source: AGRyM1u0uSgaxLxoPOyNh/prKio/zzHXjhWAUx/2Kt8LlP+qwRporOINuGAmj9vVrjyNkLax1SyTlFuuwVD2p8Typ2A=
X-Received: by 2002:a17:906:4fd5:b0:72e:ce13:2438 with SMTP id
 i21-20020a1709064fd500b0072ece132438mr10309404ejw.175.1657881306214; Fri, 15
 Jul 2022 03:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 15 Jul 2022 11:34:49 +0100
Message-ID: <CAPY8ntAuNjyXGOB64ix7g+Tz512XhkE_q2-mxVWfu4GhTShhUQ@mail.gmail.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Fri, 15 Jul 2022 at 09:15, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi all,
>
> The Linux Foundation organized a meeting room for us to use on Monday September 12
> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>
> To attend this Media Summit no registration is required for the OSSE, but you do need
> to register with me by sending me an email. There is a maximum of 20 participants.

I hadn't realised you were looking at the Monday for the Media Summit,
so have currently booked to travel on Monday afternoon.

If the image sensor related stuff I raised can be scheduled for after
about 11am, then I should be able to rearrange to be there.
The stateful encoder stuff is also of interest.

  Dave

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
>         Hans

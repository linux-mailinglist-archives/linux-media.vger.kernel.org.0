Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99019576567
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 18:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiGOQpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 12:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGOQpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 12:45:47 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA64B7E6
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 09:45:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd6so7015914edb.5
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m21+lmratEwZnibd310phUTv58ArvAgmwNTn0skvJzI=;
        b=WuDnI2EzGgYNwp9LP69ZtJFH1Dmj+erTa/73O9RABCFLj6gJkE8nFslgO+jUdr7l7U
         trLXJ+m3PH2uR/HRL3zXNBYeLwE+SpBwW3YSMj9Dp+hlN3Ko/J3oPdIFLd5mRTRyj7gF
         xc/bd1p5SB+0c9/WZvQRQfSzgqlaYSuLbGBqX3ITZ9xXfDzOlAEDdy/OXihYTAqjQtiF
         W6G3KtumpCNZi55VcjWO5GqF8WfyURdCN02pfcvagx+UxbA0gycg40AywK9haXJi1uFj
         Q6J0VvSGE5IKBmi2SEkKCywSBhOrGExnPt+IQerfMw3jildVZGqkvH9b5RQjbA9r+vTZ
         Q9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m21+lmratEwZnibd310phUTv58ArvAgmwNTn0skvJzI=;
        b=u/8n5EdgMdWg24IAWxu9qdwldbwMfqc+emL6r1DO1Zgu0TVDe+ml5PPmM4VyktKmM/
         Xr8nWtFWNdP1zqXXa4R8tTViCC0Rc2Br8Dz7FGP9aKziY3mIdqY1WLJYecyZhr0DpF0p
         SxKnQtckaHY/du3Nms+7kvWrxRWMt6fjinICLoeCLIMJOharPTOzIaxzrDbopqbclD8h
         E0Bk1/R1/uHy/22wBOH9tla5OFk4GaQdlXph0mKDp7kXhZcj624oVeRqO9cmEHSAu0U3
         MtBlu/HpUnQAPKIspXFXLEKlEucgjcdVqBpTNkmbA4mX85dTIidoM77Ysa+SJvLHn3aY
         yhYg==
X-Gm-Message-State: AJIora8u0neW9bwVsx9061qaZgRqxu3A5Mc4vKEoGvzWZAD5cMOTlMdY
        7ZeX0w/noh3/u9EWEih8z14eoJ2ILkkf+A==
X-Google-Smtp-Source: AGRyM1uX/0v7s9qk9qLARXGoMCgBXARyydMyntb675Rspo3w+2oq4pyIKEKq5jNuwfdgly7NEcPfKw==
X-Received: by 2002:a50:ed01:0:b0:43b:4524:517c with SMTP id j1-20020a50ed01000000b0043b4524517cmr3330872eds.102.1657903544613;
        Fri, 15 Jul 2022 09:45:44 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906190a00b0072aa1313f5csm2180675eje.201.2022.07.15.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:45:44 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
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
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Date:   Fri, 15 Jul 2022 18:45:42 +0200
Message-ID: <4724152.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Dne petek, 15. julij 2022 ob 10:15:04 CEST je Hans Verkuil napisal(a):
> Hi all,
> 
> The Linux Foundation organized a meeting room for us to use on Monday
> September 12 at the Convention Centre Dublin. It is co-located with the
> Open Source Summit Europe, see
> https://events.linuxfoundation.org/open-source-summit-europe/ for more
> info.
> 
> To attend this Media Summit no registration is required for the OSSE, but
> you do need to register with me by sending me an email. There is a maximum
> of 20 participants.
> 
> I send out a request for topics in May and got quite a few replies:
> 
> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@n
> dufresne.ca/T/
> 
> If you have more ideas for topics, then reply either to that message
> (preferred) or this one.
> 
> See here for more details about the conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> It is primarily meant for media developers to meet face-to-face. Whether
> there will be a possibility to participate remotely is not certain at this
> time. Past experience shows that meetings like this are a poor fit for
> remote attendance, unless you have a meeting room that is designed for such
> purposes, which we don't have.
> 
> The actual agenda will depend on who will attend, I hope to be able to put
> that together around mid August. But the link above with the 'Request for
> Topics' thread will give a good indication of what to expect.
> 
> So, if you want to attend, then let me know by email. Please reply as soon
> as possible, even if you are not entirely certain yet if you can attend.

thanks for invitation. I'll try to attend, but I can't say for sure yet, since 
this is not related to my day job. I'll let you know as soon as I will know.

Best regards,
Jernej 

> 
> The health and safety regulations will be those of the OSSE LF:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-a
> nd-safety/
> 
> Code of conduct:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-> conduct/
> 
> A final note: the total cost is at most $650 (depends on the number of
> people): that's for a whiteboard, powerstrips and refreshments (coffee,
> tea, soda, water).
> 
> It would be nice if this can be sponsored by one or more companies. I'll ask
> my manager if Cisco can contribute to this (once he's back from vacation),
> but if other companies want to contribute as well, then let me know and we
> can split the bill. And start off the meeting with a nice slide saying:
> "Sponsored by:".
> 
> Regards,
> 
> 	Hans





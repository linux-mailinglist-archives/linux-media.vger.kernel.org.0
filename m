Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE83597B1F
	for <lists+linux-media@lfdr.de>; Thu, 18 Aug 2022 03:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239267AbiHRBdk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 21:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239507AbiHRBdi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 21:33:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20C95E575
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 18:33:33 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id x21so165588edd.3
        for <linux-media@vger.kernel.org>; Wed, 17 Aug 2022 18:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=36nMovJodSQk/UhxzoEQiL9A6ldnah9kAzJHQH+ywDs=;
        b=COUn8NH9jwn50Vg6PzVupW+LVPhCo+6i8GgW+5/i/y/eYMNpClkBvTZQpuJAFP8zLx
         VPuZm7k1TJAF7ZgG4yesOlvl4mUu7erYDRBm4ntGipUh6A3Hw2mxTYUxiRsoLNA1KTlt
         y/r5zLjkPtlM5sqQbkJ0AMyvv9Iz+Sq0vnqUhYvVBdwJGf3gYkH3iQRuhQgET8ZIFUD/
         tWZ89uo8S19KYeMyePa91BFkxlM57eN/2uBPa1BXhc91bytmW2WYNoGAaLk3Ejqno/vJ
         hCgm9TzHcXGG2ii6DHbe6ZUHCjkckHupxB/IH4GgBSAnO2NhAEL4tRB6Q1n304yBvPN8
         rzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=36nMovJodSQk/UhxzoEQiL9A6ldnah9kAzJHQH+ywDs=;
        b=fSDpRa6qdVtnyKRyaUrMK4oY6OleHKdhfaNcACBjjyfkPiqFnusbhJMusnT+dM56zU
         H0zIFhj+tdj1KIeVcWMcG99cnJwne/DGTEhYgG/m6Nfm07lB/eIU90Nl7J62itwzbKjT
         +nLmQLXjQ2DnY4/jxgNLBO6+xoY724UaK1rgSoZLnIJN1GDWHsx+sZIfAeFJ33ci3zzb
         q6q1keodeNnmXRPZsh8NWqJH43U1TwQ1au3iINFMCznMJAmB0Q5/1T+ZkWOJ+zVq2m9L
         EnnjW/H9ykYzle6NtcsBbRURgYMHEpRSROtwIwprjEtf2Pzchq+3A8wm4TVDMimbzISw
         hL2A==
X-Gm-Message-State: ACgBeo0qtLDH/AWmydxQx8BbiIXHrr7JuHr9gxuPmKzOfClEVFLBgKCg
        kuY/MiEkeIN1VMkDm4DnrnEjyQ==
X-Google-Smtp-Source: AA6agR57rygPKsHZ7CI5QWJA5IkaPkSLiHzTlLN2MkH3zPvIQNEPKU6kL1sKckPrIKb1McvUKsPirg==
X-Received: by 2002:a05:6402:f22:b0:43e:8623:d32c with SMTP id i34-20020a0564020f2200b0043e8623d32cmr512949eda.265.1660786412414;
        Wed, 17 Aug 2022 18:33:32 -0700 (PDT)
Received: from localhost (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.gmail.com with ESMTPSA id p6-20020a05640210c600b0043df40e4cfdsm215699edu.35.2022.08.17.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 18:33:31 -0700 (PDT)
Date:   Thu, 18 Aug 2022 03:33:31 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V1
Message-ID: <Yv2Wfl1FRH6iJPML@sleipner.dyn.berto.se>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, all,

On 2022-08-05 13:35:48 +0200, Hans Verkuil wrote:
> 15:30 Laurent: V4L2 streams series.
> 
>   I'd like to discuss the V4L2 streams series, in particular how to
>   upstream the parts that won't be upstream yet by mid-September.
>   Discussing the next steps would also be useful, as there's lots we could
>   build on top.

I have no ticket for OSS Europe but will be in town for LPC and I would 
like to attend the media summit afternoon seasons, this one in 
particular. Would that be possible?

-- 
Kind Regards,
Niklas Söderlund

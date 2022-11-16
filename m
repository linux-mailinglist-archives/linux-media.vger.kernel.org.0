Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8852962C574
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233496AbiKPQwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:52:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbiKPQwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:52:00 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82ECC1F2D1
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:50:44 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id k2so45569056ejr.2
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hgOM7+cW1ZLIAusGXWJZcdRKPq14GoBTrDX0YnGVCYQ=;
        b=IwO5A2CTw/ea4yA3ckygJkrqcGRjNKaphXG+C1ef535TjGlyZ85MvaOQOOCupB/Ka2
         eanQNmfGHtKGFCnxUvKi06ayL9oLjwwTEwmBM+o0UUYsvTnJSMwdhoj6zjcjjA5RqiXy
         FcII/iYM6Ub9gcF8McSeH3lOHLukxH1eO+GfC6+icXs3uVsZm9Q7OSR8ClLw9PpRG96R
         MwyQWbswyWqw0d27EDmkHr2ec+r8Zz6gjDIIXLk8LVuCKRvAT5y+eOVdG4rH0ryWBcE/
         82hFj0vfxM0BsQkx4OV3fcu/J8ojq6n05GL1VS4Wt6W4gdSZDo4vLsWDd1uq42Vy6VHj
         WNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgOM7+cW1ZLIAusGXWJZcdRKPq14GoBTrDX0YnGVCYQ=;
        b=aok607PsfVWuZZqgUPo0Jd4cS9SUU/5FQYgSIofhSmoyGC6Y0qrvCwO+t8wKSohw+/
         trmtp6j/K7jJYVxnVtUXr/Yvrpj/DqXJoFBQadDLp6ULIGsJxI53JSqEE7WxbKMwvpcL
         7EdYP+wyfHH1mAhg+SgkGfbCeLuYGZeuPkUMig8N5uZ3T4ts8jOKEVJwWh/vgzT/znT3
         BsAI28gh89IuZDzxZ8Vn3hVPd/Wo/mmZlKuSEE6amnEqiTxN4GToGL/TET//uK9sw/Tl
         mzI36i5lkgMm1Pcfrm/gPIUwl3jGL9vCH26IR2G7gDupEBXYmGdUZhMAFi+zBOlK2zFX
         guGg==
X-Gm-Message-State: ANoB5plUNuiWCU8SvZa7mRuhMucMewbd5XV3hdylSNgLVOVBEL4yAFH7
        0ubmfs+QwysAknJoBnWp3nRP5iyvSFstXPud5eH0gA==
X-Google-Smtp-Source: AA0mqf5y5BFX29x5HdejGINM3CDkXhYgtOSueHCzJBhLok/C1iSM62cpp0W71aq8OdO66MbcL0tQxrgwo/I2EUhUo70=
X-Received: by 2002:a17:906:5156:b0:7ad:db82:d071 with SMTP id
 jr22-20020a170906515600b007addb82d071mr19163854ejc.200.1668617443138; Wed, 16
 Nov 2022 08:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
In-Reply-To: <20221005152018.3783890-1-dave.stevenson@raspberrypi.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 16 Nov 2022 16:50:27 +0000
Message-ID: <CAPY8ntCeh7=q2gL_4SK6jq=Mx7KfTt5YF-BkeMvv73tRGjzNPw@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: Add regulator support to ov9282
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 Oct 2022 at 16:21, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> The sensor takes 3 voltage supply rails, so add the relevant
> configuration to the device tree bindings and driver.

A gentle ping to this patchset.
The other patchset for ov9282 that added functionality has been merged
and made a pull request already, and Patchwork was reporting this one
as "Under review" for longer than that one was.
The DT side is ack'ed, and the driver changes are pretty trivial.

Cheers,
  Dave

> Dave Stevenson (2):
>   dt-bindings: media: ovti,ov9282: Add optional regulators
>   media: i2c: ov9282: Add support for regulators.
>
>  .../bindings/media/i2c/ovti,ov9282.yaml       |  9 +++++
>  drivers/media/i2c/ov9282.c                    | 38 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> --
> 2.34.1
>

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27675614987
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 12:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbiKALi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 07:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiKALiC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 07:38:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6891DDEA
        for <linux-media@vger.kernel.org>; Tue,  1 Nov 2022 04:32:22 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z18so16333218edb.9
        for <linux-media@vger.kernel.org>; Tue, 01 Nov 2022 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zgw1ZsEpq16zk9EEzIpH5WzZh1vun+uWcnUlNaBno18=;
        b=KnS5UKHxqqbxKYcecR2G/h4kTmOyqxi1jJbzPFuK7f4xBduTndEBgqBIRkHS8+ZpQL
         EvZhjNWdhirSlK2mqE+7g85sNwqobNuns73EoEvmTQhFyDU/xmmUGVRuLoeysV4/q9rN
         UWVCBLAqSUImZiNu3otqRcfyH07ORk3DEpQAo6Rbn45RgKMMvYECJTiBhMwD4ipiYm6u
         f29Du23+G5/nDd6zuVk6P69mIPtqCQKPjFTo5YqpzPo3FRg7hiEWovBL0lBwbGUaDMki
         lClkahMN/PqqM42heASLX2G70D+bNEE5/fHCgGauqjHg2yUEttaOFzM7T/h92GoCwbw1
         sacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zgw1ZsEpq16zk9EEzIpH5WzZh1vun+uWcnUlNaBno18=;
        b=w5KnnXNmoI3WJUeWise2m8sHeBgYzmpbqGPIwKKPrPu6tiVMF/+7US2UnpHRLU5Kx6
         vwMvxi1UuhYof+PgSes7W8ILxRCbhOAUNDGRv0cG95JhfPoKa6urKFyhAeeGrhCWOS5f
         /MMkPWUNccQMhUYU+88xgLawPRSiNhYpSJQGURf7a143UlGuR3ZzzDxpzx7/e9OHdfl3
         jxPxjsTuiILjQaLCGYo8BU4uDQ7EBFahiy3xBbFFddfkXmydmJqbe/OIy+leWyZOn9TG
         P+Lwzbbx400yPhObottXXaRK3lUY4VBO7t4Cw+MkzjXXxwroxIKLQ8snOfn7rlMp8nc2
         vHzA==
X-Gm-Message-State: ACrzQf27BKUEa3hVFtw4o/Ht7/ivbHi02AEpk4N0jZG2wWpK7RubrgAe
        KaJ2houqxQ0rOjSaxvRg8JLEBSEO4cUlZIJVmRQ4Aw==
X-Google-Smtp-Source: AMsMyM6dU7/WvE7jJnhRptAh0Tdx5RFb8ec9jrj2YK+0Kz9cnoNiPH9Q6Ru9dFi5mID+tj09o+gOsFDG0M8TdhV/K7c=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr18176807edb.86.1667302310467; Tue, 01
 Nov 2022 04:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-6-dave.stevenson@raspberrypi.com> <Y2DxAsgEFeBUmzmc@valkosipuli.retiisi.eu>
In-Reply-To: <Y2DxAsgEFeBUmzmc@valkosipuli.retiisi.eu>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 1 Nov 2022 11:31:35 +0000
Message-ID: <CAPY8ntD9M4N1AFbwO4eqfQEiEVujwjG=5c_B=k99iXx9MP-KdA@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] media: i2c: ov9281: Support more than 1 mode.
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, 1 Nov 2022 at 10:12, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> On Fri, Oct 28, 2022 at 05:08:51PM +0100, Dave Stevenson wrote:
> > The driver currently has multiple assumptions that there is
> > only one supported mode.
> >
> > Convert supported_mode to an array, and fix up all references
> > to correctly look at that array.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> This probably should have been ov9282 and not ov9281? I'll fix that when
> applying it.

Yes, thanks.
As discussed in the patch set at [1], ov9281 and ov9282 are the same
except for CRA in the optical path.
Largely we see OV9281 modules, hence the slip of the keys.

  Dave

[1] https://www.spinics.net/lists/devicetree/msg518160.html

> --
> Sakari Ailus

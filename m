Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABF66E2F99
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 10:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjDOIAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 04:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDOIAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 04:00:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8683649D9
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 01:00:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec816c9d03so316656e87.2
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20221208.gappssmtp.com; s=20221208; t=1681545605; x=1684137605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V9UEeMy1E80f0QyvsmwRX2aJeEK3DaiJIy8QuDNYE=;
        b=OjvOVM7xuTHHgZE50/SfEHkC6Bkb9nQoDPR2bl72ml9aoBeRH2H3U1EVs8WgaeAQLX
         UUINEDj/OHDW9Hwh+mCgmqgBrGVFznSHwRqK0Gkmb+gad1MYMlSqpTT1SY+n6mOhrekh
         v8TaDND/QyeKOmc1fUfT54854fJimc9XvMz80lkxj5eMTdkr8WjRzr0nU53m8K53eqbq
         OdYXEoAqRVBxJgLE90RhSaHDw5Toj/9tIaNhbQokAgz/wTUieWe7oPBkEx8XoK+xTFsp
         Hhw/otllJK4yJLJ11fpfp3e8F/sKzO8k5RmRAgmsSK3G5x3TlD7wxIFfhkJHyyZsoVUt
         Z76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681545605; x=1684137605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V9UEeMy1E80f0QyvsmwRX2aJeEK3DaiJIy8QuDNYE=;
        b=ZrklmEyearMY7CM+2s1llIQmUfY7toIqWkVoy26HRNUilBLXvB0cufGXFkzD2U+IpA
         7okDp8TSh6SJneqQAhxfwCas5gmYy3KdWrN/hkuYuQeslonvFoyWVZ3+nICbuX1JWZEo
         Q+p0UjcCYOSkSu9FQXuvkT4R48ZVyThNYO2HIxprlvBzw66eJtIrMBp3VIQBEWZsdzDd
         0rUyd0T00kz17tMzC0YsuAhTCeitvHH+10U4LjdKpPN/ZNaPwIhG8Afx5gGFzZduSXXV
         xK9PKhkGoIGCUfaJbNARLd2fZycDizlTK16Ji0UnwuouCUVAxrlb808uBaB708n9AU2/
         B4kg==
X-Gm-Message-State: AAQBX9eHN3EQVXOGqJ3sWgxKZ39X/rwuzTG5X8vxIYcn/RvRLeWcmndg
        xxNwF11EQZO8hVa6pWUhLhxyXdd/WXFQUVyD/ww=
X-Google-Smtp-Source: AKy350bvy781GXVJXJwimyXuEVdRRizrotTy/BpNevk3rNTOObwboY7YvFwYGCY960u0d/GkYSFLoA==
X-Received: by 2002:a19:520d:0:b0:4ec:5648:70e4 with SMTP id m13-20020a19520d000000b004ec564870e4mr257585lfb.12.1681545604846;
        Sat, 15 Apr 2023 01:00:04 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id j6-20020ac24546000000b004ed88fe62ffsm990862lfm.170.2023.04.15.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 01:00:04 -0700 (PDT)
Date:   Sat, 15 Apr 2023 10:00:03 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] media: rcar-vin: Fix issues with NV12 on Gen3
Message-ID: <ZDpZg24vDax6/92O@oden.dyn.berto.se>
References: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

A gentle ping on this series.

On 2023-02-11 21:54:30 +0100, Niklas Söderlund wrote:
> Hello,
> 
> This series fixes two small issues around NV12. Patch 1/2 forbids the 
> use of the scaler on Gen3 if the output format is NV12. While patch 2/2 
> fixes the size alignment for NV12.
> 
> Work tested on both Gen2 and Gen3 without regressions.
> 
> Niklas Söderlund (2):
>   media: rcar-vin: Gen3 can not scale NV12
>   media: rcar-vin: Fix NV12 size alignment
> 
>  .../media/platform/renesas/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> -- 
> 2.39.1
> 

-- 
Kind Regards,
Niklas Söderlund

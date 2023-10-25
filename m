Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 645927D6223
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 09:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjJYHKR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 03:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYHKQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 03:10:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5380AA6
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 00:10:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so74555871fa.3
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698217812; x=1698822612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/a2enGvtc1HJJcrsQxtyTV+TZ4Dj/K1d5FQy70Je18=;
        b=noExIGyI+uVjMTGs2768AcK+nHCPWqulPhv0h8aPIBFEGLRwlBH4Co80W95DoZqal3
         5yyiinmwrEpUeF393VPelzaDu6YStteHstHSPVa6pnTIZA4upvXPvy+AulhRGCmUKOr1
         bBKuxcP5EIaxxVyyjd5QxC2fYLAxth3VWuoe1JiyLeI9NmRoIxa2cEFyhd/CQ/X0Z77+
         BiSZAnaDj/P9NXAmIUEOC5fJ8/Zurbfgq6N+1uh4MenaURD2Kl1eKH0j/toC5O0FXL1V
         MJYmiZqwLVixChTBb+UJdvbcy6oTrskd28YBTJRx36PK8LPZX7/f0kI0DrOOHTIRXAoF
         7mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698217812; x=1698822612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/a2enGvtc1HJJcrsQxtyTV+TZ4Dj/K1d5FQy70Je18=;
        b=wFUKclLPG4Yl+UFjZQBtD84sHRZmB0B13qlKdHBe3Lpjpb3fecxqQskYSXW8DhNTOK
         XdQpi34en1sbyTuT+/GPuh7csBMdIIsJMsi1J7D8AtJbMf+9UKsb6FxKWUo4xQHOw1Uf
         nvkNkc/9JqV/rhF01Y4tzQNT05CJ7MgF/Tkx47H1QLLnci58WtCeENAw/ArKmjYc0yA4
         9yXKkdt6dSZEP5WKhXkN5tHhaIEH3vuhkJ0H/aHhtiAm2XlcpGb3cLw6tNmIneV0r2v+
         waN6DS/NQ65osWj2v/V0VkeR0DEpK128DkVmOVlKxpTpkWO3J/p2HfSlYI7OZOtMCn0G
         tAwg==
X-Gm-Message-State: AOJu0Yw6/VKxeblpwEhHV+Yl/hTc7zA69fMFsx/C8nrfIXdb/jtTCXWI
        3TGsQa5gLniOAVOb+DUi4+Hu4g==
X-Google-Smtp-Source: AGHT+IFrjhPdd6vWCM5twqWe8Gx1vQOZe4ftjHiARiD5M6kbpwMjDkRu3Y6/bbkfib0ftOWckR13og==
X-Received: by 2002:a2e:350e:0:b0:2c5:1c4:9005 with SMTP id z14-20020a2e350e000000b002c501c49005mr9520358ljz.32.1698217812468;
        Wed, 25 Oct 2023 00:10:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b004053e9276easm18734063wms.32.2023.10.25.00.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:10:12 -0700 (PDT)
Date:   Wed, 25 Oct 2023 10:10:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Ricardo B . Marliere" <ricardo@marliere.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025060717.71895-2-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> modifier to print FourCC codes in the logs.
> 
> vchiq_use_internal() and vchiq_release_internal() uses entity
> character-array to store a transient string that contains
> a FourCC code. Increase the length of entity array(to 64 bytes)
> since %p4cc requires more bytes to hold the output characters.
> 
> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
>  .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
>  .../interface/vchiq_arm/vchiq_core.h          |  6 ---
>  .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
>  4 files changed, 33 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index fc6d33ec5e95..de6a24304a4d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>  {
>  	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
>  	int ret = 0;
> -	char entity[16];
> +	char entity[64];
>  	int *entity_uc;
>  	int local_uc;
>  
> @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
>  		sprintf(entity, "VCHIQ:   ");
>  		entity_uc = &arm_state->peer_use_count;
>  	} else if (service) {
> -		sprintf(entity, "%c%c%c%c:%03d",
> -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> +		sprintf(entity, "%p4cc:%03d",

Not related to your patch but these sprintfs() make me very
uncomfortable.

KTODO: change sprintf() to snprintf() in staging/vc04_services/

regards,
dan carpenter


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A187D69CC
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbjJYLMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjJYLMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:12:35 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FB4BB
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:12:32 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso5287897b3a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698232352; x=1698837152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVeTDHNiYFAq0E4cZLjml4cYo09NnTGBtpZK+Ci6oew=;
        b=KlJGmQSQz+oQkrla5f+e4mZ81pjhMpBVZuCBB/bvkOguJZhwKVU6JG9Sibe3tBVef8
         +Abe7IDphGdVojWi6FvJj0cBheoW9eFaImxhMP4DKLo1+ZRhPcP3COxEpo2SVuGXx8p4
         /Lyq9af1/SzbZNC+4boggZxYc25edHsEqYOlkZoIDXtYraE2YHNJy/QFoVadW1MovFIk
         XslR1183mwEaNjtWo3bCU79S0JL/8dDLo/sUnZ9oaRN5YXxZ8DVsKhHcLM1LfnV3mlac
         8l6lJiNUnentpb1TCYGwDpWf3AT4x/OPfLpNjyxqDYyJAOsGtUxs8D4pTgjWJXCdh6MD
         TV8A==
X-Gm-Message-State: AOJu0Yyqm5zOJQZoNGQKXT6DZWKCC1mRI5m9aZU0FU3kWgwtseROB0+V
        blf3k02/T7MGn6Bkp77zQBSbyy0BI5YnNTXo
X-Google-Smtp-Source: AGHT+IFjbriHfa4Gl9sFnWHU8GbQeS718AwbIbRVgDhurwrSv4kdyeKTHjS1maO0ee6/5iW7xKmJLg==
X-Received: by 2002:a62:6106:0:b0:6ba:8478:b99f with SMTP id v6-20020a626106000000b006ba8478b99fmr12986285pfb.28.1698232351950;
        Wed, 25 Oct 2023 04:12:31 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id x190-20020a6263c7000000b0069337938be8sm9530410pfb.110.2023.10.25.04.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:12:31 -0700 (PDT)
Date:   Wed, 25 Oct 2023 08:12:33 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
        s=2023; t=1698232346;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gVeTDHNiYFAq0E4cZLjml4cYo09NnTGBtpZK+Ci6oew=;
        b=ASZHunViQMwyt+rN1JWF1PfVa8VGpDlkSp2fQlI52X60C6RHEB7GD0y9GksUqennARBZRE
        CFQOTqEIG3FmENAhrIlDwf3gRyu+IY0LbWJgjMv9pRtlLTCqaCbRR/vO2rvo0SdrtIck1F
        HHHssuSHuARdN317AkOaQxv8isUR/W8qHIYqOhkb66F5erZqV9k56sv5BIqzblWPgeZzzW
        7m4x2jsU1NkzjxZ6BPmYKDDnk4Ky2UcqdKJyorbUjnDzz0PGmFtiUQxGltKefkIjbM+eQG
        s4P+oY7MdSMAaANRjla4pJbwazC1vXu4pEFbKjTUecjQxEEgluDtZprrBOMUxQ==
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From:   "Ricardo B. Marliere" <ricardo@marliere.net>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] staging: vc04_services: Use %p4cc format modifier to
 print FourCC codes
Message-ID: <5zsxrx553w3e57n6sqff7y4bfn2opir65bvb3o7mbiipzn2po4@gs7d3hkgjr3d>
References: <20231025060717.71895-1-umang.jain@ideasonboard.com>
 <20231025060717.71895-2-umang.jain@ideasonboard.com>
 <bd7f3a75-598a-428e-85c3-8dd867043c1f@kadam.mountain>
 <ZTjf0fT0yl2cwGWJ@kekkonen.localdomain>
 <fe0b6ed1-61ba-5373-1525-adb040f68184@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe0b6ed1-61ba-5373-1525-adb040f68184@ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/10/25 03:04PM, Umang Jain wrote:
> 
> 
> On 10/25/23 2:58 PM, Sakari Ailus wrote:
> > On Wed, Oct 25, 2023 at 10:10:08AM +0300, Dan Carpenter wrote:
> >> On Wed, Oct 25, 2023 at 02:07:17AM -0400, Umang Jain wrote:
> >>> Drop VCHIQ_FOURCC_AS_4CHARS macro in favour of %p4cc format
> >>> modifier to print FourCC codes in the logs.
> >>>
> >>> vchiq_use_internal() and vchiq_release_internal() uses entity
> >>> character-array to store a transient string that contains
> >>> a FourCC code. Increase the length of entity array(to 64 bytes)
> >>> since %p4cc requires more bytes to hold the output characters.
> >>>
> >>> Suggested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>> ---
> >>>   .../interface/vchiq_arm/vchiq_arm.c           | 20 +++++-----
> >>>   .../interface/vchiq_arm/vchiq_core.c          | 40 +++++++++----------
> >>>   .../interface/vchiq_arm/vchiq_core.h          |  6 ---
> >>>   .../interface/vchiq_arm/vchiq_dev.c           |  7 ++--
> >>>   4 files changed, 33 insertions(+), 40 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> index fc6d33ec5e95..de6a24304a4d 100644
> >>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> >>> @@ -1441,7 +1441,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >>>   {
> >>>   	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
> >>>   	int ret = 0;
> >>> -	char entity[16];
> >>> +	char entity[64];
> >>>   	int *entity_uc;
> >>>   	int local_uc;
> >>>   
> >>> @@ -1454,8 +1454,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >>>   		sprintf(entity, "VCHIQ:   ");
> >>>   		entity_uc = &arm_state->peer_use_count;
> >>>   	} else if (service) {
> >>> -		sprintf(entity, "%c%c%c%c:%03d",
> >>> -			VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
> >>> +		sprintf(entity, "%p4cc:%03d",
> >> Not related to your patch but these sprintfs() make me very
> >> uncomfortable.
> >>
> >> KTODO: change sprintf() to snprintf() in staging/vc04_services/
> > Umang: how about one patch on top of this? :-) There are just five
> > instances of it.
> 
> Ricardo, how about this? Do you want to take a swing at this ? :-)

Sure thing, I will send as another patch as Greg suggested.

Thank you,
-	Ricardo

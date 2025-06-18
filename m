Return-Path: <linux-media+bounces-35209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C446FADF7C3
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E5683ADC89
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFA721B9D8;
	Wed, 18 Jun 2025 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hGfJYmay"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A55188006
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278851; cv=none; b=FyGmRv5XD5WO8Se8UQSkMvW1+jHOl66b+pdcPpEcGIHXRUkVbEbA8nqyV5ZaisWo9mVgsbJHu0xYXLb6hQ1DU3mi9zOkm4b/PA+a60hdU7oGVX90clea02JQ+uJnm5i1GV66cB3iLkAWaEB/Nyhcyg7J6RFUr7RCio80kERwPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278851; c=relaxed/simple;
	bh=viIN4VP4ODTE3djzQhDO1XWP0PqliIn78TPsOQ8wxdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU5oEglvj3bXocEhTuW8Vcd6TwaB5Odjau9bsOorpPVKId5As/F1kfIMUF8OK+fpz9EoPceILvpybk9/TJ5gl8+jIxTPSZ1IVZOm6m9O2UxjKr4fgvuYyWjlwQbSSdrGC56j23k0lqGvPV5wiraIGHM+owMfuMK1AyXl4j9UJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hGfJYmay; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-401f6513cb2so34154b6e.0
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278849; x=1750883649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itEi+BZb0SH8g2JgLmUkzbZyvLO/gnia385Cdpkx+2c=;
        b=hGfJYmayjffuDUHhpDH0UKi5+RLhC4nzCN+YjdQd3PkF+swWyvrOrTGr5M+lT7uiE2
         VfyDTBidPsmswLH/VVR9DBfUgu4H9erx5OfYRDynmbH/1iEQssJnubV1FnQPzvXexINB
         lIA1lLEh5617A8dcD2NSvttGMiFidyJHvhyvQgtN9wSdHef5OT1Y0XwpvpgesPpJ2uu8
         SnvgcqGK39DxBysYmLD9U8AhvjHi4n5HVgu5vyKEF2qHt0eYu+THfYo2tWSQeu/V24R0
         RM8glyDBlRtNphtfTmiT1r/qzOeH3VxQqmrNH7Dfst08YeRkb7MUMyhzce5MmWRISWor
         ipTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278849; x=1750883649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itEi+BZb0SH8g2JgLmUkzbZyvLO/gnia385Cdpkx+2c=;
        b=WCyUjYfX6IqcW6T3YyDM6VLLmoTd955rhvl3ij9gUnN4xb7ODlRpf53RhOU+HoMW18
         LIxIsDdYaGQuyFpfxWh91UI4ynoRbgJaXZFgh0pnrNmvi5JWjk9R8B+e1KvMsjVC9q9W
         ku/hk+56LXKomfHbUvJgZpbD7zHzSd22OK8+Pxq1GtRkVjcL7TQ0kpUhxcNdR7Ijh/bU
         HZ/mr/VixhrHibNVx0nKRLbQWKZf17KmDHKW28NyHHo6j8bFk+1IGrO5nnyEM9ytwmSR
         YFXUlW7vmXByMFAQBlfb18opbyN/HVgYSjMgvN2OFIRa039Z6AuOQJTqq0jMeW5mk8ao
         lT5A==
X-Forwarded-Encrypted: i=1; AJvYcCXLA/9MM3wl05ROkBoAqlVzHxEtQTbQ9922824aPqT2z4/oegKyi9v/CeCdEjiQ6blfQnGg7EzZcG2o8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwACMekuW3HIYID5cXJbGOoGXDiYP9X9E8tlSYIv5YjSjPMlygV
	JHcXIbvNECDbZMhSVBYEgbl95dE0sTdKyvOI9pdNroKn0ou+MecayE/fNnKW2ZAj+0JxFhg9zVJ
	TBAWi
X-Gm-Gg: ASbGncvnt9C+6XZUXaAfLdZoGS9yF1g74cDj/Yh8msqYoPt5VkYchXXhK5a16mRVnz3
	dE7lZbSCpHG7/foyNUCPIUjZqv13BlXgJT4dmijpJ95ncB/dewbnzmEuJklytc3rUfrTYzHOPJo
	Mhs7+LqGPTz8195RQSDmx7xKuP1zexzN7OeP3/5wvWqBbANepYcWx9/QMvDTT+2Llo6Y0Ha9oCQ
	tbazO9bR8PKklapwFyCSOOgJR0Oy+n4VGkLXFmnv07BA84MWop5u12vh1VJL7Hs2KWG6/wiOMnw
	9gwbQUadUE9hL9E3gvIEdS9UHJKHJ6BnZ/19o2i9hM84vVtomwLKdChdE644vofAcZSboQXYwm1
	hWs8B
X-Google-Smtp-Source: AGHT+IE0YqCSUx+2aZl3yM1oe6wZyYRvGwCB+3c+qJkS9lsIeREn9u3N08+YRVrqkSVKntvccr5Jdw==
X-Received: by 2002:a05:6808:505c:b0:400:e771:ab80 with SMTP id 5614622812f47-40ab5003edcmr688846b6e.0.1750278849164;
        Wed, 18 Jun 2025 13:34:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b78f9sm2500687b6e.44.2025.06.18.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:34:08 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:34:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/5] Staging: media: atomisp: i2c: sleep time
Message-ID: <3cbb1d28-fb95-4a58-b8e6-fee6c69e62c7@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-3-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:41AM +0200, Thomas Andreatta wrote:
> moved to usleep_range instead of using msleep which could sleep up to 20ms
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index f35d1a16f627..48ec2cb03806 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
>  			goto fail_power;
>  	}
>  
> -	msleep(5);
> +	usleep_range(5000, 6000);

I guess this checkpatch warning is just a trap to catch people who are
too confident.  You're not supposed to touch these unless you can
test the code.

regards,
dan carpenter



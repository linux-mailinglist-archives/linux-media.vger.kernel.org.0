Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3FE7455F1
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 09:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjGCHYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 03:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjGCHYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 03:24:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33C8E47
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 00:24:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso1626456e87.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jul 2023 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688369073; x=1690961073;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C29GGshpRflRAsDMrsFmQ/IN+gO46ijd5n8kyVuVPzE=;
        b=PgpEbTWP82/MspcrBCW+wnfEqI2fdDKxSnx7qruPFnKL50iU+W4k+1HnRBbsx96Cu/
         iW8NAN7HI9JHXfEtn4/Eo4Maoo1VVxfuqbNVXOp3dkG0IdK/T0vM25vlVnPpripX9Bm6
         r/baSrWaBrVXohvDQWaegstTt3Pv6KLOPS//JDgX6jBY76nSv9c9h87hlxsi70JHyZdv
         oLrNGenAGPZN9zYodR7wyNkASyRJjtk0BrwSBELj1YP5HFxcPDoUoxKTHEvGnEUr2wv4
         GT7iZxaFOYXIwgHL10MfHp8yiFsviZSXLr4D9jR54UwFfgT1iBRNLc49GyF+UKBJIeEZ
         P9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688369073; x=1690961073;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C29GGshpRflRAsDMrsFmQ/IN+gO46ijd5n8kyVuVPzE=;
        b=e1poMydosWZ9n1+4kObhQGm+EG4E8QCc720xNPgyPKuPLM/Xe6///e83OSgAlGS82L
         9iOGtRLDZu/gyXNwqb1ZsIIe6/DdBLdB1y+E7CxtrlSefrxQitbXTIuVK4IQhKsFRgZj
         Fv7ZFSEtPilOoucVFgjXHv7+MtfRja+x9AF2t0g+laaklinRBU6hYUH/H5za6qikNeHW
         whdRrwZf7S45yXw6m2Izmc7Oq3ZFkAeiTrD6vEdXIVEEeoX1vG9Xh4+3/UrzSH69Pj48
         0yY3R269JTsuxs6x2N/R79W3ideOzl9QxLjnCr9YyK9LkEMgOdsEoJ2KHauM9vikp7MC
         ozbA==
X-Gm-Message-State: ABy/qLb4lpiQ7KWVrQTgocxxv0nY4Vwwyr/bggx8uvQvd6k9PQ1rQT51
        x31jUITvE2AuOUNjtrjj00g=
X-Google-Smtp-Source: APBJJlFyDAGSDinc0OeHWadXJjZ39ZsS3qTD7ir3DizkKvwUTwCKCJ7V2ONOFmId/es+UoQOAf8oUg==
X-Received: by 2002:a05:6512:3691:b0:4f6:1b45:e8aa with SMTP id d17-20020a056512369100b004f61b45e8aamr5892802lfs.50.1688369072604;
        Mon, 03 Jul 2023 00:24:32 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id m3-20020adff383000000b0031417b0d338sm10374374wro.87.2023.07.03.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 00:24:32 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 29/29] MAINTAINERS: Add Hans de Goede as OV2680
 sensor driver maintainer
In-Reply-To: <20230627131830.54601-30-hdegoede@redhat.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-30-hdegoede@redhat.com>
Date:   Mon, 03 Jul 2023 08:24:31 +0100
Message-ID: <m3bkgt8nkg.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,
Hans de Goede <hdegoede@redhat.com> writes:

> Add myself as OV2680 sensor driver maintainer.

Thanks for this.

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6a7b43321d9..2ec35c3569dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15518,6 +15518,7 @@ F:	drivers/media/i2c/ov13b10.c
>  
>  OMNIVISION OV2680 SENSOR DRIVER
>  M:	Rui Miguel Silva <rmfrfs@gmail.com>
> +M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -- 
> 2.41.0

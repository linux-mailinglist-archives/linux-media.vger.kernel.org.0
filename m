Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331AE7E012D
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 11:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjKCHYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 03:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjKCHYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 03:24:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7262CD43
        for <linux-media@vger.kernel.org>; Fri,  3 Nov 2023 00:24:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d267605ceeso254434066b.2
        for <linux-media@vger.kernel.org>; Fri, 03 Nov 2023 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698996283; x=1699601083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YdeXO9jXSni1A1hnTGjPjHrrcJZHgfJ3MfApuy6Aqo=;
        b=jJIV3Ty1J/J7AiswJkC5MjhIjiTDPjQ1Yp3NGOL2aL17WPwwQGQsrreXNS57KlwGrh
         EmBzjSFW6irOk8WeqMbk9FK9TmJU9d999d41ZzKC2I1DjyM+rDe+mnREz3GVIdPWcJYn
         n2kMSflE+ztbCt3fgiYTOfS6ccrySnkxujxKqupS5DzlRL6STFA/GO4K97eHTfhHhcFi
         JmaFjdrRRFThiVSkNULb1gIT+y1kKUfK2UC+7tA2SkhF4z6m7zcF86FPGePRu28+xSn6
         3wrNXO1MQQEUDoD7ZQzvdbmtzjFk3fvYTraY5d1/ijl76iInCIG2ncKt4ZShGn9FcDbc
         TTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698996283; x=1699601083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YdeXO9jXSni1A1hnTGjPjHrrcJZHgfJ3MfApuy6Aqo=;
        b=SY7PQBUPWBV8qlsWupdBJ2jiHJOVS6Xpa7JGOBABN7bMhBmIvzTponkdlxyWlLy10k
         dhEnfc6qCARakQZ/Z0mBOjl3JxlbRFbuNzCfkJ0t6MiWT+flfqlCjaE1uVCq5dy63vxj
         FrCA2T+g+eH0Rd8xNqth9irlu+M/UruUmrIkdMpLLl3mapGSaf5U5lUA7sez6+YG1Zfc
         LnWQ7+NSdDXCccIxlqpTZGGA+dL85jTSFlnXz/6xrEypbEqEpjjGs3MUmu50/w/jmGXI
         jyHhHnwEpXxmPBPYgVQM5ejaEAk6OtgaOpFiahkfK+6sInlybZg18fZegl7sVahJDP+V
         b/4A==
X-Gm-Message-State: AOJu0YzLjbWdSSd3EpouYpfIbUVnJAcB6MTKnDmQfCE67UscehAXl10j
        3pHCEMK9AGEasQ+eW5RW0EYVMKNk1IJw/WWlHto=
X-Google-Smtp-Source: AGHT+IEMbmepwtRNRU87sLnv0uDTDE/yKB3fEm4/KqhLudIePrpmK4PB5q6SNKsQ2X42CT+scv8Hxg==
X-Received: by 2002:a17:906:dacc:b0:9a1:680e:8c54 with SMTP id xi12-20020a170906dacc00b009a1680e8c54mr6049886ejb.71.1698996282910;
        Fri, 03 Nov 2023 00:24:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906269500b009a1a653770bsm576461ejc.87.2023.11.03.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:24:42 -0700 (PDT)
Date:   Fri, 3 Nov 2023 10:24:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <f335560c-af40-4bed-ba3f-46a9efa339b8@kadam.mountain>
References: <a14df0e5-74aa-42c9-a444-ba4c7d733364@moroto.mountain>
 <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUSaccRE_lq5Mizh@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 03, 2023 at 07:00:01AM +0000, Sakari Ailus wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> On Fri, Nov 03, 2023 at 09:34:25AM +0300, Dan Carpenter wrote:
> > The problem is this line here from subdev_do_ioctl().
> > 
> > 	client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
> > 
> > The "client_cap->capabilities" variable is a u64.  The AND operation
> > is supposed to clear out the V4L2_SUBDEV_CLIENT_CAP_STREAMS flag.  But
> > because it's a 32 bit variable it accidentally clears our the high 32
> > bits as well.
> > 
> > Currently we only use BIT(0) and none ofthe upper bits so this doesn't
> > affect runtime behavior.
> > 
> > Fixes: f57fa2959244 ("media: v4l2-subdev: Add new ioctl for client capabilities")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  include/uapi/linux/v4l2-subdev.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 4a195b68f28f..21d149969119 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -239,7 +239,7 @@ struct v4l2_subdev_routing {
> >   * set (which is the default), the 'stream' fields will be forced to 0 by the
> >   * kernel.
> >   */
> > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		BIT_ULL(0)
> 
> This is a UAPI header but BIT_ULL() is defined in kernel-only headers.
> 
> So (1ULL << 0) ?
> 
> uapi/linux/const.h also has _BITULL().

Let's just do 1ULL < 0.  I'll resend.  Is there an automated way I could
have caught this?

regards,
dan carpenter



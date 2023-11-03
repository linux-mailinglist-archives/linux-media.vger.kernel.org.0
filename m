Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8BA7E0176
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 11:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346321AbjKCIBz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Nov 2023 04:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346280AbjKCIBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Nov 2023 04:01:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A501A8
        for <linux-media@vger.kernel.org>; Fri,  3 Nov 2023 01:01:48 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso282129366b.1
        for <linux-media@vger.kernel.org>; Fri, 03 Nov 2023 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698998506; x=1699603306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1zXBFSyu+yIRikL9eWtsBybNrF9k/ksn+RKfXyjT6o=;
        b=yrKrg8I1m1FxUp9kerXUIEpYp5S2gt8R8rOFzYOXlwX44TI9RgFIRQV0sypL6JTTTr
         VADWr5ojJP0KjW5kJkYfElQxky2iV4zkOZcMm1AhAoAp9J/GoJjSY1hTc2JAVlnDaRAh
         I59ZXPyppZ9fjC25Q4xI2rWOQoZabbn6Q6wbVgfIBay5EtD4X1S7tXzLML1WpUGto64d
         gjxqIKCelKlHSjUdHhdu36EGppY/HtOJSysjHYo3Zo0Qb5wbikAuGxnC2XS2tn+XeZ3q
         Hcqx+Dh1y6rJxIZEfqcRv9WSk2bpIE3noXYzLNoiOzzW+n8gRJsSCnEI1/o4ae719Ew6
         jzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698998506; x=1699603306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1zXBFSyu+yIRikL9eWtsBybNrF9k/ksn+RKfXyjT6o=;
        b=c8op+E5bqgoItZ6wUhUDHdlFIEMxGfzHgGueIdkKiYFnEgX/hA83zpRjoGQP7e386U
         Jv2mqzzrpAR0uOnU3B7jWF1p20CxYhYGCjpwQJym1ZfQs/7nDSThsbD6XBoHh1PjM4aH
         hNXOPG1AXVwdrEbzq15IBYJlpCvffS62ysUlEivAh4+Q2F+bCS1E9hVL75ALN+aOp7m/
         RwD7xYMdsGEYRcoFGiTvdUJ/EBtlS25gNwhV9oS5DNj0yo1D3KjbGTOgqzCIkpnZlQrP
         BnC5DQcmePfowYn2J6WEPmNgfDyWbB1zBTGI9oUzBrqd99D1l0fA+4ySBinSwhyBa5tI
         lYVA==
X-Gm-Message-State: AOJu0YzJqp3wpyi83H3V9zF8wy3rw6PVMf89MNxe0xC0VekQT9vx3q0J
        YFz3k8Vv6eKcvksRP+UUh60vTg==
X-Google-Smtp-Source: AGHT+IHtBtIBc4diGeeXXxfuX1ftRm66frX+bQqPktKYCUcVsBXOS7oNLF6/Nzvh10NM2WjmBK1GEw==
X-Received: by 2002:a17:906:fd81:b0:9be:bf31:335b with SMTP id xa1-20020a170906fd8100b009bebf31335bmr6353605ejb.73.1698998506306;
        Fri, 03 Nov 2023 01:01:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906595000b009ad875d12d7sm611511ejr.210.2023.11.03.01.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 01:01:45 -0700 (PDT)
Date:   Fri, 3 Nov 2023 11:01:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-subdev: Fix a 64bit bug
Message-ID: <c4d15d2c-8e15-43c8-8f61-e5b3db440d32@kadam.mountain>
References: <b9b0c0c8-6ece-466a-99e4-d49797f69957@moroto.mountain>
 <54940dc9-dcdb-41a9-876e-646a9810a22d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54940dc9-dcdb-41a9-876e-646a9810a22d@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 03, 2023 at 09:46:11AM +0200, Tomi Valkeinen wrote:
> On 03/11/2023 09:39, Dan Carpenter wrote:
> > - #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
> > + #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1ULL << 0)
> >   /**
> >    * struct v4l2_subdev_client_capability - Capabilities of the client accessing
> 
> Good catch, thanks! One would wish that the compiler would give a warning on
> cases like this... How did you find this?

This was an unpublished Smatch warning.  I have a comment in my code
that I didn't publish this because Sparse already had a warning for
this.  But that seems not to be true.

I'll clean that up a bit and publish it.  Thanks!

regards,
dan carpenter



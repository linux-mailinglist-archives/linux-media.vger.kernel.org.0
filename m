Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12F07B6968
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjJCMt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjJCMt2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:49:28 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5D391
        for <linux-media@vger.kernel.org>; Tue,  3 Oct 2023 05:49:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40652e570d9so9071135e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Oct 2023 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696337363; x=1696942163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=JXhJ8lVEqaQbQfqiLFkM5IR7OEITC9US5qgu9MwJkSgFwS9b1sawkVfHh/uCP3Vw1d
         IGTXSmTnj54onQZ7TNLPvJhG36d88ONUNIAV8f+YAjU74UuUoeu7re5UfOeY2JCFANi1
         PI4MQsUBVTfuqSDT9z0rZMAsBnnXPZntGncIMdgODV5B8b7wYNgRxm44+Nq0vV0L8AxI
         O6J1knivsTRqHJt6TJaIF9SBI64kq5EDdjWwPyVFN2sZr5BJHx8voZ0emNhL0SJiToK2
         14qHh4WDqqy0lGkrBP39kPyyLAoPd2qq3QnUPbVDmHL6bKOn+csodW0F2B6SfJWYZ9XB
         amnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337363; x=1696942163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=KRZuQ6Z/WSTu7Q7VivcPIdLJXablOR5h7oigX/fxf4p/BAzSrKOoHuaR/BBu4+1B93
         oKqnTmYX0VgujaaGlQDA2CcJbqtFU525I7+YMskCUDOC18OqRN7NUWQ6UjEv1ugtj/Fm
         USVQ3Irx/Z4MfRJmmp4Zog9c7oUDwVNLkvycWgITH7SMhx/P0FouJsa+F9h5+k/GYo7h
         0koyI0xDEYCajMtk2LRCVQQv34AZhCsAJ4pqtDZoHzWzUZ3TGwZ154yDlBqI3d5FOVPt
         KALY65ji8Is1KclQMTX5kiyNpMip4ylDXI21VRay4WLE/6A0pUJwP1vt/Ihuh/IevETg
         Ow3g==
X-Gm-Message-State: AOJu0Yxzt4m8iprBtxsntlMV986gd1yDQ9tEXQTQOlPwOZ5fU2Ro3Nk9
        aUh15OmS2pYM2NKb4BdgLq09GdlPFynnpD94keA=
X-Google-Smtp-Source: AGHT+IHaooNR/TbU/A9B5ajdiCBcPIbTQ8DPZxIgHjk9yBVQj+gRRRWDV1SLznjSXOlY8aO5drEItQ==
X-Received: by 2002:adf:f302:0:b0:320:b2a:4ea6 with SMTP id i2-20020adff302000000b003200b2a4ea6mr13526615wro.9.1696337363023;
        Tue, 03 Oct 2023 05:49:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v8-20020adfe4c8000000b003247d3e5d99sm1522305wrm.55.2023.10.03.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 05:49:22 -0700 (PDT)
Date:   Tue, 3 Oct 2023 15:49:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kun-Fa Lin <milkfafa@gmail.com>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
 <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 03, 2023 at 08:02:33PM +0800, Kun-Fa Lin wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> > The of_parse_phandle() function returns NULL on error.  It never returns
> > error pointers.  Update the check accordingly.
> 
> Commit message contains some redundant whitespaces.
> 

I have no idea what you're talking about?  Are you talking about two
spaces after a period?  :P

regards,
dan carpenter


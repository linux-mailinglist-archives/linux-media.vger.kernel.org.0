Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8500D417626
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 15:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346027AbhIXNuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 09:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhIXNuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 09:50:05 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474ACC061613
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 06:48:32 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b20so40852869lfv.3
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 06:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NRFXtODeBa3SkSCafztgkw2bK8xqC1z8hM0PTHXmUWs=;
        b=Xyr8Cq0ulXVujwfhCVr4s71c0ETd4kCS2Bvmae0GAAdaUYj7QoTj1cOTuxwqA6TmdD
         4P38xm1B/MRzQsHjxACFVtbmb7jJg2fxiTRX3QdZ3I1dQaiYhVjy4nMowLTVX7autNuK
         MGaJ+4QLoVGdHpEg5uzcxkj2VBi4OZ2fKk9yYWvzHZ9Yr9oygqDzt93/x8vSQTLiTwlX
         +Qe6fyDFDvcseNL3XM+U0adQDEnPeCmYrPxJlhCOhoAG9hWIlztDOcu5TkFVKfd61+Zr
         LG6Zuh51xL6Y1LZkGhSyilt8HFgyltmZOajeZ6jecF+E/IbQsruoqpKP3jAykoPB71D8
         xDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NRFXtODeBa3SkSCafztgkw2bK8xqC1z8hM0PTHXmUWs=;
        b=r4GKGQO2EMDoaFbvVNxY0ijoE4PgaQRtSGCu9cyQ3S5rfy7Xd3RUrMG15uPd2DIGvB
         IVoj1iuhefFPurulCnvYdNRlrujkQWPSZMN5t0ep+GFLHzS5757a7ZfwUEMe27YNbbw1
         t1bDBqmfxyvr9MMHWsfFvd6RoRzsLLzF2DxQ1CVDf9TS0YUSRaxWraXuHEPVW8PRxVBF
         ztl8n7w7Mmuxsd3D/pPUo5MAd5iL+l6Bc+RwX5ykg39iIhU52AgCL6E0Q6jkx8FkFHUH
         f7ozlYGma0PbZV7YBqJwxILaEOWMzkOsDoAmfmyEmUBiReoYb4Yjx1SNQxcWwI61nk12
         xu1g==
X-Gm-Message-State: AOAM533OL4ZX5SHgdEzjDFoBc8SEjyxYemYL62XcQ0NObSJJH2NYuqBD
        Umt84DgIz/0zXEJ/2UbyH7+Dtg==
X-Google-Smtp-Source: ABdhPJwdCnswAKXZYhPqPEnGLLiwGYtezdP3+QV+/tgwrzDMmQpSw3SOKDIKHvz0CEMmtP4UvFxHbg==
X-Received: by 2002:a05:651c:206:: with SMTP id y6mr11209139ljn.98.1632491310631;
        Fri, 24 Sep 2021 06:48:30 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id r7sm761470lfc.106.2021.09.24.06.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 06:48:30 -0700 (PDT)
Subject: Re: [PATCH] media: rcar-vin: add G/S_PARM ioctls
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20210924084115.2340-1-nikita.yoush@cogentembedded.com>
 <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <c90a960f-4c4d-7e9c-5f85-2931d1530550@cogentembedded.com>
Date:   Fri, 24 Sep 2021 16:48:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YU2gSJKfsqP+gUci@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> I would like to ask your use-case for this. I'm trying to make up the
> courage to move Gen2 inline with Gen3, that is move Gen2 to use the
> media graph interface to allow it more complex use-cases, including
> controlling parameters on the subdevice level.
> 
> So I'm curious if this solve a particular problem for you or if it's
> done "just" for completeness. If it solves a real problem then I think
> we should move a head with a v2 (with the small comment below fixed) if
> not I would like to try and reduce the non media graph usage of the API
> as much as possible.

I believe parallel camera - such as ov5642 - connected to Kingfisher's parallel interface still has to 
be controlled over v4l operations on vin device. And, to control frame rate of such cameras [which is 
the usecase we have here at Cogent], the operations that this patch adds are requied.

> Please use &vin->vdev instead of video_devdata(file).

Preparing v2 now.

Nikita

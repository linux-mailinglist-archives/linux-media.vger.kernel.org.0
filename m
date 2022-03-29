Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EB44EB6A3
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 01:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239959AbiC2XXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 19:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239927AbiC2XXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 19:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 96761184B43
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648596085;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vnEVLzN6wtV9JQalUxoL87eeycMaKfu2BZqOrOuPk4E=;
        b=NG6ek5Ue9ncyj9C4wv6UjsQb7VRWVPgP6WC2nAI3g6VM9OJVVOdsLuA7DOqlmY5k1zPWaB
        yxAF86UqkVirqcebJ9w4JIus/UrrYeFHksz6OG5T8DhaJzEWUDeG8Jii4969S3g7HUZ290
        81Rn5TBcYAzRt9oit50yoXcIWapz8kw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-dyU6XNJHOEuU_J6BAg8Q3w-1; Tue, 29 Mar 2022 19:21:24 -0400
X-MC-Unique: dyU6XNJHOEuU_J6BAg8Q3w-1
Received: by mail-qt1-f197.google.com with SMTP id u8-20020ac858c8000000b002e1b3ceb167so16011197qta.10
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 16:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vnEVLzN6wtV9JQalUxoL87eeycMaKfu2BZqOrOuPk4E=;
        b=Z0Z9/wE0GlsbbkuuockBZX8uJQr7HSiMw0uIu5MRXsCobpFrrl4OKBcFVxvUtCWo+2
         qU0mabmCFh6YT2DBc/bmf0F+iFW1y+Nq8fyiClw3mrBDQkwS0hxtRF/lmU4fplIWVB3e
         YB5ak5a3EBkBbOVAXGNfiJ1My+QndoB7oPhHzT249MyMtx5bv43oJ2bfVJzzBhgvZCJB
         /X/osrqIpzfFNMgjPLuxIGbLD85FueWJ4jG5A5nHPV2jsi2oeuR34xZ6sws9/K2Bh55E
         Qfuq7kQmDGeak+WRT4DKNqTmUOirUPRdmmZMMgjD/ec3hNQ+bGlLdv7cPe6VkWE7BMzr
         aBhw==
X-Gm-Message-State: AOAM533Ldiel85O3AkBVc8YbcsClfy8Gi/6Oqf0aCHxDffieQIIWt7fR
        zIUf1+W3f5KgPgnDgfvIw9xJvM/uZ8XkTm4Gji4SUYRNE0xtVI+1ONv4+i/YPS87AMgGmKssgFc
        htPFLLptaGs29gRlImh8lBLs=
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr2912682qkb.17.1648596083865;
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaMl8cwEN02JVbghXfjiOKK5vbmlk7rHZYxrkXCYwKhBHbTy3z6OejWxFNRFl2ohGsizFJXg==
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr2912659qkb.17.1648596083595;
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q8-20020a05622a030800b002e1c9304db8sm15819272qtw.38.2022.03.29.16.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 16:21:23 -0700 (PDT)
Subject: Re: [PATCH] media: staging: atomisp: rework reading the id and
 revision values
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        ndesaulniers@google.com, hverkuil-cisco@xs4all.nl, vrzh@vrzh.net,
        tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20220326191853.2914552-1-trix@redhat.com>
 <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <2ab474d8-ee4e-44b5-ab3c-38b72135a27f@redhat.com>
Date:   Tue, 29 Mar 2022 16:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YkN0w5NxLcBFes1b@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'll do a resend.

I use git send-mail, sooo not sure what went wrong.

Tom

On 3/29/22 2:06 PM, Sakari Ailus wrote:
> On Sat, Mar 26, 2022 at 12:18:53PM -0700, trix@redhat.com wrote:
>
> Hi Tom,
>
> It seems that somehow the Content-type header of your patch  is
> application/octet-stream. I.e. not text.
>


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B8159C20D
	for <lists+linux-media@lfdr.de>; Mon, 22 Aug 2022 17:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235806AbiHVPC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Aug 2022 11:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235828AbiHVPCu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Aug 2022 11:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C9C3AE44
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tAagD92DgpPLRP4nmP4j9mQsDHAfVj7sNkD03udQp1E=;
        b=hwVqwxgflWjEedwC7cZqlS9wYSATN6FDxrMbM8AIcMdFUTPCvr9mP91p/gSspUGGF+/bUf
        HM/lxzC+EssMlRj8/Dxmky2svJOtmpNXmaR+L6/LtfCGIkHrq4+oZ5rQ9mIGFRC9bmcC8v
        fjm1LhH7eS63JlY0/U6uXM+p1nCn6QY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-M7ZNUW9XNX-usYfj0U_-Wg-1; Mon, 22 Aug 2022 11:02:46 -0400
X-MC-Unique: M7ZNUW9XNX-usYfj0U_-Wg-1
Received: by mail-ej1-f71.google.com with SMTP id gt9-20020a1709072d8900b0073d82402ea6so636172ejc.21
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 08:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tAagD92DgpPLRP4nmP4j9mQsDHAfVj7sNkD03udQp1E=;
        b=75+agpbiAcJ+Ma3MAczg7npB2ofWEb6qjR4IJiG6sVhZWqF+9oyPicti1TBPIsDAU5
         a9SBw69PCTcC/JjBAg8NCcgHLb86JSWPvpm8mOgPnipz6wOC189tQjnQ6hHiwaswcA7T
         wzvObMlNWyy//7dw9R0oMi05/bnchBJRY1he/U8v3bYXUyYVD6vpsj8PwWNR6k+USVJz
         bdNeTDtSobvKC/BBZ8RsiIFsOP9HNuyat49nIk1xjhrbTPTdqVfGCsTd18VCCy57Gj11
         WgYJkStfGlmc9JyTsCs7m8qPr/0TCQXdbjlCAsA7oMs9ZpWbpYvlZiIT9+iN2Zph2TUy
         cRnw==
X-Gm-Message-State: ACgBeo1M/Q3S430Z3vkQsul91VUuRylr72KFwyW8krDHELMsZTvCHQ37
        YmdH9icCPU51A6jaTlJMtavwx4A7ZlxcpY4JgT8jkyOcKEBo4VrW8ZKbctxTMaz3K9i3jEh7pTI
        2m4jcsQbgZ7dFr3VY8gGR8Jk=
X-Received: by 2002:a05:6402:369:b0:445:d379:d233 with SMTP id s9-20020a056402036900b00445d379d233mr16545217edw.395.1661180565568;
        Mon, 22 Aug 2022 08:02:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Tgj6iNgnpW7+mYPjMHmKg2mePtiW+abe1NLLCO/8hIG85/j4SsYD/JSWYKgwrkqohmYJomA==
X-Received: by 2002:a05:6402:369:b0:445:d379:d233 with SMTP id s9-20020a056402036900b00445d379d233mr16545203edw.395.1661180565405;
        Mon, 22 Aug 2022 08:02:45 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b20-20020a17090630d400b0073d62cc3270sm3657006ejb.118.2022.08.22.08.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 08:02:44 -0700 (PDT)
Message-ID: <e73589c1-b78f-8812-4cb2-9d0e6441984d@redhat.com>
Date:   Mon, 22 Aug 2022 17:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 12/13] media: atomisp: hmm_bo: Drop PFN code path from
 alloc_user_pages()
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
References: <20220821215027.461344-1-hdegoede@redhat.com>
 <20220821215027.461344-12-hdegoede@redhat.com>
 <CAHp75Vezhe_pBrt+pesneh-Tt_eqwJyOHmMdt8s7nG-V+6O7iQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vezhe_pBrt+pesneh-Tt_eqwJyOHmMdt8s7nG-V+6O7iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 8/22/22 15:02, Andy Shevchenko wrote:
> On Mon, Aug 22, 2022 at 12:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> alloc_user_pages() is only ever called on qbuf for USERPTR buffers which
>> always hits the get_user_pages_fast() path, so the pin_user_pages() path
>> can be removed.
>>
>> Getting the vma then also is no longer necessary since that is only
>> done to determine which path to use.
>>
>> And this also removes the only users of the mem_type struct hmm_bo member,
>> so remove that as well.
> 
> ...
> 
>> +       /*Handle frame buffer allocated in user space*/
> 
> Spaces?

I just changed the indentation on this, but I might just as well
add the spaces while at it, will do so for v2.

> 
>> +       mutex_unlock(&bo->mutex);
> 
>> +       page_nr = get_user_pages_fast((unsigned long)userptr,
>> +                                     (int)(bo->pgnr), 1, bo->pages);
> 
> No need for parentheses in the first argument.

Ack, will fix for v2.

> 
>> +       mutex_lock(&bo->mutex);
> 
>> +       dev_dbg(atomisp_dev, "%s: %d user pages were allocated as 0x%08x\n",
>> +               __func__, bo->pgnr, page_nr);
> 
> Since you touch this you may remove __func__, which can be enabled via
> dynamic debug. OTOH, it might be better to go and drop __func__
> everywhere in the driver in the debug messages.

Or even better, I'll just drop this useless debug statement entirely for v2.

Regards,

Hans


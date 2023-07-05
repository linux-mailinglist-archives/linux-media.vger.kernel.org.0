Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD78B748287
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 12:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbjGEKvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 06:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGEKvP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 06:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD04CE
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688554228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=28PrgTmByLBIuzFUI7H7LzccghM3Gp0jyj9hCFK3AzQ=;
        b=HZlnVOFUBegmwv9o0kTQs2pS1ySj3+AlA2HFrG9O9ilPbKwYz+3Mo0Wu48OpvChXxb8gf+
        Cf91pjKDSTRZXrqejmbvspqSpu/DkYBN6Bo5VZAtf7Z5BTTPbVeFJtUGgbqqL5aneJuKI6
        xKAfp+h/csbRzzEesY8lVH4Un3oJSaY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-AL2FBo66OKGnaRGsCUk3EQ-1; Wed, 05 Jul 2023 06:50:27 -0400
X-MC-Unique: AL2FBo66OKGnaRGsCUk3EQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-97542592eb9so365230166b.2
        for <linux-media@vger.kernel.org>; Wed, 05 Jul 2023 03:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688554226; x=1691146226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28PrgTmByLBIuzFUI7H7LzccghM3Gp0jyj9hCFK3AzQ=;
        b=cqDkKPoRClbmoVFX4rw/Dt87TZ5DxGpdGbcCUxIiJxND+axbm162by9PfZ+Dv9Ip/1
         6Pab5jWEgjiNyhrMdImsOVrTFlqjBsQO9yj4uArXROQHxukMoR5Zln+g+tuyI78pK87v
         uxEApUjmksww5nVLX0BnckGqtvKhxBLpWyDwr8jF4c0IviKp2g6osIhkp0HRJ2TLih4K
         jQEsX5kozlKsM9V8UBtscCAYrep1foo1m0lI4LQe5gForCx5q30V7b+QpyG1wvqq8O7g
         x5JPHF3ugfAdyKVauhsjygIedLtM5KogrPEDXdHHP0pyHH01o/SSLv0GQ/uP/B6KxJDM
         dSDQ==
X-Gm-Message-State: ABy/qLYOQj0uGuAbA7ikjuOFDzbbluolcnTx8JzUckgp4k7BSbsLkS3E
        +BNYbTRzizMJNtQlZ0mcs301codjRYiUhpna+ysj59fGs+XT6P9yIbqNaoumqiH/IeTEpB2r5gK
        HVhajyxawGfkhWfABvD+BVgo=
X-Received: by 2002:a17:907:100c:b0:992:e76:9c18 with SMTP id ox12-20020a170907100c00b009920e769c18mr11586258ejb.37.1688554226590;
        Wed, 05 Jul 2023 03:50:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE23+s0lmIj6iCxJzfuwgIhO0ysDMC+0R14oVhvjwDJbi1HE2wLbJ4K/tW0+ScX9sja5A7Ang==
X-Received: by 2002:a17:907:100c:b0:992:e76:9c18 with SMTP id ox12-20020a170907100c00b009920e769c18mr11586239ejb.37.1688554226286;
        Wed, 05 Jul 2023 03:50:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a21-20020a170906685500b0099307a5c564sm6448008ejs.55.2023.07.05.03.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:50:25 -0700 (PDT)
Message-ID: <ff5c680f-3edf-13fb-1d0f-49e8a4920514@redhat.com>
Date:   Wed, 5 Jul 2023 12:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] media: ipu-bridge: Make exported IPU bridge symbol
 GPL-only in a NS
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
 <20230630134506.109269-3-sakari.ailus@linux.intel.com>
 <ZJ8VCe0LKdGxLcpb@smile.fi.intel.com> <ZKVKsoCkX2Z3F93a@kekkonen.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKVKsoCkX2Z3F93a@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/5/23 12:49, Sakari Ailus wrote:
> Hi Andy,
> 
> On Fri, Jun 30, 2023 at 08:46:49PM +0300, Andy Shevchenko wrote:
>> On Fri, Jun 30, 2023 at 04:45:06PM +0300, Sakari Ailus wrote:
>>> Switch to EXPORT_SYMBOL_NS_GPL() on ipu_bridge_instantiate_vcm(). The rest
>>> of the ipu bridge symbols are this way already.
>>
>> Hmm... This actually changes the license, Why is it initially non-GPL and what
>> are the consequences of this change?
> 
> This does not change the license. It's just that the function will be
> only available for GPL'd users. I'd think the reason why the plain
> EXPORT_SYMBOL() is used is plainly historical.
> 
> In any case, after Hans's set the other two functions required for using
> the IPU bridge are GPL-only.

Right I'll fix this in v3 of my series so that this symbol uses
EXPORT_SYMBOL_NS_GPL() from the get go like the other 2 symbols.

Regards,

Hans


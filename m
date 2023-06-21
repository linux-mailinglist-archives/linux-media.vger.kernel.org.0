Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C09738FAE
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 21:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjFUTKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 15:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjFUTKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 15:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360E7171C
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687374586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E/SI2ZiNM+4wl6j7NP2BlAlIGwFb8a2NFFysldS8ZRU=;
        b=Tjsr827LAMWXatkZRle+u3zomMXTRTk5ocAsZDJktdc4Pitdw6ZGsZnafUO/mVsdKNJDij
        lSczNO1c3J3OFmnoIKJZiAUTPlGao131MCrbkr3hKITuvkE/wZSGpPnZ7GD1MSzk8hVhJe
        GoSqoK+FSkrLZP6IoBhwcnbHWF+YGGg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-5t2v1emuN0SNLHeIXIjoQQ-1; Wed, 21 Jun 2023 15:09:44 -0400
X-MC-Unique: 5t2v1emuN0SNLHeIXIjoQQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso446107166b.3
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 12:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687374584; x=1689966584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/SI2ZiNM+4wl6j7NP2BlAlIGwFb8a2NFFysldS8ZRU=;
        b=elKFzXdlSiJeacplvALKA14w708YSgpb+Rv1JNzeEs9tJ9xougn1MruBybrhDznVMn
         55DgK5gSam7/a9SlihWaBpZh69uHeFnYveoQ40QRQR3ywZiAVX+Z1SUOxSSymr8H6688
         S7bepaNPUIKj9R0uNtnxTW8VrZA2DGHttPtMAIH/0ee7vPJ36bS4hXmEZRxrQkiQzhl/
         MVjLjoDk0Wto+JMzwUv6+IXRfJ8mFHZp/aqWDK1E1Lw0dohpRMxaRUAdYgnC6l7rJ5Aj
         EfI55p1x3Rq/Wp5IKZcw3L+uYraHWS3HWtPNN4Nb122rS6rR2OXGrsF5T/aPzeHeNzxe
         ZRgQ==
X-Gm-Message-State: AC+VfDxbyBbjyWY7tSMmrcR5hWc6AQxzhhRn/p2oyW9jWNj6edCP+XLB
        8x7lyP9x0hRrZ4guelFiT1Z5rUYBNqC/t3aZArKFzuGFTXRs86WxVHDVCOn8jVKDYDIFYpjGEgB
        aY+gtkyNDOF7nR4lYqCBg5MI=
X-Received: by 2002:a17:906:fd89:b0:988:8be0:3077 with SMTP id xa9-20020a170906fd8900b009888be03077mr8602072ejb.31.1687374583884;
        Wed, 21 Jun 2023 12:09:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pqyhR4GPilwa3mS435FcOTGiloJ1KpbBNBfnvVurMfG/0+LHBAbRA2L5yuFbiQx+EbbGF1g==
X-Received: by 2002:a17:906:fd89:b0:988:8be0:3077 with SMTP id xa9-20020a170906fd8900b009888be03077mr8602057ejb.31.1687374583595;
        Wed, 21 Jun 2023 12:09:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906170f00b0098314c30e8fsm3467896eje.46.2023.06.21.12.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 12:09:42 -0700 (PDT)
Message-ID: <fa7bf240-456c-23ed-0020-376812e9b5fa@redhat.com>
Date:   Wed, 21 Jun 2023 21:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/7] media: atomisp: Fix missing v4l2_fh_release() in
 atomisp_open() error exit
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20230619105212.303653-1-hdegoede@redhat.com>
 <ZJA4KYg9t1f8T2p7@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZJA4KYg9t1f8T2p7@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 6/19/23 13:12, Andy Shevchenko wrote:
> On Mon, Jun 19, 2023 at 12:52:06PM +0200, Hans de Goede wrote:
>> Fix missing v4l2_fh_release() in atomisp_open()'s
>> "if (pipe->users)" error exit path.
> 
> All LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

As always thank you for all the reviews.

I've fixed up the ioctl-s -> IOCTLs remark in
the commit message of 6/7 while merging this.

And I've merged this entire series into my media-atomisp
branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

Regards,

Hans



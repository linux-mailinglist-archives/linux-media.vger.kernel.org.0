Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C54856B288D
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 16:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjCIPTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 10:19:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjCIPTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 10:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009B0DDF34
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 07:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678375137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/9yFC6UG6Qb69zCObh92ltCysfwKAZhk1RaD2VUDs0U=;
        b=dH8PZj1ac1/EgN/32jsjQRyEc0AS8hMJEkbrJWg8PI2ezdP6/4k8YsR3YVksLSoYIKUqWm
        u+6OxWQjk3AiKINxkkLY0McOKpIQvUxXf+qVm/+G6YnWvjreI2Xd8XnOL/3xS1m4q82Fcm
        dbdbKWozIjRWJeJt/TxI0rKgyuDp4HQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-evjD9TIbPwu7NSFvWijfaw-1; Thu, 09 Mar 2023 10:18:56 -0500
X-MC-Unique: evjD9TIbPwu7NSFvWijfaw-1
Received: by mail-wr1-f72.google.com with SMTP id by11-20020a056000098b00b002ce45687cbdso537160wrb.12
        for <linux-media@vger.kernel.org>; Thu, 09 Mar 2023 07:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375135;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9yFC6UG6Qb69zCObh92ltCysfwKAZhk1RaD2VUDs0U=;
        b=Hb3YRpcklpOlfnqOVkYUlsotGCP9mifKnaae7ItwL+ocI92OfJozxCje+DlZ6DQJzI
         RSG4T4ARw06p1pdF8V2Qy3zJL996KomRce0UQZl57Bs08Arqw/CBUUKIzvTULbIlHuyT
         tuSajxqrjgh3Deh04JcgstXUTC3TO5knN9meQxN7UYVk7RPGkUUqFa4+smQ1/nJCyC1X
         qAU533aYyWQauunDDbb7EoEIfRh4mUwg/uVQ/KYt/I8LqA4t/r91zXbpxLy/E0YZLeRX
         YVy6uUjYZFuVFnEFWbKXnIzdKo7z2Asb2qcztsWXh3Y3HG9FHawOl2gfWZ3wcxYwT5BE
         pBtw==
X-Gm-Message-State: AO0yUKXSS5SCmEowF9HkSOSdPPU//vxjweluf7/b8cVB7P6uS/dtysEY
        bNwjL0tkVqfPN0iwvZ7BNgSGuMjRan9D/zqWZKnmEccN8kbaCkHL3yIzkHSmP1F2fypAvOw3nyk
        s9/bD2x8stT7S/+myrtZVQlQ8TC0YjQcNtw==
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr19471523wmq.23.1678375135004;
        Thu, 09 Mar 2023 07:18:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/hSS1pZuG+MnQuREyxGPFkGYBqTYNoS6/zwRI22k5tqtoTJHGML2449NbBIDvfKh+VFM7Fmw==
X-Received: by 2002:a05:600c:198e:b0:3eb:36fa:b78d with SMTP id t14-20020a05600c198e00b003eb36fab78dmr19471510wmq.23.1678375134671;
        Thu, 09 Mar 2023 07:18:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b002c569acab1esm18202922wrm.73.2023.03.09.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:18:54 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Jordan Crouse <jorcrous@amazon.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc:     Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sergio Lopez <slp@redhat.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: venus: dec: Fix capture formats enumeration order
In-Reply-To: <20230308181245.nbnwkdtdnsldd65l@amazon.com>
References: <20230210081835.2054482-1-javierm@redhat.com>
 <20230303220918.qr5ydbin3nye3qtz@amazon.com>
 <87h6uydwel.fsf@minerva.mail-host-address-is-not-set>
 <3d0315fa-14ca-dc34-81ae-467d9ed5133d@quicinc.com>
 <87sfeh0yjn.fsf@minerva.mail-host-address-is-not-set>
 <CALE0LRvR=DjUp2_DBuPQkEr9jvzGH4Mx4-7=rc6zOw1APQdyeQ@mail.gmail.com>
 <20230308181245.nbnwkdtdnsldd65l@amazon.com>
Date:   Thu, 09 Mar 2023 16:18:53 +0100
Message-ID: <87ttyu54wy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jordan Crouse <jorcrous@amazon.com> writes:

> On Tue, Mar 07, 2023 at 05:20:18PM +0100, Enric Balletbo i Serra wrote:

[...]

>> >
>> > But regardless, I think that it would be better for a driver to
>> > not change the order of advertised VIDIOC_ENUM_FMT pixel formats.
>> >
>> > Because what happens now is that a decoding that was previously
>> > working by default is not working anymore due a combination of
>> > the default being changed and S_FMT not working as expected.
>
> For my part, I was using the gstreamer v4l2 decoder which for some reason tries
> to verify it can support whatever format it gets with G_FMT *before*
> trying a S_FMT. I can't confirm or deny if S_FMT currently works or not.
>
> That said, I entirely agree with Javier. While it might be more
> bandwidth efficient, QC08C is a obscure format. It is far more likely that the
> average open source user would rather use a well known output format and, as
> has been mentioned, once S_FMT is fixed those in the know can use the other
> formats if they are working with other Qualcomm hardware blocks.
>

Agreed. The rule is that the kernel shouldn't regress user-space and the
patches that changed the default format certainly did that. So from that
point of view I think that this patch should land.

There's also Enric's point that NV12 is a more common format and supported
by more user-space programs. That's why think that regardless of the S_FMT
situation, makes sense to revert to the previous default behaviour.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


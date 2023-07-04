Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72310747471
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 16:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjGDOvM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 10:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGDOvL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 10:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D6F10CB
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688482221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y3/VF2FnlDhUD34ly0PvgL18UBW2Q5KYjAtzB/5J254=;
        b=LxG+LY0DTMbe43xIPhRNgSqEaMmHJXDvttiBmnfCW+GijPU8kKYFuAI6QBYK8NXpNJMsOC
        2aY+drHzKCYMHE2EJyaWcI0BP4VoTvlNP3r0sKXkHc3EWSsuIf7T73gW1cao3PxlfP2Apt
        WuvOwMC3zORempIlMItfYKeqFeAv2KQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-7ZBVGk6OODmwOgCll74CMQ-1; Tue, 04 Jul 2023 10:50:20 -0400
X-MC-Unique: 7ZBVGk6OODmwOgCll74CMQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9835bf83157so382438566b.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 07:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688482219; x=1691074219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3/VF2FnlDhUD34ly0PvgL18UBW2Q5KYjAtzB/5J254=;
        b=eXgKI3934sKzpqEtNip0YRAw41BZCIKUHuMN7+leBmBMUDiF1DvQJ6Gq+D8vmQKmFL
         Kn0bH4dQogkZpWqZVp36AZIObNkWMoiMKcEYDq3Zsd16balVUxkUd0oJ0fR5fvOtylBj
         POKFvlm93JyOZAypTKMSFfu3H+gin/DidDd/r2IelG1LrvGQnc7UplmXiuAX6BfN3ONX
         mFHwoxVjbw6F2C18yD+f0T8xypo0EiYsKRCiWs6Cddde0QfDfIDhYfu6gc+mLL75Bd3J
         npvnjOPKBxrTJs4y8/e37lkApgwCvdD+/wP6kYqy0eHVBayvHpabMLbnjfbB45Zg6jXm
         mP4Q==
X-Gm-Message-State: ABy/qLYFTgznnGsaqLXBbtbihpitM8RQXpIW5X3Iw4bjhWu5e0k2Ao4j
        4BpTbfw3JL46q25BfHLcYSHKvDNiwU9kHz6FRzgtjecqjYlTo6PjPE+Ld0I7zZ5dKabaoqlxi5z
        1ZfAcsBk7Y0QNwhEBoPRRZoc=
X-Received: by 2002:aa7:d0d0:0:b0:51d:df35:3818 with SMTP id u16-20020aa7d0d0000000b0051ddf353818mr9685525edo.5.1688482219398;
        Tue, 04 Jul 2023 07:50:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEdQHTMbaLJfAoNgthDL2fhXlJvUkTyp2iqPq3PlhoX8Gr/pbDV85+AwYPLk8/tJVqOJAVr4g==
X-Received: by 2002:aa7:d0d0:0:b0:51d:df35:3818 with SMTP id u16-20020aa7d0d0000000b0051ddf353818mr9685510edo.5.1688482219092;
        Tue, 04 Jul 2023 07:50:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id u17-20020aa7d0d1000000b0051e0f8aac74sm2764520edo.8.2023.07.04.07.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 07:50:18 -0700 (PDT)
Message-ID: <41999c8a-6465-587a-d77c-313a424b7f21@redhat.com>
Date:   Tue, 4 Jul 2023 16:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/15] media: ipu-bridge: Fix null pointer deref on
 SSDB/PLD parsing warnings
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-2-hdegoede@redhat.com>
 <CAHp75VdQAJyfYj63pU4DaD5EhWpW-k5jJ-AUv7QNyPM1MJ4-eA@mail.gmail.com>
 <18b44c72-1873-4756-3fa3-55d6ca4c3984@ideasonboard.com>
 <ZKQsglq1DmM5sgq6@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZKQsglq1DmM5sgq6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 7/4/23 16:28, Andy Shevchenko wrote:
> On Tue, Jul 04, 2023 at 12:02:00PM +0100, Dan Scally wrote:
>> On 30/06/2023 16:23, Andy Shevchenko wrote:
>>> On Fri, Jun 30, 2023 at 2:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() run
>>>> sensor->adev is not set yet.
>>>>
>>>> So if either of the dev_warn() calls about unknown values are hit this
>>>> will lead to a NULL pointer deref.
>>>>
>>>> Set sensor->adev earlier, with a borrowed ref to avoid making unrolling
>>>> on errors harder, to fix this.
>>> TBH, I don't like this approach, it seems a bit dirty to me.
>>>
>>> First of all, why do we need pci_dev to be a parameter in this function?
>>> Second, why don't we consistently use the ACPI handle (with respective
>>> acpi_handle_*() macros to print messages)?
>>>
>>> So, my proposal here is to actually save the ACPI device handle in the
>>> sensor object and use it for the messaging. It makes it consistent and
>>> doesn't require to rewrite adev field which seems the dirty part to
>>> me.
>>
>> It's a bit finicky but I don't think it's so bad; the refcounting is all
>> fine, the later acpi_dev_get() is only to hold a reference once the next
>> loop iteration frees the existing one and the rewrite should store the exact
>> same pointer...we could just not store the result of the acpi_dev_get() call
>> to avoid that weird rewrite perhaps?
> 
> For short term solution in between the patches I might agree with you, but
> backporting. Backporting a bad code doesn't make it better even if it fixes
> nasty bug. And I proposed the solution. We may kill the handle same way as
> we are killing the awkwardness of this assignment later in the series.

Yeah, no sorry. As Dan pointed out this fix is fine and I don't feel
like re-writing it just because you don't like it.

I don't see any real technical arguments against this approach, just
you not liking it.

Regards,

Hans



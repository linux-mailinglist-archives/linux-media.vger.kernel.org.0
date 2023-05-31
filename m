Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A5B717DC8
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 13:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbjEaLMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 07:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbjEaLMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 07:12:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9CAD9
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685531509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+7km1XPttamFQ1dhwIIrt7M9PSs+swUo6x6uptB/ScQ=;
        b=DXnigUNwoxE/FWKo0fnbwlvKHWZ0EjPTpsYLKCdWDKtOF4O+/9rVDnOu9M409Ar7k6DWgr
        Gh0OOxvt6Ec//QECnACyrtNCRaxx0UNSJtdWBRRB63Tk2QDV53KXeefJCK6SjKHxdgEcPH
        JKG5ehx+bXtkIzTwVQ/FVHvrJHRAtG4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-AwwS-evEPBax3MFVsDlf-w-1; Wed, 31 May 2023 07:11:47 -0400
X-MC-Unique: AwwS-evEPBax3MFVsDlf-w-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-514a4cfa313so2585957a12.0
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 04:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531506; x=1688123506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7km1XPttamFQ1dhwIIrt7M9PSs+swUo6x6uptB/ScQ=;
        b=V2wrbslQ5BGrsDzZLAYQ8IfIrWnmgLP1mmpqrRPuDOS1R/oL/h692G8e3tQ15MdIsZ
         NhMpsOPjYT/wi4E3L8SgtAfWyBq6j3ogId8G3UfoIcFmzT9e/OozN/MXC8g/pyBt7HeC
         8HwfYyG3QNQMhLHw8nY12HDl/rCG4U4rGyc5pukmvMoRwThchoHn6XwfmgJT5YIPCcBu
         yQH0W2aCz2ZeTX6uWMmAYcdHOEN1D7PmcOOd3tu0eVAn8CDF5rhFHzEJUTa+/H9LAoJX
         Nu25KEnO2+cqfsMrC6gl8tc8ezSmf7ZqWIXlBuVfvzcUKEJq+gwJOhPjp7oN0Dz5h9EV
         AncA==
X-Gm-Message-State: AC+VfDw3J6XFbP2dth++1+ptc+Lix3rv7rxC+nv3WnxmZAp3j0kmqFDF
        9czSsAijVPctlkWvodRhUtj/6lWncOOGESnLTZGQiiDwfnw1Xooabt8ivPKEVMHbWVR8eNnZu0w
        TS1TITB7hpeHONnMSkim3Cmw=
X-Received: by 2002:aa7:cb4c:0:b0:510:ddad:fae6 with SMTP id w12-20020aa7cb4c000000b00510ddadfae6mr3346023edt.3.1685531506841;
        Wed, 31 May 2023 04:11:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XLmzlQYT/Pf/u6U2ahhMUisVA7ArRVu/IJ3fqlOeSMiUowBUcXcyc6UyoLoj1V+6SMFcNXA==
X-Received: by 2002:aa7:cb4c:0:b0:510:ddad:fae6 with SMTP id w12-20020aa7cb4c000000b00510ddadfae6mr3346006edt.3.1685531506534;
        Wed, 31 May 2023 04:11:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f14-20020a056402004e00b0050c0b9d31a7sm5628060edu.22.2023.05.31.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 04:11:45 -0700 (PDT)
Message-ID: <c1be981f-3664-0064-d21c-cd7ff2fa9bcd@redhat.com>
Date:   Wed, 31 May 2023 13:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/21] media: atomisp: ov2680: Add init_cfg pad-op
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-6-hdegoede@redhat.com>
 <CAHp75VeTdAd98hAKGMo+Skqh0KnbCd=NXQHiB7L8jCkmue1zpA@mail.gmail.com>
 <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VecdMCp=pqfxFfZ2h81ugGcDjJgQeV8X7fnJ39Bfr2hgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/30/23 13:51, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 9:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>> +static int ov2680_init_cfg(struct v4l2_subdev *sd,
>>> +                          struct v4l2_subdev_state *sd_state)
>>> +{
>>> +       struct v4l2_subdev_format fmt = {
>>> +               .which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
>>> +               : V4L2_SUBDEV_FORMAT_ACTIVE,
>>> +               .format = {
>>> +                       .width = 800,
>>> +                       .height = 600,
>>
>>> +               }
>>
>> I would keep a trailing comma here.
>>
>>> +       };
>>> +
>>> +       return ov2680_set_fmt(sd, sd_state, &fmt);
>>> +}
> 
> This is not addressed in your branch.

Oops, sorry I've fixed this in my branch now and I've also changed
6/21 to make __ov2680_get_pad_crop() look like this:

static struct v4l2_rect *
__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
                      unsigned int pad, enum v4l2_subdev_format_whence which)
{
        if (which == V4L2_SUBDEV_FORMAT_TRY)
                return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);

        return &sensor->mode.crop;
}


Regards,

Hans



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9CA7163B4
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 16:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbjE3OUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 10:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbjE3OTE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 10:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E42136
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685456278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lcru5zK9DZpPWewtOT+0FyHAo9jOchTkFs+5fjO227k=;
        b=c8/YzmAecbbWf665Zjhilt1hg55VShrwFKTK8bu2hSvtyBRGnEO3M/yrTKaGfplglmbpsb
        f3gx2OlmF9AJajYGLQe15GwI5E3TR8SpU0RsUSboN2cJd2gHNLqZItlzkE/zWgyg3UixXh
        p60KhN7WgMopitaFNCNXOuYQFZwV6kw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-wUlndKWmOxKfjY2BthhMmg-1; Tue, 30 May 2023 10:17:56 -0400
X-MC-Unique: wUlndKWmOxKfjY2BthhMmg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96fe843f61eso485168566b.2
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456275; x=1688048275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcru5zK9DZpPWewtOT+0FyHAo9jOchTkFs+5fjO227k=;
        b=K71EliNy6EaFyfMafp+14gZMFErh1PeDjrwjsbGLCcAD+ex9Gm6npay+nDdyLiXS1/
         WGqNPhBfAMUYwxNveHGjFw/xQ8ZROFx+wyITu9Aa0AiWP2uSFDctHag13OiqS1wbvi7j
         KOb32WoTrLCMvchtz421Tx3M7RLaed3aZb3TQmCpOrhW645QyYFUlZY1fMUaF3KfjyAt
         DI9tq/bxnsL4fQEH8XfL2DZnWpCdbVl+ViBZILAZjSlONcrQM2nv9264T+0CVAHmtqov
         RnurSHRBkPKabEFkavx5QamKG1HgMfXdGz4rfWv8Zb3GEXWmCE7WmEYycq8gyHd/eaF2
         +oQg==
X-Gm-Message-State: AC+VfDz3mOtpqWs/JjrkHEbtujBohag11fgJy2228hm9zT+t5xT3EL5N
        Ma9ig/ea1FwEQtHO5Fxv4P4PDO7+Vgqm3/WFWB6J/q5GIQQp2Y3c7vo9vplQSblyPpom+bK+2We
        MLzkuIA1MtxbYR4ydwaKb9yk=
X-Received: by 2002:a17:907:9450:b0:96f:e7cf:5015 with SMTP id dl16-20020a170907945000b0096fe7cf5015mr2859465ejc.17.1685456275654;
        Tue, 30 May 2023 07:17:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kZSGKE5y6FJxLn7YNKBkaZtS4twB3o8TyHV574nI4cJZRpgbuGXIwoyfBXQzSj0clfQjWdw==
X-Received: by 2002:a17:907:9450:b0:96f:e7cf:5015 with SMTP id dl16-20020a170907945000b0096fe7cf5015mr2859438ejc.17.1685456275388;
        Tue, 30 May 2023 07:17:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id uz16-20020a170907119000b00965a56f82absm7447437ejb.212.2023.05.30.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:17:54 -0700 (PDT)
Message-ID: <dc21c20b-987b-57d4-0155-06cb1e663468@redhat.com>
Date:   Tue, 30 May 2023 16:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
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
 <20230529103741.11904-7-hdegoede@redhat.com>
 <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com>
 <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
 <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
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

On 5/30/23 13:28, Andy Shevchenko wrote:
> On Tue, May 30, 2023 at 1:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/29/23 22:31, Andy Shevchenko wrote:
>>> On Mon, May 29, 2023 at 1:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>> +       switch (which) {
>>>> +       case V4L2_SUBDEV_FORMAT_TRY:
>>>> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
>>>> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
>>>> +               return &sensor->mode.crop;
>>>> +       }
>>>> +
>>>> +       return NULL;
>>>
>>> I would move this to default: case.
>>
>> That may cause the reader of the code to think that there are other cases,
>> which there are not. All possible values of enum v4l2_subdev_format_whence
>> are already handled, otherwise the compiler would also complain.
> 
> Why do we care about that?
> What is the common practice in the v4l2 subsystem?
>> The "return NULL" is there to shut up other compiler warnings.
> 
> Can you elaborate (I mean if the default will be present)?

As a human when I'm reading code if there is a default:
present in a switch-case then I expect that to be something which
may actually happen (which is not the case here).

This is important here because if the default can happen then
the function can return NULL and then callers need to check for
NULL (which they currently do not do).

Looking at other v4l2 drivers I think it would be best to
rewrite the function as:

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


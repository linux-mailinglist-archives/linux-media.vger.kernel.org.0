Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C314584DD0
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 11:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbiG2JHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 05:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbiG2JHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 05:07:00 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D849684EF5;
        Fri, 29 Jul 2022 02:06:57 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k8so3051134wrd.5;
        Fri, 29 Jul 2022 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=Xuz7b31SZ6YAYumJHBVurHpw2rO7+Ja8ryp7tp5VZOk=;
        b=lZP98vktrRv81gPPiiUXrQADzP6Mv/O9M9hy591hYZZB1qAsEvIwzd0DCm1SJxdnH0
         zQtatHUP1QNgLMYa+Q1LLy0Y7Iud6BuDiET5qbzKEuI4tTo4UR/PaHJkrkyRsjNWoiw9
         n17NEOpQruPlM9h6I3djY/31KmUQQgGycAcTX8jjI1mwCa5WurXrwIBhQ25bMxprZl6d
         +DgPrcsqFyKNrlwWtzoLiYOUTRi8ktRdkXKmhdgANOGCbDx53qfm8CH9276kcc/przRy
         WmW3c+/871xf2VXXB4NlprC9zMNsBYo4KwE84E2X3KO/du83SsIXcX3DAiQ+sdc2slvD
         X2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=Xuz7b31SZ6YAYumJHBVurHpw2rO7+Ja8ryp7tp5VZOk=;
        b=q/PY6uOgWCtLJ5rF/3Hm8eBPrH76Zy92F8xArGZmbPTmkuX534f8jMj7Afg0S31ivI
         tKq2JX08a6oN/smQb8f519b0rND6F31Kkx/Nlog92FV+fUF0Z55BNDkHwUtPbGjqDWuQ
         Jn90csjTXTTefATvo7TXjKCllEGGAiozLluwMzYDUxHDCImpoe348gFOH34Dc3uEeGJk
         iFIVs1rkMm3xKsVTEJWqTdIzdoorpuVkj1Tc9LUH8qXtJn/sOmKHRWVJ85g54a3YPpw0
         sbbY2ySHr23iPOAgUvZ8os51zWZbjoRjaGYi0aYn0POS6E01P/IUYPmuUQHWYMcCCn+o
         JmzA==
X-Gm-Message-State: ACgBeo2YgMz9R6HmfP1c2g4WLd3x6A+k5fcfVkG/CH/Ivsk7WG8EM2vc
        /eEaPwecCiYPRgBgzvPLLtA=
X-Google-Smtp-Source: AA6agR44DjBZWJyjyaXogrlqG2/oyAQ95weNGFS2YkkqRteBULPfHkamSDbm9eqLBahUPT61SgGD8A==
X-Received: by 2002:adf:d1e2:0:b0:21d:c7ae:3b1a with SMTP id g2-20020adfd1e2000000b0021dc7ae3b1amr1725590wrd.700.1659085616268;
        Fri, 29 Jul 2022 02:06:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id q2-20020a5d6582000000b0021e52020198sm3049879wru.61.2022.07.29.02.06.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jul 2022 02:06:55 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
From:   Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <YuOdWyF2yJVhh415@gofer.mess.org>
Date:   Fri, 29 Jul 2022 13:06:51 +0400
Cc:     Zhang Ning <zhangn1985@qq.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D258CD0B-4490-4182-85A5-BE8D213EB70F@gmail.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
 <YuOdWyF2yJVhh415@gofer.mess.org>
To:     Sean Young <sean@mess.org>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On 29 Jul 2022, at 12:42 pm, Sean Young <sean@mess.org> wrote:
>=20
> On Thu, Jul 28, 2022 at 07:48:57AM +0800, Zhang Ning wrote:
>> Christian Hewitt told me to split to 2 patches, 1st for manufactor, =
2nd
>> for device, how to handle your Acked-by?
>>=20
>> btw, he also said I'm wrong in handle Sean's Signed-of-by, still =
don't
>> know how to do in next version. Should I just not send this patch?
>=20
> Christian can you explain *on list* what is wrong with handling my
> Signed-off-by? As far as I can see Ning has done the right thing.

Sorry, this is my ignorance. I=E2=80=99ve only seen maintainers provide =
Acked-By
or Reviewed-By tags in response to my own past submissions. I=E2=80=99ve =
not had
Signed-Off-By responses on-list before. I=E2=80=99ve only seen =
maintainer SOB
being applied to patches as they are merged into the maintainers tree
and queued for sending upstream. Today is a learning day :)

> Please keep the conversation on list so we're all in the loop.

The board still has some hardware items to figure out and the next date
Amlogic patches will be picked for 5.21 is ~2.5 months away, so there
is no rush and I=E2=80=99ve encouraged Zhang to keep working via the =
Armbian
forum thread that he started [0]. I=E2=80=99m no expert (as you can see =
^) but
I=E2=80=99m trying to coach and explain/spot the common etiquette and =
process
nits (which I=E2=80=99ve made myself in the past) before he sends the =
next rev.
of patches for review.

Christian

[0] =
https://forum.armbian.com/topic/22301-help-to-review-porting-mainline-u-bo=
ot-and-linux-to-tmall-magicbox-m16s-amlogic-s912-h-tv-box/=

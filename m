Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC9658363E
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 03:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbiG1BVe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 21:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiG1BVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 21:21:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5F81C90D;
        Wed, 27 Jul 2022 18:21:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so1793970wme.0;
        Wed, 27 Jul 2022 18:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Cxp1c3BTumIa+oetWVz5ChWxRwi9acisZtSdnbq5CfQ=;
        b=QUw3kZLyF/ngAUJTs99Vp8oy0IIEqSrS3bqix/vKauqObNVg78C+ZWrGHYoh6L7fAo
         Q6okHBlBgE7OMmMqIEGKu4bnBqV2Mtv+QfPYVVpc3NB7mp6oBrbcpVXvWpXtkX3lcUaN
         EJB/W+x/DmANqx+SFw1zjGlnkanDnGkTFzxCz+nZP7l0lEzB5V+cqAXvDvvdtY33FykO
         HXdvPAFjRlRQQHDIC2ANyH7yH4VDsmngwRYsmgd/Y8hzXBoraAogg8mBq9BSvGrqgnbZ
         NGfSZ5nux/u+09qjOjwS2aTbEH9vF7qd5shyq6x0HJZfWvn3YQX8JEsbeRYP6QI77kua
         bB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Cxp1c3BTumIa+oetWVz5ChWxRwi9acisZtSdnbq5CfQ=;
        b=MDCZjgcdAou/ye0ffLeTt2K6+rnpVfAOKKDRcZA3XB/2XY4hTL+w0Kppe6QfPZlRt/
         UkDypXMTIRpvHhbeRazs2dCHvnMDXdl6kjCGwFV87MNVHBvsiZOgYJQRyhW79v160xVK
         ImCRytMSYtgX6Myp1LFwO4vcmqh/dHWXXikOZVkhoXXe+/VfrLpRZJgQCUde2KSoaUJc
         OEs0noBDg9u/eTypebAsS4Hit20fiuvXyl3LavRh90dcpkmHb1a5iUXOAJIzsTT0egFp
         INpxgg7GaGMd6NuUQzQxLVA8oOA6MiO5QB8Eo5T86Y1BNXXc+d+czukrYyIzedcOeDhO
         AVSA==
X-Gm-Message-State: AJIora89/3ZPS2cI+6aQAMCWRNHqtXTmcm1US7buRTJhX2lJ5vjvDS/N
        /ac7TvA3pQPj0b0U6qVvc9E=
X-Google-Smtp-Source: AGRyM1v27SyKb+DQwAMOBq0K68BhSI7SXTjacmDoMDEvKcUHoAPSOXXqUJJbHAw3eZVTDDULo7jhVA==
X-Received: by 2002:a05:600c:19c9:b0:3a3:469f:c1e7 with SMTP id u9-20020a05600c19c900b003a3469fc1e7mr4626173wmq.141.1658971290276;
        Wed, 27 Jul 2022 18:21:30 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d548a000000b0021e6c52c921sm15966887wrv.54.2022.07.27.18.21.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jul 2022 18:21:29 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
From:   Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
Date:   Thu, 28 Jul 2022 05:21:25 +0400
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        sean@mess.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8CBF7318-B6E4-46D9-AFF2-8839459D4C54@gmail.com>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
To:     Zhang Ning <zhangn1985@qq.com>
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


> On 28 Jul 2022, at 3:48 am, Zhang Ning <zhangn1985@qq.com> wrote:
>=20
> On Wed, Jul 27, 2022 at 05:27:25PM +0200, Krzysztof Kozlowski wrote:
>> On 26/07/2022 16:36, Zhang Ning wrote:
>>> Add manufactor bindings for Tmall
>>> Add the board bindings for Magicbox M16S Tv Box
>>>=20
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>=20
>> Please send patches with correct subject PATCH.
> I got confused, and don't know how to update..
>=20
> ad152daedc5c dt-bindings: arm: amlogic: add MagicBox M16S bindings
> 3f7dbd336f36 dt-bindings: arm: amlogic: add Vero 4K+ bindings
> 2ca889b12016 dt-bindings: arm: amlogic: add H96-Max bindings
>=20
>>=20
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Christian Hewitt told me to split to 2 patches, 1st for manufactor, =
2nd
> for device, how to handle your Acked-by?

Hello Zhang. Let=E2=80=99s work off-list to get things corrected before =
you send
another (hopefully final) version. I=E2=80=99m happy to explain and =
coach you on
the process.

Christian=

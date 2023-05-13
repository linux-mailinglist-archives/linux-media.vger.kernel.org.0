Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11212701804
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 17:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbjEMPTg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 11:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjEMPTe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 11:19:34 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E0892707
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 08:19:33 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-61b5a653df7so97221556d6.0
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683991172; x=1686583172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwWJrWJlFP2v/ffYdhBRjWOf/KnP9/7E2ysk8Wnfe30=;
        b=S56KS0S4ygmQQKL0PKJVTT8FMkWbI/TzCM50gpRVcMByP1x8UBqcrbO8qK9FcC3Pd2
         ve7+PTpDsRJMyw53NUP+ZFsj/zqHuiPYF/ooqdJYcjzHVg0UfN1ARO1IjXCME8frEnbj
         dVn6NP/jmSomzMTRxYrv6yvM0HOZKcTQkwNt36tm67PImvxfO1RYwSD38Z3NbCBCVhK6
         2k6LT8+DGNeCbyBEVRzND8mrrR7xQm8AZH7tewE3D3xoBt9sbI0ewwSv6oL11OpQgCI7
         wNBPmSQUNuv7EFcWiRLd4GhE9m6FBcHTr9nioYsqVs9MdP9+C1fXH9UZ20uL17Fyh5M6
         T6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683991172; x=1686583172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwWJrWJlFP2v/ffYdhBRjWOf/KnP9/7E2ysk8Wnfe30=;
        b=lZ2NM/bWJxAM42b1rhW51IroQtxpz+NrjtK9WMjywx6vZ/Bn6ZryAR6lnYsKMpwJT2
         wgktAXKjWYmZXs75oYhn3OMjokEgQoJGN9Da4lG8XqonQpDN84BZHpNvtm4KZDBfG0GW
         ZeAYbbe4pvVqmwzXLB0M/XRH6nmx/2MT8GBgG/EYpsZUj615ntz/hLRUjz4AwqMRLHYZ
         VzpqmkpvwasW5EAlxewm32nsv8edKChFjM9pe1gkczJ8IMIVbUSffOkyMFC/MfdBFYBW
         canGT1SiqDQSPPSKQQzcXte3pNnXxr76lMY382ZJv1X1OgGJs7ssTwMUorZApWGWP2hq
         VlQg==
X-Gm-Message-State: AC+VfDzadbs3DZaUo7M9resgxmu5/jboDYK/t78EM4ZRO4A2ZKHSgWEB
        tY/rK0w7c/I3qFJNdT3HFkdJzryjK4+Q6umIVGg=
X-Google-Smtp-Source: ACHHUZ4b3u/IGeYpu+rqevhthPqD5sSNvaipJgWY9FOYEemwkEApW00aih4uL5xpuYl0lJ08xe6iHe9CuE/pwy/akbI=
X-Received: by 2002:a05:6214:404:b0:5ef:46a9:15d2 with SMTP id
 z4-20020a056214040400b005ef46a915d2mr51435511qvx.7.1683991172617; Sat, 13 May
 2023 08:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-12-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-12-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 18:18:56 +0300
Message-ID: <CAHp75Vdap=KkfTjW_CPAB4W8W-kS8cKMk7Q9jFfY7vMPi8n0JA@mail.gmail.com>
Subject: Re: [PATCH 11/30] media: atomisp: Remove atomisp_subdev_register_video_nodes()
 helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Now that there is only 1 /dev/video# node left there is no need to
> do this in a helper. Just make atomisp_register_device_nodes()
> call ideo_register_device() directly.

video_register_device()

--=20
With Best Regards,
Andy Shevchenko

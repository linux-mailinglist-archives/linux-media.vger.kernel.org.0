Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9877094AD
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbjESKW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjESKW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:22:28 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE5B10C3
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:22:24 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-623836551f5so14014366d6.1
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491743; x=1687083743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtpbF2tXZUjlQDCpCAkUtufwtzGeJXDTY4JTRH+Iw2M=;
        b=E/YwHjpl1qYGPpGxLSzw0wb2VqIy7VIX+wKx+ahQgZ8egNd3byKgpaulAKmKe2pcas
         +AhHbtPRpOAigd+9SrK48SeNLfYhX9LdHI8p/gF8FHM8Gr00I+XceSmIpN1z4UuyjCdF
         H/3Ly/GIeSj50sGVLp8S+asXWsUx4j7pvPNRwJlJVznL8E05801sQjH8BT9FF624xnc9
         rAbrsrQrA5Ovs5Prj9xbnQbQnm9uKvlwh53q+0v9oHD/BX6RlNQnzYdqSIKKbCHBfinU
         UimCASxpDRGEBpLog6NQ2wilRIrqu0D07JYEKzk+4tcLylSZ+MxGL06L/jZH1Pbaiomr
         mbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491743; x=1687083743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtpbF2tXZUjlQDCpCAkUtufwtzGeJXDTY4JTRH+Iw2M=;
        b=D/0z1Ma6sNvCMjhj85KsNoSETYR/4cLC/xLDuHIvDAjcyIMP5PPfsIFxPSg3gNYg2L
         7pSkw76IDVvXwG7Ut5h36oyOYlvrCtOLUbcXPfKiQEcNnMQwiQDm1JgRq4K8Bs+iEbFV
         QPvnmwoiTIWIUwtO/T/vZJjhMsagDwse+oaJWwg/XFRS04e1PJ3yNffbNmhiOGGvIfOI
         WSOJbyF/IQDs+UX/a2p4Q0R0RgozTCTXh7G2QuTWxH87nBSZAb70YK5F/lfO9HU4Jfu7
         xrAjYXdEA2cEJXV8/nzG40XtBZeCDlsgCcQQ226RfrG5KHsCxCfyRv+/OaeHvBC+7JXk
         8CbQ==
X-Gm-Message-State: AC+VfDweDyVm8mwkmgZ4qcJ6rpj5ypX9y6C1gzIpl7QuAFHrGfTEg7Gf
        oA9zdhNAm3GqrXDMIdZwz3mraGySWJZoRf2RmAg=
X-Google-Smtp-Source: ACHHUZ4t6E8dc6ID1cRXLGrV7UctxFtyj7367GxYtrr6TL81HddZiVacCWbw+MgjcB7tTQ5Of6u8+tpkOcxOwWMKN+M=
X-Received: by 2002:ad4:5ced:0:b0:5c8:403a:22f8 with SMTP id
 iv13-20020ad45ced000000b005c8403a22f8mr3500950qvb.5.1684491743577; Fri, 19
 May 2023 03:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain> <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
In-Reply-To: <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 May 2023 13:21:47 +0300
Message-ID: <CAHp75VddE8Z4KxuOVT2_YbNrzCz5_oVmVs6RaqjffJtaT6xabA@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Fri, May 19, 2023 at 11:55=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 5/19/23 09:31, Sakari Ailus wrote:

...

> And if we need some changes anyways just adding the single line call
> to the new helper seems both the least invasive and the easiest.

I'm on Hans' side here. And yes, many drivers (mostly in the ASoC
area, i.e. audio codecs) nowadays have GPIO ACPI mapping tables due to
lack of _DSD in ACPI. It's a problem of firmware which we can't avoid
if we really want to support this hardware in Linux.

--=20
With Best Regards,
Andy Shevchenko

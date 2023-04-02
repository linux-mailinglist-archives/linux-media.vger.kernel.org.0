Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE9A6D35F7
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 09:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjDBHpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 03:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBHpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 03:45:54 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D15AD1E
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 00:45:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id bm1so8082500qkb.13
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680421553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vH3FQmCip7UxEf9YwzeV9cRGtTOWxZu3UxGvMP0x5s=;
        b=GKH3zR3EOxaPFkrRtMPg4Y2LrLJ7r5/S1c31htLXbt82MOSaqQLZNqMC5F2IJxNee4
         DKbIAAt3F+Dv5aLrf9l/tFd5QTn6SkVY8G4RleCbKCQtkF6P59hRjB8tqlVQDoLfKqSe
         SL+tcpEtpVHlF+WahlGlL8fUENKqeuFeV4Lt8mNcYFi+VO70wEx0GL+dcn6rUFIDdisw
         /OfYcRtrs7HvX/F63W/jJO5ScpWISoD3ucN1n/RhldKc89gF6JKbDDcDbdMq1wpJXZKL
         DXxDZQjVFZm6rtSDu6AAxBtUo9wtMzMh9fqcNeTfi7l6OzZofbzCZhe7fuMhGJJHrYTa
         /leQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680421553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vH3FQmCip7UxEf9YwzeV9cRGtTOWxZu3UxGvMP0x5s=;
        b=ORshh5jmIsIYrz4vE+qLx6MEIXEjqqf6MmfP5GAlgyyemSRaRfJ/ooV1+04ECBk0kJ
         DGm6yk0y2GFD2p2wcX1TgA0WHRGWcpTLpSL78dDevmLspYrkj06oeJ5E5QuBa9xl7Z45
         xkGnv1Pte/z0ucw+ukEZZ/WhSu9+yTH6wZqI7rEXneUTXi0Fv4nfxAPfZWnxkUuZye4M
         oJkjxDWATAC6RorkVxzaJlN1qQQWXyuZSc/otGc9erdpXGKkYFl/fdjFxvzd+/fOYI1i
         Hjvm8JIEQkAudYoP2gc1ldNuJWKcQt0QOfjscrns2VeFJH60+osiV3YRT+cmnRpW8eqE
         ZTzw==
X-Gm-Message-State: AO0yUKVv1rppPAmVsfclVssIPGJKJ6W9RHLpAql/fYO54JYKL3F/WXUw
        OMidmYlS/hM4dPDGlTezOxinzIBoCPOchf9sEpE=
X-Google-Smtp-Source: AK7set8yuBGHmQt7MyBki8CgANN3aXHOKVBA3e8707BaQLWRKgGIj61DuqG3hLMw86z/wzHSPhkh2oKaBERPN3phh+8=
X-Received: by 2002:a05:620a:2f6:b0:743:9b78:d97e with SMTP id
 a22-20020a05620a02f600b007439b78d97emr8576967qko.14.1680421552972; Sun, 02
 Apr 2023 00:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-9-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-9-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 09:45:17 +0200
Message-ID: <CAHp75VeorjdJ5mHOfOtdqVeMMeDJiH7w=f+7ci_071HD2TN9qA@mail.gmail.com>
Subject: Re: [PATCH 08/28] media: atomisp: gc0310: Replace custom reg access
 functions with smbus helpers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> The gc0310 uses 8 bit register addresses which makes it compatible
> with the standard smbus access functions.
>
> Drop the custom reg access helpers, replacing them with the smbus
> access functions.

Ah, cool! That's what I mentioned in the previous email.

--=20
With Best Regards,
Andy Shevchenko

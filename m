Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE5D7341B7
	for <lists+linux-media@lfdr.de>; Sat, 17 Jun 2023 16:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235937AbjFQOop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jun 2023 10:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236051AbjFQOon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jun 2023 10:44:43 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67281BF3;
        Sat, 17 Jun 2023 07:44:42 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-630074df712so7011796d6.1;
        Sat, 17 Jun 2023 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687013081; x=1689605081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLolGhYclmQaW5o7zV+d/VOXcPSOBFE0oX7ksBODT6U=;
        b=oDRxMSjUN186InS30QTEzlvpBOEvG5QFhozhA2mLKPQqsnnVT6Kf55AZH+Ltz3TfR8
         z/WUpBGyoDEDyjwBBuxEsCzVsh4I63/S+bi1Rnsdfi9GCRMj7GCsq5P+XZIsB+3Xir35
         jU9z+W+SaRTtToMioy0h1hXKCzoxf8Nczjl1NnJTcxXugDmBz8+9lPSM/ZSpNIr5YNEK
         rSVj5PlKLyz+oeMJSuXeTj9G/Q843TtuNGMXdimlQPdBOZfUKJy1mTR0EGjkh4aEiZql
         79I72xJULuWn9UtlmLlxNcvpVd3M3jEeIGlmxqWJH2hCIj1LOF2m1i76KZQEtheeZFqZ
         O7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687013081; x=1689605081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLolGhYclmQaW5o7zV+d/VOXcPSOBFE0oX7ksBODT6U=;
        b=AHFa/0Au4LFEz9JKFIJkVc38HUZrUKj6Pj1wev47fZLvtqlnvP94cYW+bKlYTH4Vvs
         CC9Cu+4N68tHv63KuJFL9dvotKfFXIbmaHM4vRxB7joh4M+9FQemr1EUTXIcN4Ie79/r
         KoF74d5778nd6VtJzToxOyjHAHa9+nl6fUh7hYZsoxthdwgp5lD0thcdUaB1p5d9np9d
         uZ6gUYDXqq3CnN/AL5m7AKsaWkFE0SGEDGcyKYVHtR7emyPPBsxE4Gm0CVOzsUwLrqZv
         4aby0X0Z25vp3/z8W7uv1vZViK42OFDvQ+DVWRJTOeS7AuJJXlnNw5X2jIEZ+vDfIk2A
         iK+Q==
X-Gm-Message-State: AC+VfDyMi3XXhvp3xi72Vppha81kaC7B4zwJmWv+alX2HPhmkTEGT/mF
        pXLTs1N5SWZO7tawKRvoALgt+v2AuP6IoeTMXvex2pv1+h0=
X-Google-Smtp-Source: ACHHUZ4p9RNOf744Cx4yu79ntGpssxEc5tCzmUVkD/J/iAhgxdCiBH0PJYimoJSo4cbKLmga6+xQ7QS5GXtZo5HDmQo=
X-Received: by 2002:a05:6214:124b:b0:625:7c0b:4640 with SMTP id
 r11-20020a056214124b00b006257c0b4640mr6481569qvv.22.1687013081669; Sat, 17
 Jun 2023 07:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230616172132.37859-1-hdegoede@redhat.com> <20230616172132.37859-7-hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-7-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 17 Jun 2023 17:44:04 +0300
Message-ID: <CAHp75VfUN3ckdqcj=W8y_Mh8-wt3KHyFsc2grC92r9x42uM9mQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] platform/x86: int3472: discrete: Log a warning if
 the pin-numbers don't match
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
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

On Fri, Jun 16, 2023 at 8:21=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The INT3472 discrete code assumes that the ACPI GPIO resources are
> in the same order as the pin-info _DSM entries.
>
> The returned pin-info includes the pin-number in bits 15-8. Add a check
> that this matches with the ACPI GPIO resource pin-number in case
> the assumption is not true with some ACPI tables.

...

> +       pin =3D FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);

I believe the definition should be in this patch which sounds to me
more logical.




--
With Best Regards,
Andy Shevchenko

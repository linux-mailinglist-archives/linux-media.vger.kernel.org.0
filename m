Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEF4701777
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 15:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbjEMNmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 09:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbjEMNmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 09:42:43 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1E319B0
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:42:41 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-61b2f654b54so53476946d6.3
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683985361; x=1686577361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9n9OPZK/Iq5/AvEHwDdmPCSm1nxzOD7m50GKmpv90c=;
        b=RdExWfRSmwpY4uvQ0SpfaUKirnNAqdkW90kv/UMv754CQLbR4wVZHYDkcIQeAjJJOd
         oHu6r0ww0sa6Jh0KObFSmPelS+XDtkGl2Zc12LKtlEjMW/ON5AbGuEafSahPJryggHNm
         pSETN+EYkOjyHR0337iVphu/6N6lrF5FfIOpoVYETe/A1HhsckqdpPuHjBG6w1+2nVE+
         vjZrGc5d+Wr6OJ27MOrMpbZZXPPSTiGVAtJ9hlGcKGSY13uDqQ96HfCR40VujNHlw54n
         A8eVyYTej2WMfdTi29WG+GJfKgkr7WFwkJoyYyJ+ZLBd3gXQkM+T6BXSvQgMqba94xwG
         DTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683985361; x=1686577361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9n9OPZK/Iq5/AvEHwDdmPCSm1nxzOD7m50GKmpv90c=;
        b=dRtZlJElYpUMcDvf0KViAcJqyLXPB1BpRNEC/oN++eQPtMW41xUVICMqfbDsKNoijx
         MRHL79aUDhVYVOxJH0tvG7Q+hUvTHBvZdm3Ltm/ZoHNosZbY2Mfhdi5PoDuugOZa9V97
         GpBx0FhNcIcyYMqouR4rCueztyHfFJxkQUP3bJI5TygkJ4pdk4ZVrzixpbvpCcRlBHP1
         8njMb3FQPEE4n9/Vyx/P2MI4YgaQv4ARtv0iCsyDLyVev0/0eHd1A8O7jX+5HKCBpCEd
         cX5ofmJyiFlu8mvckdTrrZWUAlXDQ8rPlBxmcxpkgEt/XfiXHwRGQg+uGVncWpibEsaK
         lILQ==
X-Gm-Message-State: AC+VfDyquzeStrbsXvdcvO/O9UEoWlvvmZWdFWxYCHyG3lbxbnuouDrE
        UZSTgWXQqwo0SnA0wd1KV4zABjNYjc2S0zym5fo=
X-Google-Smtp-Source: ACHHUZ607kcymJixsQMDAPOP3jvl4vp9y9glbZG2CpGrMTkvmfvfAGfmAJVfpBWzXijAeWwxXAzlPJDtP0UK8fBEjRk=
X-Received: by 2002:a05:6214:4104:b0:5a3:cbc6:8145 with SMTP id
 kc4-20020a056214410400b005a3cbc68145mr38088865qvb.19.1683985360821; Sat, 13
 May 2023 06:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-8-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-8-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 13 May 2023 16:42:04 +0300
Message-ID: <CAHp75Vf5kMrYarWCKr3SJ+5fFVtqVAnf7kQ0dGOnLB-_C7=5jQ@mail.gmail.com>
Subject: Re: [PATCH 07/30] media: atomisp: Drop atomisp_is_vf_pipe()
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
> Since there only is one /dev/video# node now (no more continuous mode),
> there are now no longer separate main capture + view-finder pipes.
>
> We are now always on the main pipe, so atomisp_is_vf_pipe() should
> always return false now. Drop any checks using it, replacing them
> with the code-path for a false return.

...

> +       if (arg->per_frame_setting) {
>                 /*
>                  * Per-frame setting enabled, we allocate a new parameter
>                  * buffer to cache the parameters and only when frame buf=
fers

...

> -       if (!(arg->per_frame_setting && !atomisp_is_vf_pipe(pipe))) {
> +       if (!arg->per_frame_setting) {

I'm wondering if we can make the conditional positive as in the above
chunk, so the below will go to the else branch. It might be that both
of them can be united (haven't checked the full context though).

>                 /* indicate to CSS that we have parameters to be updated =
*/
>                 asd->params.css_update_params_needed =3D true;
>         } else {

--=20
With Best Regards,
Andy Shevchenko

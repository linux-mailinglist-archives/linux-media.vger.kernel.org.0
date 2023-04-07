Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2726DB2C2
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 20:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjDGS2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 14:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjDGS2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 14:28:05 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD82A24F
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 11:28:04 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id iw3so40623714plb.6
        for <linux-media@vger.kernel.org>; Fri, 07 Apr 2023 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680892083; x=1683484083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=racKSQFJw6htxGvl8wL9wTMwQ/BfxK72fBbPH3jrfzo=;
        b=q7Wm05yAXnSdYgLlHZrk+vSMJLG7IwbD5WNTN2nFku16vITT4ZPAtf5KS9mPxIa99m
         KDfOJdihPQ1164fFyY3YqTPPOWuusIcdkUrKaRuyIq7PR0uMFQBh3Y0e82P0CbvR0cNa
         KsKhHw81I8FMbcib5C6wFXXhdaqoihXftB7DHPg/TV3vKbqI5kNriwt7bhPm2Sj6sIOO
         j5tKKaoWBl0+mLS5lpixAw92WKEsDItL7rhFvwYIbeFIrG9/qNe2cwuoFq9RyOZJX+MU
         0N2hu+SHtyJBxahfkPydyCZ1eGhSoRYIct9meRQa2GdsQZ1nwN9pPjlJ+LuXihUPB/Hv
         aVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680892083; x=1683484083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=racKSQFJw6htxGvl8wL9wTMwQ/BfxK72fBbPH3jrfzo=;
        b=Hi/J4j52lbZtxCtA9Vnonja2TZK0/g7RSDoN4fnoYS0CZCdwHlT8bSZHQXhth3t1dN
         eqLIL/S+dRthhfp6tRzZJ/yGG0kxkPjdTMZhRDfyzWzjSc6tLEKDCOUy/4xHvH74wX8o
         71rCV5dPAd9yyVPToUWjakarovF9dagK3R5GHF004ttS9yCSFOyf9viObTgjOh4TIoK0
         9vSFUR1GMqtUfXmUwzBbkuhimPQWkz8gTHlgY93uJbYDzNPXO926fhGfcV2K48M2Zu3b
         SUZ24gFgLC0+s3FdLMRJsWVMP/9oKh593609R0rt4hI6tWi48KBwSozjYo74nBLGlHJ3
         HkMA==
X-Gm-Message-State: AAQBX9fHsDdRy3lgqos6pfsLyejFqNJFFyG5J0lD9TlJDH3ti/yPKkpm
        8l2qcJIEehWKVhzNe3dOYNECYKhD3u7DiG1WGqoL40mZl+t3IV1q73W+6w==
X-Google-Smtp-Source: AKy350aRREn50bpQ7xCS9LErMRNVeVNQfFgxRLmHVwVs/Hhc6bXBF8o0SRAxqojHcFOrhX1MsA8ejh9JM3OYefgOccs=
X-Received: by 2002:a17:902:da85:b0:19f:2aa4:b1e5 with SMTP id
 j5-20020a170902da8500b0019f2aa4b1e5mr1216879plx.2.1680892083395; Fri, 07 Apr
 2023 11:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230401010456.1866555-1-trix@redhat.com>
In-Reply-To: <20230401010456.1866555-1-trix@redhat.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 11:27:52 -0700
Message-ID: <CAKwvOdkzW41CXskgY8h6V321kQyDv8DjvYC02YdK71QKEB2g=Q@mail.gmail.com>
Subject: Re: [PATCH] [media] mb86a20s: remove unused active_layers variable
To:     Tom Rix <trix@redhat.com>
Cc:     mchehab@kernel.org, nathan@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 31, 2023 at 6:05=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/media/dvb-frontends/mb86a20s.c:1572:6: error: variable
>   'active_layers' set but not used [-Werror,-Wunused-but-set-variable]
>         int active_layers =3D 0, pre_ber_layers =3D 0, post_ber_layers =
=3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Fixes: 149d518ad0fd ("[media] mb86a20s: add BER measurement")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/media/dvb-frontends/mb86a20s.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-f=
rontends/mb86a20s.c
> index b74b9afed9a2..125fed4891ba 100644
> --- a/drivers/media/dvb-frontends/mb86a20s.c
> +++ b/drivers/media/dvb-frontends/mb86a20s.c
> @@ -1569,7 +1569,7 @@ static int mb86a20s_get_stats(struct dvb_frontend *=
fe, int status_nr)
>         u32 t_post_bit_error =3D 0, t_post_bit_count =3D 0;
>         u32 block_error =3D 0, block_count =3D 0;
>         u32 t_block_error =3D 0, t_block_count =3D 0;
> -       int active_layers =3D 0, pre_ber_layers =3D 0, post_ber_layers =
=3D 0;
> +       int pre_ber_layers =3D 0, post_ber_layers =3D 0;
>         int per_layers =3D 0;
>
>         dev_dbg(&state->i2c->dev, "%s called.\n", __func__);
> @@ -1589,9 +1589,6 @@ static int mb86a20s_get_stats(struct dvb_frontend *=
fe, int status_nr)
>
>         for (layer =3D 0; layer < NUM_LAYERS; layer++) {
>                 if (c->isdbt_layer_enabled & (1 << layer)) {
> -                       /* Layer is active and has rc segments */
> -                       active_layers++;
> -
>                         /* Handle BER before vterbi */
>                         rc =3D mb86a20s_get_pre_ber(fe, layer,
>                                                   &bit_error, &bit_count)=
;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

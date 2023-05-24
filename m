Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24F570F461
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 12:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjEXKkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 06:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEXKkC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 06:40:02 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAAF130
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 03:40:01 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-510d1972d5aso1569697a12.0
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684924800; x=1687516800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38iJHpKlIiWZbh1WDjxxGN+0tLET1s1ACGv1lr82oHc=;
        b=Rz6wHr67S1cULfAOj1lT79Lh3G+fcFkDyCZnpmiyp0QRutIFDCh87U8llVuL6KrsIP
         5+FrH0DrH8tWcSoiJ01musD/yKnK5UpEbk8NIm3A+pa75pB8XItq+/TpZaZwAj/CL0LR
         vi2PJd5KJimgYUEpDO68Z+07waFH4+YjdadJBhE8JoxBEFhoVSLVK12/wIF0UIGmoKcy
         afrnF7oI3RjLtZcmAsom2yxImNuJT4vQBz4i2wl8gJnMIThZO2bEXxMSIN424Irr/ucg
         5uFIix90Da3cwxizk+RCqUMtlzAlSgEvdm+CGWI5XB4Cp3bnBBg1Nr7xrw1Mk71/TD9J
         eaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684924800; x=1687516800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38iJHpKlIiWZbh1WDjxxGN+0tLET1s1ACGv1lr82oHc=;
        b=VY+U/k7DzEI5Kw/mJwP7K1RjJ3X+tbXPEWm1Ued1Ix0/wYB/udSDCOW0qwzfWPz0Gk
         IhHPkMxptdk9snh6Jr7rhFB1pwzA+N6Fyfs+TlVVNtrrIi4jdsiwSZ3tcgh0bBDRsYrc
         u+He3JUSC9BwR4wnDuOJyqSaTMZP4ofsEXJB3H9KTdOqeCfmjfv/1ZQ6Moh/ops+OyPk
         fJTD94syKzpxSTVnUjc6x+ALHCTwClwy2Q2RRhCZbh1Zcmlqp3IVgL2BF8drONvORWTy
         ec3oKXa2m6xLpQ2VoCIh08af8+I95Nqi3KZZ55uTmSbJQ/vDu65KNTt43SyTiegSd1Ce
         3QtA==
X-Gm-Message-State: AC+VfDyfSE6IHukEEP12IfbUwD8ThKRlSV0O73m2okdWoCht1/ae1vTR
        iWS9xYLOCMZH2b+pGcCcKWInK7cch7LD3Hcs2reutQ==
X-Google-Smtp-Source: ACHHUZ5KEgHn+BODCBjPTJdXE32cq+ah2nLHIvhhJs/3W9A/frhnK+0OzySN5R8OvNNpBRTK6iEwFez2N6pDL6jV+Zo=
X-Received: by 2002:aa7:c6c6:0:b0:50b:cd19:7545 with SMTP id
 b6-20020aa7c6c6000000b0050bcd197545mr1445519eds.33.1684924799684; Wed, 24 May
 2023 03:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230523021943.2406847-1-azeemshaikh38@gmail.com> <202305231021.1AF1342BF@keescook>
In-Reply-To: <202305231021.1AF1342BF@keescook>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 24 May 2023 16:09:48 +0530
Message-ID: <CAO_48GHjU9nSugzjRqDJVU3_HNQuGx4qnTFqayXECd=mFVk_Jw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/sw_sync: Replace all non-returning strlcpy with strscpy
To:     Kees Cook <keescook@chromium.org>
Cc:     Azeem Shaikh <azeemshaikh38@gmail.com>,
        linux-hardening@vger.kernel.org,
        Gustavo Padovan <gustavo@padovan.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Azeem,


On Tue, 23 May 2023 at 22:52, Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, May 23, 2023 at 02:19:43AM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strl=
cpy
> > [2] https://github.com/KSPP/linux/issues/89
Thank you for the patch; I'll queue it up.
> >
> > Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook

Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs

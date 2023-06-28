Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDAC741496
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 17:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbjF1PJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 11:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjF1PJR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 11:09:17 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3655110FF
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 08:09:15 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6b7541d885cso2474015a34.3
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687964954; x=1690556954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQFXM7LoMXWobaAJZ3RZKI3cUbo9p+ZmED0c5tG5e8o=;
        b=aFkpfco7/EqtSeH8SvrioWbyX+Ie6tKQ/zdB41Apheqb0+GWe389VsNoqIegt1qEQf
         TQ3oLh241qOkxJ6WUHW7zQkl0qKXdY8CRGa8M9bxehKI2jDjp4eb01wV+tw0DhV1jfWO
         NFlMjr/fqIG7/AmLOuFg65aPOT9UZAw89SasI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964954; x=1690556954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQFXM7LoMXWobaAJZ3RZKI3cUbo9p+ZmED0c5tG5e8o=;
        b=ICjAmbHwfiI+h08belRpSWW0M5HGhWhvhMLO3h8YgNPXHO+cpTYCHtBK1g/szk5vDu
         O7MsA+dMBF5ys3UnqHPzozsgKmSeY5/3EOcuQfTNpp0wPNK8R/luHlR4hx53oGU+oywy
         L6qv46DTwdVDJ6BJYh+OpJY6GlaPHgemEIXL9aE1ZVLYtRV26SXC+6PDri2ec4m/x1zB
         jwFD4ItHVj+1x+g+OGeZUwd02I24sDNygPiOD7MN1QMx0O4+zdoI+QY/VqeLVGaXUoMh
         7MM1wwZivmpIhADsYMGjku+NjvKAEzdgGGYAq0CwEs8/BHO2v/zxCEk8VXwI1E/Yy4Z0
         euMA==
X-Gm-Message-State: AC+VfDxfZ8Zxo7mocVm5UarWPSkTlgGQeIf8bXM2jUCJmsq3/4Dkk3dv
        /XWMLVwk/C7zEIFCj3AtPvqCl4+sLWCfofJnaZSSTg==
X-Google-Smtp-Source: ACHHUZ7mEBIwcDekNUgmogdX1cBOPhK0TtMzNVRdpWwdf24243yY8Fh3zjN7XTDZu/RLnFFOjNTB1StBdw8SgOnw3a8=
X-Received: by 2002:a05:6870:5b18:b0:1b0:b13:c18 with SMTP id
 ds24-20020a0568705b1800b001b00b130c18mr13876523oab.3.1687964954543; Wed, 28
 Jun 2023 08:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230628130339.206261-1-mchehab@kernel.org>
In-Reply-To: <20230628130339.206261-1-mchehab@kernel.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 28 Jun 2023 17:09:01 +0200
Message-ID: <CAGXv+5FT64iMSebcT3b9TP2NhEt5e05bjy5HC4AvzM_+n-og=A@mail.gmail.com>
Subject: Re: [PATCH] media: dvb: mb86a20s: get rid of a clang-15 warning
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 28, 2023 at 3:03=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> When building with clang-15: this warning is produced:
>
>         ../drivers/media/dvb-frontends/mb86a20s.c:1572:6: error: variable=
 'active_layers' set but not used [-Werror,-Wunused-but-set-variable]
>                 int active_layers =3D 0, pre_ber_layers =3D 0, post_ber_l=
ayers =3D 0;
>                     ^
>         1 error generated.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

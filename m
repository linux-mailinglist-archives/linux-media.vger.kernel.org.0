Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FE075B4B0
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 18:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjGTQkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 12:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjGTQkE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 12:40:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4040719B9
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:39:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7551D61B75
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 16:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25FEC433C8
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689871175;
        bh=rG5ulSiTyaUXyVcMrYkmT74/CFai3GH4VSr+VtgCH0k=;
        h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
        b=VFMw5BoSqdj1i+49ZBsBw8anp3fSOai3XoIQ3lDhC4W9td6n1s90wVW7GDY2G0AIQ
         Wptb2evhVVQwf2F8O+V2MS2DWmm0puVsoBMq+Q6fnmKG1DWlX6duGGQiwwWuM/HR0m
         wiT1Ztk0MqbgpT4dsNvoXtlnBjy7cUDin+fwPhUoIdvP2w4t4q5f9FqUYO8Bdy7EZM
         JaBGfi2O4VIBrLPZBAXOxIW7tWMofWdKuxl/RaJbyGK+4BhbJjFbdFolZU4Uo5j0Z0
         WJzExQHBSJSS/DsUrWXcY3HlZpLTB0f2HZbqIn7nGKSvTGl+d3jfgViTyJ7FA3iamu
         i1o5bh5RR9Ehg==
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-56341268f2fso538283a12.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:39:35 -0700 (PDT)
X-Gm-Message-State: ABy/qLawM4rqPdJNaifDDfKdv4ccpMIjEVn6IMUiqglKzciLl2Tm+Nuj
        gZhvTBWhT9IELn/qnYWJHzHV0G8WkW0McDhfyFE=
X-Google-Smtp-Source: APBJJlGbl90r99cHKFzNfpAU+tfUEAAMjEoDkvirIf22gPI5TzgdQzEy3WEZkXmt/FWfQKoMl+FEZxBFaUpb3m+HKOE=
X-Received: by 2002:a17:90a:fe0a:b0:264:91:4acc with SMTP id
 ck10-20020a17090afe0a00b0026400914accmr31041pjb.11.1689871175412; Thu, 20 Jul
 2023 09:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <f0f8e8bd-4f7c-2c80-65e7-b5e04e122f60@xs4all.nl>
In-Reply-To: <f0f8e8bd-4f7c-2c80-65e7-b5e04e122f60@xs4all.nl>
Reply-To: wens@kernel.org
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Fri, 21 Jul 2023 00:39:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v644AxKprGjzFt0A3uprGM-0TwvBEL-pH95TYyfsR63k+A@mail.gmail.com>
Message-ID: <CAGb2v644AxKprGjzFt0A3uprGM-0TwvBEL-pH95TYyfsR63k+A@mail.gmail.com>
Subject: Re: [PATCH] staging: media: sun6i-isp: drop of_match_ptr for ID table
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 20, 2023 at 3:18=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not make any sense.
>
> This also fixes this !CONFIG_OF error:
>
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:529:34: warning: 'sun6i=
_isp_of_match' defined but not used [-Wunused-const-variable=3D]
>   529 | static const struct of_device_id sun6i_isp_of_match[] =3D {
>       |                                  ^~~~~~~~~~~~~~~~~
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

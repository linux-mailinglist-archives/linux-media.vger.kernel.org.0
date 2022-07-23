Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B38BB57F140
	for <lists+linux-media@lfdr.de>; Sat, 23 Jul 2022 22:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236886AbiGWUFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jul 2022 16:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbiGWUFh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jul 2022 16:05:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D76CE31
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 13:05:36 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id l11so13360395ybu.13
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yxNqH7s5Rz3f+v8fqZj0/vCjFEHibCyuheCPD/aW+oc=;
        b=odGY58M7k02VmCGnlbzb6wQjEKIYUFnVmy2rwX+qvUhwTVmwJWICAz24VjhNAtp1cA
         k+KW5HZKFbSMLIlWLUJWqWJoaxtz626DBDiomWuhZ7sKIVYt4EPyfYtHQhmIsr/m2/ci
         oF8OVOuZhXZssrKtgQgpa1LinxENJTd0kA7FJEGzDSk6RnXwmuLnmQdXNwCMgqIFFqPk
         WB1c1tGDCLqRRXtlpq/lsqdXXzzIVwlM5kDlfVZaRROJC1lbq2okiGFlYtAP4nkQJgdF
         AxhrxznwkD3f0q1eHPoVp4YILARvlsW/8vRkZpa/dROu6Ycq6HWutya5L28jV8NIE8qi
         OgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yxNqH7s5Rz3f+v8fqZj0/vCjFEHibCyuheCPD/aW+oc=;
        b=V63mtJwujwyxv24RUZUvNOySH0HV4pT59TflHF8PCQb2SKcVEtqdeRNwJMGQ4m1Ki5
         ZITCywHSRdZOD9batlQPBX4yZMrgWyDsyol7OL8bxvjDyjKtG6GZqxkO12y8SzyRTLsR
         gUps3lRxlsOLENp/uj+3WAX8e99v8A7wgH+SAMOAVkH18XJKvhULr0hDuFB9y7K+PGhP
         8Ikct5sQwccB0MOI7Ql7llvye6Wlt/zsIFfzDVKCEWxlQ0Dn8d7EK/xdWIG0AXltqBcv
         dWm25b1sSQUhcRS+IiW2kZGYzoNFhAMkZEoPkPYyZp63z8kKj56aXQ44XUO6M2h56p2r
         kPaA==
X-Gm-Message-State: AJIora82hxpCzC+74K1AHuzde0WA5c1ZPoKImJynfUKpFzam4NaCfRJQ
        rFXNh0+sZTd0I18sCleYwSy59YcsjZY+FBCnqfBUx/0vR+Q=
X-Google-Smtp-Source: AGRyM1vLCkmGrcMHJaxHg/n2nhWnQXycKco5363dXL+UeKBCQNmA+xRseVB5Ovlzd0ug/SCzIq3qTAJGMLgwA1WNB3Q=
X-Received: by 2002:a25:808c:0:b0:670:7d94:f2a with SMTP id
 n12-20020a25808c000000b006707d940f2amr4663495ybk.452.1658606735407; Sat, 23
 Jul 2022 13:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220723155502.127404-1-zhangn1985@qq.com> <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
In-Reply-To: <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 23 Jul 2022 22:05:24 +0200
Message-ID: <CAFBinCATO6YPrZDpV4fyso0ReESSOGFzw0tk=KRfYZaXJMvDNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, sean@mess.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

first of all: thank you for your patches!

On Sat, Jul 23, 2022 at 5:56 PM Zhang Ning <zhangn1985@qq.com> wrote:
>
I am not sure if the media subsystem requires it but most subsystem
maintainers want a description here.
See for example commit 7bb53f361c59b ("media: rc: add keymap for Tanix
TX5 max remote") which has been accepted previously.

> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
This should be part of the .dts patch (patch #1)

>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
Additionally we need a dt-bindings patch so the new value is
recognized by the .dts validation.
See commit d2fccf94495e57 ("media: dt-bindings: media: add new rc map
name") for an example.
dt-binding patches typically go first in the series.

[...]
> +static struct rc_map_table magicbox[] = {
> +       { 40791, KEY_POWER },
> +       { 40842, KEY_MUTE }, // M
> +
> +       { 40771, KEY_UP },
> +       { 40714, KEY_DOWN },
> +       { 40710, KEY_LEFT },
> +       { 40718, KEY_RIGHT },
> +       { 40706, KEY_OK },
> +
> +       { 40775, KEY_HOME },
> +       { 40783, KEY_BACK },
> +       { 40726, KEY_MENU },
> +
> +       { 40959, KEY_VOLUMEDOWN },
> +       { 40797, KEY_VOLUMEUP },
I checked a few other keymaps and they're using hex values for the key code.
That said, I am not familiar with the keymap code, so let's see what
the media maintainers think.


Best regards,
Martin

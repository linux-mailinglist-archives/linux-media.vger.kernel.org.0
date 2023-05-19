Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279667094BB
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjESKZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjESKY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:24:59 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E66E5D
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:24:58 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6238200c584so13035746d6.3
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491897; x=1687083897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuquuX3LtEasIX2qqIvkyd90Zb16LALmdo13bhDY+xU=;
        b=aDZFf86QQofHPSc79fOTJkCGOsmjZh1FtaZdglob99OalEvQTr9IQCKKvefzzwDlIb
         VS1DV3aIJMCRqVmUs8WswN1WY5Y0laiQ1IOK1td1Om+l0H5Gf3EINRdV+uHYC1vWujUS
         EF5y9ZIIb7O5o1xgq8FUbnyokooexYyve8mjLBKT8YQFcqcLPUpbKv78TA4l8TfjyWbI
         q4pIT2l5SZ0qQGrvqlCmZuAGyBRAXXiFT1U5luKmeDnE65tj+fg0TDU0IcBEYWUmuNlV
         a/RW/3rHf3BFUUCvSoZO6ZOw3Sg7w7Tn4N7Jgu42NAUa3kgRVKIVtETAZO/SjUXGovEj
         OExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491897; x=1687083897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuquuX3LtEasIX2qqIvkyd90Zb16LALmdo13bhDY+xU=;
        b=e3uwORVC1H8990QIk40vIrho2mpEHwjL83/ja8W7kK2QkKESD2vmluCWqTXRvDM+5O
         E5ngLfFZZy60AYWgZOaKFFyLTob3m7/BABSPPsBqnYFJgwGozUwzspSgoeg5NQK9rcTC
         foJTXopHpASphPPvGYKjg3uCbrarTnGFOPhpFO92tlRUKtnY0JfXEVDQyq5Dg51koqf8
         KRU5xphEU1iXZcSjdfuKqPRM/bi55SV5p5zJv25HEVDQh7+49kbO+D87k44RszbEAn4l
         CaqbHNtigATeHldXMBzFCCAXGsxQW216Q2XmFEK50pPDfdB+lyt9KQ8zDZqES3vL4xpx
         Baxw==
X-Gm-Message-State: AC+VfDxdR+cvrqnmfIVSz4mkFGXCSi1pz4Vml/pwGVtI5RtDpKrVfIo/
        L21eIpn+9cLhO+k9zidUl1vYsGfKbLp0lRDbEZg=
X-Google-Smtp-Source: ACHHUZ78RzUmOT1KDIhC3yUTBIeY7F8BI58+wpUbmD/LoR+rHf2qSugV4DwSVvxcBNaoCApiwmgUvI0SluECTW04ZNY=
X-Received: by 2002:a05:6214:e8f:b0:5ef:4446:22f1 with SMTP id
 hf15-20020a0562140e8f00b005ef444622f1mr3776197qvb.19.1684491897201; Fri, 19
 May 2023 03:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-5-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-5-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 May 2023 13:24:21 +0300
Message-ID: <CAHp75Vc3+JF+WW-nu4xPfdUszNb4Q-wbp37Wi7npWaTG-Jow5Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
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

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The XXGC0310 ACPI hardware-id does not appear to be used in
> the DSDTs of any hardware out there, so drop it.

Yeah, I believe it's a leftover from preproduction firmwares before
real ACPI ID was allocated.

--=20
With Best Regards,
Andy Shevchenko

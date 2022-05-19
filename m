Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0232952DD9A
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 21:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244082AbiESTRL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 15:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244556AbiESTQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 15:16:53 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FB31AD86
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 12:16:01 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ff155c239bso67017687b3.2
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sldeoUHN+XKV/25qdr8o1yS1uyCAwpn/8BNmGuwP1dE=;
        b=esdsxkGc0eGir1WNJCJ+3z0bGioybSNozIgc+5YrEAgjXQ55X1gbvI0UuAeHqVOr9u
         pkeFmGpcsq6VvVMjKi3Kie8aYUOtwsAYrxFImGEr27vkiYw/OhhG4edYk+QLr2bcanFl
         1yz1hRjuKwe5L4OgRPe3qUce6qKdJLOMpyUra06UfoVPFs9Rk/UWLsO6S6H1CerCzI3a
         /087iBaPNoaV3eZhfkrwWc0+yd12va2Upq2jgVLPt1UN1cJZzGQrUa5jnnOzHiC7VAOI
         DfCuHSXyPoEm7z8x/VHn5tYz3crZ3v8MYSc82Vdnima/E4/j/um0oMwuo1WMrynqLUwO
         FK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sldeoUHN+XKV/25qdr8o1yS1uyCAwpn/8BNmGuwP1dE=;
        b=RmGEgSHQIFK7JBtxHQ2z0XCs4SEIyBBCsx2igqfOQnmGe1H2lMWhq4AkXbTyGyKCmv
         h+TLg4OO5L2yqnUzMD4V2Q432KR32oF1Nm0pap3xftWtF0P0Nz8IYUYZtWAXG5rRYjoZ
         9el+CTYkRo6GSwktI8j70IawpRe8XOhe5xqmPWvXfFRFgd/fuY2rR6laH5RhXi13c+0B
         fuYBrbhCKeBcmIi4aWW3iZCCFduTZ3OHFJhYCsoEQActwZGcC7iz5suBtPRI8FLcZaqv
         +XJ1MG/weZmCwjeAQBcKU6NQos68V7ApLMNjuMlZ35mNNTUh4u1K0PLHhFXTN0HxT71l
         88Vw==
X-Gm-Message-State: AOAM533UlFuTTb1t4km648ADcmTp678D7XXJ4uWNr66PWasVpHpIq0Ro
        wQQXWhJyABodwxRzzEIFVvLv4DtUR+za8G4EbvI=
X-Google-Smtp-Source: ABdhPJzsrhBthWUerOooCvtH/w1ulZF5flJzyUSyxmLTPq4eQnZ/Xkn06K6dIEO0BrCeHNS0q07Ser+0nsuYW8fZYNY=
X-Received: by 2002:a81:60a:0:b0:2f8:b984:7f5 with SMTP id 10-20020a81060a000000b002f8b98407f5mr6390954ywg.217.1652987760471;
 Thu, 19 May 2022 12:16:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6b12:b0:2ad:f417:94bd with HTTP; Thu, 19 May 2022
 12:16:00 -0700 (PDT)
From:   Manuel Franco <manuelfrancolove048@gmail.com>
Date:   Thu, 19 May 2022 12:16:00 -0700
Message-ID: <CA+PGJtBW=RFNtvMUgz7E2EqQ6BF1sEQLZP--s0EACBHHamT4uw@mail.gmail.com>
Subject: Der Betrag von 500.000,00 Euro wurde Ihnen gespendet. Kontakt: manuelfranco4love@gmail.com
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ich bin Manuel Franco und habe am 23. April 2019 den Power Ball
Jackpot im Wert von 758,7 Millionen Dollar gewonnen. Ich gew=C3=A4hre 5
Personen jeweils 500.000,00 Euro und Sie geh=C3=B6ren zu den 5 gl=C3=BCckli=
chen
Gewinnern, die ausgew=C3=A4hlt wurden, um meine Spende von 500.000,00 Euro
zu erhalten.

Kontaktieren Sie mich f=C3=BCr weitere Informationen unter:
manuelfranco4love@gmail.com

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4354D8B87
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 19:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243690AbiCNSTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 14:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238339AbiCNSTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 14:19:22 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0DC13DCF
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 11:18:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 25so23157850ljv.10
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=EaUHmdZ87qFbfpgGvP+lfvqYtgcNelL/CAyS1EJnQ2E=;
        b=FXSYhrdCJCKXWSZ8hZXw1W0kaKhv3aSN6xUIDR43VSDNJF1pQ4FhAw2GNVj8wfa8fy
         Oklh0xNzXLY8PQ1SX57ppPjkgzqfOvT1MMQrgJGaEA2lWHyQgnI1TNX+orfoJ35sNr7G
         4H+PV//y5JLU7lYkf9SMz1ve0aIntsTNCgW6j06HfcNJvQUiYrKB+kfy53lnY9sZaAm8
         zklZeTfWw6xCtJRaqMHlcqaLLYdX5DAseWHbB/GuoNS7bUD7GxQATmYCZnwinu/xA1MA
         LwQGqaHuNh/A4C7nU1gM3uJrncDbeM79A9bCyLhbUPQKqMIx+aQSb3ZlAff+MSV2OKOk
         4RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=EaUHmdZ87qFbfpgGvP+lfvqYtgcNelL/CAyS1EJnQ2E=;
        b=smXk/bL8p196b1BABsA2x9fJ1RKfbMK7M2UbhHFO6HVYO5lxv3+LDF4kNFh40ke2Pj
         1cFmlSwsaLT1SuPBvklsEBtrD/58CGTqEVOuHAa+uSXbjKCynZKPiEGbziUt8ywTl16l
         ek7RSyTcvZDJUVCfIxOc++8uRskXQtFMB6lUWtbesrFY8ObkVLWYzcTWv83atfoVs8xZ
         rlk0uCOQBHEN6dHcxgCceoPNEmPqWf/21xsCvW5/s92Z8khs9xRfWJIrk3kfIeHjLwCQ
         otyL7gaqL8zGZG9jUVkXGu/DOiOb4ItSyATsGqF7Tqf79oFHbtGfA7qGwwq517tQbuaY
         O0og==
X-Gm-Message-State: AOAM5311gjz0xjqlQ2eBYm72BYpI44U+okxPMxXL0o8qXuhb/LKHQ03s
        juMUD0JCVptKftqQganme46GWnYNThVneLL9lkM=
X-Google-Smtp-Source: ABdhPJwomYMLBzkyg51nboug7vXQyoLcMCR5+4ADvcCVNhO2DxKMCEp8GrjEuuvt0WVv0JGEMPoPcSuWYj1bsOGC+88=
X-Received: by 2002:a2e:b8d1:0:b0:249:24e6:356f with SMTP id
 s17-20020a2eb8d1000000b0024924e6356fmr7822875ljp.511.1647281886865; Mon, 14
 Mar 2022 11:18:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6289:0:0:0:0:0 with HTTP; Mon, 14 Mar 2022 11:18:06
 -0700 (PDT)
Reply-To: db.bankdirecttg@gmail.com
From:   "db.bankdirecttg@gmail.com" <mdialo008@gmail.com>
Date:   Mon, 14 Mar 2022 18:18:06 +0000
Message-ID: <CAFmzXQTv_N1HZ-vhW3PyWm=3RnDsYDDkhXm_2=zn0oarJkP1ng@mail.gmail.com>
Subject: Hello
To:     mdialo008@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        NAME_EMAIL_DIFF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Irod=C3=A1nk el=C3=A9rhet=C5=91s=C3=A9ge: 2554 Road Of Kpalime Face Pharmac=
y Bet, Lome, Gulf.

Ez a WU bank igazgat=C3=B3ja =C3=A9rtes=C3=ADti =C3=96nt arr=C3=B3l, hogy a=
 Nemzetk=C3=B6zi
Valutaalap (IMF) 850 000,00 USD k=C3=A1rt=C3=A9r=C3=ADt=C3=A9st fizet =C3=
=96nnek, mert
megtal=C3=A1lta az =C3=96n e-mail c=C3=ADm=C3=A9t a csal=C3=A1s =C3=A1ldoza=
tainak list=C3=A1j=C3=A1n. Hajland=C3=B3
vagy venni ezt az alapot vagy sem?

V=C3=A1rjuk s=C3=BCrg=C5=91s h=C3=ADr=C3=A9t.

Tisztelettel
  Tony Albert
  BANKIGAZGAT=C3=93
Vegye fel a kapcsolatot a Whatsappal, +22892905783

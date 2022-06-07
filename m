Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92FB539D3C
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 08:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbiFAGbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 02:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244910AbiFAGbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 02:31:15 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D43C5FF15
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 23:31:13 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x62so770459ede.10
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=oXjrioDnfpdscFTPhwe5eTP8raXbbRL+txchizTdKpg=;
        b=CaLiHZiD5kd6beLkeNBhjSBrtIPYSuVXjACaNxk0p13dMs2Eyihp2iNym0PHOO5k21
         0hJpjW8xqqyxbc4SLk0YqlcUZXcsX4eIi91WrXIUnS6PhTMsUktHa0br7YZCErhHfcJB
         gbGoPDNqth2OTjIsD/0LpZi9jGXgkhWUTouNeMynu6b/uMZb/XU98sUmCT/G5Mmj75Uh
         4cmScLli9MR6PiiBc95mnaQXyjTn+IRCHT73OtuyKd4nBkEunTV586eAQM2Ync0sq8O9
         hPsUw19RpKSwqKrbfd0yQ0OX784gU5/tPvkAnWuIjAJVD3wJneBIwkqrC2IPaRHf7mio
         AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=oXjrioDnfpdscFTPhwe5eTP8raXbbRL+txchizTdKpg=;
        b=Wj/y8IV8w6bOQhoaSAs/fGqRc6M8yGZUy6Rd+6b5Cs96R1D6w5SbvRWyO3pqAFjPs6
         e6AcRrUT4nrAoPoNRlrb4kZRxGAhjaXlPAd2zYcukKUJ434+MUOSu3zYmx3gOiAmi713
         TWzDEZzmCpUGGKzMy3OgwYSaQF7LL5S/VXe2H4Lw2gKT31jGQkSd+myQsni3J0RL18ly
         jK6mSf0Iof11VxP9QKzfa9JrvHMYGVcO8SdRezmYgBTMfev/nyOLviMIDaktzHMdnJiK
         cn44Cj4a3SJ2IqubTmA3+WHkyM2yPDV1EUR/9r8aZW+GImWSPNOMotaKwemHb1wMj9hm
         wHIQ==
X-Gm-Message-State: AOAM532SadII2VPn8pFpOTrfqUtqg/bUy49/cTMbWgPaMZLxkgHLM0Y9
        tT0uLu4g+qbHXmJKKd++olgos49ZeYXD79ftoi8=
X-Google-Smtp-Source: ABdhPJwetEsgTtjnuaWYUdp7MxKZ1xYjJKRW8kbl2dPNSsDIlAQG9kFcayf2E8U1gIA1wn2HnTzzzbMpTn8Z9+MbJX4=
X-Received: by 2002:a05:6402:d0a:b0:425:d455:452 with SMTP id
 eb10-20020a0564020d0a00b00425d4550452mr68100231edb.259.1654065072277; Tue, 31
 May 2022 23:31:12 -0700 (PDT)
MIME-Version: 1.0
Sender: wedenimboma74@gmail.com
Received: by 2002:a17:907:75c4:b0:6fe:f860:1435 with HTTP; Tue, 31 May 2022
 23:31:11 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Wed, 1 Jun 2022 06:31:11 +0000
X-Google-Sender-Auth: PIafC5BJagIMwq6KXdYNnu5xHBM
Message-ID: <CADTv18D8=B1bRLbyHGVOLYc6ey3D+uiWJKNHAs96Q+Dwd3M1zQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bonjour, je n'ai pas encore re=C3=A7u de r=C3=A9ponse de votre part concern=
ant
mes deux e-mails pr=C3=A9c=C3=A9dents, veuillez v=C3=A9rifier et me r=C3=A9=
pondre.

Hallo, ik heb nog geen feedback van je ontvangen met betrekking tot
mijn twee vorige e-mails, controleer en beantwoord me.

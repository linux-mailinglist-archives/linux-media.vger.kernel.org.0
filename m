Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3233807A8
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 12:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhENKrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 May 2021 06:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbhENKrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 May 2021 06:47:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71EFC061574
        for <linux-media@vger.kernel.org>; Fri, 14 May 2021 03:46:31 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h4so42560712lfv.0
        for <linux-media@vger.kernel.org>; Fri, 14 May 2021 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=LN7p+cZ3GajTkE3JimTAvKmcfCeT8DzzWRtBPkXq8WI=;
        b=Vm+h2pAhvy9pWjBFn6iZR8dktJcewGh7P+acEJdEOLWrOhfPmArztbd2zRsH6cQi3o
         amgzurGJUtD6j21p5vK+ZA4PcIPeK5fsRqQD+EBwZQ3y5KmY5Uvt7SB/9gIlcBLqFS7i
         BKgb5uH4RctWXvOZUBaC7lnIbpEeEqI4LxEpfVQjUvoKy5xb2y2cBCXJR7toDYyayX1J
         w8mDadxhLEQKPsoSdNioMnMGsUpQhDrBWYAHbJn3OzB12SG+cObwacePWaJFIy4o4LpJ
         cJbzN6w6vzw/DGSgjklp26we6s9hIC1JWJTLGkjjxHKMPy5139B5ZL1YrSZw23EO1LiB
         LFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=LN7p+cZ3GajTkE3JimTAvKmcfCeT8DzzWRtBPkXq8WI=;
        b=Q4qtENK7HqysP5bJsKPpH/JqX931r1ia1+Sg56zOTU9em+xFprzQR0xxbLhYvtbtry
         FDK8xHzU/QaebbkHBZP/5mExUP/s5gHdZFwR4Frj8nXGUPC11rsv7qxuPMJ2TotmnrVg
         svVZ6GqqaC/ccVpDAtBuAYh8miCdKWX6dY3OW61aHWfCFG3ewcMu5uXWXLg4IjC6Oxq3
         1v7rVwP97q+aaDl8+WH1gp87eIYXe9Cc9xTd+mjLAlqiqQwf0DsTYNGVeiRyM89kiZeG
         myYJ8S+k87SUTM/VqJN6lqB/bHGMduywAfCLXkXt34cC7S0YSBOVXVYY+VZ8wjAV5/lX
         Vj1A==
X-Gm-Message-State: AOAM532ZncPyTJTGe46UMHBHTlpCqv2k9NgtfdEnVzNQfuPHOzbTGOy2
        1R7MKFrHG0dfFvGMwBcbvaNxNWurHxD2DwQF/Uk=
X-Google-Smtp-Source: ABdhPJykvLIEdQMEUCKEJmgnVsoqYJRvjarwxv8fYpmTScEWKLCrrxHhuBzI/7KfUkKRvD7EO+C1ZH3FCdMgr8VDrMw=
X-Received: by 2002:a19:7d0a:: with SMTP id y10mr31139512lfc.596.1620989190276;
 Fri, 14 May 2021 03:46:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:470e:0:0:0:0:0 with HTTP; Fri, 14 May 2021 03:46:29
 -0700 (PDT)
Reply-To: mrjoshuakuntem@gmail.com
From:   Mr Joshua Kunte <kuntem947@gmail.com>
Date:   Fri, 14 May 2021 11:46:29 +0100
Message-ID: <CAAAw+VD78_m7ifX0O28xbo6KJLZbq-mhJOUt5J=TGpe_oSGMSQ@mail.gmail.com>
Subject: =?UTF-8?B?SHl2w6TDpCBww6RpdsOkw6Q=?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Arvoisa vastaanottaja

Olen Joshua Kunte Zimbabwesta ja pysyv=C3=A4 henkil=C3=B6kohtainen apu
edesmenneelle presidentillemme Mugabelle.

Totuus on, ett=C3=A4 matkalle, jonka otin pomoni kanssa Iso-Britanniaan,
pomoni k=C3=A4ytti nime=C3=A4ni tallettaakseen 100 000 000,00 dollaria. pan=
kin nimi
pid=C3=A4tet=C3=A4=C3=A4n t=C3=A4ll=C3=A4 hetkell=C3=A4 turvallisuussyist=
=C3=A4.

Min=C3=A4 ja edesmennyt pomoni olemme ainoat, jotka ovat tietoisia t=C3=A4s=
t=C3=A4
talletuksesta. Siksi minulla on
p=C3=A4=C3=A4tti, ett=C3=A4 sen sijaan rahasto makaa pankissa, on tarpeeksi=
 hyv=C3=A4
Etsin ulkomaisia kumppaneita, joiden kanssa allekirjoitan investointisopimu=
ksen
ja vapautan rahaston h=C3=A4nelle sijoitustarkoituksiin h=C3=A4nen maassans=
a.

Tein t=C3=A4m=C3=A4n p=C3=A4=C3=A4t=C3=B6ksen, koska virkamiehen=C3=A4 en v=
oi
sijoita t=C3=A4m=C3=A4 rahasto maaani ja jos teen niin nykyinen hallitus
kysyn minulta rahaston l=C3=A4hteen, joten etsin
luottamus arvoinen kumppani ulkomailla. Kiitos yhteisty=C3=B6st=C3=A4si.
Herra Joshua Kunte.

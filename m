Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5BB35A750
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 21:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbhDITpm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 15:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhDITpl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 15:45:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2EBC061762;
        Fri,  9 Apr 2021 12:45:28 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u17so10460658ejk.2;
        Fri, 09 Apr 2021 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vT8V0pxZKkWGNrSwjIst4xZQ3JRTUytna9sd7X+Ifc=;
        b=r3ByeAfRml5P26RhY7xVUnS3OQO7CWqiSfKHe32BZm209A6l5zDfBc3l7fq3bMrjDq
         UFI9RA/eNo3CR59j7sm7LxPTp3afskPf9WtLFb1cuImdAFZWDIMaN1CGOo1gI1Yq/G4X
         0FR92g62s4g7YZenz9mJTGIG2Fx+JfPA2Jo8EPXbW63K5UgK+a0QOLX2DDXEF0wjsET4
         Qcw16HpipocVMkYsSi3cJdjNe3a3MZNN+B0ODDBynmuSzNkEBWloooekGc0ZSkhniwo6
         TsBlxk3muPPQu3Ps42z0mY1l4DNxUJbjklzsqdrRw4fttPoPvamWafiCka4zVlKKJIMM
         cO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vT8V0pxZKkWGNrSwjIst4xZQ3JRTUytna9sd7X+Ifc=;
        b=qn+Ub0QPgO78xo5PAbhy/vqa8sZm90PjTzxMt6cLPG5EDCaOIxztFOdKigTwpcpGN4
         pqAc/rDK2b+5pk1TLkw6az12TJ3HIV6KvaweNyEWEEzKXS+AH+K6dB+ZXQw7mTkxFeA7
         hsFpivOi+gOQ2vGuBkqWfimTJpsSo/tcLIzzi+NGkdXmRv7soMzHTbuDRDj/P9wtkdHf
         PRYutsdp3xPWy0VHwPjjiLj/R7TB0/wn1SqxHLhoeMa6/1bxOH+YZNHnEahUlgeljNzm
         j1L9od5QD/0yclMfrZvy6avK2+Y/sCbTNqrrYUdKhWTmVUYeo/0FV8C3fkXdzgHz/pec
         iNsA==
X-Gm-Message-State: AOAM532mbcok5ZzkuNqE+xT0Ax1OHz1v0+votVV/1qUc6f5NrfFHyFzf
        G2PXMn1uMjUvsxo1dbZtUUtToTzHmOaOGCljjHY=
X-Google-Smtp-Source: ABdhPJyb6M/jI8IjgD7u+OnkLiMX84rxCMexdaX3dMEISRPagxLNMDNTlnZ1PVAyGjloCdXyZsVHE+fUwgit1uwqdRw=
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr17221105ejc.2.1617997527137;
 Fri, 09 Apr 2021 12:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <YG+Bcqxetfj98l6V@kali> <479be6a4-2e6f-98a6-045f-d7c2132137c4@xs4all.nl>
 <05802da66d3751611b85eb63d566220e09ef4bb7.camel@perches.com> <CAHWmKdgj67+T=tWKPMDRt1fbLm7_VLiOmgKcrzBj6oCd5Xv8sw@mail.gmail.com>
In-Reply-To: <CAHWmKdgj67+T=tWKPMDRt1fbLm7_VLiOmgKcrzBj6oCd5Xv8sw@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 9 Apr 2021 21:45:16 +0200
Message-ID: <CAFBinCBOf9U41r2oVOA-b+m3H=iQvjn6qYxLDLTH8LBhAwjyEw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: meson: vdec: matched alignment with parenthesis
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     Joe Perches <joe@perches.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
        Greg KH <gregkh@linuxfoundation.org>, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com,
        MITALI SUNIL <mitali_s@me.iitr.ac.in>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Apr 9, 2021 at 7:00 PM Mitali Borkar <mitaliborkar810@gmail.com> wrote:
>
> Looks good, will try this.
if you re-send this patch then please include our mailing list:
linux-amlogic@lists.infradead.org


Thank you!
Martin

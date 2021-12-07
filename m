Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B147046C7FE
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 00:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242459AbhLGXKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 18:10:42 -0500
Received: from mout.gmx.net ([212.227.17.20]:44555 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242406AbhLGXKl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Dec 2021 18:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638918425;
        bh=CAbocPwr4PQJqj2w6EdK55A6G4JMgH9uF3hA2UkpR30=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Em2J1hga8LbX/6Lqhy3km0zAj7lxm2aUJYU5VXvz+kzcLXC/DgDfJufYNR264j2Pa
         bH2ALZU33uFDhpWEPTuqLAzror6DCLta9F9me4IheSfhcDk1P1seO+SGgiRX+OGqKs
         27LrXozL9Q3a6LYFXWGCARv51Gk38jupG8yGwAqE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap19.server.lan [172.19.172.89]) (via HTTP); Wed, 8 Dec 2021
 00:07:05 +0100
MIME-Version: 1.0
Message-ID: <trinity-42d6e25d-b5bb-425c-a25a-ef6e758e216c-1638918425561@3c-app-gmx-bap19>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Aw: Re: [PATCH 2/2] media: si2157: Add optional firmware download
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 8 Dec 2021 00:07:05 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211206150055.43043b53@coco.lan>
References: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
 <20211206150055.43043b53@coco.lan>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:WWGi3ofkj7Ml4YA3R0MachZ37/vbo7JcE4ExMoNFInN4a9XSBY64nhaUrBdhEBBbZTNHq
 ZIEsQvDzRI1FTYI9Jfv2fqFe+o4pb98G9/Rz8dUOCCSzK1NEF/OpoXPt5miOBKIJrGkeXT5T9KEy
 5nRYLW4cwrhJz7kGifDEIwg3vptGhuhn/fSk54l2pS+Ll5Qcn882BXhQ8MgESdMVLV/MsZwovI9k
 BQ85T4qbnmzU6vUiPP2tTd8L7atdTPIFLQqSbJrvuPN8up4az6UhTQW6dR5Ao4iNwE0Br6EbeFS+
 gU=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:S+qZloxtM28=:ElgL/arMk3Vbh6JW5Etily
 XIx+PaFHn41e4XgLlw6emNUyhPTBUr2nmIibrYkoklg0riypmF53H5ummivd1Zp9EFwH7X5up
 bFmhHRLEaSdpuXQJUjlJlGt/4QHuh/14oXggavo6kNc02ddtCHkrBDIWDVll612VQyA4IaUQv
 PKm1ISzAUvSwfoPYO2TDLoRXH6sxD+qk8GTNrPSeTwY9c9vueQBmv2bbKAERd1rJBrYlgTz98
 CFfUyB3BrxNW7GKRpehJdK0+W5ACHORmdgMT/dK1bEn7J5G3nN23nCABsgOq6fsBZmOlJG38o
 Ev96QpiSqiBldnDMSY+y83U21wxGd5+GIb1X9GTtCjLJZ5RfHlAOs7zkaQSg2EA1nZoynwPES
 asg8GXAuBEDyB9aF1Cca9QEM0nCKTx/lBTuuoE7O2w7dD1edtidT/ydNJnz6YkHHGMl796U6g
 U1jF73C7ybdnf+mM2jBUnlsc2miMCz3hqAmMFF9SoQOTVtJKauRTDCk5S8nfVQG4ET1c18bo+
 t79SsbYR2NNIjU8NsOxVH+6k8MBi77mNPyssyk+5ox6EbsG3bAttr3a4cvDdSoRSxaMK7m+/9
 TlIVAQ3zT9GkV5M5BbX7BxfBP3ipot83pl/QnPxhJ2yJDgYwqObCcyCYX2sCBJyCgrJ/DrkjY
 oLYqqiYOHBy0uSqhTK1KWmhD93neN/ETyUn68i3lxtIt/J1+ZEnnQ21fZTmQHNY4NCBUSlOCo
 6IfgsJ2Mj6OUQ1hJ1mQ/HB7uV+LSXUjc0mt+c29FOArSLgejAaUyhm+ufZQpe/RH5uqew2UQv
 b4IRpPK
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Von: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
> This patch seems too risky. While I don't know the specifics of this
> specific chipset, usually the ROM is on a separate chip that may or
> may not be present. It may even have an unusable or problematic
> firmware, depending on when the firmware was flashed.

Hi Mauro, thanks for your review. Could you help me understand what
risk you mean?

Before this change _all_ users of this driver had to rely on the ROM
firmware, because the driver simply never downloaded any firmware
patches into it.

With my change, the following scenarios are possible:

1. The user has no si2157 firmware patch file in /lib/firmware. That
   will probably be the case for the vast majority of users, as this
   file is not found e.g. in linux-firmware.git.
   In this case the device will continue to work just as it did before,
   no regressions, no improvements.

2. The user has a valid si2157 firmware patch file in /lib/firmware,
   which is downloaded into the si2157. Should the user experience any
   issues with the updated firmware (which I think is rather unlikely,
   as I would expect SiLabs to have revoked it otherwise), simply
   deleting the firmware patch file from /lib/firmware will cure it
   and revert to scenario 1 above.

3. The user has an invalid si2157 firmware patch file in /lib/firmware,
   which looks "right" (to the file size check that's already been in
   the driver), but does not fit the si2157. I found that in this case,
   the si2157 will just operate with the original ROM firmware, i.e.
   also yield the same result as scenario 1 above.

I have tested all 3 scenarios on my Hauppauge WinTV-QuadHD, and the
result was a fully functional tuner in all cases. I haven't managed to
produce a scenario where things broke.

Could you sketch what risk you still see of things breaking/regressing
with my patch?

Best Regards,
-Robert Schlabbach

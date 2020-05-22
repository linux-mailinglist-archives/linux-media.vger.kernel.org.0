Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840F61DE65D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 14:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgEVMJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgEVMJp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 08:09:45 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32903C061A0E;
        Fri, 22 May 2020 05:09:45 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id z4so8438206wmi.2;
        Fri, 22 May 2020 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
        b=r+FNl2KwIQ7JgjPzvrnUaW17rVNutC2CTeAMUaRHvvsnpUtCkm2JjIRnFLtESPgc98
         bWET8r1VtyWvDebFioaQQdSqQywAIbHbtgWvJCboIHty4zcCRsHDLPEUVn206M/Y/lnC
         L1XGN0wmoFwCyTs5yYSag1A0IG431c3PHrdm9Qz2iQLbemMw7CkeUtG8zXO3x+wt6Saa
         rYi/yzSDTQervbLrgj2+Xr4TS4PITujdbP4xgZ1QXafnuii+JTLb/S1JAhpKwiQbq7ir
         s3qXFCpg/IzTKu9btruMwy1c9ljrzeWgvJHZnKXBTE4hZJk2EWBzK3bIV5Wpg1ZyxbLe
         jFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=0aJqkYrdM+sgbvUusxT8hDNKtBoLOQG92w0wNo7M1w4=;
        b=ZMtzLrvK4E4vldRJcop5/DKYul1CVSbgH2JqCHL+J4nivBZHm6pJX9iun441JPPi9X
         Nm8rUO6maGuMkFGrbo3qwLpg0zofiM/TlPKgUTAnerMu+kuhtu3Jbj43XfyrVq/pN2+2
         qwqzTPveJLGxor5Vg98j1vkJCx848AFT1aqTX7fcg0nj/xaghSgsXwOVFdtevBxtdp0O
         Qj/trGnFplzUL3BVxhNWbCM7lM4nU01XaUxRueWWtVLRofVnmERFHplpP6kcJhLSWgkF
         zurUxqQSYRZmEZdm8fLRul3kFobj8I0optiGWAECMznL6T3h8ilLUvf1aHOURmaSL7Dy
         BEYQ==
X-Gm-Message-State: AOAM533ewwu+mJC3vGfKveZwXtPAp5A1nLMLeGpUN43CXVH4Utq0sxKc
        pXIok8czj+MouVFgfTpJG7Q=
X-Google-Smtp-Source: ABdhPJwcDofe/8iI1LchV/4xbq+fLSJ7DSsUdZR+A9tox/LGZa0X/bncsOu4qrCpcFWpKdta9zQA7Q==
X-Received: by 2002:a1c:2013:: with SMTP id g19mr3470829wmg.143.1590149383522;
        Fri, 22 May 2020 05:09:43 -0700 (PDT)
Received: from macbook-pro-alvaro-eth.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id x17sm9259500wrp.71.2020.05.22.05.09.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 05:09:42 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 5/5] nand: brcmnand: support v2.1-v2.2 controllers
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20200522132211.16c657aa@xps13>
Date:   Fri, 22 May 2020 14:09:42 +0200
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4153A581-0894-4A4F-AE8D-22E5A976FE06@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
 <20200522072525.3919332-6-noltari@gmail.com> <20200522132211.16c657aa@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Miquel,

No, nothing else changed.
I will change it again with the proper subject, sorry for that.

Best regards,
=C3=81lvaro.

> El 22 may 2020, a las 13:22, Miquel Raynal <miquel.raynal@bootlin.com> =
escribi=C3=B3:
>=20
>> v2.1: tested on Netgear DGND3700v1 (BCM6368)


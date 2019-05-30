Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C676C2FDAF
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 16:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfE3OWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 10:22:01 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39605 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3OWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 10:22:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so4069762pfe.6
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GIW/pDlXlK2ma6IHukrdhsLwsAsLqD6hPWdqk2x6lt0=;
        b=H/Pqk3pWuFCqPGnKIAlCVRrXiAMJib0IanipWztLLjIqNBWmT6Z35B9gFicssxRhQ/
         +zz3/NrwluqFgfpYiTLGCm9aNQslVXKNIjD3JrbIT+HssV0mAL3GaXroWxJ4HBFHhYX0
         4gntRyH68ZHf/qjzAeB0nptqD6cgG1pJ9P+zeDSEVTpvItejWOlF++5/bXXNm9F1BHAb
         wrIr4cnmPlLLHiE8rkwnk2IJtzMg5SuxN2JQsQWSFBgxC8MBUlCKpCvSsaC6G79V1Zif
         o0W65zO3aK9P7Rd7JcUC+MFAnYp12VFfcOptnsSc383slRXgBGtQcXMjfmvyQ1IIcGUw
         H4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GIW/pDlXlK2ma6IHukrdhsLwsAsLqD6hPWdqk2x6lt0=;
        b=rfekWE1frKnDqzT9kBhROLVgVCXFXyqCXCe4/BTcTRcV2JmV4GXxGMffGKXNy37j1E
         e4f4EYpht55Kza/VFhPF8LyHRQ51Hi/Kbo/eW74RDNz2a9gLRjKbTPbr28Zm9hHlUhKG
         Hhn9B7R8iOwQOT0UgwNyLZqvQJCvXBnKZQql4JcaKz7b4xYZyPcZfy4oJFYqwM+k7lO4
         xfHRBp5NYpQmVNwq5m4CQ21jHycnXBFowcdh3qLkRJDmoEmGsYi+uEvGZIDKyX36Yg3Y
         PLqftiKPgUKRPtIbkcwfqXyTyngHcIuSlHhAaldx0r0vTxSHKSqvyGZnEY+h9uKTcgll
         FAXA==
X-Gm-Message-State: APjAAAWP1KD+OKmMcKqQXi5EE53E4zYZIdQnzOydKG2833UXqy6l0xJP
        p/wR/BKmqP3bQMPRHXYr7YIY9r2SPouNwg5Eedavf2/snBA=
X-Google-Smtp-Source: APXvYqwAKXqdC3YjK44is52lo0tmKf1uoOqqkkTMrcQmP/XXf4ICdDWru4bJROAR/rLtlu2yY+0y93FC8miARsdPXQs=
X-Received: by 2002:a63:d150:: with SMTP id c16mr3964359pgj.439.1559226120221;
 Thu, 30 May 2019 07:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
In-Reply-To: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 30 May 2019 23:21:49 +0900
Message-ID: <CAC5umyiXQ_20okmTgs1uJ1Jqi=SkwRWYHsz4ugP3tarozNqqAg@mail.gmail.com>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=E5=B9=B45=E6=9C=8830=E6=97=A5(=E6=9C=A8) 4:25 Mauro Carvalho Chehab <m=
chehab+samsung@kernel.org>:
>
> From: Robert Jarzmik <robert.jarzmik@free.fr>
>
> In the soc_camera removal, the board specific power callback was
> dropped. This at least will remove the power optimization from ezx and
> em-x270 pxa based boards.
>
> As to recreate the same level of functionality, make the mt9m111 have a
> regulator providing it its power, so that board designers can plug in a
> gpio based or ldo regulator, mimicking their former soc_camera power
> hook.
>
> Fixes: 5c10113cc668 ("media: mt9m111: make a standalone v4l2 subdevice")
>
> [mchehab+samsung@kernel.org: check return values for regulator_enable and
>  fix a build warning]
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>
> This is a respin of this patch:
>
>     http://patchwork.linuxtv.org/patch/37950/
>
> rebased (and fixed) to apply on the top of upstream.
>
> While checking old patches at the ML, I noticed that this patch
> was never applied:
>
>     https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238720.=
html
>
>  The first patch of this series got applied, though:
>
>   c771f42fed7f ("[media] media: platform: pxa_camera: add missing sensor =
power on")
>
> So, I'm closing the original patch as obsoleted and I'm sending this
> one to the ML for tests.
>
> Can anyone test this patch and send a tested-by?

In my devicetree, vdd-supply is not defined.  So it falls back to the dummy
regulator and works fine.

Tested-by: Akinobu Mita <akinobu.mita@gmail.com>

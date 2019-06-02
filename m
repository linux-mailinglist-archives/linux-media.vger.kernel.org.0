Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAD6323B3
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 17:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfFBPGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jun 2019 11:06:08 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46684 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfFBPGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jun 2019 11:06:08 -0400
Received: by mail-pg1-f195.google.com with SMTP id v9so6754640pgr.13
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2019 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RRVVAbvVfMkHaVxqQktghkJmlSQWp4sXilmfTObDlds=;
        b=OgqQtCY3sBxe/MwcbzutG/O539ZXV5GBtrq1uOijCgwa172mm7FBUUV3vqXz9E3Ipr
         nia9YIlCS3OSmP4LTaXhjjvco3oQMMGoexPHqT+n8YHIldcfOmd/hNcosIKO8TsYbEw+
         RvhBo8YFtxzY6xFqMDWjvYBoz8BSjxCx3BwQfTQ+PsFEImYr5I9Ef0irqR+fpSYRZhuZ
         BI5K+l3kwv6UULNGwlKD173dVBCNpCguPZ8QOT8EV7lSHja45vs4Wm/dnQzvMzJWH7XT
         1MQ1XgCvWpJMzZWyT7eu1P4A394fwjkRb9eFuKEvBriHcvB63e0tnSNiffr8LY9yPpZT
         ZgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RRVVAbvVfMkHaVxqQktghkJmlSQWp4sXilmfTObDlds=;
        b=Nu/BBqrRF/MJ2XdYNpefnzmisz7ruZlIpuhSFDNJBk43psbVY0QNmvYhxNq7UAim0Q
         6+81N8Jg7KQSy6jFJWD0D9xSDIdkRdn+kr9wgkJIuQGKwu2ueEeE8FqBIOrVDiYLNYjZ
         EPn5mVwisBE0LizBO/qgTMmQox2xiHj3habqqzuHb7jAFzxbB+umxd4TqNC4vJdkNECX
         h+zcxjOoNaJUCZWzWOmLYqdT2kZ7K9yaSbmp+s5wNOvnf5lauy9urklHsKCOTQB4S04v
         ZFEl30Kr3INAypkYugeMU+E1QpqZaAIa1DBVCfdNN362mGYHulauLCm0w7q3C2KfTq5p
         YLOQ==
X-Gm-Message-State: APjAAAUgAq7gcXTWEz8rb+ucJW7LcWV+bpzGxKCkv5WS1d3BG7USbGuh
        X8kSxH++cibztna08sjjVa7UptGVo8SsjrOB//w=
X-Google-Smtp-Source: APXvYqy/zVagWvpDmYDY1SLGR1WZi88RyIdIyuPsg2nGEG5qZVWgpbpetO8Tt5xsDw5gXqw0bE13RAzDJqZMxE3EHAY=
X-Received: by 2002:a63:110c:: with SMTP id g12mr21907462pgl.18.1559487967510;
 Sun, 02 Jun 2019 08:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <67b53f91ede9e9ffdda913c818065095a726b92e.1559157595.git.mchehab+samsung@kernel.org>
 <CAC5umyiXQ_20okmTgs1uJ1Jqi=SkwRWYHsz4ugP3tarozNqqAg@mail.gmail.com> <877ea65s1l.fsf@belgarion.home>
In-Reply-To: <877ea65s1l.fsf@belgarion.home>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Mon, 3 Jun 2019 00:05:56 +0900
Message-ID: <CAC5umyir0WAzgDbyHuQevyZ=9yygXyQqwV0+aBL144_LthN9AQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: mt9m111: add regulator support
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=E5=B9=B46=E6=9C=881=E6=97=A5(=E5=9C=9F) 4:43 Robert Jarzmik <robert.ja=
rzmik@free.fr>:
>
> Akinobu Mita <akinobu.mita@gmail.com> writes:
>
> >> Can anyone test this patch and send a tested-by?
> >
> > In my devicetree, vdd-supply is not defined.  So it falls back to the d=
ummy
> > regulator and works fine.
> Would that work also in a non devicetree build, ie. in a platform_data ba=
sed one
> (as this is one of the mach-pxa targets) ?

I don't have board_info based system, so I can't test without devicetree.

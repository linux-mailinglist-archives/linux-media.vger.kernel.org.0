Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC8331BE66
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 17:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhBOQJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 11:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhBOPzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 10:55:25 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877B3C061788;
        Mon, 15 Feb 2021 07:54:38 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id v7so9447042wrr.12;
        Mon, 15 Feb 2021 07:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pNbLw2bB0q9Jg17V7PmEJoybP6JsSyuWKoXpx/sdxy8=;
        b=uyVQW/vo9XkF+fT10kUIaOPX1SeLXbJoWLZwRRZCwvjl5fSJlgHukG8BGhfLoJOdjl
         /XVtAeVsyfCrx9DZWkKbA7K8ihabkBEtNmzr10PgsqS54/L6aG00NfdtO8C/17Pf5Qz1
         Tfb2QalMf6KQPm0zuI/mq283wjCn3//0op5CJExCKLWQWjDm3w8FI5c42UmP9XrrDFB0
         HchdzlOeYo9+0FMQ872j5CMOTjZy4gXwyADpKrh40PYjYKFt0faekaRG/6rHscKNprl9
         317jqdKzniz/3V1oY4MQ7LWToj5yHYE1sxDvW2kxlS8wlHz3XMnJdMyPqAyfKivy2sWC
         rNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNbLw2bB0q9Jg17V7PmEJoybP6JsSyuWKoXpx/sdxy8=;
        b=HnMYw4L71A3Kp8ZcJeKwzGsff3jb1nkX8AngfDwB6Z1Qq8Wmgz+wEx3jfp5HIZy+Cg
         bbAHO60FP1AEFlzIzJXFYkFgIM6tVaCMpROjwDWfkBJanBivCOKpq1u4MRscKiYFDsTB
         534y5UEiWUK9rHJ8UBgnIMlBB60Ph2+z3k1nu8j49t0EZKsCjFzjTekFHX/zcgoKfeW0
         5LDwsJY7unTPv8i/591sYwB7ORwYyJ2FDVNKiK7Riq9yYUiqLN8lVzhi/1/VyWLnxYaE
         Ad0B+zmhmEC6nVChm2W5cg2ub74uhWKYaZH37QWiBA4597oOpG+tM8snbEWHKc3N/rNU
         WSqA==
X-Gm-Message-State: AOAM531/s/2k6rKtmjgfmR7Z1GVGxIfp5uyGkeA6SH1XiXK9/8QOA02L
        4V51WG9lGxHujaLRrShvl/tXnoY2rE0mos711LA=
X-Google-Smtp-Source: ABdhPJxD6STXfO+mTL5nBlJSqH3ry36wSlJoY+Tz9IuCcgq4zAG/0UMDTGjzrIBlGbuuzLst3BaLuURIwm1WUwtwbkg=
X-Received: by 2002:a05:6000:18a:: with SMTP id p10mr8525247wrx.166.1613404477234;
 Mon, 15 Feb 2021 07:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20210203163348.30686-1-TheSven73@gmail.com> <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
 <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
 <20210211143233.GA1360@pengutronix.de> <CAGngYiWAohHXYPfd5NJc4URVuMA4GP01jvRV78uM5P+H7zKx-A@mail.gmail.com>
 <10bfc6f5aaa02ad5858186ccee1894424fc0dd39.camel@pengutronix.de>
In-Reply-To: <10bfc6f5aaa02ad5858186ccee1894424fc0dd39.camel@pengutronix.de>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 15 Feb 2021 10:54:25 -0500
Message-ID: <CAGngYiWxMsko2+6NUt4N0GyBUq4Axz4TRiUrF2ZjNGvZZkTO8A@mail.gmail.com>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Philipp Zabel <pza@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas,

On Mon, Feb 15, 2021 at 5:15 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The straight forward way to fix this would be to just disable the PRE
> when the stride is getting too large, which might not work well with
> all userspace requirements, as it effectively disables the ability to
> scan GPU tiled surfaces when the stride is getting too large.

Thank you for your very knowledgeable input, really appreciate it.

I am wondering why I am the first to notice this particular corner
case. Is this perhaps because X+armada plugin allocate a huge bitmap
that fits all displays, and other software frameworks do not? Are
people on i.MX6 mostly using X or Wayland? If Wayland allocates a
separate bitmap for each display, this PRE bug will of course never
show up...

Sven

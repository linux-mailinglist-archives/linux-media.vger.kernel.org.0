Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A8B58DCF
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfF0WQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:16:37 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:39153 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfF0WQh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:16:37 -0400
Received: by mail-lj1-f171.google.com with SMTP id v18so3936553ljh.6
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TawpIEFhtYNuX84+b0ZM+mRlRC+aCRepsmuBJqEle8c=;
        b=WManJjT16YprlF/KgIWJMztLD6rhSmHycEkT+A3SbjTNCLleHYOAjL6P778d1lVXbE
         tAO03Lrbe/SfzOyMPSp1QZzQxiGt1DWf2cqsATHqOIYlCl5sHwN3MnO9kmh2G3tWsldA
         csrcrHqMgS+moZvIZWdn85pZt+GfOcnTi6mFjC9WjxexHcnpKd/KG0TuCw/gOII1Ts7G
         yJFYIZkuhDJnuVJt6iIpagtJ8nBx6R2T9jPbCOi/lZROQdqt0njOtMeCmVxUQYkWr1ws
         ulfhLcGT4/ysri4Fk5lKT76rjyHeJ8nwXNh//97S2o5D1IBIsTddP8Z5x89nsBg3A2l5
         9Viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TawpIEFhtYNuX84+b0ZM+mRlRC+aCRepsmuBJqEle8c=;
        b=NFXjQfVuPz/aP4rojQkpayeRCRFOQdOEZR2A8352xR4f+feUWI4/UU79QhBJBkzms4
         UEgNEBgJPpAx3exjhRqiFy4O18TP4oNp18kXXfR177B6FpnRWMzFslRd3eajDGz7v1N5
         8DqR9CUNyyySDDwyw9BsnIM6W29UpWVsn9SauuYfwRXrdaoBOawtW6JtkgHGAreM0h2h
         UMa6nuz8+ci15rQf/rifFoOzw7HKZXATmIwiv6FvIjaz9NXvlhjYB2ASFIKqr2t9qN7J
         gt5fgXX927DVyaoOpb0FLi1tld29MKXFkksA9Og1csIsewehdqRDkf2f8qrfbVxuJ6qP
         4txw==
X-Gm-Message-State: APjAAAWYZyO5/zvdGjroMm9eLyfh0uvZV+GMvA5QbH+VFLJA2FSoyGso
        lQko7vBuxErMdivY+IrOpxkfk4eLVOwkiwzmTFk=
X-Google-Smtp-Source: APXvYqwLFeFGQF8h3s7yAJUe3dvZ36Vhfa4I7K/eB1Tom7vqrML7WA+lMKlmMrG1gLMhhQ0XU6Wdykfx4RhYWgFSvF8=
X-Received: by 2002:a2e:a311:: with SMTP id l17mr3989521lje.214.1561673795009;
 Thu, 27 Jun 2019 15:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190625203945.28081-1-ezequiel@collabora.com>
 <1561535121.4870.1.camel@pengutronix.de> <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
 <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com> <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
 <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com> <1561624997.4216.11.camel@pengutronix.de>
 <CAOMZO5D1Lq7MuK55hydP3JNGki71iNeubzfUgAvVhEDuzDcZFA@mail.gmail.com>
 <1561640172.4216.16.camel@pengutronix.de> <143cb82ff2ff5c5f389109def45ee47b9ad076d8.camel@collabora.com>
In-Reply-To: <143cb82ff2ff5c5f389109def45ee47b9ad076d8.camel@collabora.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 27 Jun 2019 19:16:24 -0300
Message-ID: <CAOMZO5Bg=CsJEv65k4Ou_YCQCE3FyrZ=TpYe5+c9HQf=RSynJg@mail.gmail.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state times-out
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 27, 2019 at 3:45 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:

> I think Philipp's suggestions looks very good, both the text and keeping
> the phy state. I think both should be kept in the warning.
>
> Fabio: feel free to submit a v2, or let me know so I'll add it to my TODO.

I have just sent a v2 with Philipp's suggestions. Thanks

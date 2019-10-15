Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B11D7C23
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 18:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbfJOQmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 12:42:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40541 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbfJOQmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 12:42:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so15029054lfa.7
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pPGgbetN9y4HWi95L4g93rVrKpMuR+OafA5CsALFhHg=;
        b=ow4FycmTCP9z7+2MJLGV5P5iLJuP4gAVdmHH63XuXjA41gVHJCKyXScOlVF3+PUGW4
         gmetnQJY+Ll5g+/xyzPwA9rU22qs+sA2RSWgnBEUJAish4KFTd7XqNqDx6dsxj2m2yDO
         M6b24qSj6dbZRkaHacFEJfhgSmBg4kDLhPw0EGfEZNMRMadRY6yuf00XQMiZkUPd2eSO
         I4v9F/BVLhcoxCvuujfBjHdyhGdj4qf6BpKczNaceKixwaa7xYZ4XKBeb7NsyIL63CmR
         rtIMPOAu0Hy8QzuhqwEbFuyWHCmNT0J0gPm4UoONDXgSa9KPekpx89KXcEjrvYAUfHfC
         43UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pPGgbetN9y4HWi95L4g93rVrKpMuR+OafA5CsALFhHg=;
        b=ixTrmIarvtOvRgLvXg9/BRDFu2pei9kCxIqZFQNe62Yk3LGBdKiCWlnewTdn4VHWKZ
         90EFXE3B56dRwj4pF5xeLqscxpzScCSJ0hgWRipMy6xYbHPGfjOBk9I6vHhWRm/9VsES
         rdjaLfPzT1YoBRA7Mg4tp2BHngPlDMUgbmJIIpeksSzkkPO4ShVHgJsWmrFA79m6MTv4
         eVDDsycMxxvTDQ7bdhBYWPhMiqw+r7VyKZXAwHvl0mEiytfyjb5aSfOHC9lkJ69Kmvjb
         N7nNwe5HCGYdl7gpMYe6vKFqH9nOf5OY2HnGz0LdFrRji5BUoP7j3o8VDwceDHq9553q
         /IjQ==
X-Gm-Message-State: APjAAAVecSHnB629oiO6jyrRDYKiaj16cbyZlSTqj8EM7uOKDkRZ/iF0
        sPEvzHubQMxvTjNJ5Rmzrz1xd1tVQaftZXJ3t2Y=
X-Google-Smtp-Source: APXvYqy+0iZbbgkMlM6yoDsyNPk4Ucdzd1MVV72Jd1JQsqPVdCpkbf/PpNM4/+gG8fcjFF4vR1YAAxoUm3VEeG8KGj8=
X-Received: by 2002:ac2:5468:: with SMTP id e8mr3089230lfn.12.1571157723521;
 Tue, 15 Oct 2019 09:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com> <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
 <CAJ+vNU2fJ_eGMwQH7-HmO_==5p3Uuscv6S2fG_NY67J2o8OG+g@mail.gmail.com>
 <CAOMZO5ABOV+Z7FenZykU82w-yUvae6zm6d6inN8SYrhViudYnA@mail.gmail.com>
 <CAJ+vNU22JmDQ+tyRFSQgM_wp-pgfE7gOt2i3QbdOJp0KuDXfRQ@mail.gmail.com>
 <CAOMZO5Dcv9fz=A8nTsvVsvu7+LNag2Sj03tJyFQKgpt_1B6Dwg@mail.gmail.com> <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
In-Reply-To: <CAJ+vNU1+oS1wFav4W2g0f6XGCP3oqEwzxyvrN3fkggNSBau0Tg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 15 Oct 2019 13:42:00 -0300
Message-ID: <CAOMZO5AMbAHmoYFLQbZbzBjMkmTsPkPctU-OqArPk3_PvtznjA@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 15, 2019 at 1:33 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Right, because this re-creates the initial issue. Upon any signal lock
> you would need to throw away the first few frames. I wish I knew the
> proper way to deal with this.

I thought this was handled by drivers/staging/media/imx/imx-media-fim.c

On imx6-sabreauto we do have the input capture pins configured in the
pinctrl entries, but I don't see any driver handling it.

Also, drivers/staging/media/imx/imx-media-fim.c driver has  a #ifdef
CONFIG_IMX_GPT_ICAP to deal with the input capture case, but such
config symbol does not exist in mainline.

It seems we still need the input capture support to be able to
measuring frame intervals.

Maybe Steve can shed some light on this?

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55ADA2E22F0
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 01:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgLXASq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 19:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbgLXASp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 19:18:45 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53206C06179C
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 16:18:05 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so1273873lff.9
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 16:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tGU0z0AqDDHU99JkAg/4X/GiVi4av+BXoNuTlysXGA=;
        b=Rm27h0qdQR26ng8W9ruC7ZGBjhwyLItCVFqmC9Syx67/4gphU6VwC84HAJ0amRCL0A
         smmDVEwuXSbcjwb0uQP7oRoOUMHKZsRms2reidN0ruliAoPFlA7AhRBrrvcMvQFYW1If
         1SC9ZJ/sXdPyo0yiDF91nq/1222Y0o/0F4P27KfmFbikoMqKCasxQpHq6DwrrtYxzu+v
         kkcQSKmux2uxQu28yHpivY3cdLRSHZM3gfzF34XEGe8RoPk6/bURp1L7y/OdhD1rUKhJ
         02WojIO/2nmT3M1B8W8pc7sdYRDuxrv/7rh961SJ8ek6DSI9+RM31YvGmoAHZyT0QKjX
         N+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tGU0z0AqDDHU99JkAg/4X/GiVi4av+BXoNuTlysXGA=;
        b=qeNoCnbRzzGV+EcSqyWWK0vZHXyx3L56bDidRucD5zRO1zCILgp/ciXGN9Y4XrHXY3
         LDhOCtS9kMywS6t9vD7WL/5h6/qxvLf/iasvKe8xnbK5Q5ILVzuFBTlSGAjxLcvY0gTD
         kJ2UdZOnLkddWQudaz9J0kCaZkwW+Mp4yhCaN6C1TRvKzONVIe+WESqRI/PhnsRtpOqf
         Kck53v5WQhk46PVE5cET0fqEiUuiZis6LxE8LhGqJsRhk+oeVVG2MRt9DcW/TBu0m1Ql
         sBTiAIVQtQJY5YXknNEvk822NE2Et8iB2EnnjKYVgbi+LF31vgAMKBqkggv+7QyaCjrv
         cKYQ==
X-Gm-Message-State: AOAM530K6EYyisTMwLVdghYKoj5zl2Ykumcmh7v+krZECaQw4QG7baaP
        G6LeY/wnTt+hiQLri3hKajlZnLRE7kDLI69n+ow=
X-Google-Smtp-Source: ABdhPJxEr335Ac/QtOyhzleanQPBp9uQSRloLamezFsp/F/Ph/UaMrXPD6knhS1sec6LdLdMXucUe3IeO/3bnU8JUS4=
X-Received: by 2002:ac2:5fe2:: with SMTP id s2mr12703553lfg.539.1608769083885;
 Wed, 23 Dec 2020 16:18:03 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0TxUVDoi--tB=5AOYzkXOwhBTQ4MyOgX6_Q515yXTM8g@mail.gmail.com>
In-Reply-To: <CAJ+vNU0TxUVDoi--tB=5AOYzkXOwhBTQ4MyOgX6_Q515yXTM8g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 23 Dec 2020 21:17:52 -0300
Message-ID: <CAOMZO5DZq9tX-UBP5XWNTZfTLq__A5fOxX03vGcS14YWm6i+Qw@mail.gmail.com>
Subject: Re: ADV7280 capture
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

I missed one comment:

On Wed, Dec 23, 2020 at 7:43 PM Tim Harvey <tharvey@gateworks.com> wrote:

> I have found that using the adv7280 on an imx6q/dl does not work
> without a patch [1] to make the output format of the adv7280 the same
> as the adv7180. I'm not sure what the best solution for this issue is
> as the patch was nak'd because it may break existing users of the
> adv7280. I suspect perhaps the best approach is to add a kernel module
> parameter or device-tree property to configure the adv7280 for
> compatibility with the imx6 CSI.

Yes, a devicetree property may be a good approach to avoid potential
regressions.

In case you submit a patch for this, please keep me in Cc.

Thanks

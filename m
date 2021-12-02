Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D17466C20
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 23:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349230AbhLBWaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 17:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347710AbhLBWaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 17:30:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EE3C06174A;
        Thu,  2 Dec 2021 14:26:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E7AD6287B;
        Thu,  2 Dec 2021 22:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C62C53FD0;
        Thu,  2 Dec 2021 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638483997;
        bh=zQx+WdlBrJgBh2cJE7Bq426KrPt/zTwWTF6cGfFrebM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bfPYX+MT6aOEdjrrjYpbkAnO7WnUh22+3EXaQesYApYexZ1iTMg7o14EcJh0Byow0
         +fzUPP8kvcMu5wDebFS1N8JOWGqCy5YfCHUazwGHtepv+RVBLLfWUJjipbzEgQlkXP
         IweixgIKDV+aFfszhk461Xrk3u4brHrclvLf5SQRHi4enq7Zm4Yt/Y0KoHzPAI83SB
         ARGswPgXCQ01sjk+xolkl/RpWW8xWuTzQZydQK809iBz0K+4DVz/tKmmJE46oYyjpj
         1+Rvnqlg0vtNeD/cjpy2YBe9gSR3tIZSwILikbzlTR73JFLQdaCNVHNVvCoxQOzjBa
         CG98V8+RQtNgQ==
Received: by mail-ed1-f47.google.com with SMTP id x6so3813920edr.5;
        Thu, 02 Dec 2021 14:26:36 -0800 (PST)
X-Gm-Message-State: AOAM530SF3W0Z3iWNqcO91j5mxZE0jPnJUjB4CuzL5PPjWg8qhgJXyeb
        ieiTNS4bMEvAzeZmOmMqWZ5G24U9Boqv5Ql4YA==
X-Google-Smtp-Source: ABdhPJyC2mORvUROF+LKm5s99fEZ92LrBwn6zLKgLCzPI2yFZ2AdzG1rZnvgdOzKgmJgJ+JGkDDFroOuAzoik+CQDKw=
X-Received: by 2002:a05:6402:35ce:: with SMTP id z14mr21111049edc.197.1638483995372;
 Thu, 02 Dec 2021 14:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20211202023021.3655384-1-robh@kernel.org> <Yak1NLz2/X3TfeUM@pendragon.ideasonboard.com>
In-Reply-To: <Yak1NLz2/X3TfeUM@pendragon.ideasonboard.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 2 Dec 2021 16:26:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+u=Hr8_2WdqDEnu+wT8zZjngepY1-JqTrt7pazGFCTpQ@mail.gmail.com>
Message-ID: <CAL_Jsq+u=Hr8_2WdqDEnu+wT8zZjngepY1-JqTrt7pazGFCTpQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then schema
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 2, 2021 at 3:06 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Wed, Dec 01, 2021 at 08:30:21PM -0600, Rob Herring wrote:
> > The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> > different level than 'data-lanes'. To make it work, the if/then schema
> > would have to be moved to the top level and then whole hierarchy of
> > nodes down to 'data-lanes' created. I don't think it is worth the
> > complexity to do that, so let's just drop it.
>
> Fair enough, but then shouldn't there be a comment in the data-lanes
> property to tell that i.MX7 only supports up to 2 data lanes ?

I'll add this to data-lanes:

description: Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.

I assume it is 1 or 2 and not only 2, right?

Rob

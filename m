Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21C2C67DC84
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 04:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbjA0DFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 22:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjA0DFO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 22:05:14 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05C638EAE
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 19:05:12 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id g23so3678775plq.12
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 19:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vT0/lrO1jq/UL+ydvKYCy3HfVjsExBI/xAcYAauKzC0=;
        b=MeoeQHCLPQXMYzewJ3lvlQANtD5FY8F7mXjyAuJHssKxrIs+hlkZsTREm0uZvnUojy
         0ITXE5YDqixrmqVoqZ93h4xqKedIeR+Tl3J75dba/lWlVCjrepzFMdjCLq5nXFZ2BOGu
         Ak+d8hk4NeeW28jz3qEV5k6fDBgQOtIJIw+k7lTmj7PBmrrhjEbapfFx4RI304nu0oBY
         iv8xlhAofOopD3tqW8KuE/pJ0hGMvhE1p+1hXyOjd3kTkgBzwVtzz8uAQGfidNo+veV4
         lw07INFgZKyQaoYnpkvjN2TtJhJCsm9udgJADTioyI1eQ/HxPGt+kz8MUFP1w5gyrylT
         N6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vT0/lrO1jq/UL+ydvKYCy3HfVjsExBI/xAcYAauKzC0=;
        b=FSFEdxCqpSvfaadKLpKjzzQl/AoNskBIP4DgsbK6MDciCxDVjm4HUAvJJDb+8pEzb/
         c9HSgJ+aEchqj+0zIvVdZrjJTWPvBaOiXa8eLQd31HfMZH+PZn5t5f2IfSdEcJPNPumP
         kw9wUKgdE51yngc7dZCQzQdLRNiLJL1/8L5d6cJOT9ZC5nRkVwmE+Ge69xJrGj3c4Wze
         eGyg9nEvUCI8A8MfS0GlHA0KoV5RL9Us1VPJl1NkupVhTZYt+s+QRAtv6a2XT2bWLarq
         pPyeHLg9MslxEWghTo5A2kIirg+W5GwD+xwa+iCnSkv9JVIlJiNALU2CuywJFaFeB9G+
         hTGw==
X-Gm-Message-State: AFqh2krMIfdCFFKjv9iwVA3QiFWkExawaTDmCmScxsGk+NHx/fxNtRBZ
        L6932fQEYZ+EPJPJW3AuCZN9n9sDvEYx+6QQ/1k=
X-Google-Smtp-Source: AMrXdXtRpD/IooPVePeHWUPFhbGxod5C1fFHSaKVmmM1yTlkgSl5/9/G84hLyIoVdjwEUrxqLgmrvo1smis1UHjHzRY=
X-Received: by 2002:a17:90a:31c2:b0:22b:b19e:9feb with SMTP id
 j2-20020a17090a31c200b0022bb19e9febmr3518725pjf.5.1674788712128; Thu, 26 Jan
 2023 19:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20230126213437.20796-1-laurent.pinchart@ideasonboard.com>
 <CAHCN7xL9ybGtr1CXOjqv2cc6u1p+1QuM5akp809iLm2S3w8gqA@mail.gmail.com> <Y9M3C5+LcbAxq7Sv@pendragon.ideasonboard.com>
In-Reply-To: <Y9M3C5+LcbAxq7Sv@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 21:05:00 -0600
Message-ID: <CAHCN7xKvBGNoMFTTZdSc--7b-GO2uhoxXCb0mi-+pNQvqRqnBA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] media: imx-mipi-csis: Move to subdev active state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 8:29 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Thu, Jan 26, 2023 at 07:54:10PM -0600, Adam Ford wrote:
> > On Thu, Jan 26, 2023 at 3:34 PM Laurent Pinchart wrote:
> > >
> > > Hello,
> > >
> > > This small series moves the imx-mipi-csis driver to use the subdev
> > > active state. Patches 1/5 to 3/5 are small preparatory cleanups, with
> > > the main change in 4/5. Patch 5/5 is further cleanup that could have
> > > been included in 4/5, but that should be easier to review as a separate
> > > patch.
> > >
> > > The series has been tested on the i.MX8MP with the ISI, and IMX296 and
> > > IMX327 camera sensors.
> >
> > I didn't notice any overall change in the CSIS capture on the imx8mn.
> > I can test the Mini if you want.
>
> That would be great. Would you be able to test it in conjunction with
> the similar imx7-media-csi series I've just sent ([1]) ? I expect a
> possible lockdep warning if this series is applied with the
> corresponding change in imx7-media-csi, but together they should be
> fine.

I am working on figuring out why my mini doesn't boot, but I've
already taken the CSIS series and the imx7-media-csi series and
applied them to my working branch.  I'll report my findings as soon as
I can get it booting.

adam
>
> [1] https://lore.kernel.org/linux-media/20230127022715.27234-1-laurent.pinchart@ideasonboard.com
>
> > For the series:
> > Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon
> >
> > > Laurent Pinchart (5):
> > >   media: imx-mipi-csis: Rename error labels with 'err_' prefix
> > >   media: imx-mipi-csis: Don't take lock in runtime PM handlers
> > >   media: imx-mipi-csis: Pass format explicitly to internal functions
> > >   media: imx-mipi-csis: Use V4L2 subdev active state
> > >   media: imx-mipi-csis: Implement .init_cfg() using .set_fmt()
> > >
> > >  drivers/media/platform/nxp/imx-mipi-csis.c | 249 +++++++++------------
> > >  1 file changed, 103 insertions(+), 146 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart

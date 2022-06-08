Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9D354275A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 09:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiFHG5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 02:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241162AbiFHGIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 02:08:00 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F217027D0DC
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 22:14:37 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b12so10480134ljq.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 22:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bI3pjUX61HIjlE9EDKtVn/+ZY8Oklzx5uYfG3j54Ctg=;
        b=ItlQHtgo1SPZEOV4fqq5W8b1pJHAtEDecG56LCE0fym70JGTPzhHkbFG5drGmTBxh0
         MNj372egP66sz2Zwbfya70bN0TQLuLnVZn0u9YArGzbGUeFEyJ8NY9+5VLRQPjNKTv0c
         DcIBMWG0iBfhIyve7OUbXIIpykIr2Uy6eI/07voNYdTvlwcGxI1yO7qeq+7FAoYDvZkM
         jq7PXUR+B85+xdu5H03gqheBFSOZnOau4+8McVEY4K2YKYjBElFBVlR9YuksboJYpEpt
         zE2nprxPsk0wXD5OBDcUN5jjw616B8sekTJo7eyT7mIdAEwz704r28YkhqD58jMQRFzp
         0ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bI3pjUX61HIjlE9EDKtVn/+ZY8Oklzx5uYfG3j54Ctg=;
        b=oqGq1CutvNbSp6BetCyTZoQesadNY3hUCmhpUs7Q+NU3kQ55ZV01U/76/M2m+SXWFP
         2qoQZB4y6pM6HQ9ZmH5+iiwLX/oE8hC56TXey99xCeYY4f2SpXWBjKz7QxmZeDdik3zx
         W+3lnFs1KTE8DyETtKb+9YE7R2V/wHqJSJoXLiQ/4vNGpx3+LT8VHVz/m5NlZ0xRHCg3
         9QHaEx0JeSrhguLq1kgYaJZqkLdU408tYkdviq1zyQVRoiBBc9Uo9ms/IuVoxTUrCfPK
         S7pJmPpbsWblz/z9PZDam5R6338uotVtzciu5ZzylagIv0c/EvujoH2zmmAhvTKTmVDi
         ONew==
X-Gm-Message-State: AOAM532lfz2ODrIrKamsutk/q7GMH/93+GTWwPoP2wQwvZPc7GWgDjo1
        YwfcKyeeqVeqhx/cokXhn5MeppuJpW+8yXdRmGBwEjiw9OQ=
X-Google-Smtp-Source: ABdhPJxRjLrZtDO9tRhj33sNJzbpOmkLibb0G/BjKuQ8ReF7qPpvq5Ual/jLdeCA4WoXFwDDQTSkm/etSOp8mPFpNEM=
X-Received: by 2002:a2e:86c3:0:b0:255:ad78:5359 with SMTP id
 n3-20020a2e86c3000000b00255ad785359mr3571534ljj.116.1654665136173; Tue, 07
 Jun 2022 22:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok_DvJo7KM4YSsT2s3SAzDQdSy-8HrQoky6zH5YE4sGypw@mail.gmail.com>
 <165463780248.186364.12552426317591956823@Monstersaurus>
In-Reply-To: <165463780248.186364.12552426317591956823@Monstersaurus>
From:   Karthik Poduval <karthik.poduval@gmail.com>
Date:   Tue, 7 Jun 2022 22:12:04 -0700
Message-ID: <CAFP0Ok9hJ3x4xUXJSm1iZGzfHcjDWcvrOpkAoLy+bhXQNK-EPg@mail.gmail.com>
Subject: Re: Attaching an I2C VCM subdev (media entity) to media pipeline
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Daniel and Kieran,

Will take a look at the ancillary links and try to backport.

--
Regards,
Karthik Poduval

On Tue, Jun 7, 2022 at 2:36 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Hi Karthik,
>
> Quoting Karthik Poduval (2022-06-07 18:29:23)
> > Hi All,
> >
> > I had a question about VCM subdev (media entity). The  example VCM
> > drivers have no pads. How do we attach them to the image sensor subdev
> > in the pipeline ?
>
> This requires a bit of support that was added fairly recently for
> managing non-data links between subdevices. This was added through the
> use of 'ancillary links' which can connect a sensor and a VCM.
>
> It should be handled automatically if you're on the latest kernel
> version, but if not you would perhaps need to back-port the
> implementation. I believe it's handled automatically through the async
> subdevice notifier systems.
>
> > --
> > Regards,
> > Karthik Poduval
>
> --
> Kieran



-- 
Regards,
Karthik Poduval

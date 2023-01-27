Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99E6767DC56
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 03:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjA0Clb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 21:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjA0Cla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 21:41:30 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F53539AE
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:41:29 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso7266381pjj.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 18:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsjVfeQ/aadnng9+U3z1HMmN7QmlCt1RoDvnfgHXm0M=;
        b=HRmWrHLQEgyNj9PBK+RJdfMLZHGZW5IFDIkH/p+ZkYEa92/pjZ5gSN5FlqaUcAsUNv
         b5HnWzhMQ4gXuL1UmOXzKgXCKwR36ajL2gn4QAf5YYAozrv6HD23C4kQsOwenlDOkRDI
         dH0UJGra6dps+OtB94YH0467+93hpklfV9AI5qKT6MjoSGYi77hkGk8Zu3bmHUdEfDcv
         RzEeJzgMGca2cHwd4zO+B/tzGE21n2HDpqHmggT3XNd3Us+a3mz7p7vgLLq46kozyjou
         G8mxZcbgAYNGNfgs9SLZMYOGetxBb2fvCuc8yhMdjoWQXOkvam4XittdrkqkMhtYUaYz
         yRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsjVfeQ/aadnng9+U3z1HMmN7QmlCt1RoDvnfgHXm0M=;
        b=IXjBBEq/G9lMrHsJol407p3Om6z0KuNahk89jru5fV5DRVFqe2dPuOCKFyBdTnRSDE
         myfT/F9PAXLU9vitcETejnd1fdu3dBkV9yvFG/4IDunSaX/s+JoAWLArzm/czEuFMzeU
         VIBp0TxH1r9GoaRl7JUA7krNpwOlvJAhTshNgNraduQ5KmNjXV2Hi6JbpYo6FfIK4EGK
         Oh1UEPpDH/HwzJNOFjcT93v78e3PjBHyZEGibcPjOFfxM1aa5Y6s0lE52l6Hma/SlYr6
         nUSvIjeFxNxXJSasp/jYB6DnMk+iMRiupF7qIDcvIFSIzTGPcgFocZDfj9E2NxF3LKan
         vLzQ==
X-Gm-Message-State: AFqh2kqlvom8KND+U8uaHWhlQtp8fPf7kkHc/xiz154sY6DL311zUz4N
        dQFyOgaFkoGsqQ6boqrylTXKoONGVcjGIsCmBuc=
X-Google-Smtp-Source: AMrXdXuYDgrTBedQ2N6/QTkzwc47YAkP6OhSMfbc80PosQ6Eos98O/DHCq0468EOrCMKhsBhJAUavg2qDBu5efAJI9Y=
X-Received: by 2002:a17:90a:5297:b0:22b:3526:98d4 with SMTP id
 w23-20020a17090a529700b0022b352698d4mr3986838pjh.42.1674787288543; Thu, 26
 Jan 2023 18:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230127022715.27234-1-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 20:41:17 -0600
Message-ID: <CAHCN7xKGfP81qvM_8rH299+HH_sj4dfhHODzG_Wf7eQWQjRhVA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] media: nxp: imx7-media-csi: Move to subdev active state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
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

On Thu, Jan 26, 2023 at 8:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This small series moves the imx7-mipi-csi driver to use the subdev
> active state. Patches 1/6 to 5/6 are small preparatory cleanups, with
> the main change in 6/6.
>
> I haven't tested the series yet as I need to dig up the hardware first.
> Adam, you offered to test the similar imx-mipi-csis series I've sent
> recently on the i.MX8MM, would you be able to test this one at the same
> time ?

Yes.  I'll try to do it tonight and get you feedback.  I'm out of town
for the next few days, so if I don't respond to follow up stuff right
away, it's because I am away.

adam
>
> Laurent Pinchart (6):
>   media: imx: imx7-media-csi: Drop imx7_csi.cc field
>   media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()
>   media: imx: imx7-media-csi: Drop unneeded check when starting
>     streaming
>   media: imx: imx7-media-csi: Drop unneeded src_sd check
>   media: imx: imx7-media-csi: Drop unneeded pad checks
>   media: imx: imx7-media-csi: Use V4L2 subdev active state
>
>  drivers/media/platform/nxp/imx7-media-csi.c | 208 ++++++--------------
>  1 file changed, 58 insertions(+), 150 deletions(-)
>
>
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> --
> Regards,
>
> Laurent Pinchart
>

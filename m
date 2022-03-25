Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9494E7835
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 16:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346984AbiCYPpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 11:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376771AbiCYPmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 11:42:55 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9014D63D
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:37:37 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id yy13so16153850ejb.2
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sVXyeJLQaPleAsE4xWQz3np+Niuze6dxAZHYr1Wct+4=;
        b=A5/97bwfYRjPIVOIqkBxzsjhMzQ/rGlnKClHV1xmnO+2gq/7tb5w5ttE0wyxwwLCla
         V/qm1YR+Qk36qFn9QaJJvOUIcMLK70S8laRhwQZrkeqcLFGhSkoAfAw3/A4h5S/AoA0g
         6h00Lhno6VPvPos4VDhS4HeBErO1zCp82DH58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sVXyeJLQaPleAsE4xWQz3np+Niuze6dxAZHYr1Wct+4=;
        b=U9uHLT2kN3bynj8fcKpU51IHkqOlhM+swZtcLvErblDMQzmU6NrKaTTxVFkCzkCIqX
         8TzXcNJ2n5/cTFSpQc1WShnDZKJugs8kWqHNRC1nDUQQuA1UGKogwgAIZHFrjYgtJaOc
         BIj0TV256x1R3/rfuLgi9S/5FrVQCwLwEeW2er49kbQyYhkSvAF3h0cANeD0BDkBdaC0
         oXBS0o6l2ooRY4N4SQcmtecHOwUaeb/1DaGCgES7nWAg3mAiQvUfjGy/CSbxPZqvIeQh
         uvevp55WtWx7GrX8HsEa+ZezIqdjUASX4107n1XZsg5e48k9iHiEk+EhLrc1B6CugAA6
         JLig==
X-Gm-Message-State: AOAM533BjRwcxCPGrK/0KepH+dMK7S7ZavtSYTBBL9j9zcytcqWJAY3K
        h17fTWXSnAVe+8RtivJrF/uKKLcg939DAOC5
X-Google-Smtp-Source: ABdhPJwa9iWjBzk44ze5TzeJbpVJgrBLxN2ROUYMja+TCNtKdjeV9enUACTb9sc2RVdkaF7/x7WKQw==
X-Received: by 2002:a17:906:9acd:b0:6e0:b74d:d932 with SMTP id ah13-20020a1709069acd00b006e0b74dd932mr2072653ejc.695.1648222653697;
        Fri, 25 Mar 2022 08:37:33 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id cn27-20020a0564020cbb00b00418b0c7fbbfsm3006598edb.32.2022.03.25.08.37.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 08:37:32 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id o10so16175415ejd.1
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:37:32 -0700 (PDT)
X-Received: by 2002:a17:906:58d2:b0:6da:b635:fbf3 with SMTP id
 e18-20020a17090658d200b006dab635fbf3mr11889111ejs.40.1648222652438; Fri, 25
 Mar 2022 08:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220325022337.10893-1-hbh25y@gmail.com>
In-Reply-To: <20220325022337.10893-1-hbh25y@gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 25 Mar 2022 16:37:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCuprLdo0i2VE3Vhe=t9cSYwW_Czvyyps=nOqLmrWn_uJA@mail.gmail.com>
Message-ID: <CANiDSCuprLdo0i2VE3Vhe=t9cSYwW_Czvyyps=nOqLmrWn_uJA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvc_video: fix bit overflow in uvc_probe_video
To:     Hangyu Hua <hbh25y@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 25 Mar 2022 at 16:34, Hangyu Hua <hbh25y@gmail.com> wrote:
>
> probe->dwMaxPayloadTransferSize is a 32bit value, but bandwidth is 16bit. This
> may lead to a bit overflow.
>
> Fix this by using probe->dwMaxPayloadTransferSize directly.
>
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>
> v2:
> Use probe->dwMaxPayloadTransferSize directly instead of changing temporary
> variable.
>
>  drivers/media/usb/uvc/uvc_video.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 1b4cc934109e..e016f88bdf96 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -383,7 +383,6 @@ int uvc_probe_video(struct uvc_streaming *stream,
>         struct uvc_streaming_control *probe)
>  {
>         struct uvc_streaming_control probe_min, probe_max;
> -       u16 bandwidth;
>         unsigned int i;
>         int ret;
>
> @@ -421,8 +420,7 @@ int uvc_probe_video(struct uvc_streaming *stream,
>                 if (stream->intf->num_altsetting == 1)
>                         break;
>
> -               bandwidth = probe->dwMaxPayloadTransferSize;
> -               if (bandwidth <= stream->maxpsize)
> +               if (probe->dwMaxPayloadTransferSize <= stream->maxpsize)
>                         break;
>
>                 if (stream->dev->quirks & UVC_QUIRK_PROBE_MINMAX) {
> --
> 2.25.1
>


-- 
Ricardo Ribalda

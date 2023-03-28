Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC686CB890
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 09:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbjC1HsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 03:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjC1HsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 03:48:12 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D78B6
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:48:09 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso1161429pjf.0
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679989688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HG90Us6kSgXbApTDMZ5qioRXvW4++2M+woUU+FFULOI=;
        b=Un4c02Dob82MV08zaJn1iW/4dbQKegHP4e+iNQ1TqHy3AHnUj3Ih30keWPKysSTpjt
         RfanuwO1TOMfge5yLxhsDkHJPwEgfHMxQdJqZxCf84kpFLD2FnTUpKjyhYWFmuDDtMOQ
         vOK80xFkhUWFF2xX2dZaxpXN1q4qmTrkuIAqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679989688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG90Us6kSgXbApTDMZ5qioRXvW4++2M+woUU+FFULOI=;
        b=tR3VFSJM0t8wQlCsNncoKnRWTBP+qwY7UulP1yUt84GKtI81qMB9v1ymlRHXw1nHdZ
         eclKnsGxIMzOzmaMfhfWtLJmOgA5F2HlqFHmR7B2gMdXXXdkXwVI8ayCV3vL5zCiKwq+
         3ERUK4zYn6aVnYg/kUl6DAv7iGImZNRpSI7mhLvdcmV0THHZkqG+o/9Lrvw2irzIKKfU
         b51WriUOUM+IksNul2LQlL9M7ffb+f+i3pvnv7cO4R4vzGGMHcT+V5pSy2LAYjhBjVTU
         qgMUOE0GLV0CR1JqVuUTUXqDE3kY/UrkzQACXwnGIzm63rRCnKF7D/uFNUpou/lmVk6Z
         Zo7Q==
X-Gm-Message-State: AAQBX9emdsjMKvqQrtTMbfYSvJ+rl+GZ3L+DwM+NwZ9TBVs1L1IvMDqZ
        6iV3DH0VoVFYF90oReez/+6vyGD1OwfvROxOiKealg==
X-Google-Smtp-Source: AKy350byxTn5MsRKr0jLMeEMawaF17u6wuYA50srX9DJRxsP6MDcHfV05RXCwaskNEHK8few2xXQJw==
X-Received: by 2002:a17:902:d101:b0:1a1:c671:8bc9 with SMTP id w1-20020a170902d10100b001a1c6718bc9mr11803994plw.7.1679989688464;
        Tue, 28 Mar 2023 00:48:08 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170903279800b0019ab3308554sm20446516plb.85.2023.03.28.00.48.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:48:08 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id d13so10089882pjh.0
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:48:07 -0700 (PDT)
X-Received: by 2002:a17:902:c20c:b0:19f:3cc1:e3be with SMTP id
 12-20020a170902c20c00b0019f3cc1e3bemr5289328pll.12.1679989687222; Tue, 28 Mar
 2023 00:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230325191656.GD9876@pendragon.ideasonboard.com>
In-Reply-To: <20230325191656.GD9876@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 28 Mar 2023 09:47:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCt_ViUp-LszTyLamxXs6Ddx6FSzzfRsdyy6RC4y-5Cqww@mail.gmail.com>
Message-ID: <CANiDSCt_ViUp-LszTyLamxXs6Ddx6FSzzfRsdyy6RC4y-5Cqww@mail.gmail.com>
Subject: Re: [GIT PULL FOR v6.4] uvcvideo fix
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Max Staudt <mstaudt@chromium.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Hi Laurent

Could you wait a bit before you take this one? I think we have found a
cleaner way to do this.

Thanks

On Sat, 25 Mar 2023 at 20:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Mauro,
>
> The following changes since commit 71937240a472ee551ac8de0e7429b9d49884a388:
>
>   media: ov2685: Select VIDEO_V4L2_SUBDEV_API (2023-03-20 16:32:18 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230325
>
> for you to fetch changes up to 1681706c6b8a15fbc0d037b97c0f5e9cf9af67cc:
>
>   media: uvcvideo: Cancel async worker earlier (2023-03-25 20:59:49 +0200)
>
> ----------------------------------------------------------------
> media: uvcvideo: Fix crash at disconnect time
>
> ----------------------------------------------------------------
> Guenter Roeck (1):
>       media: uvcvideo: Cancel async worker earlier
>
>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++----
>  drivers/media/usb/uvc/uvc_driver.c |  1 +
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 9 insertions(+), 4 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488AF276B40
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 09:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgIXHyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 03:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbgIXHyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 03:54:03 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946C9C0613D3
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 00:54:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u24so1427195pgi.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2020 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=RPuWg/Zi8RHa+kwBfQsi7axNjVEJO4+WTtZQHqVNItY=;
        b=HWjKPU22QzP2BtUZjqKqxZ9Cf/x8mUVRbD2u5iOG6na+mgTpDPqZtOp7sITfW09bXD
         j0/jPjpeTmMwwHDQNQsNLZcJKdE/+n+cdDfpl21IgEGOxTECzI7WcuT5I5kmLvgirHfU
         NyxGyGhORJCUf2onFVHLbrYh8V/dJP3r51VVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=RPuWg/Zi8RHa+kwBfQsi7axNjVEJO4+WTtZQHqVNItY=;
        b=Yb1rTSoLmK6bx2f7YpaWGmAc8Njjv6J2dxrJH5pLIRQ0gdhmMfalwiwzcf35tmQNyp
         e1XbLVCO7FXNfnWLZrN0QjuaMmrZr6+tdYjiOX9ofNsfjDRKvPtFtWeZ8ZPyPpVs2Wr0
         QcG/RnrE0IWW1pfj5o5n+TwTxDcBnNoDGXBC32XxNKsXe7KUXn1E4QdI3PBSzxG2L0w+
         JkiMc6b2lljn6ZkI398InAjRLKzGNUE4M18OWsbW8Tdamapyd3zJhY+BfAg5lw/H04Ic
         xuMTi3M5JIaiDEmjtBMUhOVRI5DOYD2Q24QtNqfLH6tSy6XHNCZTWguB8m/fOjAqhH6u
         OaaQ==
X-Gm-Message-State: AOAM531YrtV6vPFvhp+TPhnXWV+CvZimf+pfo1IxxfI2YWPz5NaSY3fD
        7v9nO/usTQ0qKOv7CKqzQ4fGegv2gsbWpQ==
X-Google-Smtp-Source: ABdhPJyP66ubOCUrnx65keDX9FYPv/7jPTHk7+HurXUWgkPIicgzHexJtkY/VT5eVfQmoL0w2VjAsg==
X-Received: by 2002:a62:3207:0:b029:142:6a8f:c40e with SMTP id y7-20020a6232070000b02901426a8fc40emr3255603pfy.69.1600934043151;
        Thu, 24 Sep 2020 00:54:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c186sm2083993pga.61.2020.09.24.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:54:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600930266-9668-3-git-send-email-mansur@codeaurora.org>
References: <1600930266-9668-1-git-send-email-mansur@codeaurora.org> <1600930266-9668-3-git-send-email-mansur@codeaurora.org>
Subject: Re: [PATCH v3 2/4] venus: core: vote for video-mem path
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 24 Sep 2020 00:54:01 -0700
Message-ID: <160093404143.310579.16661024956168032008@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-23 23:51:04)
> Currently video driver is voting for venus0-ebi path during buffer
> processing with an average bandwidth of all the instances and
> unvoting during session release.
>=20
> While video streaming when we try to do XO-SD using the command
> "echo mem > /sys/power/state command" , device is not entering
> to suspend state and from interconnect summary seeing votes for venus0-ebi
>=20
> Corrected this by voting for venus0-ebi path in venus_runtime_resume()
> and unvote during venus_runtime_suspend().
>=20
> Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
> Changes in v3:
> - Addressed review comments by Stephen Boyd

Please Cc me on patches I review.

>=20
>  drivers/media/platform/qcom/venus/core.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 52a3886..fa363b8 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -363,7 +363,18 @@ static __maybe_unused int venus_runtime_suspend(stru=
ct device *dev)
> =20
>         ret =3D icc_set_bw(core->cpucfg_path, 0, 0);
>         if (ret)
> -               return ret;
> +               goto err_cpucfg_path;
> +
> +       ret =3D icc_set_bw(core->video_path, 0, 0);
> +       if (ret)
> +               goto err_video_path;
> +
> +       return ret;
> +
> +err_video_path:
> +       icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
> +err_cpucfg_path:
> +       pm_ops->core_power(dev, POWER_ON);
> =20
>         return ret;
>  }
> @@ -374,6 +385,10 @@ static __maybe_unused int venus_runtime_resume(struc=
t device *dev)
>         const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>         int ret;
> =20
> +       ret =3D icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
> +       if (ret)
> +               return ret;
> +

Feels like this patch should come after the next one but OK.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

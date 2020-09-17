Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D48A26D4AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 09:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIQH0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 03:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIQH0i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 03:26:38 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AB5C061756
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:26:29 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y1so841854pgk.8
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=QKiwGjZuRbPs5OuXSsmyWtz3lA47Cqhg+wUU441z3TA=;
        b=ic40IGtzbHxbN5UK0Az6EE9Ua7p8uuhLG0h+5szO37/ipKKe2MdGQ9DlRmy3uKZx4p
         61H63Dk9hbgAl7I2HGzOYfHtKrFRjiyAy+QQToadWCn57fk8K4xWFY/jG0TrJ0Jl6QuP
         8azC+Nj0+zUnk3R1PsvCiJ0lbCfIc7cf7/6KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=QKiwGjZuRbPs5OuXSsmyWtz3lA47Cqhg+wUU441z3TA=;
        b=icQ2Ds9MIgRPjOUl88XbwSEQOL75Eh8EzmyK3EyrdlLTqduv6qThg8Az29KooVyec/
         QZIi2a/vP5OQEkgaZQRKBy+Rs5b6/CKwgPuKSewD/Zc0EH54EK5dJEwS/IsYUVVrEf2a
         e7htTLLtjuZzPLyN9SJTIOz95E1O05tdxuXJ1FXc4/DmKULt68XPNtGqUZjjcFoCIQ6W
         3WA4/dRoWd1hU1K27xA8TQnrbYGsld+uH5i+UeFLaVthTOs0aoSQ1SP5AOYDIsE5/amT
         VYsUtEtPik9S1G0ieTZegULeWxi8OMD6cPHdwpc64AB5ZhVI2pXeRMbogVbTMRKM5lj7
         IAIA==
X-Gm-Message-State: AOAM531fFEJHt01xBJL4Mo/YukbytJUvD0cl2uaK3/x4//TKSPU14CP0
        SYo394RXDyWHpdYDkwkaWAwgug==
X-Google-Smtp-Source: ABdhPJw+KMCHDw/4STXIxFyYhyzW+p+BoSU/AJ+cx71HeesTwcIO8MGLcIiqaVHwbrU27LBnWCP2zg==
X-Received: by 2002:a63:4d56:: with SMTP id n22mr20780917pgl.177.1600327589059;
        Thu, 17 Sep 2020 00:26:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id ge12sm4758469pjb.26.2020.09.17.00.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 00:26:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1600305963-7659-5-git-send-email-mansur@codeaurora.org>
References: <1600305963-7659-1-git-send-email-mansur@codeaurora.org> <1600305963-7659-5-git-send-email-mansur@codeaurora.org>
Subject: Re: [RESEND v2 4/4] venus: put dummy vote on video-mem path after last session release
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Date:   Thu, 17 Sep 2020 00:26:27 -0700
Message-ID: <160032758702.4188128.5484979798760048057@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Mansur Alisha Shaik (2020-09-16 18:26:03)
> As per current implementation, we are unvoting "videom-mem" path
> for last video session during vdec_session_release().
> While video playback when we try to suspend device, we see video clock
> warnings since votes are already removed during vdec_session_release().
>=20
> corrected this by putting dummy vote on "video-mem" after last video
> session release and unvoting it during suspend.
>=20
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---

Fixes tag? Should this be combined with an earlier change?

>  drivers/media/platform/qcom/venus/pm_helpers.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/med=
ia/platform/qcom/venus/pm_helpers.c
> index 57877ea..c0a3524 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -212,6 +212,9 @@ static int load_scale_bw(struct venus_core *core)
>         }
>         mutex_unlock(&core->lock);
> =20
> +       if (!total_avg && !total_peak)
> +               total_avg =3D kbps_to_icc(1000);

Can you add a comment in the code here? Just guessing but something
like..

	/*
	 * Keep bandwidth enabled here so that vdec_session_release()
	 * can disable clks without clks getting stuck. We'll drop the
	 * bandwidth request when this device is suspended so this is a
	 * low value to keep things on but not high power until the
	 * device is powered down.
	 */

> +
>         dev_dbg(core->dev, VDBGL "total: avg_bw: %u, peak_bw: %u\n",
>                 total_avg, total_peak);
>

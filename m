Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D773D45D86C
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350033AbhKYKwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 05:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349804AbhKYKuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 05:50:12 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A04C06175A
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:45:23 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so5449096pjb.1
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/ESPjVGUPDDo30B8VuCI6gV56PbhuBJRwwV9AI28ATE=;
        b=Y3JdQyESWFCs8JfjZXvJaa+pKvIfV6Phgmf75ulMpHhupqIYJazVhRtj6P1axiVZxR
         oIfA6R0gtG97AAm4/ZwaBaJ5sZHwqRIEccDO7F9okdR3qnL3qJ1RVTraopHDyUb+8rPg
         BlaxgGLlNsZxlUB6zbcxj1YQft4u23QalCG0wsdJvLmZs96oTdoF0o2tqZp6v8xkAxru
         utkuERweq8flYyHgtZJlmiaqQRj9OgzGREq7azqeBuWdiGl3kuXhNppveEQXvSkkbssG
         044APNHYi0b/AbMvwSMSgclOYKaPH7dPK3hO4jbAd9drvIB39hvYQFJ8MEQZb0WRKfSj
         PPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/ESPjVGUPDDo30B8VuCI6gV56PbhuBJRwwV9AI28ATE=;
        b=EbReqGebsH9IiuzIP6Bv7HGwI6aKsz8XWgBWSULzypZJNxsaUod2UFYRB7esqXTo7d
         V0yqxg+d54DoGnCcYJQRSaswIEvykbCPG0EZcI3OFL9GXDIUwVUtG5eNjr2PX7IbjTe0
         +SAJa3W+xWGcjZc5NRgaiZBcfvyi+PxIEYN7B7z2wy3IVx3K49imjSx5lJclpo6jar5Q
         GLMlwEgKyxyulfa6ItNjxXbLwP8iKe/tAz3wAc1L6+skKg4kVCrecT8x/M7tctvMEAq5
         1rqFhTUugwvaLaO46t9Y0qERSQyUNI6M2Vq/rsBP0FBbdthcvwMjVzMdds3zBUMg2Feb
         fcHQ==
X-Gm-Message-State: AOAM531WIVsO20yOx4sX/90GepmlO4xTCSHqq+wGS7ldmutiUdD4wDRO
        7kn4E4vH1v5KZaPp1C2ZjOBhDEpXRKDqZMgwLOyRMg==
X-Google-Smtp-Source: ABdhPJyzOnL0/CSFtcnYp2+xliUuEzvsm3p1YJ2slo9f+ZI1MfNeTLXUjTyB7Tq7fvbvYqzFpk6R5nFsI7WRyXEKuJ8=
X-Received: by 2002:a17:903:2004:b0:142:6344:2c08 with SMTP id
 s4-20020a170903200400b0014263442c08mr27759342pla.51.1637837122914; Thu, 25
 Nov 2021 02:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org> <20211124175921.1048375-20-bryan.odonoghue@linaro.org>
In-Reply-To: <20211124175921.1048375-20-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 25 Nov 2021 11:45:10 +0100
Message-ID: <CAG3jFyv5yZcgmYE0B=voN4KT=GzauKTaMpmnRwowmvdMbRiMTQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] media: camss: Apply vfe_get/vfe_put fix to SDM845
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mchehab@kernel.org, jgrahsl@snap.com, hfink@snap.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for submitting this!

On Wed, 24 Nov 2021 at 18:57, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Similar to the SM8250 the CSID relies on the VFE to be clocked prior to
> taking the CSID out of reset.
>
> Apply the same fixup to SDM845 as SM8250.
>
> Suggested-by: Robert Foss <robert.foss@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index e6835b92695b..32f82e471bae 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -159,10 +159,11 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>         struct camss *camss = csid->camss;
>         struct device *dev = camss->dev;
>         struct vfe_device *vfe = &camss->vfe[csid->id];
> +       u32 version = camss->version;
>         int ret;
>
>         if (on) {
> -               if (camss->version == CAMSS_8250) {
> +               if (version == CAMSS_8250 || version == CAMSS_845) {
>                         ret = vfe_get(vfe);
>                         if (ret < 0)
>                                 return ret;
> @@ -212,7 +213,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                 camss_disable_clocks(csid->nclocks, csid->clock);
>                 ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
>                 pm_runtime_put_sync(dev);
> -               if (camss->version == CAMSS_8250)
> +               if (version == CAMSS_8250 || version == CAMSS_845)
>                         vfe_put(vfe);
>         }
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

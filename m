Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEE95E60BB
	for <lists+linux-media@lfdr.de>; Thu, 22 Sep 2022 13:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiIVLQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 07:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiIVLQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 07:16:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F0CDED45
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 04:16:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m3so13026484eda.12
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Itm+uIf9T56vqPADmvToqfrF8YgqElcu89VEypMgdI4=;
        b=a3e1j6+QOUxZxiO53sdcUB269zmPRKhYqftnCbksCXon0a8Cvy/xeWiptAQ53Mn7tU
         NuTqlBmusQD6F6PfUC3jITupPzLwjN8TQj2SkUUrWN8XJ42t2DYN9feDtxhpsYB1Aot9
         5/eDWPGv8j++jxfYSmp40K3m8dG8dtGUL2H2lGV5LV6A4yHoRgbNUVWkYBOpFlSME6sU
         qDV+dO9O/uEyUwmLcVglMdydJHD4e8YRIU4H+mC4/Ps4RZMR8ZD2LMmW18Voi06FP1sA
         a2S6UAIqupdL7gET+jpUNtIDsWjJUrkjhDYvfKzM0Q2aWp0wRFSxcVprDht5pe/pbD6s
         H+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Itm+uIf9T56vqPADmvToqfrF8YgqElcu89VEypMgdI4=;
        b=OqcAT1WnK86GVotFuDr7T8C0T/gGe6f5vSRiXzFQvJos7BqgvXQDPR8/OGk3G4gTEm
         166R+N/VWfAdWYwDlM27jBBvT6Z9H+YQjqcMtQelPoDV+RkMnla5+O4Lladl8VkoAqQj
         Xzkr/rTsgjUH4C9zQIAXCiOu6bXtf/NFOHR22VoSyW1t8m5UKk8bTbOs92powtsP+k46
         fArKJ9GsEqtDynot/oMcH4+fOosQviEMag3Ux1O49r60PnPrVD/Jb697w9AMnGvNwHDA
         ZhSFd961brrV31LFrQxAq/+Wisun9003VfaNsnn6+Fy8DWl4lzpBdOmQPjGWYIl4waRf
         U/6w==
X-Gm-Message-State: ACrzQf3bdmtTKRA1gw4bXbVpZJ/qZEZkM3Hp0Xl8BQgj61dC3qbLDvdd
        S6iU4T/v8C0o+87Wfsprp/+mFMLRkvyVjN3GLSxv+w==
X-Google-Smtp-Source: AMsMyM6Ak0c8ZalGghxnd73V8iCWUl6A+NJ9NaYLdYWa3aFbRzFzfOunBFqkXzqFDCl09WwrYkyX4lNhhShiPWLcTLo=
X-Received: by 2002:a05:6402:1909:b0:451:ace7:ccbd with SMTP id
 e9-20020a056402190900b00451ace7ccbdmr2698529edz.276.1663845385188; Thu, 22
 Sep 2022 04:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220922104225.1375331-1-bryan.odonoghue@linaro.org> <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
In-Reply-To: <20220922104225.1375331-4-bryan.odonoghue@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 22 Sep 2022 12:16:11 +0100
Message-ID: <CAPY8ntAAcbv0myL3F-OOOH_rUUF7q==DQFq1sCaYAY=+JapgcA@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND 3/3] media: i2c: imx412: Add new compatible strings
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brian

On Thu, 22 Sept 2022 at 11:43, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The Sony imx477 and imx577 use the same silicon enabling reference code
> from Sony in the available examples provided as the imx412.
>
> Add in compatible strings to differentiate the parts.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 9f854a1a4c2f..93f362e3b132 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1288,6 +1288,8 @@ static const struct dev_pm_ops imx412_pm_ops = {
>
>  static const struct of_device_id imx412_of_match[] = {
>         { .compatible = "sony,imx412", .data = "imx412" },
> +       { .compatible = "sony,imx477", .data = "imx477" },

IMX477 isn't compatible with this driver at present - it has 0x0477 in
REG_ID (0x0016) instead of the 0x0577 that this driver looks for. The
driver therefore won't probe. (I don't think I've missed a patch
removing the ID check).

I know you state in your cover letter:
  I think we have established that imx477 and imx577 do have additional
  settings and modes over the imx412 which, we can and hopefully will add
  in as time goes by. What we have upstream will work for all three parts.

It may *eventually* work for all three parts, but isn't the time to
add the compatible string at the point where it is actually compatible
with the driver?

If you're adding in broken compatible strings then, as previously
mentioned, imx378 is also in the same family IIRC it streams with the
base imx477 registers but with some IQ issues. It reports 0x0378 in
REG_ID.

  Dave

> +       { .compatible = "sony,imx577", .data = "imx577" },
>         { }
>  };
>
> --
> 2.34.1
>

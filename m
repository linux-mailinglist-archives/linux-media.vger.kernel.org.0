Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0B0409DA3
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 22:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242079AbhIMUEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 16:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbhIMUEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 16:04:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4DAC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 13:03:19 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id g14so19390526ljk.5
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W3R9LIOQg9i4JfvJecY6HJIp8+PHficrJsTLPV7aoU8=;
        b=RRDiQDV/o9vJJOhElG3+/k340zyb+BOn2SIc3TYZUAEd3eSsQs7BWS+JCm0Itpelru
         MDEYCqsiqNwXVSS+cA3CN/YKpQbQcsi3YrO2ZUw13VHOimgIxlzkTUnknsG/dN9E+27z
         3hr/bCCQBl4HslPMqPM+ELeoUa/Zc/EN7yvslyFPC2nY7e2Ck2YgEvQ+PryjCW0zhZZv
         /xbjuqjm6VLTTsfGsMHtwYtb2GeEiSrDTCudh1qmHG76Bj6/jrpP+Dnz9IYY/WTN6l5O
         3TFkQjBZUeKW5G53bCxdPFu70c1/k/6R6hkcIZYzWRao/byuVC5BiPPboZs/SJUt6GXv
         BruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W3R9LIOQg9i4JfvJecY6HJIp8+PHficrJsTLPV7aoU8=;
        b=D5Fs0I4R5HDgwRWelFrUddxBczjC/ubddQUVIqUqfkv4FlKirrZ+e9+iqWJuMLqqik
         5MndZkKRypyn+SLgkC/i7+pTV37Pa2zhV/PQbHELK5Rhx/lXiMop4chnzy/ClIkZEXTT
         2gGueXZQEDbYEsSmzRv9liPC49OZN2ROczHnmYRqnRBOAbncKAu6gFBHvyyd+39TMW1h
         beVTW/jY4ixDOrnRSemn++ZzrQI10Lrfqi07p/bjlEJoTZkAfFRza++dkgx76bXyMluj
         W8qYoPAFoCXxOCqFqKLPjl50rlDo08uGcLpcN3Afq5P0AVuNuJzJx15hyhTuae154HOM
         5K0A==
X-Gm-Message-State: AOAM531bvyDU3xcTqVvUnV90+qVM44/7KIyIjlEirLr9hmPhProqLsaS
        6JQlEwhPdY9jCR00uIR1OVU9tRye8RoGfeYW56g=
X-Google-Smtp-Source: ABdhPJx7I2RRGM7AcDoPRVTrS4RxOnPww97Vp5F1FlP12kvNhBpnwWrYqWMKT5ebUSLoYvgP6C7DqXxnsvHXjwYn54I=
X-Received: by 2002:a2e:8014:: with SMTP id j20mr12053477ljg.228.1631563397696;
 Mon, 13 Sep 2021 13:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130150.909695-1-festevam@gmail.com> <20210913085942.zmhv5pmo5nzqunuj@uno.localdomain>
 <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
In-Reply-To: <CAOMZO5B-BRfuPoGFyYQk4HdwaX45zxL9=gKTXKDHSxNwBDO-2g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 13 Sep 2021 17:03:05 -0300
Message-ID: <CAOMZO5BzK5VtRUn7rqb+b84HoyiDy34e35aJ196J0TpCvL4vtA@mail.gmail.com>
Subject: Re: [RFC 1/3] media: tw9910: Allow to probe from device tree
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rui.silva@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 13, 2021 at 9:53 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jacopo,
>
> On Mon, Sep 13, 2021 at 5:58 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> > There's an
> >
> >         tw9910_s_power(&priv->subdev, 0);
> >
> > at the end of the video_probe() function.
> >
> > The driver handles power management with the legacy s_power() call
> > chain, and the receiver driver needs to v4l2_pipeline_pm_get() which
> > the imx driver does when the capture node is open.
> >
> > Just an hint, you might have noticed already
>
> Thanks for your comments and review. Yes, I have fixed the I2C errors.
>
> I plan to re-submit the entire series after I get the TW9990 to work
> on my imx6sx-based board.
>
> The capture driver is drivers/staging/media/imx/imx7-media-csi.c.
>
> Currently, I am not able to get the stream to start.
>
> This is the configuration I am using:
>
> media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x480 field:any]"
> Opening media device /dev/media0
> Enumerating entities
> Found 3 entities
> Enumerating pads and links
> Setting up format UYVY8_2X8 720x480 on pad tw9910 2-0044/0
> Format set: UYVY8_2X8 720x480
> Setting up format UYVY8_2X8 720x480 on pad csi/0
> Format set: UYVY8_2X8 720x480
>
> Then I launch the capture stream command:
>
> v4l2-ctl --stream-mmap -d /dev/video1
>
> but nothing happens here, no >>>>> frame indication progress is shown.
>
> If I hit CTRL + C then I get:
> [  715.467623] csi: wait last EOF timeout

I also need to set the video standard to PAL:

# v4l2-ctl --device /dev/v4l-subdev1 --set-standard PAL
Standard set to 000000ff

# media-ctl -l "'tw9910 2-0044':0 -> 'csi':0[1]"
# media-ctl -l "'csi':1 -> 'csi capture':0[1]"
# media-ctl -v -V "'tw9910 2-0044':0 [fmt:UYVY8_2X8/720x576
field:interlaced-bt]"
Opening media device /dev/media0
Enumerating entities
Found 3 entities
Enumerating pads and links
Setting up format UYVY8_2X8 720x576 on pad tw9910 2-0044/0
Format set: UYVY8_2X8 720x576
Setting up format UYVY8_2X8 720x576 on pad csi/0
Format set: UYVY8_2X8 720x576

# v4l2-ctl --stream-mmap -d /dev/video1
[   38.554032] priv->vdev.fmt.fmt.pix.width is 800
[   38.561444] f.fmt.pix.width is 720
[   38.567607] priv->vdev.fmt.fmt.pix.height is 600
[   38.574973] f.fmt.pix.height is 576
[   38.580992] priv->vdev.cc->cs is 1
[   38.586958] cc->cs is 1
[   38.591761] priv->vdev.compose.width is 800
[   38.598420] compose.width is 720
[   38.604048] priv->vdev.compose.height is 600
[   38.610681] compose.height is 576
[   38.616347] csi: capture format not valid
VIDIOC_STREAMON returned -1 (Broken pipe)

I added some printk debug lines to show the mismatch that prevents
the pipeline to start in capture_validate_fmt():

diff --git a/drivers/staging/media/imx/imx-media-capture.c
b/drivers/staging/media/imx/imx-media-capture.c
index b2f2cb3d6a60..511625981e93 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -552,6 +552,21 @@ static int capture_validate_fmt(struct capture_priv *priv)
        ret = __capture_try_fmt_vid_cap(priv, &fmt_src, &f, &cc, &compose);
        if (ret)
                return ret;
+
+       pr_err("priv->vdev.fmt.fmt.pix.width is %d\n",
priv->vdev.fmt.fmt.pix.width);
+       pr_err("f.fmt.pix.width is %d\n", f.fmt.pix.width);
+
+       pr_err("priv->vdev.fmt.fmt.pix.height is %d\n",
priv->vdev.fmt.fmt.pix.height);
+       pr_err("f.fmt.pix.height is %d\n", f.fmt.pix.height );
+
+       pr_err("priv->vdev.cc->cs is %d\n", priv->vdev.cc->cs);
+       pr_err("cc->cs is %d\n", cc->cs);
+
+       pr_err("priv->vdev.compose.width is %d\n", priv->vdev.compose.width);
+       pr_err("compose.width is %d\n", compose.width);
+
+       pr_err("priv->vdev.compose.height is %d\n", priv->vdev.compose.height);
+       pr_err("compose.height is %d\n", compose.height);

        return (priv->vdev.fmt.fmt.pix.width != f.fmt.pix.width ||
                priv->vdev.fmt.fmt.pix.height != f.fmt.pix.height ||

Any ideas as to whu such mismatch happens?

Thanks

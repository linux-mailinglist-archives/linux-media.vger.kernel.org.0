Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9CC2E22EB
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 01:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbgLXALW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 19:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727524AbgLXALW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 19:11:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF59C061794
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 16:10:41 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id h205so1290964lfd.5
        for <linux-media@vger.kernel.org>; Wed, 23 Dec 2020 16:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z/gDJkhk5GkSaVPrp9lyw1kO8AD7LU20lloFi2veCis=;
        b=J+qiZgO95CBf4yy0Mt8q+MM0kH5IPLQsbHj911Bft6oDy1u0Jk/yAGP5M44WwPS4Kd
         4ANL/RgNOROP1rbvHI974Z+isI0Ex0n2FLzcBL//GSezPn9ByZhjXmt6S7XrIIgb+wpY
         h+wbOGNpDgWFY9qD+RGpHpBIdkYC1r5cWroJbnZE+4EoE1XMWoBzrO3f9m9yKrw2qDVX
         TatUyc+DaRBiiQjilwzcrHqAdWSXwjzk7AXdqgTbc5MXugnSWAiU7bhz0jU4Y63/Cvso
         w9Soanu55XCn+1Lze++rmDX45FXEVuu7tSvm07CNlgs0kgmXT2Gvk8TYi/WUbNEET7Ol
         KykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z/gDJkhk5GkSaVPrp9lyw1kO8AD7LU20lloFi2veCis=;
        b=Cu+gE/2Z7AuFi2QlI6WrZB1hKrBwxJPxjvfRd2snnqKJpvtsbhMUKMpisIT91z+iU0
         bMrlbXsRhVKYEFiWFzvRtTd52K7s7tscIPYhx/YBSUeCd9lrVq1DUKYIjEXYGcTFHx6O
         oG7zc/1EDd/5bQWv1Vdi7lzpR4x3o6X+FoRRYIFWGFvQ9XX0zsc5xY4yDgokz0xiBu8F
         eo48CiUzGk2m6joh1WWjf0HAb2fowUDkUhn20EgMB09PR4PADKXNViv3G5ds1SaUa7mM
         /XB4pO/UfEMMVks/HV4xNtBjKNjQlpjhhKvG5D7V8167/UGwK0sv4d/KUZwFZ0ViasUk
         qVAQ==
X-Gm-Message-State: AOAM530Is4+Vcd/iWjgwYVduiP9nR4WqavxkBTZMaDwiNFky5M0afAtD
        nZ07+KLb+UiuDuuMHbS6Pf9HACzuRkEvM9z9U1B4ZiJRRxgDLA==
X-Google-Smtp-Source: ABdhPJxoR08ARxtg6PtUC2qnAtcTp6y88rWAhizhw7wYpKy0LOxIRe2s37LQzW7NeoeEPF/CD57p2TB6zUEs0p+eYnM=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr12428205ljo.490.1608768640319;
 Wed, 23 Dec 2020 16:10:40 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU0TxUVDoi--tB=5AOYzkXOwhBTQ4MyOgX6_Q515yXTM8g@mail.gmail.com>
In-Reply-To: <CAJ+vNU0TxUVDoi--tB=5AOYzkXOwhBTQ4MyOgX6_Q515yXTM8g@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 23 Dec 2020 21:10:28 -0300
Message-ID: <CAOMZO5DqMJnKEYQErv1+nM=bw0omn548JG92Wvk+DXz1kHquKQ@mail.gmail.com>
Subject: Re: ADV7280 capture
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Wed, Dec 23, 2020 at 7:43 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Fabio,
>
> Recently you mentioned you were capturing successfully using an
> adv7280 analog video decoder on an imx6dl with 5.10.

What worked for me was to just launch the pipeline:

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink

after applying the following patch:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.10.2&id=9fe46e7946fca0e9444c1481fec01e7bdcf636ea

I could not test the image captured by the analog camera because I
don't have access to it yet.

I should probably get the camera in January and then I will be able to
test it. I will let you know how it goes.

> I have found that using the adv7280 on an imx6q/dl does not work
> without a patch [1] to make the output format of the adv7280 the same
> as the adv7180. I'm not sure what the best solution for this issue is
> as the patch was nak'd because it may break existing users of the
> adv7280. I suspect perhaps the best approach is to add a kernel module
> parameter or device-tree property to configure the adv7280 for
> compatibility with the imx6 CSI.

Thanks for the explanation. I will keep this in mind when I test the
camera capture via ADV7280.

> I also still have to patch imx-media-csi.c to skip the first few
> frames in order to sync properly on bt656 sources [2]. I'm also not
> sure if this patch is perhaps acceptable upstream of of there is a
> better solution.

Yes, I recall this one. It does help with the scrolling issues.

What about formally submitting this one for discussion?

> I would have expected you to run into these issues as well?

I believe I will run into these issues too. I will keep you posted
when I get a chance to test it.

Thanks for you help!

Fabio Estevam

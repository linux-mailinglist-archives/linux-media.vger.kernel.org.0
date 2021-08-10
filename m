Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961663E5AC5
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240543AbhHJNNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 09:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236764AbhHJNNU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 09:13:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173ACC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:12:59 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id j1so33055646pjv.3
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KCI0uiAKmWQQAmSnEBPRADG/n6Kf0DP5kIB/hhGHtdg=;
        b=QsELMJLuXMfzerb8Yq5oUUZ9o20x/BR0yX9duqIFIwleZ90e4GIQkDEWE4Chf9xC1q
         kunR8c0gVUWCPzJoIardXu8nwnuKqqANyr9tCpHT7Y8EhsrBo+7YHOQWhOUwULS0Pbfy
         WAAClsSISCPa+8YyUZaegazj+PPMrZIlfAAEPOSwyvGjgLy45HxkanNg6P9B7iDCCrh8
         1TAb5748kJns5gnSj9hefBnDPxp4TCwJv0NH5lnNUAW2QFeuskCBfcT3rhuruPIAKTe6
         7+b0mPftjXSUZUmbDWUQbk0yboVcK/wS9MQbX7QMSbvHjoXPMz5v/MTQYRjrcK7PutY+
         nWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KCI0uiAKmWQQAmSnEBPRADG/n6Kf0DP5kIB/hhGHtdg=;
        b=rzbStog0yqWNHEa8ieDkq63fUOz1XZ550atBuYypXo/EbJMIWvsGDYWRWk0lmdW3Jo
         XPNPY/ezSo3xyuICmfNd79NzRotkcw4DILtwQTNs5BxhuowXLxwW3mixZ0e7jH8liIlL
         6SEhz1cr9Bv1j8vJYtZq6EZ9j2bZB28vwd4H0p07i26uKhrHA43xkQqt45fevfAHdPzN
         sd54kXpytpB6MLwEupwJ6zilVNi7bBYd22HYldUBbqy7Lp0wmQh/gv2yTSau+H6ZRQGc
         lIWFiNWOyGYMaYGg7p4mev7JN9R/urX0yOWHcsUSFEYdanC63OyYhLRbm0jWUMVac+jA
         ILDA==
X-Gm-Message-State: AOAM531TTyWkVMaKwt+IEk0FZMVsicBQ5HwNux32Nrvkx4QKHFDm9+z5
        DrsRAQ6hha2C6Z+xNlRMvDqzhRc2XGsBpB277nY=
X-Google-Smtp-Source: ABdhPJznkFbTX0ZWPm0BlVX0n3Zk2tfbr6YRawm+VCutTkPoFqsgZ3IwZzhzSmRj0nFZlsETyTGkhQmh6hC8MxuX0Is=
X-Received: by 2002:a17:90b:33c5:: with SMTP id lk5mr5028677pjb.129.1628601178638;
 Tue, 10 Aug 2021 06:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210809225845.916430-1-djrscally@gmail.com> <20210809225845.916430-13-djrscally@gmail.com>
In-Reply-To: <20210809225845.916430-13-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Aug 2021 16:12:22 +0300
Message-ID: <CAHp75Vd3N+dqkiS0aYMin0miyO5LZfvm-wnUKCSnL+Qbm3K5DQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] media: ipu3-cio2: Add INT347A to cio2-bridge
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        kevin.lhopital@bootlin.com, Yang Li <yang.lee@linux.alibaba.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 1:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> ACPI _HID INT347A represents the OV8865 sensor, the driver for which can
> support the platforms that the cio2-bridge serves. Add it to the array
> of supported sensors so the bridge will connect the sensor to the CIO2
> device.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in V2:
>
>         - Ordered the list by ACPI _HID (Andy)
>
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index 4657e99df033..18a31196a4a3 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -22,6 +22,8 @@
>  static const struct cio2_sensor_config cio2_supported_sensors[] = {
>         /* Omnivision OV5693 */
>         CIO2_SENSOR_CONFIG("INT33BE", 0),
> +       /* Omnivision OV8865 */
> +       CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
>         /* Omnivision OV2680 */
>         CIO2_SENSOR_CONFIG("OVTI2680", 0),
>  };
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko

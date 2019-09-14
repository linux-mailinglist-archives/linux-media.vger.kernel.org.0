Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C30B2AEF
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2019 12:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfINKLc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Sep 2019 06:11:32 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45711 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfINKLb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Sep 2019 06:11:31 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so4660355oib.12;
        Sat, 14 Sep 2019 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w98abdyP0iDoOCCgOY4sBXFFg13pO1U0mLK+q84lIdc=;
        b=FtLnoI9RJ0k/xMfpIdqYXAgC3ZCu/Bv6lepCGCKPHIotHEhV7ANIbzKyLj9KTlb4MK
         X1ZJ21ih8/ao/VLEk8QsHTzXzTwQzaiOfBkLhGKncFIdjRI1wut81OSfISmL8HjVMEwj
         ydJf+gn1WxUJPPCRmn3YGjRlXe4o9nDOG0OJkBPWGtwxT2HFENhKjuuW3H+Jt02s5xHC
         OHOVrEv/AcceOSloky/P0vZUuXYMDSumrkUjY11v7SmR5VoZVlaqODehAH8vpUC4d3pS
         N7mD2tCgZLS7ocCPOKNBNsd3nE3KDCsibT7oyZAThdTK6AAKI+FK6gUfj9VGTTmz9oY6
         C7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w98abdyP0iDoOCCgOY4sBXFFg13pO1U0mLK+q84lIdc=;
        b=pz452pXvIfUZmDdVAH/a/KCm42vv2CLOGCww1KxJIqh3QVz/S/5A25Ms6BhzRcZ548
         YhUw8a2oawWtUbki2Xd6fcuiY0IdL0kroUxdsr3y7VLAev+W9/u9BTpG67FPKG7WTzpN
         BdDAx1keElRrS9C7hW+R3sUDd+w5SjZNL1U3ZoKca/0IzQ+X8C2cMShg0rGninLkfEP+
         DDUyJDZ4WO1czzJZ1wvJON/CkcrXFNHoXEqdEBqX0l8iYghKS+lCx7ZaqLqQP8ALxF+s
         FaO4yIBxOvDJ7QE/O7HGIDw+Lb+RInic4rvt3oW/rONoVzM4mDQ2IDlo5B1hfS9wTrU0
         tmGQ==
X-Gm-Message-State: APjAAAVbs5+Defj08TuHhgNaBVHGigIy7r2YDRkZogT7epvPg0/+Pgo+
        K9DchDR2I9MyAmtLTSRgU8iPE6idpFVyTg7jSs4=
X-Google-Smtp-Source: APXvYqz/UGyDGZKzufN9AC6O6ku4BxK3yiwQM+DqG/Q/RgT/iOekCCPHgrrAb9plA3SLd/7Guh4tGdv9qiXyXoCZdps=
X-Received: by 2002:aca:4e87:: with SMTP id c129mr7100340oib.7.1568455889105;
 Sat, 14 Sep 2019 03:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190912130007.4469-1-bparrot@ti.com> <20190912130007.4469-4-bparrot@ti.com>
In-Reply-To: <20190912130007.4469-4-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 14 Sep 2019 11:11:02 +0100
Message-ID: <CA+V-a8vo2ddxdDEBefTErsTB43tPAFNy-94xhQN1Yhb64jr_Aw@mail.gmail.com>
Subject: Re: [Patch 3/6] media: dt-bindings: ov2659: add powerdown-gpios
 optional property
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch.

On Thu, Sep 12, 2019 at 1:58 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Add powerdown-gpios to the list of optional properties for the OV2659
> camera sensor.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov2659.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov2659.txt b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> index cabc7d827dfb..f55204cce0cd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov2659.txt
> @@ -12,6 +12,10 @@ Required Properties:
>  - clock-names: should be "xvclk".
>  - link-frequencies: target pixel clock frequency.
>
> +Optional Properties:
> +- powerdown-gpios: reference to the GPIO connected to the pwdn pin, if any.
> +  Active is low.
> +
as per the datasheet this should be active high with  pull-down resistor.

Cheers,
--Prabhakar Lad

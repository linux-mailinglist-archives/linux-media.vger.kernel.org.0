Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E291554E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 23:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfEFVQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 17:16:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38999 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfEFVQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 17:16:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id v10so6896422wrt.6
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 14:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=jXjYnXbxV+wGuXLkewFmXgz43QcVn0gtiANOaPSFfJs=;
        b=aokHtjrVLSAL/aL0f+c9BFRznUViplpbTvQQdBuBubeeqXFb/KwiWxXlCj3K8L79cV
         M1zCzcxqUMTIFVgkiau3/zq3yp9LFLOtG5S5xRvAXYuAC9prr2r6F8nUHqvciX46+A6n
         fnz9ctGahOOL8y+cGWRyjIJMoKN8wQqrNUeq+snvR+rW14vkF5fD9qIATLC8ZdkZ8Cs9
         3qX5R7a7qN1dW3GypV55Mvr8yzPu8fr6sBNZIwY6xwO4hbs+y576SGiFoPGAKl1I2bL5
         oh/v5CykJQR4JDfqwTeoBTTLwud/ZPNssRlkdMDNBOx+KDgv8VRMvA+AAH4gf7hG4lC2
         991Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=jXjYnXbxV+wGuXLkewFmXgz43QcVn0gtiANOaPSFfJs=;
        b=mt7xsqSD+lAbb/dwSFouRJxG4ubP4Rf7ELCMZWWymYlRZ1r8Yycxyt8zsc9xrNo7Jm
         BxkUJH7tTveeo0HLmhlvbFimtZYGC9HzTVKBjGByW/6dzmfwZvjxLxx8azSTLhFo/Ye+
         0Mv3iZHFDh00j1qa4tyX8aL+UNpKT2WZufVSyjGdHgjxzHBRnECTxc4e6M8YuFOP0qLA
         S5bn95RpdgVx+zr/yJrksuxUSAILNyWlKtJWRttn0sjbUvUkq0/MiaID95ij8+V8nn6H
         aVM4U/OCjCU9Z6znxoAC+H6z0C37r/tSCCG7ulwW8bf4O/rroRyYR7DrVYAvKbD6YbzC
         YboA==
X-Gm-Message-State: APjAAAVaWMcpLbfI9l+BrZlsv1dZgotBFSXLAxkHOSeahVO6wciYnphC
        NANaJwCDUZruqCO8optvBJfZl+VD7xjebw==
X-Google-Smtp-Source: APXvYqxiB19EfZbD21AJfK5k+6CdddztUZ8IE/5c4oljgsUyMsTniViNwHU3ogLdXHRDNGl9irbUYA==
X-Received: by 2002:adf:ed4c:: with SMTP id u12mr21360077wro.245.1557177384667;
        Mon, 06 May 2019 14:16:24 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n15sm897532wmi.42.2019.05.06.14.16.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 14:16:23 -0700 (PDT)
References: <20190503224326.21039-1-slongerbeam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/8] Switch to sync registration for IPU subdevs
In-reply-to: <20190503224326.21039-1-slongerbeam@gmail.com>
Date:   Mon, 06 May 2019 22:16:21 +0100
Message-ID: <m3ftpr5lne.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Fri 03 May 2019 at 23:43, Steve Longerbeam wrote:
> Switch to sync registration for the IPU internal sub-devices, re-organize
> modules, and a few other miscellaneous cleanups.

Thanks for the series and the fixes. Now everything works as
before. So, for the all series and related to imx7:

Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

My only concern is that Hans already pull requested to v5.2 [0] my
previous patch that your series do not apply on top of.

So, @Hans will you push this series to v5.2 and add a revert
of [1]? or this will go only to v5.3?

---
Cheers,
	Rui


[0]: https://lore.kernel.org/linux-media/d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl/
[1]: https://lore.kernel.org/linux-media/20190412164400.1270-1-rui.silva@linaro.org/


>
> History:
> v4:
> - Add **cc arg to __capture_try_fmt_vid_cap() to validate colorspace,
>   instead of calling ipu_pixelformat_to_colorspace().
> - Add error message if capture format validation failed.
> v3:
> - A couple patches did not compile/link. All patches now build so the
>   series is fully bisectable. No functional changes.
> v2:
> - Added a patch that improves the pipeline upstream/downstream search
>   functions, which no longer require the media device.
> - Add a patch to remove getting media device from v4l2_dev driver data.
>
>
> Steve Longerbeam (8):
>   media: staging/imx: Switch to sync registration for IPU subdevs
>   media: staging/imx: Pass device to alloc/free_dma_buf
>   media: staging/imx: Move add_video_device into capture_device_register
>   Revert "media: imx: Set capture compose rectangle in
>     capture_device_set_format"
>   media: staging/imx: Remove capture_device_set_format
>   media: staging/imx: Re-organize modules
>   media: staging/imx: Improve pipeline searching
>   media: staging/imx: Don't set driver data for v4l2_dev
>
>  drivers/staging/media/imx/Makefile            |  18 +-
>  drivers/staging/media/imx/imx-ic-common.c     |  68 +--
>  drivers/staging/media/imx/imx-ic-prp.c        |  36 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  88 ++--
>  drivers/staging/media/imx/imx-ic.h            |   6 +-
>  drivers/staging/media/imx/imx-media-capture.c |  90 ++--
>  drivers/staging/media/imx/imx-media-csi.c     |  45 +-
>  .../staging/media/imx/imx-media-dev-common.c  | 346 +++++++++++++-
>  drivers/staging/media/imx/imx-media-dev.c     | 449 +-----------------
>  drivers/staging/media/imx/imx-media-fim.c     |   9 -
>  .../staging/media/imx/imx-media-internal-sd.c | 357 ++++++--------
>  drivers/staging/media/imx/imx-media-of.c      |  41 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 170 +++----
>  drivers/staging/media/imx/imx-media-vdic.c    |  84 +---
>  drivers/staging/media/imx/imx-media.h         | 113 +++--
>  drivers/staging/media/imx/imx7-media-csi.c    |  43 +-
>  16 files changed, 857 insertions(+), 1106 deletions(-)


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D178852DCC6
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 20:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240572AbiESS3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 14:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232883AbiESS3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 14:29:17 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6BDC03A5
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:29:16 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id v6so2395037qtx.12
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qa+gghhVNCJdZIwbzWGr4GVzYXOjM0pg+gkd3cQYMhU=;
        b=2roEZo1YO0+jn3Pip8lbNZmP4kOVm8BA1bfM+lmAUIWQCDRa6xoA1pOZLW03k2XFSj
         i5scKMJMEXffrjo78//0MrLR89hty6rhQ7Nm8HtC6CnNFl5x+VINlpaTvMsExFZAMkAL
         Y5Zw9sBIDcW8x0Id3hQsZvmKMdlS/1RPZoWnutGyG7kFvAzLhr0cHgYGmNRozElNX2y4
         blmYYKf5VE655EI2I0gqQ2GkuqXGipdWdcpzjLRCrcgAFH/1mAB5rz3ju16ng07s+wtr
         ot1JM1ul/LfbLz9V8Xxvpo5FAFYt1za3rPgJgP7y6/yJHy99iBTCZ2AFIxh6F23P/sHc
         lpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qa+gghhVNCJdZIwbzWGr4GVzYXOjM0pg+gkd3cQYMhU=;
        b=0BVoh0HFy+JEkR2zV22cYj3551hVb9KjRGHH7yzmeMGzBrUhxsZ2w1L5P8LoOLFgBl
         HEu7GumAeSwi9SV/tVK2MlzHmoEEP8L7d2Uz3/idQyHmfeB/uoyqzV24ygTPQ14oCrvM
         72Xw4lY3C+yHVEZy997kPDhrNcpqPMFnQIQdPWEc0A3GeZVqo5/FJtbg1sSLvwBVq1ij
         YVpGYJdH0yHVaLUcsl1JrwVabMGtIoWFX+akk6VBV4bILzqjoxt9RF6QfgKulpvfRaji
         UQzcBBD+1yT8T0NmH6kLMU76dXH+wP6BFZYNEXCaBpY25LoHCO2e1+FSqPNF22nCeqrV
         YUYQ==
X-Gm-Message-State: AOAM530Bcs8KB5kfaBR0WJL8g5lvTmxKavtFQEHTIm9IqfIaRtm5toqP
        ngENC6UsfUBLtYIzaXXqUhzsYA==
X-Google-Smtp-Source: ABdhPJxBVuxWrA1raXR1ZTVEMYBsN5Bcu1dprDyxZNpHWsMlwF05H4KExruJS+lGwKW0pKlmhXhiVQ==
X-Received: by 2002:ac8:5896:0:b0:2f3:d231:58a9 with SMTP id t22-20020ac85896000000b002f3d23158a9mr5052909qta.131.1652984955844;
        Thu, 19 May 2022 11:29:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h22-20020ac85496000000b002f917b670a2sm676447qtq.74.2022.05.19.11.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 11:29:15 -0700 (PDT)
Message-ID: <5a372aa8296c1141a0da5f3eb240e6ca675a3a87.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/6] media: Implement UVC v1.5 ROI
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Date:   Thu, 19 May 2022 14:29:14 -0400
In-Reply-To: <20220518062412.2375586-1-yunkec@google.com>
References: <20220518062412.2375586-1-yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke Cao,

Le mercredi 18 mai 2022 =C3=A0 15:24 +0900, Yunke Cao a =C3=A9crit=C2=A0:
> This patch set implements UVC v1.5 regioin of interest using V4L2
> control API.
>=20
> ROI control is consisted an auto control with type bitmask and a
> rectangle control with a newly added type V4L2_CTRL_TYPE_RECT.
>=20
> V4L2_CTRL_WHICH_MIN/MAX_VAL is added to support the rectangle control.
>=20
> A rectangle control is also added to the vivid test driver.
>=20
> Tested on two different usb cameras using v4l2-ctl and calling ioctls.
>=20
> Yunke Cao (6):
>   media: v4l2_ctrl: Add region of interest rectangle control
>   media: v4l2_ctrl: Add region of interest auto control
>   media: v4l2_ctrl: Add V4L2_CTRL_WHICH_MIN/MAX_VAL
>   media: uvcvideo: implement UVC v1.5 ROI
>   media: uvcvideo: Initialize roi to default value
>   media: vivid: Add a roi rectangle control

A little about best practices, consider adding a change log in your revisio=
ns,
so we know what you have changed (or document what you decided not to chang=
e).
Its also nice to wait for the review comment to settle before posting a new=
 set,
it may appear rude otherwise.

kind regards,
Nicolas

>=20
>  .../userspace-api/media/drivers/uvcvideo.rst  |   1 +
>  .../media/v4l/ext-ctrls-camera.rst            |  49 ++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  12 +-
>  .../media/videodev2.h.rst.exceptions          |   3 +
>  drivers/media/i2c/imx214.c                    |   4 +-
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  34 +++
>  drivers/media/usb/uvc/uvc_ctrl.c              | 214 ++++++++++++++++--
>  drivers/media/usb/uvc/uvc_v4l2.c              |  12 +-
>  drivers/media/usb/uvc/uvcvideo.h              |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  51 ++++-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 155 ++++++++++++-
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   7 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  32 ++-
>  include/uapi/linux/usb/video.h                |   1 +
>  include/uapi/linux/uvcvideo.h                 |   1 +
>  include/uapi/linux/v4l2-controls.h            |  11 +
>  include/uapi/linux/videodev2.h                |   4 +
>  18 files changed, 553 insertions(+), 52 deletions(-)
>=20


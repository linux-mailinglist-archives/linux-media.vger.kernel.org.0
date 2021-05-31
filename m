Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A91339677A
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 19:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhEaR6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 13:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhEaR6E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 13:58:04 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3105C06174A
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 10:56:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bn21so8652660ljb.1
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=i3/Jtq5Aq5hRxcm13QI1+UxAoFisCPO74w7M7sxYZ3A=;
        b=G8J8nPZJAtFaL8dl9hrtWHCYk9G5WlqCDprbD1m1csn3RJTe1w7uF0V+kTw0BxKFWd
         PWyhSgAw1xCD+7M/3rzkbqcAj/q2a0EOcUTsJ/63ntiNGQeydkGNjdMjufyYvbmjSJYM
         PCS6id/u36ll69YZXKCVFqF2gk/RW6HEzRahVTCto9X2VI9d5k+UwmSmt/I/w254b/Gh
         4FNj7OO/y6AL1knqhjva/wVP5F8SmUYp6K1wIVwtZcuKARor8qkMvADs2HQrcXKa1Cu7
         sVmj+r6yFkCd5LTJRPYLwtsjPv0e0xSKpp9AEdRq81PvPz8TIecBv5fkvz1bethU1TS2
         VP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=i3/Jtq5Aq5hRxcm13QI1+UxAoFisCPO74w7M7sxYZ3A=;
        b=MIevsizeDCLdQzz1ANQEIqetGhUjArWLhi/Ih1rcelqBULFB/kI7MtUcar09NE6dZ2
         gHsTWiu3whnaMLReR5wWHJf6AeoPEVV8fD3bvyDrAon+YtWy0L+a3H5AS7MuNV+7vcqy
         X5JKger7m6XX/FjtisaSz9yAbcyIVfClwQCTTn1BD2SJn+LEaUGI5NBY76G/evsiy8bk
         tmhMSBW1aMlohzQIwiFukuMW7mGKVxns4dJ0uxCoLhdmYx1f2jIoGuDJ+GUzDlRAVwv8
         ojM+p8bnxnFinlaOisTlQBkL0saV9qYwZ0f7kqBPGK0Xl8DzXKgz+HeScia2SDfemUcG
         UdwQ==
X-Gm-Message-State: AOAM533G9FKEYt/v7kpBRBgKzRJYjcBPHe6wg8wsjNuRBN13c0VONNtx
        loDyGOBYW1VaX42ST9bZSdvg10Y4nyejLsdLFWM=
X-Google-Smtp-Source: ABdhPJxIPF+VpWaOz6WjYEaOqiCOhHSx0O8YQjBSRFtW8ifBmPQpEjIGC7cMpnctj7txdR9w50bhpsp5m4OGlZfT56A=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr17551166ljh.490.1622483768093;
 Mon, 31 May 2021 10:56:08 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 31 May 2021 14:55:57 -0300
Message-ID: <CAOMZO5BLdB_iaGrxvaOCAd4jhX6TJt9qiQd5=BYKmJF3OBhTiQ@mail.gmail.com>
Subject: Implementing input IOCTLs for imx capture
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On an imx6dl based board with an ADV7280, I can successfully capture
from an analog camera using the following Gstreamer pipeline:

gst-launch-1.0 v4l2src device=/dev/video2 ! kmssink

The next goal is to integrate it within the Qt multimedia application:
https://github.com/qt/qtmultimedia/blob/5.15.2/src/gsttools/qgstutils.cpp#L631-L687

The Qt app uses the VIDIOC_ENUMINPUT and VIDIOC_S_INPUT ioctl's, but
as these are not implemented by the imx-media-capture driver yet, it
causes the camera to not be detected.

Does anyone have any suggestions as to how to add support for
.vidioc_enum_input, .vidioc_g_input and .vidioc_s_input in
drivers/staging/media/imx/imx-media-capture.c ?

I tried to look at how the other drivers implement these hooks, but my
attempts to add support for them to the imx capture driver didn't
work.

Thanks,

Fabio Estevam

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EF85A6AE
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 00:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfF1WDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 18:03:53 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:36675 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfF1WDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 18:03:53 -0400
Received: by mail-lf1-f50.google.com with SMTP id q26so4933267lfc.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 15:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6jrClA4jAxSgfoG2wtUyCNcUXcz7+C6HZzQC8fNi6qM=;
        b=O/65x44W9Gdwmml2Ui+d+ZrrQ2S1PIZY4L8X1lomuVI+Gm7jxdP7YrwGsC41I1CQTu
         8Xgy4AF273q+cen/aqcY7/MQBFIdNa/tY12tHWD/1DZjr5/8rkErihPfILl+mLpeAbBB
         csSTv1835sA0DJ58DJrpaFqO5ibU7NUSqAnWvjkbQ/mwS4561fLC79ME0uAcsvllkYS7
         Blu/AWGrOrw2kfhIdsFcet2MdZl42OJGWSDyu127lCnx+yiXPIMctQ5Td1KxUKnYDE11
         KwlpEUibwtrQPeZNLvYcmn8FBf8jdXNAbp/m/uVm/Z9UFJ/d8VOKoRYF7IntRh+Qi/aS
         /7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6jrClA4jAxSgfoG2wtUyCNcUXcz7+C6HZzQC8fNi6qM=;
        b=iYuzV6QGLTHYBUBSrVvcZjEHXC/KtFIaX6igtf4mEMu95+cgSkz6C2veJpqaqveeUa
         usfExJSlpQeaM5bxt/tnKYiQgRrf9LPl/p0nDHSwfyGpfUgymiVtxh4QySp9f4AocN/0
         4wDWkD+4yOw9VqvTab3/t2WAAqqObYx+HKiLeeCvae6rR5P/dhvuRkZlAFx4lovnCD1l
         p7JiIieVom+IjsWXO0unuc+/J2PyeGmSbf0vhEnCRb7/VkxoiPJLU/7Lq0lhhIzVpS10
         +IYWd8bEgs2YUcXy6P9xdqw0xWA/tc+F9wUHc85SUz9qTttk0MjhH6p+RfWS0xDsbatM
         Ym4A==
X-Gm-Message-State: APjAAAXwiGcf1YZ59Ucyz6LVMHW2VxsX4bMVUwu7I29G7Dw7CRnraMPo
        yyeT3N+d2gGG7gI8Pbp05MFB3V4XWDjgcCdGkj4=
X-Google-Smtp-Source: APXvYqx/zfmSInbS/pJFjH1vreN+T+5BEgjzM5NQT8iBCQgIe2Zi55EVlbqMjuwsUUNh0DJ9MrmxTBbSfMCFafqDETY=
X-Received: by 2002:a19:5044:: with SMTP id z4mr5794302lfj.80.1561759431332;
 Fri, 28 Jun 2019 15:03:51 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 28 Jun 2019 19:03:46 -0300
Message-ID: <CAOMZO5A4zhpxf7PQV17vpi43M743Q0R5+ONpSc05-fxFbQDG0Q@mail.gmail.com>
Subject: Setting up the links for imx7-mipi-csis
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

I am trying to get a OV5645 camera to work with a imx7d-pico board on
linux-next 20190628.

Here is the log:

[    0.285361] videodev: Linux video capture interface: v2.00
[    3.684025] csi: Registered csi capture as /dev/video0
..
[    3.689618] imx-media: subdev csi bound
[    4.055676] imx-media: imx7-mipi-csis.0:1 -> csi-mux:1
[    4.061032] imx-media: csi-mux:2 -> csi:0
[    4.065339] imx-media: ov5645 3-003c:0 -> imx7-mipi-csis.0:0

I try to follow the instructions from
Documentation/media/v4l-drivers/imx7.rst to setup the links, which
would be the following for imx7d-pico:

   media-ctl -l "'ov5645 3-003c':0 -> 'imx7-mipi-csis.0':0[1]"
   media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
   media-ctl -l "'csi_mux':2 -> 'csi':0[1]"
   media-ctl -l "'csi':1 -> 'csi capture':0[1]"

The first command succeeds, but the second one fails:

# media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
Unable to parse link: Invalid argument (22)

Any ideas, please?

Thanks,

Fabio Estevam

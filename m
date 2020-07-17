Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26B1223EF0
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 16:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgGQO7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 10:59:13 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41623 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726205AbgGQO7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 10:59:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wRpJjYT61yPEdwRpMj5WHP; Fri, 17 Jul 2020 16:59:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594997950; bh=ZxDA0Byag4hqxoq3qdnW7o9GkWRziwHWXD8zudGbIcA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vGxqPwwr8Vrnt54T6uPie7bCIgZ9XMUxpvFJRViyF6JQy4vmxGRdEvGjU8Tj4ZGiS
         RQfkI/MzihoXnsX2RbBra7XnN2HeYTAuETmr02onNGneyTX5O7N1WEdiJCXXZdhY/b
         6kZcJ5WRiuLC8C5mRK71n4PFTRaWjhfHd1Cy3kDaEH2zTq1zdDD5+gr83chFc1xh10
         JkWrmPvrwFjaqNybgjxw0RJjEa2OlQZaaD66fR3nThHPdWecMC4sO2+2AQ64+1ta9e
         aY73PhcFu6Bj1fnh3OtwGeXZYm9DrdgsvNm0mWGU5cYV8MkL+j5tlJs4J7H4ntiahj
         dBSToAVjjC8nQ==
Subject: Re: [PATCH v8 00/10] v4l2-subdev: Introduce [g|s]et_mbus_format pad
 op
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, jmkrzyszt@gmail.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <239c6a8f-95b6-e270-324e-998411650e39@xs4all.nl>
Date:   Fri, 17 Jul 2020 16:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717145324.292820-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLTBIzTUsTwsaEgUp+WEGUoROgnFxc1cJZuefIj+dxjc/gKYbKvsquAsUDcndi2+Nau27E6w1cuKUbOEXBJgSEsfssAWtVVD9CMAj16UGv/eJXXskpF4
 2rwS8w5N8ruEJ3tC9jfy1KMpsE/Z51napYP7bn6sD9Yt/uGTqxDlYQGTYTP+orDT8JCe3PIc7mFSDBPvzvqhvIKeDq47o266xRBVqyiFyNuA/cCkEKTv2u7a
 FQ96o7oEE1zaj03uCEpDXHuR1heGDhfrWNqXM03l8zfoxjxJHwOyp0UngNN14ssgXDTwbmtdRy+u1wr8x1tuWO93EItl/vRuAA+u3igciY5dgzBcC2n+egGF
 PQaf+i7uaroRJA9gWKKZGQj61+LErwk+vX02kU5yhFkz434C57+Y0tY6zzQ/zhH9A2gcwITRSR7pNEduk0/xA+VJS9FI/XWh+QhUxrRAWzh0Wc+VXBKWUQ0V
 TJj7gmRVOnyIkAs/PxEBRiDLMxwg+J0KgdN+/fUEpI+mcJKIZ73lgyEL5Juod8NNnTvfbW9Twx8VjWshpER90QzPMY1ayImSf9gZX77sizQo6D8v0z1yUbab
 /JCPSqA3wRcuvT7ufe/pBaknG9IklI9ljpITsrZoZOgEUg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 16:53, Jacopo Mondi wrote:
> One more update to address Janusz comments on patch 1/10
> 
> 1) I have expanded the operation documentation slightly with:
> 
>   * applied to the hardware. The operation shall fail if the
> - * pad index it has been called on is not valid.
> + * pad index it has been called on is not valid or in case of
> + * unrecoverable failures.
> 
> 2) Added call wrapper to check for pad validity. I have for now ignored
>    the check_which() and check_cfg() calls as the operations do not
>    support TRY format.

Looks good. If there are no new comments then I'll make the PR on Tuesday.

Regards,

	Hans

> 
> Thanks
>   j
> 
> v7->v8
> - Add call wrappers to 1/10
> - Expand documentation to report error on failures
> 
> v6.1->v7
> - Add [6/10] as suggested by Hans
> - Add Niklas tag and fix his last comment in [10/10]
> 
> v6->v6.1
> - Address Niklas' comments in the last patch for rcar-csi2
> 
> v5->v6:
> - Report V4L2_MBUS_DATA_ACTIVE_HIGH in ov6650 get_mbus_config
> - Check for the return value of get_mbus_config() at the end of
>   set_mbus_config() in ov6650 driver
> 
> v4->v5:
> - Address Sakari's comment on documentation (s/should/shall)
> - Use a local variable for the number of active lanes in 9/9
> - Add Kieran's tags to 7/9 and 8/9
> - Fix a warning on operator precedence on 3/9
> 
> v3->v4:
> - Remove g/s_mbus_config video operation
> - Adjust pxa quick capture interface to properly handle bus mastering
> - Reword the two new operations documentation
> 
> v2->v3:
> - Re-use v4l2_mbus_config and V4L2_MBUS_* flags
> - Port existing drivers
> - Update adv748x and rcar-csi2 patches to use V4L2_MBUS_* flags
> 
> v1->v2:
> - Address Sakari's comment to use unsigned int in place of bools
> - Add two new patches to address documentation
> - Adjust rcar-csi2 patch as much as possible according to Niklas comments
> - Add Niklas's tags
> 
> Jacopo Mondi (10):
>   media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
>   media: i2c: Use the new get_mbus_config pad op
>   media: i2c: ov6650: Use new [get|set]_mbus_config ops
>   media: pxa_camera: Use the new set_mbus_config op
>   media: v4l2-subdev: Remove [s|g]_mbus_config video ops
>   media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
>   staging: media: imx: Update TODO entry
>   media: i2c: adv748x: Adjust TXA data lanes number
>   media: i2c: adv748x: Implement get_mbus_config
>   media: rcar-csi2: Negotiate data lanes number
> 
>  drivers/media/i2c/adv7180.c                 |   7 +-
>  drivers/media/i2c/adv748x/adv748x-core.c    |  31 +++-
>  drivers/media/i2c/adv748x/adv748x-csi2.c    |  31 ++++
>  drivers/media/i2c/adv748x/adv748x.h         |   1 +
>  drivers/media/i2c/ml86v7667.c               |   7 +-
>  drivers/media/i2c/mt9m001.c                 |   7 +-
>  drivers/media/i2c/mt9m111.c                 |   7 +-
>  drivers/media/i2c/ov6650.c                  |  56 ++++--
>  drivers/media/i2c/ov9640.c                  |   7 +-
>  drivers/media/i2c/tc358743.c                |   7 +-
>  drivers/media/i2c/tvp5150.c                 |   7 +-
>  drivers/media/platform/pxa_camera.c         | 189 ++++++--------------
>  drivers/media/platform/rcar-vin/rcar-csi2.c |  75 +++++++-
>  drivers/media/v4l2-core/v4l2-subdev.c       |  16 ++
>  drivers/staging/media/imx/TODO              |   4 +
>  include/media/v4l2-mediabus.h               |  33 +++-
>  include/media/v4l2-subdev.h                 |  38 ++--
>  17 files changed, 318 insertions(+), 205 deletions(-)
> 
> --
> 2.27.0
> 


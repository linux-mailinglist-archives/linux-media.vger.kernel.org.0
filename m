Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B86E1A27E0
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 19:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgDHRXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 13:23:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43221 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbgDHRXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 13:23:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id g27so8456041ljn.10
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bb2nrCy5pm0c8i9XlYnnzT0iDevSHTFfOkwmC+DgLA=;
        b=lJnPqtCDl6nLt69QJWktgMVEaFpUHij/siKE6HsAQ8/xboEvtd2Ih/hcHeZn73/TPR
         bCwSi9gtJCPKRpQBYLHsU9NntLkrY0+EKiA6UjHZ1pfyxJr4dqep1mHK/JaFu7/4jE8A
         L53m7YJ4uqtvo41kh71qptPh9drIKPxjYEkJNxYayOwvY7zCpE3Co93NGo3+FP3sy3D2
         h4yzoSwjQNbGpi7lwACsLqiOVayTyV74fx9SVEtu3dFbZYUJVQwMTB+Z7WqNajRKFYc2
         LQe6nXoRFgeeT51hcixPqClH1vD5q7y8K8966cGkRnFt2MoJ69mfH5P4EQ8HE9ab4uxS
         X4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bb2nrCy5pm0c8i9XlYnnzT0iDevSHTFfOkwmC+DgLA=;
        b=n1Wa3q/wAOI1pa30U5TqghYjURbRdqLcvbV6j6KfswzE0azjQPOXSO7ubIXHdB2zl6
         Kx673TKwhN+qRPPb6jkCCP+z9wGvrptKY/u5prJB9UMdUoFiDL4RFirsXY99f+W6kC//
         REnBtuu1TR018o2fU3cmYg/ZQ/6kT9j7KcZv869Q2JmpigoQugcm1LyEzY3cAQT07iuh
         kcIc+9P7RtXjEkEb9F9fFNgHe4eG9nqw1sjdAJUlnK8ls8J+B99W5k31loLHVwqWB9HE
         Ey3Qn6raGmaplCXjCZ5TOng12eAO6ZRgrISl5d0nlXfjEUAF7wGIF054kBXLb29XFM4K
         Z2OA==
X-Gm-Message-State: AGi0PuaMvsthqKbuBRpgdQgjV6vIzMCRhpOJvc40zl3zVyx2b8+xleht
        CdBcGTb96gYHnfQTpqnoGyNgGsF3WsD4IMofJqI=
X-Google-Smtp-Source: APiQypLMbKN6pNSgHfpev1qxD4ITT4/U2npDi95TL7Ej6JbVCIMryw2Un/1r10hzZ3t/3z6iP8Z8AWeKNEtudqVtvJ8=
X-Received: by 2002:a05:651c:30b:: with SMTP id a11mr5570771ljp.164.1586366621533;
 Wed, 08 Apr 2020 10:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200408123215.2531-1-festevam@gmail.com> <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
In-Reply-To: <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 8 Apr 2020 14:24:07 -0300
Message-ID: <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: imx.rst: Fix the MIPI CSI-2 virtual channel
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Apr 8, 2020 at 1:35 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> change to:
>
> media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"

If I make this change I get:

# v4l2-ctl --stream-mmap -d /dev/video1
[  501.143012] ipu1_ic_prpenc: capture format not valid
                VIDIOC_STREAMON returned -1 (Invalid argument)

Going back to the original example:

#  media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/640x480]"
# v4l2-ctl --stream-mmap -d /dev/video1
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps

Changing only the resolution:

#  media-ctl -V "'ipu1_ic_prpenc':1 [fmt:AYUV32/800x600]"
# v4l2-ctl --stream-mmap -d /dev/video1
[  658.358246] ipu1_ic_prpenc: capture format not valid
                VIDIOC_STREAMON returned -1 (Invalid argument)

Any ideas?

These are the lines I am currently using as per your feedback:

   # Setup links
   media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
   media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
   media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
   # Configure pads
   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"

Thanks,

Fabio Estevam

   # Setup links
   media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
   media-ctl -l "'imx6-mipi-csi2':1 -> 'ipu1_csi0_mux':0[1]"
   media-ctl -l "'ipu1_csi0_mux':2 -> 'ipu1_csi0':0[1]"
   media-ctl -l "'ipu1_csi0':1 -> 'ipu1_ic_prp':0[1]"
   media-ctl -l "'ipu1_ic_prp':1 -> 'ipu1_ic_prpenc':0[1]"
   media-ctl -l "'ipu1_ic_prpenc':1 -> 'ipu1_ic_prpenc capture':0[1]"
   # Configure pads
   media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'imx6-mipi-csi2':1 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'ipu1_csi0_mux':2 [fmt:UYVY2X8/640x480]"
   media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/640x480]"
   media-ctl -V "'ipu1_ic_prp':1 [fmt:AYUV32/640x480]"
   media-ctl -V "'ipu1_ic_prpenc':1 [fmt:ARGB8888_1X32/800x600]"

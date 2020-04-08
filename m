Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32CCC1A2954
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 21:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgDHT1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 15:27:53 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37923 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbgDHT1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 15:27:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id v16so8958036ljg.5
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5WsoAu8mj8QYsnLiWKpNMaY0X6NTwOd9GaWvOHJQBT8=;
        b=YmyytFgizRLluJ3UtnrykSC7tm7T92rHWY0lETKy5FCOfQcYO7aLhINCZy1HR2WgEK
         NpSai2p7QO82W8jhguZGeHUP/G4rJdK5gJo6NamzpamTukb5KnGaEwtvJlhbpoQ1yLEM
         9QNT/NfnNnWW2MY4ApalovOWEXj9JEP3xPcc7yaMj7UQ5c1y2lAhjD9O3f3mwdyxY6lK
         XRrx+SOVSJrgHzqDBlHz4CFKnfzXKj9tMfBpoAjyJLEbsebnF7H2L00L1BtJUf9kSuRU
         7w2ip0961+9/a0uXt5YQFGjDES+bdIWlVy8pGaOcnjUpUm1bfatijITkKPBmA9P/gUDh
         sZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5WsoAu8mj8QYsnLiWKpNMaY0X6NTwOd9GaWvOHJQBT8=;
        b=tAF/4ErmZPS3PJf98GYX3ombmRNjVAIV5wfAdDXPY74VInUHIJVnmuCuxDu7xyZU4j
         r1rA1gKAefkZP4ubV9oVKHnnpBXBMsIfcyqN/6IO5aGiRdBnSnBSp175TXyjFD+iVqlG
         /2NqsaHC6pzfngWofzpjkSpdjidUpcJnsb3+hvrQ3J4+61l/2Lf1tn1sF+4VXyGJwK0z
         yUn23JXo/wPXV/9oxpR8BM75r0SfKUjr2ebRPGaNL4Jt/iHYlHxCA9mi716G5vOuv255
         FYp37KGcufY4TlW2qIo7n2v6qdIaGP/YO6dSohDcm92JqaIVeR5zHW4LXAlzFVov5tex
         uxgg==
X-Gm-Message-State: AGi0PuaQhJufuluFsYffV6UBYhFMZ98E3Da70dtifIDMFxNV6t2bDZSh
        /gB43noXRKiWakRFHSGI17a86ZJ1V9Qn9CDYG/M=
X-Google-Smtp-Source: APiQypL8QOmqCi10MI/8+7fMI6lhQ+oai0gt2mnP7Cbf5lEBQ1vuKbUxLpJ0OzNm0n82SaNNPhdFBbv4s65XCwUqPwc=
X-Received: by 2002:a2e:b4d1:: with SMTP id r17mr5827022ljm.117.1586374070285;
 Wed, 08 Apr 2020 12:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200408123215.2531-1-festevam@gmail.com> <c069af02-af3c-9527-eed4-839681c73ce6@gmail.com>
 <CAOMZO5BN6igxVGRnOnftv=PGZWi=2Qb2Th0fhBon93Fk-zWj+w@mail.gmail.com> <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com>
In-Reply-To: <a23d2559-5498-75bb-0bce-3bc11bb6b5ae@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 8 Apr 2020 16:28:16 -0300
Message-ID: <CAOMZO5BoD4K9Z7GCZHtrWDkYre3aFNd6YdDkUfKB1xVwdjaNzg@mail.gmail.com>
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

On Wed, Apr 8, 2020 at 4:16 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> You have to set a format at the capture interface as the last step
> before streaming can start:
>
> # v4l2-ctl -d /dev/video1 --set-fmt-video=pixelformat=RGB3

Thanks. After running this line the stream can start via --stream-mmap:

# v4l2-ctl --stream-mmap -d /dev/video1
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.03 fps

but it fails with Gstreamer:

# gst-launch-1.0 -v v4l2src device=/dev/video1 ! kmssink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-width = 1024
/GstPipeline:pipeline0/GstKMSSink:kmssink0: display-height = 768
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3072): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
ERROR: pipeline doesn't want to preroll.
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...

Should I change the Gstreamer pipeline?

Thanks

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 194E64B6ED6
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 15:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbiBOOcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 09:32:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbiBOOcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 09:32:14 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765E7D15F9
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 06:32:04 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id z22so6881087edd.1
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taxboel-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ge4iLoBEqrggyEKfuOov3RZMd3kCYnJyn4EP3ygvwNs=;
        b=Q86EXaIEN6xGR8XIUjQkEbJeVnTmEDjHqRvDXXL0vtKNcHYi2dkRMkbA0evhH//fT9
         VHi7Cn7ntH2UUkOI34DzMJC6XKlZTFzCcyqbFOyWkiHJM4Q034eMINId1/KkmMEfloVz
         iootFmmvLz/qt1YDwQsRyR0YpIrIsFBjRDNtkmmWJgY66XYoaW+uiD+VpjWQ3oWFyjEh
         vgKiJb6OJ04MusXzJc6Ixr4LHGpadbh17xfHEIoocmqR7UZKgBD5slQ+pdmXNufhHCqH
         m2hxRTxoAOLJZb7YKZSgFmPmhalPSk5dlnWZj19NJEn8rRRkvubKudUsbTESejtbC3bH
         nTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ge4iLoBEqrggyEKfuOov3RZMd3kCYnJyn4EP3ygvwNs=;
        b=nMwPJyM6yakXkqGMIiRXiaQHgORDrlxguryl4fQdz1vMDJ0MB4QmAYFtNV7fMasTMX
         vax4mGYn7jHjlwLLQla2buQN6mrwTnv0kcWF9yYfLDw5mXbi1cTfwl+tNxuKda5V3Ry8
         uH+FElC5vZTCcxDo/Mo5F5O0Kl5pVVb5Wq7Id0zzl0adLw4AFqiSOlSf//s/VDc93NC6
         i5rbo12YCFMWmrGo88xt7IE8l6nubnSoSYMGCyscF93KvKnU5vPNw7eva3pCGofMky3+
         DrhEJ/9oOVZhYM5BBddsM7RRD9OJWrcXp5EJoSLxnENMZqgjtW3S7T/tAPhqhXAmRGcc
         W/Iw==
X-Gm-Message-State: AOAM533bxWc5T+cbLyUL9SMijFVnJ7fQczqP+1e//SYZ6vdPgXQ8fhaq
        MMv7ppo2lD8h5auZeVrRfLH/HyXIB3de28y+JzcafZEfc9BQjw==
X-Google-Smtp-Source: ABdhPJwk00UKTMnE93DLbxXv9eltp7SQHZItJphRHqcsS5/oukYDF1R3x/9Lz5L8JaKQNNrRuRkW/9+nf8EJQn73wS0=
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr1678724edb.343.1644935522913;
 Tue, 15 Feb 2022 06:32:02 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Jesper_Taxb=C3=B8l?= <jesper@taxboel.dk>
Date:   Tue, 15 Feb 2022 15:31:28 +0100
Message-ID: <CAHQA3mST_MMZCD2=6Hrt2LohoxH1hpa9=nO7evv4mOeiNsh4Dw@mail.gmail.com>
Subject: Wrapping a video device with a loadable kernel module - is it possible?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am working on the Jetson NX platform and have a camera related problem.

I am using two RPI HQ (Sony IMX477 based) cameras via the
nvarguscamerasrc gstreamer module.

When using the two cameras, as the examples demonstrate, in gstreamer,
they each run their ISP algorithms seperately (white balance, gain,
exposure etc.).

A part of the white balance algorithm use the actual pixels in the
image to determine white balance, therefore resulting in two different
toned images. Especially if the scene is not evenly lit. This is a
problem as I need to stitch the images as a single panorama.

To get around this problem I am thinking about approaching the cameras
on the device level. (/dev/video0 and /dev/video1)

I have interfaced a single camera through the V4L2 interface and I can
retrieve raw bayer frames as well at setting exposure and gain through
ioctl calls, so I know the functionality needed to hand over image
data

I am therefore thinking about writing a kernel module that would wrap
two cameras at V4L2 level and expose them as a single /dev/video2
device. I would need to merge image data and route camera settings out
to both cameras. (exposure & gain)

If this could succeed I would be able to use the gstreamer modules as usual.

I have tried libfuse's cuse interface, but that does not expose mmap
functions. So I have found myself following various kernel module
tutorials to get a loadable kernel module up, that can respond to
read, write, ioctl and mmap calls.

What I am missing is an example of how to use another device handle
from within a kernel module.

I am therefore on a lookout of an example, as I guess I am not the
first person attemping to wrap a device. I guess network snooping
would be done the same way.

Do you know any samples that I could learn from? Especially covering
how to use other devices from inside a kernel module.

kind regards

Jesper

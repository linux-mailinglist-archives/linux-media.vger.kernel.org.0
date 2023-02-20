Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10DD69D165
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 17:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbjBTQgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 11:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBTQgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 11:36:25 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E49C1F91D
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 08:36:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id f11so916037pfe.2
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RES5aZEUyJmrKZptXjeIXBovSNAHPkS3S5S1og+J4Sk=;
        b=N1x/43kjZEWITS2dMQqDpzoMRibr/uSC3ypPlFXYZIvNuVzkSZxxzf17t07tFnvYVy
         4ih6E5u71+DEzwKYlqmv1Roq9BRMiUhGzNcoDSrDh17jeGFxKqt6Tm49DtKGzo2OA8aX
         JrAFRPhG8hKeVMsapgbWj1Q7fLB4afACMW+wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RES5aZEUyJmrKZptXjeIXBovSNAHPkS3S5S1og+J4Sk=;
        b=x1xJT2bQ/HWSmksRNExL5CqtkYNyuf3/gkHanSWmkwYQtzUaMLQhDwFr9k9uj8xdI2
         F7B4cdMSY3e/3Ill85jUV+ooNjah/2/mpHUT1MMvBJC9ZV24s5rJ7ItvazbuJ9PIUcoH
         PQF/Avm1No8mGmW+Y5RGtPKSSeMJnIkZVyMQQx1atUysmmtyvA2LDUAaU6gAC8IB4sbZ
         dJZm2AiRoP2Ym0+YNLDVYhcgVDT3wH/XXIoQ/Sze41Yv/tmd0WHFTFGMZFfwmo8WHfCx
         WgoVRYsYz3QiB83JmawKYfUJWompVmbcUFJS06efrwdzxAT63FL0PuXIuKhT/4LB2pDV
         QYUw==
X-Gm-Message-State: AO0yUKUr34lGyDoz5OnAIGoNfWkKthQtQAt0xrAphHyVjpVY/eeDnW5P
        70wQZrDsgqhcRrWsVR8SkOmkk/ctZRS+x4Xb
X-Google-Smtp-Source: AK7set/Tn37gAVjwSyloWr2cER3HxH2FirKpANHYkI7tWpsi3/vvOCEu85JfYVRkTQjPGesXZG2TXg==
X-Received: by 2002:a62:1b45:0:b0:5a8:b07b:82dc with SMTP id b66-20020a621b45000000b005a8b07b82dcmr640562pfb.0.1676910983302;
        Mon, 20 Feb 2023 08:36:23 -0800 (PST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id 20-20020aa79114000000b005a7bd10bb2asm7878748pfh.79.2023.02.20.08.36.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 08:36:22 -0800 (PST)
Received: by mail-pl1-f173.google.com with SMTP id ko13so2730423plb.13
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 08:36:22 -0800 (PST)
X-Received: by 2002:a17:90b:5111:b0:233:b52a:c5c2 with SMTP id
 sc17-20020a17090b511100b00233b52ac5c2mr888316pjb.122.1676910981429; Mon, 20
 Feb 2023 08:36:21 -0800 (PST)
MIME-Version: 1.0
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
 <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com> <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
 <Y+l02luLG22ymOXC@pendragon.ideasonboard.com> <a8e734f5-4506-50c7-0bde-b57844954222@xplornet.com>
 <Y+orMX89blS1enED@pendragon.ideasonboard.com> <29625514-80d8-7b67-79b7-9e8db39b5301@xplornet.com>
In-Reply-To: <29625514-80d8-7b67-79b7-9e8db39b5301@xplornet.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 20 Feb 2023 17:36:10 +0100
X-Gmail-Original-Message-ID: <CANiDSCvjw31+H7eYCzT7t1zs-eQ1kZHR-FQv42e5PYSNOk574w@mail.gmail.com>
Message-ID: <CANiDSCvjw31+H7eYCzT7t1zs-eQ1kZHR-FQv42e5PYSNOk574w@mail.gmail.com>
Subject: Re: uvcvideo
To:     Paul Neelands <paulnee@xplornet.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul

Sorry if you have already checked it, but: are you sure that the
privacy switch is not toggled on your device?
https://dl.dell.com/topicspdf/inspiron-16-7610-laptop_users-guide_en-us.pdf

Can you try running yavta with something like:

yavta -l  --capture=3 -F /dev/video0

and then shading the output of yavta, and maybe also the generated
file frame-000002.bin

Thanks

On Mon, 13 Feb 2023 at 15:04, Paul Neelands <paulnee@xplornet.com> wrote:
>
> Attached is kern.log after running and closing 'cheese' and then
> 'webcamoid'.
>
> Thanks for all your input.
>
> Paul
>
> ---------------------------------------
>
> On 2/13/23 07:21, Laurent Pinchart wrote:
> > Hi Paul,
> >
> > On Sun, Feb 12, 2023 at 07:14:46PM -0500, Paul Neelands wrote:
> >> Cheese gives a black  screen with the light on.
> >>
> >> Webcamoid does the same.
> >>
> >> Zoom does the same.
> > Could you send me the kernel log after running one of those applications
> > ?
> >
> >> Attached is the output of v4l-info.
> >>
> >> All of these work on the Inspiron 15 3000 but not  on the Inspiron 16.
> >> They both have the same camera. The only difference is that the Inspiron
> >> 15 camera is on usb bus 1 while the Inspiron 16 camera is on usb bus 2.
> >>
> >> Thanks for the reply.
> >>
> >> Paul
> >>
> >> -------------------------
> >>
> >> On 2/12/23 18:23, Laurent Pinchart wrote:
> >>> Hi Paul,
> >>>
> >>> Please don't drop the mailing list in your replies.
> >>>
> >>> On Sun, Feb 12, 2023 at 05:06:37PM -0500, Paul Neelands wrote:
> >>>> Hi,
> >>>>
> >>>> Thanks for the reply.
> >>>>
> >>>> There is only one video device so I am confused about video0 & video1.
> >>>>
> >>>>
> >>>> ls -l /dev/video*
> >>>> crw-rw----+ 1 root video 81, 0 Feb 12 16:23 /dev/video0
> >>>> crw-rw----+ 1 root video 81, 1 Feb 12 16:23 /dev/video1
> >>>>
> >>>> ls -l /sys/class/video4linux/video*
> >>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video0->
> >>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video0
> >>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video1->
> >>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video1
> >>>>
> >>>> lsusb -v -d 0c45:6739 is attached as file lsusb.
> >>>>
> >>>> */var/log/kern.**log is attached as file klog*
> >>> Nothing strikes me as wrong there. You said your webcam doesn't work,
> >>> could you please elaborate ?
> >>>
> >>>> On 2/12/23 16:04, Laurent Pinchart wrote:
> >>>>> Hi Paul,
> >>>>>
> >>>>> (CC'ing the linux-media mailing list)
> >>>>>
> >>>>> On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
> >>>>>> Hi.
> >>>>>>
> >>>>>> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
> >>>>>> is the same as a Dell Inspiron 15 3000 that I have where it works. The
> >>>>>> difference between the two machines is that on the I15 it is on usb bus 1
> >>>>>> whereas it is on bus 2 on the I16.
> >>>>>>
> >>>>>> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
> >>>>>> driver for the camera uvcvideo but haven't yet figured out where it finds the
> >>>>>> usb bus. The lsusb of the camera is:
> >>>>>>
> >>>>>>     Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
> >>>>>>
> >>>>>> The kernel finds it with the demsg:
> >>>>>>
> >>>>>>      13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)
> >>>>>>            14.059462] usbcore: registered new interface driver uvcvideo
> >>>>>>
> >>>>>> I would really appreciate some help on where and how the usb bus gets
> >>>>>> enumerated for the camera.
> >>>>> What's the output of `ls -l /sys/class/video4linux/video*/` and
> >>>>> `ls -l /dev/video*` ?
> >>>>>
> >>>>> Could you provide your full kernel log, as well as the output of
> >>>>> `lsusb -v -d 0c45:6739` (if possible running as root, for instance with
> >>>>> sudo) ?



-- 
Ricardo Ribalda

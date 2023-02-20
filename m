Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF39869D2A4
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 19:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjBTSSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 13:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBTSSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 13:18:45 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1CD10A93
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:18:43 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id b20so1710373pfo.6
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bB7HnfEbR8DwGGshvGIf8PfsEuEtrDnmwFql8xUPTqk=;
        b=j00qCVoRkHUJbeYjYd4tJFfsscqtEV012UACYwSrQsf49Q1PBk1WrNvMT96jcC5q1m
         d3XbfhgM6yv1DeQHxiBymwDc4Q4eHYmpA4I84Z0Bkr3O0rpXloUHPm0KnhovslfLACou
         mVhjrK5KNJ+xNlvigd39WBLYjoyR0NI9QaJIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB7HnfEbR8DwGGshvGIf8PfsEuEtrDnmwFql8xUPTqk=;
        b=zkvhFgVKuxGUh48GQwnD53bVr8tQfxcDpY4UkyNNE6R+OcfCuDJSbrlAKX9tveNq+o
         qDIrkp4kJ0r1SQ+x5WaNL76RGYIt5VLHGhcKhgXhFvzkwRfpDH1YIeY7bXFHoNb3OGZF
         m+sGTCpUWH65uNxwUKzXJ5BtEN2qf0UJyUu096t+KLUOQoEQvRxIUTLhtq55qZzi6MDw
         grhNPYRa/OtQFabsgQa7irj8kU7D5dtkfWfHavAKDvzyvKdcObBqZXwbuKz8maOXT1l5
         fPBqmIvtfmZ3kibIs0Tg73TzeAsUR0TTfWBzj2g11zPC3oePzodwNrSuSjmMEJGhyETE
         H9VA==
X-Gm-Message-State: AO0yUKWAeyyUcUhqD90KlGIrs8C7X/eNdny8NhRfqAXVj5Szm2hlQmOc
        5X6kiwcFCBHsyiJ28JqheuE5lgqql4dTjqp/
X-Google-Smtp-Source: AK7set/MNuTnQrKx8Vc2m2ply25pAQJ+gzuc8sNII2VGPz0/OXuRdS3OiHlrzOHwRx1uQ/7mD5bjlw==
X-Received: by 2002:aa7:9466:0:b0:5aa:4df7:7ef6 with SMTP id t6-20020aa79466000000b005aa4df77ef6mr3285523pfq.7.1676917122678;
        Mon, 20 Feb 2023 10:18:42 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id i4-20020aa787c4000000b00593a1f7c3dbsm934599pfo.10.2023.02.20.10.18.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 10:18:41 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso2706841pjb.3
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 10:18:41 -0800 (PST)
X-Received: by 2002:a17:902:f784:b0:19a:b627:b260 with SMTP id
 q4-20020a170902f78400b0019ab627b260mr273227pln.12.1676917120983; Mon, 20 Feb
 2023 10:18:40 -0800 (PST)
MIME-Version: 1.0
References: <214b57ef-4cb8-c487-9f05-f44ee7e543af@xplornet.com>
 <Y+lUeASSLiGIDB4x@pendragon.ideasonboard.com> <0523daa0-ef00-19c9-a83a-6f04d8c00060@xplornet.com>
 <Y+l02luLG22ymOXC@pendragon.ideasonboard.com> <a8e734f5-4506-50c7-0bde-b57844954222@xplornet.com>
 <Y+orMX89blS1enED@pendragon.ideasonboard.com> <29625514-80d8-7b67-79b7-9e8db39b5301@xplornet.com>
 <CANiDSCvjw31+H7eYCzT7t1zs-eQ1kZHR-FQv42e5PYSNOk574w@mail.gmail.com> <eb478e7a-4e9a-69b4-b99c-b096016b76be@xplornet.com>
In-Reply-To: <eb478e7a-4e9a-69b4-b99c-b096016b76be@xplornet.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 20 Feb 2023 19:18:29 +0100
X-Gmail-Original-Message-ID: <CANiDSCu-q1Kp3Ty9d2yj9ZE3iymPbZ38290vZWqtD1BJ6dXtdg@mail.gmail.com>
Message-ID: <CANiDSCu-q1Kp3Ty9d2yj9ZE3iymPbZ38290vZWqtD1BJ6dXtdg@mail.gmail.com>
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

On Mon, 20 Feb 2023 at 19:04, Paul Neelands <paulnee@xplornet.com> wrote:
>
> Hi,
>
> Sometimes the simplest things stump me. The privacy switch was it on
> both laptops.
>
> Thanks very much for all the thought and help.

Very welcome :)

You would be surprised how many people are affected by this.

Have a great day


>
> Paul Neelands
>
> -------------------------------------
>
> On 2/20/23 11:36, Ricardo Ribalda wrote:
> > Hi Paul
> >
> > Sorry if you have already checked it, but: are you sure that the
> > privacy switch is not toggled on your device?
> > https://dl.dell.com/topicspdf/inspiron-16-7610-laptop_users-guide_en-us.pdf
> >
> > Can you try running yavta with something like:
> >
> > yavta -l  --capture=3 -F /dev/video0
> >
> > and then shading the output of yavta, and maybe also the generated
> > file frame-000002.bin
> >
> > Thanks
> >
> > On Mon, 13 Feb 2023 at 15:04, Paul Neelands <paulnee@xplornet.com> wrote:
> >> Attached is kern.log after running and closing 'cheese' and then
> >> 'webcamoid'.
> >>
> >> Thanks for all your input.
> >>
> >> Paul
> >>
> >> ---------------------------------------
> >>
> >> On 2/13/23 07:21, Laurent Pinchart wrote:
> >>> Hi Paul,
> >>>
> >>> On Sun, Feb 12, 2023 at 07:14:46PM -0500, Paul Neelands wrote:
> >>>> Cheese gives a black  screen with the light on.
> >>>>
> >>>> Webcamoid does the same.
> >>>>
> >>>> Zoom does the same.
> >>> Could you send me the kernel log after running one of those applications
> >>> ?
> >>>
> >>>> Attached is the output of v4l-info.
> >>>>
> >>>> All of these work on the Inspiron 15 3000 but not  on the Inspiron 16.
> >>>> They both have the same camera. The only difference is that the Inspiron
> >>>> 15 camera is on usb bus 1 while the Inspiron 16 camera is on usb bus 2.
> >>>>
> >>>> Thanks for the reply.
> >>>>
> >>>> Paul
> >>>>
> >>>> -------------------------
> >>>>
> >>>> On 2/12/23 18:23, Laurent Pinchart wrote:
> >>>>> Hi Paul,
> >>>>>
> >>>>> Please don't drop the mailing list in your replies.
> >>>>>
> >>>>> On Sun, Feb 12, 2023 at 05:06:37PM -0500, Paul Neelands wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> Thanks for the reply.
> >>>>>>
> >>>>>> There is only one video device so I am confused about video0 & video1.
> >>>>>>
> >>>>>>
> >>>>>> ls -l /dev/video*
> >>>>>> crw-rw----+ 1 root video 81, 0 Feb 12 16:23 /dev/video0
> >>>>>> crw-rw----+ 1 root video 81, 1 Feb 12 16:23 /dev/video1
> >>>>>>
> >>>>>> ls -l /sys/class/video4linux/video*
> >>>>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video0->
> >>>>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video0
> >>>>>> lrwxrwxrwx 1 root root 0 Feb 12 16:23 /sys/class/video4linux/video1->
> >>>>>> ../../devices/pci0000:00/0000:00:14.0/usb2/2-6/2-6:1.0/video4linux/video1
> >>>>>>
> >>>>>> lsusb -v -d 0c45:6739 is attached as file lsusb.
> >>>>>>
> >>>>>> */var/log/kern.**log is attached as file klog*
> >>>>> Nothing strikes me as wrong there. You said your webcam doesn't work,
> >>>>> could you please elaborate ?
> >>>>>
> >>>>>> On 2/12/23 16:04, Laurent Pinchart wrote:
> >>>>>>> Hi Paul,
> >>>>>>>
> >>>>>>> (CC'ing the linux-media mailing list)
> >>>>>>>
> >>>>>>> On Sun, Feb 12, 2023 at 02:51:33PM -0500, Paul Neelands wrote:
> >>>>>>>> Hi.
> >>>>>>>>
> >>>>>>>> I have a new dell Inspiron 16 5620 where the camera doesn't work.  The camera
> >>>>>>>> is the same as a Dell Inspiron 15 3000 that I have where it works. The
> >>>>>>>> difference between the two machines is that on the I15 it is on usb bus 1
> >>>>>>>> whereas it is on bus 2 on the I16.
> >>>>>>>>
> >>>>>>>> I downloaded and built the latest kernel 6.2.0-rc7 and no joy. I looked at your
> >>>>>>>> driver for the camera uvcvideo but haven't yet figured out where it finds the
> >>>>>>>> usb bus. The lsusb of the camera is:
> >>>>>>>>
> >>>>>>>>      Bus 002 Device 004: ID 0c45:6739 Microdia Integrated_Webcam_FHD
> >>>>>>>>
> >>>>>>>> The kernel finds it with the demsg:
> >>>>>>>>
> >>>>>>>>       13.999455] usb 2-6: Found UVC 1.00 device Integrated_Webcam_FHD (0c45:6739)
> >>>>>>>>             14.059462] usbcore: registered new interface driver uvcvideo
> >>>>>>>>
> >>>>>>>> I would really appreciate some help on where and how the usb bus gets
> >>>>>>>> enumerated for the camera.
> >>>>>>> What's the output of `ls -l /sys/class/video4linux/video*/` and
> >>>>>>> `ls -l /dev/video*` ?
> >>>>>>>
> >>>>>>> Could you provide your full kernel log, as well as the output of
> >>>>>>> `lsusb -v -d 0c45:6739` (if possible running as root, for instance with
> >>>>>>> sudo) ?
> >
> >



-- 
Ricardo Ribalda

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2065EC13B
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 13:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiI0L0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 07:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiI0L0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 07:26:25 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6414414FE33
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 04:24:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lh5so19958555ejb.10
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bsaijiz4iY9kKYP9rjqBsvBldnS5LSMmLEtqS7Y5Q94=;
        b=GRireMXigqonUT55C9CMAP1O+zdE4SjQkiK+USpatK83SEz+ltum6hikAZ0vVu5IMQ
         wE+Om0U9SpwhtojKxdQCzYAdmYZBLbowf+BPyExM8ZIaSLUmrhOMOeEYlxrmfebeLEqf
         TsTaFmyXes2ylzt0pyPw7Zv3u4+c85oVmBkaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bsaijiz4iY9kKYP9rjqBsvBldnS5LSMmLEtqS7Y5Q94=;
        b=qHOyoyrSckChXAIN5jO62aPifZOzoRoAoXJj2bCcxQA5zgfStBII8I0RrTx4CuB//P
         dw4ioqJDtZvtFGHl+qZcw5/DbUaj1UWOotUs9WcgaYZiREEuYlS2GH951CD+grv4DFp9
         E6aveuhep8ZuyJcA41C1SleQYq5VhGdHeOcNsU1ieQRKPpnvJs5j5ofmLxiot9LSBFbn
         2LOys+jXRIICGh8NRTDEg9w9oD1YCUfosN/FDbLgW6oR7neNm3UExMnxW268h009aVv/
         5FFg8zlPMqhNxmNDTSHJcyEftmdHeNqcMBPO11alt5174aeYIAc06yjtwCuScwcj5x9S
         jDow==
X-Gm-Message-State: ACrzQf2Kk0+5+DHg2vbgJtsdX/IpN09qkJLIoEf7y7v3U2lVCudTki5o
        lilA4iDffOCKA0mCXWkvKFnpZ2CRFiQtJpAp
X-Google-Smtp-Source: AMsMyM6T6QO5HEocBsnB0ezlzQczFSW98uIvLJUlFEpv7t/iM3t4prpqIqd7HFl4m0nzUk49AEsoYA==
X-Received: by 2002:a17:907:a0c7:b0:77c:b9cb:be17 with SMTP id hw7-20020a170907a0c700b0077cb9cbbe17mr22159687ejc.335.1664277839309;
        Tue, 27 Sep 2022 04:23:59 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c751000000b0044ee91129f9sm1072509eds.70.2022.09.27.04.23.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 04:23:59 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id sd10so20035596ejc.2
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 04:23:58 -0700 (PDT)
X-Received: by 2002:a17:906:2699:b0:781:a473:9791 with SMTP id
 t25-20020a170906269900b00781a4739791mr22684480ejc.644.1664277838586; Tue, 27
 Sep 2022 04:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
 <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com> <20220926163449.380463ca@deangelis.fenrir.org.uk>
In-Reply-To: <20220926163449.380463ca@deangelis.fenrir.org.uk>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 27 Sep 2022 13:23:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
Message-ID: <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
To:     Brian Morrison <bdm@fenrir.org.uk>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brian

It is pretty weird that the driver is unmmaped without any extra
message on dmesg.
What distro are you using? Are you using any kind of virtualization scheme?

Could you try the following?

1) Reboot
2) sudo dmesg -c > dmesg.1
3) v4l2-ctl --list-devices
4) sudo dmesg -c > dmesg.2
5) find /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0
6) for a in $(find /sys/devices/ | grep authorized); do echo $a; cat $a; done

Then share the output of the commands + dmesg.1 and dmesg.2

I hope to see some disconnect message, or the device being
unauthorized, otherwise I am a bit out of ideas :)

Thanks

On Mon, 26 Sept 2022 at 17:34, Brian Morrison <bdm@fenrir.org.uk> wrote:
>
> On Mon, 26 Sep 2022 09:22:12 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > HI Brian
> >
> > /dev/video0 does not seem to be your Foscam, it is a virtual camera
> > created by OBS.
> >
> > Could you try running
> > ls -la /sys/class/video4linux/
> > find
> > /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/
> >
> > To figure out if there is an actual camera there.
> >
> > Thanks!
>
> Hmm, for some reason that last command should have worked but didn't.
>
> Using ll I get this:
>
> [bdm@deangelis SPECS]$ ll /sys/devices/pci0000\:00/0000\:00\:1d.2/0000\:04\:00.0/usb3/3-0:1.0/
> total 0 -rw-r--r--. 1 root root 4096 Sep 26 16:30 authorized
> -r--r--r--. 1 root root 4096 Sep 26 16:30 bAlternateSetting
> -r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceClass
> -r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceNumber
> -r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceProtocol
> -r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceSubClass
> -r--r--r--. 1 root root 4096 Sep 26 16:30 bNumEndpoints
> lrwxrwxrwx. 1 root root    0 Sep 26 16:30 driver ->
> ../../../../../../bus/usb/drivers/hub drwxr-xr-x. 3 root root    0 Sep
> 26 16:30 ep_81 -r--r--r--. 1 root root 4096 Sep 26 16:30 modalias
> drwxr-xr-x. 2 root root    0 Sep 25 22:22 power
> lrwxrwxrwx. 1 root root    0 Sep 25 22:22 subsystem ->
> ../../../../../../bus/usb -r--r--r--. 1 root root 4096 Sep 26 16:30
> supports_autosuspend -rw-r--r--. 1 root root 4096 Sep 25 22:22 uevent
> drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port1
> drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port2
> drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port3
> drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port4
>
> and using find I get this:
>
> [bdm@deangelis SPECS]$ find /sys/devices/pci0000\:00/0000\:00\:1d.2/0000\:04\:00.0/usb3/3-0:1.0/
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/location
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/peer
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_active_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_status
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/pm_qos_no_power_off
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/autosuspend_delay_ms
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_suspended_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/control
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/device
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/over_current_count
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/connect_type
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/quirks
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bAlternateSetting
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/location
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/peer
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_active_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_status
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/pm_qos_no_power_off
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/autosuspend_delay_ms
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_suspended_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/control
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/device
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/over_current_count
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/connect_type
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/quirks
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/authorized
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bInterval
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/interval
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_active_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_status
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/autosuspend_delay_ms
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_suspended_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/control
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/type
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bmAttributes
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/wMaxPacketSize
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/direction
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bLength
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bEndpointAddress
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceSubClass
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/driver
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceNumber
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/location
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/peer
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_active_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_status
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/pm_qos_no_power_off
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/autosuspend_delay_ms
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_suspended_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/control
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/device
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/over_current_count
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/connect_type
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/quirks
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceProtocol
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/subsystem
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceClass
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/uevent
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/location
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/peer
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_active_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_status
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/pm_qos_no_power_off
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/autosuspend_delay_ms
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_suspended_time
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/control
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/device
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/over_current_count
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/connect_type
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/quirks
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bNumEndpoints
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/supports_autosuspend
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/modalias
> [bdm@deangelis SPECS]$
>
> Sorry about that.
>
> --
>
> Brian Morrison



-- 
Ricardo Ribalda

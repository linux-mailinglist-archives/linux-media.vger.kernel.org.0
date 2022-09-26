Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 520595EACEA
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 18:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiIZQqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 12:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiIZQqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 12:46:15 -0400
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6C5657E
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 08:34:52 -0700 (PDT)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1ocq89-001dx9-2t;
        Mon, 26 Sep 2022 16:34:49 +0100
Date:   Mon, 26 Sep 2022 16:34:49 +0100
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
Message-ID: <20220926163449.380463ca@deangelis.fenrir.org.uk>
In-Reply-To: <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
        <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.0git1370 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 26 Sep 2022 09:22:12 +0200
Ricardo Ribalda <ribalda@chromium.org> wrote:

> HI Brian
> 
> /dev/video0 does not seem to be your Foscam, it is a virtual camera
> created by OBS.
> 
> Could you try running
> ls -la /sys/class/video4linux/
> find
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/
> 
> To figure out if there is an actual camera there.
> 
> Thanks!

Hmm, for some reason that last command should have worked but didn't.

Using ll I get this:

[bdm@deangelis SPECS]$ ll /sys/devices/pci0000\:00/0000\:00\:1d.2/0000\:04\:00.0/usb3/3-0:1.0/
total 0 -rw-r--r--. 1 root root 4096 Sep 26 16:30 authorized
-r--r--r--. 1 root root 4096 Sep 26 16:30 bAlternateSetting
-r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceClass
-r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceNumber
-r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceProtocol
-r--r--r--. 1 root root 4096 Sep 25 22:22 bInterfaceSubClass
-r--r--r--. 1 root root 4096 Sep 26 16:30 bNumEndpoints
lrwxrwxrwx. 1 root root    0 Sep 26 16:30 driver ->
../../../../../../bus/usb/drivers/hub drwxr-xr-x. 3 root root    0 Sep
26 16:30 ep_81 -r--r--r--. 1 root root 4096 Sep 26 16:30 modalias
drwxr-xr-x. 2 root root    0 Sep 25 22:22 power
lrwxrwxrwx. 1 root root    0 Sep 25 22:22 subsystem ->
../../../../../../bus/usb -r--r--r--. 1 root root 4096 Sep 26 16:30
supports_autosuspend -rw-r--r--. 1 root root 4096 Sep 25 22:22 uevent
drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port1
drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port2
drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port3
drwxr-xr-x. 3 root root    0 Sep 25 22:22 usb3-port4

and using find I get this:

[bdm@deangelis SPECS]$ find /sys/devices/pci0000\:00/0000\:00\:1d.2/0000\:04\:00.0/usb3/3-0:1.0/
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/location
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/peer
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_active_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_status
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/pm_qos_no_power_off
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/autosuspend_delay_ms
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/runtime_suspended_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/power/control
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/device
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/over_current_count
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/connect_type
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port4/quirks
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bAlternateSetting
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/location
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/peer
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_active_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_status
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/pm_qos_no_power_off
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/autosuspend_delay_ms
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/runtime_suspended_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/power/control
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/device
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/over_current_count
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/connect_type
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port2/quirks
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/authorized
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bInterval
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/interval
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_active_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_status
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/autosuspend_delay_ms
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/runtime_suspended_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/power/control
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/type
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bmAttributes
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/wMaxPacketSize
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/direction
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bLength
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/ep_81/bEndpointAddress
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceSubClass
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/driver
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceNumber
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/location
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/peer
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_active_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_status
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/pm_qos_no_power_off
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/autosuspend_delay_ms
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/runtime_suspended_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/power/control
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/device
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/over_current_count
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/connect_type
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port3/quirks
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceProtocol
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/subsystem
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bInterfaceClass
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/uevent
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/location
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/peer
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_active_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_status
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/pm_qos_no_power_off
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/autosuspend_delay_ms
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/runtime_suspended_time
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/power/control
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/device
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/over_current_count
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/connect_type
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/usb3-port1/quirks
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/bNumEndpoints
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/supports_autosuspend
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-0:1.0/modalias
[bdm@deangelis SPECS]$ 

Sorry about that.

-- 

Brian Morrison

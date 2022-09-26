Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366495EA650
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 14:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbiIZMiz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 26 Sep 2022 08:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbiIZMi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 08:38:26 -0400
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C881E642F0
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 04:15:38 -0700 (PDT)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1ocm3s-001aun-2Z;
        Mon, 26 Sep 2022 12:14:08 +0100
Date:   Mon, 26 Sep 2022 12:14:08 +0100
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
Message-ID: <20220926121408.4fec0b0c@deangelis.fenrir.org.uk>
In-Reply-To: <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
        <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.0git1370 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
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

[bdm@deangelis ~]$ ls -la /sys/class/video4linux/
total 0
drwxr-xr-x.  2 root root 0 Sep 25 22:22 .
drwxr-xr-x. 73 root root 0 Sep 25 22:22 ..
lrwxrwxrwx.  1 root root 0 Sep 25 22:22 video0 ->
../../devices/virtual/video4linux/video0 
[bdm@deangelis ~]$ find
/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/
find:
‘/sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/’:
No such file or directory 
[bdm@deangelis ~]$ 

There we are, looks like it is missing in action.

The /dev/video0 node was present before I installed OBS, maybe created
by one of the other packages, probably v4l2loopback.

Since lsusb shows the device I assume this is something not recognising
the camera further up the software chain.

-- 

Brian Morrison


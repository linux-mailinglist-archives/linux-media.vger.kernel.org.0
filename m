Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E86925EC485
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 15:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbiI0NdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 09:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbiI0Ncl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 09:32:41 -0400
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA8431EC5
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:30:12 -0700 (PDT)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1odAf4-002Nyo-0P;
        Tue, 27 Sep 2022 14:30:10 +0100
Date:   Tue, 27 Sep 2022 14:30:09 +0100
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Foscam W21 webcam not working in Fedora 37 with kernel-5.19.11
Message-ID: <20220927143009.125b8ccc@deangelis.fenrir.org.uk>
In-Reply-To: <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
        <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
        <20220926163449.380463ca@deangelis.fenrir.org.uk>
        <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
        <20220927135459.7d614076@deangelis.fenrir.org.uk>
        <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.0git1371 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Tue, 27 Sep 2022 15:02:23 +0200
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Hi Brian
> 
> 
> This one is a bit weird:
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
> 0
> 
> can you try:
> echo 1 >
> /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
> dmesg
> 
> Thanks!
> 

OK, this is the result, I used su -c '<command>' as it wouldn't work
with plain sudo for some reason:

[  823.052067] usb 3-3: Found UVC 1.00 device USB 2.0 Camera (0c45:636b)
[  823.074519] input: USB 2.0 Camera: USB Camera as /devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/input/input27
[  823.082502] usb 3-3: 3:1: cannot get freq at ep 0x84
[  823.113857] usb 3-3: authorized to connect
[  823.203123] usb 3-3: 3:1: cannot get freq at ep 0x84
[  823.214318] usb 3-3: 3:1: cannot get freq at ep 0x84

[bdm@deangelis ~]$ ll /dev/video*
crw-rw----+ 1 root video 81, 0 Sep 27 14:05 /dev/video0
crw-rw----+ 1 root video 81, 1 Sep 27 14:18 /dev/video1
crw-rw----+ 1 root video 81, 2 Sep 27 14:18 /dev/video2
[bdm@deangelis ~]$ 

I started Cheese and suddenly I have video, also pipewire reports a new
audio source as well.

I wonder how this can be made to work automatically. Could it just be a
quirk of this particular USB VID/PID? I note that the PID is not listed
in the hwdata USB IDs.

-- 

Brian Morrison

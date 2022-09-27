Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1D35EC495
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 15:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbiI0Nfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 09:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbiI0NfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 09:35:11 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3056646D89
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:35:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dv25so20677838ejb.12
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=quYi8vk6BGKiOZpbPAFI6hDXhbOo5yI4oC5KTT1HeU4=;
        b=cAMQthbFdm94tDPoYxsYaHzh8vAX3AnGHNIIhvNRKwzp8A3lA2HJCfWXKhzj+JhMdw
         ny+rlYTwNKOWdTu4Fh2BDZ42k7+93+t7C7svBRGC4JaqBdRztoWiHZJU+eJ3iASnDM8C
         d+sK9U3dht5DNWZ4Y5KHzE6kB2rf1QDDN6saU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=quYi8vk6BGKiOZpbPAFI6hDXhbOo5yI4oC5KTT1HeU4=;
        b=xWUjgji3ihqpyXD7rJKAbJbOSwMIZtPZvuduFZCInpC7GKShLLBdSYqlkgA661Y3/v
         zFmnV4IryXlA7jdU2AkXi8ztMnKUFgQwdqK1lR8d2vC6UJX6NebUpfgRoBS2suT1QnTe
         k3wt7NJXaetSQOtvAgOVY81fpJXcnfKmXhJOjITJnwEnvE0QRdAXehBN0sAIflxSuiSy
         jo/pHMxtwRQRVedy/yDG6YYmI0XPzfm4ZO7LdIt/SgBFl6xLwjoH/X2eIer99tcVb0lX
         oczXAChEvBpvf36oHVImRrXPXSptOGqgRxzbkuUy9yRR7o022+QbV8JEl8JSDll/I1f9
         EQKA==
X-Gm-Message-State: ACrzQf2o7Unj04jRBmpD0wpY9XIeOsMwAYL4/OoJ8l65i9GQ7MuppM7O
        MYmsN5vIaJ979rxSprPkoCvUCoGGhvYKLKmJlE0=
X-Google-Smtp-Source: AMsMyM7sqa4d9glFI6upV4Bwyay4DWSBZNDXNEazw/qd6lk+KjLICkNMjT3WGjkKybAc99yGc9hEEw==
X-Received: by 2002:a17:907:7f02:b0:73d:dffa:57b3 with SMTP id qf2-20020a1709077f0200b0073ddffa57b3mr23776241ejc.19.1664285703562;
        Tue, 27 Sep 2022 06:35:03 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id kx17-20020a170907775100b007262a5e2204sm810929ejc.153.2022.09.27.06.35.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:35:03 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id bj12so20685789ejb.13
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:35:03 -0700 (PDT)
X-Received: by 2002:a17:907:3f0f:b0:782:395f:cd69 with SMTP id
 hq15-20020a1709073f0f00b00782395fcd69mr22837837ejc.406.1664285702815; Tue, 27
 Sep 2022 06:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
 <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
 <20220926163449.380463ca@deangelis.fenrir.org.uk> <CANiDSCuT4TJLDTXR7760wRBn85OQXKKj0z-jPCAW5MXsGMB5uw@mail.gmail.com>
 <20220927135459.7d614076@deangelis.fenrir.org.uk> <CANiDSCvSxtjbs4WogLyRAVALSN+HpCLC15smon3kHMnGqGgN+g@mail.gmail.com>
 <20220927143009.125b8ccc@deangelis.fenrir.org.uk>
In-Reply-To: <20220927143009.125b8ccc@deangelis.fenrir.org.uk>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 27 Sep 2022 15:34:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCtWnKYbrEMBq3sfk6UfmRNzwS1OAuFjQzvFQ5ct9vobfg@mail.gmail.com>
Message-ID: <CANiDSCtWnKYbrEMBq3sfk6UfmRNzwS1OAuFjQzvFQ5ct9vobfg@mail.gmail.com>
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

Great news :)

I am afraid that you need to ask in the fedora forum/ML why they are
not authorizing the device by default. Maybe some user reported some
malfunction with that device?

You can always move to Debian (or ChromeOS :P)


Regards!



On Tue, 27 Sept 2022 at 15:30, Brian Morrison <bdm@fenrir.org.uk> wrote:
>
> On Tue, 27 Sep 2022 15:02:23 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > Hi Brian
> >
> >
> > This one is a bit weird:
> > /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
> > 0
> >
> > can you try:
> > echo 1 >
> > /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/authorized
> > dmesg
> >
> > Thanks!
> >
>
> OK, this is the result, I used su -c '<command>' as it wouldn't work
> with plain sudo for some reason:
>
> [  823.052067] usb 3-3: Found UVC 1.00 device USB 2.0 Camera (0c45:636b)
> [  823.074519] input: USB 2.0 Camera: USB Camera as /devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/input/input27
> [  823.082502] usb 3-3: 3:1: cannot get freq at ep 0x84
> [  823.113857] usb 3-3: authorized to connect
> [  823.203123] usb 3-3: 3:1: cannot get freq at ep 0x84
> [  823.214318] usb 3-3: 3:1: cannot get freq at ep 0x84
>
> [bdm@deangelis ~]$ ll /dev/video*
> crw-rw----+ 1 root video 81, 0 Sep 27 14:05 /dev/video0
> crw-rw----+ 1 root video 81, 1 Sep 27 14:18 /dev/video1
> crw-rw----+ 1 root video 81, 2 Sep 27 14:18 /dev/video2
> [bdm@deangelis ~]$
>
> I started Cheese and suddenly I have video, also pipewire reports a new
> audio source as well.
>
> I wonder how this can be made to work automatically. Could it just be a
> quirk of this particular USB VID/PID? I note that the PID is not listed
> in the hwdata USB IDs.
>
> --
>
> Brian Morrison



-- 
Ricardo Ribalda

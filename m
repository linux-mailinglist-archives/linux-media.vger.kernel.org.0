Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5EC5E9A5B
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 09:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbiIZHWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 03:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiIZHW2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 03:22:28 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C64727B07
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 00:22:26 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id hy2so12071051ejc.8
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 00:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=arEExKrd27xpcTvK4rtW7+Qvh3aYRvXu9EvnpZK2cj0=;
        b=DoOrvjFbE0Adr1A35SLOoMk9V9qmg44OrpXZ3JE69wpoYVtjmrUfIHPs3mRZjNfDg5
         hUL/cseVsGwdQCIrTfeU/Lq7Qm+zWQsKKFglse4DDnk5QlJ/84fFwNOqe4rRM+dPOPsd
         fpB50Wjt3YP1nOaFEiHlw3S76lU8lkeEHRakU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=arEExKrd27xpcTvK4rtW7+Qvh3aYRvXu9EvnpZK2cj0=;
        b=lVmcijs4drvK9WOn/vsZs7rCRoDxTBOkbe3XX6cERhptSqff0J1Ib1S6UcEJJ77Gi1
         YvrA4F69OMKp0LwoYD1/7SjRZ+eAebK/+1ESRMgoXzJuYqaHoKYKaNIcf0kVmRsEpaT+
         CNFVw8jgG3Wk6RchTScHjL6P46NTWT2DotGEP/CBL0B8qzOf8wQC//kgilTgiaAeV+Rq
         DmztIgIY0YQMhcKGyJQQwl7PD/6u9ingLCDXDyTZ95Z0LyPGn66SeRgBKhZ6T9eCwfGc
         6eVmqXV3R9QPJx8mmdRf6XeRHMvg6j7ZdVgEWOVCwfFETgedSlMLfTulZKyfMDKCw+vW
         b6bQ==
X-Gm-Message-State: ACrzQf3NHKL998tj281LoXO9NUgkN9OLq06CbDALg03C1pu0h+8JVNqY
        jXhYZVGu8WwpLbYLN/lH95eho3r+Ka8ieQ==
X-Google-Smtp-Source: AMsMyM4LI9DN7du+l1gklRNfp5HhYNCxnNUwZpdAekofUdFqjPNWJ/HJzYnNfFx2/oYzcHcNcREstQ==
X-Received: by 2002:a17:907:c13:b0:781:d3c2:5015 with SMTP id ga19-20020a1709070c1300b00781d3c25015mr16736742ejc.457.1664176944808;
        Mon, 26 Sep 2022 00:22:24 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id qx10-20020a170906fcca00b0074182109623sm7975892ejb.39.2022.09.26.00.22.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 00:22:24 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id e18so7754329edj.3
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 00:22:24 -0700 (PDT)
X-Received: by 2002:a05:6402:298b:b0:44f:20a:2db2 with SMTP id
 eq11-20020a056402298b00b0044f020a2db2mr21116022edb.138.1664176943666; Mon, 26
 Sep 2022 00:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
In-Reply-To: <20220926001230.65b0683c@deangelis.fenrir.org.uk>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 26 Sep 2022 09:22:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
Message-ID: <CANiDSCv1Zc+0sRmARu3-dnY4ian_HLBbZ13mb-G7hWDLGmMVXg@mail.gmail.com>
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

HI Brian

/dev/video0 does not seem to be your Foscam, it is a virtual camera
created by OBS.

Could you try running
ls -la /sys/class/video4linux/
find /sys/devices/pci0000:00/0000:00:1d.2/0000:04:00.0/usb3/3-3/3-3:1.0/

To figure out if there is an actual camera there.

Thanks!

On Mon, 26 Sept 2022 at 02:31, Brian Morrison <bdm@fenrir.org.uk> wrote:
>
> Hi
>
> I have a webcam which claims to work on Linux, but I cannot get it to
> do anything although with some extra packages installed (v4l2 related)
> I did at least get uvcvideo and related modules loaded and a /dev/video0
> device to appear, unfortunately that's it, no available video or audio
> in guvcview, OBS or cheese.
>
> v4l2 --list-device shows this:
>
> OBS Virtual Camera (platform:v4l2loopback-000):
>         /dev/video0
>
> v4l2-ctl --list-formats-ext shows this:
>
> ioctl: VIDIOC_ENUM_FMT
>         Type: Video Capture
>
> I have attached dmesg and lsusb logs as requested.
>
> Please would someone have a look at this and see whether it is lack of
> device recognition in the uvcvideo driver or other kernel-related
> problem.
>
> Thanks!
>
> --
>
> Brian Morrison
>


-- 
Ricardo Ribalda

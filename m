Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E2E45F249
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 17:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378683AbhKZQlw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 11:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378693AbhKZQjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 11:39:52 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA45EC06175E
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 08:24:58 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id z6so7016071plk.6
        for <linux-media@vger.kernel.org>; Fri, 26 Nov 2021 08:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=08yV4KanwEu2zkDpr80UVvoMXaCWawSrkw5VFDhOPzk=;
        b=Fg75CI7T52zjOwd7Hn51B6+LIqP901GCs2UlWSz23clqDsc7Ylc7rv1QMGpgmpS5Uq
         aAGdCGhK4MTiI/eJBWzdJo3lFCIMm0v4AoeLOFzcmYrG/1lqBplN+F2NSjHap9SvETAu
         MpGYUA69JomC6alGhZmwWstgPPyE1wyLkBrg6dD+B262CWOxIirZzvAKmTTV2ZR6Nn8m
         oPd3kT81J2ii1PkI9bihvEcZ/9wkwzm+nhYvvc/4Gi6pUpkRYKfFHSfmsLqWspRQOwA8
         b0ReiHmtjrBCyl+4npegScpvj3e0MhceKGAKmMmnQQvnjQaF5HspHfp1bGuAEkE1yvL1
         sIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08yV4KanwEu2zkDpr80UVvoMXaCWawSrkw5VFDhOPzk=;
        b=tOzB74H7RfB3ZAC1Fj3/eKOzTn9q1q3EEYiu7l4LbQzUSyDJTxTCi6qkU9zFIC2X+e
         Ez8qnMU5XOZVl0jBTwx8srFMPcU/sGEP4OGkc/VTU7TR9Q+IUYa2yk1QHvqKGl+X64RU
         G8SWOtBMz2LVY+FEbCzj7baNUyUykwwGnrysVQhigmyzJtfpbZhfACbCWwyt3tBuoQxW
         McModHthImTt0tiSDEEDijOcABr9cxZnbGuuOSW7p0fKe7YC543Re9mFSVh0GZdz+t2M
         wU0Q55sUT4oyyUPZkEBMa4+tD63msT7onhRFllI+VE/x3d71Vq5rIZIPC1BCkochLdXq
         Lgww==
X-Gm-Message-State: AOAM531efQy9cpmx1sPjupm8FtvfacPpCorlov1F/hkgLzX08S4MdB+A
        xGCLtTuMDyZQdg9ZrPEcp7jNkXt2WxWE2Fr2QCo=
X-Google-Smtp-Source: ABdhPJw8Y6FXZjCQXQ5TZw9jU1NJpIPOuIje+Jrt8LPJ2MaUl9Je1nIUNmqepvttHIkgGwKQihBxb3Vy7555ADBwWbM=
X-Received: by 2002:a17:902:e8d4:b0:143:88c2:e2c9 with SMTP id
 v20-20020a170902e8d400b0014388c2e2c9mr38529682plg.12.1637943898058; Fri, 26
 Nov 2021 08:24:58 -0800 (PST)
MIME-Version: 1.0
References: <3158098a-c508-a8e0-dfba-d30b59c26d34@schepmann.de>
In-Reply-To: <3158098a-c508-a8e0-dfba-d30b59c26d34@schepmann.de>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 26 Nov 2021 17:24:41 +0100
Message-ID: <CAPybu_0Mj7vYth9yMfs1s6kMKi6aUN+FPJOFcPh0oKULD=ex7g@mail.gmail.com>
Subject: Re: camera not supported in your device-list does not work
To:     Felix Schepmann <felix@schepmann.de>,
        Ricardo Ribalda <ribalda@chromium.org>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Felix

What is the output of

lsusb -v -d 0c45:6366
v4l2-ctl -d /dev/videoX --all (where videoX is the camera)
yavta -c /dev/videoX

Thanks!



On Mon, Oct 18, 2021 at 6:48 PM Felix Schepmann <felix@schepmann.de> wrote:
>
> Hello,
>
> i am using a webcam with the following dmesg-output when inserting,
> which is not showing any video signal:
>
> [  405.386690] usb 3-1.2: USB disconnect, device number 4
> [  411.018485] usb 3-1.1: USB disconnect, device number 3
> [  414.105490] usb 3-1.1: new high-speed USB device number 7 using xhci_hcd
> [  414.285316] usb 3-1.1: New USB device found, idVendor=0c45,
> idProduct=6366, bcdDevice= 1.00
> [  414.285331] usb 3-1.1: New USB device strings: Mfr=2, Product=1,
> SerialNumber=3
> [  414.285338] usb 3-1.1: Product: USB 2.0 Camera
> [  414.285343] usb 3-1.1: Manufacturer: Sonix Technology Co., Ltd.
> [  414.285348] usb 3-1.1: SerialNumber: SN0001
> [  414.288227] uvcvideo: Found UVC 1.00 device USB 2.0 Camera (0c45:6366)
> [  414.315921] input: USB 2.0 Camera: USB Camera as
> /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1:1.0/input/input52
> [  414.365853] usb 3-1.1: 3:1: cannot get freq at ep 0x84
> [  414.721869] usb 3-1.1: 3:1: cannot get freq at ep 0x84
> [  414.791189] usb 3-1.1: 3:1: cannot get freq at ep 0x84
>
> Maybe you could tell me what else of information I should show you?
>
> When I connect to this cam from e.g. firefox it's activity light turns
> on, but no video-stream ist shown in my Web-conferencing screen.
>
> regards, Felix
>
>
>


-- 
Ricardo Ribalda

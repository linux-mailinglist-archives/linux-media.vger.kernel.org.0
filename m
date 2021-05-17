Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC77D383CCE
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 20:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbhEQTA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 15:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbhEQTA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 15:00:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B6FC061573;
        Mon, 17 May 2021 11:59:08 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so10332700lfc.9;
        Mon, 17 May 2021 11:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4qSGZojA2L37VBn6KsFB5EWiPOL4QV+yqxg5pWMuYj4=;
        b=p9q3Qpl0is/UEgOnpuX87CjstLGXoRg269j38svTKcecw1KgRblMrpAwSzrGLKCCCX
         hPgVyjBX6ZH1gA1ZW+8mTUTE6Ih0Wq67BWVOrRBiw34uy0v2ow/dKdkIeRAVbQ1tBltA
         7PHUrjE9TWvkLgUALtjaJkE204MYe5J2yMxHx6j3siCGQdDAh7QxxrbQdAZo19KqKobt
         GEoQb2OkAKEgv1LJZQt3DqFYaOWabmWyAOzYMfw6gtxb4x0IRGxIakON6XPqp+Rly7VB
         wCJ+CgpeH5AnkgkE2xuUg3q5aCas+kEYXvWdshwdUM9ur0EwgPrkO9esYSbyY6Fbzl6s
         gCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4qSGZojA2L37VBn6KsFB5EWiPOL4QV+yqxg5pWMuYj4=;
        b=dcWkcUkW8HB1mCeYlqe/zkvDQM1jopaEg18KD4BGWE6OwwOMK/5Z1hMg3xreCClpPK
         ie1Et0juyb+BVb4PuRSiRLR9WDBEgJ3OWGYHSnys9UhunopMOSPUMC7WNTp6yKnrnIMV
         GEQgm4WRibioAyatHkQVREANiLYeyQREDxWVFK7eyJEntn4src+HspfgIRi0B7dJUYpF
         Dq++MfyNNQqKZM5u4TkjmwaNtSAvZWpgwEdzcsqRmVrNiaGlpW4pnIpULlaLvFWvJQte
         c+N3VHGU1d7MgnFK9yZ691CrpbUxT+r+0PYlWWoPKrB/V3gdD+xvQhnNwHhSj1HtJkYZ
         8Q5w==
X-Gm-Message-State: AOAM532OgcpIO2KpBwC97NIxq2DFnaIIiAnlkgsnyLcrM6fslyYRXxlq
        aiaJnOWJ5UzWhfbG6FW0CjY=
X-Google-Smtp-Source: ABdhPJzmNFf0wdqlGTg+dCfZmUvQqVrLqTrMSISIxQzG2Eh7tgDfXyCdyJICdBFXm0/Myed2+t/4bA==
X-Received: by 2002:ac2:546b:: with SMTP id e11mr839574lfn.395.1621277947307;
        Mon, 17 May 2021 11:59:07 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.227])
        by smtp.gmail.com with ESMTPSA id s10sm3025326ljc.58.2021.05.17.11.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 11:59:07 -0700 (PDT)
Date:   Mon, 17 May 2021 21:59:04 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     syzbot <syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] memory leak in zr364xx_start_readpipe
Message-ID: <20210517215904.7d915011@gmail.com>
In-Reply-To: <0000000000004b90e405c285040f@google.com>
References: <0000000000004b90e405c285040f@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 17 May 2021 04:37:22 -0700
syzbot <syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d72cd4ad Merge tag 'scsi-misc' of
> git://git.kernel.org/pub.. git tree:       upstream
> console output:
> https://syzkaller.appspot.com/x/log.txt?x=107c2b85d00000 kernel
> config:  https://syzkaller.appspot.com/x/.config?x=337dc545ba10a406
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=af4fa391ef18efdd5f69 syz
> repro:
> https://syzkaller.appspot.com/x/repro.syz?x=1245a733d00000 C
> reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f13de1d00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the
> commit: Reported-by:
> syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com
> 
> BUG: memory leak
> unreferenced object 0xffff8881112c1600 (size 192):
>   comm "kworker/1:5", pid 8088, jiffies 4294943845 (age 8.070s)
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 18 16 2c 11 81 88 ff ff  ..........,.....
>   backtrace:
>     [<ffffffff82baedf6>] kmalloc include/linux/slab.h:561 [inline]
>     [<ffffffff82baedf6>] usb_alloc_urb+0x66/0xe0
> drivers/usb/core/urb.c:74 [<ffffffff82f7cce8>]
> zr364xx_start_readpipe+0x78/0x130
> drivers/media/usb/zr364xx/zr364xx.c:1022 [<ffffffff84251dfc>]
> zr364xx_board_init drivers/media/usb/zr364xx/zr364xx.c:1383 [inline]
> [<ffffffff84251dfc>] zr364xx_probe+0x6a3/0x851
> drivers/media/usb/zr364xx/zr364xx.c:1516 [<ffffffff82bb6507>]
> usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
> [<ffffffff826018a9>] really_probe+0x159/0x500 drivers/base/dd.c:576
> [<ffffffff82601cdb>] driver_probe_device+0x8b/0x100
> drivers/base/dd.c:763 [<ffffffff82602406>]
> __device_attach_driver+0xf6/0x120 drivers/base/dd.c:870
> [<ffffffff825fe797>] bus_for_each_drv+0xb7/0x100
> drivers/base/bus.c:431 [<ffffffff82601f82>]
> __device_attach+0x122/0x260 drivers/base/dd.c:938
> [<ffffffff82600436>] bus_probe_device+0xc6/0xe0
> drivers/base/bus.c:491 [<ffffffff825fc855>] device_add+0x5d5/0xd70
> drivers/base/core.c:3319 [<ffffffff82bb3aa9>]
> usb_set_configuration+0x9d9/0xb90 drivers/usb/core/message.c:2164
> [<ffffffff82bc3e3c>] usb_generic_driver_probe+0x8c/0xc0
> drivers/usb/core/generic.c:238 [<ffffffff82bb5c6c>]
> usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
> [<ffffffff826018a9>] really_probe+0x159/0x500 drivers/base/dd.c:576
> [<ffffffff82601cdb>] driver_probe_device+0x8b/0x100
> drivers/base/dd.c:763
> 

#syz test https://linux.googlesource.com/linux/kernel/git/torvalds/linux refs/changes/96/11196/1

> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
> 




With regards,
Pavel Skripkin

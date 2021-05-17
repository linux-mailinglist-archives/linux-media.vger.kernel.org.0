Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE4C383D0F
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 21:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhEQTSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 15:18:25 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:55115 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhEQTSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 15:18:24 -0400
Received: by mail-io1-f69.google.com with SMTP id a13-20020a5d958d0000b029043aa4f99980so4117094ioo.21
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 12:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+kErfEtNYwu/Ybclt9+KOG1egC5Rd9gjqzB3omTYpbk=;
        b=IAV3MfU4lADOxHRnnWXr+d9/zpbEZNvxPVWr9PwlAYxB7AV+4DuVhypfIJFIfxT4ZN
         57bfM3EmhWoz4dsI9CHpcZoY3Xq50kEeWjgFeNjEZ+HwNFY7s3Uc/r6nuEwUQHWGzm+n
         P8Yi9AxG3Oma4a9i8nWkXxTgLKrIV+vB2F1j+uQxK2hteUq5+Ps7BSd5vePIxM/carvg
         2nbN4++qc/JCO1uF6QJFDU/D7gr4Czc7bDDPCcBLqMh5D5m27o8dS3yBDmJN01bC8T8I
         SzmJEMjV4l0rHCUjire7jP0Pt7DcOPHgDxEvc1aP21TnjLB+sE1MwteO7wTvQlDaErY6
         wPzw==
X-Gm-Message-State: AOAM530TzjHKzPJllA7Merm11anI9LSMdiyhkGJJlONiY0+lgeytJUNd
        4bcDPtZ//ORznUlIcGBwQ9WiZFdJC+uZxovvPwXvcIv2nnnm
X-Google-Smtp-Source: ABdhPJz7zkN9b8IfVdrGey2sJgHjnLLqDvLusS/BcEN5YJqN6eyAnKsNyHkgRQQVj44NE68p1mcX55PJfr0Eo4uuuFJEhaxq9slE
MIME-Version: 1.0
X-Received: by 2002:a92:dd04:: with SMTP id n4mr994688ilm.165.1621279026606;
 Mon, 17 May 2021 12:17:06 -0700 (PDT)
Date:   Mon, 17 May 2021 12:17:06 -0700
In-Reply-To: <20210517215904.7d915011@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007676b005c28b70f6@google.com>
Subject: Re: [syzbot] memory leak in zr364xx_start_readpipe
From:   syzbot <syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        paskripkin@gmail.com, royale@zerezo.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+af4fa391ef18efdd5f69@syzkaller.appspotmail.com

Tested on:

commit:         0723f73e media: zr364xx: fix memory leak in zr364xx_start_..
git tree:       https://linux.googlesource.com/linux/kernel/git/torvalds/linux refs/changes/96/11196/1
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb9a486f2f311b2e
dashboard link: https://syzkaller.appspot.com/bug?extid=af4fa391ef18efdd5f69
compiler:       

Note: testing is done by a robot and is best-effort only.

Return-Path: <linux-media+bounces-15034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF04932158
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 560441F21C44
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 07:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E838D41C7F;
	Tue, 16 Jul 2024 07:38:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1792943AC4
	for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721115502; cv=none; b=Q/NGIaRagHRVvsH2qx1EMu1GMEY6aGXDIC0d+dyE5mGcyL6wJAU6rVcAbHNkh6Mw5Co/dhjUkF8fy6kaI1CXz+FunASfxFfbpphaHVoOhjJvcuYXk4qJuRJKXI3W+doadfEqjBj1ub1dpG/qZjvw5LcUQSuQzn7x9/wHOMYjWs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721115502; c=relaxed/simple;
	bh=Bfr+2oqKDo2i4Pdo8nM2yUXYJf1UPSlRnL4MCq3zFOM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sBHchcZeXTQg/bydOn4qtIcasNzespyDnVZ6aTKh+VK1PUAalglJpdC7A3xnmsgpZx6HtqqGwHON3APZLLcCGTb0rh7ox7FvpcN+H4n9ZpTC6h+5c5J5tJf6gNSsnHXNkVOgDnjjEMVQMk0QC3AzkxaGGy+aY0PyXHgLQ23ddvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-381dd2a677bso68787865ab.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2024 00:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721115500; x=1721720300;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9htk5aJgdqfYtz3ZfAD4q1FDJGfF5bTAzJYsn4qenQ=;
        b=YhwByQlUpFI1vtbqauyoV230TrMOyDctiE1Ivt9DfaymvvFiIpDCCF9VKHy8S4wuLs
         7KIT5zyNY8EnsvajwGGBKOqzKJIvEcdNkkd5UnhCFYkR0+l+S1a+xowI1hRuaeJ+Wakr
         GA18wrjWUavP3JQrUZqDJPyVesHxWlUMzvvIqzJjH2FLEJbrI82kuAh40Xib42H0Ycti
         eck9U0iGQA/YayyezBvGUVINS/v5VU54a+GImwL2HcpOy7RGvyiJg/EQQ0JpCizh756/
         ysI4AwETfT9lIF4R7U39CQNv2K50az2IfBRA5eZES5BEj1EiaxABT1ub2PNN9e1I0FpP
         oIJg==
X-Forwarded-Encrypted: i=1; AJvYcCVVt43lVUj457yKnggasbJrF3BCnHNiPuTFewTbEe7sZrrwsrRR0JuTFZlemlJ7ANriSwkUSN+MmNS07WfmQCfBd3ANmQbjcmDsk2s=
X-Gm-Message-State: AOJu0Yz2tztFLa3zi7KzeoG6JXDdDWPwsSrqOlXqktdxIe4FlOpokmTM
	U+O72qlXMzXdm6Q85mBfFcq2Ie5Iy7BPxFB0ZqtwVzJVbsLH1B897Xq/xyXkx5OktAKg0k70098
	Xwal6acXWim2ryUJ/l6tSgCIsd9qP9lrA9A1un+k2IexChqGCZQtYOm4=
X-Google-Smtp-Source: AGHT+IF4Elg22B87swvQ1h2NhAnrhId43ftvWY/c9tmpolNBoybTkzjXI+4UZ1+mdQIP1RzKOeIqQMB+2/44dICtxnw58YIJKijV
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1545:b0:381:24e:7a8c with SMTP id
 e9e14a558f8ab-393d0e2328dmr1183045ab.1.1721115500231; Tue, 16 Jul 2024
 00:38:20 -0700 (PDT)
Date: Tue, 16 Jul 2024 00:38:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000024b79061d586e6d@google.com>
Subject: [syzbot] Monthly media report (Jul 2024)
From: syzbot <syzbot+list68e667ad3809de6c5bd7@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 0 new issues were detected and 0 were fixed.
In total, 17 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 871     Yes   general protection fault in ir_raw_event_store_with_filter
                  https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<2> 101     Yes   WARNING in media_create_pad_link
                  https://syzkaller.appspot.com/bug?extid=dd320d114deb3f5bb79b
<3> 90      Yes   WARNING in smsusb_start_streaming/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=12002a39b8c60510f8fb
<4> 23      No    WARNING in call_s_stream
                  https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.


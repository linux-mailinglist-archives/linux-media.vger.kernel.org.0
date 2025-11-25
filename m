Return-Path: <linux-media+bounces-47719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6AEC872F5
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 22:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AD5E3B5061
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 21:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF092E339B;
	Tue, 25 Nov 2025 21:09:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863201D63F3
	for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 21:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104945; cv=none; b=IUM9Lf676hR0h5/v+wqHy1f4epSVaO+H1lU+NUs/h7GQnJVm/CmeeznQGWEuxqhMhHcTUQBw+LxzS7VjfdHmrIuWjmEAf3Uw4L/R9Z8OcbLRizGW2U6/LOvaOqbhV5yBlV3xp7s8+9w0ZpCvc7meVLnNIqoCZ9dk9aeOq8G4fhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104945; c=relaxed/simple;
	bh=CtF1IMGypsXAxMFuVLFe9wJ2dqnKq63kk7rX3bFzl+w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BNZudXuYCi8FBjsq0Rklz9SrV2Voms2CG7m3IqUSIs517B4pFbp7prNVjzrHbJS+EVPKwDq/JtaC86yW7fidNwpy3p+iS1RzIrzG1jw/hGi3ZHMbm7amj+JEsIeZF3k2r+KiODh6sWYVScnvQJBPkzsPX7bVKs2hTKY/G53JbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-948f6c90813so434635139f.3
        for <linux-media@vger.kernel.org>; Tue, 25 Nov 2025 13:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104943; x=1764709743;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ae0IECMTB3WvTak8xKOe1qjBdVdSW5jjLog8EhDbjU=;
        b=ouQYflRc9B9I2SdQFt5qnuEUZJwTSMtSUo3aWDq5u90UZfeRR8DuAsneyMUdlO1XjE
         axvNnLO3NS4r2G9KgyPBaE8sf/eTm1+xswCzIQDbY7O0WfoRYy+HDGQZLfkUmHmRsu9q
         BoePSgURZ33JmSkuMj7UEQUaHxzO7CxHNNv14j/CRK9BOuEmZj+Q5t23SCGdPOrmHKjS
         Q1H3THFLqvXYSyfP/kp2Btc4NvCYdcb8d5jq/J5jaQ0gI1WpGi7wUoubvO27MMzG0E2S
         VYE6kUiiaMZ5YQNIMYJi2/3XOnkRi3MgIZD4mfMCkbUjclB0rb/H5r7WCEV96+xvi1sJ
         IgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRJoDHodINaA9r8wjffCF19WKhaccoofFkza7ZUJGtHw/5pGZDc4/bDiBbqCs4LyXa4e9Cx9c3v1FrAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zAdZKKjPb6GuijS79VE8eK0YhZgVji3L3YjOWqZNzYhycx+K
	Mz6qBRvFJnQd3+VwRr66fwEdBjTUKVxirX984VkhmNHcpsWp0gwAiDKxFoULeP7ZanDHPft8EFp
	Jn8pTMFyYmUCujXTSAvyEneNusgtyyUAyDskcGwqKaVa1/b9z6TjRi9dyNpw=
X-Google-Smtp-Source: AGHT+IHYpf28XXE6SRZe4Xdp0Cl0TChF4awDygyd6atIw2ev8bSil5pdTazY3o4sSX/CI7lBnMGTZPVTBzIySRJBD8/b5Da39yHr
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:178f:b0:433:7e2f:83c5 with SMTP id
 e9e14a558f8ab-435b8bf921fmr152965465ab.3.1764104942649; Tue, 25 Nov 2025
 13:09:02 -0800 (PST)
Date: Tue, 25 Nov 2025 13:09:02 -0800
In-Reply-To: <ca9d89ca-4da9-4f2b-bd92-3791cae54911@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69261aee.a70a0220.2ea503.0092.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] memory leak in v4l2_ctrl_handler_init_class
 (2)
From: syzbot <syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, ssranevjti@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
Tested-by: syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com

Tested on:

commit:         30f09200 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d5cf42580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f30cc590c4f6da44
dashboard link: https://syzkaller.appspot.com/bug?extid=a41b73dce23962a74c72
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=164ea612580000

Note: testing is done by a robot and is best-effort only.


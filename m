Return-Path: <linux-media+bounces-30618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26527A951D9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B6D3B1320
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA00266576;
	Mon, 21 Apr 2025 13:44:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A1264A78
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243044; cv=none; b=p5VQ+XlBwLLj51JcI7irv0mtd1AhH+YM8+ADL/i2LJcOK2z1FXk8TcmUQaQ/+0I/BUiAJFckrmGwGizak84eEDATBCCb6dNwf+YKsgVsARthleXwxh/ZTRcbNmdGtuyDHFhKRIqBSaTSEZhlAlbEA+YqVHWAeXkhcy/6SEA26Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243044; c=relaxed/simple;
	bh=L7LVovb7i54t6xGC3eTK/GKnVT2U5I6IxinxPBEfwiY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gmU4ZADYY67lp6Q8aN7elhLQz71z7wLuEasM7APB+x4hKyRRaAhvyUcAQTP4Ej4mHanXWHI0Sf+7sgNkk2x57cS27YszPDJATNz6C+xUfu4gdMrEm9ZshVIa7QZt3VJLLcP3L5DlA3a5mNIVYiqjxEmZi82uk4w/XaEqFRqsOp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d8fc035433so46041365ab.1
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 06:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243042; x=1745847842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eK7UM4Up5itS/iAzTbj0F7GLYe1ZoleXVB8qBXTXCBM=;
        b=WE2OLpc/yt+F4ngu8aHZnYLKA0km4iy2h2VJHuhj80oM6aueokuabNTReRPaBZMMpY
         ZYIGHdNrHsB08IPXTyu4LLOj9CksJxUotu3RVmoyiQFYt+EID24CZLyz4XOkNGyWKdZW
         /frk4iK/g7IUg6pzjPrEUWzrOZl9SAXh5ZyU2DKl8gaK0sByzWmc3gufGtBImZ3/YmaG
         YlwUsE9q/T1RRQ6FECpqe1/KQJ+yHIUH70taqIJBOYabuv/IIra4WmrxUnmNWAO2448N
         dJUf+t19+t/ld9PACDQzds7yrBDuusifL+p8lxoF89o7I4RAIKQFrqOku6vZ0lLQHEV/
         KozQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfSOvWqsaUwcyXf9FY3GQXKplhSa5okfvfyo2/TuShc7q0lSFWOUNNlffgJH+5dWR8a7/pYMkRuoX/lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlzX1FCv7cB/sbjCH+1I/r8P1WDoaOosNSEYOM0ifWIbBPUgr
	JUnvZ7D0gGC0G0T5839C0Rg4vgCSJ1v2j3QgPHvzh//T6IV2EGio4abno8dRbLCwyAIlC8Cj0g/
	cF6YhGo/XYqvYPAKZoBtDkpkyGblXD75kIABHnC5MeElGh/KxWTbI8IU=
X-Google-Smtp-Source: AGHT+IF9ysXMTFf8CgWzRMriDXjBqouYEyJHSrGNeZyFXfnk4ozHjIBHx5IncQiXsLC8nkI78KnM0RTNhvhIW8dVHe4qJYJ3dy9I
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c21:b0:3d8:1ed0:e17c with SMTP id
 e9e14a558f8ab-3d894298bfemr97551235ab.19.1745243042260; Mon, 21 Apr 2025
 06:44:02 -0700 (PDT)
Date: Mon, 21 Apr 2025 06:44:02 -0700
In-Reply-To: <20250421134021.155569-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68064ba2.050a0220.4e547.000f.GAE@google.com>
Subject: Re: [syzbot] [media?] BUG: corrupted list in az6007_i2c_xfer
From: syzbot <syzbot+0192952caa411a3be209@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/media/usb/dvb-usb-v2/az6007.c
patch: **** malformed patch at line 15:  	}




Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16719ccc580000



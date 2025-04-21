Return-Path: <linux-media+bounces-30628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26251A95323
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0D5172800
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B171AF4D5;
	Mon, 21 Apr 2025 14:58:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00781A5B91
	for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247487; cv=none; b=kEPtUJUHOLXp9WPepYPhYnlyBlRrFJr+5mlFBXjOBxqB3EcVLYpfaRx1HIwwi2NOlOfz3ZDiwtERisWVnuZdDdoPd+2PRoKG2PxyEVp907uG5O5lweKfRpoEcYSPbDFFGw/I3fXpzMO5HF4nBaSZlE6AfcguwQrwzAn5F5GrVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247487; c=relaxed/simple;
	bh=yvdRVg0VMkd6hsMgN4ufqxlYTQYNsLNumxhd9kBzoQc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=coQBEKJQ+CWd3ms8kkI0W0H8v9hcv+Nb7ITM94LYsEluAGdjgFAUSZEw068EmHGjja4tcRj1iCTC0bin5DcNM+VOCoNFNxu0IDH/GF186CMXQHhnwCKWqJNthQSZS2CHitpQZqzjLLdQ90g2AfJGdMEO7HvuzqMbzcvjsVqTNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d8eda6c48cso21898445ab.0
        for <linux-media@vger.kernel.org>; Mon, 21 Apr 2025 07:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247485; x=1745852285;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7C4lzjnrE7X3QpBOgkxFUpFE1wGJeXBaq1KeJ0KUqY=;
        b=B/MEoIqWAGt2wD0lT3JyY4sNoiBRqw684Kb0NLjduDiLfy4BbBsD/yCS+hmj3fVsZ/
         bQBS92ves2S2iGQvK6eQ8/13z+ZhbIWTxQ3hulmcJ7PdattJqH+g0Rv+gFOyNO1Myaec
         AUeYAQw8Z5MszNVYuxdayhLTTWBeBgbGCBcgyZ9Qs6x5l2FC/eLbzkA3Ob1u53IpLY3l
         PnISuUSfgMXpawtrSOynTX4bzl2RrLKSJRo20rFwoCt8qhbJ8mL1GQ7RRnfHgUujTk1P
         M8O9vvijXyUegz74KpO/iMebbW/w1sWzNCU+CnJ9ttLOEVAMnsJ1ztfiAYafg8FKTq/0
         M5ug==
X-Forwarded-Encrypted: i=1; AJvYcCUL71Q3qXLLN0xP/jxnp/YPkwp9ENm890vhwN+97RGyekq7aWhKgDugtBBfKnYNeQtEO1hZ0OqLE/c+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt92atD6G2NVc2Su9ygr513C/dIkS3kKxCIXMRYDTuSSuQTWop
	hvEJZ+pQ2fn7B+1SW1xGBEol55BiK4hj16uR1kb7/MZCnguvwkWO0IPg718LTVbUZk+5VUB6zhl
	o9qTyTetZJmRcCI2isaO6vrTCp+IBeFGonSP5G35Pm7qRbwo9TmMSx1k=
X-Google-Smtp-Source: AGHT+IHTZjZUrThe+WUKQfapvHK9hPeNGgNe+9DUCPt5h4IkwmwLZfZW8OIZLvebkVFNW27onCe5q65cTsstXgujJV0pAJT67ICe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ce:b0:3d3:d1a8:8e82 with SMTP id
 e9e14a558f8ab-3d8bf2aac57mr91761155ab.9.1745247484980; Mon, 21 Apr 2025
 07:58:04 -0700 (PDT)
Date: Mon, 21 Apr 2025 07:58:04 -0700
In-Reply-To: <20250421134602.155962-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68065cfc.050a0220.4e547.0010.GAE@google.com>
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
patch: **** unexpected end of file in patch



Tested on:

commit:         9d7a0577 gcc-15: disable '-Wunterminated-string-initia..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a7c679f880028f0
dashboard link: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124fcc70580000



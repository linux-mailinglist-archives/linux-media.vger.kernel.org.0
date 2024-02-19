Return-Path: <linux-media+bounces-5421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573585A467
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 14:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C25651C23A85
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 13:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C5364CC;
	Mon, 19 Feb 2024 13:10:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56703613E
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708348205; cv=none; b=bzgIfUTox1hTFN5XF1JI4dYuDXLJKIFPgQGp89oz47Bd8EJIAm2ac0JD5AFl9Qad5XnfL+vqyRACXobuq7m+XQv//NWMaTZ/Sf1ZvKIYR+tKzmwY/KgwlmO/EMGEO5E2/7LCG2pkhGZa3ZweYphCwGZtgTHTF//8rJg+HqAelUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708348205; c=relaxed/simple;
	bh=6biU2L8B/V7conuu8Ja0RqbgynGZas3q2ELFDjoWe9I=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HHfT0rEMmtzdeNCx5RCusuk4RRP8x3GkbsdbgkVZGVUXnoyAd+L2obLnyZbdq4DeI2hu6X5peFoqCwAcOojwmfJloe260CM/i3rV9iZVpJ7LKVtAxI3UEkIRv4N0q+24ZOe7Dmpzv/tN/VJjbpxQW+a3TdQg8OIXIvyjDANBAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3651d2b88aeso14395965ab.1
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 05:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708348203; x=1708953003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDiM6XZIafcYqC9Ci7EigVOUHJMlV0bbSuptTdR0jkE=;
        b=slynHd5gx65p8TD9XCVZq8otpQWhL6jt3MPgaZgUUOt95nNcGqsT/MdJMLSLfqtL6J
         Yqi1rt8vaQjRvkUjvoK6CL9rqK0pQuNCwmwt7sYQ+YPsTIQzxacE+BMSJazUVsyIVZ47
         53/pN8+d9dFA8V3RfZQ+y2a+3spNamsCs2dXmHRypNZktrOGLVR9Y6nGObNN9XVVnv3c
         sOeIJ6MhZkAw4dNGRDQGsGEFD48LCiCFiVLflfa/is1pWaBsbfjTOAu83SMXaniJPu5x
         J7K95n6NCnwAZWs2abd0U78LUA+zSkLPeT2H91S9F3IebiCA8Qwh6SLzgVsjVVE510QV
         KnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqtQ2tahNBZuovwer36qnEO5ffb5zUbDAp+/OCiGFfFsT7NA4L0eihyxNUujeGJz3tSBgjWusTZltyZUY0oO+r92hYWjm4uffKCbE=
X-Gm-Message-State: AOJu0YywK1oYX3I3U4L3Cb3LWWNDI/nR8loPwyKs8COXkhWJfkU9oLVk
	2JWGEfUpN9h9Ww5HkF7GdGg9K7+OF7b5FoU5jx6pqRDsMEEXNE+wgtohfpXbH2WPODWAD71uzZZ
	gZ8AKELfTK/rBXwtbtluiJ8nOpElciiIjehK7pnWnM52JniBzBlQW4q8=
X-Google-Smtp-Source: AGHT+IF6TLcgpBQRPhRX8L09PDGE2CYgtM71N6waCHlrqv3vgJCX/1zRjvQEqZxY2d/3yRVs9Vor2ZAaNeLYh8ivM+AaJxbX7gXf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:9252:ed47 with SMTP id
 j15-20020a056e02154f00b003639252ed47mr1114563ilu.1.1708348203022; Mon, 19 Feb
 2024 05:10:03 -0800 (PST)
Date: Mon, 19 Feb 2024 05:10:03 -0800
In-Reply-To: <0000000000008b96230610c6b3fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cb40790611bbcffd@google.com>
Subject: Re: [syzbot] [usb?] [media?] possible deadlock in vb2_video_unregister_device
From: syzbot <syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com>
To: benjamin.gaignard@collabora.com, hdanton@sina.com, 
	hverkuil-cisco@xs4all.nl, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit c838530d230bc638d79b78737fc4488ffc28c1ee
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Thu Nov 9 16:34:59 2023 +0000

    media: media videobuf2: Be more flexible on the number of queue stored buffers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166dc872180000
start commit:   b401b621758e Linux 6.8-rc5
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=156dc872180000
console output: https://syzkaller.appspot.com/x/log.txt?x=116dc872180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=3b1d4b3d5f7a358bf9a9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ffaae8180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ef909c180000

Reported-by: syzbot+3b1d4b3d5f7a358bf9a9@syzkaller.appspotmail.com
Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the number of queue stored buffers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection


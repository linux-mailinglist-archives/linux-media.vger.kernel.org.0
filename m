Return-Path: <linux-media+bounces-9233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFB8A3CFF
	for <lists+linux-media@lfdr.de>; Sat, 13 Apr 2024 16:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBD828241D
	for <lists+linux-media@lfdr.de>; Sat, 13 Apr 2024 14:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E27D3D544;
	Sat, 13 Apr 2024 14:40:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E68C3D68
	for <linux-media@vger.kernel.org>; Sat, 13 Apr 2024 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713019229; cv=none; b=AsfnOkJvzU8p89wLNU9QCoYLwwOnWr/tRdLT8ySDAT0gCa8zhYKp8TiExm17X1OmcRk5Q2OjBHLUDMO2btSMjz/oH2wyEljUhKhM710Zxtpgqs2hvoc6XJb1LgxHe9OV09Dto2eZfSpryYlMrfBH1yBZk1W4KjtXTBnTFZdJH28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713019229; c=relaxed/simple;
	bh=vbk4Rhnn3ao/4dMYfvwvco8I9PpmQbe9zJvUjEbea7E=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=S2GwQibIW7hmreh7Jguc89PehKbrRhYwWolanJk3Hp1dlPwHmYp8qftl2fW3nvg+HLPkmuGz3PfdenGf5DosTeXg6YAqulPape4RnL4eLic89jBj5N4vjOHdkBh+PzjVO84dcyHnVuzciQknr2JPReYxwibmQCXvjTVqnw/eMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-36a1c2b7172so14978055ab.1
        for <linux-media@vger.kernel.org>; Sat, 13 Apr 2024 07:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713019227; x=1713624027;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k35GJLyO+qF0Q6nfe6UOQLLAPZY5SGbHLJa33ufBKTk=;
        b=A9IiapvkYzZ9rg7S+dWoEWzqGYh0qqMx8xpvXsw8qQTN7RrSzZN2+caNNQeOo//7ih
         BiRP06heDvoLL4P0VN8tCJZwygxphIzEOoCRpLOICnRiZcqs+NtvM1rhTJM7EuPRWAdn
         P9mXk1iRZ2yHdMh32nWXv6B8VqybcapqGc9XNh/fkcxE/DCT28klXIXEBdVM7ldvDl0f
         HE25AIhd6j5JQ2UbbW0KB9T146/71V1rV4flWX+hXxnnBj9QXDCpJiUillO/X6l/2aR/
         U7x4/j9euDxC2JDyT3v1XRIf6q67Iyb+chrI9dmAQklyeQ2hF1A33Z0FpEsMOla4ClZQ
         HQZg==
X-Forwarded-Encrypted: i=1; AJvYcCXFiDZIRdEqxqlyvJExImEuNffV30O6Nw9zTE+T7oSfbG3uV1zmCOoSukbnUuuferF46Irmu2JG0gJ2HaogyF2L/q7vVhQGPPYw9uc=
X-Gm-Message-State: AOJu0YwNOgJhNW2JY7Bp+EI3cArRtMUAiGWINrT+tKr7sEJaKX+1nSdA
	z6vEx+onsIuiAK2BmEPT2b0X2Z8ch02OSgIj+U88UoPdopW5lqrHDVbI1IetMjoRsqsVjewb8qg
	KM/O/GU/0eUwO0Zu9QMAQIhlgHAClTIylZjj3c5kkhkat7FanoBfZxkw=
X-Google-Smtp-Source: AGHT+IGQt2aifAlrcC1TTvoHh/jgfQr8s0oQRybE8GJdnG0ldr+uX8w/gOAIaQA62bIBFrCCRyt6X1WrxmhSlBW/D5N6c2Ng34HB
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:52c:b0:36a:2130:33a8 with SMTP id
 h12-20020a056e02052c00b0036a213033a8mr168304ils.3.1713019227753; Sat, 13 Apr
 2024 07:40:27 -0700 (PDT)
Date: Sat, 13 Apr 2024 07:40:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009062560615fb5e31@google.com>
Subject: [syzbot] Monthly media report (Apr 2024)
From: syzbot <syzbot+list9b4228196b8993e50208@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello media maintainers/developers,

This is a 31-day syzbot report for the media subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/media

During the period, 1 new issues were detected and 0 were fixed.
In total, 19 issues are still open and 85 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4656    Yes   possible deadlock in v4l2_ctrl_handler_log_status
                  https://syzkaller.appspot.com/bug?extid=9948f8e188482c5d1a3e
<2> 867     Yes   general protection fault in ir_raw_event_store_with_filter
                  https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73
<3> 206     Yes   inconsistent lock state in sync_timeline_debug_remove
                  https://syzkaller.appspot.com/bug?extid=7dcd254b8987a29f6450
<4> 57      Yes   KASAN: use-after-free Read in send_packet
                  https://syzkaller.appspot.com/bug?extid=f1a69784f6efe748c3bf
<5> 6       Yes   INFO: task hung in cec_claim_log_addrs
                  https://syzkaller.appspot.com/bug?extid=116b65a23bc791ae49a6
<6> 3       Yes   KASAN: use-after-free Read in em28xx_init_extension (2)
                  https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
<7> 3       No    WARNING in call_s_stream
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


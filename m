Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E50C481CB8
	for <lists+linux-media@lfdr.de>; Thu, 30 Dec 2021 15:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239763AbhL3OEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Dec 2021 09:04:09 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:55240 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234801AbhL3OEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Dec 2021 09:04:09 -0500
Received: by mail-il1-f200.google.com with SMTP id g14-20020a92c7ce000000b002b1e78da1f9so14417211ilk.21
        for <linux-media@vger.kernel.org>; Thu, 30 Dec 2021 06:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=CLxA5XglfnNoz85p0aOYmSifVXQKJleW9SZsti4LBwI=;
        b=t6ZFfjaKFqliXjb+McayT2HEvA0Mf4AVhKg2m4LPn0YghIO0q68HW0SHe2XGaIbbux
         WcPV3GTZPvYFdzzXJoL7MkamHTaUVIc70jZb4F4gpEXlxamTH5Y4Z+NjYu4PU0HuqfBX
         BEIgSQUfsh7ZzKrm6Q3K47Q9DOu/XtQx/jR18r/9MNpQiHYbilGhZTO8dZlFDsxAyvLN
         M2jKWakU6LSjuZ7hchsSSsd32WV2dxV7GHhLZn8ZhU95yJIBjplAkw7FsF7QCiokg6s+
         BAJGbDO9XqZIo1Pt6sL2hLYvIkmaLuwpHRs5Sm3ybwDsgysCmxP8BcMKqzX3aocWzLkk
         CJKQ==
X-Gm-Message-State: AOAM533dN19HPg4NPkLF2eTyq6g0S/2O3w8uSDjR4yA8f3RfECxqawVN
        JRjlEqwF6hAfH7LXh6f2sgCsdCUxZgvY8RKT4i0H+BdBgiDR
X-Google-Smtp-Source: ABdhPJx785tpqTHluOUoVroCRBPCP9AP06uygyiu8dMzkdRIbJk8+L32zGswOmo6KPDk/Bzwg41q3078PRkKkjGBHDoJUHfy5SA9
MIME-Version: 1.0
X-Received: by 2002:a02:9108:: with SMTP id a8mr9685404jag.284.1640873048481;
 Thu, 30 Dec 2021 06:04:08 -0800 (PST)
Date:   Thu, 30 Dec 2021 06:04:08 -0800
In-Reply-To: <83bf58b6-ace2-2db8-4f8b-322e78a3e198@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002d250205d45d87d6@google.com>
Subject: Re: [syzbot] general protection fault in sg_alloc_append_table_from_pages
From:   syzbot <syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com>
To:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        gurchetansingh@chromium.org, kraxel@redhat.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paskripkin@gmail.com,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com

Tested on:

commit:         eec4df26 Merge tag 's390-5.16-6' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1bce7595e2f1eaf8
dashboard link: https://syzkaller.appspot.com/bug?extid=2c56b725ec547fa9cb29
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fe2f47b00000

Note: testing is done by a robot and is best-effort only.

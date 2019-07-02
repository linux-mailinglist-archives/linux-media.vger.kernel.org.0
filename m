Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001985C674
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 02:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfGBAtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 20:49:31 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43474 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726966AbfGBAtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 20:49:31 -0400
Received: by mail-pg1-f196.google.com with SMTP id f25so6797725pgv.10
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 17:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=DDzm4cfy5Z6qSQqMieLVSqyWrLPSgfpRbotfFUXqTX4=;
        b=cKIyyb9xOor3ZXmmu3Ai4NcPd/f0B6IbOafsCmHCNzwYa57CRZM/sHn9l0AdCNt6ru
         UbHI3Sy9sI7CdtszW+CzFxWZvUYOzrkfR3VLJPSyRed2kzXRGh/30/EG5qMu30XK+Kd/
         V3LKdO8d8knjESQgYRnFY1BGj83qiCShptE8jpoVQ8DBngxYGJVHFjocplrDc0fshRxr
         3QKPhvFDLIHqJB1TKbwUcumhIugnYzeVr1TCIfyxtWFRQumpqMRM+ByzRVQPB4AijhTh
         gLtEKbBjLH1DYoISRZDmBAtc70HYkHG599ClQih5F3AWVRyfqyddQzrK2HbJNZCC5DeS
         kvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=DDzm4cfy5Z6qSQqMieLVSqyWrLPSgfpRbotfFUXqTX4=;
        b=udRmdxF5azJuNElLwEsTgmM9ea/ehS39BLh0bhRw0/b3ocxD6UH0NTzqz0j0RrumeR
         nqPQjcXud7UOgIVAFWz6v8XxqJVaMQ7TCsOMXbQ+wDhVqUyTHABitdNEQGewRHrtbZ1H
         R/tGT+AJGEkmxk+woo7YO+NojYy5Mv7A6RmtHeFmNovct9E1vl17DpuMBrGa5YVxJT9E
         Cv/5Kf5bCDj9abyd872ajRgv4Ag0Ryk3YZTniOse6mG/8GC4/bAKB9Exo0V7enn/oigc
         NLmKGdjlCGNEzaaSN2rOimTraZ73snjrXguw5o46GfK8Sstsx7lokCEXSf0ms7MY9NSD
         mytg==
X-Gm-Message-State: APjAAAXmeF5HGFMrXYB0d7yNVgq9c815HS06j4Po0ioo2N81aK/R07Ly
        yl0u7q+dOk21oyML/9RizHg=
X-Google-Smtp-Source: APXvYqz4Eeh91M+VshkZXtfMn0zpEkgqhXdtDsnqojbpsROv46O6PCsShslKnERdc0I4naV39qVHvg==
X-Received: by 2002:a63:7e43:: with SMTP id o3mr28006784pgn.450.1562028570676;
        Mon, 01 Jul 2019 17:49:30 -0700 (PDT)
Received: from [192.168.1.149] ([58.187.168.105])
        by smtp.gmail.com with ESMTPSA id x1sm624474pjo.4.2019.07.01.17.49.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:49:29 -0700 (PDT)
Cc:     tranmanphong@gmail.com, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
To:     mchehab@kernel.org, hans.verkuil@cisco.com, keescook@chromium.org,
        skhan@linuxfoundation.org
From:   Phong Tran <tranmanphong@gmail.com>
Subject: Analyze syzbot report technisat_usb2_rc_query KASAN
Message-ID: <ede75d50-7475-3478-b30f-ef9077b6bf48@gmail.com>
Date:   Tue, 2 Jul 2019 07:49:26 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I did a checking for this report of syzbot [1]
 From the call stack of dump log:

There shows that a problem within technisat_usb2_get_ir()

BUG: KASAN: slab-out-of-bounds in technisat_usb2_get_ir 
drivers/media/usb/dvb-usb/technisat-usb2.c:664 [inline]
BUG: KASAN: slab-out-of-bounds in technisat_usb2_rc_query+0x5fa/0x660 
drivers/media/usb/dvb-usb/technisat-usb2.c:679
Read of size 1 at addr ffff8880a8791ea8 by task kworker/0:1/12

Take a look into while loop in technisat_usb2_get_ir().
I recognized that a problem. The loop will not break out with the 
condition doesn't reach. Then "b++" will go wrong and buffer will be 
overflow.

while (1) {
[...]
	b++;
	if (*b == 0xff) {
		ev.pulse = 0;
		ev.duration = 888888*2;
		ir_raw_event_store(d->rc_dev, &ev);
		break;
	}
}

I would propose changing the loop condition by checking the address of 
the buffer. If acceptable, I will send this patch to the mailing-list.
eg:

-       while (1) {
+       while (b != (buf + 63)) {
[...]
}

Tested with syzbot, result is good [2].

[1] https://syzkaller.appspot.com/bug?extid=eaaaf38a95427be88f4b
[2] https://groups.google.com/d/msg/syzkaller-bugs/CySBCKuUOOs/0hKq1CdjCwAJ

Phong

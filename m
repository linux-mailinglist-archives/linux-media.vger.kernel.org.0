Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A35C248D54
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 19:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgHRRjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 13:39:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42066 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgHRRjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 13:39:17 -0400
Received: by mail-pl1-f196.google.com with SMTP id f5so9537202plr.9
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 10:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=QPFwbWZyvdDXMXfROlJGRtoRpatanYNTBruA4q3HKq8=;
        b=uOkoLOwe7pEdozmziZuAEQlCZkJLF8U3v8OWVqVSsDgUkwR4cl29BjGIZa4ElebOJ3
         uhigRXzRIzVCKV0hvNYrfcIVVlaMFOdq40fmIDoVHRscg96AAIZgfSF7Fz3MeBiBsv9w
         HuU6pjySexKaxfGXCtU3wtL37+BeOy4Rr2fSyfob3kovIjDY27Pm/CGpVUkwr3kxPFXF
         L55i47nhigVFi64BPV8QI1jiXkApf0hzCoX4gezV16ImB5b226CgPpt3faRmVdM6/LfX
         RE3CpCkQ/oWhEJBUMzL0lKlmClvchObHF3/xewXtEW7uPe48TzhHdVwgJ6ptKhsCf3Ba
         1M0g==
X-Gm-Message-State: AOAM530l9NghHaACSSyLMJ5ucAUUy0wzoLgTidFhe/tNwJ1DtQ6qr6mn
        rEzVfujgLyU4m6NykXCnZFEUrru6gPM=
X-Google-Smtp-Source: ABdhPJx7qOV6Ur4md/I01rTO+McavYBM/H25SCel5AzpPkzLPKZlgSneNCNz9MBSpp6foiP3iQ+dfw==
X-Received: by 2002:a17:902:714c:: with SMTP id u12mr16078303plm.290.1597772355958;
        Tue, 18 Aug 2020 10:39:15 -0700 (PDT)
Received: from [192.168.50.110] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id o4sm457036pjs.51.2020.08.18.10.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 10:39:15 -0700 (PDT)
From:   Bart Van Assche <bvanassche@acm.org>
Subject: UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Message-ID: <132c541a-58b7-4f5c-47f3-855ac5818377@acm.org>
Date:   Tue, 18 Aug 2020 10:39:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This morning I installed a debug build of kernel v5.8.1 on my laptop.
The complaint shown below appeared in the kernel log. Is this a known
issue?

Thanks,

Bart.

================================================================================
UBSAN: shift-out-of-bounds in drivers/media/usb/uvc/uvc_ctrl.c:781:13
shift exponent -7 is negative
CPU: 5 PID: 8871 Comm: V4L2CaptureThre Tainted: G           O      5.8.1-bva+ #2
Hardware name: Dell Inc. Precision 5520/0R6JFH, BIOS 1.9.4 04/23/2018
Call Trace:
  dump_stack+0xc9/0x11a
  ubsan_epilogue+0x9/0x45
  __ubsan_handle_shift_out_of_bounds.cold+0x61/0x10e
  uvc_get_le_value.cold+0x58/0x9f [uvcvideo]
  __uvc_query_v4l2_ctrl+0x375/0x570 [uvcvideo]
  uvc_query_v4l2_ctrl+0x9d/0xe0 [uvcvideo]
  uvc_ioctl_queryctrl+0x2d/0x40 [uvcvideo]
  v4l_queryctrl+0xad/0xe0 [videodev]
  __video_do_ioctl+0x6ff/0x870 [videodev]
  video_usercopy+0x1eb/0xa20 [videodev]
  video_ioctl2+0x15/0x20 [videodev]
  v4l2_ioctl+0x111/0x150 [videodev]
  ksys_ioctl+0x9f/0xe0
  __x64_sys_ioctl+0x43/0x50
  do_syscall_64+0x60/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f855682d427
Code: 00 00 90 48 8b 05 69 7a 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 39 7a 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007f8552854208 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000027776f49d460 RCX: 00007f855682d427
RDX: 00007f85528542d0 RSI: ffffffffc0445624 RDI: 0000000000000017
RBP: 00007f8552854480 R08: 0000000000000003 R09: 00000000fffffffd
R10: 0000000000000004 R11: 0000000000000246 R12: 000027776f53ad58
R13: 00007f85528542d0 R14: 000027776f53ac00 R15: 00005632ec54bde0
================================================================================

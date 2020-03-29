Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC031970D9
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 00:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729197AbgC2Wnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 18:43:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44722 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgC2Wnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 18:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=UDBIjlOAQk+mnZ7ZAGKtT2jL+XhYMKPhsPSuI+yZrAs=; b=lT23Oz0U0JkWWopp4ezoeVdxmv
        oVOqCQj0EF/fZvSHwYI0x8/Yu3pjnm2i3SKIlLjtZcWGAi9xDKvTD0g/wG5jqSftPgreR/RZAlhfs
        NAu12TDR6LdbRhrM0LN+E3E0DJ43w4JD22RpBc1zYxbn5E5bWzdjdEnMqQTRrtcAY5EvRdnB5catY
        JawiPGKo0ePRZBjUFmlOBCDwEyiuaXA1hxz9WLF4htyfCnEawynfXTGYQ/d38wjUzNV+7swmiwEZ1
        e0ws4CdANaw8pseqFxssH4AUnRe0mQLpMUxtpDS94arowBgOQiGWxf/15be/FK3XmCJ1dOf/WS5gZ
        8ahX8O3A==;
Received: from [2601:1c0:6280:3f0::2824]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jIgeP-0003YS-7f; Sun, 29 Mar 2020 22:43:29 +0000
To:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-uvc-devel@lists.sourceforge.net,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: uvcvideo: shift exponent -7 is negative
Message-ID: <1cdc4409-2113-cfe5-7eb2-6b1a6671e262@infradead.org>
Date:   Sun, 29 Mar 2020 15:43:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is kernel version 5.6-rc6.

UBSAN detected a bad shift value:

[  511.693411] UBSAN: Undefined behaviour in ../drivers/media/usb/uvc/uvc_ctrl.c:781:13
[  511.694043] shift exponent -7 is negative
[  511.694405] CPU: 2 PID: 1006 Comm: motv Tainted: G            E     5.6.0-rc6 #8
[  511.695409] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[  511.696034] Call Trace:
[  511.696278]  dump_stack+0x96/0xca
[  511.696654]  ubsan_epilogue+0x9/0x26
[  511.697289]  __ubsan_handle_shift_out_of_bounds.cold+0x4c/0xf9
[  511.697779]  ? uvc_query_ctrl+0x4a/0x80 [uvcvideo]
[  511.698559]  uvc_get_le_value.cold+0x58/0x9f [uvcvideo]
[  511.698788]  ? uvc_set_le_value+0xe0/0xe0 [uvcvideo]
[  511.699795]  __uvc_query_v4l2_ctrl+0x36c/0x590 [uvcvideo]
[  511.700178]  ? uvc_ctrl_populate_cache+0x3b0/0x3b0 [uvcvideo]
[  511.700654]  ? uvc_find_control+0xf0/0x1a0 [uvcvideo]
[  511.701550]  ? __uvc_find_control+0x170/0x170 [uvcvideo]
[  511.701781]  ? ksys_ioctl+0xa7/0xd0
[  511.702433]  uvc_query_v4l2_ctrl+0xad/0x100 [uvcvideo]
[  511.702779]  ? uvc_ctrl_init_xu_ctrl+0x6d0/0x6d0 [uvcvideo]
[  511.703663]  ? __might_sleep+0x6e/0xe0
[  511.703800]  uvc_ioctl_queryctrl+0x28/0x30 [uvcvideo]
[  511.704814]  v4l_queryctrl+0xa8/0xe0 [videodev]
[  511.705066]  __video_do_ioctl+0x72c/0x8a0 [videodev]
[  511.705564]  ? video_put_user+0x380/0x380 [videodev]
[  511.706289]  ? __kasan_slab_free+0x131/0x160
[  511.706655]  ? kasan_slab_free+0xe/0x10
[  511.707161]  ? kfree+0xae/0x2e0
[  511.707432]  video_usercopy+0x20a/0x690 [videodev]
[  511.707921]  ? video_put_user+0x380/0x380 [videodev]
[  511.709064]  ? v4l_enumstd+0x40/0x40 [videodev]
[  511.709289]  ? do_fcntl+0x903/0xa30
[  511.709647]  ? lock_contended+0x5f0/0x5f0
[  511.710165]  ? f_getown+0x60/0x60
[  511.710433]  video_ioctl2+0x10/0x20 [videodev]
[  511.710918]  v4l2_ioctl+0x10a/0x150 [videodev]
[  511.711919]  ksys_ioctl+0xa7/0xd0
[  511.712045]  __x64_sys_ioctl+0x3e/0x50
[  511.712409]  do_syscall_64+0x6d/0x240
[  511.712898]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  511.714036] RIP: 0033:0x7f9531e84f59
[  511.714152] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 4f 0c 00 f7 d8 64 89 01 48
[  511.716910] RSP: 002b:00007fff21180d18 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  511.717784] RAX: ffffffffffffffda RBX: 000055e3b563d540 RCX: 00007f9531e84f59
[  511.718534] RDX: 000055e3b5638d90 RSI: 00000000c0445624 RDI: 0000000000000004
[  511.719034] RBP: 00007f9530d82de0 R08: 00000000ffffffff R09: 0000000000000008
[  511.719767] R10: 00000000ffffffff R11: 0000000000000246 R12: 000055e3b5638d90
[  511.721034] R13: 0000000000000004 R14: 000000000098090c R15: 00007f9530dea1a0
[  511.721735] ================================================================================

-- 
~Randy

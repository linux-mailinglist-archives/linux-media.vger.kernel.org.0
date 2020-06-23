Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07DC204BC3
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 09:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731511AbgFWH64 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 03:58:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:31880 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728144AbgFWH64 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 03:58:56 -0400
IronPort-SDR: xgggwIxK1+A+yNLNN/zrrM32VIEWs9iBbcZ4N7UzEfnaZBDQ/DFf9sHmdzyjVOjD80qA8WlMF1
 ZuoP0rQkQ48Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143989497"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="143989497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 00:58:56 -0700
IronPort-SDR: wS75W7fFjyv9udnrx7e20MeK89TIzIGvwIDCncGmy5sCcQVNzGa0yuop/LBW1EsKlO/F7JhCkm
 I/WNnM7nIfPA==
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="275265201"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 00:58:54 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5110E207B6; Tue, 23 Jun 2020 10:58:52 +0300 (EEST)
Date:   Tue, 23 Jun 2020 10:58:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: media-request: Fix crash if memory allocation
 fails
Message-ID: <20200623075852.GW16711@paasikivi.fi.intel.com>
References: <20200621113040.3540-1-tuomas.tynkkynen@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621113040.3540-1-tuomas.tynkkynen@iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 21, 2020 at 02:30:40PM +0300, Tuomas Tynkkynen wrote:
> Syzbot reports a NULL-ptr deref in the kref_put() call:
> 
> BUG: KASAN: null-ptr-deref in media_request_put drivers/media/mc/mc-request.c:81 [inline]
>  kref_put include/linux/kref.h:64 [inline]
>  media_request_put drivers/media/mc/mc-request.c:81 [inline]
>  media_request_close+0x4d/0x170 drivers/media/mc/mc-request.c:89
>  __fput+0x2ed/0x750 fs/file_table.c:281
>  task_work_run+0x147/0x1d0 kernel/task_work.c:123
>  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>  exit_to_usermode_loop arch/x86/entry/common.c:165 [inline]
>  prepare_exit_to_usermode+0x48e/0x600 arch/x86/entry/common.c:196
> 
> What led to this crash was an injected memory allocation failure in
> media_request_alloc():
> 
> FAULT_INJECTION: forcing a failure.
> name failslab, interval 1, probability 0, space 0, times 0
>  should_failslab+0x5/0x20
>  kmem_cache_alloc_trace+0x57/0x300
>  ? anon_inode_getfile+0xe5/0x170
>  media_request_alloc+0x339/0x440
>  media_device_request_alloc+0x94/0xc0
>  media_device_ioctl+0x1fb/0x330
>  ? do_vfs_ioctl+0x6ea/0x1a00
>  ? media_ioctl+0x101/0x120
>  ? __media_device_usb_init+0x430/0x430
>  ? media_poll+0x110/0x110
>  __se_sys_ioctl+0xf9/0x160
>  do_syscall_64+0xf3/0x1b0
> 
> When that allocation fails, filp->private_data is left uninitialized
> which media_request_close() does not expect and crashes.
> 
> To avoid this, reorder media_request_alloc() such that
> allocating the struct file happens as the last step thus
> media_request_close() will no longer get called for a partially created
> media request.
> 
> Reported-by: syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>

Thanks a lot!

I'm adding this tag:

Fixes: 10905d70d788 ("media: media-request: implement media requests")

FYI: in the future, to get patches to the stable trees, please do add the
Cc: stable... tag, but not actually send the patch to stable@vger e-mail
address.

-- 
Kind regards,

Sakari Ailus

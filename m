Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77BA52AFAC
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 10:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfE0IDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 04:03:50 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39637 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725940AbfE0IDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 04:03:50 -0400
Received: from [IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52] ([IPv6:2001:983:e9a7:1:f4bd:6355:63eb:2e52])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VAbjhZIxOsDWyVAbkhXuwd; Mon, 27 May 2019 10:03:48 +0200
Subject: Re: [PATCH] [media] saa7164: fix remove_proc_entry warning
To:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20190504071057.58471-1-wangkefeng.wang@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a921e7c8-53a2-bc48-286e-76efa6c4ba07@xs4all.nl>
Date:   Mon, 27 May 2019 10:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504071057.58471-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLMXdyy8P4owi1zaozJ/tArHPThVSmQIWfesupukT3EQ3TjJ16wZunP5+4VKNBTztZL+8lwdukVxrQFdfeLi8FgvDPL+y+nW+QX54wkcVPvlDjO63GQN
 NJD5pHiea7uRl2GsSIpcYmnQHngPN5DxW/B9p2t8QEzqk7gK4ZZHYcR/esTzjgAEfI3uqt/XVSMY97h4ry0zXS9aAWoOs2u7ELVbqV87lzEOosXt1q4zdSfH
 2tWpQEF4Vfn6Y3gOZenvxqP+qxZzHdmy/kqL2NuXW9mpYScr/E3yDcHHeTWkJwfpfDfweWPkp9vJf4monbGB8D4RnoOGITQ64mFuQvZfiw6Qa1lukJ4PTAsb
 F19ifHNR9AqTQrJJA5JOPUrmidoQmz3jQGnmnY58Lpz7Cl4RCERSO+CUbVQCWNyDjw+h9DLH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/4/19 9:10 AM, Kefeng Wang wrote:
> if saa7164_proc_create() fails, saa7164_fini() will trigger a warning,
> 
> name 'saa7164'
> WARNING: CPU: 1 PID: 6311 at fs/proc/generic.c:672 remove_proc_entry+0x1e8/0x3a0
>   ? remove_proc_entry+0x1e8/0x3a0
>   ? try_stop_module+0x7b/0x240
>   ? proc_readdir+0x70/0x70
>   ? rcu_read_lock_sched_held+0xd7/0x100
>   saa7164_fini+0x13/0x1f [saa7164]
>   __x64_sys_delete_module+0x30c/0x480
>   ? __ia32_sys_delete_module+0x480/0x480
>   ? __x64_sys_clock_gettime+0x11e/0x1c0
>   ? __x64_sys_timer_create+0x1a0/0x1a0
>   ? trace_hardirqs_off_caller+0x40/0x180
>   ? do_syscall_64+0x18/0x450
>   do_syscall_64+0x9f/0x450
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Fix it by checking the return of proc_create_single() before
> calling remove_proc_entry().
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/media/pci/saa7164/saa7164-core.c | 31 +++++++++++++++---------
>  1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
> index 05f25c9bb308..51dff0d84399 100644
> --- a/drivers/media/pci/saa7164/saa7164-core.c
> +++ b/drivers/media/pci/saa7164/saa7164-core.c
> @@ -1122,16 +1122,23 @@ static int saa7164_proc_show(struct seq_file *m, void *v)
>  	return 0;
>  }
>  
> +static struct proc_dir_entry *saa7164_pe;

Add empty line to separate this global from the function.

>  static int saa7164_proc_create(void)
>  {
> -	struct proc_dir_entry *pe;
> -
> -	pe = proc_create_single("saa7164", S_IRUGO, NULL, saa7164_proc_show);
> -	if (!pe)
> +	saa7164_pe = proc_create_single("saa7164", S_IRUGO, NULL, saa7164_proc_show);
> +	if (!saa7164_pe)
>  		return -ENOMEM;
>  
>  	return 0;
>  }

Add empty line to separate the two functions.

> +static void saa7164_proc_destory(void)

destory -> destroy

> +{
> +	if (saa7164_pe)
> +		remove_proc_entry("saa7164", NULL);
> +}
> +#else
> +static int saa7164_proc_create(void) { return 0; }
> +static void saa7164_proc_destory(void) {}
>  #endif
>  
>  static int saa7164_thread_function(void *data)
> @@ -1503,19 +1510,21 @@ static struct pci_driver saa7164_pci_driver = {
>  
>  static int __init saa7164_init(void)
>  {
> -	printk(KERN_INFO "saa7164 driver loaded\n");
> +	int ret = pci_register_driver(&saa7164_pci_driver);
> +
> +	if (ret)
> +		return ret;
>  
> -#ifdef CONFIG_PROC_FS
>  	saa7164_proc_create();
> -#endif
> -	return pci_register_driver(&saa7164_pci_driver);
> +
> +	printk(KERN_INFO "saa7164 driver loaded\n");
> +
> +	return 0;
>  }
>  
>  static void __exit saa7164_fini(void)
>  {
> -#ifdef CONFIG_PROC_FS
> -	remove_proc_entry("saa7164", NULL);
> -#endif
> +	saa7164_proc_destory();
>  	pci_unregister_driver(&saa7164_pci_driver);
>  }
>  
> 

Regards,

	Hans

Return-Path: <linux-media+bounces-63198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFZML9P+HGoYUwkAu9opvQ
	(envelope-from <linux-media+bounces-63198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 05:38:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFEF61944D
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 05:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A0C030104BA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 03:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C50A282F2A;
	Mon,  1 Jun 2026 03:38:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8B27F75C;
	Mon,  1 Jun 2026 03:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780285132; cv=none; b=JZF25759SGI96EV6BOSYIil5kOwO0NS736wPGRhDCTaZSGJkmi/yct0+/ehv4Wxr5WGNpck2I0nBGP2LlT2AivCvJ5fdE5218cmtk79+NWapLvy1GT5C/4fMB+GRpI3m+v7lik7NKUvkyL4Kf6aerpfofAMXwEYJ93tH1GOqbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780285132; c=relaxed/simple;
	bh=zNdfLa+QXCVArwNdz/J1K9BH1ezk7fPnqIrW0fWfptw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKrKnf/uygU2Y00y7Z1UamCF+fmrBpF8r+oisYTnmp/EjL4o6OMyOD8tYAlx8YNXSpDg1mBv4iNCKH/cDlcfo5nHxclY/WttdcuPh5yO+Aq/3k7b9Lc2PbwCG11rB6QFsOm9fhzl/L9TXv2e33AZQrYYJzl1HfefThLNGyFLgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 62df68da5d6b11f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:566d10ce-5558-413a-8358-b55c18a88c33,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3865acc9a14458812d97d66108dc9489,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62df68da5d6b11f1aa26b74ffac11d73-20260601
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1484930785; Mon, 01 Jun 2026 11:38:42 +0800
Message-ID: <79734bf1-a6cd-45a3-af8b-a0d930f27041@kylinos.cn>
Date: Mon, 1 Jun 2026 11:38:39 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free in au0828_dvb_register
To: Shuangpeng <shuangpeng.kernel@gmail.com>, xiaopeitux@foxmail.com
Cc: brad@nextdimension.cc, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, mingo@kernel.org, tglx@kernel.org
References: <AAC17221-93BF-436F-92AC-906A18F882F0@gmail.com>
 <tencent_6DDC3554CD90D85E21277073C6AE67116F08@qq.com>
 <2EBF1AF0-ED21-4B11-87DB-9E40AD082F7F@gmail.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <2EBF1AF0-ED21-4B11-87DB-9E40AD082F7F@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63198-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	FREEMAIL_TO(0.00)[gmail.com,foxmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:mid,kylinos.cn:email,foxmail.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CAFEF61944D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/5/30 03:22, Shuangpeng 写道:
>
>> On May 29, 2026, at 04:30, xiaopeitux@foxmail.com wrote:
>>
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>
>>> Hi Kernel Maintainers,
>>>
>>> We hit the following KASAN report while testing current upstream kernel:
>>>
>>> KASAN: slab-use-after-free in au0828_dvb_register
>>>
>>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>>
>>> The reproducer and .config files are here.
>>> https://gist.github.com/shuangpengbai/c31163f8ef234ba4fe85038c2f97f9cc
>>>
>>> I’m happy to test debug patches or provide additional information.
>>>
>>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>> Can you help post all the crash logs? 
>> Does the kernel log have this print: 
>> "The frontend of your DVB/ATSC card isn't supported yet." 
> I did not see this message in log.
>
>
>> Please help post all the logs, thank you!
> Thank you for taking a look. All terminal outputs after running the reproducer:
 au0828_usb_probe
         au0828_dvb_register
            dvb_attach(xc5000_attach, dvb->frontend,
            dvb_register  
                   if (dvb->frontend->ops.release)
                        dvb->frontend->ops.release(dvb->frontend);

dvb_register 
    result = dvb_register_frontend(&dvb->adapter, dvb->frontend);
        pr_err("dvb_register_frontend failed (errno = %d)\n",//-12,  no kref_init(&fe->refcount);，fe->frontend_priv is NULL
                       result);
        goto fail_frontend

fail_frontend:
dvb_frontend_detach(dvb->frontend);

dvb_frontend_detach:
    dvb_frontend_put  
        __dvb_frontend_free
            dvb_frontend_invoke_release(fe, fe->ops.release);
 
 
static void dvb_frontend_invoke_release(struct dvb_frontend *fe,
                                        void (*release)(struct dvb_frontend *fe))
{
        if (release) {
                release(fe);
#ifdef CONFIG_MEDIA_ATTACH
                dvb_detach(release);
#endif  
        }
}  

au8522_attach
.release              = au8522_release,
    au8522_release_state
        kfree(state);//have free

How did this problem occur, and is the probability of it occurring high?
so we can remove in au0828_dvb_register function follow lines to fix this UAF bug? 

ret = dvb_register(dev);
        if (ret < 0) {
               // if (dvb->frontend->ops.release)
               //        dvb->frontend->ops.release(dvb->frontend);
               //  dvb->frontend = NULL;
                return ret;
        }
Could you please help test this modified code?
> [   64.807294][   T42] usb 3-1: new high-speed USB device number 2 using dummy_hcd
> [   64.958989][   T42] usb 3-1: New USB device found, idVendor=0fe9, idProduct=d620, bcdDevice= 1.00
> [   64.961560][   T42] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [   65.351442][   T42] au0828: i2c bus registered
> [   65.634777][   T42] au8522 1-0047: creating new instance
> [   65.655406][   T42] DVB: Unable to find symbol xc5000_attach()
> [   65.656022][   T42] dvbdev: DVB: registering new adapter (au0828)
> [   65.656632][   T42] au0828: dvb_register_frontend failed (errno = -12)
> [   65.658957][   T42] au8522 1-0047: destroying instance
> [   65.659499][   T42] ==================================================================
> [   65.660261][   T42] BUG: KASAN: slab-use-after-free in au0828_dvb_register+0x1280/0x15f0
> [   65.661023][   T42] Read of size 8 at addr ffff8881685f4118 by task kworker/1:1/42
> [   65.661742][   T42]
> [   65.661973][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
> [   65.661978][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
> [   65.661981][   T42] Workqueue: usb_hub_wq hub_event
> [   65.661988][   T42] Call Trace:
> [   65.661991][   T42]  <TASK>
> [   65.661993][   T42]  dump_stack_lvl+0x26/0x80
> [   65.661999][   T42]  print_report+0x16a/0x5d0
> [   65.662013][   T42]  kasan_report+0xc3/0x100
> [   65.662019][   T42]  au0828_dvb_register+0x1280/0x15f0
> [   65.662026][   T42]  au0828_usb_probe+0x353/0x4b0
> [   65.662029][   T42]  usb_probe_interface+0x4aa/0xa40
> [   65.662034][   T42]  really_probe+0x259/0x9a0
> [   65.662041][   T42]  __driver_probe_device+0x18b/0x370
> [   65.662045][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.662049][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.662055][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.663294][   T42]  __device_attach+0x25a/0x480
> [   65.663321][   T42]  device_initial_probe+0x68/0xa0
> [   65.663324][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.663328][   T42]  device_add+0x56b/0x9c0
> [   65.663332][   T42]  usb_set_configuration+0x1775/0x1d80
> [   65.663337][   T42]  usb_generic_driver_probe+0x61/0xf0
> [   65.663343][   T42]  usb_probe_device+0xd3/0x2a0
> [   65.663346][   T42]  really_probe+0x259/0x9a0
> [   65.663350][   T42]  __driver_probe_device+0x18b/0x370
> [   65.663354][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.663357][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.663363][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.663381][   T42]  __device_attach+0x25a/0x480
> [   65.663403][   T42]  device_initial_probe+0x68/0xa0
> [   65.663405][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.663409][   T42]  device_add+0x56b/0x9c0
> [   65.663412][   T42]  usb_new_device+0xbdd/0x1830
> [   65.663423][   T42]  hub_event+0x2358/0x4090
> [   65.663443][   T42]  process_scheduled_works+0x73d/0xed0
> [   65.663451][   T42]  worker_thread+0x7d6/0xb60
> [   65.663459][   T42]  kthread+0x322/0x410
> [   65.663470][   T42]  ret_from_fork+0x285/0x750
> [   65.663485][   T42]  ret_from_fork_asm+0x1a/0x30
> [   65.663491][   T42]  </TASK>
> [   65.663493][   T42]
> [   65.702422][   T42] Freed by task 42 on cpu 1 at 65.659497s:
> [   65.702994][   T42]  kasan_save_track+0x2e/0x90
> [   65.703471][   T42]  kasan_save_free_info+0x3c/0x50
> [   65.703965][   T42]  __kasan_slab_free+0x36/0x60
> [   65.704450][   T42]  kfree+0x154/0x450
> [   65.704839][   T42]  au8522_release_state+0x1b6/0x210
> [   65.705364][   T42]  dvb_frontend_put+0x12a/0x170
> [   65.705848][   T42]  au0828_dvb_register+0xfd9/0x15f0
> [   65.706373][   T42]  au0828_usb_probe+0x353/0x4b0
> [   65.706854][   T42]  usb_probe_interface+0x4aa/0xa40
> [   65.707373][   T42]  really_probe+0x259/0x9a0
> [   65.707822][   T42]  __driver_probe_device+0x18b/0x370
> [   65.708347][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.708845][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.709383][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.709864][   T42]  __device_attach+0x25a/0x480
> [   65.710339][   T42]  device_initial_probe+0x68/0xa0
> [   65.710836][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.711323][   T42]  device_add+0x56b/0x9c0
> [   65.711750][   T42]  usb_set_configuration+0x1775/0x1d80
> [   65.712294][   T42]  usb_generic_driver_probe+0x61/0xf0
> [   65.712822][   T42]  usb_probe_device+0xd3/0x2a0
> [   65.713305][   T42]  really_probe+0x259/0x9a0
> [   65.713752][   T42]  __driver_probe_device+0x18b/0x370
> [   65.714282][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.714779][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.715313][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.715794][   T42]  __device_attach+0x25a/0x480
> [   65.716271][   T42]  device_initial_probe+0x68/0xa0
> [   65.716767][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.717262][   T42]  device_add+0x56b/0x9c0
> [   65.717690][   T42]  usb_new_device+0xbdd/0x1830
> [   65.717869][    C0] clocksource: Watchdog remote CPU 1 read timed out
> [   65.718172][   T42]  hub_event+0x2358/0x4090
> [   65.718177][   T42]  process_scheduled_works+0x73d/0xed0
> [   65.718180][   T42]  worker_thread+0x7d6/0xb60
> [   65.718183][   T42]  kthread+0x322/0x410
> [   65.718187][   T42]  ret_from_fork+0x285/0x750
> [   65.718189][   T42]  ret_from_fork_asm+0x1a/0x30
> [   65.718192][   T42]
> [   65.718194][   T42] The buggy address belongs to the object at ffff8881685f4000
> [   65.718194][   T42]  which belongs to the cache kmalloc-4k of size 4096
> [   65.718197][   T42] The buggy address is located 280 bytes inside of
> [   65.718197][   T42]  freed 4096-byte region [ffff8881685f4000, ffff8881685f5000)
> [   65.718200][   T42]
> [   65.718201][   T42] The buggy address belongs to the physical page:
> [   65.718204][   T42] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1685f0
> [   65.718209][   T42] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [   65.718212][   T42] flags: 0x17ff00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
> [   65.729357][   T42] page_type: f5(slab)
> [   65.729757][   T42] raw: 017ff00000000040 ffff888100042140 dead000000000100 dead000000000122
> [   65.730603][   T42] raw: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
> [   65.731450][   T42] head: 017ff00000000040 ffff888100042140 dead000000000100 dead000000000122
> [   65.732301][   T42] head: 0000000000000000 0000000800040004 00000000f5000000 0000000000000000
> [   65.733211][   T42] head: 017ff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
> [   65.734064][   T42] head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
> [   65.734922][   T42] page dumped because: kasan: bad access detected
> [   65.735562][   T42] page_owner tracks the page as allocated
> [   65.736133][   T42] page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__G2
> [   65.738177][   T42]  post_alloc_hook+0x152/0x180
> [   65.738654][   T42]  get_page_from_freelist+0x3996/0x3b50
> [   65.739207][   T42]  __alloc_frozen_pages_noprof+0x243/0x750
> [   65.739783][   T42]  allocate_slab+0x76/0x5e0
> [   65.740242][   T42]  refill_objects+0x2e1/0x360
> [   65.740706][   T42]  __pcs_replace_empty_main+0x233/0x440
> [   65.741262][   T42]  __kmalloc_cache_noprof+0x2d0/0x490
> [   65.741791][   T42]  au8522_get_state+0x266/0x4c0
> [   65.742280][   T42]  au8522_attach+0xba/0x2d0
> [   65.742728][   T42]  au0828_dvb_register+0xcc/0x15f0
> [   65.743241][   T42]  au0828_usb_probe+0x353/0x4b0
> [   65.743723][   T42]  usb_probe_interface+0x4aa/0xa40
> [   65.744264][   T42]  really_probe+0x259/0x9a0
> [   65.744713][   T42]  __driver_probe_device+0x18b/0x370
> [   65.745246][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.745745][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.746284][   T42] page last free pid 4578 tgid 4578 stack trace:
> [   65.746909][   T42]  __free_frozen_pages+0xb8c/0xcb0
> [   65.747427][   T42]  __slab_free+0x219/0x260
> [   65.747870][   T42]  qlist_free_all+0x33/0x120
> [   65.748339][   T42]  kasan_quarantine_reduce+0x152/0x170
> [   65.748877][   T42]  __kasan_slab_alloc+0x1f/0x60
> [   65.749368][   T42]  kmem_cache_alloc_noprof+0x1f0/0x480
> [   65.749908][   T42]  do_getname+0x2a/0x1c0
> [   65.750337][   T42]  do_sys_openat2+0x99/0x190
> [   65.750798][   T42]  __x64_sys_openat+0x20b/0x260
> [   65.751287][   T42]  do_syscall_64+0x125/0x590
> [   65.751744][   T42]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   65.752334][   T42]
> [   65.752572][   T42] Memory state around the buggy address:
> [   65.753132][   T42]  ffff8881685f4000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   65.753918][   T42]  ffff8881685f4080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   65.754712][   T42] >ffff8881685f4100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   65.755504][   T42]                             ^
> [   65.755985][   T42]  ffff8881685f4180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   65.756775][   T42]  ffff8881685f4200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> [   65.757575][   T42] ==================================================================
> [   65.758570][   T42] Kernel panic - not syncing: KASAN: panic_on_warn set ...
> [   65.759306][   T42] CPU: 1 UID: 0 PID: 42 Comm: kworker/1:1 Not tainted 7.1.0-rc5-00006-ge8c2f9fdadee #16 PREEMPT(
> [   65.760402][   T42] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debia4
> [   65.761615][   T42] Workqueue: usb_hub_wq hub_event
> [   65.762263][   T42] Call Trace:
> [   65.762658][   T42]  <TASK>
> [   65.762956][   T42]  dump_stack_lvl+0x26/0x80
> [   65.763420][   T42]  vpanic+0x37d/0x710
> [   65.764686][   T42]  panic+0x9f/0xa0
> [   65.767120][   T42]  check_panic_on_warn+0x58/0x70
> [   65.768155][   T42]  end_report+0x44/0xe0
> [   65.769116][   T42]  kasan_report+0xd4/0x100
> [   65.770092][   T42]  au0828_dvb_register+0x1280/0x15f0
> [   65.771097][   T42]  au0828_usb_probe+0x353/0x4b0
> [   65.771586][   T42]  usb_probe_interface+0x4aa/0xa40
> [   65.772089][   T42]  really_probe+0x259/0x9a0
> [   65.772549][   T42]  __driver_probe_device+0x18b/0x370
> [   65.773069][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.773576][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.774692][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.777453][   T42]  __device_attach+0x25a/0x480
> [   65.780818][   T42]  device_initial_probe+0x68/0xa0
> [   65.781322][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.781800][   T42]  device_add+0x56b/0x9c0
> [   65.782284][   T42]  usb_set_configuration+0x1775/0x1d80
> [   65.782822][   T42]  usb_generic_driver_probe+0x61/0xf0
> [   65.783361][   T42]  usb_probe_device+0xd3/0x2a0
> [   65.783832][   T42]  really_probe+0x259/0x9a0
> [   65.784286][   T42]  __driver_probe_device+0x18b/0x370
> [   65.784804][   T42]  driver_probe_device+0x4b/0x1e0
> [   65.785304][   T42]  __device_attach_driver+0x1d0/0x2f0
> [   65.786416][   T42]  bus_for_each_drv+0x22a/0x260
> [   65.789198][   T42]  __device_attach+0x25a/0x480
> [   65.792606][   T42]  device_initial_probe+0x68/0xa0
> [   65.793101][   T42]  bus_probe_device+0x10a/0x1d0
> [   65.793602][   T42]  device_add+0x56b/0x9c0
> [   65.794028][   T42]  usb_new_device+0xbdd/0x1830
> [   65.795025][   T42]  hub_event+0x2358/0x4090
> [   65.797580][   T42]  process_scheduled_works+0x73d/0xed0
> [   65.798124][   T42]  worker_thread+0x7d6/0xb60
> [   65.799085][   T42]  kthread+0x322/0x410
> [   65.800465][   T42]  ret_from_fork+0x285/0x750
> [   65.802356][   T42]  ret_from_fork_asm+0x1a/0x30
> [   65.802830][   T42]  </TASK>
> [   65.803886][   T42] Kernel Offset: disabled
> [   65.804329][   T42] ---[ end Kernel panic - not syncing: KASAN: panic_on_warn set ... ]—
>
>>>
>>> [  141.481576][   T48] ==================================================================
>>> [  141.482348][   T48] BUG: KASAN: slab-use-after-free in au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
>>> [  141.483148][   T48] Read of size 8 at addr ffff888171d4a118 by task kworker/1:1/48
>>> [  141.483903][   T48]
>>> [  141.484144][   T48] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.34
>>> [  141.484148][   T48] Workqueue: usb_hub_wq hub_event
>>> [  141.484154][   T48] Call Trace:
>>> [  141.484157][   T48]  <TASK>
>>> [  141.484159][   T48]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
>>> [  141.484164][   T48]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
>>> [  141.484177][   T48]  kasan_report (mm/kasan/report.c:595)
>>> [  141.484183][   T48]  au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:636)
>>> [  141.484190][   T48]  au0828_usb_probe (drivers/media/usb/au0828/au0828-core.c:733)
>>> [  141.484193][   T48]  usb_probe_interface (drivers/usb/core/driver.c:396)
>>> [  141.484198][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
>>> [  141.484204][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>>> [  141.484207][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>> [  141.484211][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
>>> [  141.484217][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>> [  141.484264][   T48]  __device_attach (drivers/base/dd.c:1101)
>>> [  141.484289][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>>> [  141.484292][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>> [  141.484296][   T48]  device_add (drivers/base/core.c:3706)
>>> [  141.484299][   T48]  usb_set_configuration (drivers/usb/core/message.c:2268)
>>> [  141.484303][   T48]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
>>> [  141.484308][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
>>> [  141.484311][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
>>> [  141.484315][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>>> [  141.484318][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>> [  141.484321][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
>>> [  141.484328][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>> [  141.484346][   T48]  __device_attach (drivers/base/dd.c:1101)
>>> [  141.484367][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>>> [  141.484370][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>> [  141.484374][   T48]  device_add (drivers/base/core.c:3706)
>>> [  141.484376][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
>>> [  141.484386][   T48]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
>>> [  141.484406][   T48]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>>> [  141.484412][   T48]  worker_thread (kernel/workqueue.c:3478)
>>> [  141.484420][   T48]  kthread (kernel/kthread.c:436)
>>> [  141.484431][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
>>> [  141.484445][   T48]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
>>> [  141.484450][   T48]  </TASK>
>>> [  141.484451][   T48]
>>> [  141.523531][   T48] Freed by task 48 on cpu 1 at 141.481575s:
>>> [  141.524120][   T48]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
>>> [  141.524594][   T48]  kasan_save_free_info (mm/kasan/generic.c:584)
>>> [  141.525089][   T48]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
>>> [  141.525570][   T48]  kfree (./include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
>>> [  141.525957][   T48]  au8522_release_state (drivers/media/dvb-frontends/au8522_common.c:124)
>>> [  141.526467][   T48]  dvb_frontend_put (drivers/media/dvb-core/dvb_frontend.c:3093 drivers/media/dvb-core/dvb_frontend.c:141 drivers/media/dvb-core/dvb_frontend.c:166)
>>> [  141.526957][   T48]  au0828_dvb_register (drivers/media/usb/au0828/au0828-dvb.c:518 drivers/media/usb/au0828/au0828-dvb.c:634)
>>> [  141.527469][   T48]  au0828_usb_probe (drivers/media/usb/au0828/au0828-core.c:733)
>>> [  141.527952][   T48]  usb_probe_interface (drivers/usb/core/driver.c:396)
>>> [  141.528455][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
>>> [  141.528908][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>>> [  141.529426][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>> [  141.529932][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
>>> [  141.530459][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>> [  141.530949][   T48]  __device_attach (drivers/base/dd.c:1101)
>>> [  141.531419][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>>> [  141.531923][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>> [  141.532404][   T48]  device_add (drivers/base/core.c:3706)
>>> [  141.532840][   T48]  usb_set_configuration (drivers/usb/core/message.c:2268)
>>> [  141.533373][   T48]  usb_generic_driver_probe (drivers/usb/core/generic.c:250)
>>> [  141.533907][   T48]  usb_probe_device (drivers/usb/core/driver.c:291)
>>> [  141.534377][   T48]  really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
>>> [  141.534833][   T48]  __driver_probe_device (drivers/base/dd.c:871)
>>> [  141.535352][   T48]  driver_probe_device (drivers/base/dd.c:901)
>>> [  141.535856][   T48]  __device_attach_driver (drivers/base/dd.c:1029)
>>> [  141.536384][   T48]  bus_for_each_drv (drivers/base/bus.c:500)
>>> [  141.536869][   T48]  __device_attach (drivers/base/dd.c:1101)
>>> [  141.537340][   T48]  device_initial_probe (drivers/base/dd.c:1156)
>>> [  141.537839][   T48]  bus_probe_device (drivers/base/bus.c:613)
>>> [  141.538320][   T48]  device_add (drivers/base/core.c:3706)
>>> [  141.538753][   T48]  usb_new_device (drivers/usb/core/hub.c:2695)
>>> [  141.539226][   T48]  hub_event (drivers/usb/core/hub.c:5567 drivers/usb/core/hub.c:5707 drivers/usb/core/hub.c:5871 drivers/usb/core/hub.c:5953)
>>> [  141.539672][   T48]  process_scheduled_works (kernel/workqueue.c:3314 kernel/workqueue.c:3397)
>>> [  141.540205][   T48]  worker_thread (kernel/workqueue.c:3478)
>>> [  141.540666][   T48]  kthread (kernel/kthread.c:436)
>>> [  141.541069][   T48]  ret_from_fork (arch/x86/kernel/process.c:158)
>>> [  141.541524][   T48]  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
>>> [  141.541999][   T48]
>>> [  141.542236][   T48] The buggy address belongs to the object at ffff888171d4a000
>>> [  141.542236][   T48]  which belongs to the cache kmalloc-4k of size 4096
>>> [  141.543602][   T48] The buggy address is located 280 bytes inside of
>>> [  141.543602][   T48]  freed 4096-byte region [ffff888171d4a000, ffff888171d4b000)



Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312C3791146
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 08:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352319AbjIDGQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 02:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239873AbjIDGQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 02:16:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D21E6
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 23:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693808191; x=1725344191;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=4gQFqXE2U9mzqHNgGeu3VfR0Gju+s1l7xkd2ojUQbUE=;
  b=Hq8IkNDSgg5JX+2ZiiYmrJ5bKnFieNirOnaUbKPQn4CUxkqbpZBmcS5C
   3hGeoEc5CVD1CBgHv89TpktKJa6UGznPGhIN6iXoTP8kctHskyRyVIzNa
   EyLaIgl2SGi87zvrsbaIqq22SuzRlGI44cyPqvV5oSYlV8cOVYgUDdwdq
   4/CXw6TbPLhZrn8zxQxUiOOLdQfQs1UASYU2F27oJsH9RYrQN4xpQIbYY
   MfwqPHREhtc6dA2VqJy5kdXTsK2DQGONPWPTtf+KbFRyVTn2h043iJkAU
   k3GUFIH5ApxXjf6oDUe+WsWdHrk6ktwM4O1MPKMhV0d6PtXlUOuihjwq8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356021541"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="356021541"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 23:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="769865491"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="769865491"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.146]) ([10.238.232.146])
  by orsmga008.jf.intel.com with ESMTP; 03 Sep 2023 23:16:26 -0700
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
To:     Hans de Goede <hdegoede@redhat.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <fc63b127-d8e5-c278-d17a-3ecc90febbe3@linux.intel.com>
Date:   Mon, 4 Sep 2023 14:12:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,

On 9/3/23 10:32 PM, Hans de Goede wrote:
> Hi All,
> 
> On 9/2/23 16:54, Hans de Goede wrote:
>> Attached is one more patch which fixes an oops when
>> using lockdep.
>>
>> With both patches applied this is:
>>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> I withdraw my Tested-by. After a fresh install the driver crashed,
> messing up the entire machine, due to the firmware not being
> installed.
> 
> On missing firmware the driver should simply exit cleanly, not
> take down the entire machine.
> 
> Here is a backtrace of the crash:
> 
> [   12.549799] intel-ipu6 0000:00:05.0: cpd file name: intel/ipu6ep_fw.bin
> [   12.551859] intel-ipu6 0000:00:05.0: Direct firmware load for intel/ipu6ep_fw.bin failed with error -2
> [   12.551876] intel-ipu6 0000:00:05.0: Requesting signed firmware failed
> [   12.551880] intel-ipu6: probe of 0000:00:05.0 failed with error -2
> [   12.552112] BUG: kernel NULL pointer dereference, address: 0000000000000490
> [   12.552116] #PF: supervisor read access in kernel mode
> [   12.552118] #PF: error_code(0x0000) - not-present page
> [   12.552119] PGD 0 P4D 0 
> [   12.552121] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   12.552124] CPU: 2 PID: 692 Comm: (udev-worker) Not tainted 6.5.0+ #1
> [   12.552126] Hardware name: LENOVO 21CEZ9Q3US/21CEZ9Q3US, BIOS N3AET72W (1.37 ) 03/02/2023
> [   12.552127] RIP: 0010:ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
> [   12.552137] Code: 34 03 00 00 c7 44 24 04 00 00 00 00 41 bc 64 00 00 00 45 31 ed 48 8b 85 50 04 00 00 89 98 9c 00 00 00 45 31 ff 4a 8b 7c fc 08 <4c> 8b b7 90 04 00 00 48 85 ff 74 46 48 83 bf 88 04 00 00 00 74 3c
> [   12.552138] RSP: 0018:ffffb5928145fb08 EFLAGS: 00010046
> [   12.552140] RAX: ffffb59289000000 RBX: 0000000000000040 RCX: 0000000000000001
> [   12.552142] RDX: 0000000000000000 RSI: ffff90a2c67a2828 RDI: 0000000000000000
> [   12.552143] RBP: ffff90a2c67a2828 R08: 0000000000000001 R09: 0000000000000001
> [   12.552144] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000064
> [   12.552145] R13: 0000000000000000 R14: ffff90a2c5b79400 R15: 0000000000000000
> [   12.552146] FS:  00007fd5bf725940(0000) GS:ffff90a60f100000(0000) knlGS:0000000000000000
> [   12.552148] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   12.552150] CR2: 0000000000000490 CR3: 000000010c28c000 CR4: 0000000000750ee0
> [   12.552152] PKRU: 55555554
> [   12.552153] Call Trace:
> [   12.552155]  <TASK>
> [   12.552157]  ? __die+0x1f/0x70
> [   12.552162]  ? page_fault_oops+0x13d/0x480
> [   12.552167]  ? do_user_addr_fault+0x65/0x830
> [   12.552170]  ? exc_page_fault+0x36/0x200
> [   12.552174]  ? exc_page_fault+0x7b/0x200
> [   12.552176]  ? asm_exc_page_fault+0x22/0x30
> [   12.552180]  ? ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
> [   12.552186]  ? _raw_spin_unlock_irqrestore+0x35/0x60
> [   12.552190]  free_irq+0x256/0x3a0
> [   12.552194]  devres_release_all+0xa5/0xe0
> [   12.552200]  device_unbind_cleanup+0xe/0x70
> [   12.552203]  really_probe+0x145/0x3e0
> [   12.552206]  ? __pfx___driver_attach+0x10/0x10
> [   12.552209]  __driver_probe_device+0x78/0x160
> [   12.552212]  driver_probe_device+0x1f/0x90
> [   12.552215]  __driver_attach+0xd2/0x1c0
> [   12.552218]  bus_for_each_dev+0x63/0xa0
> [   12.552221]  bus_add_driver+0x115/0x210
> [   12.552223]  driver_register+0x55/0x100
> [   12.552226]  ? __pfx_ipu6_init+0x10/0x10 [intel_ipu6]
> [   12.552234]  ipu6_init+0x20/0xff0 [intel_ipu6]
> [   12.552241]  ? __pfx_ipu6_init+0x10/0x10 [intel_ipu6]
> [   12.552247]  do_one_initcall+0x5a/0x360
> [   12.552251]  ? rcu_is_watching+0xd/0x40
> [   12.552254]  ? kmalloc_trace+0xa5/0xb0
> [   12.552258]  do_init_module+0x60/0x230
> [   12.552261]  init_module_from_file+0x75/0xa0
> [   12.552265]  idempotent_init_module+0xf9/0x270
> [   12.552268]  ? subflow_v6_conn_request+0xc0/0x120
> [   12.552273]  __x64_sys_finit_module+0x5a/0xb0
> [   12.552276]  do_syscall_64+0x59/0x90
> [   12.552279]  ? do_syscall_64+0x68/0x90
> [   12.552281]  ? lockdep_hardirqs_on+0x7d/0x100
> [   12.552283]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   12.552286] RIP: 0033:0x7fd5bff2cb5d
> [   12.552288] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7b 92 0c 00 f7 d8 64 89 01 48
> [   12.552289] RSP: 002b:00007ffc50c03b38 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   12.552291] RAX: ffffffffffffffda RBX: 000055e540797f00 RCX: 00007fd5bff2cb5d
> [   12.552292] RDX: 0000000000000000 RSI: 00007fd5c052607d RDI: 000000000000000c
> [   12.552293] RBP: 00007ffc50c03bf0 R08: 0000000000000000 R09: 00007ffc50c03b80
> [   12.552294] R10: 000000000000000c R11: 0000000000000246 R12: 00007fd5c052607d
> [   12.552296] R13: 0000000000020000 R14: 000055e540797030 R15: 000055e540796290
> [   12.552301]  </TASK>
> [   12.552302] Modules linked in: v4l2_async(+) processor_thermal_rfim industrialio_triggered_buffer ecdh_generic(+) processor_thermal_mbox kfifo_buf videodev snd processor_thermal_rapl intel_skl_int3472_tps68470 intel_ipu6(+) industrialio thunderbolt(+) soundcore tps68470_regulator rfkill mc intel_rapl_common ipu_bridge intel_hid int3403_thermal(+) idma64(+) soc_button_array intel_vsec igen6_edac int340x_thermal_zone clk_tps68470 joydev intel_skl_int3472_discrete sparse_keymap int3400_thermal acpi_thermal_rel acpi_pad acpi_tad loop zram hid_sensor_hub intel_ishtp_hid i915 i2c_algo_bit crct10dif_pclmul drm_buddy crc32_pclmul ttm crc32c_intel drm_display_helper intel_ish_ipc video nvme ghash_clmulni_intel ucsi_acpi wacom hid_multitouch sha512_ssse3 typec_ucsi nvme_core intel_ishtp cec typec i2c_hid_acpi i2c_hid wmi pinctrl_tigerlake serio_raw ip6_tables ip_tables fuse
> [   12.552348] CR2: 0000000000000490
> [   12.552351] ---[ end trace 0000000000000000 ]---
> [   12.552352] RIP: 0010:ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
> [   12.552361] Code: 34 03 00 00 c7 44 24 04 00 00 00 00 41 bc 64 00 00 00 45 31 ed 48 8b 85 50 04 00 00 89 98 9c 00 00 00 45 31 ff 4a 8b 7c fc 08 <4c> 8b b7 90 04 00 00 48 85 ff 74 46 48 83 bf 88 04 00 00 00 74 3c
> [   12.552363] RSP: 0018:ffffb5928145fb08 EFLAGS: 00010046
> [   12.552365] RAX: ffffb59289000000 RBX: 0000000000000040 RCX: 0000000000000001
> [   12.552366] RDX: 0000000000000000 RSI: ffff90a2c67a2828 RDI: 0000000000000000
> [   12.552367] RBP: ffff90a2c67a2828 R08: 0000000000000001 R09: 0000000000000001
> [   12.552368] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000064
> [   12.552369] R13: 0000000000000000 R14: ffff90a2c5b79400 R15: 0000000000000000
> [   12.552370] FS:  00007fd5bf725940(0000) GS:ffff90a60f100000(0000) knlGS:0000000000000000
> [   12.552371] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   12.552372] CR2: 0000000000000490 CR3: 000000010c28c000 CR4: 0000000000750ee0
> [   12.552373] PKRU: 55555554
> 
> Please fix this for the next version. Reproducing this is easy, just remove the firmware file from under /lib/firmware/intel .

Unfortunately, I did not reproduce this problem on my machine. The interrupt
should not be triggered until buttress authentication if need. 
So could you help try to move the devm_request_threaded_irq() block before

ret = ipu6_buttress_authenticate(isp);

to check what will happen?

Thanks!

> 
> Regards,
> 
> Hans
> 
> 

-- 
Best regards,
Bingbu Cao

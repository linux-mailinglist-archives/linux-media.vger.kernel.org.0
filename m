Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B06C791250
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 09:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbjIDHgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 03:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjIDHgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 03:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB35139
        for <linux-media@vger.kernel.org>; Mon,  4 Sep 2023 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693812907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K9EgpqrWT35INDX6Wb1Qvs7GVOvaI5WerrMNMQY5zcA=;
        b=YCfmfGk/S337Luz63Iq2EWto6lePRq8AqN2hw0AErBKs+6NZ0HbDlmMppMNnRsGYRMJb23
        bILzJWrL4iKauj/HPzWDcxXRGpe8uBbyJrjVoy27WATShh6IxLp5X6fHMj5e7ra7gFsmV+
        pqs1ITnEGRlKZuWOEUSKWW6PmrKsjZ8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-gi8_33Z6PhaXfsd0Dj0bvQ-1; Mon, 04 Sep 2023 03:35:05 -0400
X-MC-Unique: gi8_33Z6PhaXfsd0Dj0bvQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-52c03bb5327so694234a12.0
        for <linux-media@vger.kernel.org>; Mon, 04 Sep 2023 00:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812904; x=1694417704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9EgpqrWT35INDX6Wb1Qvs7GVOvaI5WerrMNMQY5zcA=;
        b=SQs7bZekEbtmR6G7qRmcF6ywLLT+kZJCZkjXix+XILwvkF4V+CTW6HR3nquOaPnAiq
         oFxINfTFQWN5sTtjwRKU2Ayt1W/ZaSKwq8FdgFxtmMaVdlenf1GJv1kG5ejNsIuEFtMa
         Zrw0A0pCA6lGEjqZCEyC3z00t1wvl0zDaw3iHDzRpwDoKSgPMXoMqw7vL0C8f0SNTR6z
         +b1Hngr9dAh7FqoDWjek2z8MPbATQzzP2yu8+ALHQoP3RFni9k42DSKNLbIS7IlClOCJ
         6ws8g4lpOUSHUh9flZUdPiK+J9HsSICecA0TkJiYAs2TDPZWqEXDs+ghws67fwMltLz9
         6axg==
X-Gm-Message-State: AOJu0Yy4n8xw5ZIWEiRTFnxP+rGXrvcmyKjUnUk4TQJo7DYot175gbuA
        CA2cwso5SCpabh8xs4svoJ6LJhLIiJV+FGs4okmoAgfxzecBfuS5Gd1D5T+fuO7KaMpiPs1hcjX
        FLlhEGcqZNFHW+nGvQRmWXts=
X-Received: by 2002:a17:906:8a67:b0:9a2:23cd:f04e with SMTP id hy7-20020a1709068a6700b009a223cdf04emr6223910ejc.12.1693812904561;
        Mon, 04 Sep 2023 00:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA18Jh6j5U+7OUMhnF2Y5D43Y+GiYsQ8IGKv4RX08QG+cmeCC9HsWcga9aAupJ1VQ9OMq1bg==
X-Received: by 2002:a17:906:8a67:b0:9a2:23cd:f04e with SMTP id hy7-20020a1709068a6700b009a223cdf04emr6223898ejc.12.1693812904250;
        Mon, 04 Sep 2023 00:35:04 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709067e1300b009a198078c53sm5708091ejr.214.2023.09.04.00.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:35:03 -0700 (PDT)
Message-ID: <50bacf12-469a-adde-0b40-252194bde8e1@redhat.com>
Date:   Mon, 4 Sep 2023 09:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US
To:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Cc:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 9/4/23 05:13, Cao, Bingbu wrote:
> Hans,
> 
> Thanks for your test and report.
> 
> I have made some changes locally which will support the latest
> v4l2-async APIs, I will also add the fix for this issue and merge
> them in v3.

Sounds good, thank you.

Regards,

Hans



> 
> 
> ------------------------------------------------------------------------
> BRs,  
> Bingbu Cao 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Sunday, September 3, 2023 10:33 PM
>> To: Claus Stovgaard <claus.stovgaard@gmail.com>; Bingbu Cao
>> <bingbu.cao@linux.intel.com>; Cao, Bingbu <bingbu.cao@intel.com>; linux-
>> media@vger.kernel.org; sakari.ailus@linux.intel.com;
>> laurent.pinchart@ideasonboard.com
>> Cc: ilpo.jarvinen@linux.intel.com; tfiga@chromium.org;
>> senozhatsky@chromium.org; andriy.shevchenko@linux.intel.com;
>> tomi.valkeinen@ideasonboard.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
>> Wang, Hongju <hongju.wang@intel.com>
>> Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
>>
>> Hi All,
>>
>> On 9/2/23 16:54, Hans de Goede wrote:
>>> Attached is one more patch which fixes an oops when using lockdep.
>>>
>>> With both patches applied this is:
>>>
>>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>>
>> I withdraw my Tested-by. After a fresh install the driver crashed,
>> messing up the entire machine, due to the firmware not being installed.
>>
>> On missing firmware the driver should simply exit cleanly, not take down
>> the entire machine.
>>
>> Here is a backtrace of the crash:
>>
>> [   12.549799] intel-ipu6 0000:00:05.0: cpd file name:
>> intel/ipu6ep_fw.bin
>> [   12.551859] intel-ipu6 0000:00:05.0: Direct firmware load for
>> intel/ipu6ep_fw.bin failed with error -2
>> [   12.551876] intel-ipu6 0000:00:05.0: Requesting signed firmware failed
>> [   12.551880] intel-ipu6: probe of 0000:00:05.0 failed with error -2
>> [   12.552112] BUG: kernel NULL pointer dereference, address:
>> 0000000000000490
>> [   12.552116] #PF: supervisor read access in kernel mode
>> [   12.552118] #PF: error_code(0x0000) - not-present page
>> [   12.552119] PGD 0 P4D 0
>> [   12.552121] Oops: 0000 [#1] PREEMPT SMP NOPTI
>> [   12.552124] CPU: 2 PID: 692 Comm: (udev-worker) Not tainted 6.5.0+ #1
>> [   12.552126] Hardware name: LENOVO 21CEZ9Q3US/21CEZ9Q3US, BIOS N3AET72W
>> (1.37 ) 03/02/2023
>> [   12.552127] RIP: 0010:ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
>> [   12.552137] Code: 34 03 00 00 c7 44 24 04 00 00 00 00 41 bc 64 00 00
>> 00 45 31 ed 48 8b 85 50 04 00 00 89 98 9c 00 00 00 45 31 ff 4a 8b 7c fc
>> 08 <4c> 8b b7 90 04 00 00 48 85 ff 74 46 48 83 bf 88 04 00 00 00 74 3c
>> [   12.552138] RSP: 0018:ffffb5928145fb08 EFLAGS: 00010046
>> [   12.552140] RAX: ffffb59289000000 RBX: 0000000000000040 RCX:
>> 0000000000000001
>> [   12.552142] RDX: 0000000000000000 RSI: ffff90a2c67a2828 RDI:
>> 0000000000000000
>> [   12.552143] RBP: ffff90a2c67a2828 R08: 0000000000000001 R09:
>> 0000000000000001
>> [   12.552144] R10: 0000000000000001 R11: 0000000000000001 R12:
>> 0000000000000064
>> [   12.552145] R13: 0000000000000000 R14: ffff90a2c5b79400 R15:
>> 0000000000000000
>> [   12.552146] FS:  00007fd5bf725940(0000) GS:ffff90a60f100000(0000)
>> knlGS:0000000000000000
>> [   12.552148] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   12.552150] CR2: 0000000000000490 CR3: 000000010c28c000 CR4:
>> 0000000000750ee0
>> [   12.552152] PKRU: 55555554
>> [   12.552153] Call Trace:
>> [   12.552155]  <TASK>
>> [   12.552157]  ? __die+0x1f/0x70
>> [   12.552162]  ? page_fault_oops+0x13d/0x480
>> [   12.552167]  ? do_user_addr_fault+0x65/0x830
>> [   12.552170]  ? exc_page_fault+0x36/0x200
>> [   12.552174]  ? exc_page_fault+0x7b/0x200
>> [   12.552176]  ? asm_exc_page_fault+0x22/0x30
>> [   12.552180]  ? ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
>> [   12.552186]  ? _raw_spin_unlock_irqrestore+0x35/0x60
>> [   12.552190]  free_irq+0x256/0x3a0
>> [   12.552194]  devres_release_all+0xa5/0xe0
>> [   12.552200]  device_unbind_cleanup+0xe/0x70
>> [   12.552203]  really_probe+0x145/0x3e0
>> [   12.552206]  ? __pfx___driver_attach+0x10/0x10
>> [   12.552209]  __driver_probe_device+0x78/0x160
>> [   12.552212]  driver_probe_device+0x1f/0x90
>> [   12.552215]  __driver_attach+0xd2/0x1c0
>> [   12.552218]  bus_for_each_dev+0x63/0xa0
>> [   12.552221]  bus_add_driver+0x115/0x210
>> [   12.552223]  driver_register+0x55/0x100
>> [   12.552226]  ? __pfx_ipu6_init+0x10/0x10 [intel_ipu6]
>> [   12.552234]  ipu6_init+0x20/0xff0 [intel_ipu6]
>> [   12.552241]  ? __pfx_ipu6_init+0x10/0x10 [intel_ipu6]
>> [   12.552247]  do_one_initcall+0x5a/0x360
>> [   12.552251]  ? rcu_is_watching+0xd/0x40
>> [   12.552254]  ? kmalloc_trace+0xa5/0xb0
>> [   12.552258]  do_init_module+0x60/0x230
>> [   12.552261]  init_module_from_file+0x75/0xa0
>> [   12.552265]  idempotent_init_module+0xf9/0x270
>> [   12.552268]  ? subflow_v6_conn_request+0xc0/0x120
>> [   12.552273]  __x64_sys_finit_module+0x5a/0xb0
>> [   12.552276]  do_syscall_64+0x59/0x90
>> [   12.552279]  ? do_syscall_64+0x68/0x90
>> [   12.552281]  ? lockdep_hardirqs_on+0x7d/0x100
>> [   12.552283]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
>> [   12.552286] RIP: 0033:0x7fd5bff2cb5d
>> [   12.552288] Code: c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa
>> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
>> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 7b 92 0c 00 f7 d8 64 89 01 48
>> [   12.552289] RSP: 002b:00007ffc50c03b38 EFLAGS: 00000246 ORIG_RAX:
>> 0000000000000139
>> [   12.552291] RAX: ffffffffffffffda RBX: 000055e540797f00 RCX:
>> 00007fd5bff2cb5d
>> [   12.552292] RDX: 0000000000000000 RSI: 00007fd5c052607d RDI:
>> 000000000000000c
>> [   12.552293] RBP: 00007ffc50c03bf0 R08: 0000000000000000 R09:
>> 00007ffc50c03b80
>> [   12.552294] R10: 000000000000000c R11: 0000000000000246 R12:
>> 00007fd5c052607d
>> [   12.552296] R13: 0000000000020000 R14: 000055e540797030 R15:
>> 000055e540796290
>> [   12.552301]  </TASK>
>> [   12.552302] Modules linked in: v4l2_async(+) processor_thermal_rfim
>> industrialio_triggered_buffer ecdh_generic(+) processor_thermal_mbox
>> kfifo_buf videodev snd processor_thermal_rapl intel_skl_int3472_tps68470
>> intel_ipu6(+) industrialio thunderbolt(+) soundcore tps68470_regulator
>> rfkill mc intel_rapl_common ipu_bridge intel_hid int3403_thermal(+)
>> idma64(+) soc_button_array intel_vsec igen6_edac int340x_thermal_zone
>> clk_tps68470 joydev intel_skl_int3472_discrete sparse_keymap
>> int3400_thermal acpi_thermal_rel acpi_pad acpi_tad loop zram
>> hid_sensor_hub intel_ishtp_hid i915 i2c_algo_bit crct10dif_pclmul
>> drm_buddy crc32_pclmul ttm crc32c_intel drm_display_helper intel_ish_ipc
>> video nvme ghash_clmulni_intel ucsi_acpi wacom hid_multitouch
>> sha512_ssse3 typec_ucsi nvme_core intel_ishtp cec typec i2c_hid_acpi
>> i2c_hid wmi pinctrl_tigerlake serio_raw ip6_tables ip_tables fuse
>> [   12.552348] CR2: 0000000000000490
>> [   12.552351] ---[ end trace 0000000000000000 ]---
>> [   12.552352] RIP: 0010:ipu6_buttress_isr+0x6d/0x3a0 [intel_ipu6]
>> [   12.552361] Code: 34 03 00 00 c7 44 24 04 00 00 00 00 41 bc 64 00 00
>> 00 45 31 ed 48 8b 85 50 04 00 00 89 98 9c 00 00 00 45 31 ff 4a 8b 7c fc
>> 08 <4c> 8b b7 90 04 00 00 48 85 ff 74 46 48 83 bf 88 04 00 00 00 74 3c
>> [   12.552363] RSP: 0018:ffffb5928145fb08 EFLAGS: 00010046
>> [   12.552365] RAX: ffffb59289000000 RBX: 0000000000000040 RCX:
>> 0000000000000001
>> [   12.552366] RDX: 0000000000000000 RSI: ffff90a2c67a2828 RDI:
>> 0000000000000000
>> [   12.552367] RBP: ffff90a2c67a2828 R08: 0000000000000001 R09:
>> 0000000000000001
>> [   12.552368] R10: 0000000000000001 R11: 0000000000000001 R12:
>> 0000000000000064
>> [   12.552369] R13: 0000000000000000 R14: ffff90a2c5b79400 R15:
>> 0000000000000000
>> [   12.552370] FS:  00007fd5bf725940(0000) GS:ffff90a60f100000(0000)
>> knlGS:0000000000000000
>> [   12.552371] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   12.552372] CR2: 0000000000000490 CR3: 000000010c28c000 CR4:
>> 0000000000750ee0
>> [   12.552373] PKRU: 55555554
>>
>> Please fix this for the next version. Reproducing this is easy, just
>> remove the firmware file from under /lib/firmware/intel .
>>
>> Regards,
>>
>> Hans
>>
> 


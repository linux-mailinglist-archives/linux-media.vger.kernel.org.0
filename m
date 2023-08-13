Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FD977A4E4
	for <lists+linux-media@lfdr.de>; Sun, 13 Aug 2023 06:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjHMEDg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Aug 2023 00:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHMEDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Aug 2023 00:03:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E99CE7E;
        Sat, 12 Aug 2023 21:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691899417; x=1723435417;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OxQjaQsZvnoSHJ78woFPYuFJ18EfBjYWjsyzKnZ6bC4=;
  b=KsDU8tJI4h3ltvhEzW0mAD3w4GVW7mp5RmM6ho2LwF2psIg8FjgqIzax
   5kpsuVg2gCQM5UNdXOEf12IpWXTsB8grhnLJBHqDKMQVVMsTZv/aO7UdB
   l/jZJhtrrOqkQVGz/tQiVAJF13b9VseDjSk7jGpH9sHmMKI2PliYaziJT
   SvPWsDbzkQ/23t1woviQ6k/Hv30DE+cRS/Hh0PbMNDbHIklL59cZ453oC
   dgwaRjyqT0Ua3ZVtk4jypeNkKFzpXNDUlnpuIFE2ZdG/qY8GuQWYQyV0Q
   lhq5dLccHmMCL6UjvJ42DDRjsCQ6qdTzRCKSe1t4VuuggcMk/vlG0fWor
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="374631121"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="374631121"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 21:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="762579253"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="762579253"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 12 Aug 2023 21:03:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 12 Aug 2023 21:03:36 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 12 Aug 2023 21:03:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 12 Aug 2023 21:03:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 12 Aug 2023 21:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWXac3/L05xZlk2VqjInXEu18P3v7++WwJYPzorY8Byhja3GTWR0EoScUoCQFuIaP6ZWQ0UXuoxg4kLshy8srgu3Q3tW18Pd6NcnFNBOe+WDiu/AyCbFlLewSNBYo7C4JbXMXNgWSDWLIr6PWqs61tiZ44A9bUByojFmN4nsecLBj+v5GvgvX+JCtVvBU/wLxCeP+km/aihR70icPlljAROXNSM0va67ISpyhqW/3bIAhd/bzXTvinsZeZD7I/t27rrqqNnVF/emFqCj26SXQ/MCOXJ/WLPV4xClEH4J8MKvZUUFxz2CGonxKkZYDjLGhsbB1pxBNttPyEcmy2FJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U7Aa2N66gom/vrDmHZvY1sO93Be6CxTgfc6X1vAu7E=;
 b=M/mWmQnmAz6oMBbEv3bwudo2storQ1EtrBH+6PARfVf+3JyRwyIbjRDjJuC8PrvCNOhAjoBnHA47QIVyTW68PWphbt0/9T25Jkty19EYsZUu2XkEM+LXuQa7Cf5Am/PiXjE2k8s7xbNXoyX6wlifXsVDv51LrzcRRSnhVt7Hlwuug5Za8yGtIjvexVfR/prBR740kVTZfPVUlz+RRvcOZirBmL59fsxeiqtlZm5gu09Fm/XaJqPXeW3w0I0ZpqDv2NGfQdb00miPajjdLcFe9JIrooJSbuxIxF3kAlC4JPOu5QOFlmqqUCISKDZXhpw7gJu/I4JQKH6WcFWA7/ouWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4839.namprd11.prod.outlook.com (2603:10b6:510:42::18)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Sun, 13 Aug
 2023 04:03:33 +0000
Received: from PH0PR11MB4839.namprd11.prod.outlook.com
 ([fe80::38b4:292a:6bad:7775]) by PH0PR11MB4839.namprd11.prod.outlook.com
 ([fe80::38b4:292a:6bad:7775%4]) with mapi id 15.20.6678.022; Sun, 13 Aug 2023
 04:03:32 +0000
Date:   Sun, 13 Aug 2023 12:06:07 +0800
From:   Pengfei Xu <pengfei.xu@intel.com>
To:     <paul.kocialkowski@bootlin.com>
CC:     <linux-media-owner@vger.kernel.org>, <heng.su@intel.com>,
        <isaku.yamahata@intel.com>, <lkp@intel.com>,
        <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [Syzkaller & bisect] There is perf_event_open triggered soft
 lockup BUG in v6.5-rc5 kernel
Message-ID: <ZNhWr6JKpg3UWYiD@xpf.sh.intel.com>
References: <ZNhVUnPCs/SLlm12@xpf.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZNhVUnPCs/SLlm12@xpf.sh.intel.com>
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To PH0PR11MB4839.namprd11.prod.outlook.com
 (2603:10b6:510:42::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4839:EE_|PH7PR11MB6401:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca2fe4a-380e-48d4-ff34-08db9bb242a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyTNxWm2/uNFhk7Lmuq5KUnaD2qAYmo77VNsv/i2UNKO0G6RoJMStuLiLSlmNx5LjgPin1KFJZIiPFjZaA8+HHyk2Ao9h7qUmc+osBM+grD6MTcH3VCmPhHPg+M5C6wkXMgTlXL4P+CcIrBTHKHEFFqAA8uhx/ollj7eEC+IG77jnECYzsTPDPLmDOOnf+mV+Pzh+s4A9RJq50G9tFc0eaWjaHTujDYUA94C6Wpb618nyDv8FXaUDPc6qMeVbve9pyGZPs860ujdUtJGiI+n0z7RfBTgzW2B9XS2KNU0KBZPR4GHh21mc+qAax8jrzaqGuU7t3CM7SPR+0WswV29v+EuqlICdcZlTuMK6gauLmIm29sW8v+gPTT5IUClr4WNddV8cl0ol9qfLjEJWRPZmLa9xl/xtsuuf5Ukr21Mp02MrfMCsne0MWw7mK2+G/66OwwnykWaHbGP677HdxtL3nCoxQ5QrRC2Y6dD54EG396KFz8MB4jglRi24Cn5G7B+mXGzkq6glF0DqrJT1fcXhxRoRb43aQfZ2Nw68JlVZQEmE2mtSf8CCugQ/YFr7xJea2ktH54RhlmBMW7qOQabfPxYGmtVhWYD1msx56tHdTc+3vgGwc2pT+0vytqYYDdo0w9vU7Ct3BoOeDUrQ5Fy2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4839.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(186006)(1800799006)(6666004)(2906002)(6486002)(6506007)(53546011)(30864003)(86362001)(26005)(6512007)(6916009)(316002)(966005)(66556008)(66476007)(66946007)(41300700001)(478600001)(38100700002)(82960400001)(5660300002)(44832011)(4326008)(8936002)(8676002)(83380400001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CqzgnlSSwHSXL1OqEVlKB7wntMJb9DAgrYpvPrbi7WHEvjxM5vMXeSzOr62J?=
 =?us-ascii?Q?tYxg4HJSRjzO6GJAM+bj3OpSBHhisjGK8Tc6lmHKoJwHxjQfkGFPYg5E1hdX?=
 =?us-ascii?Q?bCJzpaGoON7Dssg0md9zb7uEZZY9IIr9g/62fZOq/XBGCgvqnCvj71QtIWt/?=
 =?us-ascii?Q?TVNn+SZxO6Uw/B6rOPs3yAptKqD52U6BORzeyabt6gqhviXrzLaqof+XInpN?=
 =?us-ascii?Q?klAkpMocy/ff6RjIrT5N8aD9rr/QRyqMSLaDILzJkT5pvTfsE8Yozd46d7Xn?=
 =?us-ascii?Q?s2cBCXugmf7Phq4ag+tsCpTOsjFgKl0fmSw/lrbHBHUtCxSIWesYcqaDMuyd?=
 =?us-ascii?Q?b82LlVIyKGJ46PqfEfK/Qm0cF70ewcFEwfNl/EeRhlUvdqCqtUxMhGJVMQpR?=
 =?us-ascii?Q?h8sxVGZMHmnEJBg2/Fg0C55YsEr9gXPZXCWjBHd9w1kWvTprYJNk6JvaiceH?=
 =?us-ascii?Q?TFEoABymVhjjI+B0jP/CREvbQVgzUga4vX7qFetrDHWocZDE7CySAIHNT1iO?=
 =?us-ascii?Q?M0674Y8MoO7lhhMXVCmPF2Doyb921/MorGeuRQGny7r1KN/GvnP4xZ6ZP9zP?=
 =?us-ascii?Q?WZHmnS+0Z4RuZzY9MW2Nf30FL0IAB5C323sMSIG8ijaVAy77eEtSjoefU+N5?=
 =?us-ascii?Q?Bn3eGAaDL7W7f5sIhAR5Fh0Fi5IPOSnPsM6udPOKl29bqLofMsxjnRpHwFCi?=
 =?us-ascii?Q?ayAWHW0Zpr93sW/RiJiQdKuwJfOoHzad/M308iDnznSnqAZbLYy7U3qa8uN0?=
 =?us-ascii?Q?zHMNqqRdVQT0RzNgcWXcyedp+1QQmUZq5QXbmxb88IA1coXZIER54BPNSzAq?=
 =?us-ascii?Q?lxal54oiznTgh9J4OeIca7Vl0UFsbEBEYHzK9zf2+UdQ/1cCsXf7QRE8zq1n?=
 =?us-ascii?Q?iJhfAbgv4jU9qEiayuqDnRI4LSxpLu5UE4z++LxlEKQakjlyNR6tQGzRjhZJ?=
 =?us-ascii?Q?xO3WbD/VBztAOW/p2Qe9VdCeZHjiqYhOOjtJvM7UIch78rWyUy/0DD4qJCRN?=
 =?us-ascii?Q?H3jUqCulGEnAUuwCT0gHJeCf2ouBuxQV8vik+iq4wGCfXLeYZHO8mYiX48A5?=
 =?us-ascii?Q?DAKVsyEWxQ3JMCzaPIsnDzDdF+qK7AYOMnu6TUFjlF1JUZOXQ4nsmySkwM2j?=
 =?us-ascii?Q?ldJP82g5HbG9KZM5H8adNbohfF3Yi7ciFM7OWFupkpVm/d0P64yjTeFctsLR?=
 =?us-ascii?Q?at0QxgHSLQGxu9a9UltyIdTtnbSPs5QwGIxyBOxw+31C/dOV1arcuDTszaLf?=
 =?us-ascii?Q?9JQCF2+qJ/Ibl/TCpA7fFCM4qZ2zD6jc1GygeYZKYk2GxodSi7fu35g/pkOv?=
 =?us-ascii?Q?3s4N8nE37ysjYflBmPZWAfJCxb9A+HoA8zUIvaNlh52Vy4ulwy5mL3krT0is?=
 =?us-ascii?Q?dxdA1f/9Ota2NE3Vj0cqd/nGTB0y6Kjz6LQ+y7MlNRVtGJDzzn0qhb4RkHGG?=
 =?us-ascii?Q?d5gdXni9oqkh8Ia42aKow/00eTOne2sxw1b1h0eVNi50Ve4A9wacvCVNPlpe?=
 =?us-ascii?Q?p53im6aKZAHmw6oYch+HI1OAzDRqSGFv1BF8wJNBfLRK9OuHPsxKENlnhGyv?=
 =?us-ascii?Q?jp2OLIATuGqan2T5ojy1xl+wS2680qhWQyoM3RpA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca2fe4a-380e-48d4-ff34-08db9bb242a1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 04:03:32.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQUdyRCTTyYP5KV9YMBbkbs9UnrNebLJUz3OEpPWMBfyrgENfgUowvFmL0zkivUqIF2Lxo1M+bYP6E794G3Y5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

++ linux-media emial list.

On 2023-08-13 at 12:00:18 +0800, Pengfei Xu wrote:
> Hi Paul,
> 
> Greeting!
> 
> There is perf_event_open triggered soft lockup BUG in v6.5-rc5 kernel.
> 
> All detailed info link: https://github.com/xupengfe/syzkaller_logs/tree/main/230812_084142_BUG_soft_lockup
> Syzkaller reproduced code: https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/repro.c
> Syzkaller reproduced step: https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/repro.prog
> Syzkaller report analysis: https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/repro.report
> Kconfig(Need "make olddefconfig" to generate target kconfig): https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/kconfig_origin
> Bisect info: https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/bisect_info.log
> Issue dmesg: https://github.com/xupengfe/syzkaller_logs/blob/main/230812_084142_BUG_soft_lockup/52a93d39b17dc7eb98b6aa3edb93943248e03b2f_dmesg.log
> v6.5-rc5 bzImage: https://github.com/xupengfe/syzkaller_logs/raw/main/230812_084142_BUG_soft_lockup/bzImage_52a93d39b17dc7eb98b6aa3edb93943248e03b2f.tar.gz
> 
> This issue could be reproduced in 253s.
> 
> Bisected and found first bad commit is:
> f042b08b833d media: sun6i-mipi-csi2: Require both pads to be connected for streaming
> 
> "
> [   28.083677] cgroup: Unknown subsys name 'rlimit'
> [   73.568711] watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [repro:1253]
> [   73.573792] Kernel panic - not syncing: softlockup: hung tasks
> [   73.574833] CPU: 0 PID: 1253 Comm: repro Tainted: G             L     6.5.0-rc5-52a93d39b17d #1
> [   73.576363] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [   73.578364] Call Trace:
> [   73.578824]  <IRQ>
> [   73.579210]  dump_stack_lvl+0xa9/0x110
> [   73.579938]  dump_stack+0x19/0x20
> [   73.580562]  panic+0x660/0x6d0
> [   73.581165]  ? __pfx_panic+0x10/0x10
> [   73.581866]  ? watchdog_timer_fn+0x4ab/0x5c0
> [   73.582674]  watchdog_timer_fn+0x4c9/0x5c0
> [   73.583421]  ? __pfx_watchdog_timer_fn+0x10/0x10
> [   73.584258]  __hrtimer_run_queues+0x61a/0xba0
> [   73.585068]  ? __pfx___hrtimer_run_queues+0x10/0x10
> [   73.585970]  ? ktime_get_update_offsets_now+0x25b/0x340
> [   73.586932]  ? write_comp_data+0x2f/0x90
> [   73.587678]  hrtimer_interrupt+0x326/0x7b0
> [   73.588453]  __sysvec_apic_timer_interrupt+0x14f/0x3f0
> [   73.589411]  sysvec_apic_timer_interrupt+0x48/0xd0
> [   73.590308]  asm_sysvec_apic_timer_interrupt+0x1f/0x30
> [   73.591252] RIP: 0010:is_bpf_text_address+0x139/0x1c0
> [   73.592184] Code: ff e8 7b 3b e7 ff 48 c7 c2 80 05 93 85 be ef 02 00 00 48 c7 c7 e0 05 93 85 c6 05 ca 5f fa 05 01 e8 dc 6e c5 ff e9 22 ff ff ff <e8> 52 3b e7 ff e8 5d b2 ce ff 31 ff 89 c3 89 c6 e8 a2 3c e7 ff 84
> [   73.595436] RSP: 0018:ffff88806ca096e0 EFLAGS: 00000202
> [   73.596374] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffffff81772d6f
> [   73.597646] RDX: 0000000000000000 RSI: ffff88800ff7a500 RDI: 0000000000000003
> [   73.598921] RBP: ffff88806ca096f0 R08: fffffbfff133afd9 R09: fffffbfff133afd9
> [   73.600185] R10: fffffbfff133afd8 R11: ffffffff899d7ec7 R12: 0000000000000000
> [   73.601454] R13: 0000000000000000 R14: ffff88800ff7a500 R15: 0000000000000000
> [   73.602740]  ? is_bpf_text_address+0x7f/0x1c0
> [   73.603557]  kernel_text_address+0xd5/0xe0
> [   73.604313]  __kernel_text_address+0x16/0x50
> [   73.605109]  unwind_get_return_address+0x6e/0xc0
> [   73.605979]  ? __pfx_stack_trace_consume_entry+0x10/0x10
> [   73.606951]  arch_stack_walk+0xa5/0x100
> [   73.607671]  stack_trace_save+0x8b/0xc0
> [   73.608385]  ? __pfx_stack_trace_save+0x10/0x10
> [   73.609237]  kasan_save_stack+0x2a/0x50
> [   73.609964]  ? kasan_save_stack+0x2a/0x50
> [   73.610707]  ? kasan_set_track+0x29/0x40
> [   73.611458]  ? kasan_save_alloc_info+0x22/0x30
> [   73.612274]  ? __kasan_slab_alloc+0x64/0x80
> [   73.613046]  ? slab_post_alloc_hook+0x84/0x3b0
> [   73.613872]  ? kmem_cache_alloc_node+0x18a/0x2e0
> [   73.614725]  ? __alloc_skb+0x2b6/0x360
> [   73.615435]  ? __neigh_notify+0x91/0x170
> [   73.616171]  ? neigh_timer_handler+0x2b8/0xfa0
> [   73.616981]  ? call_timer_fn+0x1a5/0x570
> [   73.617712]  ? run_timer_softirq+0x714/0x14d0
> [   73.618511]  ? __do_softirq+0x1b7/0x77c
> [   73.619222]  ? irq_exit_rcu+0xc1/0x110
> [   73.619928]  ? sysvec_apic_timer_interrupt+0xa1/0xd0
> [   73.620828]  ? asm_sysvec_apic_timer_interrupt+0x1f/0x30
> [   73.621797]  ? generic_exec_single+0x278/0x540
> [   73.622619]  ? smp_call_function_single+0x193/0x460
> [   73.623506]  ? task_function_call+0x10e/0x1a0
> [   73.624318]  ? perf_install_in_context+0x2f9/0x5b0
> [   73.625191]  ? __do_sys_perf_event_open+0x1a9a/0x2a50
> [   73.626130]  ? __x64_sys_perf_event_open+0xc7/0x160
> [   73.627024]  ? do_syscall_64+0x3b/0x90
> [   73.627721]  ? entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   73.628676]  ? write_comp_data+0x2f/0x90
> [   73.629422]  ? debug_smp_processor_id+0x20/0x30
> [   73.630266]  ? __sanitizer_cov_trace_pc+0x25/0x60
> [   73.631131]  ? write_comp_data+0x2f/0x90
> [   73.631871]  ? mark_held_locks+0xb7/0x140
> [   73.632608]  ? irqentry_exit+0x3e/0xa0
> [   73.633311]  ? sysvec_irq_work+0x58/0xd0
> [   73.634065]  ? __this_cpu_preempt_check+0x20/0x30
> [   73.634928]  ? lockdep_hardirqs_on+0x8a/0x110
> [   73.635731]  ? irqentry_exit+0x3e/0xa0
> [   73.636433]  ? trace_hardirqs_on+0x26/0x120
> [   73.637208]  kasan_set_track+0x29/0x40
> [   73.637939]  kasan_save_alloc_info+0x22/0x30
> [   73.638726]  __kasan_slab_alloc+0x64/0x80
> [   73.639487]  slab_post_alloc_hook+0x84/0x3b0
> [   73.640283]  kmem_cache_alloc_node+0x18a/0x2e0
> [   73.641101]  ? __alloc_skb+0x2b6/0x360
> [   73.641817]  __alloc_skb+0x2b6/0x360
> [   73.642494]  ? __pfx___alloc_skb+0x10/0x10
> [   73.643255]  ? asm_sysvec_irq_work+0x1f/0x30
> [   73.644063]  __neigh_notify+0x91/0x170
> [   73.644768]  neigh_timer_handler+0x2b8/0xfa0
> [   73.645572]  ? __pfx_neigh_timer_handler+0x10/0x10
> [   73.646448]  call_timer_fn+0x1a5/0x570
> [   73.647137]  ? asm_sysvec_irq_work+0x1f/0x30
> [   73.647929]  ? __pfx_call_timer_fn+0x10/0x10
> [   73.648725]  ? __pfx_neigh_timer_handler+0x10/0x10
> [   73.649611]  run_timer_softirq+0x714/0x14d0
> [   73.650401]  ? __pfx_run_timer_softirq+0x10/0x10
> [   73.651240]  ? asm_sysvec_irq_work+0x1f/0x30
> [   73.652040]  ? __pfx_run_timer_softirq+0x10/0x10
> [   73.652890]  __do_softirq+0x1b7/0x77c
> [   73.653593]  irq_exit_rcu+0xc1/0x110
> [   73.654261]  sysvec_apic_timer_interrupt+0xa1/0xd0
> [   73.655132]  </IRQ>
> [   73.655532]  <TASK>
> [   73.655943]  asm_sysvec_apic_timer_interrupt+0x1f/0x30
> [   73.656889] RIP: 0010:generic_exec_single+0x278/0x540
> [   73.657832] Code: e8 0d 85 0b 00 4c 89 e6 31 ff 31 db e8 11 87 0b 00 4d 85 e4 0f 84 3e fe ff ff e8 f3 84 0b 00 e8 8e f0 17 00 fb 0f 1f 44 00 00 <e9> 29 fe ff ff e8 de 84 0b 00 65 8b 1d a3 6a b1 7e 89 db be 08 00
> [   73.661070] RSP: 0018:ffff88800fa97ac8 EFLAGS: 00000202
> [   73.662013] RAX: 0000000000000485 RBX: 0000000000000000 RCX: 1ffffffff1343c28
> [   73.663275] RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
> [   73.664538] RBP: ffff88800fa97af0 R08: 0000000000000001 R09: fffffbfff133afee
> [   73.665808] R10: 0000000000000001 R11: ffffffff899d7f6f R12: 0000000000000200
> [   73.667071] R13: ffffffff818e9ad0 R14: ffff88800fa97c20 R15: ffff88800fa97b48
> [   73.668333]  ? __pfx_remote_function+0x10/0x10
> [   73.669163]  ? generic_exec_single+0x272/0x540
> [   73.670005]  smp_call_function_single+0x193/0x460
> [   73.670866]  ? write_comp_data+0x2f/0x90
> [   73.671590]  ? __pfx_remote_function+0x10/0x10
> [   73.672406]  ? __pfx_smp_call_function_single+0x10/0x10
> [   73.673371]  ? __pfx_remote_function+0x10/0x10
> [   73.674209]  ? __sanitizer_cov_trace_pc+0x25/0x60
> [   73.675081]  task_function_call+0x10e/0x1a0
> [   73.675855]  ? __pfx_task_function_call+0x10/0x10
> [   73.676720]  ? __pfx___perf_install_in_context+0x10/0x10
> [   73.677693]  ? exclusive_event_installable+0x25b/0x320
> [   73.678626]  ? write_comp_data+0x2f/0x90
> [   73.679358]  perf_install_in_context+0x2f9/0x5b0
> [   73.680206]  ? __pfx_perf_install_in_context+0x10/0x10
> [   73.681145]  ? write_comp_data+0x2f/0x90
> [   73.681897]  ? __sanitizer_cov_trace_pc+0x25/0x60
> [   73.682767]  __do_sys_perf_event_open+0x1a9a/0x2a50
> [   73.683672]  ? __pfx___do_sys_perf_event_open+0x10/0x10
> [   73.684649]  __x64_sys_perf_event_open+0xc7/0x160
> [   73.685526]  ? syscall_enter_from_user_mode+0x51/0x60
> [   73.686449]  do_syscall_64+0x3b/0x90
> [   73.687114]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [   73.688035] RIP: 0033:0x7f904803ee5d
> [   73.688694] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 93 af 1b 00 f7 d8 64 89 01 48
> [   73.691934] RSP: 002b:00007ffcb1c151a8 EFLAGS: 00000206 ORIG_RAX: 000000000000012a
> [   73.693269] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f904803ee5d
> [   73.694545] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020000280
> [   73.695804] RBP: 00007ffcb1c151b0 R08: 0000000000000000 R09: 00007ffcb1c15200
> [   73.697064] R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffcb1c15348
> [   73.698337] R13: 0000000000407f0f R14: 000000000040adf8 R15: 00007f9048381000
> [   73.699619]  </TASK>
> [   73.700900] Kernel Offset: disabled
> [   73.701602] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
> "
> 
> ---
> 
> If you don't need the following environment to reproduce the problem or if you
> already have one, please ignore the following information.
> 
> How to reproduce:
> git clone https://gitlab.com/xupengfe/repro_vm_env.git
> cd repro_vm_env
> tar -xvf repro_vm_env.tar.gz
> cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
>   // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
>   // You could change the bzImage_xxx as you want
>   // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
> You could use below command to log in, there is no password for root.
> ssh -p 10023 root@localhost
> 
> After login vm(virtual machine) successfully, you could transfer reproduced
> binary to the vm by below way, and reproduce the problem in vm:
> gcc -pthread -o repro repro.c
> scp -P 10023 repro root@localhost:/root/
> 
> Get the bzImage for target kernel:
> Please use target kconfig and copy it to kernel_src/.config
> make olddefconfig
> make -jx bzImage           //x should equal or less than cpu num your pc has
> 
> Fill the bzImage file name into above start3.sh to load the target kernel in vm.
> 
> 
> Tips:
> If you already have qemu-system-x86_64, please ignore below info.
> If you want to install qemu v7.1.0 version:
> git clone https://github.com/qemu/qemu.git
> cd qemu
> git checkout -f v7.1.0
> mkdir build
> cd build
> yum install -y ninja-build.x86_64
> yum -y install libslirp-devel.x86_64
> ../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
> make
> make install
> 
> Best Regards,
> Thanks!

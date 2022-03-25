Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C344E7715
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 16:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359800AbiCYP1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 11:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379064AbiCYP0o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 11:26:44 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E2ACD9
        for <linux-media@vger.kernel.org>; Fri, 25 Mar 2022 08:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648221910; x=1679757910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UbX6Ldb56MA+jSHzEy+BZt20nCRu00s+TgWh8zgDK8U=;
  b=KZV72yn59IbcKKf1WtVg2nqWgKutfOBcSG8ZhfgSOyU3+klvLojsSvpz
   mtz1JgxoYei3ObG9lOwPVffs1EtSousIsu/Ou91hKxPXfwqcHNJW/xGve
   yNNcYI2PS22moTpVn9X39GMa5J8u3ATT4JwfxK3TYf3VLpw1U5dFhpd7A
   yBG1dYtRMxykzuuE3hrFJOpFe3cpLeuaIlmNZQmdAKPfat+XShyHPgtxV
   wmMuNE0jhFQzFhuCA16zHct2cFuYd9dyZkPa0Lk6RPovN1n7zLrg7sAUP
   gmifKR6aCBYhI4lJ3rhbs6FobuKQ44AdrIexTav3fC3q0z3+lEvxXeuaK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="246130163"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="246130163"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 08:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="545116524"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
  by orsmga007.jf.intel.com with SMTP; 25 Mar 2022 08:25:05 -0700
Received: by stinkbox (sSMTP sendmail emulation); Fri, 25 Mar 2022 17:25:05 +0200
Date:   Fri, 25 Mar 2022 17:25:05 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Message-ID: <Yj3e0QjbnPoG7n4I@intel.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311110244.1245-1-christian.koenig@amd.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian K�nig wrote:
> Add a general purpose helper to deep dive into dma_fence_chain/dma_fence_array
> structures and iterate over all the fences in them.
> 
> This is useful when we need to flatten out all fences in those structures.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>

One of the dma-buf patches took down Intel CI. Looks like every
machine oopses in some sync_file thing now:
<1>[  260.470008] BUG: kernel NULL pointer dereference, address: 0000000000000010
<1>[  260.470020] #PF: supervisor read access in kernel mode
<1>[  260.470025] #PF: error_code(0x0000) - not-present page
<6>[  260.470030] PGD 0 P4D 0 
<4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
<4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted 5.17.0-CI-CI_DRM_11405+ #1
<4>[  260.470049] Hardware name: Intel Corporation Jasper Lake Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
<4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
<4>[  260.470068] Code: c3 31 c0 c3 0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 48 85 ff 74 18 48 89 f8 48 81 7f 08 60 7f 0a 82 75 0d 48 8b 87 88 00 00 00 <48> 8b 00 c3 31 c0 c3 31 c0 48 85 ff 74 20 48 81 7f 08 60 7f 0a 82
<4>[  260.470080] RSP: 0018:ffffc900009a7e40 EFLAGS: 00010246
<4>[  260.470086] RAX: 0000000000000010 RBX: 000000000000000b RCX: 0000000000000000
<4>[  260.470100] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff888109a796b8
<4>[  260.470106] RBP: ffff888109a796b8 R08: 0000000000000002 R09: 0000000000000000
<4>[  260.470112] R10: 0000000000000001 R11: 0000000000000000 R12: ffff888109a796b8
<4>[  260.470118] R13: 00007ffc5d21f750 R14: ffff8881065be340 R15: 0000000000000000
<4>[  260.470124] FS:  00007f08bd6d04c0(0000) GS:ffff88885fc00000(0000) knlGS:0000000000000000
<4>[  260.470131] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  260.470137] CR2: 0000000000000010 CR3: 000000010e690000 CR4: 0000000000350ef0
<4>[  260.470143] Call Trace:
<4>[  260.470146]  <TASK>
<4>[  260.470149]  sync_file_ioctl+0x2eb/0xc90
<4>[  260.470157]  __x64_sys_ioctl+0x6a/0xa0
<4>[  260.470164]  do_syscall_64+0x37/0xb0
<4>[  260.470170]  entry_SYSCALL_64_after_hwframe+0x44/0xae
<4>[  260.470176] RIP: 0033:0x7f08c047750b
<4>[  260.470182] Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
<4>[  260.470195] RSP: 002b:00007ffc5d21f748 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
<4>[  260.470202] RAX: ffffffffffffffda RBX: 000000000000000a RCX: 00007f08c047750b
<4>[  260.470208] RDX: 00007ffc5d21f750 RSI: 00000000c0303e03 RDI: 000000000000000a
<4>[  260.470214] RBP: 0000000000000005 R08: 0000000000000000 R09: 00007ffc5d21ebb0
<4>[  260.470219] R10: 00007f08c0a6170e R11: 0000000000000246 R12: 0000000000000000
<4>[  260.470225] R13: 00007ffc5d21f840 R14: 000055e80d13d1b0 R15: 0000000000000009
<4>[  260.470233]  </TASK>
<4>[  260.470239] Modules linked in: vgem drm_shmem_helper fuse snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio i915 snd_hda_intel snd_intel_dspcfg snd_hda_codec x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul snd_hwdep ghash_clmulni_intel snd_hda_core ttm drm_buddy drm_dp_helper snd_pcm drm_kms_helper i2c_i801 r8169 i2c_smbus syscopyarea realtek sysfillrect sysimgblt fb_sys_fops prime_numbers intel_lpss_pci
<4>[  260.470289] CR2: 0000000000000010
<4>[  260.470312] ---[ end trace 0000000000000000 ]---

Can we please start running dma-buf stuff through CI so this
kind of stuff doesn't keep happening so often?

-- 
Ville Syrj�l�
Intel

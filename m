Return-Path: <linux-media+bounces-21238-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC59C3724
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 04:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C89C9282637
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 03:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9F6146A79;
	Mon, 11 Nov 2024 03:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GG4ceR3+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7B288B1;
	Mon, 11 Nov 2024 03:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731296918; cv=none; b=Iq4LkfOmBx/o5vnILNb3Kn/VPhgyMiW0jZjwufgSnKrOrj9AjHHJBwBA0jHm05V3Ae04uLj42npxgUffSR2dZQa2EmHiU6Gdedymaa9iWuLOOYABuIF8TSQlvUuvNPcO3DmK0drCIddZoy3+jpJq9sc0bVBVft0DwpqUUIvjmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731296918; c=relaxed/simple;
	bh=LI/n49Zg6NhGaWP9adjLu7md+zY5ZytUZYwRPvTAsUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDy9/2PfraLnCz9dsWTshNpMBftZhbtIUgtkKBX6H6yt50EepLe+isTmO32SNsD4qIPFfZOHnRRDGNm8W7pWst0zPj+MkPIERkQITAo+ln7aPaUCFr9VNJPuPGwWGamw9s7wzycLZg3n131bJSHhAKImRdX+y7Yz3rzliXq+Y7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GG4ceR3+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731296917; x=1762832917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LI/n49Zg6NhGaWP9adjLu7md+zY5ZytUZYwRPvTAsUE=;
  b=GG4ceR3+oDQfwPIAZj7Qj8Kt0t+aOVnlGuzy3YNNTkkuFlJiipiLE5mE
   qxxBPykDHMSKZ0KeOrCpBLxTiJ3EWIdBeAD8Vwud159UlX3LyaDphnh3k
   DfMed/bELV0hRWfuWzGA/ckRPSMDSvRv3AziYOI/KJiU13+bNUM1i46jO
   zp5kYQHhs7SneCPmsC/0A922vvn3jfIF4neIa7//os0Bw7v7uYKtFwyBA
   QUwVQTr8yTO/BupRJV2pzPVPTdUv886gMsuhzOaIXx3k87g4ILrqBWvtb
   TCytOZvS2LX6jwXWvbFBp1VdW1v7XsMBtXV/Zo/CCYKwOj0pwS5ngFedM
   w==;
X-CSE-ConnectionGUID: WhWoJJOCRWmaAyjlbGmFvA==
X-CSE-MsgGUID: RJms2OGQSZWgB8CHsQmr8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="18716844"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="18716844"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 19:48:36 -0800
X-CSE-ConnectionGUID: VS4rlUL2QjmRHB4gPmTm6w==
X-CSE-MsgGUID: eyOLuNC6TYe6Jk3/aKf9bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86868329"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Nov 2024 19:48:34 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tALPj-0000fa-1c;
	Mon, 11 Nov 2024 03:48:31 +0000
Date: Mon, 11 Nov 2024 11:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Przybylski <karprzy7@gmail.com>, hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Karol Przybylski <karprzy7@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] media: cec: extron-da-hd-4k-plus: add return check for
 wait_for_completion*()
Message-ID: <202411111022.sX8ZCJZ8-lkp@intel.com>
References: <20241110125814.1899076-1-karprzy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110125814.1899076-1-karprzy7@gmail.com>

Hi Karol,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master v6.12-rc6 next-20241108]
[cannot apply to media-tree/master sailus-media-tree/streams sailus-media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karol-Przybylski/media-cec-extron-da-hd-4k-plus-add-return-check-for-wait_for_completion/20241110-210018
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20241110125814.1899076-1-karprzy7%40gmail.com
patch subject: [PATCH] media: cec: extron-da-hd-4k-plus: add return check for wait_for_completion*()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241111/202411111022.sX8ZCJZ8-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241111/202411111022.sX8ZCJZ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411111022.sX8ZCJZ8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:23:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:29:
   In file included from drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h:13:
   In file included from include/media/cec.h:19:
   In file included from include/media/rc-core.h:13:
   In file included from include/linux/kfifo.h:40:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:563:3: error: use of undeclared identifier 'ret'
     563 |                 ret = wait_for_completion_killable_timeout(&extron->edid_completion,
         |                 ^
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:565:7: error: use of undeclared identifier 'ret'
     565 |                 if (ret < 0)
         |                     ^
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/ret +563 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

   540	
   541	static void extron_read_edid(struct extron_port *port)
   542	{
   543		struct extron *extron = port->extron;
   544		char cmd[10], reply[10];
   545		unsigned int idx;
   546	
   547		idx = port->port.port + (port->is_input ? 0 : extron->num_in_ports);
   548		snprintf(cmd, sizeof(cmd), "WR%uEDID", idx);
   549		snprintf(reply, sizeof(reply), "EdidR%u", idx);
   550		if (mutex_lock_interruptible(&extron->edid_lock))
   551			return;
   552		if (port->read_edid)
   553			goto unlock;
   554		extron->edid_bytes_read = 0;
   555		extron->edid_port = port;
   556		port->edid_blocks = 0;
   557		if (!port->has_edid)
   558			goto no_edid;
   559	
   560		extron->edid_reading = true;
   561	
   562		if (!extron_send_and_wait(extron, port, cmd, reply)) {
 > 563			ret = wait_for_completion_killable_timeout(&extron->edid_completion,
   564							     msecs_to_jiffies(1000));
   565			if (ret < 0)
   566				goto unlock;
   567		}
   568		if (port->edid_blocks) {
   569			extron_parse_edid(port);
   570			port->read_edid = true;
   571			if (!port->is_input)
   572				v4l2_ctrl_s_ctrl(port->ctrl_tx_edid_present, 1);
   573		}
   574	no_edid:
   575		extron->edid_reading = false;
   576	unlock:
   577		mutex_unlock(&extron->edid_lock);
   578		cancel_delayed_work_sync(&extron->work_update_edid);
   579		if (manufacturer_name[0])
   580			schedule_delayed_work(&extron->work_update_edid,
   581					      msecs_to_jiffies(1000));
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


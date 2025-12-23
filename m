Return-Path: <linux-media+bounces-49379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C0CD79F7
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 02:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25C5E3002770
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 01:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD9421FF4A;
	Tue, 23 Dec 2025 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bY3ctldO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13131B86C7;
	Tue, 23 Dec 2025 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452731; cv=none; b=qrBnQzUSRCy4Ys4Mrvu/OB0eagZihvr56BBwAhIWEM00XOpmGQ0oRCiEB7x3kDSyJW15v7sk5odba0NXKWbJhRVXAkhaT1vIztc5hWvtzG5dUsSY8W3QMgpO2Eb5aNibeCyNk+K1xHMuo+pkXTJCc5mvaaZLmmfAzN33P5YdOlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452731; c=relaxed/simple;
	bh=MgkW2R9lnTeSxYxmms0jpSDguy/EHETG6PKO7HWLO38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBnGWywVXWHGn4HbkAxisWZmKzAw8Cd5xUcxPmeFLfpO6NYlIR9HtE060YoEMKxgQxh9VnpuyTehDF8hgWeeG34LyMZn9zJeKWhT6Z6t6akXJcQON/0zb/QCG3MuCNkIb/o2YAu5Eq79zWa9JDTGy2NyHFqmxHZ3RDXULoLarYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bY3ctldO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766452729; x=1797988729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MgkW2R9lnTeSxYxmms0jpSDguy/EHETG6PKO7HWLO38=;
  b=bY3ctldOP1PzQN6rD1PnCwLIzxFIRXiYJcypXW6Q0Sql3K1TjCJa9PWe
   l/zyCjhpZZKZyu1gAvkwPP3lzYL2PQ0KvtGJDs4IoT75dvL7fgnAte03n
   hsqzOdQScAE+AaEN0GgO0vgU8aHHBvSpz1oG+Viw67rUvxYr2J9dS1fv9
   4u7PsEMKWJxG7tk1f47fcO6Zs8via2vTifIgQ9Wv4EHKWTknTeVNisWVk
   tHKzGMknM/Ql+U/cjNUNJU51CXVQ3OQ/kuuLG2iBfRqTbzZt5mNkdyVbU
   YVAxwI3uZuVrPgAvgWBQ7W+dg9eR06XqRW3Xv9sll1komBNUq4jToGlFF
   A==;
X-CSE-ConnectionGUID: jw9p2ELgTEyc0EFu/RXVhw==
X-CSE-MsgGUID: beJRLpeKRqGhvTy0MGsrAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68347970"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68347970"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:18:48 -0800
X-CSE-ConnectionGUID: znlUpYS+QS2gEaKf08Mtaw==
X-CSE-MsgGUID: PN8XDdVPSven7B3LV4uYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198902419"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 17:18:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXr2x-000000001Ht-1Ep2;
	Tue, 23 Dec 2025 01:18:43 +0000
Date: Tue, 23 Dec 2025 09:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: pip-izony <eeodqql09@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ttusb-dec: fix heap-buffer-overflow in
 ttusb_dec_process_urb_frame()
Message-ID: <202512230947.zdHvFcAE-lkp@intel.com>
References: <20251222054644.938208-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222054644.938208-2-eeodqql09@gmail.com>

Hi pip-izony,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/pip-izony/media-ttusb-dec-fix-heap-buffer-overflow-in-ttusb_dec_process_urb_frame/20251222-134809
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251222054644.938208-2-eeodqql09%40gmail.com
patch subject: [PATCH v2] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512230947.zdHvFcAE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230947.zdHvFcAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230947.zdHvFcAE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:7: error: expected ')'
     713 |                                                 __func__);
         |                                                 ^
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:6: note: to match this '('
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^
   include/linux/dev_printk.h:156:2: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^
   include/linux/printk.h:479:2: note: expanded from macro 'printk_index_subsys_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^
   include/linux/printk.h:436:27: note: expanded from macro '__printk_index_emit'
     436 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:7: error: expected ')'
     713 |                                                 __func__);
         |                                                 ^
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:6: note: to match this '('
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^
   include/linux/dev_printk.h:156:2: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^
   include/linux/printk.h:479:2: note: expanded from macro 'printk_index_subsys_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^
   include/linux/printk.h:445:32: note: expanded from macro '__printk_index_emit'
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:7: error: expected ')'
     713 |                                                 __func__);
         |                                                 ^
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:6: note: to match this '('
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^
   include/linux/dev_printk.h:156:2: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_index_wrap'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_index_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^
   include/linux/printk.h:479:2: note: expanded from macro 'printk_index_subsys_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^
   include/linux/printk.h:445:41: note: expanded from macro '__printk_index_emit'
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:7: error: expected ')'
     713 |                                                 __func__);
         |                                                 ^
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:6: note: to match this '('
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^
   include/linux/dev_printk.h:156:2: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/dev_printk.h:110:10: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                        ^
   4 errors generated.


vim +713 drivers/media/usb/ttusb-dec/ttusb_dec.c

   640	
   641	static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
   642						int length)
   643	{
   644		swap_bytes(b, length);
   645	
   646		while (length) {
   647			switch (dec->packet_state) {
   648	
   649			case 0:
   650			case 1:
   651			case 2:
   652				if (*b++ == 0xaa)
   653					dec->packet_state++;
   654				else
   655					dec->packet_state = 0;
   656	
   657				length--;
   658				break;
   659	
   660			case 3:
   661				if (*b == 0x00) {
   662					dec->packet_state++;
   663					dec->packet_length = 0;
   664				} else if (*b != 0xaa) {
   665					dec->packet_state = 0;
   666				}
   667	
   668				b++;
   669				length--;
   670				break;
   671	
   672			case 4:
   673				dec->packet[dec->packet_length++] = *b++;
   674	
   675				if (dec->packet_length == 2) {
   676					if (dec->packet[0] == 'A' &&
   677					    dec->packet[1] == 'V') {
   678						dec->packet_type =
   679							TTUSB_DEC_PACKET_PVA;
   680						dec->packet_state++;
   681					} else if (dec->packet[0] == 'S') {
   682						dec->packet_type =
   683							TTUSB_DEC_PACKET_SECTION;
   684						dec->packet_state++;
   685					} else if (dec->packet[0] == 0x00) {
   686						dec->packet_type =
   687							TTUSB_DEC_PACKET_EMPTY;
   688						dec->packet_payload_length = 2;
   689						dec->packet_state = 7;
   690					} else {
   691						printk("%s: unknown packet type: %02x%02x\n",
   692						       __func__,
   693						       dec->packet[0], dec->packet[1]);
   694						dec->packet_state = 0;
   695					}
   696				}
   697	
   698				length--;
   699				break;
   700	
   701			case 5:
   702				dec->packet[dec->packet_length++] = *b++;
   703	
   704				if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
   705				    dec->packet_length == 8) {
   706					int len = 8 +
   707						(dec->packet[6] << 8) +
   708						dec->packet[7];
   709	
   710					if (len > MAX_PVA_LENGTH + 4) {
   711						dev_warn(&dec->udev->dev,
   712							"%s: packet too long - discarding\n"
 > 713							__func__);
   714						dec->packet_state = 0;
   715					} else {
   716						dec->packet_state++;
   717						dec->packet_payload_length = len;
   718					}
   719				} else if (dec->packet_type ==
   720						TTUSB_DEC_PACKET_SECTION &&
   721					   dec->packet_length == 5) {
   722					dec->packet_state++;
   723					dec->packet_payload_length = 5 +
   724						((dec->packet[3] & 0x0f) << 8) +
   725						dec->packet[4];
   726				}
   727	
   728				length--;
   729				break;
   730	
   731			case 6: {
   732				int remainder = dec->packet_payload_length -
   733						dec->packet_length;
   734	
   735				if (length >= remainder) {
   736					memcpy(dec->packet + dec->packet_length,
   737					       b, remainder);
   738					dec->packet_length += remainder;
   739					b += remainder;
   740					length -= remainder;
   741					dec->packet_state++;
   742				} else {
   743					memcpy(&dec->packet[dec->packet_length],
   744					       b, length);
   745					dec->packet_length += length;
   746					length = 0;
   747				}
   748	
   749				break;
   750			}
   751	
   752			case 7: {
   753				int tail = 4;
   754	
   755				dec->packet[dec->packet_length++] = *b++;
   756	
   757				if (dec->packet_type == TTUSB_DEC_PACKET_SECTION &&
   758				    dec->packet_payload_length % 2)
   759					tail++;
   760	
   761				if (dec->packet_length ==
   762				    dec->packet_payload_length + tail) {
   763					ttusb_dec_process_packet(dec);
   764					dec->packet_state = 0;
   765				}
   766	
   767				length--;
   768				break;
   769			}
   770	
   771			default:
   772				printk("%s: illegal packet state encountered.\n",
   773				       __func__);
   774				dec->packet_state = 0;
   775			}
   776		}
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


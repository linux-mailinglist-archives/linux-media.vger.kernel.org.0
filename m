Return-Path: <linux-media+bounces-49377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA91CD77D3
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 01:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25F50301F270
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 00:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B141DF75D;
	Tue, 23 Dec 2025 00:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHFwb4pk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73473F4F1;
	Tue, 23 Dec 2025 00:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766449917; cv=none; b=HFn1GhwVji4mZ7kPGn8j8aS3Y1hLNqj9MfvcnZ3xhaWKxUQw6qDJxKBSaU5NtLAJ7r0GH0PR6Xde3Bv1NosC35tQoj3P7q8/ERFsNTeDluuXiEiLvyEIVL2/BIu2sbA+uDHKEukD7YNBxDL3PmtVWEnzKHCRvsTKkWEoLvcqCYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766449917; c=relaxed/simple;
	bh=6xa/ToTTgcCibm/eav9Wap/Pur9+s1GlB/60Ot/4yC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McUC+EC4ExReEZL5E5mWn5BkUyzJ3ndoPzpq50Wxdrv9utf2kQ6GZjBBWoVjSlvSzPPUwS0fCoMo+IhEwLkiaOSqY8ttP/k/AVS7wNQ82QMF1Is+jTlloixQwXIsx5VgV0dcxRLAkpETse+7UAp0Yp0LdguTmj6TIOOgaI8VdOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHFwb4pk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766449915; x=1797985915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6xa/ToTTgcCibm/eav9Wap/Pur9+s1GlB/60Ot/4yC8=;
  b=VHFwb4pknlRMBt1JerSV9iFzodS46kEdkSKGLxFgD4AC4bAjcvVNknz5
   ZzWmAJhKbwBkEvdGfQzmQWMRY6caQRzJaxwqYeV0AydegpZZp38uNcwhf
   dSOLJYPVlH+h0pADVd4MrHBFrT2pTBdcSJVpz9FhUbesJix6JJ5HhoJ9C
   Ot+SMWFYylT3okofwO6xjNwF1nPxCqto5geGJx2UtBJ+FwRMtwDX1HZO8
   vlfpabqRVwlOz3bA44SBKlecS56AIkBDsirpDdcucw5s1wYM8N/6v7O/4
   7Ehgf8UJNQLByiQK3GOlobRvzC9piZMAxqONjPOsmeBfNvFRUxK4xab50
   Q==;
X-CSE-ConnectionGUID: 9qhDNf+RSyWiUkY+iKRjiA==
X-CSE-MsgGUID: BCh0fmpdS4GvgZEMe1qq0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67298735"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67298735"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 16:31:55 -0800
X-CSE-ConnectionGUID: M57HItmIR6GW6BQqQ7QeQQ==
X-CSE-MsgGUID: LY2ktNm0Ts2Hh8a6T/LNjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="204135361"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2025 16:31:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXqJX-000000001Ft-0yVD;
	Tue, 23 Dec 2025 00:31:47 +0000
Date: Tue, 23 Dec 2025 08:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: pip-izony <eeodqql09@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: ttusb-dec: fix heap-buffer-overflow in
 ttusb_dec_process_urb_frame()
Message-ID: <202512230853.nWSWHk5e-lkp@intel.com>
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
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master sailus-media-tree/streams v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/pip-izony/media-ttusb-dec-fix-heap-buffer-overflow-in-ttusb_dec_process_urb_frame/20251222-134809
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251222054644.938208-2-eeodqql09%40gmail.com
patch subject: [PATCH v2] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512230853.nWSWHk5e-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230853.nWSWHk5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230853.nWSWHk5e-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/openrisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/openrisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/media/usb/ttusb-dec/ttusb_dec.c:10:
   drivers/media/usb/ttusb-dec/ttusb_dec.c: In function 'ttusb_dec_process_urb_frame':
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:49: error: expected ')' before '__func__'
     713 |                                                 __func__);
         |                                                 ^~~~~~~~
   include/linux/printk.h:436:42: note: in definition of macro '__printk_index_emit'
     436 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                          ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   include/linux/printk.h:436:41: note: to match this '('
     436 |                 if (__builtin_constant_p(_fmt) && __builtin_constant_p(_level)) { \
         |                                         ^
   include/linux/printk.h:479:9: note: in expansion of macro '__printk_index_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:49: error: expected ')' before '__func__'
     713 |                                                 __func__);
         |                                                 ^~~~~~~~
   include/linux/printk.h:445:61: note: in definition of macro '__printk_index_emit'
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                             ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   include/linux/printk.h:445:60: note: to match this '('
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                            ^
   include/linux/printk.h:479:9: note: in expansion of macro '__printk_index_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:49: error: expected ')' before '__func__'
     713 |                                                 __func__);
         |                                                 ^~~~~~~~
   include/linux/printk.h:445:70: note: in definition of macro '__printk_index_emit'
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                      ^~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   include/linux/printk.h:445:69: note: to match this '('
     445 |                                 .fmt = __builtin_constant_p(_fmt) ? (_fmt) : NULL, \
         |                                                                     ^
   include/linux/printk.h:479:9: note: in expansion of macro '__printk_index_emit'
     479 |         __printk_index_emit(fmt, level, subsys_fmt_prefix)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:105:9: note: in expansion of macro 'printk_index_subsys_emit'
     105 |         printk_index_subsys_emit("%s %s: ", level, fmt)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:109:17: note: in expansion of macro 'dev_printk_index_emit'
     109 |                 dev_printk_index_emit(level, fmt);                      \
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/media/usb/ttusb-dec/ttusb_dec.c:11:
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:713:49: error: expected ')' before '__func__'
     713 |                                                 __func__);
         |                                                 ^~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   include/linux/dev_printk.h:110:24: note: to match this '('
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                        ^
   include/linux/dev_printk.h:156:9: note: in expansion of macro 'dev_printk_index_wrap'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
>> drivers/media/usb/ttusb-dec/ttusb_dec.c:712:49: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
     712 |                                                 "%s: packet too long - discarding\n"
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:711:41: note: in expansion of macro 'dev_warn'
     711 |                                         dev_warn(&dec->udev->dev,
         |                                         ^~~~~~~~
   drivers/media/usb/ttusb-dec/ttusb_dec.c:712:51: note: format string is defined here
     712 |                                                 "%s: packet too long - discarding\n"
         |                                                  ~^
         |                                                   |
         |                                                   char *


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
 > 712							"%s: packet too long - discarding\n"
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


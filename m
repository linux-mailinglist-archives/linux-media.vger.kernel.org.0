Return-Path: <linux-media+bounces-18247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D34977C1C
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 11:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C81C2074D
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 09:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5171D6C75;
	Fri, 13 Sep 2024 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4xETvYl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C61D5CC1
	for <linux-media@vger.kernel.org>; Fri, 13 Sep 2024 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219429; cv=none; b=LSR7yunpd1gRiCNsgxAt43gRKotrqkvjmKlnbbyYack220FTvy5rQvjoDCxl3sGL6oA93WGal1haUdGJMUPdrifVhjIB2gwh3ZKOqMtjavJqqn5l8rInjD2d97hKbmhmaJA+jKd7PfkVOxwwa0ahXuiv5KwSv9Ic0BehoSdX9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219429; c=relaxed/simple;
	bh=J2eohR9Mz5LOLU0QI8F3OROlJzQ54ggb33ngfQx3zCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbL9dXVCTgFW1YsOQzeLWrL1VYcRTZ1rUNjwRl/Dxb+KJgQ2TIvD4f3pZIWpBhOsDoSIpuxaZgNBO/o638wuSOvNjUqLl8hxbZfLBRug6WYtu4pNQQabrZhLPzG7wED+CaJlVVkSopgU+PIJcozWPNXwjWRenpKuP7nMr8cGSSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4xETvYl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726219428; x=1757755428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2eohR9Mz5LOLU0QI8F3OROlJzQ54ggb33ngfQx3zCU=;
  b=e4xETvYlFfn0aknZFZxws3QTK2Q2S7LINQHuF26p+FAeaTdsn73g9XDS
   ZwtsUltnlBBPzwAHYmQVSrTyyu+gNu1i8DCKk2MbmZzikzNd8zjGKSpqM
   OylmW+aDXmqLVpFfV48An8tqayzp2t/6mtIx+IIGPYL7yU6BivTHBX3OK
   HXOZeIrAXrQxJVZMuuG3iMIr0Bpr+GCHX4g1ivS/po3K68EPJMRvitAX2
   cDiTvNVyUm5VI3yGoUHk7xThlQawK+IbXweiUXs9wlEW4PDiieFgmK566
   BuvOp6TM69qh0sSCC6PbltNRDA9uULPUqyZgpneq7omDrcYN6mI9IPMKO
   Q==;
X-CSE-ConnectionGUID: 0Csav2BHSOKaR0qwiZ7+uw==
X-CSE-MsgGUID: C4YrKc8fTaCwC+KjYsWiIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="47627568"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="47627568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 02:23:47 -0700
X-CSE-ConnectionGUID: twJE3TqnRsCTLkfSW6woNQ==
X-CSE-MsgGUID: dP8pLkChQSeHKZ5wws+trQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67615378"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2024 02:23:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp2Wk-0006IM-2e;
	Fri, 13 Sep 2024 09:23:42 +0000
Date: Fri, 13 Sep 2024 17:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [linux-next:master 9293/11623]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51:
 warning: 'DCEC' directive output may be truncated writing 4 bytes into a
 region of size between 0 and 53
Message-ID: <202409131718.JZ7cRIiX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   57f962b956f1d116cd64d5c406776c4975de549d
commit: 056f2821b631df2b94d3b017fd1e1eef918ed98d [9293/11623] media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: parisc-randconfig-r113-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131718.JZ7cRIiX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240913/202409131718.JZ7cRIiX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131718.JZ7cRIiX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_cec_adap_transmit':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:51: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
    1014 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |                                                   ^~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:9: note: 'snprintf' output between 13 and 72 bytes into a destination of size 61
    1014 |         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1015 |                  port->direction, port->port.port,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1016 |                  cec_msg_initiator(msg), cec_msg_destination(msg), buf);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/DCEC +1014 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

  1000	
  1001	static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
  1002					    u32 signal_free_time, struct cec_msg *msg)
  1003	{
  1004		struct extron_port *port = cec_get_drvdata(adap);
  1005		char buf[CEC_MAX_MSG_SIZE * 3 + 1];
  1006		char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
  1007		unsigned int i;
  1008	
  1009		if (port->disconnected)
  1010			return -ENODEV;
  1011		buf[0] = 0;
  1012		for (i = 0; i < msg->len - 1; i++)
  1013			sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
> 1014		snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
  1015			 port->direction, port->port.port,
  1016			 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
  1017		return extron_send_and_wait(port->extron, port, cmd, NULL);
  1018	}
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


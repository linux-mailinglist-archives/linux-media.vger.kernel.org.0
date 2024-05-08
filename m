Return-Path: <linux-media+bounces-11113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1D8BF4D7
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 05:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358AA285E00
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 03:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1181C1400B;
	Wed,  8 May 2024 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRTCEoFq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55E12E6C;
	Wed,  8 May 2024 03:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715137930; cv=none; b=i++BgRk6pqd6exR86MGMfn1ZSGfsvOqlgNmXlmNSt+peJBEse5zNrxVf558ck00BNh5ofUxMwwOPH2+P/daWZkHe5BTZqitO0VZMIC9X1Hz4MA6MF88coHDou9YRvBOfwKAWYIm5P8m07OvaixHtYeCawfsTzOXKKICKSeoEBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715137930; c=relaxed/simple;
	bh=dojBfFEdRQ4nxloccm/HMrkGY2HBMwlLPi66aL/0V4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRyIEO5zHzv4+0ZhyC1Uv7guC7YcreM4kfuHErN4QNwk1DWoFw3QufC4iniXGqrOq4xEZt6VxOUIOS0AWEEzMx0DanvflX1b9D5wxnEpO06F76SEelC0U9+Ioci83Tb1vdesCn2G/tAEJSsh0SAOsK9cEnAqkQetM3UE/yPWFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRTCEoFq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715137928; x=1746673928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dojBfFEdRQ4nxloccm/HMrkGY2HBMwlLPi66aL/0V4Q=;
  b=bRTCEoFqWxPl2jhTsssT4xNjtJ/K6Xj/QB5VJOn+TtT6/J6CLOlA0dOO
   5xxN6Q2CGiQSHkSL09zk07AP6QTO42T03MURCswwDMsoV4Vzr18h7A4SW
   Q0lHQwWv/iLE6tLU4Rnvs7gxHyZVYVg6RiugH1/ge2cp62UuRiarl9yz+
   lWyX9NdIGt8/LA7PhULKp19mjkP+tLJLxXC6SBgCiVnCqz5pb7Cexiy6W
   Dzg2uaPgjW2ZcjVNAEeDBj4ymAcioldPe4lJkmdPe7Gev5mlJP0rfZOj0
   HocMTZTpMHBS06Z/2Z8JRKQyh41U5bVIx1Efw8FWeAfjb5BBNP9d6k6Rz
   w==;
X-CSE-ConnectionGUID: ++3MTyjQSFKPFBLXWd10hQ==
X-CSE-MsgGUID: B3N1s9aMTVewoRZcMzAbaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10814129"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="10814129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 20:12:07 -0700
X-CSE-ConnectionGUID: xwQBTDE0Tay2I1d6rDrH8Q==
X-CSE-MsgGUID: 4zxaEh4FQVuxc8Z2qTzPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28720178"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2024 20:12:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Xiq-0002uY-13;
	Wed, 08 May 2024 03:12:00 +0000
Date: Wed, 8 May 2024 11:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <monstr@monstr.eu>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 06/18] media: siano: Refactor struct sms_msg_data
Message-ID: <202405081007.7eCrDhSN-lkp@intel.com>
References: <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on e695668af8523b059127dfa8b261c76e7c9cde10]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Ribalda/media-allegro-nal-hevc-Refactor-nal_hevc_sub_layer_hrd_parameters/20240507-213119
base:   e695668af8523b059127dfa8b261c76e7c9cde10
patch link:    https://lore.kernel.org/r/20240507-cocci-flexarray-v1-6-4a421c21fd06%40chromium.org
patch subject: [PATCH 06/18] media: siano: Refactor struct sms_msg_data
config: mips-randconfig-r113-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081007.7eCrDhSN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 0ab4458df0688955620b72cc2c72a32dffad3615)
reproduce: (https://download.01.org/0day-ci/archive/20240508/202405081007.7eCrDhSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081007.7eCrDhSN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/common/siano/smsendian.c:15:
   In file included from drivers/media/common/siano/smscoreapi.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/common/siano/smsendian.c:27:16: error: subscripted value is not an array, pointer, or vector
      27 |                 msg->msg_data[0] = le32_to_cpu((__force __le32)(msg->msg_data[0]));
         |                 ~~~~~~~~~~~~~^~
   drivers/media/common/siano/smsendian.c:27:64: error: subscripted value is not an array, pointer, or vector
      27 |                 msg->msg_data[0] = le32_to_cpu((__force __le32)(msg->msg_data[0]));
         |                                                                 ~~~~~~~~~~~~~^~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   drivers/media/common/siano/smsendian.c:36:17: error: subscripted value is not an array, pointer, or vector
      36 |                         msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
         |                         ~~~~~~~~~~~~~^~
   drivers/media/common/siano/smsendian.c:36:64: error: subscripted value is not an array, pointer, or vector
      36 |                         msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
         |                                                                        ~~~~~~~~~~~~~^~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   drivers/media/common/siano/smsendian.c:73:17: error: subscripted value is not an array, pointer, or vector
      73 |                         msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
         |                         ~~~~~~~~~~~~~^~
   drivers/media/common/siano/smsendian.c:73:64: error: subscripted value is not an array, pointer, or vector
      73 |                         msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
         |                                                                        ~~~~~~~~~~~~~^~
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32_to_cpu'
      89 | #define le32_to_cpu __le32_to_cpu
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   1 warning and 6 errors generated.


vim +27 drivers/media/common/siano/smsendian.c

cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  13  
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  14  #include "smsendian.h"
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20 @15  #include "smscoreapi.h"
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  16  
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  17  void smsendian_handle_tx_message(void *buffer)
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  18  {
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  19  #ifdef __BIG_ENDIAN
ff7ff3656465f7 drivers/media/common/siano/smsendian.c Dong Chuanjian        2022-12-26  20  	struct sms_msg_data *msg = buffer;
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  21  	int i;
28a59df4d7cb8f drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2013-03-21  22  	int msg_words;
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  23  
dfef84fc135832 drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2013-03-21  24  	switch (msg->x_msg_header.msg_type) {
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  25  	case MSG_SMS_DATA_DOWNLOAD_REQ:
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  26  	{
e1b7f11b37def5 drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2018-04-20 @27  		msg->msg_data[0] = le32_to_cpu((__force __le32)(msg->msg_data[0]));
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  28  		break;
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  29  	}
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  30  
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  31  	default:
28a59df4d7cb8f drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2013-03-21  32  		msg_words = (msg->x_msg_header.msg_length -
dfef84fc135832 drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2013-03-21  33  				sizeof(struct sms_msg_hdr))/4;
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  34  
28a59df4d7cb8f drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2013-03-21  35  		for (i = 0; i < msg_words; i++)
e1b7f11b37def5 drivers/media/common/siano/smsendian.c Mauro Carvalho Chehab 2018-04-20  36  			msg->msg_data[i] = le32_to_cpu((__force __le32)msg->msg_data[i]);
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  37  
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  38  		break;
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  39  	}
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  40  #endif /* __BIG_ENDIAN */
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  41  }
2c5582e58ce298 drivers/media/dvb/siano/smsendian.c    Mauro Carvalho Chehab 2009-05-14  42  EXPORT_SYMBOL_GPL(smsendian_handle_tx_message);
cb17f9047d2c6f drivers/media/dvb/siano/smsendian.c    Uri Shkolnik          2009-04-20  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


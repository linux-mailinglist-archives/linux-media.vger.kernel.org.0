Return-Path: <linux-media+bounces-32250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5FAB2B29
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 22:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75E4D18960FF
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 20:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7D925E441;
	Sun, 11 May 2025 20:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krIk8Uyf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3462719F41C;
	Sun, 11 May 2025 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996576; cv=none; b=pL0XCa1J+S4YH17Lci+RHL3Ycvzy+hGT1xnm/23CdbGs46Moss6KuK3iqgXgalcPjWs0dT9syynlC/xATIv7hSb41RE6lS6KD+sDNKHhWuA2uTI7ct3piGVPzT4KykWaN91C7WSMd4ydKVWy+yqVWewG/KX3REnJJU7xV/MCezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996576; c=relaxed/simple;
	bh=Jlc3B+l5Yt6p8CoOnhTbpcj6/gZVVfwsLD81ls3OOQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpdoGKt6zzAjC5W0rnbaeRlwLbZuuJNjJyFvPmt4Gh9rv+x7fjSMXBMnm/JGJagEAGc6AWhmONFHKzko6vIRa056xq2fx3D3DftBlWsJYK9HlkV5K2va4I4tfhXc/1xdSMcnkEJt3X6H5GNM+3t4hiGuESkxUmgTJUtm/PwQZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krIk8Uyf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746996573; x=1778532573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jlc3B+l5Yt6p8CoOnhTbpcj6/gZVVfwsLD81ls3OOQA=;
  b=krIk8Uyf/YkqseHPOvhkxxE3sRIcNxyR0IiPtjdDs2ZDP0TLZVmlmTou
   xxEEK9jCmhMqTaKPbl9uBbJIXkGnJEWKB/ZWaNYvRjGVVZvDdTuelRfND
   bnkKWrj5gzZ/w/kNyK7lfhVKgjYQARs4ezfN7+C3IgDKTwZXyS10jXVjI
   PQl/4+hVy4kdxZyVUGKMtbEJPUCtz1eqk/pSr/s1TuSY5/eH3Gf9O5WRW
   tcM9/9oSmW8ur07MJNmkDLvU+5Ja8fS2P1j/idxbaH9trHS4NvQO7fZ0A
   +/CClEsJuJBie3uA+t97LZoU2hgkvB4qx7b5u/49zQi2Fm2emZckY2juO
   Q==;
X-CSE-ConnectionGUID: 1Agja1EjTHua8wPQAWJO0Q==
X-CSE-MsgGUID: S1KAXd2RQn+zzXvXhIITzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48937115"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48937115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 13:49:32 -0700
X-CSE-ConnectionGUID: EueI3m8xQEmI3wCr5mnsmg==
X-CSE-MsgGUID: r5BLOc+NSM+v8omMYQgT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142154255"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2025 13:49:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEDbu-000Dz1-2J;
	Sun, 11 May 2025 20:49:22 +0000
Date: Mon, 12 May 2025 04:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Ricardo Ribalda <ribalda@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <202505120421.Mdk0nEDm-lkp@intel.com>
References: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511144752.504162-3-yassine.ouaissa@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20250511-225629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250511144752.504162-3-yassine.ouaissa%40allegrodvt.com
patch subject: [PATCH 2/3] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250512/202505120421.Mdk0nEDm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120421.Mdk0nEDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120421.Mdk0nEDm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/errno.h:1,
                    from include/linux/errno.h:5,
                    from drivers/media/platform/allegro-dvt/al300/al_codec_util.c:11:
>> arch/sparc/include/uapi/asm/errno.h:10:9: warning: "EINPROGRESS" redefined
      10 | #define EINPROGRESS     36      /* Operation now in progress */
         |         ^~~~~~~~~~~
   In file included from drivers/media/platform/allegro-dvt/al300/al_codec_util.c:10:
   include/uapi/asm-generic/errno.h:98:9: note: this is the location of the previous definition
      98 | #define EINPROGRESS     115     /* Operation now in progress */
         |         ^~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:11:9: warning: "EALREADY" redefined
      11 | #define EALREADY        37      /* Operation already in progress */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:97:9: note: this is the location of the previous definition
      97 | #define EALREADY        114     /* Operation already in progress */
         |         ^~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:12:9: warning: "ENOTSOCK" redefined
      12 | #define ENOTSOCK        38      /* Socket operation on non-socket */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:71:9: note: this is the location of the previous definition
      71 | #define ENOTSOCK        88      /* Socket operation on non-socket */
         |         ^~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:13:9: warning: "EDESTADDRREQ" redefined
      13 | #define EDESTADDRREQ    39      /* Destination address required */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:72:9: note: this is the location of the previous definition
      72 | #define EDESTADDRREQ    89      /* Destination address required */
         |         ^~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:14:9: warning: "EMSGSIZE" redefined
      14 | #define EMSGSIZE        40      /* Message too long */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:73:9: note: this is the location of the previous definition
      73 | #define EMSGSIZE        90      /* Message too long */
         |         ^~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:15:9: warning: "EPROTOTYPE" redefined
      15 | #define EPROTOTYPE      41      /* Protocol wrong type for socket */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:74:9: note: this is the location of the previous definition
      74 | #define EPROTOTYPE      91      /* Protocol wrong type for socket */
         |         ^~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:16:9: warning: "ENOPROTOOPT" redefined
      16 | #define ENOPROTOOPT     42      /* Protocol not available */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:75:9: note: this is the location of the previous definition
      75 | #define ENOPROTOOPT     92      /* Protocol not available */
         |         ^~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:17:9: warning: "EPROTONOSUPPORT" redefined
      17 | #define EPROTONOSUPPORT 43      /* Protocol not supported */
         |         ^~~~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:76:9: note: this is the location of the previous definition
      76 | #define EPROTONOSUPPORT 93      /* Protocol not supported */
         |         ^~~~~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:18:9: warning: "ESOCKTNOSUPPORT" redefined
      18 | #define ESOCKTNOSUPPORT 44      /* Socket type not supported */
         |         ^~~~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:77:9: note: this is the location of the previous definition
      77 | #define ESOCKTNOSUPPORT 94      /* Socket type not supported */
         |         ^~~~~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:19:9: warning: "EOPNOTSUPP" redefined
      19 | #define EOPNOTSUPP      45      /* Op not supported on transport endpoint */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:78:9: note: this is the location of the previous definition
      78 | #define EOPNOTSUPP      95      /* Operation not supported on transport endpoint */
         |         ^~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:20:9: warning: "EPFNOSUPPORT" redefined
      20 | #define EPFNOSUPPORT    46      /* Protocol family not supported */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:79:9: note: this is the location of the previous definition
      79 | #define EPFNOSUPPORT    96      /* Protocol family not supported */
         |         ^~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:21:9: warning: "EAFNOSUPPORT" redefined
      21 | #define EAFNOSUPPORT    47      /* Address family not supported by protocol */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:80:9: note: this is the location of the previous definition
      80 | #define EAFNOSUPPORT    97      /* Address family not supported by protocol */
         |         ^~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:22:9: warning: "EADDRINUSE" redefined
      22 | #define EADDRINUSE      48      /* Address already in use */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:81:9: note: this is the location of the previous definition
      81 | #define EADDRINUSE      98      /* Address already in use */
         |         ^~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:23:9: warning: "EADDRNOTAVAIL" redefined
      23 | #define EADDRNOTAVAIL   49      /* Cannot assign requested address */
         |         ^~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:82:9: note: this is the location of the previous definition
      82 | #define EADDRNOTAVAIL   99      /* Cannot assign requested address */
         |         ^~~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:24:9: warning: "ENETDOWN" redefined
      24 | #define ENETDOWN        50      /* Network is down */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:83:9: note: this is the location of the previous definition
      83 | #define ENETDOWN        100     /* Network is down */
         |         ^~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:25:9: warning: "ENETUNREACH" redefined
      25 | #define ENETUNREACH     51      /* Network is unreachable */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:84:9: note: this is the location of the previous definition
      84 | #define ENETUNREACH     101     /* Network is unreachable */
         |         ^~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:26:9: warning: "ENETRESET" redefined
      26 | #define ENETRESET       52      /* Net dropped connection because of reset */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:85:9: note: this is the location of the previous definition
      85 | #define ENETRESET       102     /* Network dropped connection because of reset */
         |         ^~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:27:9: warning: "ECONNABORTED" redefined
      27 | #define ECONNABORTED    53      /* Software caused connection abort */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:86:9: note: this is the location of the previous definition
      86 | #define ECONNABORTED    103     /* Software caused connection abort */
         |         ^~~~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:28:9: warning: "ECONNRESET" redefined
      28 | #define ECONNRESET      54      /* Connection reset by peer */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:87:9: note: this is the location of the previous definition
      87 | #define ECONNRESET      104     /* Connection reset by peer */
         |         ^~~~~~~~~~
>> arch/sparc/include/uapi/asm/errno.h:29:9: warning: "ENOBUFS" redefined
      29 | #define ENOBUFS         55      /* No buffer space available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:88:9: note: this is the location of the previous definition
      88 | #define ENOBUFS         105     /* No buffer space available */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:30:9: warning: "EISCONN" redefined
      30 | #define EISCONN         56      /* Transport endpoint is already connected */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:89:9: note: this is the location of the previous definition
      89 | #define EISCONN         106     /* Transport endpoint is already connected */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:31:9: warning: "ENOTCONN" redefined
      31 | #define ENOTCONN        57      /* Transport endpoint is not connected */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:90:9: note: this is the location of the previous definition
      90 | #define ENOTCONN        107     /* Transport endpoint is not connected */
         |         ^~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:32:9: warning: "ESHUTDOWN" redefined
      32 | #define ESHUTDOWN       58      /* No send after transport endpoint shutdown */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:91:9: note: this is the location of the previous definition
      91 | #define ESHUTDOWN       108     /* Cannot send after transport endpoint shutdown */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:33:9: warning: "ETOOMANYREFS" redefined
      33 | #define ETOOMANYREFS    59      /* Too many references: cannot splice */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:92:9: note: this is the location of the previous definition
      92 | #define ETOOMANYREFS    109     /* Too many references: cannot splice */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:34:9: warning: "ETIMEDOUT" redefined
      34 | #define ETIMEDOUT       60      /* Connection timed out */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:93:9: note: this is the location of the previous definition
      93 | #define ETIMEDOUT       110     /* Connection timed out */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:35:9: warning: "ECONNREFUSED" redefined
      35 | #define ECONNREFUSED    61      /* Connection refused */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:94:9: note: this is the location of the previous definition
      94 | #define ECONNREFUSED    111     /* Connection refused */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:36:9: warning: "ELOOP" redefined
      36 | #define ELOOP           62      /* Too many symbolic links encountered */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:21:9: note: this is the location of the previous definition
      21 | #define ELOOP           40      /* Too many symbolic links encountered */
         |         ^~~~~
   arch/sparc/include/uapi/asm/errno.h:37:9: warning: "ENAMETOOLONG" redefined
      37 | #define ENAMETOOLONG    63      /* File name too long */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:8:9: note: this is the location of the previous definition
       8 | #define ENAMETOOLONG    36      /* File name too long */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:38:9: warning: "EHOSTDOWN" redefined
      38 | #define EHOSTDOWN       64      /* Host is down */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:95:9: note: this is the location of the previous definition
      95 | #define EHOSTDOWN       112     /* Host is down */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:39:9: warning: "EHOSTUNREACH" redefined
      39 | #define EHOSTUNREACH    65      /* No route to host */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:96:9: note: this is the location of the previous definition
      96 | #define EHOSTUNREACH    113     /* No route to host */
         |         ^~~~~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:40:9: warning: "ENOTEMPTY" redefined
      40 | #define ENOTEMPTY       66      /* Directory not empty */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:20:9: note: this is the location of the previous definition
      20 | #define ENOTEMPTY       39      /* Directory not empty */
         |         ^~~~~~~~~
   arch/sparc/include/uapi/asm/errno.h:42:9: warning: "EUSERS" redefined
      42 | #define EUSERS          68      /* Too many users */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:70:9: note: this is the location of the previous definition
      70 | #define EUSERS          87      /* Too many users */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:43:9: warning: "EDQUOT" redefined
      43 | #define EDQUOT          69      /* Quota exceeded */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:105:9: note: this is the location of the previous definition
     105 | #define EDQUOT          122     /* Quota exceeded */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:44:9: warning: "ESTALE" redefined
      44 | #define ESTALE          70      /* Stale file handle */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:99:9: note: this is the location of the previous definition
      99 | #define ESTALE          116     /* Stale file handle */
         |         ^~~~~~
   arch/sparc/include/uapi/asm/errno.h:45:9: warning: "EREMOTE" redefined
      45 | #define EREMOTE         71      /* Object is remote */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:49:9: note: this is the location of the previous definition
      49 | #define EREMOTE         66      /* Object is remote */
         |         ^~~~~~~
   arch/sparc/include/uapi/asm/errno.h:46:9: warning: "ENOSTR" redefined
      46 | #define ENOSTR          72      /* Device not a stream */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:43:9: note: this is the location of the previous definition
      43 | #define ENOSTR          60      /* Device not a stream */


vim +/EINPROGRESS +10 arch/sparc/include/uapi/asm/errno.h

^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16    8  
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16    9  #define	EWOULDBLOCK	EAGAIN	/* Operation would block */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @10  #define	EINPROGRESS	36	/* Operation now in progress */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @11  #define	EALREADY	37	/* Operation already in progress */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @12  #define	ENOTSOCK	38	/* Socket operation on non-socket */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @13  #define	EDESTADDRREQ	39	/* Destination address required */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @14  #define	EMSGSIZE	40	/* Message too long */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @15  #define	EPROTOTYPE	41	/* Protocol wrong type for socket */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @16  #define	ENOPROTOOPT	42	/* Protocol not available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @17  #define	EPROTONOSUPPORT	43	/* Protocol not supported */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @18  #define	ESOCKTNOSUPPORT	44	/* Socket type not supported */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @19  #define	EOPNOTSUPP	45	/* Op not supported on transport endpoint */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @20  #define	EPFNOSUPPORT	46	/* Protocol family not supported */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @21  #define	EAFNOSUPPORT	47	/* Address family not supported by protocol */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @22  #define	EADDRINUSE	48	/* Address already in use */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @23  #define	EADDRNOTAVAIL	49	/* Cannot assign requested address */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @24  #define	ENETDOWN	50	/* Network is down */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @25  #define	ENETUNREACH	51	/* Network is unreachable */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @26  #define	ENETRESET	52	/* Net dropped connection because of reset */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @27  #define	ECONNABORTED	53	/* Software caused connection abort */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @28  #define	ECONNRESET	54	/* Connection reset by peer */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @29  #define	ENOBUFS		55	/* No buffer space available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @30  #define	EISCONN		56	/* Transport endpoint is already connected */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @31  #define	ENOTCONN	57	/* Transport endpoint is not connected */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @32  #define	ESHUTDOWN	58	/* No send after transport endpoint shutdown */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @33  #define	ETOOMANYREFS	59	/* Too many references: cannot splice */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @34  #define	ETIMEDOUT	60	/* Connection timed out */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @35  #define	ECONNREFUSED	61	/* Connection refused */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @36  #define	ELOOP		62	/* Too many symbolic links encountered */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @37  #define	ENAMETOOLONG	63	/* File name too long */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @38  #define	EHOSTDOWN	64	/* Host is down */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @39  #define	EHOSTUNREACH	65	/* No route to host */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @40  #define	ENOTEMPTY	66	/* Directory not empty */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   41  #define EPROCLIM        67      /* SUNOS: Too many processes */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @42  #define	EUSERS		68	/* Too many users */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @43  #define	EDQUOT		69	/* Quota exceeded */
0ca43435188b9f arch/sparc/include/uapi/asm/errno.h Eric Sandeen        2013-11-12  @44  #define	ESTALE		70	/* Stale file handle */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @45  #define	EREMOTE		71	/* Object is remote */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @46  #define	ENOSTR		72	/* Device not a stream */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @47  #define	ETIME		73	/* Timer expired */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @48  #define	ENOSR		74	/* Out of streams resources */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @49  #define	ENOMSG		75	/* No message of desired type */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @50  #define	EBADMSG		76	/* Not a data message */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @51  #define	EIDRM		77	/* Identifier removed */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @52  #define	EDEADLK		78	/* Resource deadlock would occur */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @53  #define	ENOLCK		79	/* No record locks available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @54  #define	ENONET		80	/* Machine is not on the network */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   55  #define ERREMOTE        81      /* SunOS: Too many lvls of remote in path */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @56  #define	ENOLINK		82	/* Link has been severed */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @57  #define	EADV		83	/* Advertise error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @58  #define	ESRMNT		84	/* Srmount error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @59  #define	ECOMM		85      /* Communication error on send */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @60  #define	EPROTO		86	/* Protocol error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @61  #define	EMULTIHOP	87	/* Multihop attempted */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @62  #define	EDOTDOT		88	/* RFS specific error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @63  #define	EREMCHG		89	/* Remote address changed */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @64  #define	ENOSYS		90	/* Function not implemented */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   65  
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   66  /* The rest have no SunOS equivalent. */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @67  #define	ESTRPIPE	91	/* Streams pipe error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @68  #define	EOVERFLOW	92	/* Value too large for defined data type */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @69  #define	EBADFD		93	/* File descriptor in bad state */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @70  #define	ECHRNG		94	/* Channel number out of range */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @71  #define	EL2NSYNC	95	/* Level 2 not synchronized */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @72  #define	EL3HLT		96	/* Level 3 halted */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @73  #define	EL3RST		97	/* Level 3 reset */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @74  #define	ELNRNG		98	/* Link number out of range */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @75  #define	EUNATCH		99	/* Protocol driver not attached */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @76  #define	ENOCSI		100	/* No CSI structure available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @77  #define	EL2HLT		101	/* Level 2 halted */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @78  #define	EBADE		102	/* Invalid exchange */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @79  #define	EBADR		103	/* Invalid request descriptor */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @80  #define	EXFULL		104	/* Exchange full */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @81  #define	ENOANO		105	/* No anode */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @82  #define	EBADRQC		106	/* Invalid request code */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @83  #define	EBADSLT		107	/* Invalid slot */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @84  #define	EDEADLOCK	108	/* File locking deadlock error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @85  #define	EBFONT		109	/* Bad font file format */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @86  #define	ELIBEXEC	110	/* Cannot exec a shared library directly */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @87  #define	ENODATA		111	/* No data available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @88  #define	ELIBBAD		112	/* Accessing a corrupted shared library */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @89  #define	ENOPKG		113	/* Package not installed */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @90  #define	ELIBACC		114	/* Can not access a needed shared library */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @91  #define	ENOTUNIQ	115	/* Name not unique on network */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @92  #define	ERESTART	116	/* Interrupted syscall should be restarted */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   93  #define	EUCLEAN		117	/* Structure needs cleaning */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   94  #define	ENOTNAM		118	/* Not a XENIX named type file */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   95  #define	ENAVAIL		119	/* No XENIX semaphores available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   96  #define	EISNAM		120	/* Is a named type file */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16   97  #define	EREMOTEIO	121	/* Remote I/O error */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @98  #define	EILSEQ		122	/* Illegal byte sequence */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  @99  #define	ELIBMAX		123	/* Atmpt to link in too many shared libs */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @100  #define	ELIBSCN		124	/* .lib section in a.out corrupted */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  101  
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @102  #define	ENOMEDIUM	125	/* No medium found */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @103  #define	EMEDIUMTYPE	126	/* Wrong medium type */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @104  #define	ECANCELED	127	/* Operation Cancelled */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @105  #define	ENOKEY		128	/* Required key not available */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @106  #define	EKEYEXPIRED	129	/* Key has expired */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @107  #define	EKEYREVOKED	130	/* Key has been revoked */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16 @108  #define	EKEYREJECTED	131	/* Key was rejected by service */
^1da177e4c3f41 include/asm-sparc/errno.h           Linus Torvalds      2005-04-16  109  
4750e2c0c59e0c include/asm-sparc/errno.h           Joe Korty           2005-05-01  110  /* for robust mutexes */
4750e2c0c59e0c include/asm-sparc/errno.h           Joe Korty           2005-05-01 @111  #define	EOWNERDEAD	132	/* Owner died */
4750e2c0c59e0c include/asm-sparc/errno.h           Joe Korty           2005-05-01 @112  #define	ENOTRECOVERABLE	133	/* State not recoverable */
4750e2c0c59e0c include/asm-sparc/errno.h           Joe Korty           2005-05-01  113  
7d217d7ffc3433 arch/sparc/include/asm/errno.h      Alexander Beregalov 2009-06-07 @114  #define	ERFKILL		134	/* Operation not possible due to RF-kill */
7d217d7ffc3433 arch/sparc/include/asm/errno.h      Alexander Beregalov 2009-06-07  115  
69ebb83e13e514 arch/sparc/include/asm/errno.h      Ying Huang          2011-01-30 @116  #define EHWPOISON	135	/* Memory page has hardware error */
69ebb83e13e514 arch/sparc/include/asm/errno.h      Ying Huang          2011-01-30  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


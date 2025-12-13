Return-Path: <linux-media+bounces-48738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93931CBB32D
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 21:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BCA4300BB96
	for <lists+linux-media@lfdr.de>; Sat, 13 Dec 2025 20:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6867E3093A8;
	Sat, 13 Dec 2025 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+dzkTIT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7F200113;
	Sat, 13 Dec 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765657646; cv=none; b=qomcv03jgeUWq51yvdS7+XmxNrQRX1J8CDG0ObM7soXyR9CFvLNeyvAAAX8/+bJuCySsnIegZBxoX7KbcheHbUUmMG9UouLYhHBHtKhDqBiggJVmSwTxkDM/yBIuX90BZeuPi4yGERnggHKPFoUIWqgxff0L3Ay62ReYsvu2kf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765657646; c=relaxed/simple;
	bh=Lvc73evnUCebBf6/Nz2LF5EchULQLE7zeFlqh3tzWJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNw5i6I14t7wchqnUXYZ67Eem2bgedqJjW3bqyGQdABxCvPDZSwMRrBQNWaZrKgVOqUu1k4YqUKf8rs+j5U26xAQUGCvlDNR0fdvnSUIRjM/RlXBDx52QE1oOBBLSK80rKz6mjJLpHqjXLDuyNwNAqUu10arQBZh3Llt2H3VW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+dzkTIT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765657644; x=1797193644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lvc73evnUCebBf6/Nz2LF5EchULQLE7zeFlqh3tzWJ8=;
  b=g+dzkTITSmxiUDtkugIRNmVOs0KILW23M+Fwk/UtPjeEtQojf/uI27qV
   IPNqZYGlEVN3h53QT3wZr66wEtQLDTLE2ZrLfHfUvmaosdA6bOyJB7w+U
   iJ1+wwASSwGGJI6b9AAL8AA2LGV37X+ttN5aSfbj1E1TiPjgpWgUrCCZm
   mJqwT0a72D3zQb9gAkz3CfexmELm65UaVcMlRvEDc17tIoIe89fz/OCnn
   poXLOrEJInMClXqFK4y2NuVmblTkXx0Bropoebi2C7GmOCa1dhRlNbg2B
   hMXSckYYFEeGxM76snddT805wcaExhr+/lRM7H0QrRaxzeYK5zTWW7Vmf
   Q==;
X-CSE-ConnectionGUID: d57dtadgQ4W8v4JgwSXJ1Q==
X-CSE-MsgGUID: G4YH+g6lQt6ICdmT4GcDZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70203777"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70203777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:27:23 -0800
X-CSE-ConnectionGUID: /60YZiJSSPSrQw7koa+gnA==
X-CSE-MsgGUID: pEdsMWjbTRmCvR2OZCLUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197637411"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 12:27:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWCz-000000008AX-121e;
	Sat, 13 Dec 2025 20:27:17 +0000
Date: Sun, 14 Dec 2025 04:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <monstr@monstr.eu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/4] media: allegro-dvt: Add Gen 3 IP stateful
 decoder driver
Message-ID: <202512140429.FIDK3ebu-lkp@intel.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-4-128956555677@allegrodvt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-4-128956555677@allegrodvt.com>

Hi Yassine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c2f2b01b74be8b40a2173372bcd770723f87e7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Yassine-Ouaissa-via-B4-Relay/media-allegro-dvt-Move-the-current-driver-to-a-subdirectory/20251208-235310
base:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
patch link:    https://lore.kernel.org/r/20251208-allegro_dvt_al300_dec_driver-v6-4-128956555677%40allegrodvt.com
patch subject: [PATCH RESEND v6 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512140429.FIDK3ebu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140429.FIDK3ebu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140429.FIDK3ebu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/errno.h:1,
                    from include/linux/errno.h:5,
                    from drivers/media/platform/allegro-dvt/al300/al_codec_util.c:11:
   arch/parisc/include/uapi/asm/errno.h:7:9: warning: 'ENOMSG' redefined
       7 | #define ENOMSG          35      /* No message of desired type */
         |         ^~~~~~
   In file included from drivers/media/platform/allegro-dvt/al300/al_codec_util.c:10:
   include/uapi/asm-generic/errno.h:23:9: note: this is the location of the previous definition
      23 | #define ENOMSG          42      /* No message of desired type */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:8:9: warning: 'EIDRM' redefined
       8 | #define EIDRM           36      /* Identifier removed */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:24:9: note: this is the location of the previous definition
      24 | #define EIDRM           43      /* Identifier removed */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:9:9: warning: 'ECHRNG' redefined
       9 | #define ECHRNG          37      /* Channel number out of range */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:25:9: note: this is the location of the previous definition
      25 | #define ECHRNG          44      /* Channel number out of range */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:10:9: warning: 'EL2NSYNC' redefined
      10 | #define EL2NSYNC        38      /* Level 2 not synchronized */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:26:9: note: this is the location of the previous definition
      26 | #define EL2NSYNC        45      /* Level 2 not synchronized */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:11:9: warning: 'EL3HLT' redefined
      11 | #define EL3HLT          39      /* Level 3 halted */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:27:9: note: this is the location of the previous definition
      27 | #define EL3HLT          46      /* Level 3 halted */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:12:9: warning: 'EL3RST' redefined
      12 | #define EL3RST          40      /* Level 3 reset */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:28:9: note: this is the location of the previous definition
      28 | #define EL3RST          47      /* Level 3 reset */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:13:9: warning: 'ELNRNG' redefined
      13 | #define ELNRNG          41      /* Link number out of range */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:29:9: note: this is the location of the previous definition
      29 | #define ELNRNG          48      /* Link number out of range */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:14:9: warning: 'EUNATCH' redefined
      14 | #define EUNATCH         42      /* Protocol driver not attached */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:30:9: note: this is the location of the previous definition
      30 | #define EUNATCH         49      /* Protocol driver not attached */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:15:9: warning: 'ENOCSI' redefined
      15 | #define ENOCSI          43      /* No CSI structure available */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:31:9: note: this is the location of the previous definition
      31 | #define ENOCSI          50      /* No CSI structure available */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:16:9: warning: 'EL2HLT' redefined
      16 | #define EL2HLT          44      /* Level 2 halted */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:32:9: note: this is the location of the previous definition
      32 | #define EL2HLT          51      /* Level 2 halted */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:17:9: warning: 'EDEADLK' redefined
      17 | #define EDEADLK         45      /* Resource deadlock would occur */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:7:9: note: this is the location of the previous definition
       7 | #define EDEADLK         35      /* Resource deadlock would occur */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:19:9: warning: 'ENOLCK' redefined
      19 | #define ENOLCK          46      /* No record locks available */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:9:9: note: this is the location of the previous definition
       9 | #define ENOLCK          37      /* No record locks available */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:20:9: warning: 'EILSEQ' redefined
      20 | #define EILSEQ          47      /* Illegal byte sequence */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:67:9: note: this is the location of the previous definition
      67 | #define EILSEQ          84      /* Illegal byte sequence */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:22:9: warning: 'ENONET' redefined
      22 | #define ENONET          50      /* Machine is not on the network */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:47:9: note: this is the location of the previous definition
      47 | #define ENONET          64      /* Machine is not on the network */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:23:9: warning: 'ENODATA' redefined
      23 | #define ENODATA         51      /* No data available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:44:9: note: this is the location of the previous definition
      44 | #define ENODATA         61      /* No data available */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:24:9: warning: 'ETIME' redefined
      24 | #define ETIME           52      /* Timer expired */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:45:9: note: this is the location of the previous definition
      45 | #define ETIME           62      /* Timer expired */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:25:9: warning: 'ENOSR' redefined
      25 | #define ENOSR           53      /* Out of streams resources */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:46:9: note: this is the location of the previous definition
      46 | #define ENOSR           63      /* Out of streams resources */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:26:9: warning: 'ENOSTR' redefined
      26 | #define ENOSTR          54      /* Device not a stream */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:43:9: note: this is the location of the previous definition
      43 | #define ENOSTR          60      /* Device not a stream */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:27:9: warning: 'ENOPKG' redefined
      27 | #define ENOPKG          55      /* Package not installed */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:48:9: note: this is the location of the previous definition
      48 | #define ENOPKG          65      /* Package not installed */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:29:9: warning: 'ENOLINK' redefined
      29 | #define ENOLINK         57      /* Link has been severed */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:50:9: note: this is the location of the previous definition
      50 | #define ENOLINK         67      /* Link has been severed */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:30:9: warning: 'EADV' redefined
      30 | #define EADV            58      /* Advertise error */
         |         ^~~~
   include/uapi/asm-generic/errno.h:51:9: note: this is the location of the previous definition
      51 | #define EADV            68      /* Advertise error */
         |         ^~~~
   arch/parisc/include/uapi/asm/errno.h:31:9: warning: 'ESRMNT' redefined
      31 | #define ESRMNT          59      /* Srmount error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:52:9: note: this is the location of the previous definition
      52 | #define ESRMNT          69      /* Srmount error */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:32:9: warning: 'ECOMM' redefined
      32 | #define ECOMM           60      /* Communication error on send */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:53:9: note: this is the location of the previous definition
      53 | #define ECOMM           70      /* Communication error on send */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:33:9: warning: 'EPROTO' redefined
      33 | #define EPROTO          61      /* Protocol error */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:54:9: note: this is the location of the previous definition
      54 | #define EPROTO          71      /* Protocol error */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:35:9: warning: 'EMULTIHOP' redefined
      35 | #define EMULTIHOP       64      /* Multihop attempted */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:55:9: note: this is the location of the previous definition
      55 | #define EMULTIHOP       72      /* Multihop attempted */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:37:9: warning: 'EDOTDOT' redefined
      37 | #define EDOTDOT         66      /* RFS specific error */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:56:9: note: this is the location of the previous definition
      56 | #define EDOTDOT         73      /* RFS specific error */
         |         ^~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:38:9: warning: 'EBADMSG' redefined
      38 | #define EBADMSG         67      /* Not a data message */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:57:9: note: this is the location of the previous definition
      57 | #define EBADMSG         74      /* Not a data message */
         |         ^~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:39:9: warning: 'EUSERS' redefined
      39 | #define EUSERS          68      /* Too many users */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:70:9: note: this is the location of the previous definition
      70 | #define EUSERS          87      /* Too many users */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:40:9: warning: 'EDQUOT' redefined
      40 | #define EDQUOT          69      /* Quota exceeded */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:105:9: note: this is the location of the previous definition
     105 | #define EDQUOT          122     /* Quota exceeded */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:41:9: warning: 'ESTALE' redefined
      41 | #define ESTALE          70      /* Stale file handle */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:99:9: note: this is the location of the previous definition
      99 | #define ESTALE          116     /* Stale file handle */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:42:9: warning: 'EREMOTE' redefined
      42 | #define EREMOTE         71      /* Object is remote */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:49:9: note: this is the location of the previous definition
      49 | #define EREMOTE         66      /* Object is remote */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:43:9: warning: 'EOVERFLOW' redefined
      43 | #define EOVERFLOW       72      /* Value too large for defined data type */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:58:9: note: this is the location of the previous definition
      58 | #define EOVERFLOW       75      /* Value too large for defined data type */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:47:9: warning: 'EBADE' redefined
      47 | #define EBADE           160     /* Invalid exchange */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:33:9: note: this is the location of the previous definition
      33 | #define EBADE           52      /* Invalid exchange */
         |         ^~~~~
   arch/parisc/include/uapi/asm/errno.h:48:9: warning: 'EBADR' redefined
      48 | #define EBADR           161     /* Invalid request descriptor */
         |         ^~~~~
   include/uapi/asm-generic/errno.h:34:9: note: this is the location of the previous definition
      34 | #define EBADR           53      /* Invalid request descriptor */
         |         ^~~~~
>> arch/parisc/include/uapi/asm/errno.h:49:9: warning: 'EXFULL' redefined
      49 | #define EXFULL          162     /* Exchange full */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:35:9: note: this is the location of the previous definition
      35 | #define EXFULL          54      /* Exchange full */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:50:9: warning: 'ENOANO' redefined
      50 | #define ENOANO          163     /* No anode */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:36:9: note: this is the location of the previous definition
      36 | #define ENOANO          55      /* No anode */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:51:9: warning: 'EBADRQC' redefined
      51 | #define EBADRQC         164     /* Invalid request code */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:37:9: note: this is the location of the previous definition
      37 | #define EBADRQC         56      /* Invalid request code */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:52:9: warning: 'EBADSLT' redefined
      52 | #define EBADSLT         165     /* Invalid slot */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:38:9: note: this is the location of the previous definition
      38 | #define EBADSLT         57      /* Invalid slot */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:53:9: warning: 'EBFONT' redefined
      53 | #define EBFONT          166     /* Bad font file format */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:42:9: note: this is the location of the previous definition
      42 | #define EBFONT          59      /* Bad font file format */
         |         ^~~~~~
   arch/parisc/include/uapi/asm/errno.h:54:9: warning: 'ENOTUNIQ' redefined
      54 | #define ENOTUNIQ        167     /* Name not unique on network */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:59:9: note: this is the location of the previous definition
      59 | #define ENOTUNIQ        76      /* Name not unique on network */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:55:9: warning: 'EBADFD' redefined
      55 | #define EBADFD          168     /* File descriptor in bad state */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:60:9: note: this is the location of the previous definition
      60 | #define EBADFD          77      /* File descriptor in bad state */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:56:9: warning: 'EREMCHG' redefined
      56 | #define EREMCHG         169     /* Remote address changed */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:61:9: note: this is the location of the previous definition
      61 | #define EREMCHG         78      /* Remote address changed */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:57:9: warning: 'ELIBACC' redefined
      57 | #define ELIBACC         170     /* Can not access a needed shared library */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:62:9: note: this is the location of the previous definition
      62 | #define ELIBACC         79      /* Can not access a needed shared library */
         |         ^~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:58:9: warning: 'ELIBBAD' redefined
      58 | #define ELIBBAD         171     /* Accessing a corrupted shared library */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:63:9: note: this is the location of the previous definition
      63 | #define ELIBBAD         80      /* Accessing a corrupted shared library */
         |         ^~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:59:9: warning: 'ELIBSCN' redefined
      59 | #define ELIBSCN         172     /* .lib section in a.out corrupted */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:64:9: note: this is the location of the previous definition
      64 | #define ELIBSCN         81      /* .lib section in a.out corrupted */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:60:9: warning: 'ELIBMAX' redefined
      60 | #define ELIBMAX         173     /* Attempting to link in too many shared libraries */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:65:9: note: this is the location of the previous definition
      65 | #define ELIBMAX         82      /* Attempting to link in too many shared libraries */
         |         ^~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:61:9: warning: 'ELIBEXEC' redefined
      61 | #define ELIBEXEC        174     /* Cannot exec a shared library directly */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:66:9: note: this is the location of the previous definition
      66 | #define ELIBEXEC        83      /* Cannot exec a shared library directly */
         |         ^~~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:62:9: warning: 'ERESTART' redefined
      62 | #define ERESTART        175     /* Interrupted system call should be restarted */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:68:9: note: this is the location of the previous definition
      68 | #define ERESTART        85      /* Interrupted system call should be restarted */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:63:9: warning: 'ESTRPIPE' redefined
      63 | #define ESTRPIPE        176     /* Streams pipe error */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:69:9: note: this is the location of the previous definition
      69 | #define ESTRPIPE        86      /* Streams pipe error */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:64:9: warning: 'EUCLEAN' redefined
      64 | #define EUCLEAN         177     /* Structure needs cleaning */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:100:9: note: this is the location of the previous definition
     100 | #define EUCLEAN         117     /* Structure needs cleaning */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:65:9: warning: 'ENOTNAM' redefined
      65 | #define ENOTNAM         178     /* Not a XENIX named type file */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:101:9: note: this is the location of the previous definition
     101 | #define ENOTNAM         118     /* Not a XENIX named type file */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:66:9: warning: 'ENAVAIL' redefined
      66 | #define ENAVAIL         179     /* No XENIX semaphores available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:102:9: note: this is the location of the previous definition
     102 | #define ENAVAIL         119     /* No XENIX semaphores available */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:67:9: warning: 'EISNAM' redefined
      67 | #define EISNAM          180     /* Is a named type file */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:103:9: note: this is the location of the previous definition
     103 | #define EISNAM          120     /* Is a named type file */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:68:9: warning: 'EREMOTEIO' redefined
      68 | #define EREMOTEIO       181     /* Remote I/O error */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:104:9: note: this is the location of the previous definition
     104 | #define EREMOTEIO       121     /* Remote I/O error */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:69:9: warning: 'ENOMEDIUM' redefined
      69 | #define ENOMEDIUM       182     /* No medium found */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:107:9: note: this is the location of the previous definition
     107 | #define ENOMEDIUM       123     /* No medium found */
         |         ^~~~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:70:9: warning: 'EMEDIUMTYPE' redefined
      70 | #define EMEDIUMTYPE     183     /* Wrong medium type */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:108:9: note: this is the location of the previous definition
     108 | #define EMEDIUMTYPE     124     /* Wrong medium type */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:71:9: warning: 'ENOKEY' redefined
      71 | #define ENOKEY          184     /* Required key not available */
         |         ^~~~~~
   include/uapi/asm-generic/errno.h:110:9: note: this is the location of the previous definition
     110 | #define ENOKEY          126     /* Required key not available */
         |         ^~~~~~
>> arch/parisc/include/uapi/asm/errno.h:72:9: warning: 'EKEYEXPIRED' redefined
      72 | #define EKEYEXPIRED     185     /* Key has expired */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:111:9: note: this is the location of the previous definition
     111 | #define EKEYEXPIRED     127     /* Key has expired */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:73:9: warning: 'EKEYREVOKED' redefined
      73 | #define EKEYREVOKED     186     /* Key has been revoked */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:112:9: note: this is the location of the previous definition
     112 | #define EKEYREVOKED     128     /* Key has been revoked */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:74:9: warning: 'EKEYREJECTED' redefined
      74 | #define EKEYREJECTED    187     /* Key was rejected by service */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:113:9: note: this is the location of the previous definition
     113 | #define EKEYREJECTED    129     /* Key was rejected by service */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:78:9: warning: 'ENOTSOCK' redefined
      78 | #define ENOTSOCK        216     /* Socket operation on non-socket */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:71:9: note: this is the location of the previous definition
      71 | #define ENOTSOCK        88      /* Socket operation on non-socket */
         |         ^~~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:79:9: warning: 'EDESTADDRREQ' redefined
      79 | #define EDESTADDRREQ    217     /* Destination address required */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:72:9: note: this is the location of the previous definition
      72 | #define EDESTADDRREQ    89      /* Destination address required */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:80:9: warning: 'EMSGSIZE' redefined
      80 | #define EMSGSIZE        218     /* Message too long */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:73:9: note: this is the location of the previous definition
      73 | #define EMSGSIZE        90      /* Message too long */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:81:9: warning: 'EPROTOTYPE' redefined
      81 | #define EPROTOTYPE      219     /* Protocol wrong type for socket */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:74:9: note: this is the location of the previous definition
      74 | #define EPROTOTYPE      91      /* Protocol wrong type for socket */
         |         ^~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:82:9: warning: 'ENOPROTOOPT' redefined
      82 | #define ENOPROTOOPT     220     /* Protocol not available */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:75:9: note: this is the location of the previous definition
      75 | #define ENOPROTOOPT     92      /* Protocol not available */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:83:9: warning: 'EPROTONOSUPPORT' redefined
      83 | #define EPROTONOSUPPORT 221     /* Protocol not supported */
         |         ^~~~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:76:9: note: this is the location of the previous definition
      76 | #define EPROTONOSUPPORT 93      /* Protocol not supported */
         |         ^~~~~~~~~~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:84:9: warning: 'ESOCKTNOSUPPORT' redefined
      84 | #define ESOCKTNOSUPPORT 222     /* Socket type not supported */
         |         ^~~~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:77:9: note: this is the location of the previous definition
      77 | #define ESOCKTNOSUPPORT 94      /* Socket type not supported */
         |         ^~~~~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:85:9: warning: 'EOPNOTSUPP' redefined
      85 | #define EOPNOTSUPP      223     /* Operation not supported on transport endpoint */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:78:9: note: this is the location of the previous definition
      78 | #define EOPNOTSUPP      95      /* Operation not supported on transport endpoint */
         |         ^~~~~~~~~~
>> arch/parisc/include/uapi/asm/errno.h:86:9: warning: 'EPFNOSUPPORT' redefined
      86 | #define EPFNOSUPPORT    224     /* Protocol family not supported */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:79:9: note: this is the location of the previous definition
      79 | #define EPFNOSUPPORT    96      /* Protocol family not supported */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:87:9: warning: 'EAFNOSUPPORT' redefined
      87 | #define EAFNOSUPPORT    225     /* Address family not supported by protocol */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:80:9: note: this is the location of the previous definition
      80 | #define EAFNOSUPPORT    97      /* Address family not supported by protocol */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:88:9: warning: 'EADDRINUSE' redefined
      88 | #define EADDRINUSE      226     /* Address already in use */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:81:9: note: this is the location of the previous definition
      81 | #define EADDRINUSE      98      /* Address already in use */
         |         ^~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:89:9: warning: 'EADDRNOTAVAIL' redefined
      89 | #define EADDRNOTAVAIL   227     /* Cannot assign requested address */
         |         ^~~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:82:9: note: this is the location of the previous definition
      82 | #define EADDRNOTAVAIL   99      /* Cannot assign requested address */
         |         ^~~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:90:9: warning: 'ENETDOWN' redefined
      90 | #define ENETDOWN        228     /* Network is down */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:83:9: note: this is the location of the previous definition
      83 | #define ENETDOWN        100     /* Network is down */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:91:9: warning: 'ENETUNREACH' redefined
      91 | #define ENETUNREACH     229     /* Network is unreachable */
         |         ^~~~~~~~~~~
   include/uapi/asm-generic/errno.h:84:9: note: this is the location of the previous definition
      84 | #define ENETUNREACH     101     /* Network is unreachable */
         |         ^~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:92:9: warning: 'ENETRESET' redefined
      92 | #define ENETRESET       230     /* Network dropped connection because of reset */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:85:9: note: this is the location of the previous definition
      85 | #define ENETRESET       102     /* Network dropped connection because of reset */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:93:9: warning: 'ECONNABORTED' redefined
      93 | #define ECONNABORTED    231     /* Software caused connection abort */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:86:9: note: this is the location of the previous definition
      86 | #define ECONNABORTED    103     /* Software caused connection abort */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:94:9: warning: 'ECONNRESET' redefined
      94 | #define ECONNRESET      232     /* Connection reset by peer */
         |         ^~~~~~~~~~
   include/uapi/asm-generic/errno.h:87:9: note: this is the location of the previous definition
      87 | #define ECONNRESET      104     /* Connection reset by peer */
         |         ^~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:95:9: warning: 'ENOBUFS' redefined
      95 | #define ENOBUFS         233     /* No buffer space available */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:88:9: note: this is the location of the previous definition
      88 | #define ENOBUFS         105     /* No buffer space available */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:96:9: warning: 'EISCONN' redefined
      96 | #define EISCONN         234     /* Transport endpoint is already connected */
         |         ^~~~~~~
   include/uapi/asm-generic/errno.h:89:9: note: this is the location of the previous definition
      89 | #define EISCONN         106     /* Transport endpoint is already connected */
         |         ^~~~~~~
   arch/parisc/include/uapi/asm/errno.h:97:9: warning: 'ENOTCONN' redefined
      97 | #define ENOTCONN        235     /* Transport endpoint is not connected */
         |         ^~~~~~~~
   include/uapi/asm-generic/errno.h:90:9: note: this is the location of the previous definition
      90 | #define ENOTCONN        107     /* Transport endpoint is not connected */
         |         ^~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:98:9: warning: 'ESHUTDOWN' redefined
      98 | #define ESHUTDOWN       236     /* Cannot send after transport endpoint shutdown */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:91:9: note: this is the location of the previous definition
      91 | #define ESHUTDOWN       108     /* Cannot send after transport endpoint shutdown */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:99:9: warning: 'ETOOMANYREFS' redefined
      99 | #define ETOOMANYREFS    237     /* Too many references: cannot splice */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:92:9: note: this is the location of the previous definition
      92 | #define ETOOMANYREFS    109     /* Too many references: cannot splice */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:100:9: warning: 'ETIMEDOUT' redefined
     100 | #define ETIMEDOUT       238     /* Connection timed out */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:93:9: note: this is the location of the previous definition
      93 | #define ETIMEDOUT       110     /* Connection timed out */
         |         ^~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:101:9: warning: 'ECONNREFUSED' redefined
     101 | #define ECONNREFUSED    239     /* Connection refused */
         |         ^~~~~~~~~~~~
   include/uapi/asm-generic/errno.h:94:9: note: this is the location of the previous definition
      94 | #define ECONNREFUSED    111     /* Connection refused */
         |         ^~~~~~~~~~~~
   arch/parisc/include/uapi/asm/errno.h:103:9: warning: 'EHOSTDOWN' redefined
     103 | #define EHOSTDOWN       241     /* Host is down */
         |         ^~~~~~~~~
   include/uapi/asm-generic/errno.h:95:9: note: this is the location of the previous definition
      95 | #define EHOSTDOWN       112     /* Host is down */


vim +/EIDRM +8 arch/parisc/include/uapi/asm/errno.h

^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16    6  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16    7  #define	ENOMSG		35	/* No message of desired type */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   @8  #define	EIDRM		36	/* Identifier removed */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16    9  #define	ECHRNG		37	/* Channel number out of range */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @10  #define	EL2NSYNC	38	/* Level 2 not synchronized */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   11  #define	EL3HLT		39	/* Level 3 halted */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   12  #define	EL3RST		40	/* Level 3 reset */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   13  #define	ELNRNG		41	/* Link number out of range */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   14  #define	EUNATCH		42	/* Protocol driver not attached */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   15  #define	ENOCSI		43	/* No CSI structure available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   16  #define	EL2HLT		44	/* Level 2 halted */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @17  #define	EDEADLK		45	/* Resource deadlock would occur */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   18  #define	EDEADLOCK	EDEADLK
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   19  #define	ENOLCK		46	/* No record locks available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @20  #define	EILSEQ		47	/* Illegal byte sequence */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   21  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   22  #define	ENONET		50	/* Machine is not on the network */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   23  #define	ENODATA		51	/* No data available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   24  #define	ETIME		52	/* Timer expired */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   25  #define	ENOSR		53	/* Out of streams resources */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   26  #define	ENOSTR		54	/* Device not a stream */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   27  #define	ENOPKG		55	/* Package not installed */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   28  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   29  #define	ENOLINK		57	/* Link has been severed */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   30  #define	EADV		58	/* Advertise error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   31  #define	ESRMNT		59	/* Srmount error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   32  #define	ECOMM		60	/* Communication error on send */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   33  #define	EPROTO		61	/* Protocol error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   34  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @35  #define	EMULTIHOP	64	/* Multihop attempted */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   36  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   37  #define	EDOTDOT		66	/* RFS specific error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @38  #define	EBADMSG		67	/* Not a data message */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @39  #define	EUSERS		68	/* Too many users */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   40  #define	EDQUOT		69	/* Quota exceeded */
0ca43435188b9f9 arch/parisc/include/uapi/asm/errno.h Eric Sandeen        2013-11-12   41  #define	ESTALE		70	/* Stale file handle */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   42  #define	EREMOTE		71	/* Object is remote */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   43  #define	EOVERFLOW	72	/* Value too large for defined data type */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   44  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   45  /* these errnos are defined by Linux but not HPUX. */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   46  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   47  #define	EBADE		160	/* Invalid exchange */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   48  #define	EBADR		161	/* Invalid request descriptor */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @49  #define	EXFULL		162	/* Exchange full */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   50  #define	ENOANO		163	/* No anode */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @51  #define	EBADRQC		164	/* Invalid request code */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   52  #define	EBADSLT		165	/* Invalid slot */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   53  #define	EBFONT		166	/* Bad font file format */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   54  #define	ENOTUNIQ	167	/* Name not unique on network */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   55  #define	EBADFD		168	/* File descriptor in bad state */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @56  #define	EREMCHG		169	/* Remote address changed */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   57  #define	ELIBACC		170	/* Can not access a needed shared library */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @58  #define	ELIBBAD		171	/* Accessing a corrupted shared library */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @59  #define	ELIBSCN		172	/* .lib section in a.out corrupted */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   60  #define	ELIBMAX		173	/* Attempting to link in too many shared libraries */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @61  #define	ELIBEXEC	174	/* Cannot exec a shared library directly */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @62  #define	ERESTART	175	/* Interrupted system call should be restarted */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   63  #define	ESTRPIPE	176	/* Streams pipe error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   64  #define	EUCLEAN		177	/* Structure needs cleaning */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   65  #define	ENOTNAM		178	/* Not a XENIX named type file */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   66  #define	ENAVAIL		179	/* No XENIX semaphores available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   67  #define	EISNAM		180	/* Is a named type file */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @68  #define	EREMOTEIO	181	/* Remote I/O error */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   69  #define	ENOMEDIUM	182	/* No medium found */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @70  #define	EMEDIUMTYPE	183	/* Wrong medium type */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   71  #define	ENOKEY		184	/* Required key not available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @72  #define	EKEYEXPIRED	185	/* Key has expired */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   73  #define	EKEYREVOKED	186	/* Key has been revoked */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   74  #define	EKEYREJECTED	187	/* Key was rejected by service */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   75  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   76  /* We now return you to your regularly scheduled HPUX. */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   77  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   78  #define	ENOTSOCK	216	/* Socket operation on non-socket */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @79  #define	EDESTADDRREQ	217	/* Destination address required */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   80  #define	EMSGSIZE	218	/* Message too long */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   81  #define	EPROTOTYPE	219	/* Protocol wrong type for socket */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   82  #define	ENOPROTOOPT	220	/* Protocol not available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   83  #define	EPROTONOSUPPORT	221	/* Protocol not supported */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @84  #define	ESOCKTNOSUPPORT	222	/* Socket type not supported */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   85  #define	EOPNOTSUPP	223	/* Operation not supported on transport endpoint */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @86  #define	EPFNOSUPPORT	224	/* Protocol family not supported */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @87  #define	EAFNOSUPPORT	225	/* Address family not supported by protocol */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @88  #define	EADDRINUSE	226	/* Address already in use */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   89  #define	EADDRNOTAVAIL	227	/* Cannot assign requested address */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @90  #define	ENETDOWN	228	/* Network is down */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @91  #define	ENETUNREACH	229	/* Network is unreachable */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   92  #define	ENETRESET	230	/* Network dropped connection because of reset */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @93  #define	ECONNABORTED	231	/* Software caused connection abort */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   94  #define	ECONNRESET	232	/* Connection reset by peer */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @95  #define	ENOBUFS		233	/* No buffer space available */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @96  #define	EISCONN		234	/* Transport endpoint is already connected */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   97  #define	ENOTCONN	235	/* Transport endpoint is not connected */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16   98  #define	ESHUTDOWN	236	/* Cannot send after transport endpoint shutdown */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  @99  #define	ETOOMANYREFS	237	/* Too many references: cannot splice */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16 @100  #define	ETIMEDOUT	238	/* Connection timed out */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  101  #define	ECONNREFUSED	239	/* Connection refused */
3eb53b20d7bd137 arch/parisc/include/uapi/asm/errno.h Helge Deller        2016-08-20  102  #define	EREFUSED	ECONNREFUSED	/* for HP's NFS apparently */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  103  #define	EHOSTDOWN	241	/* Host is down */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  104  #define	EHOSTUNREACH	242	/* No route to host */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  105  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16 @106  #define	EALREADY	244	/* Operation already in progress */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16 @107  #define	EINPROGRESS	245	/* Operation now in progress */
f5a408d53edef3a arch/parisc/include/uapi/asm/errno.h Guy Martin          2014-01-16  108  #define	EWOULDBLOCK	EAGAIN	/* Operation would block (Not HPUX compliant) */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  109  #define	ENOTEMPTY	247	/* Directory not empty */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  110  #define	ENAMETOOLONG	248	/* File name too long */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  111  #define	ELOOP		249	/* Too many symbolic links encountered */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  112  #define	ENOSYS		251	/* Function not implemented */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  113  
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  114  #define ECANCELLED	253	/* aio request was canceled before complete (POSIX.4 / HPUX) */
05aa10de701409b include/asm-parisc/errno.h           Grant Grundler      2005-10-21  115  #define ECANCELED	ECANCELLED	/* SuSv3 and Solaris wants one 'L' */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  116  
4750e2c0c59e0c8 include/asm-parisc/errno.h           Joe Korty           2005-05-01  117  /* for robust mutexes */
4750e2c0c59e0c8 include/asm-parisc/errno.h           Joe Korty           2005-05-01  118  #define EOWNERDEAD	254	/* Owner died */
4750e2c0c59e0c8 include/asm-parisc/errno.h           Joe Korty           2005-05-01 @119  #define ENOTRECOVERABLE	255	/* State not recoverable */
4750e2c0c59e0c8 include/asm-parisc/errno.h           Joe Korty           2005-05-01  120  
7d217d7ffc3433d arch/parisc/include/asm/errno.h      Alexander Beregalov 2009-06-07 @121  #define	ERFKILL		256	/* Operation not possible due to RF-kill */
^1da177e4c3f415 include/asm-parisc/errno.h           Linus Torvalds      2005-04-16  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


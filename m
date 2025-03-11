Return-Path: <linux-media+bounces-27990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D529A5B896
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 06:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3121719BD
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 05:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE911EDA1C;
	Tue, 11 Mar 2025 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5UilIcI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A464629A1
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 05:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741671680; cv=none; b=ThRdW2Q9Uer3GXsC0VmV89i5+c4nwF7uhkqcSUmBYtZX5j11rMv8mlBPkhTCKM0Ut8JXdYirKlCe7epfN2+yCHholfj1+vTP3QAVEzHXAdr7ljgFKOi4X3GNaNyyUSEuEv4R1KfiK7N9i2O4NVdbQpEEQAqTmzfgz59GzP9gX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741671680; c=relaxed/simple;
	bh=6tjxFppPYaEsS8BZAj64TQI4B9pWItT6hLhECz/hQMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYiakvCpmCHdswRfpeYaBM8MmrDuv2cOwMn2wG8nM7mnyESp6turQit0/cB5NnAXqQm1UhsfIwU8o2H7OzX7JFzBcIKUHnCfr9LLl1y/fi0HBNvEhqOwSU+FJ5aIxcUj+Ho0cSNhRrS7Y8aZbj7kG2IBKjBYGJEEQlVNqtoGZYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5UilIcI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741671679; x=1773207679;
  h=date:from:to:cc:subject:message-id;
  bh=6tjxFppPYaEsS8BZAj64TQI4B9pWItT6hLhECz/hQMY=;
  b=M5UilIcIQFQgryisNasj0v433umLiAaJxFJt+71rjMFN75EgSHVz2mbH
   9Sv0WIFKPkuwrJkM03nOj62PqU+e6Bth/SWDfdOv8Mvl28F+nr9E5QyCi
   3iJm+MjDFAw+kv0Ulkt5c+Pn+urG8xeoz+u1RPRpBVxoHVZp410pTHRmF
   qUUuFjl9nw0ma6LDlDy5RkvAsgZ81osDN7Ut3VjBYjoAwbPnzWNuj35kE
   pK8qNZSXR+GQVKrkCAvoPxY47VRckUsCWuHV5cunTo2FuAgO6+lWUVuAl
   bGkQULmlWt8sa/P2DJLPSP0KOK1k9icz7TkyudIOKH4JfQ2F9ISAEF+LB
   w==;
X-CSE-ConnectionGUID: EEGDE4H7Tfi3yCpddB1xag==
X-CSE-MsgGUID: nH/u87D0SKa0/9HsRINAIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53682186"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="53682186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 22:41:18 -0700
X-CSE-ConnectionGUID: AvMVAMTTSWekoVVZQs6Z9A==
X-CSE-MsgGUID: a+vSsv3zR5iWSvTjEkrgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120691339"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2025 22:41:17 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trsMc-0006OW-1l;
	Tue, 11 Mar 2025 05:41:14 +0000
Date: Tue, 11 Mar 2025 13:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [sailus-media-tree:devel] BUILD REGRESSION
 07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2
Message-ID: <202503111314.8RNnkTia-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

tree/branch: git://linuxtv.org/sailus/media_tree.git devel
branch HEAD: 07e07f2cd3ebb7e8b62ccb8f22a16032b599c9e2  media: stm32-dcmi: use devm_kmemdup_array()

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202503102326.NA0KFO8t-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503110007.KgiJLedM-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503110526.P3GrQ20d-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503110545.xrh6sBcJ-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503110853.F2zqgdx0-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202503110923.hRugQG84-lkp@intel.com

    drivers/media/platform/atmel/atmel-isi.c:1075:20: error: incompatible integer to pointer conversion assigning to 'const struct isi_format **' from 'int' [-Wint-conversion]
    drivers/media/platform/atmel/atmel-isi.c:1075:22: error: call to undeclared function 'devm_kmemdup_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/media/platform/atmel/atmel-isi.c:1075:27: error: assignment to 'const struct isi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/media/platform/atmel/atmel-isi.c:1075:27: warning: assignment to 'const struct isi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/media/platform/atmel/atmel-isi.c:1075:29: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Wimplicit-function-declaration]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1685:19: error: incompatible integer to pointer conversion assigning to 'const struct dcmi_format **' from 'int' [-Wint-conversion]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1685:21: error: call to undeclared function 'devm_kmemdup_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1685:26: error: assignment to 'const struct dcmi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1685:26: warning: assignment to 'const struct dcmi_format **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    drivers/media/platform/st/stm32/stm32-dcmi.c:1685:28: error: implicit declaration of function 'devm_kmemdup_array'; did you mean 'devm_kmalloc_array'? [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- alpha-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- arc-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- arc-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-atmel-atmel-isi.c:warning:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:warning:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|-- arm-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- arm-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- hexagon-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-isi_format-from-int
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-dcmi_format-from-int
|-- i386-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-atmel-atmel-isi.c:warning:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- i386-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-atmel-atmel-isi.c:warning:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:warning:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|-- loongarch-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- m68k-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- m68k-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- openrisc-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- parisc-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- parisc-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- s390-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- sh-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- sh-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- sparc-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- sparc-randconfig-001-20250310
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:assignment-to-const-struct-dcmi_format-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- um-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- x86_64-allmodconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-isi_format-from-int
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-dcmi_format-from-int
|-- x86_64-allyesconfig
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-isi_format-from-int
|   |-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:call-to-undeclared-function-devm_kmemdup_array-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:incompatible-integer-to-pointer-conversion-assigning-to-const-struct-dcmi_format-from-int
|-- x86_64-buildonly-randconfig-001-20250310
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|-- x86_64-buildonly-randconfig-006-20250310
|   |-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array
|   `-- drivers-media-platform-st-stm32-stm32-dcmi.c:error:implicit-declaration-of-function-devm_kmemdup_array
`-- xtensa-randconfig-002-20250310
    |-- drivers-media-platform-atmel-atmel-isi.c:error:assignment-to-const-struct-isi_format-from-int-makes-pointer-from-integer-without-a-cast
    `-- drivers-media-platform-atmel-atmel-isi.c:error:implicit-declaration-of-function-devm_kmemdup_array

elapsed time: 1092m

configs tested: 107
configs skipped: 9

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250310    gcc-13.2.0
arc                   randconfig-002-20250310    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250310    clang-21
arm                   randconfig-002-20250310    gcc-14.2.0
arm                   randconfig-003-20250310    gcc-14.2.0
arm                   randconfig-004-20250310    clang-21
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250310    clang-19
arm64                 randconfig-002-20250310    clang-17
arm64                 randconfig-003-20250310    clang-15
arm64                 randconfig-004-20250310    clang-17
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250310    gcc-14.2.0
csky                  randconfig-002-20250310    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250310    clang-21
hexagon               randconfig-002-20250310    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250310    clang-19
i386        buildonly-randconfig-002-20250310    clang-19
i386        buildonly-randconfig-003-20250310    clang-19
i386        buildonly-randconfig-004-20250310    clang-19
i386        buildonly-randconfig-005-20250310    clang-19
i386        buildonly-randconfig-006-20250310    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250310    gcc-14.2.0
loongarch             randconfig-002-20250310    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250310    gcc-14.2.0
nios2                 randconfig-002-20250310    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250310    gcc-14.2.0
parisc                randconfig-002-20250310    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250310    clang-17
powerpc               randconfig-002-20250310    clang-21
powerpc               randconfig-003-20250310    clang-17
powerpc64             randconfig-001-20250310    gcc-14.2.0
powerpc64             randconfig-002-20250310    gcc-14.2.0
powerpc64             randconfig-003-20250310    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250310    clang-19
riscv                 randconfig-002-20250310    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250310    gcc-14.2.0
s390                  randconfig-002-20250310    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250310    gcc-14.2.0
sh                    randconfig-002-20250310    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250310    gcc-14.2.0
sparc                 randconfig-002-20250310    gcc-14.2.0
sparc64               randconfig-001-20250310    gcc-14.2.0
sparc64               randconfig-002-20250310    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250310    gcc-12
um                    randconfig-002-20250310    clang-17
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250310    gcc-12
x86_64      buildonly-randconfig-002-20250310    clang-19
x86_64      buildonly-randconfig-003-20250310    clang-19
x86_64      buildonly-randconfig-004-20250310    clang-19
x86_64      buildonly-randconfig-005-20250310    clang-19
x86_64      buildonly-randconfig-006-20250310    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250310    gcc-14.2.0
xtensa                randconfig-002-20250310    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


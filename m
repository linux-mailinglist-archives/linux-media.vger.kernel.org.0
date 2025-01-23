Return-Path: <linux-media+bounces-25174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A2EA19CF0
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 03:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E17D188DEEA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 02:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB620B22;
	Thu, 23 Jan 2025 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j347b9I4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883F6DDD3;
	Thu, 23 Jan 2025 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737598854; cv=none; b=WypM0uEzm+wOcQFQXsGvf5LgJlgQUxt9uoPwqpVv3UCm9ejJdVuLkG2K+Xc9HWP3Of2ws4Vm+QvdF2n/ypire9LcMWcX1iov6gBmvarAb86d+92f+kn5iyGZAUFxLwBZKu8LpNepe7YKTmbFqPoiTAeZ/52GYNHAw8DYpVnSiPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737598854; c=relaxed/simple;
	bh=l/StfvmlLCHjYY/yKMI2jnYQai+YQWNw/5zxejp8VnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0u3G2wO9E09hBiao9toHQDHUA9gd4HJSQc34sKA/5KTrw3GvdfN+i9VVNByT6ahbipLKCIHfMAmyYF9gzO37gDp5noDqlS2CCqrcn6tJdQfgeE8EIn0DONXCNUjAkCW5ajV8xMlWJRwMg/BvHNQCBwoxvHG4MfatrJEHJvF/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j347b9I4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737598851; x=1769134851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/StfvmlLCHjYY/yKMI2jnYQai+YQWNw/5zxejp8VnM=;
  b=j347b9I4RPTACDvDmMCCIw85Quw/o5wkgzBPGkb6ZFQqF21aNjk2R/bw
   PhVfBSDYETjAd2/HpXVJuiAqd5z4wt9vpUwFZANKxRaPhoZVuo7Jda97z
   H8WdX88wZxJeJ5xHbgdg0OyBLkK/L6UMMtm61UpN8KVcm80kvL/1vJDEH
   z85h6LcpwS+xfoqt+S6rijDaKCTXcSEZWakZwa8oAa3VL/kRFzHghHUy7
   Za7rbMRydC2adaylz7Crt+AMYbDix8v3VYlOecwWAZJVIci1EzE5WaY1f
   wTrYFwnxoN9YdEfPQ3kSZVjdg0TK2ne0APUMJqRyTi6KAom1jMrlS2D91
   g==;
X-CSE-ConnectionGUID: +g1DupCeRhKClD38eoXTGQ==
X-CSE-MsgGUID: 7IF7sCOPTROSiIgPdL6HEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40909798"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="40909798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 18:20:50 -0800
X-CSE-ConnectionGUID: 3n85Ta0JSaqGOmkesv0Qcw==
X-CSE-MsgGUID: UWPh49TsQsiTplxHLgQS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112433445"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jan 2025 18:20:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tampo-000aYJ-11;
	Thu, 23 Jan 2025 02:20:44 +0000
Date: Thu, 23 Jan 2025 10:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <gnurou@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Albert Esteve <aesteve@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	gurchetansingh@google.com, daniel.almeida@collabora.com,
	changyeon@google.com, nicolas.dufresne@collabora.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	Alexandre Courbot <acourbot@google.com>
Subject: Re: [PATCH] media: add virtio-media driver
Message-ID: <202501231055.JvzBf96Y-lkp@intel.com>
References: <20250123-virtio-media-v1-1-81e2549b86b9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-virtio-media-v1-1-81e2549b86b9@gmail.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/media-add-virtio-media-driver/20250123-085559
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250123-virtio-media-v1-1-81e2549b86b9%40gmail.com
patch subject: [PATCH] media: add virtio-media driver
reproduce: (https://download.01.org/0day-ci/archive/20250123/202501231055.JvzBf96Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231055.JvzBf96Y-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-19/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/virtio/virtio_media_driver.c: 22 linux/version.h not needed.
   ./drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: 13 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 424: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


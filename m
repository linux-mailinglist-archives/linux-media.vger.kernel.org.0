Return-Path: <linux-media+bounces-45836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A3C15492
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 15:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87BE62601F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2136D33EAFE;
	Tue, 28 Oct 2025 14:49:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE8339B5E;
	Tue, 28 Oct 2025 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662993; cv=none; b=SS5BnHrUiPs26synk0GYX/Pzhz9gDSY5zVwwaXUQ4paGQa6vY7Z5hPg7ic7L5tcX1ZT8C5V+N8WMIUcwH/xwmSfpffJU2UdKD35ywl8veXLOx5zAnyr6/rGVC5biYIA6p4vkkonsxoE2wOW6ZQwpBoKoPW34IrUkDOftX+SvLMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662993; c=relaxed/simple;
	bh=I4DvcByX8SqwCnhS01VKz1RzKekob4iCVxHc1g6GETQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CR7AeYF9moF/FCIWucGqRmgrCw7ItSMSjrWergCgzSfJniW9eA063vdrSB5l5UTWyMm1m5AE90PHsrnTtVk/bGakt3Ai3GF6Q0e5oh+RHqXDdeT1ahZQqyQ79fLeXoL9IIUUFNY7p7Lw4j4f2xAbqr8QWpqj/9x82IWcL43mZUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cwtVM24X9z6HJc8;
	Tue, 28 Oct 2025 22:46:19 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 540E01400C8;
	Tue, 28 Oct 2025 22:49:49 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 28 Oct
 2025 14:49:48 +0000
Date: Tue, 28 Oct 2025 14:49:46 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: kernel test robot <lkp@intel.com>
CC: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	<linux-cxl@vger.kernel.org>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, "Borislav
 Petkov" <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <linux-media@vger.kernel.org>, Shuai Xue
	<xueshuai@linux.alibaba.com>, Davidlohr Bueso <dave@stgolabs.net>, "Dave
 Jiang" <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, "Ira Weiny" <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, Mahesh J Salgaonkar
	<mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas
	<helgaas@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan
	<tanxiaofei@huawei.com>, "Mario Limonciello" <mario.limonciello@amd.com>,
	Huacai Chen <chenhuacai@kernel.org>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Arnd Bergmann <arnd@arndb.de>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, "Guo
 Weikang" <guoweikang.kernel@gmail.com>, Xin Li <xin@zytor.com>
Subject: Re: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Message-ID: <20251028144946.000063c4@huawei.com>
In-Reply-To: <202510232204.7aYBpl7h-lkp@intel.com>
References: <20251023122612.1326748-4-fabio.m.de.francesco@linux.intel.com>
	<202510232204.7aYBpl7h-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Thu, 23 Oct 2025 22:56:02 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Fabio,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 552c50713f273b494ac6c77052032a49bc9255e2]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251023-202846
> base:   552c50713f273b494ac6c77052032a49bc9255e2
> patch link:    https://lore.kernel.org/r/20251023122612.1326748-4-fabio.m.de.francesco%40linux.intel.com
> patch subject: [PATCH 3/6 v6] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
> config: x86_64-buildonly-randconfig-001-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232204.7aYBpl7h-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232204.7aYBpl7h-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510232204.7aYBpl7h-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: cper_severity_to_aer  
>    >>> referenced by ghes.c:626 (drivers/acpi/apei/ghes.c:626)
>    >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a
>    >>> referenced by ghes.c:753 (drivers/acpi/apei/ghes.c:753)
>    >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a  
> --
> >> ld.lld: error: undefined symbol: aer_recover_queue  
>    >>> referenced by ghes.c:642 (drivers/acpi/apei/ghes.c:642)
>    >>>               drivers/acpi/apei/ghes.o:(ghes_do_proc) in archive vmlinux.a  
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for ACPI_APEI_PCIEAER
>    Depends on [n]: ACPI [=y] && ACPI_APEI [=y] && PCIEAER [=n]
>    Selected by [y]:
>    - ACPI_APEI_GHES [=y] && ACPI [=y] && ACPI_APEI [=y]
> 
Ah. The old classic of selects not being recursive.  You'll need to select
PCIEAER as well I think.



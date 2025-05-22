Return-Path: <linux-media+bounces-33160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644EAC0F2B
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05C711768F5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC89B28C875;
	Thu, 22 May 2025 14:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7pGBret"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C6323D291;
	Thu, 22 May 2025 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925974; cv=none; b=UkpX+s0KlUjE3lgK5ToPqRhUiSN2cytS/oX859Sdf5iHvFwDi/hPu1Td0bcmX6HDOADx00W1yfvPj72LdmpnFfwnON10YCEjIG/WsCO8qxLtIP2QJSa+9kxJjVADwnyuOSD4rhQv7Kne4mpX/FWf6YvIbeDOUeZaWEH0X0ZaeSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925974; c=relaxed/simple;
	bh=/HSY2bf7+CxdE8PnNA5ED4snO+PBqUNqJ8eFlqZfjRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oawDHiLrFEiAu5FC+FNpzg3uEYFKmZ6/LPY2rX0sh4dbAp35yB1jtKEPKqwGgrpkKrkHXhD20NZbwVAsIE9LrqizqIFJTs8TVfukgypoKuZZQBn/ZP9I8dng0lgLiVH8uw2olgM+pd+GA7FQWCDyQVDvT3dah30EqIYtGO7XsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7pGBret; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747925971; x=1779461971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/HSY2bf7+CxdE8PnNA5ED4snO+PBqUNqJ8eFlqZfjRc=;
  b=P7pGBretSxAH9R3VSHfPJ1rIXVD1xakhs2iw85ou77vNnSuOokA22pYY
   qoz/fJixMPmmSZW64647XoGE7VAC+yfTDtUiiftwBCQorn+v+UrOnEA8b
   VHDnj/OqTrPrOijpQjYSLvy+1OeG51iXG0Gx1T9ZXLuiV48e9LOZsDiVk
   573bhQd91PZry8uRiIUnem9qhyNETmozQVOCTcQnDiFDXXS4g6lBP39aU
   Xt67RDKn7Kjqp56Aeb7B/TPC/zSNccDNXGOCS3WRYgioWhQw4vJ+E1ON+
   4ya2aNB0Qj2w/2ZaLaIdNe7Bnb2ukcOPnE5Kx4PW4f0hIZn/kbUeRZ0NO
   A==;
X-CSE-ConnectionGUID: SdeC65yAStmgajI+2BG3xw==
X-CSE-MsgGUID: dbXzlOg5SwSZM+xUKijSkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50062782"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50062782"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:59:30 -0700
X-CSE-ConnectionGUID: 7vUoS313Tk64RjsxT56Daw==
X-CSE-MsgGUID: 8x9pIxiMS7OM2vjeOjAwYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="141147652"
Received: from tjmaciei-mobl5.ger.corp.intel.com (HELO [10.125.109.122]) ([10.125.109.122])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:59:28 -0700
Message-ID: <7310ef0a-44f9-44ae-9aee-3f2e07f93573@intel.com>
Date: Thu, 22 May 2025 07:59:26 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
To: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>,
 mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
 sebastian.fricke@collabora.com, hljunggr@cisco.com, jgg@ziepe.ca,
 saeedm@nvidia.com, Jonathan.Cameron@huawei.com, corbet@lwn.net,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com, W_Armin@gmx.de,
 mpearson-lenovo@squebb.ca, skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250522115255.137450-3-hannelotta@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/22/25 4:52 AM, Hanne-Lotta Mäenpää wrote:
> Fix typos and improve grammar in the documentation for
> fwctl subsystem.
> 
> Use the word user space consistently, instead of having
> two variants (user space vs. userspace).
> 
> Change wording of denied behaviour to be disallowed
> behaviour when describing the interface.
> 
> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
> 
> Notes:
>     v1 -> v2: No changes
> 
>  Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/userspace-api/fwctl/fwctl.rst
> index fdcfe418a83f..a74eab8d14c6 100644
> --- a/Documentation/userspace-api/fwctl/fwctl.rst
> +++ b/Documentation/userspace-api/fwctl/fwctl.rst
> @@ -54,7 +54,7 @@ operated by the block layer but also comes with a set of RPCs to administer the
>  construction of drives within the HW RAID.
>  
>  In the past when devices were more single function, individual subsystems would
> -grow different approaches to solving some of these common problems. For instance
> +grow different approaches to solving some of these common problems. For instance,
>  monitoring device health, manipulating its FLASH, debugging the FW,
>  provisioning, all have various unique interfaces across the kernel.
>  
> @@ -87,7 +87,7 @@ device today may broadly have several function-level scopes:
>   3. Multiple VM functions tightly scoped within the VM
>  
>  The device may create a logical parent/child relationship between these scopes.
> -For instance a child VM's FW may be within the scope of the hypervisor FW. It is
> +For instance, a child VM's FW may be within the scope of the hypervisor FW. It is
>  quite common in the VFIO world that the hypervisor environment has a complex
>  provisioning/profiling/configuration responsibility for the function VFIO
>  assigns to the VM.
> @@ -105,19 +105,19 @@ some general scopes of action (see enum fwctl_rpc_scope):
>  
>   3. Write access to function & child debug information strictly compatible with
>      the principles of kernel lockdown and kernel integrity protection. Triggers
> -    a kernel Taint.
> +    a kernel taint.
>  
> - 4. Full debug device access. Triggers a kernel Taint, requires CAP_SYS_RAWIO.
> + 4. Full debug device access. Triggers a kernel taint, requires CAP_SYS_RAWIO.
>  
>  User space will provide a scope label on each RPC and the kernel must enforce the
>  above CAPs and taints based on that scope. A combination of kernel and FW can
>  enforce that RPCs are placed in the correct scope by user space.
>  
> -Denied behavior
> ----------------
> +Disallowed behavior
> +-------------------
>  
>  There are many things this interface must not allow user space to do (without a
> -Taint or CAP), broadly derived from the principles of kernel lockdown. Some
> +taint or CAP), broadly derived from the principles of kernel lockdown. Some
>  examples:
>  
>   1. DMA to/from arbitrary memory, hang the system, compromise FW integrity with
> @@ -138,8 +138,8 @@ examples:
>  fwctl is not a replacement for device direct access subsystems like uacce or
>  VFIO.
>  
> -Operations exposed through fwctl's non-taining interfaces should be fully
> -sharable with other users of the device. For instance exposing a RPC through
> +Operations exposed through fwctl's non-tainting interfaces should be fully
> +sharable with other users of the device. For instance, exposing a RPC through
>  fwctl should never prevent a kernel subsystem from also concurrently using that
>  same RPC or hardware unit down the road. In such cases fwctl will be less
>  important than proper kernel subsystems that eventually emerge. Mistakes in this
> @@ -225,12 +225,12 @@ subsystems.
>  
>  Each device type must be mindful of Linux's philosophy for stable ABI. The FW
>  RPC interface does not have to meet a strictly stable ABI, but it does need to
> -meet an expectation that userspace tools that are deployed and in significant
> +meet an expectation that user space tools that are deployed and in significant
>  use don't needlessly break. FW upgrade and kernel upgrade should keep widely
>  deployed tooling working.
>  
>  Development and debugging focused RPCs under more permissive scopes can have
> -less stabilitiy if the tools using them are only run under exceptional
> +less stability if the tools using them are only run under exceptional
>  circumstances and not for every day use of the device. Debugging tools may even
>  require exact version matching as they may require something similar to DWARF
>  debug information from the FW binary.
> @@ -261,7 +261,7 @@ Some examples:
>   - HW RAID controllers. This includes RPCs to do things like compose drives into
>     a RAID volume, configure RAID parameters, monitor the HW and more.
>  
> - - Baseboard managers. RPCs for configuring settings in the device and more
> + - Baseboard managers. RPCs for configuring settings in the device and more.
>  
>   - NVMe vendor command capsules. nvme-cli provides access to some monitoring
>     functions that different products have defined, but more exist.
> @@ -269,15 +269,15 @@ Some examples:
>   - CXL also has a NVMe-like vendor command system.
>  
>   - DRM allows user space drivers to send commands to the device via kernel
> -   mediation
> +   mediation.
>  
>   - RDMA allows user space drivers to directly push commands to the device
> -   without kernel involvement
> +   without kernel involvement.
>  
>   - Various “raw” APIs, raw HID (SDL2), raw USB, NVMe Generic Interface, etc.
>  
>  The first 4 are examples of areas that fwctl intends to cover. The latter three
> -are examples of denied behavior as they fully overlap with the primary purpose
> +are examples of disallowed behavior as they fully overlap with the primary purpose
>  of a kernel subsystem.
>  
>  Some key lessons learned from these past efforts are the importance of having a



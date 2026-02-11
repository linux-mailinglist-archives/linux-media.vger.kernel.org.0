Return-Path: <linux-media+bounces-52572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLiYNFk+jGlyjwAAu9opvQ
	(envelope-from <linux-media+bounces-52572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:31:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C9C122416
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12CEC304807C
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 08:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028F634D3AC;
	Wed, 11 Feb 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al/mE+8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F9134D90F;
	Wed, 11 Feb 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798644; cv=none; b=QpboEiciXCtDQiUfZOb7GO6urDEcQu6GMNAeDy1bq4tmcS9TEez8l/txZ6dOwTeGI/HnQKTBHUVm/l3b7exIUH500gs/bQu/hUIxYmLhLUTiPmX/AwQnTI4JJRVvB8AJEj2TgwOmfIhqJvFqWY80B4B0m68A437xoWwJgrc9wSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798644; c=relaxed/simple;
	bh=CfoVRW1RI7FUzJzqIWaXxYcZD5lxnrJKrmr6ifu6dLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzlb3tESkJmyq7OLKzSlB/gAMC8cn70gN97LZEWZrSFSvqB+0QxZiekFfXdtkmxbAHQdoniu1RP2I5eRP7ZZ2o8KTJi3VF9gnF1/Vf3wEbxthxIaadXfKy5BRnElkPgv3NttFnNGC6PPFHhKuICVeUg+GPki7PlpmeeeQHsIv5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al/mE+8K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770798639; x=1802334639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CfoVRW1RI7FUzJzqIWaXxYcZD5lxnrJKrmr6ifu6dLM=;
  b=al/mE+8KCKj7XBwiXskg10B9DLmokK5AHmo88zst77Y+QAiLG3E9twj5
   SjlF1AN6QefBpKXanFQHHI5IbXNBhrhU1teEJaq/bCnZo3rT1T/uToilz
   XbbrWckFH7IgvD0eF9vHBWZFbZQ8aweuBCWxK2hUp0BJq34IIBPUzETAf
   ZHtPXIhcUhP6xMMYQGUxZGy5WyaDTG9maxY/ie2TvflCgBE6avF0ZWsQf
   TEfycbG5LUpUk5GPxBXCZLEJNbxB2OlPaIjFgepAdiUYkNLaGfb2dh3xl
   8eXGKJt5arn3KaKZXGwn4u6jD0TVzeTB3+Sk29HF9FvOnzNU2OUBU+ocA
   Q==;
X-CSE-ConnectionGUID: fFMo0CD+SCOxTCjmcRpmOQ==
X-CSE-MsgGUID: +h6SzNuLRNKHvcTTuEhO4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89529910"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89529910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:30:38 -0800
X-CSE-ConnectionGUID: nvptrLREQ3agWeLe6ptQFg==
X-CSE-MsgGUID: ylAUEGorQdC3rtS4PDUDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249824192"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 00:30:32 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5CE4D121D36;
	Wed, 11 Feb 2026 10:30:48 +0200 (EET)
Date: Wed, 11 Feb 2026 10:30:48 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: toast1599 <swizzguy76@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: ipu7: refine PHY, ABI and add metadata
 support
Message-ID: <aYw-ONMf1jgENDQH@kekkonen.localdomain>
References: <20260209081025.100080-1-swizzguy76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209081025.100080-1-swizzguy76@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52572-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 13C9C122416
X-Rspamd-Action: no action

Hello,

On Mon, Feb 09, 2026 at 01:40:25PM +0530, toast1599 wrote:
> Clean up the IPU7 ISYS driver to meet mainline requirements:
> - Remove 'U' suffixes from register definitions and hex values.
> - Refactor CSI2 PHY to use a hardware variant structure.
> - Correct typos and standardize header guards in firmware ABI.
> - Enable V4L2_CAP_META_CAPTURE and update format loop to allow metadata.
> - Modernize logging by replacing pr_* with dev_* macros.
> 
> Signed-off-by: toast1599 <swizzguy76@gmail.com>

Is that your real name?

> ---
>  drivers/staging/media/ipu7/TODO               |   3 -
>  .../staging/media/ipu7/abi/ipu7_fw_boot_abi.h | 104 +--
>  .../media/ipu7/abi/ipu7_fw_common_abi.h       |  44 +-
>  .../media/ipu7/abi/ipu7_fw_config_abi.h       |   4 +-
>  .../staging/media/ipu7/abi/ipu7_fw_isys_abi.h |  26 +-
>  .../staging/media/ipu7/abi/ipu7_fw_msg_abi.h  |  82 +-
>  .../media/ipu7/abi/ipu7_fw_psys_config_abi.h  |   4 +-
>  .../media/ipu7/abi/ipu7_fw_syscom_abi.h       |   2 +-
>  drivers/staging/media/ipu7/ipu7-boot.c        |  24 +-
>  .../staging/media/ipu7/ipu7-buttress-regs.h   | 732 +++++++++---------
>  drivers/staging/media/ipu7/ipu7-buttress.c    | 340 ++++----
>  drivers/staging/media/ipu7/ipu7-cpd.c         |  16 +-
>  drivers/staging/media/ipu7/ipu7-dma.c         |   8 +-
>  drivers/staging/media/ipu7/ipu7-fw-isys.c     |   6 +-
>  .../staging/media/ipu7/ipu7-isys-csi-phy.c    |  60 +-
>  .../staging/media/ipu7/ipu7-isys-csi-phy.h    |   4 +-
>  .../staging/media/ipu7/ipu7-isys-csi2-regs.h  |  14 +-
>  drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  10 +-
>  drivers/staging/media/ipu7/ipu7-isys-csi2.h   |  10 +-
>  drivers/staging/media/ipu7/ipu7-isys-subdev.c |   4 +-
>  drivers/staging/media/ipu7/ipu7-isys-video.c  |  12 +-
>  drivers/staging/media/ipu7/ipu7-isys-video.h  |   6 +-
>  drivers/staging/media/ipu7/ipu7-isys.c        |  14 +-
>  drivers/staging/media/ipu7/ipu7-isys.h        |  20 +-
>  drivers/staging/media/ipu7/ipu7-mmu.c         |  38 +-
>  drivers/staging/media/ipu7/ipu7-syscom.c      |   4 +-
>  drivers/staging/media/ipu7/ipu7.h             |  24 +-
>  27 files changed, 815 insertions(+), 800 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
> index 7fbc37059..d04a7a3f8 100644
> --- a/drivers/staging/media/ipu7/TODO
> +++ b/drivers/staging/media/ipu7/TODO
> @@ -4,12 +4,10 @@ staging directory.
>  - ABI headers cleanup
>    Cleanup the firmware ABI headers
>  
> -- Add metadata capture support
>    The IPU7 hardware should support metadata capture, but it is not
>    fully verified with IPU7 firmware ABI so far, need to add the metadata
>    capture support.
>  
> -- Refine CSI2 PHY code
>    Refine the ipu7-isys-csi2-phy.c, move the hardware specific variant
>    into structure, clarify and explain the PHY registers to make it more
>    readable.
> @@ -18,7 +16,6 @@ staging directory.
>    Sakari commented much of the driver code is the same than the IPU6 driver.
>    IPU7 driver is expected to work with the common IPU module in future.
>  
> -- Register definition cleanup
>    Cleanup the register definitions - remove some unnecessary definitions
>    remove 'U' suffix for hexadecimal and decimal values and add IPU7 prefix
>    for IPU7 specific registers.
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
> index a1519c4fe..795130a88 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
> @@ -9,13 +9,13 @@
>  #include "ipu7_fw_common_abi.h"
>  #include "ipu7_fw_syscom_abi.h"
>  
> -#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0U)
> -#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1U)
> -#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2U)
> -#define IA_GOFO_FWLOG_SEVERITY_INFO			(3U)
> -#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4U)
> -#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5U)
> -#define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64U)
> +#define IA_GOFO_FWLOG_SEVERITY_CRIT			(0)
> +#define IA_GOFO_FWLOG_SEVERITY_ERROR			(1)
> +#define IA_GOFO_FWLOG_SEVERITY_WARNING			(2)
> +#define IA_GOFO_FWLOG_SEVERITY_INFO			(3)
> +#define IA_GOFO_FWLOG_SEVERITY_DEBUG			(4)
> +#define IA_GOFO_FWLOG_SEVERITY_VERBOSE			(5)
> +#define IA_GOFO_FWLOG_MAX_LOGGER_SOURCES		(64)

Please don't. These numbers should be signed.

>  
>  #define LOGGER_CONFIG_CHANNEL_ENABLE_HWPRINTF_BITMASK	BIT(0)
>  #define LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK	BIT(1)
> @@ -37,22 +37,22 @@ struct ia_gofo_logger_config {
>  
>  #define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP \
>  	((u32)IA_GOFO_FW_BOOT_ID_MAX)
> -#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0U)
> +#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET (0)
>  #define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PS_OFFSET \
>  	((IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_IS_OFFSET) + \
>  	(u32)(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP))
> -#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0U)
> -#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000U / 4U)
> +#define IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_PRIMARY_OFFSET (0)
> +#define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET (0x3000 / 4)
>  #define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
> -	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2U)
> +	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 2)
>  #define IA_GOFO_HKR_HIF_BUTTRESS_FW_BOOT_PARAMS_SECONDARY_OFFSET \
>  	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP)
>  #define IA_GOFO_CCG_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
> -	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
> +	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4)
>  #define IA_GOFO_HKR_IPU_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX \
> -	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4U)
> +	(IA_GOFO_BUTTRESS_FW_BOOT_PARAMS_MAX_REG_IDX_PER_APP * 4)
>  
> -#define IA_GOFO_BOOT_RESERVED_SIZE (58U)
> +#define IA_GOFO_BOOT_RESERVED_SIZE (58)
>  #define IA_GOFO_BOOT_SECONDARY_RESERVED_SIZE (IA_GOFO_BOOT_RESERVED_SIZE)
>  #define IA_GOFO_BOOT_SECONDARY_RESERVED_FIELDS \
>  	(sizeof(ia_gofo_addr_t) + sizeof(ia_gofo_addr_t) + sizeof(u32))
> @@ -75,7 +75,7 @@ enum ia_gofo_boot_uc_tile_frequency_units {
>  };
>  
>  #define IA_GOFO_FW_BOOT_STATE_IS_CRITICAL(boot_state) \
> -	(0xdead0000U == ((boot_state) & 0xffff0000U))
> +	(0xdead0000 == ((boot_state) & 0xffff0000))
>  
>  struct ia_gofo_boot_config {
>  	u32 length;
> @@ -104,35 +104,35 @@ struct ia_gofo_secondary_boot_config {
>  
>  #pragma pack(pop)
>  
> -#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401U
> -#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801U
> -#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802U
> -#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803U
> -#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804U
> -#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805U
> -#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806U
> -#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000U
> -#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010U
> +#define IA_GOFO_WDT_TIMEOUT_ERR			0xdead0401
> +#define IA_GOFO_MEM_FATAL_DME_ERR		0xdead0801
> +#define IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR	0xdead0802
> +#define IA_GOFO_MEM_UNCORRECTABLE_DIRTY_ERR	0xdead0803
> +#define IA_GOFO_MEM_UNCORRECTABLE_DTAG_ERR	0xdead0804
> +#define IA_GOFO_MEM_UNCORRECTABLE_CACHE_ERR	0xdead0805
> +#define IA_GOFO_DOUBLE_EXCEPTION_ERR		0xdead0806
> +#define IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR	0xdead1000
> +#define IA_GOFO_BIST_DATA_INTEGRITY_FAILURE	0xdead1010
>  
>  enum ia_gofo_boot_state {
> -	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000U,
> -	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000U,
> -	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000U,
> -	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010U,
> -	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020U,
> -	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030U,
> -	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100U,
> -	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200U,
> -	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300U,
> -	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301U,
> +	IA_GOFO_FW_BOOT_STATE_SECONDARY_BOOT_CONFIG_READY = 0x57a7b000,
> +	IA_GOFO_FW_BOOT_STATE_UNINIT = 0x57a7e000,
> +	IA_GOFO_FW_BOOT_STATE_STARTING_0 = 0x57a7d000,
> +	IA_GOFO_FW_BOOT_STATE_CACHE_INIT_DONE = 0x57a7d010,
> +	IA_GOFO_FW_BOOT_STATE_MEM_INIT_DONE = 0x57a7d020,
> +	IA_GOFO_FW_BOOT_STATE_STACK_INIT_DONE = 0x57a7d030,
> +	IA_GOFO_FW_BOOT_STATE_EARLY_BOOT_DONE = 0x57a7d100,
> +	IA_GOFO_FW_BOOT_STATE_BOOT_CONFIG_START = 0x57a7d200,
> +	IA_GOFO_FW_BOOT_STATE_QUEUE_INIT_DONE = 0x57a7d300,
> +	IA_GOFO_FW_BOOT_STATE_READY = 0x57a7e100,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_UNSPECIFIED = 0xdead0001,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_PTR = 0xdead0101,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_CFG_VERSION = 0xdead0201,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_MSG_VERSION = 0xdead0301,
>  	IA_GOFO_FW_BOOT_STATE_CRIT_WDT_TIMEOUT = IA_GOFO_WDT_TIMEOUT_ERR,
> -	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501U,
> -	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601U,
> -	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701U,
> +	IA_GOFO_FW_BOOT_STATE_WRONG_DATA_SECTION_UNPACKING = 0xdead0501,
> +	IA_GOFO_FW_BOOT_STATE_WRONG_RO_DATA_SECTION_UNPACKING = 0xdead0601,
> +	IA_GOFO_FW_BOOT_STATE_INVALID_UNTRUSTED_ADDR_MIN = 0xdead0701,
>  	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_FATAL_DME = IA_GOFO_MEM_FATAL_DME_ERR,
>  	IA_GOFO_FW_BOOT_STATE_CRIT_MEM_UNCORRECTABLE_LOCAL =
>  	IA_GOFO_MEM_UNCORRECTABLE_LOCAL_ERR,
> @@ -146,18 +146,18 @@ enum ia_gofo_boot_state {
>  	IA_GOFO_DOUBLE_EXCEPTION_ERR,
>  	IA_GOFO_FW_BOOT_STATE_CRIT_BIST_DMEM_FAULT_DETECTION_ERR =
>  	IA_GOFO_BIST_DMEM_FAULT_DETECTION_ERR,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011U,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_DATA_INTEGRITY_FAILURE = 0xdead1010,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_STACK_CHK_FAILURE = 0xdead1011,
>  	IA_GOFO_FW_BOOT_STATE_CRIT_SYSCOM_CONTEXT_INTEGRITY_FAILURE =
> -	0xdead1012U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014U,
> -	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015U,
> -	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001U,
> -	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200U,
> -	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300U,
> -	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400U,
> -	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500U
> +	0xdead1012,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_MPU_CONFIG_FAILURE = 0xdead1013,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_SHARED_BUFFER_FAILURE = 0xdead1014,
> +	IA_GOFO_FW_BOOT_STATE_CRIT_CMEM_FAILURE = 0xdead1015,
> +	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_CMD = 0x57a7f001,
> +	IA_GOFO_FW_BOOT_STATE_SHUTDOWN_START = 0x57a7e200,
> +	IA_GOFO_FW_BOOT_STATE_INACTIVE = 0x57a7e300,
> +	IA_GOFO_FW_BOOT_HW_CMD_ACK_TIMEOUT = 0x57a7e400,
> +	IA_GOFO_FW_BOOT_SYSTEM_CYCLES_ERROR = 0x57a7e500
>  };
>  
>  #endif
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
> index 7bb6fac58..3ab9da716 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
> @@ -3,15 +3,15 @@
>   * Copyright (C) 2020 - 2025 Intel Corporation
>   */
>  
> -#ifndef IPU7_FW_COMMOM_ABI_H
> -#define IPU7_FW_COMMOM_ABI_H
> +#ifndef IPU7_FW_COMMON_ABI_H
> +#define IPU7_FW_COMMON_ABI_H
>  
>  #include <linux/types.h>
>  
>  #pragma pack(push, 1)
>  typedef u32	ia_gofo_addr_t;
>  
> -#define IA_GOFO_ADDR_NULL	(0U)
> +#define IA_GOFO_ADDR_NULL	(0)
>  
>  struct ia_gofo_version_s {
>  	u8 patch;
> @@ -24,8 +24,8 @@ struct ia_gofo_version_s {
>  	{.major = (major_val), .minor = (minor_val), .subminor = \
>  	(subminor_val), .patch = (patch_val)}
>  
> -#define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3U)
> -#define IA_GOFO_MSG_RESERVED_SIZE		(3U)
> +#define IA_GOFO_MSG_VERSION_LIST_MAX_ENTRIES	(3)
> +#define IA_GOFO_MSG_RESERVED_SIZE		(3)
>  
>  struct ia_gofo_msg_version_list {
>  	u8 num_versions;
> @@ -35,11 +35,11 @@ struct ia_gofo_msg_version_list {
>  
>  #pragma pack(pop)
>  
> -#define TLV_TYPE_PADDING		(0U)
> +#define TLV_TYPE_PADDING		(0)
>  
>  #pragma pack(push, 1)
>  
> -#define IA_GOFO_ABI_BITS_PER_BYTE	(8U)
> +#define IA_GOFO_ABI_BITS_PER_BYTE	(8)
>  
>  struct ia_gofo_tlv_header {
>  	u16 tlv_type;
> @@ -58,10 +58,10 @@ struct ia_gofo_tlv_list {
>  
>  #define IA_GOFO_MODULO(dividend, divisor) ((dividend) % (divisor))
>  
> -#define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
> -#define IA_GOFO_MSG_ERR_OK			(0U)
> -#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffffU)
> -#define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
> +#define IA_GOFO_MSG_ERR_MAX_DETAILS		(4)
> +#define IA_GOFO_MSG_ERR_OK			(0)
> +#define IA_GOFO_MSG_ERR_UNSPECIFED		(0xffffffff)
> +#define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0)
>  #define IA_GOFO_MSG_ERR_IS_OK(err)	(IA_GOFO_MSG_ERR_OK == (err).err_code)
>  
>  #pragma pack(push, 1)
> @@ -73,9 +73,9 @@ struct ia_gofo_msg_err {
>  
>  #pragma pack(pop)
>  
> -#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16U)
> -#define IA_GOFO_MSG_ERR_GROUP_MAX		(31U)
> -#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1U)
> +#define IA_GOFO_MSG_ERR_GROUP_APP_EXT_START	(16)
> +#define IA_GOFO_MSG_ERR_GROUP_MAX		(31)
> +#define IA_GOFO_MSG_ERR_GROUP_INTERNAL_START	(IA_GOFO_MSG_ERR_GROUP_MAX + 1)
>  #define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
>  #define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
>  
> @@ -130,7 +130,7 @@ enum ia_gofo_soc_pbk_instance_id {
>  	IA_GOFO_SOC_PBK_ID_N
>  };
>  
> -#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2U)
> +#define IA_GOFO_MSG_LINK_PBK_MAX_SLOTS	(2)
>  
>  struct ia_gofo_msg_indirect {
>  	struct ia_gofo_msg_header header;
> @@ -141,11 +141,11 @@ struct ia_gofo_msg_indirect {
>  #pragma pack(pop)
>  
>  #pragma pack(push, 1)
> -#define IA_GOFO_MSG_LOG_MAX_PARAMS	(4U)
> -#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0U)
> +#define IA_GOFO_MSG_LOG_MAX_PARAMS	(4)
> +#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MIN	(0)
>  
> -#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095U)
> -#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffffU)
> +#define IA_GOFO_MSG_LOG_DOC_FMT_ID_MAX	(4095)
> +#define IA_GOFO_MSG_LOG_FMT_ID_INVALID	(0xfffffff)
>  
>  struct ia_gofo_msg_log_info {
>  	u16 log_counter;
> @@ -168,8 +168,8 @@ struct ia_gofo_msg_log {
>  
>  #pragma pack(pop)
>  
> -#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0U)
> -#define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1U)
> -#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2U)
> +#define IA_GOFO_MSG_ABI_OUT_ACK_QUEUE_ID	(0)
> +#define IA_GOFO_MSG_ABI_OUT_LOG_QUEUE_ID	(1)
> +#define IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID		(2)
>  
>  #endif
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
> index c3f62aaed..3bbf5417f 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
> @@ -8,8 +8,8 @@
>  
>  #include <linux/types.h>
>  
> -#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0U
> -#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0U
> +#define IPU_CONFIG_ABI_WDT_TIMER_DISABLED	0
> +#define IPU_CONFIG_ABI_CMD_TIMER_DISABLED	0
>  
>  struct ipu7_wdt_abi {
>  	u32 wdt_timer1_us;
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
> index c42d0b7a2..905cf7bd9 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
> @@ -9,26 +9,26 @@
>  #include "ipu7_fw_common_abi.h"
>  #include "ipu7_fw_isys_abi.h"
>  
> -#define IPU_INSYS_MAX_OUTPUT_QUEUES	(3U)
> -#define IPU_INSYS_STREAM_ID_MAX		(16U)
> +#define IPU_INSYS_MAX_OUTPUT_QUEUES	(3)
> +#define IPU_INSYS_STREAM_ID_MAX		(16)
>  
> -#define IPU_INSYS_MAX_INPUT_QUEUES	(IPU_INSYS_STREAM_ID_MAX + 1U)
> -#define IPU_INSYS_OUTPUT_FIRST_QUEUE	(0U)
> -#define IPU_INSYS_OUTPUT_LAST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES - 1U)
> +#define IPU_INSYS_MAX_INPUT_QUEUES	(IPU_INSYS_STREAM_ID_MAX + 1)
> +#define IPU_INSYS_OUTPUT_FIRST_QUEUE	(0)
> +#define IPU_INSYS_OUTPUT_LAST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES - 1)
>  #define IPU_INSYS_OUTPUT_MSG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE)
> -#define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1U)
> +#define IPU_INSYS_OUTPUT_LOG_QUEUE	(IPU_INSYS_OUTPUT_FIRST_QUEUE + 1)
>  #define IPU_INSYS_OUTPUT_RESERVED_QUEUE	(IPU_INSYS_OUTPUT_LAST_QUEUE)
>  #define IPU_INSYS_INPUT_FIRST_QUEUE	(IPU_INSYS_MAX_OUTPUT_QUEUES)
>  #define IPU_INSYS_INPUT_LAST_QUEUE \
> -	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1U)
> +	(IPU_INSYS_INPUT_FIRST_QUEUE + IPU_INSYS_MAX_INPUT_QUEUES - 1)
>  #define IPU_INSYS_INPUT_DEV_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE)
> -#define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1U)
> -#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1U)
> +#define IPU_INSYS_INPUT_MSG_QUEUE	(IPU_INSYS_INPUT_FIRST_QUEUE + 1)
> +#define IPU_INSYS_INPUT_MSG_MAX_QUEUE	(IPU_INSYS_MAX_INPUT_QUEUES - 1)
>  
> -#define MAX_OPINS_FOR_SINGLE_IPINS	(3U)
> +#define MAX_OPINS_FOR_SINGLE_IPINS	(3)
>  #define DEV_SEND_QUEUE_SIZE		(IPU_INSYS_STREAM_ID_MAX)
>  
> -#define PIN_PLANES_MAX			(4U)
> +#define PIN_PLANES_MAX			(4)
>  
>  #define INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES_INPUT \
>  	INSYS_MSG_ERR_STREAM_INSUFFICIENT_RESOURCES
> @@ -138,8 +138,8 @@ enum ipu7_insys_mipi_dt_rename_mode {
>  	N_IPU_INSYS_MIPI_DT_MODE
>  };
>  
> -#define IPU_INSYS_SEND_MSG_ENABLED				1U
> -#define IPU_INSYS_SEND_MSG_DISABLED				0U
> +#define IPU_INSYS_SEND_MSG_ENABLED				1
> +#define IPU_INSYS_SEND_MSG_DISABLED				0
>  
>  #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_SOF			BIT(0)
>  #define IPU_INSYS_STREAM_SYNC_MSG_SEND_RESP_EOF			BIT(1)
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
> index 8a78dd093..35c21ce51 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
> @@ -28,8 +28,8 @@ enum ipu7_msg_type {
>  	IPU_MSG_TYPE_N,
>  };
>  
> -#define IPU_MSG_MAX_NODE_TERMS		(64U)
> -#define IPU_MSG_MAX_FRAGS		(7U)
> +#define IPU_MSG_MAX_NODE_TERMS		(64)
> +#define IPU_MSG_MAX_FRAGS		(7)
>  
>  enum ipu7_msg_node_type {
>  	IPU_MSG_NODE_TYPE_PAD = 0,
> @@ -37,14 +37,14 @@ enum ipu7_msg_node_type {
>  	IPU_MSG_NODE_TYPE_N
>  };
>  
> -#define IPU_MSG_NODE_MAX_DEVICES	(128U)
> -#define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8U))
> +#define IPU_MSG_NODE_MAX_DEVICES	(128)
> +#define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8))
>  
>  typedef u32 ipu7_msg_teb_t[2];
>  typedef u32 ipu7_msg_deb_t[DEB_NUM_UINT32];
>  
> -#define IPU_MSG_NODE_MAX_ROUTE_ENABLES	(128U)
> -#define RBM_NUM_UINT32	(IPU_MSG_NODE_MAX_ROUTE_ENABLES / (sizeof(u32) * 8U))
> +#define IPU_MSG_NODE_MAX_ROUTE_ENABLES	(128)
> +#define RBM_NUM_UINT32	(IPU_MSG_NODE_MAX_ROUTE_ENABLES / (sizeof(u32) * 8))
>  
>  typedef u32 ipu7_msg_rbm_t[RBM_NUM_UINT32];
>  
> @@ -67,13 +67,13 @@ struct ipu7_msg_cb_profile {
>  	ipu7_msg_rbm_t reb;
>  };
>  
> -#define IPU_MSG_NODE_MAX_PROFILES	(2U)
> -#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0U)
> -#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xffU)
> +#define IPU_MSG_NODE_MAX_PROFILES	(2)
> +#define IPU_MSG_NODE_DEF_PROFILE_IDX	(0)
> +#define IPU_MSG_NODE_RSRC_ID_EXT_IP	(0xff)
>  
> -#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffffU)
> -#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffffU)
> -#define IPU_MSG_NODE_RSRC_ID_IS		(0xfeU)
> +#define IPU_MSG_NODE_DONT_CARE_TEB_HI	(0xffffffff)
> +#define IPU_MSG_NODE_DONT_CARE_TEB_LO	(0xffffffff)
> +#define IPU_MSG_NODE_RSRC_ID_IS		(0xfe)
>  
>  struct ipu7_msg_node {
>  	struct ia_gofo_tlv_header tlv_header;
> @@ -113,10 +113,10 @@ enum ipu7_msg_link_cmprs_option_bit_depth {
>  	IPU_MSG_LINK_CMPRS_OPTION_12BPP = 2,
>  };
>  
> -#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128U)
> -#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5U)
> +#define IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM		(128)
> +#define IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE	(5)
>  #define IPU_MSG_LINK_CMPRS_SPACE_SAVING_NUM_MAX \
> -	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1U)
> +	(IPU_MSG_LINK_CMPRS_SPACE_SAVING_DENOM - 1)
>  
>  struct ipu7_msg_link_cmprs_plane_desc {
>  	u8 plane_enable;
> @@ -134,10 +134,10 @@ struct ipu7_msg_link_cmprs_plane_desc {
>  	u32 lossy_cfg[IPU_MSG_LINK_CMPRS_LOSSY_CFG_PAYLOAD_SIZE];
>  };
>  
> -#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2U)
> -#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0U)
> -#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16U)
> -#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024U)
> +#define IPU_MSG_LINK_CMPRS_MAX_PLANES		(2)
> +#define IPU_MSG_LINK_CMPRS_NO_ALIGN_INTERVAL	(0)
> +#define IPU_MSG_LINK_CMPRS_MIN_ALIGN_INTERVAL	(16)
> +#define IPU_MSG_LINK_CMPRS_MAX_ALIGN_INTERVAL	(1024)
>  struct ipu7_msg_link_cmprs_option {
>  	struct ia_gofo_tlv_header header;
>  	u32 cmprs_buf_size;
> @@ -156,11 +156,11 @@ struct ipu7_msg_link_ep_pair {
>  	struct ipu7_msg_link_ep ep_dst;
>  };
>  
> -#define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
> -#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64U)
> -#define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
> -#define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
> -#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xffU)
> +#define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535)
> +#define IPU_MSG_LINK_FOREIGN_KEY_MAX		(64)
> +#define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255)
> +#define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255)
> +#define IPU_MSG_LINK_TERM_ID_DONT_CARE		(0xff)
>  
>  struct ipu7_msg_link {
>  	struct ia_gofo_tlv_header tlv_header;
> @@ -258,9 +258,9 @@ enum ipu7_msg_term_type {
>  	IPU_MSG_TERM_TYPE_N,
>  };
>  
> -#define IPU_MSG_TERM_EVENT_TYPE_NONE		0U
> -#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1U
> -#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1U)
> +#define IPU_MSG_TERM_EVENT_TYPE_NONE		0
> +#define IPU_MSG_TERM_EVENT_TYPE_PROGRESS	1
> +#define IPU_MSG_TERM_EVENT_TYPE_N	(IPU_MSG_TERM_EVENT_TYPE_PROGRESS + 1)
>  
>  struct ipu7_msg_term {
>  	struct ia_gofo_tlv_header tlv_header;
> @@ -292,8 +292,8 @@ struct ipu7_msg_term_event {
>  #pragma pack(pop)
>  
>  #pragma pack(push, 1)
> -#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1U
> -#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0U
> +#define IPU_MSG_DEVICE_SEND_MSG_ENABLED		1
> +#define IPU_MSG_DEVICE_SEND_MSG_DISABLED	0
>  
>  #define IPU_MSG_DEVICE_OPEN_SEND_RESP		BIT(0)
>  #define IPU_MSG_DEVICE_OPEN_SEND_IRQ		BIT(1)
> @@ -333,9 +333,9 @@ enum ipu7_msg_err_device {
>  #pragma pack(pop)
>  
>  #pragma pack(push, 1)
> -#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xffU)
> -#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1U
> -#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0U
> +#define IPU_MSG_GRAPH_ID_UNKNOWN	(0xff)
> +#define IPU_MSG_GRAPH_SEND_MSG_ENABLED	1
> +#define IPU_MSG_GRAPH_SEND_MSG_DISABLED	0
>  
>  #define IPU_MSG_GRAPH_OPEN_SEND_RESP	BIT(0)
>  #define IPU_MSG_GRAPH_OPEN_SEND_IRQ	BIT(1)
> @@ -429,8 +429,8 @@ enum ipu7_msg_err_graph {
>  
>  #pragma pack(pop)
>  
> -#define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
> -#define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)
> +#define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60)
> +#define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2)
>  #define FWPS_MSG_ABI_MAX_QUEUES \
>  	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES + FWPS_MSG_ABI_MAX_INPUT_QUEUES)
>  
> @@ -441,25 +441,25 @@ enum ipu7_msg_err_graph {
>  queues"
>  #endif
>  #define FWPS_MSG_ABI_IN_DEV_QUEUE_ID	(IA_GOFO_MSG_ABI_IN_DEV_QUEUE_ID)
> -#define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3U)
> +#define FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID	(3)
>  #define FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID \
> -	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1U)
> +	(FWPS_MSG_ABI_IN_RESERVED_QUEUE_ID + 1)
>  
>  #if (FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID >= FWPS_MSG_ABI_MAX_INPUT_QUEUES)
>  #error "Maximum queues configuration is too small to fit minimum number of \
>  useful queues"
>  #endif
>  
> -#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1U)
> +#define FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID	(FWPS_MSG_ABI_MAX_QUEUES - 1)
>  #define FWPS_MSG_ABI_IN_MAX_TASK_QUEUES \
>  	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID - \
> -	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1U)
> +	FWPS_MSG_ABI_IN_FIRST_TASK_QUEUE_ID + 1)
>  #define FWPS_MSG_ABI_OUT_FIRST_QUEUE_ID		(FWPS_MSG_ABI_OUT_ACK_QUEUE_ID)
> -#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1U)
> +#define FWPS_MSG_ABI_OUT_LAST_QUEUE_ID	(FWPS_MSG_ABI_MAX_OUTPUT_QUEUES - 1)
>  #define FWPS_MSG_ABI_IN_FIRST_QUEUE_ID		(FWPS_MSG_ABI_IN_DEV_QUEUE_ID)
>  #define FWPS_MSG_ABI_IN_LAST_QUEUE_ID	(FWPS_MSG_ABI_IN_LAST_TASK_QUEUE_ID)
>  
> -#define FWPS_MSG_HOST2FW_MAX_SIZE	(2U * 1024U)
> -#define FWPS_MSG_FW2HOST_MAX_SIZE	(256U)
> +#define FWPS_MSG_HOST2FW_MAX_SIZE	(2 * 1024)
> +#define FWPS_MSG_FW2HOST_MAX_SIZE	(256)
>  
>  #endif
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
> index 0af04c8c6..1540db532 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
> @@ -3,8 +3,8 @@
>   * Copyright (C) 2020 - 2025 Intel Corporation
>   */
>  
> -#ifndef IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
> -#define IPU7_PSYS_CONFIG_ABI_H_INCLUDED__
> +#ifndef IPU7_FW_PSYS_CONFIG_ABI_H
> +#define IPU7_FW_PSYS_CONFIG_ABI_H
>  
>  #include <linux/types.h>
>  
> diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
> index bfa5258d5..64e612091 100644
> --- a/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
> +++ b/drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
> @@ -11,7 +11,7 @@
>  #include "ipu7_fw_common_abi.h"
>  
>  #pragma pack(push, 1)
> -#define SYSCOM_QUEUE_MIN_CAPACITY	2U
> +#define SYSCOM_QUEUE_MIN_CAPACITY	2
>  
>  struct syscom_queue_params_config {
>  	ia_gofo_addr_t token_array_mem;
> diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
> index d7901ff78..6896167d8 100644
> --- a/drivers/staging/media/ipu7/ipu7-boot.c
> +++ b/drivers/staging/media/ipu7/ipu7-boot.c
> @@ -56,7 +56,7 @@ static const struct ipu7_boot_context contexts[IPU_SUBSYS_NUM] = {
>  static u32 get_fw_boot_reg_addr(const struct ipu7_bus_device *adev,
>  				enum ia_gofo_buttress_reg_id reg)
>  {
> -	u32 base = (adev->subsys == IPU_IS) ? 0U : (u32)IA_GOFO_FW_BOOT_ID_MAX;
> +	u32 base = (adev->subsys == IPU_IS) ? 0 : (u32)IA_GOFO_FW_BOOT_ID_MAX;
>  
>  	return BUTTRESS_FW_BOOT_PARAMS_ENTRY(base + (u32)reg);
>  }
> @@ -105,7 +105,7 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
>  	writel(val, base + ucx_ctrl_status);
>  
>  	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
> -				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
> +				 (val2 & 0x3) == (val & 0x3), 100, timeout);
>  	if (ret) {
>  		dev_err(dev, "cell enter reset timeout. status: 0x%x\n", val2);
>  		return -ETIMEDOUT;
> @@ -122,7 +122,7 @@ static int ipu7_boot_cell_reset(const struct ipu7_bus_device *adev)
>  	writel(val, base + ucx_ctrl_status);
>  
>  	ret = readl_poll_timeout(base + ucx_ctrl_status, val2,
> -				 (val2 & 0x3U) == (val & 0x3U), 100, timeout);
> +				 (val2 & 0x3) == (val & 0x3), 100, timeout);
>  	if (ret) {
>  		dev_err(dev, "cell exit reset timeout. status: 0x%x\n", val2);
>  		return -ETIMEDOUT;
> @@ -191,17 +191,17 @@ static void init_boot_config(struct ia_gofo_boot_config *boot_config,
>  {
>  	/* syscom version, new syscom2 version */
>  	boot_config->length = length;
> -	boot_config->config_version.major = 1U;
> -	boot_config->config_version.minor = 0U;
> -	boot_config->config_version.subminor = 0U;
> -	boot_config->config_version.patch = 0U;
> +	boot_config->config_version.major = 1;
> +	boot_config->config_version.minor = 0;
> +	boot_config->config_version.subminor = 0;
> +	boot_config->config_version.patch = 0;
>  
>  	/* msg version for task interface */
> -	boot_config->client_version_support.num_versions = 1U;
> +	boot_config->client_version_support.num_versions = 1;
>  	boot_config->client_version_support.versions[0].major = major;
> -	boot_config->client_version_support.versions[0].minor = 0U;
> -	boot_config->client_version_support.versions[0].subminor = 0U;
> -	boot_config->client_version_support.versions[0].patch = 0U;
> +	boot_config->client_version_support.versions[0].minor = 0;
> +	boot_config->client_version_support.versions[0].subminor = 0;
> +	boot_config->client_version_support.versions[0].patch = 0;
>  }
>  
>  int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
> @@ -252,7 +252,7 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
>  		u32 queue_size = qconfigs[i].max_capacity *
>  			qconfigs[i].token_size_in_bytes;
>  
> -		queue_size = ALIGN(queue_size, 64U);
> +		queue_size = ALIGN(queue_size, 64);
>  		total_queue_size_aligned += queue_size;
>  		qconfigs[i].queue_size = queue_size;
>  	}
> diff --git a/drivers/staging/media/ipu7/ipu7-buttress-regs.h b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
> index 3eafd6a38..972543449 100644
> --- a/drivers/staging/media/ipu7/ipu7-buttress-regs.h
> +++ b/drivers/staging/media/ipu7/ipu7-buttress-regs.h
> @@ -6,335 +6,335 @@
>  #ifndef IPU7_BUTTRESS_REGS_H
>  #define IPU7_BUTTRESS_REGS_H
>  
> -#define BUTTRESS_REG_IRQ_STATUS					0x2000
> -#define BUTTRESS_REG_IRQ_STATUS_UNMASKED			0x2004
> -#define BUTTRESS_REG_IRQ_ENABLE					0x2008
> -#define BUTTRESS_REG_IRQ_CLEAR					0x200c
> -#define BUTTRESS_REG_IRQ_MASK					0x2010
> -#define BUTTRESS_REG_TSC_CMD					0x2014
> -#define BUTTRESS_REG_TSC_CTL					0x2018
> -#define BUTTRESS_REG_TSC_LO					0x201c
> -#define BUTTRESS_REG_TSC_HI					0x2020
> +#define IPU7_BUTTRESS_REG_IRQ_STATUS					0x2000
> +#define IPU7_BUTTRESS_REG_IRQ_STATUS_UNMASKED			0x2004
> +#define IPU7_BUTTRESS_REG_IRQ_ENABLE					0x2008
> +#define IPU7_BUTTRESS_REG_IRQ_CLEAR					0x200c
> +#define IPU7_BUTTRESS_REG_IRQ_MASK					0x2010
> +#define IPU7_BUTTRESS_REG_TSC_CMD					0x2014
> +#define IPU7_BUTTRESS_REG_TSC_CTL					0x2018
> +#define IPU7_BUTTRESS_REG_TSC_LO					0x201c
> +#define IPU7_BUTTRESS_REG_TSC_HI					0x2020
>  
>  /* valid for PTL */
> -#define BUTTRESS_REG_PB_TIMESTAMP_LO				0x2030
> -#define BUTTRESS_REG_PB_TIMESTAMP_HI				0x2034
> -#define BUTTRESS_REG_PB_TIMESTAMP_VALID				0x2038
> -
> -#define BUTTRESS_REG_PS_WORKPOINT_REQ				0x2100
> -#define BUTTRESS_REG_IS_WORKPOINT_REQ				0x2104
> -#define BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ			0x2108
> -#define BUTTRESS_REG_PS_DOMAINS_STATUS				0x2110
> -#define BUTTRESS_REG_PWR_STATUS					0x2114
> -#define BUTTRESS_REG_PS_WORKPOINT_REQ_SHADOW			0x2120
> -#define BUTTRESS_REG_IS_WORKPOINT_REQ_SHADOW			0x2124
> -#define BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ_SHADOW		0x2128
> -#define BUTTRESS_REG_ISPS_WORKPOINT_DOWNLOAD			0x212c
> -#define BUTTRESS_REG_PG_FLOW_OVERRIDE				0x2180
> -#define BUTTRESS_REG_GLOBAL_OVERRIDE_UNGATE_CTL			0x2184
> -#define BUTTRESS_REG_PWR_FSM_CTL				0x2188
> -#define BUTTRESS_REG_IDLE_WDT					0x218c
> -#define BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_EN			0x2190
> -#define BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_ADDR			0x2194
> -#define BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_DATA			0x2198
> -#define BUTTRESS_REG_POWER_EN_DELAY				0x219c
> +#define IPU7_BUTTRESS_REG_PB_TIMESTAMP_LO				0x2030
> +#define IPU7_BUTTRESS_REG_PB_TIMESTAMP_HI				0x2034
> +#define IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID				0x2038
> +
> +#define IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ				0x2100
> +#define IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ				0x2104
> +#define IPU7_BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ			0x2108
> +#define IPU7_BUTTRESS_REG_PS_DOMAINS_STATUS				0x2110
> +#define IPU7_BUTTRESS_REG_PWR_STATUS					0x2114
> +#define IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ_SHADOW			0x2120
> +#define IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ_SHADOW			0x2124
> +#define IPU7_BUTTRESS_REG_PS_WORKPOINT_DOMAIN_REQ_SHADOW		0x2128
> +#define IPU7_BUTTRESS_REG_ISPS_WORKPOINT_DOWNLOAD			0x212c
> +#define IPU7_BUTTRESS_REG_PG_FLOW_OVERRIDE				0x2180
> +#define IPU7_BUTTRESS_REG_GLOBAL_OVERRIDE_UNGATE_CTL			0x2184
> +#define IPU7_BUTTRESS_REG_PWR_FSM_CTL				0x2188
> +#define IPU7_BUTTRESS_REG_IDLE_WDT					0x218c
> +#define IPU7_BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_EN			0x2190
> +#define IPU7_BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_ADDR			0x2194
> +#define IPU7_BUTTRESS_REG_PS_PWR_DOMAIN_EVENTQ_DATA			0x2198
> +#define IPU7_BUTTRESS_REG_POWER_EN_DELAY				0x219c
>  #define IPU7_BUTTRESS_REG_LTR_CONTROL				0x21a0
>  #define IPU7_BUTTRESS_REG_NDE_CONTROL				0x21a4
>  #define IPU7_BUTTRESS_REG_INT_FRM_PUNIT				0x21a8
>  #define IPU8_BUTTRESS_REG_LTR_CONTROL				0x21a4
>  #define IPU8_BUTTRESS_REG_NDE_CONTROL				0x21a8
>  #define IPU8_BUTTRESS_REG_INT_FRM_PUNIT				0x21ac
> -#define BUTTRESS_REG_SLEEP_LEVEL_CFG				0x21b0
> -#define BUTTRESS_REG_SLEEP_LEVEL_STS				0x21b4
> -#define BUTTRESS_REG_DVFS_FSM_STATUS				0x21b8
> -#define BUTTRESS_REG_PS_PLL_ENABLE				0x21bc
> -#define BUTTRESS_REG_D2D_CTL					0x21d4
> -#define BUTTRESS_REG_IB_CLK_CTL					0x21d8
> -#define BUTTRESS_REG_IB_CRO_CLK_CTL				0x21dc
> -#define BUTTRESS_REG_FUNC_FUSES					0x21e0
> -#define BUTTRESS_REG_ISOCH_CTL					0x21e4
> -#define BUTTRESS_REG_WORKPOINT_CTL				0x21f0
> -#define BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS			0x2200
> -#define BUTTRESS_REG_DRV_IS_UCX_START_ADDR			0x2204
> -#define BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS			0x2208
> -#define BUTTRESS_REG_DRV_PS_UCX_START_ADDR			0x220c
> -#define BUTTRESS_REG_DRV_UCX_RESET_CFG				0x2210
> +#define IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG				0x21b0
> +#define IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS				0x21b4
> +#define IPU7_BUTTRESS_REG_DVFS_FSM_STATUS				0x21b8
> +#define IPU7_BUTTRESS_REG_PS_PLL_ENABLE				0x21bc
> +#define IPU7_BUTTRESS_REG_D2D_CTL					0x21d4
> +#define IPU7_BUTTRESS_REG_IB_CLK_CTL					0x21d8
> +#define IPU7_BUTTRESS_REG_IB_CRO_CLK_CTL				0x21dc
> +#define IPU7_BUTTRESS_REG_FUNC_FUSES					0x21e0
> +#define IPU7_BUTTRESS_REG_ISOCH_CTL					0x21e4
> +#define IPU7_BUTTRESS_REG_WORKPOINT_CTL				0x21f0
> +#define IPU7_BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS			0x2200
> +#define IPU7_BUTTRESS_REG_DRV_IS_UCX_START_ADDR			0x2204
> +#define IPU7_BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS			0x2208
> +#define IPU7_BUTTRESS_REG_DRV_PS_UCX_START_ADDR			0x220c
> +#define IPU7_BUTTRESS_REG_DRV_UCX_RESET_CFG				0x2210
>  
>  /* configured by CSE */
> -#define BUTTRESS_REG_CSE_IS_UCX_CONTROL_STATUS			0x2300
> -#define BUTTRESS_REG_CSE_IS_UCX_START_ADDR			0x2304
> -#define BUTTRESS_REG_CSE_PS_UCX_CONTROL_STATUS			0x2308
> -#define BUTTRESS_REG_CSE_PS_UCX_START_ADDR			0x230c
> -
> -#define BUTTRESS_REG_CAMERA_MASK				0x2310
> -#define BUTTRESS_REG_FW_CTL					0x2314
> -#define BUTTRESS_REG_SECURITY_CTL				0x2318
> -#define BUTTRESS_REG_FUNCTIONAL_FW_SETUP			0x231c
> -#define BUTTRESS_REG_FW_BASE					0x2320
> -#define BUTTRESS_REG_FW_BASE_LIMIT				0x2324
> -#define BUTTRESS_REG_FW_SCRATCH_BASE				0x2328
> -#define BUTTRESS_REG_FW_SCRATCH_LIMIT				0x232c
> -#define BUTTRESS_REG_CSE_ACTION					0x2330
> +#define IPU7_BUTTRESS_REG_CSE_IS_UCX_CONTROL_STATUS			0x2300
> +#define IPU7_BUTTRESS_REG_CSE_IS_UCX_START_ADDR			0x2304
> +#define IPU7_BUTTRESS_REG_CSE_PS_UCX_CONTROL_STATUS			0x2308
> +#define IPU7_BUTTRESS_REG_CSE_PS_UCX_START_ADDR			0x230c
> +
> +#define IPU7_BUTTRESS_REG_CAMERA_MASK				0x2310
> +#define IPU7_BUTTRESS_REG_FW_CTL					0x2314
> +#define IPU7_BUTTRESS_REG_SECURITY_CTL				0x2318
> +#define IPU7_BUTTRESS_REG_FUNCTIONAL_FW_SETUP			0x231c
> +#define IPU7_BUTTRESS_REG_FW_BASE					0x2320
> +#define IPU7_BUTTRESS_REG_FW_BASE_LIMIT				0x2324
> +#define IPU7_BUTTRESS_REG_FW_SCRATCH_BASE				0x2328
> +#define IPU7_BUTTRESS_REG_FW_SCRATCH_LIMIT				0x232c
> +#define IPU7_BUTTRESS_REG_CSE_ACTION					0x2330
>  
>  /* configured by SW */
> -#define BUTTRESS_REG_FW_RESET_CTL				0x2334
> -#define BUTTRESS_REG_FW_SOURCE_SIZE				0x2338
> -#define BUTTRESS_REG_FW_SOURCE_BASE				0x233c
> -
> -#define BUTTRESS_REG_IPU_SEC_CP_LSB				0x2400
> -#define BUTTRESS_REG_IPU_SEC_CP_MSB				0x2404
> -#define BUTTRESS_REG_IPU_SEC_WAC_LSB				0x2408
> -#define BUTTRESS_REG_IPU_SEC_WAC_MSB				0x240c
> -#define BUTTRESS_REG_IPU_SEC_RAC_LSB				0x2410
> -#define BUTTRESS_REG_IPU_SEC_RAC_MSB				0x2414
> -#define BUTTRESS_REG_IPU_DRV_CP_LSB				0x2418
> -#define BUTTRESS_REG_IPU_DRV_CP_MSB				0x241c
> -#define BUTTRESS_REG_IPU_DRV_WAC_LSB				0x2420
> -#define BUTTRESS_REG_IPU_DRV_WAC_MSB				0x2424
> -#define BUTTRESS_REG_IPU_DRV_RAC_LSB				0x2428
> -#define BUTTRESS_REG_IPU_DRV_RAC_MSB				0x242c
> -#define BUTTRESS_REG_IPU_FW_CP_LSB				0x2430
> -#define BUTTRESS_REG_IPU_FW_CP_MSB				0x2434
> -#define BUTTRESS_REG_IPU_FW_WAC_LSB				0x2438
> -#define BUTTRESS_REG_IPU_FW_WAC_MSB				0x243c
> -#define BUTTRESS_REG_IPU_FW_RAC_LSB				0x2440
> -#define BUTTRESS_REG_IPU_FW_RAC_MSB				0x2444
> -#define BUTTRESS_REG_IPU_BIOS_SEC_CP_LSB			0x2448
> -#define BUTTRESS_REG_IPU_BIOS_SEC_CP_MSB			0x244c
> -#define BUTTRESS_REG_IPU_BIOS_SEC_WAC_LSB			0x2450
> -#define BUTTRESS_REG_IPU_BIOS_SEC_WAC_MSB			0x2454
> -#define BUTTRESS_REG_IPU_BIOS_SEC_RAC_LSB			0x2458
> -#define BUTTRESS_REG_IPU_BIOS_SEC_RAC_MSB			0x245c
> -#define BUTTRESS_REG_IPU_DFD_CP_LSB				0x2460
> -#define BUTTRESS_REG_IPU_DFD_CP_MSB				0x2464
> -#define BUTTRESS_REG_IPU_DFD_WAC_LSB				0x2468
> -#define BUTTRESS_REG_IPU_DFD_WAC_MSB				0x246c
> -#define BUTTRESS_REG_IPU_DFD_RAC_LSB				0x2470
> -#define BUTTRESS_REG_IPU_DFD_RAC_MSB				0x2474
> -#define BUTTRESS_REG_CSE2IUDB0					0x2500
> -#define BUTTRESS_REG_CSE2IUDATA0				0x2504
> -#define BUTTRESS_REG_CSE2IUCSR					0x2508
> -#define BUTTRESS_REG_IU2CSEDB0					0x250c
> -#define BUTTRESS_REG_IU2CSEDATA0				0x2510
> -#define BUTTRESS_REG_IU2CSECSR					0x2514
> -#define BUTTRESS_REG_CSE2IUDB0_CR_SHADOW			0x2520
> -#define BUTTRESS_REG_CSE2IUDATA0_CR_SHADOW			0x2524
> -#define BUTTRESS_REG_CSE2IUCSR_CR_SHADOW			0x2528
> -#define BUTTRESS_REG_IU2CSEDB0_CR_SHADOW			0x252c
> -#define BUTTRESS_REG_DVFS_FSM_SURVIVABILITY			0x2900
> -#define BUTTRESS_REG_FLOWS_FSM_SURVIVABILITY			0x2904
> -#define BUTTRESS_REG_FABRICS_FSM_SURVIVABILITY			0x2908
> -#define BUTTRESS_REG_PS_SUB1_PM_FSM_SURVIVABILITY		0x290c
> -#define BUTTRESS_REG_PS_SUB0_PM_FSM_SURVIVABILITY		0x2910
> -#define BUTTRESS_REG_PS_PM_FSM_SURVIVABILITY			0x2914
> -#define BUTTRESS_REG_IS_PM_FSM_SURVIVABILITY			0x2918
> -#define BUTTRESS_REG_FLR_RST_FSM_SURVIVABILITY			0x291c
> -#define BUTTRESS_REG_FW_RST_FSM_SURVIVABILITY			0x2920
> -#define BUTTRESS_REG_RESETPREP_FSM_SURVIVABILITY		0x2924
> -#define BUTTRESS_REG_POWER_FSM_DOMAIN_STATUS			0x3000
> -#define BUTTRESS_REG_IDLEREQ_STATUS1				0x3004
> -#define BUTTRESS_REG_POWER_FSM_STATUS_IS_PS			0x3008
> -#define BUTTRESS_REG_POWER_ACK_B_STATUS				0x300c
> -#define BUTTRESS_REG_DOMAIN_RETENTION_CTL			0x3010
> -#define BUTTRESS_REG_CG_CTRL_BITS				0x3014
> -#define BUTTRESS_REG_IS_IFC_STATUS0				0x3018
> -#define BUTTRESS_REG_IS_IFC_STATUS1				0x301c
> -#define BUTTRESS_REG_PS_IFC_STATUS0				0x3020
> -#define BUTTRESS_REG_PS_IFC_STATUS1				0x3024
> -#define BUTTRESS_REG_BTRS_IFC_STATUS0				0x3028
> -#define BUTTRESS_REG_BTRS_IFC_STATUS1				0x302c
> -#define BUTTRESS_REG_IPU_SKU					0x3030
> -#define BUTTRESS_REG_PS_IDLEACK					0x3034
> -#define BUTTRESS_REG_IS_IDLEACK					0x3038
> -#define BUTTRESS_REG_SPARE_REGS_0				0x303c
> -#define BUTTRESS_REG_SPARE_REGS_1				0x3040
> -#define BUTTRESS_REG_SPARE_REGS_2				0x3044
> -#define BUTTRESS_REG_SPARE_REGS_3				0x3048
> -#define BUTTRESS_REG_IUNIT_ACV					0x304c
> -#define BUTTRESS_REG_CHICKEN_BITS				0x3050
> -#define BUTTRESS_REG_SBENDPOINT_CFG				0x3054
> -#define BUTTRESS_REG_ECC_ERR_LOG				0x3058
> -#define BUTTRESS_REG_POWER_FSM_STATUS				0x3070
> -#define BUTTRESS_REG_RESET_FSM_STATUS				0x3074
> -#define BUTTRESS_REG_IDLE_STATUS				0x3078
> -#define BUTTRESS_REG_IDLEACK_STATUS				0x307c
> -#define BUTTRESS_REG_IPU_DEBUG					0x3080
> -
> -#define BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
> -#define BUTTRESS_REG_FW_BOOT_PARAMS1				0x4004
> -#define BUTTRESS_REG_FW_BOOT_PARAMS2				0x4008
> -#define BUTTRESS_REG_FW_BOOT_PARAMS3				0x400c
> -#define BUTTRESS_REG_FW_BOOT_PARAMS4				0x4010
> -#define BUTTRESS_REG_FW_BOOT_PARAMS5				0x4014
> -#define BUTTRESS_REG_FW_BOOT_PARAMS6				0x4018
> -#define BUTTRESS_REG_FW_BOOT_PARAMS7				0x401c
> -#define BUTTRESS_REG_FW_BOOT_PARAMS8				0x4020
> -#define BUTTRESS_REG_FW_BOOT_PARAMS9				0x4024
> -#define BUTTRESS_REG_FW_BOOT_PARAMS10				0x4028
> -#define BUTTRESS_REG_FW_BOOT_PARAMS11				0x402c
> -#define BUTTRESS_REG_FW_BOOT_PARAMS12				0x4030
> -#define BUTTRESS_REG_FW_BOOT_PARAMS13				0x4034
> -#define BUTTRESS_REG_FW_BOOT_PARAMS14				0x4038
> -#define BUTTRESS_REG_FW_BOOT_PARAMS15				0x403c
> -
> -#define BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
> -	(BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4U))
> -#define BUTTRESS_REG_FW_GP(i)				(0x4040 + 0x4 * (i))
> -#define BUTTRESS_REG_FPGA_SUPPORT(i)			(0x40c0 + 0x4 * (i))
> -
> -#define BUTTRESS_REG_FW_GP8					0x4060
> -#define BUTTRESS_REG_FW_GP24					0x40a0
> -
> -#define BUTTRESS_REG_GPIO_0_PADCFG_ADDR_CR			0x4100
> -#define BUTTRESS_REG_GPIO_1_PADCFG_ADDR_CR			0x4104
> -#define BUTTRESS_REG_GPIO_2_PADCFG_ADDR_CR			0x4108
> -#define BUTTRESS_REG_GPIO_3_PADCFG_ADDR_CR			0x410c
> -#define BUTTRESS_REG_GPIO_4_PADCFG_ADDR_CR			0x4110
> -#define BUTTRESS_REG_GPIO_5_PADCFG_ADDR_CR			0x4114
> -#define BUTTRESS_REG_GPIO_6_PADCFG_ADDR_CR			0x4118
> -#define BUTTRESS_REG_GPIO_7_PADCFG_ADDR_CR			0x411c
> -#define BUTTRESS_REG_GPIO_ENABLE				0x4140
> -#define BUTTRESS_REG_GPIO_VALUE_CR				0x4144
> -
> -#define BUTTRESS_REG_IS_MEM_CORRECTABLE_ERROR_STATUS		0x5000
> -#define BUTTRESS_REG_IS_MEM_FATAL_ERROR_STATUS			0x5004
> -#define BUTTRESS_REG_IS_MEM_NON_FATAL_ERROR_STATUS		0x5008
> -#define BUTTRESS_REG_IS_MEM_CHECK_PASSED			0x500c
> -#define BUTTRESS_REG_IS_MEM_ERROR_INJECT			0x5010
> -#define BUTTRESS_REG_IS_MEM_ERROR_CLEAR				0x5014
> -#define BUTTRESS_REG_PS_MEM_CORRECTABLE_ERROR_STATUS		0x5040
> -#define BUTTRESS_REG_PS_MEM_FATAL_ERROR_STATUS			0x5044
> -#define BUTTRESS_REG_PS_MEM_NON_FATAL_ERROR_STATUS		0x5048
> -#define BUTTRESS_REG_PS_MEM_CHECK_PASSED			0x504c
> -#define BUTTRESS_REG_PS_MEM_ERROR_INJECT			0x5050
> -#define BUTTRESS_REG_PS_MEM_ERROR_CLEAR				0x5054
> -
> -#define BUTTRESS_REG_IS_AB_REGION_MIN_ADDRESS(i)	(0x6000 + 0x8 * (i))
> -#define BUTTRESS_REG_IS_AB_REGION_MAX_ADDRESS(i)	(0x6004 + 0x8 * (i))
> -#define BUTTRESS_REG_IS_AB_VIOLATION_LOG0			0x6080
> -#define BUTTRESS_REG_IS_AB_VIOLATION_LOG1			0x6084
> -#define BUTTRESS_REG_PS_AB_REGION_MIN_ADDRESS(i)	(0x6100 + 0x8 * (i))
> -#define BUTTRESS_REG_PS_AB_REGION_MAX_ADDRESS0		(0x6104 + 0x8 * (i))
> -#define BUTTRESS_REG_PS_AB_VIOLATION_LOG0			0x6180
> -#define BUTTRESS_REG_PS_AB_VIOLATION_LOG1			0x6184
> -#define BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG0			0x6200
> -#define BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG1			0x6204
> -#define BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG0			0x6208
> -#define BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG1			0x620c
> -#define BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG0			0x6210
> -#define BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG1			0x6214
> -#define BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG0		0x6218
> -#define BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG1		0x621c
> -#define BUTTRESS_REG_AB_ENABLE					0x6220
> -#define BUTTRESS_REG_AB_DEFAULT_ACCESS				0x6230
> +#define IPU7_BUTTRESS_REG_FW_RESET_CTL				0x2334
> +#define IPU7_BUTTRESS_REG_FW_SOURCE_SIZE				0x2338
> +#define IPU7_BUTTRESS_REG_FW_SOURCE_BASE				0x233c
> +
> +#define IPU7_BUTTRESS_REG_IPU_SEC_CP_LSB				0x2400
> +#define IPU7_BUTTRESS_REG_IPU_SEC_CP_MSB				0x2404
> +#define IPU7_BUTTRESS_REG_IPU_SEC_WAC_LSB				0x2408
> +#define IPU7_BUTTRESS_REG_IPU_SEC_WAC_MSB				0x240c
> +#define IPU7_BUTTRESS_REG_IPU_SEC_RAC_LSB				0x2410
> +#define IPU7_BUTTRESS_REG_IPU_SEC_RAC_MSB				0x2414
> +#define IPU7_BUTTRESS_REG_IPU_DRV_CP_LSB				0x2418
> +#define IPU7_BUTTRESS_REG_IPU_DRV_CP_MSB				0x241c
> +#define IPU7_BUTTRESS_REG_IPU_DRV_WAC_LSB				0x2420
> +#define IPU7_BUTTRESS_REG_IPU_DRV_WAC_MSB				0x2424
> +#define IPU7_BUTTRESS_REG_IPU_DRV_RAC_LSB				0x2428
> +#define IPU7_BUTTRESS_REG_IPU_DRV_RAC_MSB				0x242c
> +#define IPU7_BUTTRESS_REG_IPU_FW_CP_LSB				0x2430
> +#define IPU7_BUTTRESS_REG_IPU_FW_CP_MSB				0x2434
> +#define IPU7_BUTTRESS_REG_IPU_FW_WAC_LSB				0x2438
> +#define IPU7_BUTTRESS_REG_IPU_FW_WAC_MSB				0x243c
> +#define IPU7_BUTTRESS_REG_IPU_FW_RAC_LSB				0x2440
> +#define IPU7_BUTTRESS_REG_IPU_FW_RAC_MSB				0x2444
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_CP_LSB			0x2448
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_CP_MSB			0x244c
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_WAC_LSB			0x2450
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_WAC_MSB			0x2454
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_RAC_LSB			0x2458
> +#define IPU7_BUTTRESS_REG_IPU_BIOS_SEC_RAC_MSB			0x245c
> +#define IPU7_BUTTRESS_REG_IPU_DFD_CP_LSB				0x2460
> +#define IPU7_BUTTRESS_REG_IPU_DFD_CP_MSB				0x2464
> +#define IPU7_BUTTRESS_REG_IPU_DFD_WAC_LSB				0x2468
> +#define IPU7_BUTTRESS_REG_IPU_DFD_WAC_MSB				0x246c
> +#define IPU7_BUTTRESS_REG_IPU_DFD_RAC_LSB				0x2470
> +#define IPU7_BUTTRESS_REG_IPU_DFD_RAC_MSB				0x2474
> +#define IPU7_BUTTRESS_REG_CSE2IUDB0					0x2500
> +#define IPU7_BUTTRESS_REG_CSE2IUDATA0				0x2504
> +#define IPU7_BUTTRESS_REG_CSE2IUCSR					0x2508
> +#define IPU7_BUTTRESS_REG_IU2CSEDB0					0x250c
> +#define IPU7_BUTTRESS_REG_IU2CSEDATA0				0x2510
> +#define IPU7_BUTTRESS_REG_IU2CSECSR					0x2514
> +#define IPU7_BUTTRESS_REG_CSE2IUDB0_CR_SHADOW			0x2520
> +#define IPU7_BUTTRESS_REG_CSE2IUDATA0_CR_SHADOW			0x2524
> +#define IPU7_BUTTRESS_REG_CSE2IUCSR_CR_SHADOW			0x2528
> +#define IPU7_BUTTRESS_REG_IU2CSEDB0_CR_SHADOW			0x252c
> +#define IPU7_BUTTRESS_REG_DVFS_FSM_SURVIVABILITY			0x2900
> +#define IPU7_BUTTRESS_REG_FLOWS_FSM_SURVIVABILITY			0x2904
> +#define IPU7_BUTTRESS_REG_FABRICS_FSM_SURVIVABILITY			0x2908
> +#define IPU7_BUTTRESS_REG_PS_SUB1_PM_FSM_SURVIVABILITY		0x290c
> +#define IPU7_BUTTRESS_REG_PS_SUB0_PM_FSM_SURVIVABILITY		0x2910
> +#define IPU7_BUTTRESS_REG_PS_PM_FSM_SURVIVABILITY			0x2914
> +#define IPU7_BUTTRESS_REG_IS_PM_FSM_SURVIVABILITY			0x2918
> +#define IPU7_BUTTRESS_REG_FLR_RST_FSM_SURVIVABILITY			0x291c
> +#define IPU7_BUTTRESS_REG_FW_RST_FSM_SURVIVABILITY			0x2920
> +#define IPU7_BUTTRESS_REG_RESETPREP_FSM_SURVIVABILITY		0x2924
> +#define IPU7_BUTTRESS_REG_POWER_FSM_DOMAIN_STATUS			0x3000
> +#define IPU7_BUTTRESS_REG_IDLEREQ_STATUS1				0x3004
> +#define IPU7_BUTTRESS_REG_POWER_FSM_STATUS_IS_PS			0x3008
> +#define IPU7_BUTTRESS_REG_POWER_ACK_B_STATUS				0x300c
> +#define IPU7_BUTTRESS_REG_DOMAIN_RETENTION_CTL			0x3010
> +#define IPU7_BUTTRESS_REG_CG_CTRL_BITS				0x3014
> +#define IPU7_BUTTRESS_REG_IS_IFC_STATUS0				0x3018
> +#define IPU7_BUTTRESS_REG_IS_IFC_STATUS1				0x301c
> +#define IPU7_BUTTRESS_REG_PS_IFC_STATUS0				0x3020
> +#define IPU7_BUTTRESS_REG_PS_IFC_STATUS1				0x3024
> +#define IPU7_BUTTRESS_REG_BTRS_IFC_STATUS0				0x3028
> +#define IPU7_BUTTRESS_REG_BTRS_IFC_STATUS1				0x302c
> +#define IPU7_BUTTRESS_REG_IPU_SKU					0x3030
> +#define IPU7_BUTTRESS_REG_PS_IDLEACK					0x3034
> +#define IPU7_BUTTRESS_REG_IS_IDLEACK					0x3038
> +#define IPU7_BUTTRESS_REG_SPARE_REGS_0				0x303c
> +#define IPU7_BUTTRESS_REG_SPARE_REGS_1				0x3040
> +#define IPU7_BUTTRESS_REG_SPARE_REGS_2				0x3044
> +#define IPU7_BUTTRESS_REG_SPARE_REGS_3				0x3048
> +#define IPU7_BUTTRESS_REG_IUNIT_ACV					0x304c
> +#define IPU7_BUTTRESS_REG_CHICKEN_BITS				0x3050
> +#define IPU7_BUTTRESS_REG_SBENDPOINT_CFG				0x3054
> +#define IPU7_BUTTRESS_REG_ECC_ERR_LOG				0x3058
> +#define IPU7_BUTTRESS_REG_POWER_FSM_STATUS				0x3070
> +#define IPU7_BUTTRESS_REG_RESET_FSM_STATUS				0x3074
> +#define IPU7_BUTTRESS_REG_IDLE_STATUS				0x3078
> +#define IPU7_BUTTRESS_REG_IDLEACK_STATUS				0x307c
> +#define IPU7_BUTTRESS_REG_IPU_DEBUG					0x3080
> +
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0				0x4000
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS1				0x4004
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS2				0x4008
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS3				0x400c
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS4				0x4010
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS5				0x4014
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS6				0x4018
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7				0x401c
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS8				0x4020
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS9				0x4024
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS10				0x4028
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS11				0x402c
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS12				0x4030
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS13				0x4034
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS14				0x4038
> +#define IPU7_BUTTRESS_REG_FW_BOOT_PARAMS15				0x403c
> +
> +#define IPU7_BUTTRESS_FW_BOOT_PARAMS_ENTRY(i) \
> +	(IPU7_BUTTRESS_REG_FW_BOOT_PARAMS0 + ((i) * 4))
> +#define IPU7_BUTTRESS_REG_FW_GP(i)				(0x4040 + 0x4 * (i))
> +#define IPU7_BUTTRESS_REG_FPGA_SUPPORT(i)			(0x40c0 + 0x4 * (i))
> +
> +#define IPU7_BUTTRESS_REG_FW_GP8					0x4060
> +#define IPU7_BUTTRESS_REG_FW_GP24					0x40a0
> +
> +#define IPU7_BUTTRESS_REG_GPIO_0_PADCFG_ADDR_CR			0x4100
> +#define IPU7_BUTTRESS_REG_GPIO_1_PADCFG_ADDR_CR			0x4104
> +#define IPU7_BUTTRESS_REG_GPIO_2_PADCFG_ADDR_CR			0x4108
> +#define IPU7_BUTTRESS_REG_GPIO_3_PADCFG_ADDR_CR			0x410c
> +#define IPU7_BUTTRESS_REG_GPIO_4_PADCFG_ADDR_CR			0x4110
> +#define IPU7_BUTTRESS_REG_GPIO_5_PADCFG_ADDR_CR			0x4114
> +#define IPU7_BUTTRESS_REG_GPIO_6_PADCFG_ADDR_CR			0x4118
> +#define IPU7_BUTTRESS_REG_GPIO_7_PADCFG_ADDR_CR			0x411c
> +#define IPU7_BUTTRESS_REG_GPIO_ENABLE				0x4140
> +#define IPU7_BUTTRESS_REG_GPIO_VALUE_CR				0x4144
> +
> +#define IPU7_BUTTRESS_REG_IS_MEM_CORRECTABLE_ERROR_STATUS		0x5000
> +#define IPU7_BUTTRESS_REG_IS_MEM_FATAL_ERROR_STATUS			0x5004
> +#define IPU7_BUTTRESS_REG_IS_MEM_NON_FATAL_ERROR_STATUS		0x5008
> +#define IPU7_BUTTRESS_REG_IS_MEM_CHECK_PASSED			0x500c
> +#define IPU7_BUTTRESS_REG_IS_MEM_ERROR_INJECT			0x5010
> +#define IPU7_BUTTRESS_REG_IS_MEM_ERROR_CLEAR				0x5014
> +#define IPU7_BUTTRESS_REG_PS_MEM_CORRECTABLE_ERROR_STATUS		0x5040
> +#define IPU7_BUTTRESS_REG_PS_MEM_FATAL_ERROR_STATUS			0x5044
> +#define IPU7_BUTTRESS_REG_PS_MEM_NON_FATAL_ERROR_STATUS		0x5048
> +#define IPU7_BUTTRESS_REG_PS_MEM_CHECK_PASSED			0x504c
> +#define IPU7_BUTTRESS_REG_PS_MEM_ERROR_INJECT			0x5050
> +#define IPU7_BUTTRESS_REG_PS_MEM_ERROR_CLEAR				0x5054
> +
> +#define IPU7_BUTTRESS_REG_IS_AB_REGION_MIN_ADDRESS(i)	(0x6000 + 0x8 * (i))
> +#define IPU7_BUTTRESS_REG_IS_AB_REGION_MAX_ADDRESS(i)	(0x6004 + 0x8 * (i))
> +#define IPU7_BUTTRESS_REG_IS_AB_VIOLATION_LOG0			0x6080
> +#define IPU7_BUTTRESS_REG_IS_AB_VIOLATION_LOG1			0x6084
> +#define IPU7_BUTTRESS_REG_PS_AB_REGION_MIN_ADDRESS(i)	(0x6100 + 0x8 * (i))
> +#define IPU7_BUTTRESS_REG_PS_AB_REGION_MAX_ADDRESS0		(0x6104 + 0x8 * (i))
> +#define IPU7_BUTTRESS_REG_PS_AB_VIOLATION_LOG0			0x6180
> +#define IPU7_BUTTRESS_REG_PS_AB_VIOLATION_LOG1			0x6184
> +#define IPU7_BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG0			0x6200
> +#define IPU7_BUTTRESS_REG_PS_DEBUG_AB_VIOLATION_LOG1			0x6204
> +#define IPU7_BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG0			0x6208
> +#define IPU7_BUTTRESS_REG_IS_DEBUG_AB_VIOLATION_LOG1			0x620c
> +#define IPU7_BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG0			0x6210
> +#define IPU7_BUTTRESS_REG_IB_DVP_AB_VIOLATION_LOG1			0x6214
> +#define IPU7_BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG0		0x6218
> +#define IPU7_BUTTRESS_REG_IB_ATB2DTF_AB_VIOLATION_LOG1		0x621c
> +#define IPU7_BUTTRESS_REG_AB_ENABLE					0x6220
> +#define IPU7_BUTTRESS_REG_AB_DEFAULT_ACCESS				0x6230
>  
>  /* Indicates CSE has received an IPU driver IPC transaction */
> -#define BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE		BIT(0)
> +#define IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE		BIT(0)
>  /* Indicates an IPC transaction from CSE has arrived */
> -#define BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING		BIT(1)
> +#define IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING		BIT(1)
>  /* Indicates a CSR update from CSE has arrived */
> -#define BUTTRESS_IRQ_CSE_CSR_SET			BIT(2)
> +#define IPU7_BUTTRESS_IRQ_CSE_CSR_SET			BIT(2)
>  /* Indicates an interrupt set by Punit (not in use at this time) */
> -#define BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ			BIT(3)
> +#define IPU7_BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ			BIT(3)
>  /* Indicates an SAI violation was detected on access to IB registers */
> -#define BUTTRESS_IRQ_SAI_VIOLATION			BIT(4)
> +#define IPU7_BUTTRESS_IRQ_SAI_VIOLATION			BIT(4)
>  /* Indicates a transaction to IS was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_IS_AB_VIOLATION			BIT(5)
> +#define IPU7_BUTTRESS_IRQ_IS_AB_VIOLATION			BIT(5)
>  /* Indicates a transaction to PS was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_PS_AB_VIOLATION			BIT(6)
> +#define IPU7_BUTTRESS_IRQ_PS_AB_VIOLATION			BIT(6)
>  /* Indicates an error response was detected by the IB config NoC */
> -#define BUTTRESS_IRQ_IB_CFG_NOC_ERR_IRQ			BIT(7)
> +#define IPU7_BUTTRESS_IRQ_IB_CFG_NOC_ERR_IRQ			BIT(7)
>  /* Indicates an error response was detected by the IB data NoC */
> -#define BUTTRESS_IRQ_IB_DATA_NOC_ERR_IRQ		BIT(8)
> +#define IPU7_BUTTRESS_IRQ_IB_DATA_NOC_ERR_IRQ		BIT(8)
>  /* Transaction to DVP regs was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_IB_DVP_AB_VIOLATION		BIT(9)
> +#define IPU7_BUTTRESS_IRQ_IB_DVP_AB_VIOLATION		BIT(9)
>  /* Transaction to ATB2DTF regs was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_ATB2DTF_AB_VIOLATION		BIT(10)
> +#define IPU7_BUTTRESS_IRQ_ATB2DTF_AB_VIOLATION		BIT(10)
>  /* Transaction to IS debug regs was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_IS_DEBUG_AB_VIOLATION		BIT(11)
> +#define IPU7_BUTTRESS_IRQ_IS_DEBUG_AB_VIOLATION		BIT(11)
>  /* Transaction to PS debug regs was not able to pass the access blocker */
> -#define BUTTRESS_IRQ_PS_DEBUG_AB_VIOLATION		BIT(12)
> +#define IPU7_BUTTRESS_IRQ_PS_DEBUG_AB_VIOLATION		BIT(12)
>  /* Indicates timeout occurred waiting for a response from a target */
> -#define BUTTRESS_IRQ_IB_CFG_NOC_TIMEOUT_IRQ		BIT(13)
> +#define IPU7_BUTTRESS_IRQ_IB_CFG_NOC_TIMEOUT_IRQ		BIT(13)
>  /* Set when any correctable ECC error input wire to buttress is set */
> -#define BUTTRESS_IRQ_ECC_CORRECTABLE			BIT(14)
> +#define IPU7_BUTTRESS_IRQ_ECC_CORRECTABLE			BIT(14)
>  /* Any noncorrectable-nonfatal ECC error input wire to buttress is set */
> -#define BUTTRESS_IRQ_ECC_NONCORRECTABLE_NONFATAL	BIT(15)
> +#define IPU7_BUTTRESS_IRQ_ECC_NONCORRECTABLE_NONFATAL	BIT(15)
>  /* Set when any noncorrectable-fatal ECC error input wire to buttress is set */
> -#define BUTTRESS_IRQ_ECC_NONCORRECTABLE_FATAL		BIT(16)
> +#define IPU7_BUTTRESS_IRQ_ECC_NONCORRECTABLE_FATAL		BIT(16)
>  /* Set when timeout occurred waiting for a response from a target */
> -#define BUTTRESS_IRQ_IS_CFG_NOC_TIMEOUT_IRQ		BIT(17)
> -#define BUTTRESS_IRQ_PS_CFG_NOC_TIMEOUT_IRQ		BIT(18)
> -#define BUTTRESS_IRQ_LB_CFG_NOC_TIMEOUT_IRQ		BIT(19)
> +#define IPU7_BUTTRESS_IRQ_IS_CFG_NOC_TIMEOUT_IRQ		BIT(17)
> +#define IPU7_BUTTRESS_IRQ_PS_CFG_NOC_TIMEOUT_IRQ		BIT(18)
> +#define IPU7_BUTTRESS_IRQ_LB_CFG_NOC_TIMEOUT_IRQ		BIT(19)
>  /* IS FW double exception event */
> -#define BUTTRESS_IRQ_IS_UC_PFATAL_ERROR			BIT(26)
> +#define IPU7_BUTTRESS_IRQ_IS_UC_PFATAL_ERROR			BIT(26)
>  /* PS FW double exception event */
> -#define BUTTRESS_IRQ_PS_UC_PFATAL_ERROR			BIT(27)
> +#define IPU7_BUTTRESS_IRQ_PS_UC_PFATAL_ERROR			BIT(27)
>  /* IS FW watchdog event */
> -#define BUTTRESS_IRQ_IS_WATCHDOG			BIT(28)
> +#define IPU7_BUTTRESS_IRQ_IS_WATCHDOG			BIT(28)
>  /* PS FW watchdog event */
> -#define BUTTRESS_IRQ_PS_WATCHDOG			BIT(29)
> +#define IPU7_BUTTRESS_IRQ_PS_WATCHDOG			BIT(29)
>  /* IS IRC irq out */
> -#define BUTTRESS_IRQ_IS_IRQ				BIT(30)
> +#define IPU7_BUTTRESS_IRQ_IS_IRQ				BIT(30)
>  /* PS IRC irq out */
> -#define BUTTRESS_IRQ_PS_IRQ				BIT(31)
> +#define IPU7_BUTTRESS_IRQ_PS_IRQ				BIT(31)
>  
>  /* buttress irq */
> -#define	BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0U
> -#define	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1U
> -#define	BUTTRESS_PWR_STATUS_HH_STATE_DONE	2U
> -#define	BUTTRESS_PWR_STATUS_HH_STATE_ERR	3U
> -
> -#define BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
> -#define BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
> -#define BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3U << 11)
> -#define BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
> +#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_IDLE	0
> +#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS	1
> +#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_DONE	2
> +#define	IPU7_BUTTRESS_PWR_STATUS_HH_STATE_ERR	3
> +
> +#define IPU7_BUTTRESS_TSC_CMD_START_TSC_SYNC		BIT(0)
> +#define IPU7_BUTTRESS_PWR_STATUS_HH_STATUS_SHIFT	11
> +#define IPU7_BUTTRESS_PWR_STATUS_HH_STATUS_MASK	(0x3 << 11)
> +#define IPU7_BUTTRESS_TSW_WA_SOFT_RESET		BIT(8)
>  /* new for PTL */
> -#define BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
> -#define BUTTRESS_IRQS		(BUTTRESS_IRQ_IS_IRQ | \
> -				 BUTTRESS_IRQ_PS_IRQ | \
> -				 BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING | \
> -				 BUTTRESS_IRQ_CSE_CSR_SET | \
> -				 BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE | \
> -				 BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
> +#define IPU7_BUTTRESS_SEL_PB_TIMESTAMP		BIT(9)
> +#define IPU7_BUTTRESS_IRQS		(IPU7_BUTTRESS_IRQ_IS_IRQ | \
> +				 IPU7_BUTTRESS_IRQ_PS_IRQ | \
> +				 IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING | \
> +				 IPU7_BUTTRESS_IRQ_CSE_CSR_SET | \
> +				 IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE | \
> +				 IPU7_BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
>  
>  /* Iunit to CSE regs */
> -#define BUTTRESS_IU2CSEDB0_BUSY		BIT(31)
> -#define BUTTRESS_IU2CSEDB0_SHORT_FORMAT_SHIFT	27
> -#define BUTTRESS_IU2CSEDB0_CLIENT_ID_SHIFT	10
> -#define BUTTRESS_IU2CSEDB0_IPC_CLIENT_ID_VAL	2
> -
> -#define BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD		1
> -#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN		2
> -#define BUTTRESS_IU2CSEDATA0_IPC_AUTH_REPLACE		3
> -#define BUTTRESS_IU2CSEDATA0_IPC_UPDATE_SECURE_TOUCH	16
> -
> -#define BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE			BIT(0)
> -#define BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE			BIT(1)
> -#define BUTTRESS_CSE2IUDATA0_IPC_AUTH_REPLACE_DONE		BIT(2)
> -#define BUTTRESS_CSE2IUDATA0_IPC_UPDATE_SECURE_TOUCH_DONE	BIT(4)
> -
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1		BIT(0)
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2		BIT(1)
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE	BIT(2)
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ		BIT(3)
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID			BIT(4)
> -#define BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ		BIT(5)
> +#define IPU7_BUTTRESS_IU2CSEDB0_BUSY		BIT(31)
> +#define IPU7_BUTTRESS_IU2CSEDB0_SHORT_FORMAT_SHIFT	27
> +#define IPU7_BUTTRESS_IU2CSEDB0_CLIENT_ID_SHIFT	10
> +#define IPU7_BUTTRESS_IU2CSEDB0_IPC_CLIENT_ID_VAL	2
> +
> +#define IPU7_BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD		1
> +#define IPU7_BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN		2
> +#define IPU7_BUTTRESS_IU2CSEDATA0_IPC_AUTH_REPLACE		3
> +#define IPU7_BUTTRESS_IU2CSEDATA0_IPC_UPDATE_SECURE_TOUCH	16
> +
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE			BIT(0)
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE			BIT(1)
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_AUTH_REPLACE_DONE		BIT(2)
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_UPDATE_SECURE_TOUCH_DONE	BIT(4)
> +
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1		BIT(0)
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2		BIT(1)
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE	BIT(2)
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ		BIT(3)
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID			BIT(4)
> +#define IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ		BIT(5)
>  
>  /* 0x20 == NACK, 0xf == unknown command */
> -#define BUTTRESS_CSE2IUDATA0_IPC_NACK      0xf20
> -#define BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_NACK		0xf20
> +#define IPU7_BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK 0xffff
>  
>  /* IS/PS freq control */
> -#define BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xffU
> -#define BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xffU
> +#define IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK	0xff
> +#define IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK	0xff
>  
>  #define IPU7_IS_FREQ_MAX		450
>  #define IPU7_IS_FREQ_MIN		50
>  #define IPU7_PS_FREQ_MAX		750
> -#define BUTTRESS_PS_FREQ_RATIO_STEP		25U
> +#define IPU7_BUTTRESS_PS_FREQ_RATIO_STEP		25
>  /* valid for IPU8 */
> -#define BUTTRESS_IS_FREQ_RATIO_STEP		25U
> +#define IPU7_BUTTRESS_IS_FREQ_RATIO_STEP		25
>  
>  /* IS: 400mhz, PS: 500mhz */
>  #define IPU7_IS_FREQ_CTL_DEFAULT_RATIO		0x1b
> @@ -343,119 +343,119 @@
>  #define IPU8_IS_FREQ_CTL_DEFAULT_RATIO		0x10
>  #define IPU8_PS_FREQ_CTL_DEFAULT_RATIO		0x10
>  
> -#define IPU_FREQ_CTL_CDYN		0x80
> -#define IPU_FREQ_CTL_RATIO_SHIFT	0x0
> -#define IPU_FREQ_CTL_CDYN_SHIFT		0x8
> +#define IPU7_BUTTRESS_FREQ_CTL_CDYN		0x80
> +#define IPU7_BUTTRESS_FREQ_CTL_RATIO_SHIFT	0x0
> +#define IPU7_BUTTRESS_FREQ_CTL_CDYN_SHIFT		0x8
>  
> -/* buttree power status */
> -#define IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
> -#define IPU_BUTTRESS_PWR_STATE_IS_PWR_MASK	\
> -	(0x3U << IPU_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
> +/* buttress power status */
> +#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT	0
> +#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_MASK	\
> +	(0x3 << IPU7_BUTTRESS_PWR_STATE_IS_PWR_SHIFT)
>  
> -#define IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
> -#define IPU_BUTTRESS_PWR_STATE_PS_PWR_MASK	\
> -	(0x3U << IPU_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
> +#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT	4
> +#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_MASK	\
> +	(0x3 << IPU7_BUTTRESS_PWR_STATE_PS_PWR_SHIFT)
>  
> -#define IPU_BUTTRESS_PWR_STATE_DN_DONE		0x0
> -#define IPU_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
> -#define IPU_BUTTRESS_PWR_STATE_DN_PROCESS	0x2
> -#define IPU_BUTTRESS_PWR_STATE_UP_DONE		0x3
> +#define IPU7_BUTTRESS_PWR_STATE_DN_DONE		0x0
> +#define IPU7_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
> +#define IPU7_BUTTRESS_PWR_STATE_DN_PROCESS	0x2
> +#define IPU7_BUTTRESS_PWR_STATE_UP_DONE		0x3
>  
> -#define BUTTRESS_PWR_STATE_IS_PWR_SHIFT	3
> -#define BUTTRESS_PWR_STATE_IS_PWR_MASK	(0x3 << 3)
> +#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_FSM_SHIFT	3
> +#define IPU7_BUTTRESS_PWR_STATE_IS_PWR_FSM_MASK		(0x3 << 3)
>  
> -#define BUTTRESS_PWR_STATE_PS_PWR_SHIFT	6
> -#define BUTTRESS_PWR_STATE_PS_PWR_MASK	(0x3 << 6)
> +#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_FSM_SHIFT	6
> +#define IPU7_BUTTRESS_PWR_STATE_PS_PWR_FSM_MASK		(0x3 << 6)
>  
> -#define PS_FSM_CG		BIT(3)
> +#define IPU7_BUTTRESS_PS_FSM_CG		BIT(3)
>  
> -#define BUTTRESS_OVERRIDE_IS_CLK	BIT(1)
> -#define BUTTRESS_OVERRIDE_PS_CLK	BIT(2)
> +#define IPU7_BUTTRESS_OVERRIDE_IS_CLK	BIT(1)
> +#define IPU7_BUTTRESS_OVERRIDE_PS_CLK	BIT(2)
>  /* ps_pll only valid for ipu8 */
> -#define BUTTRESS_OWN_ACK_PS_PLL		BIT(8)
> -#define BUTTRESS_OWN_ACK_IS_CLK		BIT(9)
> -#define BUTTRESS_OWN_ACK_PS_CLK		BIT(10)
> +#define IPU7_BUTTRESS_OWN_ACK_PS_PLL		BIT(8)
> +#define IPU7_BUTTRESS_OWN_ACK_IS_CLK		BIT(9)
> +#define IPU7_BUTTRESS_OWN_ACK_PS_CLK		BIT(10)
>  
>  /* FW reset ctrl */
> -#define BUTTRESS_FW_RESET_CTL_START	BIT(0)
> -#define BUTTRESS_FW_RESET_CTL_DONE	BIT(1)
> +#define IPU7_BUTTRESS_FW_RESET_CTL_START	BIT(0)
> +#define IPU7_BUTTRESS_FW_RESET_CTL_DONE	BIT(1)
>  
>  /* security */
> -#define BUTTRESS_SECURITY_CTL_FW_SECURE_MODE		BIT(16)
> -#define BUTTRESS_SECURITY_CTL_FW_SETUP_MASK		GENMASK(4, 0)
> +#define IPU7_BUTTRESS_SECURITY_CTL_FW_SECURE_MODE		BIT(16)
> +#define IPU7_BUTTRESS_SECURITY_CTL_FW_SETUP_MASK		GENMASK(4, 0)
>  
> -#define BUTTRESS_SECURITY_CTL_FW_SETUP_DONE		BIT(0)
> -#define BUTTRESS_SECURITY_CTL_AUTH_DONE			BIT(1)
> -#define BUTTRESS_SECURITY_CTL_AUTH_FAILED		BIT(3)
> +#define IPU7_BUTTRESS_SECURITY_CTL_FW_SETUP_DONE		BIT(0)
> +#define IPU7_BUTTRESS_SECURITY_CTL_AUTH_DONE			BIT(1)
> +#define IPU7_BUTTRESS_SECURITY_CTL_AUTH_FAILED		BIT(3)
>  
>  /* D2D */
> -#define BUTTRESS_D2D_PWR_EN			BIT(0)
> -#define BUTTRESS_D2D_PWR_ACK			BIT(4)
> +#define IPU7_BUTTRESS_D2D_PWR_EN			BIT(0)
> +#define IPU7_BUTTRESS_D2D_PWR_ACK			BIT(4)
>  
>  /* NDE */
> -#define NDE_VAL_MASK				GENMASK(9, 0)
> -#define NDE_SCALE_MASK				GENMASK(12, 10)
> -#define NDE_VALID_MASK				BIT(13)
> -#define NDE_RESVEC_MASK				GENMASK(19, 16)
> -#define NDE_IN_VBLANK_DIS_MASK			BIT(31)
> +#define IPU7_BUTTRESS_NDE_VAL_MASK				GENMASK(9, 0)
> +#define IPU7_BUTTRESS_NDE_SCALE_MASK				GENMASK(12, 10)
> +#define IPU7_BUTTRESS_NDE_VALID_MASK				BIT(13)
> +#define IPU7_BUTTRESS_NDE_RESVEC_MASK				GENMASK(19, 16)
> +#define IPU7_BUTTRESS_NDE_IN_VBLANK_DIS_MASK			BIT(31)
>  
> -#define BUTTRESS_NDE_VAL_ACTIVE			48
> -#define BUTTRESS_NDE_SCALE_ACTIVE		2
> -#define BUTTRESS_NDE_VALID_ACTIVE		1
> +#define IPU7_BUTTRESS_NDE_VAL_ACTIVE			48
> +#define IPU7_BUTTRESS_NDE_SCALE_ACTIVE		2
> +#define IPU7_BUTTRESS_NDE_VALID_ACTIVE		1
>  
> -#define BUTTRESS_NDE_VAL_DEFAULT		1023
> -#define BUTTRESS_NDE_SCALE_DEFAULT		2
> -#define BUTTRESS_NDE_VALID_DEFAULT		0
> +#define IPU7_BUTTRESS_NDE_VAL_DEFAULT		1023
> +#define IPU7_BUTTRESS_NDE_SCALE_DEFAULT		2
> +#define IPU7_BUTTRESS_NDE_VALID_DEFAULT		0
>  
>  /* IS and PS UCX control */
> -#define UCX_CTL_RESET			BIT(0)
> -#define UCX_CTL_RUN			BIT(1)
> -#define UCX_CTL_WAKEUP			BIT(2)
> -#define UCX_CTL_SPARE			GENMASK(7, 3)
> -#define UCX_STS_PWR			GENMASK(17, 16)
> -#define UCX_STS_SLEEPING		BIT(18)
> +#define IPU7_BUTTRESS_UCX_CTL_RESET			BIT(0)
> +#define IPU7_BUTTRESS_UCX_CTL_RUN			BIT(1)
> +#define IPU7_BUTTRESS_UCX_CTL_WAKEUP			BIT(2)
> +#define IPU7_BUTTRESS_UCX_CTL_SPARE			GENMASK(7, 3)
> +#define IPU7_BUTTRESS_UCX_STS_PWR			GENMASK(17, 16)
> +#define IPU7_BUTTRESS_UCX_STS_SLEEPING		BIT(18)
>  
>  /* offset from PHY base */
> -#define PHY_CSI_CFG			0xc0
> -#define PHY_CSI_RCOMP_CONTROL		0xc8
> -#define PHY_CSI_BSCAN_EXCLUDE		0xd8
> +#define IPU7_BUTTRESS_PHY_CSI_CFG			0xc0
> +#define IPU7_BUTTRESS_PHY_CSI_RCOMP_CONTROL		0xc8
> +#define IPU7_BUTTRESS_PHY_CSI_BSCAN_EXCLUDE		0xd8
>  
> -#define PHY_CPHY_DLL_OVRD(x)		(0x100 + 0x100 * (x))
> -#define PHY_DPHY_DLL_OVRD(x)		(0x14c + 0x100 * (x))
> -#define PHY_CPHY_RX_CONTROL1(x)		(0x110 + 0x100 * (x))
> -#define PHY_CPHY_RX_CONTROL2(x)		(0x114 + 0x100 * (x))
> -#define PHY_DPHY_CFG(x)			(0x148 + 0x100 * (x))
> -#define PHY_BB_AFE_CONFIG(x)		(0x174 + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_CPHY_DLL_OVRD(x)		(0x100 + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_DPHY_DLL_OVRD(x)		(0x14c + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_CPHY_RX_CONTROL1(x)		(0x110 + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_CPHY_RX_CONTROL2(x)		(0x114 + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_DPHY_CFG(x)			(0x148 + 0x100 * (x))
> +#define IPU7_BUTTRESS_PHY_BB_AFE_CONFIG(x)		(0x174 + 0x100 * (x))
>  
>  /* PB registers */
> -#define INTERRUPT_STATUS			0x0
> -#define BTRS_LOCAL_INTERRUPT_MASK		0x4
> -#define GLOBAL_INTERRUPT_MASK			0x8
> -#define HM_ATS					0xc
> -#define ATS_ERROR_LOG1				0x10
> -#define ATS_ERROR_LOG2				0x14
> -#define ATS_ERROR_CLEAR				0x18
> -#define CFI_0_ERROR_LOG				0x1c
> -#define CFI_0_ERROR_CLEAR			0x20
> -#define HASH_CONFIG				0x2c
> -#define TLBID_HASH_ENABLE_31_0			0x30
> -#define TLBID_HASH_ENABLE_63_32			0x34
> -#define TLBID_HASH_ENABLE_95_64			0x38
> -#define TLBID_HASH_ENABLE_127_96		0x3c
> -#define CFI_1_ERROR_LOGGING			0x40
> -#define CFI_1_ERROR_CLEAR			0x44
> -#define IMR_ERROR_LOGGING_LOW			0x48
> -#define IMR_ERROR_LOGGING_HIGH			0x4c
> -#define IMR_ERROR_CLEAR				0x50
> -#define PORT_ARBITRATION_WEIGHTS		0x54
> -#define IMR_ERROR_LOGGING_CFI_1_LOW		0x58
> -#define IMR_ERROR_LOGGING_CFI_1_HIGH		0x5c
> -#define IMR_ERROR_CLEAR_CFI_1			0x60
> -#define BAR2_MISC_CONFIG			0x64
> -#define RSP_ID_CONFIG_AXI2CFI_0			0x68
> -#define RSP_ID_CONFIG_AXI2CFI_1			0x6c
> -#define PB_DRIVER_PCODE_MAILBOX_STATUS		0x70
> -#define PB_DRIVER_PCODE_MAILBOX_INTERFACE	0x74
> -#define PORT_ARBITRATION_WEIGHTS_ATS		0x78
> +#define IPU7_BUTTRESS_PB_INTERRUPT_STATUS			0x0
> +#define IPU7_BUTTRESS_PB_BTRS_LOCAL_INTERRUPT_MASK		0x4
> +#define IPU7_BUTTRESS_PB_GLOBAL_INTERRUPT_MASK			0x8
> +#define IPU7_BUTTRESS_PB_HM_ATS					0xc
> +#define IPU7_BUTTRESS_PB_ATS_ERROR_LOG1				0x10
> +#define IPU7_BUTTRESS_PB_ATS_ERROR_LOG2				0x14
> +#define IPU7_BUTTRESS_PB_ATS_ERROR_CLEAR				0x18
> +#define IPU7_BUTTRESS_PB_CFI_0_ERROR_LOG				0x1c
> +#define IPU7_BUTTRESS_PB_CFI_0_ERROR_CLEAR			0x20
> +#define IPU7_BUTTRESS_PB_HASH_CONFIG				0x2c
> +#define IPU7_BUTTRESS_PB_TLBID_HASH_ENABLE_31_0			0x30
> +#define IPU7_BUTTRESS_PB_TLBID_HASH_ENABLE_63_32			0x34
> +#define IPU7_BUTTRESS_PB_TLBID_HASH_ENABLE_95_64			0x38
> +#define IPU7_BUTTRESS_PB_TLBID_HASH_ENABLE_127_96		0x3c
> +#define IPU7_BUTTRESS_PB_CFI_1_ERROR_LOGGING			0x40
> +#define IPU7_BUTTRESS_PB_CFI_1_ERROR_CLEAR			0x44
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_LOGGING_LOW			0x48
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_LOGGING_HIGH			0x4c
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_CLEAR				0x50
> +#define IPU7_BUTTRESS_PB_PORT_ARBITRATION_WEIGHTS		0x54
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_LOGGING_CFI_1_LOW		0x58
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_LOGGING_CFI_1_HIGH		0x5c
> +#define IPU7_BUTTRESS_PB_IMR_ERROR_CLEAR_CFI_1			0x60
> +#define IPU7_BUTTRESS_PB_BAR2_MISC_CONFIG			0x64
> +#define IPU7_BUTTRESS_PB_RSP_ID_CONFIG_AXI2CFI_0			0x68
> +#define IPU7_BUTTRESS_PB_RSP_ID_CONFIG_AXI2CFI_1			0x6c
> +#define IPU7_BUTTRESS_PB_DRIVER_PCODE_MAILBOX_STATUS		0x70
> +#define IPU7_BUTTRESS_PB_DRIVER_PCODE_MAILBOX_INTERFACE	0x74
> +#define IPU7_BUTTRESS_PB_PORT_ARBITRATION_WEIGHTS_ATS		0x78
>  
>  #endif /* IPU7_BUTTRESS_REGS_H */
> diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
> index e5707f5e3..ac87ddd1c 100644
> --- a/drivers/staging/media/ipu7/ipu7-buttress.c
> +++ b/drivers/staging/media/ipu7/ipu7-buttress.c
> @@ -26,30 +26,30 @@
>  #include "ipu7-buttress.h"
>  #include "ipu7-buttress-regs.h"
>  
> -#define BOOTLOADER_STATUS_OFFSET	BUTTRESS_REG_FW_BOOT_PARAMS7
> +#define BOOTLOADER_STATUS_OFFSET	IPU7_BUTTRESS_REG_FW_BOOT_PARAMS7
>  
> -#define BOOTLOADER_MAGIC_KEY		0xb00710adU
> +#define BOOTLOADER_MAGIC_KEY		0xb00710ad
>  
> -#define ENTRY	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1
> -#define EXIT	BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2
> -#define QUERY	BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE
> +#define ENTRY	IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE1
> +#define EXIT	IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_COMP_ACTIONS_RST_PHASE2
> +#define QUERY	IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_QUERIED_IP_COMP_ACTIONS_RST_PHASE
>  
> -#define BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10U
> +#define IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX	10
>  
> -#define BUTTRESS_POWER_TIMEOUT_US		(200 * USEC_PER_MSEC)
> +#define IPU7_BUTTRESS_POWER_TIMEOUT_US		(200 * USEC_PER_MSEC)
>  
> -#define BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US	(5 * USEC_PER_SEC)
> -#define BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US	(10 * USEC_PER_SEC)
> -#define BUTTRESS_CSE_FWRESET_TIMEOUT_US		(100 * USEC_PER_MSEC)
> +#define IPU7_BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US	(5 * USEC_PER_SEC)
> +#define IPU7_BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US	(10 * USEC_PER_SEC)
> +#define IPU7_BUTTRESS_CSE_FWRESET_TIMEOUT_US		(100 * USEC_PER_MSEC)
>  
> -#define BUTTRESS_IPC_TX_TIMEOUT_MS		MSEC_PER_SEC
> -#define BUTTRESS_IPC_RX_TIMEOUT_MS		MSEC_PER_SEC
> -#define BUTTRESS_IPC_VALIDITY_TIMEOUT_US	(1 * USEC_PER_SEC)
> -#define BUTTRESS_TSC_SYNC_TIMEOUT_US		(5 * USEC_PER_MSEC)
> +#define IPU7_BUTTRESS_IPC_TX_TIMEOUT_MS		MSEC_PER_SEC
> +#define IPU7_BUTTRESS_IPC_RX_TIMEOUT_MS		MSEC_PER_SEC
> +#define IPU7_BUTTRESS_IPC_VALIDITY_TIMEOUT_US	(1 * USEC_PER_SEC)
> +#define IPU7_BUTTRESS_TSC_SYNC_TIMEOUT_US		(5 * USEC_PER_MSEC)
>  
> -#define BUTTRESS_IPC_RESET_RETRY		2000U
> -#define BUTTRESS_CSE_IPC_RESET_RETRY		4U
> -#define BUTTRESS_IPC_CMD_SEND_RETRY		1U
> +#define IPU7_BUTTRESS_IPC_RESET_RETRY		2000
> +#define IPU7_BUTTRESS_CSE_IPC_RESET_RETRY		4
> +#define IPU7_BUTTRESS_IPC_CMD_SEND_RETRY		1
>  
>  struct ipu7_ipc_buttress_msg {
>  	u32 cmd;
> @@ -59,14 +59,14 @@ struct ipu7_ipc_buttress_msg {
>  };
>  
>  static const u32 ipu7_adev_irq_mask[2] = {
> -	BUTTRESS_IRQ_IS_IRQ,
> -	BUTTRESS_IRQ_PS_IRQ
> +	IPU7_BUTTRESS_IRQ_IS_IRQ,
> +	IPU7_BUTTRESS_IRQ_PS_IRQ
>  };
>  
>  int ipu_buttress_ipc_reset(struct ipu7_device *isp,
>  			   struct ipu_buttress_ipc *ipc)
>  {
> -	unsigned int retries = BUTTRESS_IPC_RESET_RETRY;
> +	unsigned int retries = IPU7_BUTTRESS_IPC_RESET_RETRY;
>  	struct ipu_buttress *b = &isp->buttress;
>  	struct device *dev = &isp->pdev->dev;
>  	u32 val = 0, csr_in_clr;
> @@ -92,9 +92,9 @@ int ipu_buttress_ipc_reset(struct ipu7_device *isp,
>  	 * C. Possibly custom bits, depending on
>  	 * their role.
>  	 */
> -	csr_in_clr = BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ |
> -		BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID |
> -		BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ | QUERY;
> +	csr_in_clr = IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ |
> +		IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID |
> +		IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ | QUERY;
>  
>  	do {
>  		usleep_range(400, 500);
> @@ -182,7 +182,7 @@ int ipu_buttress_ipc_reset(struct ipu7_device *isp,
>  static void ipu_buttress_ipc_validity_close(struct ipu7_device *isp,
>  					    struct ipu_buttress_ipc *ipc)
>  {
> -	writel(BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
> +	writel(IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_DEASSERTED_REG_VALID_REQ,
>  	       isp->base + ipc->csr_out);
>  }
>  
> @@ -190,17 +190,17 @@ static int
>  ipu_buttress_ipc_validity_open(struct ipu7_device *isp,
>  			       struct ipu_buttress_ipc *ipc)
>  {
> -	unsigned int mask = BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
> +	unsigned int mask = IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ACKED_REG_VALID;
>  	void __iomem *addr;
>  	int ret;
>  	u32 val;
>  
> -	writel(BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
> +	writel(IPU7_BUTTRESS_IU2CSECSR_IPC_PEER_ASSERTED_REG_VALID_REQ,
>  	       isp->base + ipc->csr_out);
>  
>  	addr = isp->base + ipc->csr_in;
>  	ret = readl_poll_timeout(addr, val, val & mask, 200,
> -				 BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
> +				 IPU7_BUTTRESS_IPC_VALIDITY_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(&isp->pdev->dev, "CSE validity timeout 0x%x\n", val);
>  		ipu_buttress_ipc_validity_close(isp, ipc);
> @@ -221,7 +221,7 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
>  				     struct ipu7_ipc_buttress_msg *msg)
>  {
>  	unsigned long tx_timeout_jiffies, rx_timeout_jiffies;
> -	unsigned int retry = BUTTRESS_IPC_CMD_SEND_RETRY;
> +	unsigned int retry = IPU7_BUTTRESS_IPC_CMD_SEND_RETRY;
>  	struct ipu_buttress *b = &isp->buttress;
>  	struct ipu_buttress_ipc *ipc = &b->cse;
>  	struct device *dev = &isp->pdev->dev;
> @@ -237,8 +237,8 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
>  		goto out;
>  	}
>  
> -	tx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_TX_TIMEOUT_MS);
> -	rx_timeout_jiffies = msecs_to_jiffies(BUTTRESS_IPC_RX_TIMEOUT_MS);
> +	tx_timeout_jiffies = msecs_to_jiffies(IPU7_BUTTRESS_IPC_TX_TIMEOUT_MS);
> +	rx_timeout_jiffies = msecs_to_jiffies(IPU7_BUTTRESS_IPC_RX_TIMEOUT_MS);
>  
>  try:
>  	reinit_completion(&ipc->send_complete);
> @@ -247,7 +247,7 @@ static int ipu_buttress_ipc_send_msg(struct ipu7_device *isp,
>  
>  	dev_dbg(dev, "IPC command: 0x%x\n", msg->cmd);
>  	writel(msg->cmd, isp->base + ipc->data0_out);
> -	val = BUTTRESS_IU2CSEDB0_BUSY | msg->cmd_size;
> +	val = IPU7_BUTTRESS_IU2CSEDB0_BUSY | msg->cmd_size;
>  	writel(val, isp->base + ipc->db0_out);
>  
>  	tout = wait_for_completion_timeout(&ipc->send_complete,
> @@ -364,14 +364,14 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>  			 readl(isp->pb_base + IMR_ERROR_LOGGING_CFI_1_HIGH));
>  	}
>  
> -	irq_status = readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
> +	irq_status = readl(isp->base + IPU7_BUTTRESS_REG_IRQ_STATUS);
>  	if (!irq_status) {
>  		pm_runtime_put_noidle(dev);
>  		return IRQ_NONE;
>  	}
>  
>  	do {
> -		writel(irq_status, isp->base + BUTTRESS_REG_IRQ_CLEAR);
> +		writel(irq_status, isp->base + IPU7_BUTTRESS_REG_IRQ_CLEAR);
>  
>  		for (i = 0; i < ARRAY_SIZE(ipu7_adev_irq_mask); i++) {
>  			irqreturn_t r = ipu_buttress_call_isr(adev[i]);
> @@ -387,37 +387,37 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>  			}
>  		}
>  
> -		if (irq_status & (BUTTRESS_IRQS | BUTTRESS_IRQ_SAI_VIOLATION) &&
> +		if (irq_status & (IPU7_BUTTRESS_IRQS | IPU7_BUTTRESS_IRQ_SAI_VIOLATION) &&
>  		    ret == IRQ_NONE)
>  			ret = IRQ_HANDLED;
>  
> -		if (irq_status & BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING) {
> -			dev_dbg(dev, "BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING\n");
> +		if (irq_status & IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING) {
> +			dev_dbg(dev, "IPU7_BUTTRESS_IRQ_IPC_FROM_CSE_IS_WAITING\n");
>  			ipu_buttress_ipc_recv(isp, &b->cse, &b->cse.recv_data);
>  			complete(&b->cse.recv_complete);
>  		}
>  
> -		if (irq_status & BUTTRESS_IRQ_CSE_CSR_SET)
> -			dev_dbg(dev, "BUTTRESS_IRQ_CSE_CSR_SET\n");
> +		if (irq_status & IPU7_BUTTRESS_IRQ_CSE_CSR_SET)
> +			dev_dbg(dev, "IPU7_BUTTRESS_IRQ_CSE_CSR_SET\n");
>  
> -		if (irq_status & BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE) {
> -			dev_dbg(dev, "BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE\n");
> +		if (irq_status & IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE) {
> +			dev_dbg(dev, "IPU7_BUTTRESS_IRQ_IPC_EXEC_DONE_BY_CSE\n");
>  			complete(&b->cse.send_complete);
>  		}
>  
> -		if (irq_status & BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
> -			dev_dbg(dev, "BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ\n");
> +		if (irq_status & IPU7_BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ)
> +			dev_dbg(dev, "IPU7_BUTTRESS_IRQ_PUNIT_2_IUNIT_IRQ\n");
>  
> -		if (irq_status & BUTTRESS_IRQ_SAI_VIOLATION &&
> +		if (irq_status & IPU7_BUTTRESS_IRQ_SAI_VIOLATION &&
>  		    ipu_buttress_get_secure_mode(isp))
> -			dev_err(dev, "BUTTRESS_IRQ_SAI_VIOLATION\n");
> +			dev_err(dev, "IPU7_BUTTRESS_IRQ_SAI_VIOLATION\n");
>  
> -		irq_status = readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
> +		irq_status = readl(isp->base + IPU7_BUTTRESS_REG_IRQ_STATUS);
>  	} while (irq_status);
>  
>  	if (disable_irqs)
> -		writel(BUTTRESS_IRQS & ~disable_irqs,
> -		       isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +		writel(IPU7_BUTTRESS_IRQS & ~disable_irqs,
> +		       isp->base + IPU7_BUTTRESS_REG_IRQ_ENABLE);
>  
>  	pm_runtime_put(dev);
>  
> @@ -442,7 +442,7 @@ irqreturn_t ipu_buttress_isr_threaded(int irq, void *isp_ptr)
>  			ret = IRQ_HANDLED;
>  	}
>  
> -	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +	writel(IPU7_BUTTRESS_IRQS, isp->base + IPU7_BUTTRESS_REG_IRQ_ENABLE);
>  
>  	return ret;
>  }
> @@ -451,22 +451,22 @@ static int isys_d2d_power(struct device *dev, bool on)
>  {
>  	struct ipu7_device *isp = to_ipu7_bus_device(dev)->isp;
>  	int ret = 0;
> -	u32 target = on ? BUTTRESS_D2D_PWR_ACK : 0U;
> +	u32 target = on ? IPU7_BUTTRESS_D2D_PWR_ACK : 0;
>  	u32 val;
>  
>  	dev_dbg(dev, "power %s isys d2d.\n", on ? "UP" : "DOWN");
> -	val = readl(isp->base + BUTTRESS_REG_D2D_CTL);
> -	if ((val & BUTTRESS_D2D_PWR_ACK) == target) {
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
> +	if ((val & IPU7_BUTTRESS_D2D_PWR_ACK) == target) {
>  		dev_info(dev, "d2d already in %s state.\n",
>  			 on ? "UP" : "DOWN");
>  		return 0;
>  	}
>  
> -	val = on ? val | BUTTRESS_D2D_PWR_EN : val & (~BUTTRESS_D2D_PWR_EN);
> -	writel(val, isp->base + BUTTRESS_REG_D2D_CTL);
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_D2D_CTL,
> -				 val, (val & BUTTRESS_D2D_PWR_ACK) == target,
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +	val = on ? val | IPU7_BUTTRESS_D2D_PWR_EN : val & (~IPU7_BUTTRESS_D2D_PWR_EN);
> +	writel(val, isp->base + IPU7_BUTTRESS_REG_D2D_CTL);
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_D2D_CTL,
> +				 val, (val & IPU7_BUTTRESS_D2D_PWR_ACK) == target,
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret)
>  		dev_err(dev, "power %s d2d timeout. status: 0x%x\n",
>  			on ? "UP" : "DOWN", val);
> @@ -481,18 +481,18 @@ static void isys_nde_control(struct device *dev, bool on)
>  	u32 nde_reg;
>  
>  	if (on) {
> -		value = BUTTRESS_NDE_VAL_ACTIVE;
> -		scale = BUTTRESS_NDE_SCALE_ACTIVE;
> -		valid = BUTTRESS_NDE_VALID_ACTIVE;
> +		value = IPU7_BUTTRESS_NDE_VAL_ACTIVE;
> +		scale = IPU7_BUTTRESS_NDE_SCALE_ACTIVE;
> +		valid = IPU7_BUTTRESS_NDE_VALID_ACTIVE;
>  	} else {
> -		value = BUTTRESS_NDE_VAL_DEFAULT;
> -		scale = BUTTRESS_NDE_SCALE_DEFAULT;
> -		valid = BUTTRESS_NDE_VALID_DEFAULT;
> +		value = IPU7_BUTTRESS_NDE_VAL_DEFAULT;
> +		scale = IPU7_BUTTRESS_NDE_SCALE_DEFAULT;
> +		valid = IPU7_BUTTRESS_NDE_VALID_DEFAULT;
>  	}
>  
>  	/* only set the fabrics resource ownership for ipu8 */
> -	nde_reg = is_ipu8(isp->hw_ver) ? IPU8_BUTTRESS_REG_NDE_CONTROL :
> -		IPU7_BUTTRESS_REG_NDE_CONTROL;
> +	nde_reg = is_ipu8(isp->hw_ver) ? IPU8_IPU7_BUTTRESS_REG_NDE_CONTROL :
> +		IPU7_IPU7_BUTTRESS_REG_NDE_CONTROL;
>  	resvec = is_ipu8(isp->hw_ver) ? 0x2 : 0xe;
>  	val = FIELD_PREP(NDE_VAL_MASK, value) |
>  		FIELD_PREP(NDE_SCALE_MASK, scale) |
> @@ -523,12 +523,12 @@ static int ipu7_buttress_powerup(struct device *dev,
>  	}
>  
>  	/* request clock resource ownership */
> -	val = readl(isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
>  	val |= ctrl->ovrd_clk;
> -	writel(val, isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SLEEP_LEVEL_STS,
> +	writel(val, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS,
>  				 val, (val & ctrl->own_clk_ack),
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret)
>  		dev_warn(dev, "request clk ownership timeout. status 0x%x\n",
>  			 val);
> @@ -539,9 +539,9 @@ static int ipu7_buttress_powerup(struct device *dev,
>  		ctrl->subsys_id == IPU_IS ? "IS" : "PS");
>  	writel(val, isp->base + ctrl->freq_ctl);
>  
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS,
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS,
>  				 val, ((val & ctrl->pwr_sts_mask) == exp_sts),
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "%s power up timeout with status: 0x%x\n",
>  			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
> @@ -552,9 +552,9 @@ static int ipu7_buttress_powerup(struct device *dev,
>  		ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
>  
>  	/* release clock resource ownership */
> -	val = readl(isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
>  	val &= ~ctrl->ovrd_clk;
> -	writel(val, isp->base + BUTTRESS_REG_SLEEP_LEVEL_CFG);
> +	writel(val, isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_CFG);
>  
>  out_power:
>  	mutex_unlock(&isp->buttress.power_mutex);
> @@ -575,14 +575,14 @@ static int ipu7_buttress_powerdown(struct device *dev,
>  	mutex_lock(&isp->buttress.power_mutex);
>  
>  	exp_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
> -	val = 0x8U << ctrl->ratio_shift;
> +	val = 0x8 << ctrl->ratio_shift;
>  
>  	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
>  		ctrl->subsys_id == IPU_IS ? "IS" : "PS");
>  	writel(val, isp->base + ctrl->freq_ctl);
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS,
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS,
>  				 val, ((val & ctrl->pwr_sts_mask) == exp_sts),
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "%s power down timeout with status: 0x%x\n",
>  			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
> @@ -606,7 +606,7 @@ static int ipu8_buttress_powerup(struct device *dev,
>  				 const struct ipu_buttress_ctrl *ctrl)
>  {
>  	struct ipu7_device *isp = to_ipu7_bus_device(dev)->isp;
> -	u32 sleep_level_reg = BUTTRESS_REG_SLEEP_LEVEL_STS;
> +	u32 sleep_level_reg = IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS;
>  	u32 val, exp_sts;
>  	int ret = 0;
>  
> @@ -624,10 +624,10 @@ static int ipu8_buttress_powerup(struct device *dev,
>  
>  	/* request ps_pll when psys freq > 400Mhz */
>  	if (ctrl->subsys_id == IPU_PS && ctrl->ratio > 0x10) {
> -		writel(1, isp->base + BUTTRESS_REG_PS_PLL_ENABLE);
> +		writel(1, isp->base + IPU7_BUTTRESS_REG_PS_PLL_ENABLE);
>  		ret = readl_poll_timeout(isp->base + sleep_level_reg,
>  					 val, (val & ctrl->own_clk_ack),
> -					 100, BUTTRESS_POWER_TIMEOUT_US);
> +					 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  		if (ret)
>  			dev_warn(dev, "ps_pll req ack timeout. status 0x%x\n",
>  				 val);
> @@ -637,9 +637,9 @@ static int ipu8_buttress_powerup(struct device *dev,
>  	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
>  		ctrl->subsys_id == IPU_IS ? "IS" : "PS");
>  	writel(val, isp->base + ctrl->freq_ctl);
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS,
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS,
>  				 val, ((val & ctrl->pwr_sts_mask) == exp_sts),
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "%s power up timeout with status: 0x%x\n",
>  			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
> @@ -668,16 +668,16 @@ static int ipu8_buttress_powerdown(struct device *dev,
>  	exp_sts = ctrl->pwr_sts_off << ctrl->pwr_sts_shift;
>  
>  	if (ctrl->subsys_id == IPU_PS)
> -		val = 0x10U << ctrl->ratio_shift;
> +		val = 0x10 << ctrl->ratio_shift;
>  	else
> -		val = 0x8U << ctrl->ratio_shift;
> +		val = 0x8 << ctrl->ratio_shift;
>  
>  	dev_dbg(dev, "set 0x%x to %s_WORKPOINT_REQ.\n", val,
>  		ctrl->subsys_id == IPU_IS ? "IS" : "PS");
>  	writel(val, isp->base + ctrl->freq_ctl);
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS,
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS,
>  				 val, ((val & ctrl->pwr_sts_mask) == exp_sts),
> -				 100, BUTTRESS_POWER_TIMEOUT_US);
> +				 100, IPU7_BUTTRESS_POWER_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "%s power down timeout with status: 0x%x\n",
>  			ctrl->subsys_id == IPU_IS ? "IS" : "PS", val);
> @@ -693,9 +693,9 @@ static int ipu8_buttress_powerdown(struct device *dev,
>  	}
>  
>  	if (ctrl->subsys_id == IPU_PS) {
> -		val = readl(isp->base + BUTTRESS_REG_SLEEP_LEVEL_STS);
> +		val = readl(isp->base + IPU7_BUTTRESS_REG_SLEEP_LEVEL_STS);
>  		if (val & ctrl->own_clk_ack)
> -			writel(0, isp->base + BUTTRESS_REG_PS_PLL_ENABLE);
> +			writel(0, isp->base + IPU7_BUTTRESS_REG_PS_PLL_ENABLE);
>  	}
>  	mutex_unlock(&isp->buttress.power_mutex);
>  
> @@ -728,9 +728,9 @@ bool ipu_buttress_get_secure_mode(struct ipu7_device *isp)
>  {
>  	u32 val;
>  
> -	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_SECURITY_CTL);
>  
> -	return val & BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
> +	return val & IPU7_BUTTRESS_SECURITY_CTL_FW_SECURE_MODE;
>  }
>  
>  bool ipu_buttress_auth_done(struct ipu7_device *isp)
> @@ -740,10 +740,10 @@ bool ipu_buttress_auth_done(struct ipu7_device *isp)
>  	if (!isp->secure_mode)
>  		return true;
>  
> -	val = readl(isp->base + BUTTRESS_REG_SECURITY_CTL);
> -	val = FIELD_GET(BUTTRESS_SECURITY_CTL_FW_SETUP_MASK, val);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_SECURITY_CTL);
> +	val = FIELD_GET(IPU7_BUTTRESS_SECURITY_CTL_FW_SETUP_MASK, val);
>  
> -	return val == BUTTRESS_SECURITY_CTL_AUTH_DONE;
> +	return val == IPU7_BUTTRESS_SECURITY_CTL_AUTH_DONE;
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu_buttress_auth_done, "INTEL_IPU7");
>  
> @@ -759,14 +759,14 @@ int ipu_buttress_get_isys_freq(struct ipu7_device *isp, u32 *freq)
>  		return ret;
>  	}
>  
> -	reg_val = readl(isp->base + BUTTRESS_REG_IS_WORKPOINT_REQ);
> +	reg_val = readl(isp->base + IPU7_BUTTRESS_REG_IS_WORKPOINT_REQ);
>  
>  	pm_runtime_put(&isp->isys->auxdev.dev);
>  
>  	if (is_ipu8(isp->hw_ver))
> -		*freq = (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 25;
> +		*freq = (reg_val & IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 25;
>  	else
> -		*freq = (reg_val & BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 50 / 3;
> +		*freq = (reg_val & IPU7_BUTTRESS_IS_FREQ_CTL_RATIO_MASK) * 50 / 3;
>  
>  	return 0;
>  }
> @@ -784,12 +784,12 @@ int ipu_buttress_get_psys_freq(struct ipu7_device *isp, u32 *freq)
>  		return ret;
>  	}
>  
> -	reg_val = readl(isp->base + BUTTRESS_REG_PS_WORKPOINT_REQ);
> +	reg_val = readl(isp->base + IPU7_BUTTRESS_REG_PS_WORKPOINT_REQ);
>  
>  	pm_runtime_put(&isp->psys->auxdev.dev);
>  
> -	reg_val &= BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
> -	*freq = BUTTRESS_PS_FREQ_RATIO_STEP * reg_val;
> +	reg_val &= IPU7_BUTTRESS_PS_FREQ_CTL_RATIO_MASK;
> +	*freq = IPU7_BUTTRESS_PS_FREQ_RATIO_STEP * reg_val;
>  
>  	return 0;
>  }
> @@ -806,19 +806,19 @@ int ipu_buttress_reset_authentication(struct ipu7_device *isp)
>  		return 0;
>  	}
>  
> -	writel(BUTTRESS_FW_RESET_CTL_START, isp->base +
> -	       BUTTRESS_REG_FW_RESET_CTL);
> +	writel(IPU7_BUTTRESS_FW_RESET_CTL_START, isp->base +
> +	       IPU7_BUTTRESS_REG_FW_RESET_CTL);
>  
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_FW_RESET_CTL, val,
> -				 val & BUTTRESS_FW_RESET_CTL_DONE, 500,
> -				 BUTTRESS_CSE_FWRESET_TIMEOUT_US);
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_FW_RESET_CTL, val,
> +				 val & IPU7_BUTTRESS_FW_RESET_CTL_DONE, 500,
> +				 IPU7_BUTTRESS_CSE_FWRESET_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "Time out while resetting authentication state\n");
>  		return ret;
>  	}
>  
>  	dev_dbg(dev, "FW reset for authentication done\n");
> -	writel(0, isp->base + BUTTRESS_REG_FW_RESET_CTL);
> +	writel(0, isp->base + IPU7_BUTTRESS_REG_FW_RESET_CTL);
>  	/* leave some time for HW restore */
>  	usleep_range(800, 1000);
>  
> @@ -845,13 +845,13 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
>  	}
>  
>  	/*
> -	 * BUTTRESS_REG_FW_SOURCE_BASE needs to be set with FW CPD
> +	 * IPU7_BUTTRESS_REG_FW_SOURCE_BASE needs to be set with FW CPD
>  	 * package address for secure mode.
>  	 */
>  
> -	writel(isp->cpd_fw->size, isp->base + BUTTRESS_REG_FW_SOURCE_SIZE);
> +	writel(isp->cpd_fw->size, isp->base + IPU7_BUTTRESS_REG_FW_SOURCE_SIZE);
>  	writel(sg_dma_address(isp->psys->fw_sgt.sgl),
> -	       isp->base + BUTTRESS_REG_FW_SOURCE_BASE);
> +	       isp->base + IPU7_BUTTRESS_REG_FW_SOURCE_BASE);
>  
>  	/*
>  	 * Write boot_load into IU2CSEDATA0
> @@ -859,21 +859,21 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
>  	 */
>  	dev_info(dev, "Sending BOOT_LOAD to CSE\n");
> -	ret = ipu_buttress_ipc_send(isp, BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
> +	ret = ipu_buttress_ipc_send(isp, IPU7_BUTTRESS_IU2CSEDATA0_IPC_BOOT_LOAD,
>  				    1, true,
> -				    BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
> +				    IPU7_BUTTRESS_CSE2IUDATA0_IPC_BOOT_LOAD_DONE);
>  	if (ret) {
>  		dev_err(dev, "CSE boot_load failed\n");
>  		goto out_unlock;
>  	}
>  
> -	mask = BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
> -	done = BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
> -	fail = BUTTRESS_SECURITY_CTL_AUTH_FAILED;
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
> +	mask = IPU7_BUTTRESS_SECURITY_CTL_FW_SETUP_MASK;
> +	done = IPU7_BUTTRESS_SECURITY_CTL_FW_SETUP_DONE;
> +	fail = IPU7_BUTTRESS_SECURITY_CTL_AUTH_FAILED;
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_SECURITY_CTL, data,
>  				 ((data & mask) == done ||
>  				  (data & mask) == fail), 500,
> -				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
> +				 IPU7_BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "CSE boot_load timeout\n");
>  		goto out_unlock;
> @@ -887,7 +887,7 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
>  
>  	ret = readl_poll_timeout(isp->base + BOOTLOADER_STATUS_OFFSET,
>  				 data, data == BOOTLOADER_MAGIC_KEY, 500,
> -				 BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
> +				 IPU7_BUTTRESS_CSE_BOOTLOAD_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "Unexpected magic number 0x%x\n", data);
>  		goto out_unlock;
> @@ -899,19 +899,19 @@ int ipu_buttress_authenticate(struct ipu7_device *isp)
>  	 * IU2CSEDB.IU2CSECMD and set IU2CSEDB.IU2CSEBUSY as
>  	 */
>  	dev_info(dev, "Sending AUTHENTICATE_RUN to CSE\n");
> -	ret = ipu_buttress_ipc_send(isp, BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
> +	ret = ipu_buttress_ipc_send(isp, IPU7_BUTTRESS_IU2CSEDATA0_IPC_AUTH_RUN,
>  				    1, true,
> -				    BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
> +				    IPU7_BUTTRESS_CSE2IUDATA0_IPC_AUTH_RUN_DONE);
>  	if (ret) {
>  		dev_err(dev, "CSE authenticate_run failed\n");
>  		goto out_unlock;
>  	}
>  
> -	done = BUTTRESS_SECURITY_CTL_AUTH_DONE;
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_SECURITY_CTL, data,
> +	done = IPU7_BUTTRESS_SECURITY_CTL_AUTH_DONE;
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_SECURITY_CTL, data,
>  				 ((data & mask) == done ||
>  				  (data & mask) == fail), 500,
> -				 BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
> +				 IPU7_BUTTRESS_CSE_AUTHENTICATE_TIMEOUT_US);
>  	if (ret) {
>  		dev_err(dev, "CSE authenticate timeout\n");
>  		goto out_unlock;
> @@ -936,22 +936,22 @@ static int ipu_buttress_send_tsc_request(struct ipu7_device *isp)
>  	u32 val, mask, done;
>  	int ret;
>  
> -	mask = BUTTRESS_PWR_STATUS_HH_STATUS_MASK;
> +	mask = IPU7_BUTTRESS_PWR_STATUS_HH_STATUS_MASK;
>  
> -	writel(BUTTRESS_TSC_CMD_START_TSC_SYNC,
> -	       isp->base + BUTTRESS_REG_TSC_CMD);
> +	writel(IPU7_BUTTRESS_TSC_CMD_START_TSC_SYNC,
> +	       isp->base + IPU7_BUTTRESS_REG_TSC_CMD);
>  
> -	val = readl(isp->base + BUTTRESS_REG_PWR_STATUS);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS);
>  	val = FIELD_GET(mask, val);
> -	if (val == BUTTRESS_PWR_STATUS_HH_STATE_ERR) {
> +	if (val == IPU7_BUTTRESS_PWR_STATUS_HH_STATE_ERR) {
>  		dev_err(&isp->pdev->dev, "Start tsc sync failed\n");
>  		return -EINVAL;
>  	}
>  
> -	done = BUTTRESS_PWR_STATUS_HH_STATE_DONE;
> -	ret = readl_poll_timeout(isp->base + BUTTRESS_REG_PWR_STATUS, val,
> +	done = IPU7_BUTTRESS_PWR_STATUS_HH_STATE_DONE;
> +	ret = readl_poll_timeout(isp->base + IPU7_BUTTRESS_REG_PWR_STATUS, val,
>  				 FIELD_GET(mask, val) == done, 500,
> -				 BUTTRESS_TSC_SYNC_TIMEOUT_US);
> +				 IPU7_BUTTRESS_TSC_SYNC_TIMEOUT_US);
>  	if (ret)
>  		dev_err(&isp->pdev->dev, "Start tsc sync timeout\n");
>  
> @@ -965,8 +965,8 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
>  	u32 val;
>  
>  	if (is_ipu8(isp->hw_ver)) {
> -		for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> -			val = readl(base + BUTTRESS_REG_PB_TIMESTAMP_VALID);
> +		for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> +			val = readl(base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID);
>  			if (val == 1)
>  				return 0;
>  			usleep_range(40, 50);
> @@ -977,12 +977,12 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
>  	}
>  
>  	if (is_ipu7p5(isp->hw_ver)) {
> -		val = readl(base + BUTTRESS_REG_TSC_CTL);
> -		val |= BUTTRESS_SEL_PB_TIMESTAMP;
> -		writel(val, base + BUTTRESS_REG_TSC_CTL);
> +		val = readl(base + IPU7_BUTTRESS_REG_TSC_CTL);
> +		val |= IPU7_BUTTRESS_SEL_PB_TIMESTAMP;
> +		writel(val, base + IPU7_BUTTRESS_REG_TSC_CTL);
>  
> -		for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> -			val = readl(base + BUTTRESS_REG_PB_TIMESTAMP_VALID);
> +		for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> +			val = readl(base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_VALID);
>  			if (val == 1)
>  				return 0;
>  			usleep_range(40, 50);
> @@ -993,18 +993,18 @@ int ipu_buttress_start_tsc_sync(struct ipu7_device *isp)
>  		return -ETIMEDOUT;
>  	}
>  
> -	for (i = 0; i < BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
> +	for (i = 0; i < IPU7_BUTTRESS_TSC_SYNC_RESET_TRIAL_MAX; i++) {
>  		int ret;
>  
>  		ret = ipu_buttress_send_tsc_request(isp);
>  		if (ret != -ETIMEDOUT)
>  			return ret;
>  
> -		val = readl(base + BUTTRESS_REG_TSC_CTL);
> -		val = val | BUTTRESS_TSW_WA_SOFT_RESET;
> -		writel(val, base + BUTTRESS_REG_TSC_CTL);
> -		val = val & (~BUTTRESS_TSW_WA_SOFT_RESET);
> -		writel(val, base + BUTTRESS_REG_TSC_CTL);
> +		val = readl(base + IPU7_BUTTRESS_REG_TSC_CTL);
> +		val = val | IPU7_BUTTRESS_TSW_WA_SOFT_RESET;
> +		writel(val, base + IPU7_BUTTRESS_REG_TSC_CTL);
> +		val = val & (~IPU7_BUTTRESS_TSW_WA_SOFT_RESET);
> +		writel(val, base + IPU7_BUTTRESS_REG_TSC_CTL);
>  	}
>  
>  	dev_err(&isp->pdev->dev, "TSC sync failed (timeout)\n");
> @@ -1020,11 +1020,11 @@ void ipu_buttress_tsc_read(struct ipu7_device *isp, u64 *val)
>  
>  	local_irq_save(flags);
>  	if (is_ipu7(isp->hw_ver)) {
> -		tsc_lo = readl(isp->base + BUTTRESS_REG_TSC_LO);
> -		tsc_hi = readl(isp->base + BUTTRESS_REG_TSC_HI);
> +		tsc_lo = readl(isp->base + IPU7_BUTTRESS_REG_TSC_LO);
> +		tsc_hi = readl(isp->base + IPU7_BUTTRESS_REG_TSC_HI);
>  	} else {
> -		tsc_lo = readl(isp->base + BUTTRESS_REG_PB_TIMESTAMP_LO);
> -		tsc_hi = readl(isp->base + BUTTRESS_REG_PB_TIMESTAMP_HI);
> +		tsc_lo = readl(isp->base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_LO);
> +		tsc_hi = readl(isp->base + IPU7_BUTTRESS_REG_PB_TIMESTAMP_HI);
>  	}
>  	*val = (u64)tsc_hi << 32 | tsc_lo;
>  	local_irq_restore(flags);
> @@ -1051,9 +1051,9 @@ void ipu_buttress_wakeup_is_uc(const struct ipu7_device *isp)
>  {
>  	u32 val;
>  
> -	val = readl(isp->base + BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
>  	val |= UCX_CTL_WAKEUP;
> -	writel(val, isp->base + BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
> +	writel(val, isp->base + IPU7_BUTTRESS_REG_DRV_IS_UCX_CONTROL_STATUS);
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu_buttress_wakeup_is_uc, "INTEL_IPU7");
>  
> @@ -1061,9 +1061,9 @@ void ipu_buttress_wakeup_ps_uc(const struct ipu7_device *isp)
>  {
>  	u32 val;
>  
> -	val = readl(isp->base + BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
>  	val |= UCX_CTL_WAKEUP;
> -	writel(val, isp->base + BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
> +	writel(val, isp->base + IPU7_BUTTRESS_REG_DRV_PS_UCX_CONTROL_STATUS);
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu_buttress_wakeup_ps_uc, "INTEL_IPU7");
>  
> @@ -1082,10 +1082,10 @@ static void ipu_buttress_setup(struct ipu7_device *isp)
>  	writel(0, isp->pb_base + GLOBAL_INTERRUPT_MASK);
>  	val = readl(isp->pb_base + BAR2_MISC_CONFIG);
>  	if (is_ipu7(isp->hw_ver) || x86_match_cpu(ipu_misc_cfg_exclusion))
> -		val |= 0x100U;
> +		val |= 0x100;
>  	else
>  		val |= FIELD_PREP(WRXREQOP_OVRD_VAL_MASK, 0xf) |
> -			BIT(18) | 0x100U;
> +			BIT(18) | 0x100;
>  
>  	writel(val, isp->pb_base + BAR2_MISC_CONFIG);
>  	val = readl(isp->pb_base + BAR2_MISC_CONFIG);
> @@ -1110,11 +1110,11 @@ static void ipu_buttress_setup(struct ipu7_device *isp)
>  			readl(isp->pb_base + TLBID_HASH_ENABLE_127_96));
>  	}
>  
> -	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_CLEAR);
> -	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_MASK);
> -	writel(BUTTRESS_IRQS, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +	writel(IPU7_BUTTRESS_IRQS, isp->base + IPU7_BUTTRESS_REG_IRQ_CLEAR);
> +	writel(IPU7_BUTTRESS_IRQS, isp->base + IPU7_BUTTRESS_REG_IRQ_MASK);
> +	writel(IPU7_BUTTRESS_IRQS, isp->base + IPU7_BUTTRESS_REG_IRQ_ENABLE);
>  	/* LNL SW workaround for PS PD hang when PS sub-domain during PD */
> -	writel(PS_FSM_CG, isp->base + BUTTRESS_REG_CG_CTRL_BITS);
> +	writel(PS_FSM_CG, isp->base + IPU7_BUTTRESS_REG_CG_CTRL_BITS);
>  }
>  
>  void ipu_buttress_restore(struct ipu7_device *isp)
> @@ -1123,12 +1123,12 @@ void ipu_buttress_restore(struct ipu7_device *isp)
>  
>  	ipu_buttress_setup(isp);
>  
> -	writel(b->wdt_cached_value, isp->base + BUTTRESS_REG_IDLE_WDT);
> +	writel(b->wdt_cached_value, isp->base + IPU7_BUTTRESS_REG_IDLE_WDT);
>  }
>  
>  int ipu_buttress_init(struct ipu7_device *isp)
>  {
> -	int ret, ipc_reset_retry = BUTTRESS_CSE_IPC_RESET_RETRY;
> +	int ret, ipc_reset_retry = IPU7_BUTTRESS_CSE_IPC_RESET_RETRY;
>  	struct ipu_buttress *b = &isp->buttress;
>  	struct device *dev = &isp->pdev->dev;
>  	u32 val;
> @@ -1140,21 +1140,21 @@ int ipu_buttress_init(struct ipu7_device *isp)
>  	init_completion(&b->cse.send_complete);
>  	init_completion(&b->cse.recv_complete);
>  
> -	b->cse.nack = BUTTRESS_CSE2IUDATA0_IPC_NACK;
> -	b->cse.nack_mask = BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
> -	b->cse.csr_in = BUTTRESS_REG_CSE2IUCSR;
> -	b->cse.csr_out = BUTTRESS_REG_IU2CSECSR;
> -	b->cse.db0_in = BUTTRESS_REG_CSE2IUDB0;
> -	b->cse.db0_out = BUTTRESS_REG_IU2CSEDB0;
> -	b->cse.data0_in = BUTTRESS_REG_CSE2IUDATA0;
> -	b->cse.data0_out = BUTTRESS_REG_IU2CSEDATA0;
> +	b->cse.nack = IPU7_BUTTRESS_CSE2IUDATA0_IPC_NACK;
> +	b->cse.nack_mask = IPU7_BUTTRESS_CSE2IUDATA0_IPC_NACK_MASK;
> +	b->cse.csr_in = IPU7_BUTTRESS_REG_CSE2IUCSR;
> +	b->cse.csr_out = IPU7_BUTTRESS_REG_IU2CSECSR;
> +	b->cse.db0_in = IPU7_BUTTRESS_REG_CSE2IUDB0;
> +	b->cse.db0_out = IPU7_BUTTRESS_REG_IU2CSEDB0;
> +	b->cse.data0_in = IPU7_BUTTRESS_REG_CSE2IUDATA0;
> +	b->cse.data0_out = IPU7_BUTTRESS_REG_IU2CSEDATA0;
>  
>  	isp->secure_mode = ipu_buttress_get_secure_mode(isp);
> -	val = readl(isp->base + BUTTRESS_REG_IPU_SKU);
> -	dev_info(dev, "IPU%u SKU %u in %s mode mask 0x%x\n", val & 0xfU,
> -		 (val >> 4) & 0x7U, isp->secure_mode ? "secure" : "non-secure",
> -		 readl(isp->base + BUTTRESS_REG_CAMERA_MASK));
> -	b->wdt_cached_value = readl(isp->base + BUTTRESS_REG_IDLE_WDT);
> +	val = readl(isp->base + IPU7_BUTTRESS_REG_IPU_SKU);
> +	dev_info(dev, "IPU%u SKU %u in %s mode mask 0x%x\n", val & 0xf,
> +		 (val >> 4) & 0x7, isp->secure_mode ? "secure" : "non-secure",
> +		 readl(isp->base + IPU7_BUTTRESS_REG_CAMERA_MASK));
> +	b->wdt_cached_value = readl(isp->base + IPU7_BUTTRESS_REG_IDLE_WDT);
>  	b->ref_clk = 384;
>  
>  	ipu_buttress_setup(isp);
> @@ -1184,7 +1184,7 @@ void ipu_buttress_exit(struct ipu7_device *isp)
>  {
>  	struct ipu_buttress *b = &isp->buttress;
>  
> -	writel(0, isp->base + BUTTRESS_REG_IRQ_ENABLE);
> +	writel(0, isp->base + IPU7_BUTTRESS_REG_IRQ_ENABLE);
>  	mutex_destroy(&b->power_mutex);
>  	mutex_destroy(&b->auth_mutex);
>  	mutex_destroy(&b->cons_mutex);
> diff --git a/drivers/staging/media/ipu7/ipu7-cpd.c b/drivers/staging/media/ipu7/ipu7-cpd.c
> index 4f49fb57e..c8af80bb1 100644
> --- a/drivers/staging/media/ipu7/ipu7-cpd.c
> +++ b/drivers/staging/media/ipu7/ipu7-cpd.c
> @@ -21,21 +21,21 @@
>  #define MAX_MANIFEST_SIZE	(SZ_4K * sizeof(u32))
>  
>  #define CPD_MANIFEST_IDX	0
> -#define CPD_BINARY_START_IDX	1U
> -#define CPD_METADATA_START_IDX	2U
> -#define CPD_BINARY_NUM		2U /* ISYS + PSYS */
> +#define CPD_BINARY_START_IDX	1
> +#define CPD_METADATA_START_IDX	2
> +#define CPD_BINARY_NUM		2 /* ISYS + PSYS */
>  /*
>   * Entries include:
>   * 1 manifest entry.
>   * 1 metadata entry for each sub system(ISYS and PSYS).
>   * 1 binary entry for each sub system(ISYS and PSYS).
>   */
> -#define CPD_ENTRY_NUM		(CPD_BINARY_NUM * 2U + 1U)
> +#define CPD_ENTRY_NUM		(CPD_BINARY_NUM * 2 + 1)
>  
>  #define CPD_METADATA_ATTR	0xa
>  #define CPD_METADATA_IPL	0x1c
> -#define ONLINE_METADATA_SIZE	128U
> -#define ONLINE_METADATA_LINES	6U
> +#define ONLINE_METADATA_SIZE	128
> +#define ONLINE_METADATA_LINES	6
>  
>  struct ipu7_cpd_hdr {
>  	u32 hdr_mark;
> @@ -228,7 +228,7 @@ int ipu7_cpd_validate_cpd_file(struct ipu7_device *isp, const void *cpd_file,
>  		unsigned int l;
>  
>  		ent = ipu7_cpd_get_entry(cpd_file,
> -					 CPD_BINARY_START_IDX + i * 2U);
> +					 CPD_BINARY_START_IDX + i * 2);
>  		memcpy(info, (u8 *)cpd_file + ent->offset + ent->len -
>  		       ONLINE_METADATA_SIZE, ONLINE_METADATA_SIZE);
>  		for (l = 0; l < ONLINE_METADATA_LINES; l++) {
> @@ -259,7 +259,7 @@ int ipu7_cpd_copy_binary(const void *cpd, const char *name,
>  
>  	for (i = 0; i < CPD_BINARY_NUM; i++) {
>  		const struct ipu7_cpd_ent *binary =
> -			ipu7_cpd_get_entry(cpd, CPD_BINARY_START_IDX + i * 2U);
> +			ipu7_cpd_get_entry(cpd, CPD_BINARY_START_IDX + i * 2);
>  		const struct ipu7_cpd_metadata *metadata =
>  			ipu7_cpd_get_metadata(cpd, i);
>  
> diff --git a/drivers/staging/media/ipu7/ipu7-dma.c b/drivers/staging/media/ipu7/ipu7-dma.c
> index a118b41b2..b1b5d3ef5 100644
> --- a/drivers/staging/media/ipu7/ipu7-dma.c
> +++ b/drivers/staging/media/ipu7/ipu7-dma.c
> @@ -79,14 +79,14 @@ static struct page **__alloc_buffer(size_t size, gfp_t gfp, unsigned long attrs)
>  
>  		if (order) {
>  			split_page(pages[i], order);
> -			j = 1U << order;
> +			j = 1 << order;

This one introduces at least a theoretical bug.

>  			while (j--)
>  				pages[i + j] = pages[i] + j;
>  		}
>  
>  		__clear_buffer(pages[i], PAGE_SIZE << order, attrs);
> -		i += 1U << order;
> -		count -= 1U << order;
> +		i += 1 << order;
> +		count -= 1 << order;

Ditto.

>  	}
>  
>  	return pages;
> @@ -405,7 +405,7 @@ int ipu7_dma_map_sg(struct ipu7_bus_device *sys, struct scatterlist *sglist,
>  		unsigned long lo, hi;
>  
>  		lo = iova_pfn(&mmu->dmap->iovad, IPU_FW_CODE_REGION_START);
> -		hi = iova_pfn(&mmu->dmap->iovad, IPU_FW_CODE_REGION_END) - 1U;
> +		hi = iova_pfn(&mmu->dmap->iovad, IPU_FW_CODE_REGION_END) - 1;
>  		iova = reserve_iova(&mmu->dmap->iovad, lo, hi);
>  		if (!iova) {
>  			dev_err(dev, "Reserve iova[%lx:%lx] failed.\n", lo, hi);
> diff --git a/drivers/staging/media/ipu7/ipu7-fw-isys.c b/drivers/staging/media/ipu7/ipu7-fw-isys.c
> index e4b9c3645..eff3c8f02 100644
> --- a/drivers/staging/media/ipu7/ipu7-fw-isys.c
> +++ b/drivers/staging/media/ipu7/ipu7-fw-isys.c
> @@ -145,8 +145,8 @@ int ipu7_fw_isys_init(struct ipu7_isys *isys)
>  	isys_config->logger_config.use_channels_enable_bitmask = 1;
>  	isys_config->logger_config.channels_enable_bitmask =
>  		LOGGER_CONFIG_CHANNEL_ENABLE_SYSCOM_BITMASK;
> -	isys_config->logger_config.hw_printf_buffer_base_addr = 0U;
> -	isys_config->logger_config.hw_printf_buffer_size_bytes = 0U;
> +	isys_config->logger_config.hw_printf_buffer_base_addr = 0;
> +	isys_config->logger_config.hw_printf_buffer_size_bytes = 0;
>  	isys_config->wdt_config.wdt_timer1_us = 0;
>  	isys_config->wdt_config.wdt_timer2_us = 0;
>  	ret = ipu_buttress_get_isys_freq(adev->isp, &freq);
> @@ -159,7 +159,7 @@ int ipu7_fw_isys_init(struct ipu7_isys *isys)
>  	ipu7_dma_sync_single(adev, isys_config_dma_addr,
>  			     sizeof(struct ipu7_insys_config));
>  
> -	major = is_ipu8(adev->isp->hw_ver) ? 2U : 1U;
> +	major = is_ipu8(adev->isp->hw_ver) ? 2 : 1;
>  	ret = ipu7_boot_init_boot_config(adev, queue_configs, num_queues,
>  					 freq, isys_config_dma_addr, major);
>  	if (ret)
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> index 2d5717883..46877099b 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> @@ -23,12 +23,12 @@
>  #include "ipu7-platform-regs.h"
>  #include "ipu7-isys-csi-phy.h"
>  
> -#define PORT_A		0U
> -#define PORT_B		1U
> -#define PORT_C		2U
> -#define PORT_D		3U
> +#define PORT_A		0
> +#define PORT_B		1
> +#define PORT_C		2
> +#define PORT_D		3
>  
> -#define N_DATA_IDS	8U
> +#define N_DATA_IDS	8
>  static DECLARE_BITMAP(data_ids, N_DATA_IDS);
>  
>  struct ddlcal_counter_ref_s {
> @@ -38,6 +38,18 @@ struct ddlcal_counter_ref_s {
>  	u16 ddlcal_counter_ref;
>  };
>  
> +struct ipu7_isys_csi_phy_hw_variant {
> +	u32 hw_ver;
> +	u32 common_val;
> +	u8 max_lanes;
> +};
> +
> +static const struct ipu7_isys_csi_phy_hw_variant ipu7_variant = {
> +	.hw_ver = 0x70,
> +	.common_val = 0x155,
> +	.max_lanes = 4,
> +};

These appear to be unused.

> +
>  struct ddlcal_params {
>  	u16 min_mbps;
>  	u16 max_mbps;
> @@ -130,7 +142,7 @@ static const struct cdr_fbk_cap_prog_params table7[] = {
>  static void dwc_phy_write(struct ipu7_isys *isys, u32 id, u32 addr, u16 data)
>  {
>  	void __iomem *isys_base = isys->pdata->base;
> -	void __iomem *base = isys_base + IS_IO_CDPHY_BASE(id);
> +	void __iomem *base = isys_base + IPU7_ISYS_IO_CDPHY_BASE(id);
>  
>  	dev_dbg(&isys->adev->auxdev.dev, "phy write: reg 0x%zx = data 0x%04x",
>  		base + addr - isys_base, data);
> @@ -140,7 +152,7 @@ static void dwc_phy_write(struct ipu7_isys *isys, u32 id, u32 addr, u16 data)
>  static u16 dwc_phy_read(struct ipu7_isys *isys, u32 id, u32 addr)
>  {
>  	void __iomem *isys_base = isys->pdata->base;
> -	void __iomem *base = isys_base + IS_IO_CDPHY_BASE(id);
> +	void __iomem *base = isys_base + IPU7_ISYS_IO_CDPHY_BASE(id);
>  	u16 data;
>  
>  	data = readw(base + addr);
> @@ -198,7 +210,7 @@ static void dwc_phy_write_mask(struct ipu7_isys *isys, u32 id, u32 addr,
>  	WARN_ON(lo > hi);
>  	WARN_ON(hi > 15);
>  
> -	mask = ((~0U - (1U << lo) + 1U)) & (~0U >> (31 - hi));
> +	mask = ((~0 - (1 << lo) + 1)) & (~0 >> (31 - hi));
>  	temp = dwc_phy_read(isys, id, addr);
>  	temp &= ~mask;
>  	temp |= (val << lo) & mask;
> @@ -212,7 +224,7 @@ static void dwc_csi_write_mask(struct ipu7_isys *isys, u32 id, u32 addr,
>  
>  	WARN_ON(lo > hi);
>  
> -	mask = ((~0U - (1U << lo) + 1U)) & (~0U >> (31 - hi));
> +	mask = ((~0 - (1 << lo) + 1)) & (~0 >> (31 - hi));
>  	temp = dwc_csi_read(isys, id, addr);
>  	temp &= ~mask;
>  	temp |= (val << lo) & mask;
> @@ -339,7 +351,7 @@ static int ipu7_isys_csi_ctrl_dids_config(struct ipu7_isys_csi2 *csi2, u32 id)
>  	return 0;
>  }
>  
> -#define CDPHY_TIMEOUT 5000000U
> +#define CDPHY_TIMEOUT 5000000
>  static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
>  {
>  	void __iomem *isys_base = isys->pdata->base;
> @@ -353,7 +365,7 @@ static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
>  
>  	dev_dbg(dev, "waiting phy ready...\n");
>  	ret = readl_poll_timeout(gpreg + PHY_READY, phy_ready,
> -				 phy_ready & BIT(0) && phy_ready != ~0U,
> +				 phy_ready & BIT(0) && phy_ready != ~0,
>  				 100, CDPHY_TIMEOUT);
>  	dev_dbg(dev, "phy %u ready = 0x%08x\n", id, readl(gpreg + PHY_READY));
>  	dev_dbg(dev, "csi %u PHY_RX = 0x%08x\n", id,
> @@ -362,8 +374,8 @@ static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
>  		dwc_csi_read(isys, id, PHY_STOPSTATE));
>  	dev_dbg(dev, "csi %u PHY_CAL = 0x%08x\n", id,
>  		dwc_csi_read(isys, id, PHY_CAL));
> -	for (i = 0; i < 4U; i++) {
> -		reg = CORE_DIG_DLANE_0_R_HS_RX_0 + (i * 0x400U);
> +	for (i = 0; i < 4; i++) {
> +		reg = CORE_DIG_DLANE_0_R_HS_RX_0 + (i * 0x400);
>  		dev_dbg(dev, "phy %u DLANE%u skewcal = 0x%04x\n",
>  			id, i, dwc_phy_read(isys, id, reg));
>  	}
> @@ -385,7 +397,7 @@ static int ipu7_isys_phy_ready(struct ipu7_isys *isys, u32 id)
>  		}
>  
>  		rext = dwc_phy_read(isys, id,
> -				    CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15) & 0xfU;
> +				    CORE_DIG_IOCTRL_R_AFE_CB_CTRL_2_15) & 0xf;
>  		dev_dbg(dev, "phy %u rext value = %u\n", id, rext);
>  		isys->phy_rext_cal = (rext ? rext : 5);
>  
> @@ -730,7 +742,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	u16 deass_thresh;
>  	u16 delay_thresh;
>  	u16 reset_thresh;
> -	u16 cap_prog = 6U;
> +	u16 cap_prog = 6;
>  	u16 reg;
>  	u16 val;
>  	u32 i;
> @@ -753,7 +765,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	for (i = 0; i < trios; i++)
>  		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 6, 8, 11);
>  
> -	val = (mbps > 900U) ? 1U : 0U;
> +	val = (mbps > 900) ? 1 : 0;
>  	for (i = 0; i < trios; i++) {
>  		reg = CORE_DIG_CLANE_0_RW_HS_RX_0;
>  		dwc_phy_write_mask(isys, id, reg + (i * 0x400), 1, 0, 0);
> @@ -774,7 +786,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  	 * The formula is suitable for data rate 80-3500Msps.
>  	 * Timebase (us) = 1, DIV = 32, TDDL (UI) = 0.5
>  	 */
> -	if (mbps >= 80U)
> +	if (mbps >= 80)
>  		coarse_target = DIV_ROUND_UP_ULL(mbps, 16) - 1;
>  	else
>  		coarse_target = 56;
> @@ -807,7 +819,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
>  	}
>  
> -	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
> +	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5, &r64) + 1;
>  	if (r64 != 0)
>  		deass_thresh++;
>  
> @@ -816,7 +828,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   deass_thresh, 0, 7);
>  
> -	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;
> +	delay_thresh = div64_u64((224 - (9 * 7)) * 1000, 5 * mbps) - 7u;
>  
>  	if (delay_thresh < 1)
>  		delay_thresh = 1;
> @@ -826,7 +838,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
>  				   delay_thresh, 0, 15);
>  
> -	reset_thresh = (u16)div_u64_rem(2U * 5U * mbps, 7U * 1000U, &r);
> +	reset_thresh = (u16)div_u64_rem(2 * 5 * mbps, 7 * 1000, &r);
>  	if (!r)
>  		reset_thresh--;
>  
> @@ -859,8 +871,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
>  
>  	for (i = 0; i < (lanes + 1); i++) {
>  		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_9 + 0x400 * i;
> -		dwc_phy_write_mask(isys, id, reg, 4U, 0, 2);
> -		dwc_phy_write_mask(isys, id, reg, 0U, 3, 4);
> +		dwc_phy_write_mask(isys, id, reg, 4, 0, 2);
> +		dwc_phy_write_mask(isys, id, reg, 0, 3, 4);
>  
>  		reg = CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_7 + 0x400 * i;
>  		dwc_phy_write_mask(isys, id, reg, cap_prog, 10, 12);
> @@ -967,7 +979,7 @@ int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2)
>  	ipu7_isys_csi_phy_reset(isys, id);
>  	gpreg_write(isys, id, PHY_CLK_LANE_CONTROL, 0x1);
>  	gpreg_write(isys, id, PHY_CLK_LANE_FORCE_CONTROL, 0x2);
> -	gpreg_write(isys, id, PHY_LANE_CONTROL_EN, (1U << lanes) - 1U);
> +	gpreg_write(isys, id, PHY_LANE_CONTROL_EN, (1 << lanes) - 1);
>  	gpreg_write(isys, id, PHY_LANE_FORCE_CONTROL, 0xf);
>  	gpreg_write(isys, id, PHY_MODE, csi2->phy_mode);
>  
> @@ -1029,6 +1041,6 @@ void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2)
>  
>  	ipu7_isys_csi_phy_reset(isys, csi2->port);
>  	if (!is_ipu7(isys->adev->isp->hw_ver) &&
> -	    csi2->nlanes > 2U && csi2->port == PORT_A)
> +	    csi2->nlanes > 2 && csi2->port == PORT_A)
>  		ipu7_isys_csi_phy_reset(isys, PORT_B);
>  }
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
> index dfdcb6154..9663372a0 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
> @@ -8,8 +8,8 @@
>  
>  struct ipu7_isys;
>  
> -#define PHY_MODE_DPHY		0U
> -#define PHY_MODE_CPHY		1U
> +#define PHY_MODE_DPHY		0
> +#define PHY_MODE_CPHY		1
>  
>  int ipu7_isys_csi_phy_powerup(struct ipu7_isys_csi2 *csi2);
>  void ipu7_isys_csi_phy_powerdown(struct ipu7_isys_csi2 *csi2);
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
> index aad52c44a..4837dde9a 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
> @@ -54,7 +54,7 @@
>  #define IS_MAIN_IRQ_CTL_LEVEL_NOT_PULSE		(IS_MAIN_IRQ_CTRL_BASE + 0x14)
>  
>  /* IS IO regs base */
> -#define IS_PHY_NUM				4U
> +#define IS_PHY_NUM				4
>  #define IS_IO_BASE				0x280000
>  
>  /* dwc csi cdphy registers */
> @@ -1003,7 +1003,7 @@
>  #define PORT_ARB_IRQ_CTL_CLEAR			0x8
>  #define PORT_ARB_IRQ_CTL_ENABLE			0xc
>  
> -#define MGC_PPC					4U
> +#define MGC_PPC					4
>  #define MGC_DTYPE_RAW(i)			(((i) - 8) / 2)
>  #define IS_IO_MGC_BASE				(IS_IO_BASE + 0x48000)
>  #define MGC_KICK				0x0
> @@ -1048,8 +1048,8 @@
>  #define MGC_MG_BUSY_STTS			0xa8
>  #define MGC_MG_STOPPED_STTS			0xac
>  /* tile width and height in pixels for Chess board and Color palette */
> -#define MGC_TPG_TILE_WIDTH			64U
> -#define MGC_TPG_TILE_HEIGHT			64U
> +#define MGC_TPG_TILE_WIDTH			64
> +#define MGC_TPG_TILE_HEIGHT			64
>  
>  #define IPU_CSI_PORT_A_ADDR_OFFSET		0x0
>  #define IPU_CSI_PORT_B_ADDR_OFFSET		0x0
> @@ -1152,8 +1152,8 @@
>  #define IPU7_CSI_RX_SYNC_IRQ_MASK		0x0
>  #define IPU7P5_CSI_RX_SYNC_FE_IRQ_MASK		0x0
>  
> -#define CSI_RX_NUM_ERRORS_IN_IRQ		12U
> -#define CSI_RX_NUM_SYNC_IN_IRQ			32U
> +#define CSI_RX_NUM_ERRORS_IN_IRQ		12
> +#define CSI_RX_NUM_SYNC_IN_IRQ			32
>  
>  enum CSI_FE_MODE_TYPE {
>  	CSI_FE_DPHY_MODE = 0,
> @@ -1187,7 +1187,7 @@ enum CSI2HOST_SELECTION {
>  #define CSI_REG_PORT_GPREG_CSI2_SLV_REG_SRST	0x4
>  #define CSI_REG_PORT_GPREG_CSI2_PORT_CONTROL	0x8
>  
> -#define CSI_RX_NUM_IRQ				32U
> +#define CSI_RX_NUM_IRQ				32
>  
>  #define IPU7_CSI_RX_SYNC_FS_VC			0x55555555
>  #define IPU7_CSI_RX_SYNC_FE_VC			0xaaaaaaaa
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.c b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> index f34eabfe8..abeafe746 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.c
> @@ -168,7 +168,7 @@ static int ipu7_isys_csi2_enable_stream(struct ipu7_isys_csi2 *csi2)
>  	dev_dbg(dev, "port %u CLK_GATE = 0x%04x DIV_FACTOR_APB_CLK=0x%04x\n",
>  		port, readl(isys_base + offset + CSI_PORT_CLK_GATE),
>  		readl(isys_base + offset + CLK_DIV_FACTOR_APB_CLK));
> -	if (port == 0U && nlanes == 4U && !is_ipu7(isys->adev->isp->hw_ver)) {
> +	if (port == 0 && nlanes == 4 && !is_ipu7(isys->adev->isp->hw_ver)) {
>  		dev_dbg(dev, "CSI port %u in aggregation mode\n", port);
>  		writel(0x1, isys_base + offset + CSI_PORTAB_AGGREGATION);
>  	}
> @@ -221,8 +221,8 @@ static int ipu7_isys_csi2_set_sel(struct v4l2_subdev *sd,
>  	sel->r.width = sink_ffmt->width;
>  	/* Non-bayer formats can't be single line cropped */
>  	if (!ipu7_isys_is_bayer_format(sink_ffmt->code))
> -		sel->r.top &= ~1U;
> -	sel->r.height = clamp(sel->r.height & ~1U, IPU_ISYS_MIN_HEIGHT,
> +		sel->r.top &= ~1;
> +	sel->r.height = clamp(sel->r.height & ~1, IPU_ISYS_MIN_HEIGHT,
>  			      sink_ffmt->height - sel->r.top);
>  	*crop = sel->r;
>  
> @@ -412,9 +412,9 @@ int ipu7_isys_csi2_init(struct ipu7_isys_csi2 *csi2,
>  	csi2->port = index;
>  
>  	if (!is_ipu7(isys->adev->isp->hw_ver))
> -		csi2->legacy_irq_mask = 0x7U << (index * 3U);
> +		csi2->legacy_irq_mask = 0x7 << (index * 3);
>  	else
> -		csi2->legacy_irq_mask = 0x3U << (index * 2U);
> +		csi2->legacy_irq_mask = 0x3 << (index * 2);
>  
>  	dev_dbg(dev, "csi-%d legacy irq mask = 0x%x\n", index,
>  		csi2->legacy_irq_mask);
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi2.h b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
> index 6c23b80f9..a83b9a1e2 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-csi2.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys-csi2.h
> @@ -16,12 +16,12 @@ struct ipu7_isys;
>  struct ipu7_isys_csi2_pdata;
>  struct ipu7_isys_stream;
>  
> -#define IPU7_NR_OF_CSI2_VC		16U
> +#define IPU7_NR_OF_CSI2_VC		16
>  #define INVALID_VC_ID			-1
> -#define IPU7_NR_OF_CSI2_SINK_PADS	1U
> -#define IPU7_CSI2_PAD_SINK		0U
> -#define IPU7_NR_OF_CSI2_SRC_PADS	8U
> -#define IPU7_CSI2_PAD_SRC		1U
> +#define IPU7_NR_OF_CSI2_SINK_PADS	1
> +#define IPU7_CSI2_PAD_SINK		0
> +#define IPU7_NR_OF_CSI2_SRC_PADS	8
> +#define IPU7_CSI2_PAD_SRC		1
>  #define IPU7_NR_OF_CSI2_PADS		(IPU7_NR_OF_CSI2_SINK_PADS + \
>  					 IPU7_NR_OF_CSI2_SRC_PADS)
>  
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-subdev.c b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> index 67a776033..b17c8ae55 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-subdev.c
> @@ -95,7 +95,7 @@ u32 ipu7_isys_convert_bayer_order(u32 code, int x, int y)
>  	if (WARN_ON(i == ARRAY_SIZE(code_map)))
>  		return code;
>  
> -	return code_map[i ^ ((((u32)y & 1U) << 1U) | ((u32)x & 1U))];
> +	return code_map[i ^ ((((u32)y & 1) << 1) | ((u32)x & 1))];
>  }
>  
>  int ipu7_isys_subdev_set_fmt(struct v4l2_subdev *sd,
> @@ -295,7 +295,7 @@ int ipu7_isys_subdev_init(struct ipu7_isys_subdev *asd,
>  
>  	ret = media_entity_pads_init(&asd->sd.entity, num_pads, asd->pad);
>  	if (ret) {
> -		pr_err("isys subdev init failed %d.\n", ret);
> +		dev_err(&isys->adev->auxdev.dev, "subdev init failed %d.\n", ret);
>  		return ret;
>  	}
>  
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
> index 8c6730833..f9fe08041 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-video.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
> @@ -56,12 +56,16 @@ const struct ipu7_isys_pixelformat ipu7_isys_pfmts[] = {
>  	 IPU_INSYS_FRAME_FORMAT_RAW16},
>  	{V4L2_PIX_FMT_SBGGR8, 8, 8, MEDIA_BUS_FMT_SBGGR8_1X8,
>  	 IPU_INSYS_FRAME_FORMAT_RAW8},
> +	{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
>  	{V4L2_PIX_FMT_SGBRG8, 8, 8, MEDIA_BUS_FMT_SGBRG8_1X8,
>  	 IPU_INSYS_FRAME_FORMAT_RAW8},
> +	{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
>  	{V4L2_PIX_FMT_SGRBG8, 8, 8, MEDIA_BUS_FMT_SGRBG8_1X8,
>  	 IPU_INSYS_FRAME_FORMAT_RAW8},
> +	{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
>  	{V4L2_PIX_FMT_SRGGB8, 8, 8, MEDIA_BUS_FMT_SRGGB8_1X8,
>  	 IPU_INSYS_FRAME_FORMAT_RAW8},
> +	{V4L2_META_FMT_IPU7_STATS, 0, 0, 0, IPU_INSYS_FRAME_FORMAT_RAW8},
>  	{V4L2_PIX_FMT_SBGGR12P, 12, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
>  	 IPU_INSYS_FRAME_FORMAT_RAW12},
>  	{V4L2_PIX_FMT_SGBRG12P, 12, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
> @@ -119,7 +123,7 @@ static int ipu7_isys_vidioc_enum_fmt(struct file *file, void *fh,
>  	unsigned int i, num_found;
>  
>  	for (i = 0, num_found = 0; i < ARRAY_SIZE(ipu7_isys_pfmts); i++) {
> -		if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE && f->type != V4L2_BUF_TYPE_META_CAPTURE)
>  			continue;
>  
>  		if (f->mbus_code && f->mbus_code != ipu7_isys_pfmts[i].code)
> @@ -191,7 +195,7 @@ static void ipu7_isys_try_fmt_cap(struct ipu7_isys_video *av, u32 type,
>  	else
>  		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
>  
> -	*bytesperline = ALIGN(*bytesperline, 64U);
> +	*bytesperline = ALIGN(*bytesperline, 64);
>  
>  	/*
>  	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
> @@ -658,7 +662,7 @@ void ipu7_isys_put_stream(struct ipu7_isys_stream *stream)
>  	unsigned int i;
>  
>  	if (!stream) {
> -		pr_err("ipu7-isys: no available stream\n");
> +		dev_err(&isys->adev->auxdev.dev, " no available stream\n");
>  		return;
>  	}
>  
> @@ -1024,7 +1028,7 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
>  	int ret;
>  
>  	mutex_init(&av->mutex);
> -	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
> +	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | | V4L2_CAP_META_CAPTURE
>  		V4L2_CAP_VIDEO_CAPTURE;
>  	av->vdev.vfl_dir = VFL_DIR_RX;
>  
> diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.h b/drivers/staging/media/ipu7/ipu7-isys-video.h
> index 1ac1787fa..476a7b429 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys-video.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys-video.h
> @@ -17,8 +17,8 @@
>  
>  #include "ipu7-isys-queue.h"
>  
> -#define IPU_INSYS_OUTPUT_PINS		11U
> -#define IPU_ISYS_MAX_PARALLEL_SOF	2U
> +#define IPU_INSYS_OUTPUT_PINS		11
> +#define IPU_ISYS_MAX_PARALLEL_SOF	2
>  
>  struct file;
>  struct ipu7_isys;
> @@ -26,6 +26,8 @@ struct ipu7_isys_csi2;
>  struct ipu7_insys_stream_cfg;
>  struct ipu7_isys_subdev;
>  
> +#define V4L2_META_FMT_IPU7_STATS v4l2_fourcc("I", "P", "7", "S")
> +
>  struct ipu7_isys_pixelformat {
>  	u32 pixelformat;
>  	u32 bpp;
> diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
> index cb2f49f3e..b785c1655 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys.c
> +++ b/drivers/staging/media/ipu7/ipu7-isys.c
> @@ -296,7 +296,7 @@ static int isys_register_video_devices(struct ipu7_isys *isys)
>  	return 0;
>  
>  fail:
> -	i = i + 1U;
> +	i = i + 1;
>  	while (i--) {
>  		while (j--)
>  			ipu7_isys_video_cleanup(&isys->csi2[i].av[j]);
> @@ -995,13 +995,13 @@ int isys_isr_one(struct ipu7_bus_device *adev)
>  			ipu7_isys_csi2_sof_event_by_stream(stream);
>  
>  		stream->seq[stream->seq_index].sequence =
> -			atomic_read(&stream->sequence) - 1U;
> +			atomic_read(&stream->sequence) - 1;
>  		stream->seq[stream->seq_index].timestamp = ts;
>  		dev_dbg(dev,
>  			"SOF: stream %u frame %u (index %u), ts 0x%16.16llx\n",
>  			resp->stream_id, resp->frame_id,
>  			stream->seq[stream->seq_index].sequence, ts);
> -		stream->seq_index = (stream->seq_index + 1U)
> +		stream->seq_index = (stream->seq_index + 1)
>  			% IPU_ISYS_MAX_PARALLEL_SOF;
>  		break;
>  	case IPU_INSYS_RESP_TYPE_FRAME_EOF:
> @@ -1054,16 +1054,16 @@ static void ipu7_isys_csi2_isr(struct ipu7_isys_csi2 *csi2)
>  			continue;
>  
>  		if (!is_ipu7(isp->hw_ver)) {
> -			if (sync & IPU7P5_CSI_RX_SYNC_FS_VC & (1U << vc))
> +			if (sync & IPU7P5_CSI_RX_SYNC_FS_VC & (1 << vc))
>  				ipu7_isys_csi2_sof_event_by_stream(s);
>  
> -			if (fe & IPU7P5_CSI_RX_SYNC_FE_VC & (1U << vc))
> +			if (fe & IPU7P5_CSI_RX_SYNC_FE_VC & (1 << vc))
>  				ipu7_isys_csi2_eof_event_by_stream(s);
>  		} else {
> -			if (sync & IPU7_CSI_RX_SYNC_FS_VC & (1U << (vc * 2)))
> +			if (sync & IPU7_CSI_RX_SYNC_FS_VC & (1 << (vc * 2)))
>  				ipu7_isys_csi2_sof_event_by_stream(s);
>  
> -			if (sync & IPU7_CSI_RX_SYNC_FE_VC & (2U << (vc * 2)))
> +			if (sync & IPU7_CSI_RX_SYNC_FE_VC & (2 << (vc * 2)))
>  				ipu7_isys_csi2_eof_event_by_stream(s);
>  		}
>  	}
> diff --git a/drivers/staging/media/ipu7/ipu7-isys.h b/drivers/staging/media/ipu7/ipu7-isys.h
> index ef1ab1b42..c898ff959 100644
> --- a/drivers/staging/media/ipu7/ipu7-isys.h
> +++ b/drivers/staging/media/ipu7/ipu7-isys.h
> @@ -28,21 +28,21 @@
>  #define IPU_ISYS_ENTITY_PREFIX		"Intel IPU7"
>  
>  /* FW support max 16 streams */
> -#define IPU_ISYS_MAX_STREAMS		16U
> +#define IPU_ISYS_MAX_STREAMS		16
>  
>  /*
>   * Current message queue configuration. These must be big enough
>   * so that they never gets full. Queues are located in system memory
>   */
> -#define IPU_ISYS_SIZE_RECV_QUEUE	40U
> -#define IPU_ISYS_SIZE_LOG_QUEUE		256U
> -#define IPU_ISYS_SIZE_SEND_QUEUE	40U
> -#define IPU_ISYS_NUM_RECV_QUEUE		1U
> -
> -#define IPU_ISYS_MIN_WIDTH		2U
> -#define IPU_ISYS_MIN_HEIGHT		2U
> -#define IPU_ISYS_MAX_WIDTH		8160U
> -#define IPU_ISYS_MAX_HEIGHT		8190U
> +#define IPU_ISYS_SIZE_RECV_QUEUE	40
> +#define IPU_ISYS_SIZE_LOG_QUEUE		256
> +#define IPU_ISYS_SIZE_SEND_QUEUE	40
> +#define IPU_ISYS_NUM_RECV_QUEUE		1
> +
> +#define IPU_ISYS_MIN_WIDTH		2
> +#define IPU_ISYS_MIN_HEIGHT		2
> +#define IPU_ISYS_MAX_WIDTH		8160
> +#define IPU_ISYS_MAX_HEIGHT		8190
>  
>  #define FW_CALL_TIMEOUT_JIFFIES		\
>  	msecs_to_jiffies(IPU_LIB_CALL_TIMEOUT_MS)
> diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
> index ded1986eb..bf4e8edd9 100644
> --- a/drivers/staging/media/ipu7/ipu7-mmu.c
> +++ b/drivers/staging/media/ipu7/ipu7-mmu.c
> @@ -33,16 +33,16 @@
>  
>  #define ISP_PAGE_SHIFT		12
>  #define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
> -#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1U))
> +#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
>  
>  #define ISP_L1PT_SHIFT		22
> -#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
> +#define ISP_L1PT_MASK		(~((1 << ISP_L1PT_SHIFT) - 1))
>  
>  #define ISP_L2PT_SHIFT		12
>  #define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
>  
> -#define ISP_L1PT_PTES		1024U
> -#define ISP_L2PT_PTES		1024U
> +#define ISP_L1PT_PTES		1024
> +#define ISP_L2PT_PTES		1024
>  
>  #define ISP_PADDR_SHIFT		12
>  
> @@ -60,8 +60,8 @@ static __maybe_unused void mmu_irq_handler(struct ipu7_mmu *mmu)
>  
>  	for (i = 0; i < mmu->nr_mmus; i++) {
>  		irq_cause = readl(mmu->mmu_hw[i].base + MMU_REG_IRQ_CAUSE);
> -		pr_info("mmu %s irq_cause = 0x%x", mmu->mmu_hw[i].name,
> -			irq_cause);
> +		dev_info(&mmu->adev->auxdev.dev, "mmu %s irq_cause = 0x%x", mmu->mmu_hw[i].name,
> +			 irq_cause);
>  		writel(0x1ffff, mmu->mmu_hw[i].base + MMU_REG_IRQ_CLEAR);
>  	}
>  }
> @@ -80,12 +80,12 @@ static void tlb_invalidate(struct ipu7_mmu *mmu)
>  	}
>  
>  	for (i = 0; i < mmu->nr_mmus; i++) {
> -		writel(0xffffffffU, mmu->mmu_hw[i].base +
> +		writel(0xffffffff, mmu->mmu_hw[i].base +
>  		       MMU_REG_INVALIDATE_0);
>  
>  		/* Need check with HW, use l1streams or l2streams */
>  		if (mmu->mmu_hw[i].nr_l2streams > 32)
> -			writel(0xffffffffU, mmu->mmu_hw[i].base +
> +			writel(0xffffffff, mmu->mmu_hw[i].base +
>  			       MMU_REG_INVALIDATE_1);
>  
>  		/*
> @@ -99,7 +99,7 @@ static void tlb_invalidate(struct ipu7_mmu *mmu)
>  		/* wait invalidation done */
>  		ret = readl_poll_timeout_atomic(mmu->mmu_hw[i].base +
>  						MMU_REG_INVALIDATION_STATUS,
> -						val, !(val & 0x1U), 500,
> +						val, !(val & 0x1), 500,
>  						MMU_TLB_INVALIDATE_TIMEOUT);
>  		if (ret)
>  			dev_err(mmu->dev, "MMU[%u] TLB invalidate failed\n", i);
> @@ -248,7 +248,7 @@ static void l2_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
>  
>  	spin_lock_irqsave(&mmu_info->lock, flags);
>  	for (l1_idx = iova >> ISP_L1PT_SHIFT;
> -	     size > 0U && l1_idx < ISP_L1PT_PTES; l1_idx++) {
> +	     size > 0 && l1_idx < ISP_L1PT_PTES; l1_idx++) {
>  		dev_dbg(mmu_info->dev,
>  			"unmapping l2 pgtable (l1 index %u (iova 0x%8.8lx))\n",
>  			l1_idx, iova);
> @@ -263,7 +263,7 @@ static void l2_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
>  
>  		l2_entries = 0;
>  		for (l2_idx = (iova & ISP_L2PT_MASK) >> ISP_L2PT_SHIFT;
> -		     size > 0U && l2_idx < ISP_L2PT_PTES; l2_idx++) {
> +		     size > 0 && l2_idx < ISP_L2PT_PTES; l2_idx++) {
>  			phys_addr_t pteval = TBL_PHYS_ADDR(l2_pt[l2_idx]);
>  
>  			dev_dbg(mmu_info->dev,
> @@ -491,18 +491,18 @@ static void __mmu_at_init(struct ipu7_mmu *mmu)
>  		/* Configure MMU TLB stream configuration for L1/L2 */
>  		for (j = 0; j < mmu_hw->nr_l1streams; j++) {
>  			writel(mmu_hw->l1_block_sz[j], mmu_hw->base +
> -			       mmu_hw->l1_block + 4U * j);
> +			       mmu_hw->l1_block + 4 * j);
>  		}
>  
>  		for (j = 0; j < mmu_hw->nr_l2streams; j++) {
>  			writel(mmu_hw->l2_block_sz[j], mmu_hw->base +
> -			       mmu_hw->l2_block + 4U * j);
> +			       mmu_hw->l2_block + 4 * j);
>  		}
>  
>  		for (j = 0; j < mmu_hw->uao_p_num; j++) {
>  			if (!mmu_hw->uao_p2tlb[j])
>  				continue;
> -			writel(mmu_hw->uao_p2tlb[j], mmu_hw->uao_base + 4U * j);
> +			writel(mmu_hw->uao_p2tlb[j], mmu_hw->uao_base + 4 * j);
>  		}
>  	}
>  }
> @@ -522,7 +522,7 @@ static void __mmu_zlx_init(struct ipu7_mmu *mmu)
>  			if (!mmu_hw->zlx_axi_pool[j])
>  				continue;
>  			writel(mmu_hw->zlx_axi_pool[j],
> -			       mmu_hw->zlx_base + ZLX_REG_AXI_POOL + j * 0x4U);
> +			       mmu_hw->zlx_base + ZLX_REG_AXI_POOL + j * 0x4);
>  		}
>  
>  		for (j = 0; j < mmu_hw->zlx_nr; j++) {
> @@ -530,7 +530,7 @@ static void __mmu_zlx_init(struct ipu7_mmu *mmu)
>  				continue;
>  
>  			writel(mmu_hw->zlx_conf[j],
> -			       mmu_hw->zlx_base + ZLX_REG_CONF + j * 0x8U);
> +			       mmu_hw->zlx_base + ZLX_REG_CONF + j * 0x8);
>  		}
>  
>  		for (j = 0; j < mmu_hw->zlx_nr; j++) {
> @@ -538,7 +538,7 @@ static void __mmu_zlx_init(struct ipu7_mmu *mmu)
>  				continue;
>  
>  			writel(mmu_hw->zlx_en[j],
> -			       mmu_hw->zlx_base + ZLX_REG_EN + j * 0x8U);
> +			       mmu_hw->zlx_base + ZLX_REG_EN + j * 0x8);
>  		}
>  	}
>  }
> @@ -701,7 +701,7 @@ void ipu7_mmu_unmap(struct ipu7_mmu_info *mmu_info, unsigned long iova,
>  	dev_dbg(mmu_info->dev, "unmapping iova 0x%lx size 0x%zx\n", iova, size);
>  
>  	/* find out the minimum page size supported */
> -	min_pagesz = 1U << __ffs(mmu_info->pgsize_bitmap);
> +	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
>  
>  	/*
>  	 * The virtual address and the size of the mapping must be
> @@ -727,7 +727,7 @@ int ipu7_mmu_map(struct ipu7_mmu_info *mmu_info, unsigned long iova,
>  		return -ENODEV;
>  
>  	/* find out the minimum page size supported */
> -	min_pagesz = 1U << __ffs(mmu_info->pgsize_bitmap);
> +	min_pagesz = 1 << __ffs(mmu_info->pgsize_bitmap);
>  
>  	/*
>  	 * both the virtual address and the physical one, as well as
> diff --git a/drivers/staging/media/ipu7/ipu7-syscom.c b/drivers/staging/media/ipu7/ipu7-syscom.c
> index 3f9f9c5c3..8996285ff 100644
> --- a/drivers/staging/media/ipu7/ipu7-syscom.c
> +++ b/drivers/staging/media/ipu7/ipu7-syscom.c
> @@ -39,7 +39,7 @@ void *ipu7_syscom_get_token(struct ipu7_syscom_context *ctx, int q)
>  				queue_params->token_size_in_bytes;
>  	} else {
>  		/* Input queue */
> -		bool full = (read_index == ((write_index + 1U) %
> +		bool full = (read_index == ((write_index + 1) %
>  					    (u32)queue_params->max_capacity));
>  
>  		if (!full)
> @@ -65,7 +65,7 @@ void ipu7_syscom_put_token(struct ipu7_syscom_context *ctx, int q)
>  		offset = offsetof(struct syscom_queue_indices_s, write_index);
>  
>  	index = readl(queue_indices + offset);
> -	writel((index + 1U) % queue_params->max_capacity,
> +	writel((index + 1) % queue_params->max_capacity,
>  	       queue_indices + offset);
>  }
>  EXPORT_SYMBOL_NS_GPL(ipu7_syscom_put_token, "INTEL_IPU7");
> diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
> index ac8ac0689..04e2b1b73 100644
> --- a/drivers/staging/media/ipu7/ipu7.h
> +++ b/drivers/staging/media/ipu7/ipu7.h
> @@ -100,18 +100,18 @@ struct ipu7_device {
>  /* FW is accessible within the first 2 GiB only in non-secure mode. */
>  #define IPU_MMU_ADDR_BITS_NON_SECURE	31
>  
> -#define IPU7_IS_MMU_NUM			4U
> -#define IPU7_PS_MMU_NUM			4U
> -#define IPU7P5_IS_MMU_NUM		4U
> -#define IPU7P5_PS_MMU_NUM		4U
> -#define IPU8_IS_MMU_NUM			5U
> -#define IPU8_PS_MMU_NUM			4U
> -#define IPU_MMU_MAX_NUM			5U /* max(IS, PS) */
> -#define IPU_MMU_MAX_TLB_L1_STREAMS	40U
> -#define IPU_MMU_MAX_TLB_L2_STREAMS	40U
> -#define IPU_ZLX_MAX_NUM			32U
> -#define IPU_ZLX_POOL_NUM		8U
> -#define IPU_UAO_PLANE_MAX_NUM		64U
> +#define IPU7_IS_MMU_NUM			4
> +#define IPU7_PS_MMU_NUM			4
> +#define IPU7P5_IS_MMU_NUM		4
> +#define IPU7P5_PS_MMU_NUM		4
> +#define IPU8_IS_MMU_NUM			5
> +#define IPU8_PS_MMU_NUM			4
> +#define IPU_MMU_MAX_NUM			5 /* max(IS, PS) */
> +#define IPU_MMU_MAX_TLB_L1_STREAMS	40
> +#define IPU_MMU_MAX_TLB_L2_STREAMS	40
> +#define IPU_ZLX_MAX_NUM			32
> +#define IPU_ZLX_POOL_NUM		8
> +#define IPU_UAO_PLANE_MAX_NUM		64
>  
>  /*
>   * To maximize the IOSF utlization, IPU need to send requests in bursts.

-- 
Regards,

Sakari Ailus


Return-Path: <linux-media+bounces-31280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D489AA07AF
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCA55A2D68
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25ADE2BD5BF;
	Tue, 29 Apr 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFi9B7bn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E65422E40E
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919985; cv=none; b=jFZLE6l7p9yMh+qn4X9UMAV1mijB4/tEwJu3yHMQPooLr3t7PUnvIbzo+xQTXwp238H7w5mXqnJ5YLMLvrMfhS3DopdeAs5sclbqlHInh8hqZ5KLe2zZ++0HbfWcfI7H/QWOk+ueCwJMdpg+ggyzwfOk+HDLNCpj1TJeLHk3iSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919985; c=relaxed/simple;
	bh=+KbY8J+h+BI0ofRtnJFEkn6/out8wuuDltX9l3nQwdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiRnv91p/tWnPYYyCz1zOh56tGHnZA6Sph+FjrXlfPJk6KMFJ1mqFwZ66pQttlZGtn3OcK9KN+0SkNhtSz4YZdzUVI9McXawhjtvWpt9H3VXo3gSgDZhasUy12pg8d8/0JixMvC0auQ+1Lh89ZHcK1v8wlfQP8hhuFDEd5e46Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFi9B7bn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745919984; x=1777455984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+KbY8J+h+BI0ofRtnJFEkn6/out8wuuDltX9l3nQwdo=;
  b=BFi9B7bnpcUeUwckgTqSDBd6v/+jee9Z66uZbUbzlFk7FKGF/y9fs3Vp
   dNd8YX6P1Dvlse/NV9LddVK6LxnaAY5bBqAIevN0+kkxpCqsSp5s4FC0k
   I7wUeVKxWDtBCzi+gp8yuM3yplalR0LwqQLqSnoLeM2Hxjo2pufzQvXHY
   odLt/oI9diwiMmDL1/G1v3LIH2o9QHoskfnZ4lHRPzwYtqaZ6NTavG52c
   ZeOvUDOojKuq81OjjKhpVK+s9sByCZaFm2aelATi5b6Ngl3lVUV3oHcgw
   SvyLQ7eHtFjn766oIRvMciLelLckW7XoDD/4LPQUkJLN96xhdcDGQG0nY
   w==;
X-CSE-ConnectionGUID: AXSknOPMQZGl6v4wCyIyuQ==
X-CSE-MsgGUID: j58UhCrBQoGaPtC7h3S+FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58904863"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58904863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:46:24 -0700
X-CSE-ConnectionGUID: yVVifLqKSGWSF443zEfMaA==
X-CSE-MsgGUID: Ld6hQdPQQjWG9SYOvUtfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="164721169"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:46:20 -0700
Date: Tue, 29 Apr 2025 11:46:12 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, phasta@mailbox.org,
	helgaas@kernel.org, jerry.w.hu@intel.com, hao.yao@intel.com,
	tian.shu.qiu@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 2/8] media: staging/ipu7: add Intel IPU7 PCI device driver
Message-ID: <aBCf5M3J5BXSlBoN@linux.intel.com>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
 <20250429032841.115107-3-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429032841.115107-3-bingbu.cao@intel.com>

On Tue, Apr 29, 2025 at 11:28:35AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Intel Image Processing Unit 7th Gen includes input and processing systems
> and the hardware presents itself as a single PCI device in system same
> as IPU6.
> 
> The IPU7 PCI device driver basically does PCI configurations, basic
> hardware configuration by its buttress interfaces, loads the
> firmware binary, register the auxiliary device which serve for the ISYS
> device driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

LGTM in general, some nits below.

> +/* buttress irq */
> +enum {
> +	BUTTRESS_PWR_STATUS_HH_STATE_IDLE,
> +	BUTTRESS_PWR_STATUS_HH_STATE_IN_PRGS,
> +	BUTTRESS_PWR_STATUS_HH_STATE_DONE,
> +	BUTTRESS_PWR_STATUS_HH_STATE_ERR,
> +};
Used as HW register value, need to be hard-coded constant? 

> +#define IPU_BUTTRESS_PWR_STATE_DN_DONE		0x0
> +#define IPU_BUTTRESS_PWR_STATE_UP_PROCESS	0x1
> +#define IPU_BUTTRESS_PWR_STATE_DN_PROCESS	0x2
> +#define IPU_BUTTRESS_PWR_STATE_UP_DONE		0x3
No U suffix ? 

> +#define FW_CODE_BASE				0x0
> +#define FW_DATA_BASE				0x4
> +#define CPU_AXI_CNTL				0x8
> +#define CPU_QOS_CNTL				0xc
> +#define IDMA_AXI_CNTL				0x10
> +#define IDMA_QOS_CNTL				0x14
> +#define MEF_SPLIT_SIZE				0x18
> +#define FW_MSG_CONTROL				0x1c
> +#define FW_MSG_CREDITS_STATUS			0x20
> +#define FW_MSG_CREDIT_TAKEN			0x24
> +#define FW_MSG_CREDIT_RETURNED			0x28
> +#define TRIG_IDMA_IN				0x2c
> +#define IDMA_DONE				0x30
> +#define IDMA_DONE_CLEAR				0x34
> +#define DMEM_CAPACITY				0x38
> +#define NON_SECURE_CODE_OFFSET			0x3c
> +#define UC_CG_CTRL_BITS				0x40
> +#define ALT_RESET_VEC				0x44
> +#define WDT_NMI_DURATION			0x104
> +#define WDT_RST_REQ_DURATION			0x108
> +#define WDT_CNTL				0x10c
> +#define WDT_NMI_CURRENT_COUNT			0x110
> +#define WDT_RST_CURRENT_COUNT			0x114
> +#define WDT_HALT				0x118
> +#define WDT_STATUS				0x11c
> +#define SPARE_REG_RW				0x120
> +#define SPARE_REG_RO				0x124
> +#define FW_TO_FW_IRQ_CNTL_EDGE			0x200
> +#define FW_TO_FW_IRQ_CNTL_MASK_N		0x204
> +#define FW_TO_FW_IRQ_CNTL_STATUS		0x208
> +#define FW_TO_FW_IRQ_CNTL_CLEAR			0x20c
> +#define FW_TO_FW_IRQ_CNTL_ENABLE		0x210
> +#define FW_TO_FW_IRQ_CNTL_LEVEL_NOT_PULSE	0x214
> +#define CLK_GATE_DIS				0x218
> +#define DEBUG_STATUS				0x1000
> +#define DEBUG_EXCPETION				0x1004
> +#define TIE_GENERAL_INPUT			0x1008
> +#define ERR_STATUS				0x100c
> +#define UC_ERR_INFO				0x1010
> +#define SPARE_CNTL				0x1014
> +#define MEF_TRC_CNTL				0x1100
> +#define DBG_MEF_LAST_PUSH			0x1104
> +#define DBG_MEF_LAST_POP			0x1108
> +#define DBG_MEF_COUNT_CNTL			0x110c
> +#define DBG_MEF_COUNT1				0x1110
> +#define DBG_MEF_COUNT2				0x1114
> +#define DBG_MEF_ACC_OCCUPANCY			0x1118
> +#define DBG_MEF_MAX_IRQ_TO_POP			0x111c
> +#define DBG_IRQ_CNTL				0x1120
> +#define DBG_IRQ_COUNT				0x1124
> +#define DBG_CYC_COUNT				0x1128
> +#define DBG_CNTL				0x1130
> +#define DBG_RST_REG				0x1134
> +#define DBG_MEF_STATUS0				0x1138
> +#define DBG_MEF_STATUS1				0x113c
> +#define PDEBUG_CTL				0x1140
> +#define PDEBUG_DATA				0x1144
> +#define PDEBUG_INST				0x1148
> +#define PDEBUG_LS0ADDR				0x114c
> +#define PDEBUG_LS0DATA				0x1150
> +#define PDEBUG_LS0STAT				0x1154
> +#define PDEBUG_PC				0x1158
> +#define PDEBUG_MISC				0x115c
> +#define PDEBUG_PREF_STS				0x1160
> +#define MEF0_ADDR				0x2000
> +#define MEF1_ADDR				0x2020
> +#define PRINTF_EN_THROUGH_TRACE			0x3004
> +#define PRINTF_EN_DIRECTLY_TO_DDR		0x3008
> +#define PRINTF_DDR_BASE_ADDR			0x300c
> +#define PRINTF_DDR_SIZE				0x3010
> +#define PRINTF_DDR_NEXT_ADDR			0x3014
> +#define PRINTF_STATUS				0x3018
> +#define PRINTF_AXI_CNTL				0x301c
> +#define PRINTF_MSG_LENGTH			0x3020
> +#define TO_SW_IRQ_CNTL_EDGE			0x4000
> +#define TO_SW_IRQ_CNTL_MASK_N			0x4004
> +#define TO_SW_IRQ_CNTL_STATUS			0x4008
> +#define TO_SW_IRQ_CNTL_CLEAR			0x400c
> +#define TO_SW_IRQ_CNTL_ENABLE			0x4010
> +#define TO_SW_IRQ_CNTL_LEVEL_NOT_PULSE		0x4014
> +#define ERR_IRQ_CNTL_EDGE			0x4018
> +#define ERR_IRQ_CNTL_MASK_N			0x401c
> +#define ERR_IRQ_CNTL_STATUS			0x4020
> +#define ERR_IRQ_CNTL_CLEAR			0x4024
> +#define ERR_IRQ_CNTL_ENABLE			0x4028
> +#define ERR_IRQ_CNTL_LEVEL_NOT_PULSE		0x402c
> +#define LOCAL_DMEM_BASE_ADDR			0x1300000

Do we need those defines ? 

I think is fine to have unused defines for completeness and possible
future usage, but I checked randomly 10 of above and none was referenced.

Regards
Stanislaw


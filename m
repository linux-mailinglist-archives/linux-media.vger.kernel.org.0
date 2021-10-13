Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0A342CDB2
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 00:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhJMWSs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 18:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhJMWSp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 18:18:45 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4700C061746;
        Wed, 13 Oct 2021 15:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=+u0puN0sMkyAYkNQMTT8QtUODmKP6eAbIA4yxZYl8WM=; b=Eau9WGW08s+kawzSJ3n5iwHVEP
        8qUk1k1WwQiUEtMiBwrydbwfly+bEnFmyttCySvY9Er2RHzXycILy3bfwG5JV2b/rrK4CDWJJIL4L
        pcPW02fVBXAWQLaRFPIkt5kB2j0uiGpnIAEVVb4xAfPmA38znuGbwKUGlwwYxn5ltfCfxV0c03Eve
        SjTPANcs20EvVSwKCec21Ix31Z+u5f6A0nLaNmFgDLrbbC0ESGMDku+wfZlKPqVdjAa3hfBcAMIaM
        CqIu899k8CSwJDzcgDEm958WGfc4sz7XwLnkL/dONmiv2kwNDUhM8V4u84sdpK2j2Qa5TqROIO+E8
        JQvDtMWg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mamYB-000oAV-Fv; Wed, 13 Oct 2021 22:16:39 +0000
Subject: Re: [PATCH v10 03/13] media: amphion: add amphion vpu device driver
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1634095309.git.ming.qian@nxp.com>
 <2a70d55e012874b9a3381e0aca23010edf65b2f4.1634095309.git.ming.qian@nxp.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <591813d6-2633-bc64-110e-8f62ca07044e@infradead.org>
Date:   Wed, 13 Oct 2021 15:16:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2a70d55e012874b9a3381e0aca23010edf65b2f4.1634095309.git.ming.qian@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/13/21 1:27 AM, Ming Qian wrote:
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index d9f90084c2f6..2465a5f7a073 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -200,6 +200,25 @@ config VIDEO_TI_CAL_MC
>   
>   endif # VIDEO_TI_CAL
>   
> +config VIDEO_AMPHION_VPU
> +	tristate "Amphion VPU(Video Processing Unit) Codec IP"
> +	depends on ARCH_MXC
> +	depends on MEDIA_SUPPORT
> +	depends on VIDEO_DEV
> +	depends on VIDEO_V4L2
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_VMALLOC
> +	default y

This should not be "default y" unless it is needed to boot up
some platform/machine. And even then it should depend on that
platform/machine if possible.

And there are 2 other drivers in that same Kconfig file that
have the same problem.

> +	help
> +	  Amphion VPU Codec IP contains two parts: Windsor and Malone.
> +	  Windsor is encoder that supports H.264, and Malone is decoder
> +	  that supports H.264, HEVC, and other video formats.
> +	  This is a V4L2 driver for NXP MXC 8Q video accelerator hardware.
> +	  It accelerates encoding and decoding operations on
> +	  various NXP SoCs.
> +	  To compile this driver as a module choose m here.


-- 
~Randy

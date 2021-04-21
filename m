Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43548366C08
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240393AbhDUNKa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:10:30 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:31026 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241520AbhDUNJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:09:05 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AsWWe2a95b09bdMuPSMtuk+AnI+orLtY04lQ7?=
 =?us-ascii?q?vn1ZYxY9SK2lvuqpm+kW0gKxtSYJVBgb9OyoFaGcTRrnm6JdzpIWOd6ZMDXOmG?=
 =?us-ascii?q?ztF4166Jun/juIIULD38pQz71pfaQ7KNCYNzhHpOL75AX9LNo62tmA98mT79v2?=
 =?us-ascii?q?9HtmQQF0Z6wI1W4QNi+hHkJ7XwVAD5YifaDshfZvnSaqengcc62AbUUtYu6rna?=
 =?us-ascii?q?yoqLvWJToPBxsq82C1/FaV1II=3D?=
X-IronPort-AV: E=Sophos;i="5.82,240,1613430000"; 
   d="scan'208";a="504326993"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Apr 2021 15:08:28 +0200
Date:   Wed, 21 Apr 2021 15:08:28 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] [PATCH v3] staging: media: atomisp: pci:
 Change line break to avoid an open parenthesis at the end of the line
In-Reply-To: <20210421123718.GA4597@focaruja>
Message-ID: <alpine.DEB.2.22.394.2104211507280.9436@hadrien>
References: <20210421123718.GA4597@focaruja>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Wed, 21 Apr 2021, Aline Santana Cordeiro wrote:

> Change line break to avoid an open parenthesis at the end of the line.
> It consequently removed spaces at the start of the subsequent line.

The message is hard to understand.  There are a lot of singular nouns, but
actually there are two changes.  Which change is being described by the
above message?  What does "It" refer to?

julia


> Both issues detected by checkpatch.pl.
>
> Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> ---
>
> Changes since v2:
>  - Insert a space between the function type and pointer
>
> Changes since v1:
>  - Keep the pointer with the function return type
>    instead of left it with the function name
>
>  drivers/staging/media/atomisp/pci/atomisp_cmd.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index 1c0d464..639eca3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -75,8 +75,8 @@ void atomisp_wdt(struct timer_list *t);
>  void atomisp_setup_flash(struct atomisp_sub_device *asd);
>  irqreturn_t atomisp_isr(int irq, void *dev);
>  irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr);
> -const struct atomisp_format_bridge *get_atomisp_format_bridge_from_mbus(
> -    u32 mbus_code);
> +const struct atomisp_format_bridge *
> +get_atomisp_format_bridge_from_mbus(u32 mbus_code);
>  bool atomisp_is_mbuscode_raw(uint32_t code);
>  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
>  			   const struct ia_css_frame *frame, u32 *p_pgnr);
> @@ -381,9 +381,9 @@ enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
>
>  bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe);
>
> -void atomisp_apply_css_parameters(
> -    struct atomisp_sub_device *asd,
> -    struct atomisp_css_params *css_param);
> +void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
> +				  struct atomisp_css_params *css_param);
> +
>  void atomisp_free_css_parameters(struct atomisp_css_params *css_param);
>
>  void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe);
> --
> 2.7.4
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210421123718.GA4597%40focaruja.
>

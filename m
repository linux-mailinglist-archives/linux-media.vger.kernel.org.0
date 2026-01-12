Return-Path: <linux-media+bounces-50441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CFD120F7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48B3A301E82E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B44E34F469;
	Mon, 12 Jan 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uvKlntva"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F1934E74D;
	Mon, 12 Jan 2026 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215242; cv=none; b=qszK6WgE516ZT2Q4tLOxEEqPonVZBoRsf773uvcfCR6OWZzuALjdwm7pPUZRRIjNIczV9tLL1Bal5bbh2lugwro1ii/TQAEXIe/HzAkhGXyHO2j7/d9r//uqhlz+3vkiLBO6XnthDpnIt+O2OK+iH8BEPDynDhbr1IGmTGEfYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215242; c=relaxed/simple;
	bh=czuK7P5EN3lXjvLcJJRFeoNx1IqcVLbOGutwCra56Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh+kDAhKht7p40xBr26UXdWV6L4QlJgZuNsNmSxlniHZcP461ZTim+M6mnnA3txGiwqKGekpBZAoHACchUOwx2bmvvnJWuhR9R1vNJ47+OacNu9IydKVvZSrDJRlJjpAavYGYljHiBl5jJe1GWE+SqOFjtjYx7mLxfkoJWR2Uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uvKlntva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CBEC16AAE;
	Mon, 12 Jan 2026 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768215242;
	bh=czuK7P5EN3lXjvLcJJRFeoNx1IqcVLbOGutwCra56Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvKlntvaRprEfOJeDIVjzitJwGidmgTKmL/Hc+p6xJ/hBNEB9VZaOD2sZ5QO7amAb
	 EP9mEutKheyHB1be4lkZZ2K9KV0OiDVprgnbK3RaeqwUKUar8zCYM/0kWozj4pEAYO
	 GjJu6cMWC7h/JNUoCNLKEh8I5JCabBO4iA2XfAr4=
Date: Mon, 12 Jan 2026 11:49:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] staging: atomisp: Remove input_system typedefs
Message-ID: <2026011233-scandal-nuttiness-f199@gregkh>
References: <20260112103848.22980-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112103848.22980-1-karthikey3608@gmail.com>

On Mon, Jan 12, 2026 at 04:08:47PM +0530, Karthikey Kadati wrote:
> Remove input_system_channel_t and input_system_input_port_t typedefs.
> 
> Replace usages with struct input_system_channel and
> 
> struct input_system_input_port respectively.
> 
> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
>  .../atomisp/pci/isp2401_input_system_global.h | 12 ++--
>  .../pci/runtime/isys/src/virtual_isys.c       | 56 +++++++++----------
>  drivers/staging/media/atomisp/pci/sh_css.c    |  4 +-
>  3 files changed, 35 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
> index 4aadeb133..bce8aa999 100644
> --- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
> +++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
> @@ -34,8 +34,7 @@ typedef enum {
>  	N_INPUT_SYSTEM_SOURCE_TYPE
>  } input_system_source_type_t;
>  
> -typedef struct input_system_channel_s input_system_channel_t;
> -struct input_system_channel_s {
> +struct input_system_channel {
>  	stream2mmio_ID_t	stream2mmio_id;
>  	stream2mmio_sid_ID_t	stream2mmio_sid_id;
>  
> @@ -55,8 +54,7 @@ struct input_system_channel_cfg_s {
>  	isys2401_dma_port_cfg_t	dma_dest_port_cfg;
>  };
>  
> -typedef struct input_system_input_port_s input_system_input_port_t;
> -struct input_system_input_port_s {
> +struct input_system_input_port {
>  	input_system_source_type_t	source_type;
>  
>  	struct {
> @@ -141,9 +139,9 @@ struct virtual_input_system_stream_s {
>  								Must be unique within one CSI RX
>  								and lower than SH_CSS_MAX_ISYS_CHANNEL_NODES */
>  	u8 enable_metadata;
> -	input_system_input_port_t	input_port;
> -	input_system_channel_t		channel;
> -	input_system_channel_t		md_channel; /* metadata channel */
> +	struct input_system_input_port	input_port;
> +	struct input_system_channel		channel;
> +	struct input_system_channel		md_channel; /* metadata channel */
>  	u8 online;
>  	s8 linked_isys_stream_id;
>  	u8 valid;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> index e6c11d5f7..291b2fb33 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> @@ -26,28 +26,28 @@
>  static bool create_input_system_channel(
>      isp2401_input_system_cfg_t	*cfg,
>      bool			metadata,
> -    input_system_channel_t	*channel);
> +    struct input_system_channel	*channel);
>  
>  static void destroy_input_system_channel(
> -    input_system_channel_t	*channel);
> +    struct input_system_channel	*channel);
>  
>  static bool create_input_system_input_port(
>      isp2401_input_system_cfg_t		*cfg,
> -    input_system_input_port_t	*input_port);
> +    struct input_system_input_port	*input_port);
>  
>  static void destroy_input_system_input_port(
> -    input_system_input_port_t	*input_port);
> +    struct input_system_input_port	*input_port);
>  
>  static bool calculate_input_system_channel_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      input_system_channel_cfg_t	*channel_cfg,
>      bool metadata);
>  
>  static bool calculate_input_system_input_port_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      input_system_input_port_cfg_t	*input_port_cfg);
>  
> @@ -89,8 +89,8 @@ static void release_be_lut_entry(
>      csi_rx_backend_lut_entry_t	*entry);
>  
>  static bool calculate_prbs_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      pixelgen_prbs_cfg_t		*cfg);
>  
> @@ -99,7 +99,7 @@ static bool calculate_fe_cfg(
>      csi_rx_frontend_cfg_t		*cfg);
>  
>  static bool calculate_be_cfg(
> -    const input_system_input_port_t	*input_port,
> +    const struct input_system_input_port	*input_port,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      bool				metadata,
>      csi_rx_backend_cfg_t		*cfg);
> @@ -110,13 +110,13 @@ static bool calculate_stream2mmio_cfg(
>      stream2mmio_cfg_t		*cfg);
>  
>  static bool calculate_ibuf_ctrl_cfg(
> -    const input_system_channel_t	*channel,
> -    const input_system_input_port_t	*input_port,
> +    const struct input_system_channel	*channel,
> +    const struct input_system_input_port	*input_port,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      ibuf_ctrl_cfg_t			*cfg);
>  
>  static bool calculate_isys2401_dma_cfg(
> -    const input_system_channel_t	*channel,
> +    const struct input_system_channel	*channel,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      isys2401_dma_cfg_t		*cfg);
>  
> @@ -263,7 +263,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
>  static bool create_input_system_channel(
>      isp2401_input_system_cfg_t	*cfg,
>      bool			metadata,
> -    input_system_channel_t	*me)
> +    struct input_system_channel	*me)
>  {
>  	bool rc = true;
>  
> @@ -324,7 +324,7 @@ static bool create_input_system_channel(
>  }
>  
>  static void destroy_input_system_channel(
> -    input_system_channel_t	*me)
> +    struct input_system_channel	*me)
>  {
>  	release_sid(me->stream2mmio_id,
>  		    &me->stream2mmio_sid_id);
> @@ -336,7 +336,7 @@ static void destroy_input_system_channel(
>  
>  static bool create_input_system_input_port(
>      isp2401_input_system_cfg_t		*cfg,
> -    input_system_input_port_t	*me)
> +    struct input_system_input_port	*me)
>  {
>  	csi_mipi_packet_type_t packet_type;
>  	bool rc = true;
> @@ -410,7 +410,7 @@ static bool create_input_system_input_port(
>  }
>  
>  static void destroy_input_system_input_port(
> -    input_system_input_port_t	*me)
> +    struct input_system_input_port	*me)
>  {
>  	if (me->source_type == INPUT_SYSTEM_SOURCE_TYPE_SENSOR) {
>  		release_be_lut_entry(
> @@ -429,8 +429,8 @@ static void destroy_input_system_input_port(
>  }
>  
>  static bool calculate_input_system_channel_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      input_system_channel_cfg_t	*channel_cfg,
>      bool metadata)
> @@ -480,8 +480,8 @@ static bool calculate_input_system_channel_cfg(
>  }
>  
>  static bool calculate_input_system_input_port_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      input_system_input_port_cfg_t	*input_port_cfg)
>  {
> @@ -613,8 +613,8 @@ static void release_be_lut_entry(
>  }
>  
>  static bool calculate_prbs_cfg(
> -    input_system_channel_t		*channel,
> -    input_system_input_port_t	*input_port,
> +    struct input_system_channel		*channel,
> +    struct input_system_input_port	*input_port,
>      isp2401_input_system_cfg_t		*isys_cfg,
>      pixelgen_prbs_cfg_t		*cfg)
>  {
> @@ -632,7 +632,7 @@ static bool calculate_fe_cfg(
>  }
>  
>  static bool calculate_be_cfg(
> -    const input_system_input_port_t	*input_port,
> +    const struct input_system_input_port	*input_port,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      bool				metadata,
>      csi_rx_backend_cfg_t		*cfg)
> @@ -677,8 +677,8 @@ static bool calculate_stream2mmio_cfg(
>  }
>  
>  static bool calculate_ibuf_ctrl_cfg(
> -    const input_system_channel_t	*channel,
> -    const input_system_input_port_t	*input_port,
> +    const struct input_system_channel	*channel,
> +    const struct input_system_input_port	*input_port,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      ibuf_ctrl_cfg_t			*cfg)
>  {
> @@ -759,7 +759,7 @@ static bool calculate_ibuf_ctrl_cfg(
>  }
>  
>  static bool calculate_isys2401_dma_cfg(
> -    const input_system_channel_t	*channel,
> +    const struct input_system_channel	*channel,
>      const isp2401_input_system_cfg_t	*isys_cfg,
>      isys2401_dma_cfg_t		*cfg)
>  {
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index 73bd87f43..ec4d15ffe 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -665,7 +665,7 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
>  	return rc;
>  }
>  
> -static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
> +static bool sh_css_translate_stream_cfg_to_struct input_system_input_portype(
>      struct ia_css_stream_config *stream_cfg,
>      ia_css_isys_descr_t	*isys_stream_descr)
>  {
> @@ -852,7 +852,7 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
>  			    "sh_css_translate_stream_cfg_to_isys_stream_descr() enter:\n");
>  	rc  = sh_css_translate_stream_cfg_to_input_system_input_port_id(stream_cfg,
>  		isys_stream_descr);
> -	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_type(stream_cfg,
> +	rc &= sh_css_translate_stream_cfg_to_struct input_system_input_portype(stream_cfg,
>  		isys_stream_descr);
>  	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_attr(stream_cfg,
>  		isys_stream_descr, isys_stream_idx);
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot


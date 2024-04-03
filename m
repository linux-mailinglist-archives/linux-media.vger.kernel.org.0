Return-Path: <linux-media+bounces-8487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE28968FA
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03DB81C2457D
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6666CDB4;
	Wed,  3 Apr 2024 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B7Hx60dH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FE15FEE5
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133649; cv=none; b=oowzKBra6fXqsnkide2hdXZMs899CpQtullm/czTTcSk2QGGoXBHNy2ev/RkRQUWcueyGTCsrVf6avUK4kC7LoToKRuCD3x8rGMRkDZwFemKtVm5sewuwgsyWUWb6oAPCicRD2XZ+bqEedWo6HhWjWvAZqxK9qmr96OIolbPWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133649; c=relaxed/simple;
	bh=CR+vAZJMrXVxMhpGK7+6Ts8cB1DKuv1ZJVjInLAChiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgL1pUhFOdtKO6dQlLOcUYE9WiTuw5g4n2dLXiN2x1qdipa0QlzcnCvhiMqEWS9bhfaZFIDySAD1oMameSHIgu6iA2fAV66FJhUkfmluJxXnA2SQu7KlCvxnxZzgvpVVlL6f5Rh/cGWMXAua5IVL9BIsQktvwsutnIm9Vksh0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B7Hx60dH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63B70674;
	Wed,  3 Apr 2024 10:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712133608;
	bh=CR+vAZJMrXVxMhpGK7+6Ts8cB1DKuv1ZJVjInLAChiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7Hx60dHF9E8o7HLKbmGK01kFLW8PTdeWfT+oXZ39ZZTMUU1/WBdNYb7zeMz7cyfd
	 lwMM/cfIndXGf/RCSPvvhxWUeR0EXZZmlNIDAVwLC9yg+AmERC27FuOI2R5a5bpvow
	 Db9gspSO80EK2nXy8fOkOQ/qgORYLyoPP0Q37YtM=
Date: Wed, 3 Apr 2024 11:40:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [v4l-utils] [PATCH 1/8] utils: media-ctl: Print MUST_CONNECT pad
 flags
Message-ID: <20240403084034.GA4168@pendragon.ideasonboard.com>
References: <20240402000033.4007-1-laurent.pinchart@ideasonboard.com>
 <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402000033.4007-2-laurent.pinchart@ideasonboard.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 02, 2024 at 03:00:26AM +0300, Laurent Pinchart wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Print the MUST_CONNECT pad flag for each pad.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  utils/media-ctl/media-ctl.c | 50 +++++++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
> 
> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
> index 2081f111f2db..1b40552253f1 100644
> --- a/utils/media-ctl/media-ctl.c
> +++ b/utils/media-ctl/media-ctl.c
> @@ -368,26 +368,6 @@ static const char *media_entity_subtype_to_string(unsigned type)
>  	}
>  }
>  
> -static const char *media_pad_type_to_string(unsigned flag)
> -{
> -	static const struct {
> -		__u32 flag;
> -		const char *name;
> -	} flags[] = {
> -		{ MEDIA_PAD_FL_SINK, "Sink" },
> -		{ MEDIA_PAD_FL_SOURCE, "Source" },
> -	};
> -
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(flags); i++) {
> -		if (flags[i].flag & flag)
> -			return flags[i].name;
> -	}
> -
> -	return "Unknown";
> -}
> -
>  static void media_print_topology_dot(struct media_device *media)
>  {
>  	unsigned int nents = media_get_entities_count(media);
> @@ -525,6 +505,25 @@ static void media_print_pad_text(struct media_entity *entity,
>  		v4l2_subdev_print_subdev_dv(entity);
>  }
>  
> +static unsigned int weight(uint32_t word)
> +{
> +	unsigned int w = 0, i;
> +
> +	for (i = 0; i < sizeof(word) << 3; i++, word >>= 1)
> +		w += word & 1U;
> +
> +	return w;
> +}
> +
> +static const char *comma(uint32_t flag, uint32_t prev_flags, uint32_t flags)
> +{
> +	static const char *empty = "", *comma = ", ";
> +	if (!(flag & flags))
> +		return empty;
> +
> +	return weight(prev_flags & flags) ? comma : empty;

Unless I'm mistaken, we can write this

	return prev_flags & flags ? comma : empty;

and drop the weight function.

> +}
> +
>  static void media_print_topology_text_entity(struct media_device *media,
>  					     struct media_entity *entity)
>  {
> @@ -567,8 +566,15 @@ static void media_print_topology_text_entity(struct media_device *media,
>  	for (j = 0; j < info->pads; j++) {
>  		const struct media_pad *pad = media_entity_get_pad(entity, j);
>  
> -		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
> -
> +		printf("\tpad%u: %s%s%s%s%s\n", j,
> +		       pad->flags & MEDIA_PAD_FL_SINK ? "Sink" : "",
> +		       comma(MEDIA_PAD_FL_SOURCE, MEDIA_PAD_FL_SINK,
> +			     pad->flags),
> +		       pad->flags & MEDIA_PAD_FL_SOURCE ? "Source" : "",
> +		       comma(MEDIA_PAD_FL_MUST_CONNECT,
> +			     MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE,
> +			     pad->flags),
> +		       pad->flags & MEDIA_PAD_FL_MUST_CONNECT ? "Must connect" : "");

To be honest, this looks overly complicated. How about printing the
flags with a loop ?

>  		media_print_pad_text(entity, pad, routes, num_routes);
>  
>  		for (k = 0; k < num_links; k++) {

-- 
Regards,

Laurent Pinchart


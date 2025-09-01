Return-Path: <linux-media+bounces-41425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68492B3E1A7
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 13:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E81BD1A81F4F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BB2310624;
	Mon,  1 Sep 2025 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7zfQA1I"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208326C3A5
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 11:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756726446; cv=none; b=PO0wZ4bguamyGA98l1JF8VLhzT/xvCTRmRPPKH2BmYHCo6rheDMpgqAM8jwYC2KDDtepkASs4Y1YGr5c7NOeleUPDObzo9IHu32hQkjv5xdqHYp+2G3SlgcS8YrunWbCNgTF6tp4JNKqqn9eO/Mv5JZNAGsD1vqyXP9oozqLKUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756726446; c=relaxed/simple;
	bh=WQ4DvEEWfr1Cz/O63dxXBAeetPzlMvafkJn57s3XZpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwMwPZtOXPQUc/yxeViLG0HSarJS4hWrwCWM4imuulwP9FMNwdXSFJ2YSpkhsyMK/t32Zb7cyxKRLukmZjwGBXH7CZG1e5l6xQPQQrsDX/vLLvloX8IWX8gV2dFYHgP63ceuqEhP6vZ3E8Cr8Nl6uYXTtq7gZsEQrwu4NdVGLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G7zfQA1I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F860E45;
	Mon,  1 Sep 2025 13:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756726373;
	bh=WQ4DvEEWfr1Cz/O63dxXBAeetPzlMvafkJn57s3XZpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7zfQA1Iy1PbV2cgE/ZgJnc9cpVdlW+vlDE1dDKg/PRQp095W56Yw4Vtggl+/z8zq
	 JvvBN2WcasMxUlfaplxFuU3P03Ed6o3o2Iiww0DaC8qYXWVNBkQUn8DZuWeHF5Jf+a
	 WkeipmSAE4qzHCPNNsYNeJiagJsSthE1AF+fsWSw=
Date: Mon, 1 Sep 2025 13:33:56 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 04/66] media: Documentation: Document -ENXIO for
 VIDIOC_SUBDEV_S_ROUTING
Message-ID: <s7yxeudfc5n67v7po6rjb7zaxwy3cjxzflvb7v27owhe5hicyu@qqazppf4vajo>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-5-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:05PM +0300, Sakari Ailus wrote:
> Document that -ENXIO is returned when the user tries to set a routing
> configuration not supported by the hardware (or rather the driver). The
> documentation details the exact cases of this, besides -EINVAL that is
> already documented for VIDIOC_SUBDEV_S_ROUTING.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/vidioc-subdev-g-routing.rst             | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 1cf795480602..15f448664e6b 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -155,9 +155,18 @@ appropriately. The generic error codes are described at the
>  :ref:`Generic Error Codes <gen-errors>` chapter.
>
>  EINVAL
> +

Is this intended ?

>     The sink or source pad identifiers reference a non-existing pad or reference
>     pads of different types (ie. the sink_pad identifiers refers to a source
> -   pad), or the ``which`` field has an unsupported value.
> +   pad), the ``which`` field has an unsupported value, or, for
> +   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field value is larger than that
> +   of the len_routes field.

Doesn't this contradicts the above

The kernel can return a ``num_routes`` value larger than ``len_routes`` from
both ioctls. This indicates thare are more routes in the routing table than fits
the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
with the first ``len_routes`` entries of the subdevice routing table. This is
not considered to be an error, and the ioctl call succeeds. If the applications
wants to retrieve the missing routes, it can issue a new
``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.

Looking at the handler for VIDIOC_SUBDEV_S_ROUTING in v4l2-subdev.c I
think this should specify that is invalid to have userspace set a num_routes
value larger than len_routes.

I would simply add this to the above hunk

-   pad), or the ``which`` field has an unsupported value.
+   pad), the ``which`` field has an unsupported value, or, for
+   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field provided by the
+   application is larger than the len_routes field value.

> +
> +ENXIO
> +   No such link can be created or such link state change can be made. Either the
> +   sink or source (pad, stream) pair or the combination of the sink and source
> +   is not supported by the hardware, or no multiple routes from or to the same
> +   (pad, stream) pair are supported.

If I'm not mistaken this only applies to VIDIOC_SUBDEV_S_ROUTING, so I
would mention that. Also ENXIO is not returned by the core but by
drivers, so I would not limit the possible cases where ENXIO is
returned by making examples.

What about a simpler:

+ENXIO
+   The application requested routes cannot be created or the state of
+   the specified routes cannot be modified. Only returned for
+   ``VIDIOC_SUBDEV_S_ROUTING``.

>
>  E2BIG
>     The application provided ``num_routes`` for ``VIDIOC_SUBDEV_S_ROUTING`` is
> --
> 2.47.2
>
>


Return-Path: <linux-media+bounces-21043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2679C0287
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87FB71C216E9
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCE11EE033;
	Thu,  7 Nov 2024 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdVvd2Sa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19601E906B;
	Thu,  7 Nov 2024 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975938; cv=none; b=bCpJpc/Ju6DSIv7pR3b8StlKBFK7ZuPN13Xz+Mb72qic8X34ovSsW9VwDOXBRbYcL9f/l5JIuAWiPGbcZ8EsWSWuJATHXS8TzgU7Lbu3nr5ZRcESH7P8xjSFnPKM/x6pI/zrEHbBVZsSx8JaLnFkM+xSjp3f3j9NcraoSc8IfzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975938; c=relaxed/simple;
	bh=9JXJLE2UCZqL9f5A5UEMnMSs0QQUpXkttzmtdtPCASs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLe1Zki9ZnIWukKDO6CPfX62KqckAWbiratsD5Snn2w1SCNPDF3Dwp+YjUyignLYE1/jLgtMokbcQgK92ADIuk+uX+t/6ZWdrmSTwlpPA9aIgc3sS8pdRqeck/pacDP9DC/TjLAzetesa29YiBVAmbj77nVr+HTktkQcOx1DCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vdVvd2Sa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 254EB5B3;
	Thu,  7 Nov 2024 11:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730975920;
	bh=9JXJLE2UCZqL9f5A5UEMnMSs0QQUpXkttzmtdtPCASs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vdVvd2Sao3MO61mi8VFuGklTDTfku19NW3PET1gujfcR0eLhvP2sqqBa0YtEeODZI
	 vU++EdUtkHy3XJcERVNfhuUc/PEYHEudJ2ONUH7qPvna9x9IvYufspsGIJ5A8lZTEC
	 vv2wRvVn1BPXo/HAh9Afl0pOpTwjEPETSTzEQ0lc=
Date: Thu, 7 Nov 2024 11:38:45 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v3 8/9] Documentation: media: add documentation file
 metafmt-c3-isp.rst
Message-ID: <fabf3avbsswq5wx2f2nvyqjny6ps3y2am3ordfffkv7tqwndns@ypix6ms6conb>
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-8-f774a39e6774@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240918-c3isp-v3-8-f774a39e6774@amlogic.com>

Hi Keke

On Wed, Sep 18, 2024 at 02:07:19PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add the file 'metafmt-c3-isp.rst' that documents
> the meta format of c3-isp.

Do not break lines too early!

>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../userspace-api/media/v4l/metafmt-c3-isp.rst     | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index c6e56b5888bc..3a420747f6e7 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -12,6 +12,7 @@ These formats are used for the :ref:`metadata` interface only.
>  .. toctree::
>      :maxdepth: 1
>
> +    metafmt-c3-isp
>      metafmt-d4xx
>      metafmt-generic
>      metafmt-intel-ipu3
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
> new file mode 100644
> index 000000000000..bbaf3542c1ca
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +
> +.. _v4l2-meta-fmt-c3isp-stats:
> +.. _v4l2-meta-fmt-c3isp-params:
> +
> +***********************************************************************
> +V4L2_META_FMT_C3ISP_STATS ('CSTS'), V4L2_META_FMT_C3ISP_PARAMS ('CPRM')
> +***********************************************************************
> +
> +.. c3_isp_stats_info

This does not seem to be used

> +
> +3A statistics
> +=============
> +
> +The C3 ISP can collect different statistics over an input Bayer frame.
> +Those statistics are obtained from the "isp-stats" metadata capture video nodes,
> +using the :c:type:`v4l2_meta_format` interface.
> +They are formatted as described by the :c:type:`c3_isp_stats_info` structure.
> +
> +The statistics collected are  Auto-white balance,
> +Auto-exposure and Auto-focus information.

Do not break lines too early

> +
> +.. c3_isp_params_buffer

Unsued as well ?

> +
> +Pipeline parameters
> +===================
> +
> +The pipeline parameters are passed to the "isp-params" metadata
> +output video nodes, using the :c:type:`v4l2_meta_format` interface. They are
> +formatted as described by the :c:type:`c3_isp_params_buffer` structure.
> +
> +The structure c3_isp_params_buffer includes the necessary parameters
> +required by the ISP.
> +These parameters are written to the ISP hardware.
> +
> +Amlogic C3 ISP uAPI data types
> +===============================

Additional = at the end

> +
> +.. kernel-doc:: drivers/media/platform/amlogic/c3-isp/include/uapi/c3-isp-config.h
>
> --
> 2.46.1
>
>
>


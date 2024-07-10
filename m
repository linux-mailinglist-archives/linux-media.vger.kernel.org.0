Return-Path: <linux-media+bounces-14824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFAC92CE1A
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 11:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2201F216C9
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C21718FA0A;
	Wed, 10 Jul 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KMSn1EBi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC10E17BB31;
	Wed, 10 Jul 2024 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720603341; cv=none; b=bp/o2qzWOjhHXP6hwQX3xiHTnSoBrSLqcBx9JKuv6D/CueUJUreRjV/Pq8mhsn2Dw0D1dSXxGz8Tnf3B4yBf8WYFJSTXPVjqjVmOQMQa6G6vABUmboSuBHD5/75HURDPJ/cTCfTPNRSyNWJtGmRcnDHwx4orOYoiR4axQTtvkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720603341; c=relaxed/simple;
	bh=5EbffKwvwNM6NfdRxM4VDxmXquU4ZU5CTCdXR+CJnU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olzSFUTHpT7zuafVO0iVltxL6GtZOLj7QesusvU4LRrDx0T+5JTuE2dlvs8WUMF1uTNLCwZXulqUiY/0y3MKhFyYkb15QTtAb2YtBewHXsgCIOvhf22hCgKp4Y1/VyEXqYLze/uax/99CFOtax8iORLl5+JGGFWZhxyDWj9Adw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KMSn1EBi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F37545A5;
	Wed, 10 Jul 2024 11:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720603305;
	bh=5EbffKwvwNM6NfdRxM4VDxmXquU4ZU5CTCdXR+CJnU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMSn1EBitXS2ofUCitdh0hMuHp22bjjtS13RjjGcSbXacwO9GhI0vOYubm0tDHGXf
	 hLSXrDxMxvREuOVev3vZpwjTFwc7fuiNkpMJj4nJQNHxCzDyU5+Vhj/qXQECMcpbIZ
	 gQJUzU2k/NQXD/iFtIfYYBzEjpeA2Qe+s65YiZHg=
Date: Wed, 10 Jul 2024 11:22:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang <mingjia.zhang@mediatek.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 02/14] media: Documentation: Add description for
 StarFive ISP metadata formats
Message-ID: <dncfjg7e7a2i6xin7kuwnxifcjpdjxcwkfcudxnqczi4lhwac7@u7jjunr7zqc6>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-3-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-3-changhuang.liang@starfivetech.com>

Hi Changhuang

On Tue, Jul 09, 2024 at 01:38:12AM GMT, Changhuang Liang wrote:
> Add description for V4L2_META_FMT_STF_ISP_PARAMS and
> V4L2_META_FMT_STF_ISP_STAT_3A meta data formats.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

I get this warnings when compiling documentation

Please fix these in the uapi header

../include/uapi/linux/jh7110-isp.h:17: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * ISP Module Diagram
../include/uapi/linux/jh7110-isp.h:152: warning: expecting prototype for struct jh7110_isp_cfa_params. Prototype was for struct jh7110_isp_cfa_setting instead
../include/uapi/linux/jh7110-isp.h:178: warning: expecting prototype for struct jh7110_isp_ctc_params. Prototype was for struct jh7110_isp_ctc_setting instead
../include/uapi/linux/jh7110-isp.h:200: warning: expecting prototype for struct jh7110_isp_dbc_params. Prototype was for struct jh7110_isp_dbc_setting instead
../include/uapi/linux/jh7110-isp.h:226: warning: expecting prototype for struct jh7110_isp_dnyuv_params. Prototype was for struct jh7110_isp_dnyuv_setting instead
../include/uapi/linux/jh7110-isp.h:707: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Statistics Collection Meta Data Flag

and this in the documentation here below:

Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst:73: WARNING: Title underline too short.

JH7110 ISP uAPI data types
======================

Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst: WARNING: document isn't included in any toctree

(You should  add this file to
Documentation/userspace-api/media/v4l/meta-formats.rst)

> ---
>  .../media/v4l/metafmt-starfive-isp.rst        | 75 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
>
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
> new file mode 100644
> index 000000000000..ebb4291833d6
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
> @@ -0,0 +1,75 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-stf-isp-params:
> +
> +.. _v4l2-meta-fmt-stf-isp-stat-3a:
> +
> +*****************************************************************************
> +V4L2_META_FMT_STF_ISP_PARAMS ('stfp'), V4L2_META_FMT_STF_ISP_STAT_3A ('stfs')
> +*****************************************************************************
> +
> +.. jh7110_isp_params_buffer
> +
> +Configuration parameters
> +========================
> +
> +The configuration parameters are passed to the "output_params" metadata output
> +video node, using the :c:type:`v4l2_meta_format` interface. They are formatted
> +as described by the :c:type:`jh7110_isp_params_buffer` structure.
> +
> +.. code-block:: c
> +
> +	struct jh7110_isp_params_buffer {
> +		__u32 enable_setting;
> +		struct jh7110_isp_wb_setting wb_setting;
> +		struct jh7110_isp_car_setting car_setting;
> +		struct jh7110_isp_ccm_setting ccm_setting;
> +		struct jh7110_isp_cfa_setting cfa_setting;
> +		struct jh7110_isp_ctc_setting ctc_setting;
> +		struct jh7110_isp_dbc_setting dbc_setting;
> +		struct jh7110_isp_dnyuv_setting dnyuv_setting;
> +		struct jh7110_isp_gmargb_setting gmargb_setting;
> +		struct jh7110_isp_lccf_setting lccf_setting;
> +		struct jh7110_isp_obc_setting obc_setting;
> +		struct jh7110_isp_oecf_setting oecf_setting;
> +		struct jh7110_isp_r2y_setting r2y_setting;
> +		struct jh7110_isp_sat_setting sat_setting;
> +		struct jh7110_isp_sharp_setting sharp_setting;
> +		struct jh7110_isp_ycrv_setting ycrv_setting;
> +		struct jh7110_isp_sc_setting sc_setting;
> +	};
> +
> +.. jh7110_isp_sc_buffer

Is this used ?

> +
> +3A and histogram statistics
> +===========================
> +
> +The ISP device collects different statistics over an input Bayer frame.
> +Those statistics are obtained from the "capture_scd" metadata capture video
> +node, using the :c:type:`v4l2_meta_format` interface. They are formatted as
> +described by the :c:type:`jh7110_isp_sc_buffer` structure.
> +
> +.. code-block:: c
> +
> +	struct jh7110_isp_sc_buffer {
> +		__u32 y_histogram[64];
> +		__u32 reserv0[33];
> +		__u32 bright_sc[4096];
> +		__u32 reserv1[96];
> +		__u32 ae_hist_y[128];
> +		__u32 reserv2[511];
> +		__u16 flag;
> +	};
> +
> +The statistics collected are Auto Exposure, AWB (Auto-white balance), Histogram
> +and AF (Auto-focus). See :c:type:`jh7110_isp_sc_buffer` for details of the
> +statistics.
> +
> +The 3A statistics and configuration parameters described here are usually
> +consumed and produced by dedicated user space libraries that comprise the
> +important tuning tools using software control loop.
> +
> +JH7110 ISP uAPI data types
> +======================
> +
> +.. kernel-doc:: include/uapi/linux/jh7110-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 890604eb0d64..8fd613c93e62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21304,6 +21304,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/starfive_camss.rst
>  F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> +F:	Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
>  F:	drivers/staging/media/starfive/camss
>  F:	include/uapi/linux/jh7110-isp.h
>
> --
> 2.25.1
>
>


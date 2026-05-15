Return-Path: <linux-media+bounces-61773-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOMsL1pmB2oF1wIAu9opvQ
	(envelope-from <linux-media+bounces-61773-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:30:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 241345563C1
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 521C930F67F8
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA8F4DB562;
	Fri, 15 May 2026 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mEwhqey/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UcsdlCUa"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBE40313D;
	Fri, 15 May 2026 18:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869072; cv=none; b=rH11ZSj0NtPbx4SrGpOfrvTSAZ5Y7bIO3mSh/x2RgbOMnuHNwVqYgpotpNZVZwoweNEJw/Zl4kseaEvbexm14gEwpyFj2WZ9uXnE5dzbCdYKcBAJmghG+/b66rgzQH+cQEd5bHkWNhc/QecfBAlYLi122gDscEcvV7orGF1CN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869072; c=relaxed/simple;
	bh=znpDuVp+J61IKmPrWDb1xaNgABLy4t/CY4ugpukaqkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LReaCsJRBsaNuurOhAfayQ4CgIIimGOlWHcSb8IP7w3FeiGZ6uiX6oklNDe2D1MkbEUiwy/8IbxtgYxPxkPIksse0NzZVczFbjSJCt0V3QHfuOZcLbZnB0SzcLnVJkhoKEQhMN+/1mN6OC9NQSd4jccAoO1sB4nEdfnP4rM3zoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mEwhqey/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UcsdlCUa; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id BCBC2EC009E;
	Fri, 15 May 2026 14:17:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 15 May 2026 14:17:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778869069;
	 x=1778955469; bh=ImEuP8CpcDFDAAGQwLhp7fhMt0k7TV/QOls390qocts=; b=
	mEwhqey/qAFXrNt0ri6udaZHc3osAl+GiSNTGA0lXK+ng1D6OnqeVkuKcps9UyKA
	CbHmF+W2RVpasQEJ6q+bUpvDc/Fa6Eai5KwOnivhKLUGHRoia1fsbLvZ0hHVIZxD
	8fsaYb7NZS/yUSQBWOw0TFP6Ckqx23MIkxnMRlZ/AJcRpqhDsdJ1OhZgJRlCIzow
	JclMQjGcSlkavJM7jq5aCeMgXk6FZ+qMQRnLME0qhbF/L6HlZSbnu15NeXCUw+Tq
	9gJ7rHj55V1EfUcKlSYu9QMFuipCmTPmO/+Mvae+p+YVOYNcDX3wy3/neiEtZcQ9
	Ct/GPPh1zOuP0cU3TiIxNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778869069; x=
	1778955469; bh=ImEuP8CpcDFDAAGQwLhp7fhMt0k7TV/QOls390qocts=; b=U
	csdlCUaebZCQfIu8mUpX4q4z5+aN6jzud6aop8K1SnyKoKsDQ5OztYf8GorvJ11r
	NfTr6b9orl0obuVFMuWHlKPcuSp0Oct22aJTeWBTJ0baA6cFCMx83/UA9PNt+uIH
	3hzG6pMRKsnze026qJCV4pcS8B8QSy1lCFu55M7D6DV1ABAShcxJLAS0YTo6ewTl
	NLw/PH1TPri9/E3O+ZnpYvVHZ+UNmVlo95Uipjqctbtx0YfbzedHDpIfmC/QALDZ
	1Ev16DC5oNTn5/GiYMa8iQ8lgexfEOzUyQNxovIRyqBT0jYtJezuVqZAMOwEdWQ2
	FeB5OywJU/L+gNk/ZO8RQ==
X-ME-Sender: <xms:TWMHar5c6d7rTWik_hYx9ofO3u-TKmwhumDOhNsOk-x503DvAaMkwA>
    <xme:TWMHapAC1gCt2_hB_ZTGfx8Pl6AtX_jVkJLC7aZP7DwWEwgTdaiJT_dZvHcZxpT_-
    wIjvholSUGVLyeghVKM7DH9h0uBV9GbBq4bZiyHTZElNAi4-GGbJw>
X-ME-Received: <xmr:TWMHah-Fxaf0HoHhDmv-8eIyqhMNZIXqlpWl8OBGAOUrQfBnusfIMWXTAXvpiCaikNmw5Q_hdG6w5F_mZvRCpw-50OCzcpb3Z_w5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gurghnrdhstggrlhhlhiesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    khgvkhgvrdhlihesrghmlhhoghhitgdrtghomhdprhgtphhtthhopegrnhhtohhinhgvrd
    gsohhuhigvrhesnhigphdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheprhhisggrlhgurgestghhrhhomh
    hiuhhmrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslh
    hinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:TWMHasEGstHeGINd7Sitez19ca4T0-8Dzmw4cKEK_Dbo0ukkFjmotQ>
    <xmx:TWMHarRnuk-ATeS-X0nk8BMQg7VqDv4GAgEZ1sVmZ4AQQrKblWjD8g>
    <xmx:TWMHajR_54IfXG3AYMWByMZPRIa1Z3PpjCJ8r0IVRSWUkzfkTE0o8w>
    <xmx:TWMHau3rs60kcxQnpBbn8hD92ZQ7NxpN37ex3CE1KbUEki11ssDEog>
    <xmx:TWMHag9Y1JYLoP2QI1WRL6cX8RDw7jo8N95kRu7y1HoLTcFyHhknR7EZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:17:48 -0400 (EDT)
Date: Fri, 15 May 2026 20:17:47 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] media: uapi: v4l2-isp: Add extensible statistics
Message-ID: <20260515181747.GQ332351@ragnatech.se>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-1-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-extensible-stats-v1-1-e16f326b8dad@ideasonboard.com>
X-Rspamd-Queue-Id: 241345563C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61773-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Action: no action

Hi Antoine, Jacopo,

Thanks for your work.

On 2026-05-05 16:12:12 +0200, Jacopo Mondi wrote:
> From: Antoine Bouyer <antoine.bouyer@nxp.com>
> 
> Extend the v4l2-isp extensible format introduced for isp parameters buffers
> to the support buffers of ISP statistic.
> 
> Like for ISP configuration purpose, that will help supporting various ISP
> hardware versions reporting different statistics data with less impact on
> userspace.
> 
> Rename all 'v4l2_isp_params' types to generic 'v4l2_isp' types to
> prepare to use them for statistics as well and maintain the existing
> types for compatibility with existing userspace only.
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> [Rework to remove 'v4l2_isp_stats' and unify types]
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  include/uapi/linux/media/v4l2-isp.h | 125 +++++++++++++++++++++++-------------
>  1 file changed, 79 insertions(+), 46 deletions(-)
> 
> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
> index 779168f9058e..e4607e1217e1 100644
> --- a/include/uapi/linux/media/v4l2-isp.h
> +++ b/include/uapi/linux/media/v4l2-isp.h
> @@ -13,25 +13,33 @@
>  #include <linux/types.h>
>  
>  /**
> - * enum v4l2_isp_params_version - V4L2 ISP parameters versioning
> + * enum v4l2_isp_version - V4L2 ISP serialization format versioning
>   *
> - * @V4L2_ISP_PARAMS_VERSION_V0: First version of the V4L2 ISP parameters format
> - *				(for compatibility)
> - * @V4L2_ISP_PARAMS_VERSION_V1: First version of the V4L2 ISP parameters format
> + * @V4L2_ISP_VERSION_V0: First version of the V4L2 ISP serialization format
> + *                       (for compatibility)
> + * @V4L2_ISP_VERSION_V1: First version of the V4L2 ISP serialization format
>   *
>   * V0 and V1 are identical in order to support drivers compatible with the V4L2
> - * ISP parameters format already upstreamed which use either 0 or 1 as their
> - * versioning identifier. Both V0 and V1 refers to the first version of the
> - * V4L2 ISP parameters format.
> + * ISP format already upstreamed which use either 0 or 1 as their versioning
> + * identifier. Both V0 and V1 refers to the first version of the V4L2 ISP
> + * serialization format.
>   *
> - * Future revisions of the V4L2 ISP parameters format should start from the
> + * Future revisions of the V4L2 ISP serialization format should start from the
>   * value of 2.
>   */
> -enum v4l2_isp_params_version {
> -	V4L2_ISP_PARAMS_VERSION_V0 = 0,
> -	V4L2_ISP_PARAMS_VERSION_V1
> +enum v4l2_isp_version {
> +	V4L2_ISP_VERSION_V0 = 0,
> +	V4L2_ISP_VERSION_V1
>  };
>  
> +/*
> + * Compatibility with existing users of v4l2_isp_params which pre-date the
> + * introduction of v4l2_isp_stats.
> + */
> +#define v4l2_isp_params_version			v4l2_isp_version
> +#define V4L2_ISP_PARAMS_VERSION_V0		V4L2_ISP_VERSION_V0
> +#define V4L2_ISP_PARAMS_VERSION_V1		V4L2_ISP_VERSION_V1
> +
>  #define V4L2_ISP_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
>  #define V4L2_ISP_PARAMS_FL_BLOCK_ENABLE		(1U << 1)
>  
> @@ -39,64 +47,89 @@ enum v4l2_isp_params_version {
>   * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
>   *
>   * Driver-specific flags should be defined as:
> - * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
> - * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(1))
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
>   */
> -#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> +#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)
>  
>  /**
> - * struct v4l2_isp_params_block_header - V4L2 extensible parameters block header
> - * @type: The parameters block type (driver-specific)
> + * struct v4l2_isp_block_header - V4L2 extensible block header
> + * @type: The parameters or statistics block type (driver-specific)
>   * @flags: A bitmask of block flags (driver-specific)
> - * @size: Size (in bytes) of the parameters block, including this header
> + * @size: Size (in bytes) of the block, including this header
>   *
> - * This structure represents the common part of all the ISP configuration
> - * blocks. Each parameters block shall embed an instance of this structure type
> - * as its first member, followed by the block-specific configuration data.
> + * This structure represents the common part of all the ISP configuration or
> + * statistic blocks. Each block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration or
> + * statistic data.
>   *
>   * The @type field is an ISP driver-specific value that identifies the block
> - * type. The @size field specifies the size of the parameters block.
> + * type. The @size field specifies the size of the block, including this
> + * header.
>   *
> - * The @flags field is a bitmask of per-block flags V4L2_PARAMS_ISP_FL_* and
> - * driver-specific flags specified by the driver header.
> + * The @flags field is a bitmask of per-block flags. If a block is used for
> + * configuration parameters this field can be a combination of
> + * V4L2_ISP_PARAMS_FL_* and driver-specific flags. If a block is used
> + * for statistics this fields is used to report optional
> + * driver-specific flags, if any.
>   */
> -struct v4l2_isp_params_block_header {
> +struct v4l2_isp_block_header {
>  	__u16 type;
>  	__u16 flags;
>  	__u32 size;
>  } __attribute__((aligned(8)));
>  
>  /**
> - * struct v4l2_isp_params_buffer - V4L2 extensible parameters configuration
> - * @version: The parameters buffer version (driver-specific)
> - * @data_size: The configuration data effective size, excluding this header
> - * @data: The configuration data
> + * v4l2_isp_params_block_header - V4L2 extensible parameters block header
> + *
> + * Compatibility with existing users of v4l2_isp_params_block_header
> + * which pre-date the introduction of v4l2_isp_block_header.
> + */
> +#define v4l2_isp_params_block_header v4l2_isp_block_header
> +
> +/**
> + * struct v4l2_isp_buffer - V4L2 extensible buffer
> + * @version: The extensible buffer version (driver-specific)
> + * @data_size: The data effective size, excluding this header
> + * @data: The configuration or statistics data
>   *
> - * This structure contains the configuration parameters of the ISP algorithms,
> - * serialized by userspace into a data buffer. Each configuration parameter
> - * block is represented by a block-specific structure which contains a
> - * :c:type:`v4l2_isp_params_block_header` entry as first member. Userspace
> - * populates the @data buffer with configuration parameters for the blocks that
> - * it intends to configure. As a consequence, the data buffer effective size
> - * changes according to the number of ISP blocks that userspace intends to
> - * configure and is set by userspace in the @data_size field.
> + * This structure contains ISP configuration parameters or ISP hardware
> + * statistics serialized into a data buffer. Each block is represented by a
> + * block-specific structure which contains a :c:type:`v4l2_isp_block_header`
> + * entry as first member.
>   *
> - * The parameters buffer is versioned by the @version field to allow modifying
> - * and extending its definition. Userspace shall populate the @version field to
> - * inform the driver about the version it intends to use. The driver will parse
> - * and handle the @data buffer according to the data layout specific to the
> - * indicated version and return an error if the desired version is not
> + * When used for ISP parameters, userspace populates the @data buffer with
> + * configuration parameters for the blocks that it intends to configure. As a
> + * consequence, the data buffer effective size changes according to the number
> + * of ISP blocks that userspace intends to configure.
> + *
> + * When used to report ISP statistics, the driver populates the @data buffer
> + * with statistics for each supported measurement block.
> + *
> + * The buffer is versioned by the @version field to allow modifying
> + * and extending its definition. The writer shall populate the @version field
> + * to inform the reader about the version it intends to use. The reader will
> + * parse and handle the @data buffer according to the data layout specific to
> + * the indicated version and return an error if the desired version is not
>   * supported.
>   *
> - * For each ISP block that userspace wants to configure, a block-specific
> - * structure is appended to the @data buffer, one after the other without gaps
> - * in between. Userspace shall populate the @data_size field with the effective
> - * size, in bytes, of the @data buffer.
> + * For each ISP block, a block-specific structure is appended to the @data
> + * buffer, one after the other without gaps in between. The writer shall
> + * populate the @data_size field with the effective size, in bytes, of the
> + * @data buffer.
>   */
> -struct v4l2_isp_params_buffer {
> +struct v4l2_isp_buffer {
>  	__u32 version;
>  	__u32 data_size;
>  	__u8 data[] __counted_by(data_size);
>  };
>  
> +/**
> + * v4l2_isp_params_buffer - V4L2 extensible parameters compatibility
> + *
> + * Compatibility with existing users of v4l2_isp_params_buffer which
> + * pre-date the introduction of v4l2_isp_buffer.
> + */
> +#define v4l2_isp_params_buffer v4l2_isp_buffer
> +
>  #endif /* _UAPI_V4L2_ISP_H_ */
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund


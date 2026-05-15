Return-Path: <linux-media+bounces-61777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HSxJhZnB2ps1wIAu9opvQ
	(envelope-from <linux-media+bounces-61777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:33:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DE5564A0
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0C5E301073E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1373EEAFE;
	Fri, 15 May 2026 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tqQOGQ4F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZXYvLAeA"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C73EEAF1;
	Fri, 15 May 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869752; cv=none; b=taAk5P6ymN7OZPSDqzD7aDkB5Gf2GaOwU4CRv1ol9qna+39FnNXsFnyjrdsJfoF/r7dDAs2NzTO/ZWMb7NUPOV3SJyCTtGzYtGqC6IuiVJVpxp96klyzALXDdd8NfJ340ftit7Tta26boDFDh+WZIFwpagZ4cZAeL/K1pBb1MU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869752; c=relaxed/simple;
	bh=ID1pl9gKCAsKEPIzUZGTiJuc9T1XXJv9Au2DGvB2X+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0adY4fWMPVo26SAbkrkxQIrPRv6tlS22Iczg9QVs/SaoLYaHOrAAkp3a5WjZYZCngwvgS/MGs5tCgm0ip3IrRjKYtLX3+KOg4q9vip778UZ7920C3qhkRYedTHifGKsTgLdawE7Y94KehTwjyUI3nvUgd7kw2Q90IvX4fMCLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tqQOGQ4F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZXYvLAeA; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 9412DEC00BD;
	Fri, 15 May 2026 14:29:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 15 May 2026 14:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778869749;
	 x=1778956149; bh=Q2K+7i9bRpXbCKgQSdf3nvZeY8BBrqUGs9SK0iOwEpA=; b=
	tqQOGQ4FWeHy0n/FKn2f16jRFpDXUgVlT3NCSNzBrcaLe/CE9my2AXbyGl7Olma3
	qmXOlzQ7L/E7x3duJt0OhAqVks+k6FlQwyPu7HqW1VHU7ipQT2rniw1kBpdvcXEy
	DXqgdnRz8HxJt/5eE+OSWewDufsNz/RyFHriY2Nob8q6QANrQp3vC1cXV96X89Ot
	M8odpD4ZBM3/+3kpEE2sgDgg4M601lonygSG22NHvDdfuqAXD77DrbTO+jDvc5Ea
	p5Qy58zrKbATbSo0FY1cijiSIZpmVUNKW+BcjkUhe3x/Y0iF4SZ/BbLkiWoMqH4X
	Hm2O1+D6QJ5XC1rTvlxxFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778869749; x=
	1778956149; bh=Q2K+7i9bRpXbCKgQSdf3nvZeY8BBrqUGs9SK0iOwEpA=; b=Z
	XYvLAeAbe199TdJH8uW1ILAOs71595qydO3T0KHcObG9zbEpcB6DI1IaEUuRWJ6p
	P+tq6sesFSF96rztaiywTfswsvRcJUxg7ZN4YdqcCOUuC4J2KE0QnnIC2+ygYpqz
	vVt8dOQjYtZ6gCBU5IXbxRSC3eKjtj2qRMeDaqU7k8Z8VReJmON0PGA9fflwLPsm
	rO/9ZvDMfbIqshN1SFJmp9ZINJox8/FRfIHgrVQcsR9O1U9rWartnQXacHApqWpX
	bxmaGK3OYUQkPfvOkE5Qyp0BuTubWBQzaG/eR9+2bvFHEEo2qOucNYqk47rrwxw3
	IZyFqsqmA4wxPWyUkq3XQ==
X-ME-Sender: <xms:9GUHaoa0A9Yogcb6L6bMGCIMU-O8g4DMfktjpg_AFEmSJ-v-6DCGwA>
    <xme:9GUHargSSz544Mc0StcNm_QsQomQynZDKr6JbQZ0chZAM1lJeEhXpw5iqP4rHGr-Q
    BAH3KMDr8I3xxugABruEujNZcfN8MntnHpP6HwtZjrMkbnvaBRjzg>
X-ME-Received: <xmr:9GUHaidWAZQVr53pwMZ6EC7eEm84QT1uRG61rYOQQDwAG6fV37uVL9HUd3q9YgLegot7UGSWybNSfYpDgVVuVgih3PMdt_4_p5-d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduuddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:9GUHaik3V8i9ZtC90jmG1cuOaA1akoimuoQRIsJBpB9IQ3Ff1no_iw>
    <xmx:9GUHavxzbY2HntqEZU6v-GWloCn6oTVbTIEDXX_doMaYgmvucmQliQ>
    <xmx:9GUHatxpjGem1bLzIC4Ay9qo3NqLy_jEU_7J8eq4QO3kx8dbS96cWQ>
    <xmx:9GUHanXFnjV-_2HafrYFAeJE7EIhtttQEkx93czXLFfw-1WIsY-UEQ>
    <xmx:9WUHau04iTxmMSuel-ExBrnbJD4dacr5cwsyF8GPLa_c3w-cL3XpZ8fA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:29:08 -0400 (EDT)
Date: Fri, 15 May 2026 20:29:07 +0200
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
Subject: Re: [PATCH 6/6] media: v4l2-isp: Add helpers for stats buffer
Message-ID: <20260515182907.GU332351@ragnatech.se>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com>
X-Rspamd-Queue-Id: A19DE5564A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61777-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hello Jacopo,

Thanks for your work.

On 2026-05-05 16:12:17 +0200, Jacopo Mondi wrote:
> Add two helper functions to v4l2-isp to handle statistics:
> 
> - v4l2_isp_stats_init_buffer() to initialize a statistics buffer
> - v4l2_isp_stats_init_block() to initialize a statistics block in the
>   next available memory location of a buffer
> 
> The v4l2_isp_stats_init_buffer() resets the data size counter of the
> buffer and initializes its 'version' field.
> 
> The v4l2_isp_stats_init_block() helper accepts the type of the stats
> block about to be populated, an array of per-block-type information and
> the maximum size of the v4l2-isp buffer. If enough space for the new
> block is available, the function increments the
> v4l2_isp_buffer.data_size counter, initializes the new stats block
> header and returns a pointer to the block for the driver to populate it.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-isp.c | 52 +++++++++++++++++++++++++++++++++
>  include/media/v4l2-isp.h           | 59 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
> index 10760659f8a3..8482010776d4 100644
> --- a/drivers/media/v4l2-core/v4l2-isp.c
> +++ b/drivers/media/v4l2-core/v4l2-isp.c
> @@ -131,6 +131,58 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_isp_params_validate_buffer);
>  
> +void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
> +				enum v4l2_isp_version version)
> +{
> +	if (WARN_ON(!buf))
> +		return;
> +
> +	if (WARN_ON(version > V4L2_ISP_VERSION_V1))
> +		return;
> +
> +	buf->version = version;
> +	buf->data_size = 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_buffer);
> +
> +struct v4l2_isp_block_header *
> +v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
> +			  const struct v4l2_isp_stats_block_type_info *type_info,
> +			  size_t num_block_types, unsigned int block_type,
> +			  size_t max_size)
> +{
> +	const struct v4l2_isp_stats_block_type_info *block_info;
> +	struct v4l2_isp_block_header *header;
> +	size_t used;
> +
> +	if (WARN_ON(!dev || !buf || !type_info))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (block_type >= num_block_types) {
> +		dev_err(dev, "Invalid block type %u\n", block_type);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	block_info = &type_info[block_type];
> +	used = buf->data_size;
> +
> +	if (used + block_info->size > max_size) {
> +		dev_err(dev, "No space for stats block type %u of size %zu\n",
> +			block_type, block_info->size);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	buf->data_size += block_info->size;
> +
> +	header = (struct v4l2_isp_block_header *)&buf->data[used];
> +	header->type = block_type;
> +	header->size = block_info->size;
> +	header->flags = 0;
> +
> +	return header;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_isp_stats_init_block);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com");
>  MODULE_DESCRIPTION("V4L2 generic ISP parameters and statistics helpers");
> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
> index 1f35a52f978a..7a54cf98c79a 100644
> --- a/include/media/v4l2-isp.h
> +++ b/include/media/v4l2-isp.h
> @@ -53,7 +53,7 @@ int v4l2_isp_params_validate_buffer_size(struct device *dev,
>  					 size_t max_size);
>  
>  /**
> - * struct v4l2_isp_params_block_type_info - V4L2 ISP per-block-type info
> + * struct v4l2_isp_params_block_type_info - V4L2 ISP params per-block-type info

nit: This could perhaps go in patch 4/6 as it at least also touch this 
struct?

With or without this moved,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>   * @size: the block type expected size
>   * @block_validate: driver's callback to implement per-block validation
>   *
> @@ -97,4 +97,61 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
>  				    const struct v4l2_isp_params_block_type_info *type_info,
>  				    size_t num_block_types);
>  
> +/**
> + * struct v4l2_isp_stats_block_type_info - V4L2 ISP stats per-block-type info
> + * @size: the block type expected size
> + *
> + * The v4l2_isp_stats_block_type_info collects information of the ISP
> + * statistics block types for validation purposes. It currently only contains
> + * the expected block size.
> + *
> + * Drivers shall prepare a list of statistics block type info, indexed by block
> + * type, one for each supported ISP statistics block type and correctly populate
> + * them with the expected block size.
> + */
> +struct v4l2_isp_stats_block_type_info {
> +	size_t size;
> +};
> +
> +/**
> + * v4l2_isp_stats_init_buffer - Initialize a statistics buffer
> + *
> + * Initialize a buffer of statistics. Only set the 'version' field and reset
> + * 'data_size' to 0.
> + *
> + * @buf: the v4l2_isp_buffer to initialize
> + * @version: the v4l2-isp serialization format version used by the driver
> + */
> +void v4l2_isp_stats_init_buffer(struct v4l2_isp_buffer *buf,
> +				enum v4l2_isp_version version);
> +
> +/**
> + * v4l2_isp_stats_init_block - Create and initialize a new block in a statistics
> + *			       buffer
> + * @dev: the driver's device pointer
> + * @buf: the v4l2_isp_buffer where statistics are serialized
> + * @type_info: the array of per-block-type validation info
> + * @num_block_types: the number of block types in the type_info array
> + * @block_type: the type of the statistics block to initialize
> + * @max_size: the maximum size of the data[] member of @buf
> + *
> + * This function locates and initialize a new statistics block in @buf for the
> + * driver to populate its content. The function checks that enough space for the
> + * requested @block_type is available in @buf and increments the 'data_size'
> + * member of @buf. The newly created statistics block's header is initialized
> + * with the size and type information provided by the caller in @type_info.
> + *
> + * Drivers should call this function before populating a new statistics block
> + * content.
> + *
> + * Returns a pointer to the next available location in @buf, or an error pointer
> + * if the requested @block_size is not available in @buf or @block_type is not
> + * valid.
> + */
> +struct v4l2_isp_block_header *
> +v4l2_isp_stats_init_block(struct device *dev, struct v4l2_isp_buffer *buf,
> +			  const struct v4l2_isp_stats_block_type_info *type_info,
> +			  size_t num_block_types, unsigned int block_type,
> +			  size_t max_size);
> +
>  #endif /* _V4L2_ISP_H_ */
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund


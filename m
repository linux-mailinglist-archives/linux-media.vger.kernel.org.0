Return-Path: <linux-media+bounces-39754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F93B244C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 10:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1BAA7AEDFD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 08:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1412ECEAB;
	Wed, 13 Aug 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aqjUljdp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VWQN92xk"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82F2BE020
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755075403; cv=none; b=mV4NNx17TDu6JTf0BgeALsdKNJaXj0ePYRPycpOa9bXnWV0EhIVSlz3Xs6ct+vE70+1ppNfGOkkWLhDZvFuJf3I/PxTIDPWRtpofTC51ciEk2tcrUh7pShwvkD5/5TAPvLyD8jCp2XhuPfyRkcsVEgZ3ka13v6IBv8rA+Achys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755075403; c=relaxed/simple;
	bh=JWS6lKs49TwMfV2525BOyIW7wypBzkYLWSHRPqqIkpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHgvGKP6eI7WAkb9xKFd/apyHXOwaAJle0ljZvOVtw6Utf0X6RarkrdIhibQw2XWO3FbX3xuXthwjaqpyVvaDwrG3BgKHTsCK2hGJvkar4MKsCv2Qnyz4A4oODwMtnFU28mc8FC/+Kte7EfHJ1WMXmhdpjGVvWXSQaJkqdeJFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aqjUljdp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VWQN92xk; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id EA6061D000DC;
	Wed, 13 Aug 2025 04:56:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 13 Aug 2025 04:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755075399;
	 x=1755161799; bh=ApVoouPQyynUhzR0IN2WP1QoBuWEjZGoefe0afF9OMs=; b=
	aqjUljdpxgjp2PGA43b+11oE664/Q0erus4yZ19Nsbc5kDD+DerzRZI9P5/8oeJd
	jo2tynXqfGvMPAHToriH7ZxwBglw374yQvBTOvfkt3DlcalF/FDr31EPHArAfKJk
	CZpAit//CQBsKf4FNnTankl3YLcA2AJ/HBHZyMbAmokRLxKSdqCPpbkwCCiMlKad
	RsIaeHPGq+6/y+IKyYF5ZbDRpPAde7HyK8ff+snAcxsnDwLsHA9GyR/zBVFQP3cj
	sQG57m79fEB6DXEwqn8HAk1VZ729wjtXdm93GJ6+RTqKzBxc+8WWcmv+9ThWBw5Q
	ydMygdBdCJHYRBJ1IyqFOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755075399; x=
	1755161799; bh=ApVoouPQyynUhzR0IN2WP1QoBuWEjZGoefe0afF9OMs=; b=V
	WQN92xk8cikmM8Nl9qaOmOEesEdrVBdvkVG5p1JZdtt301qjGG8VljCSrXY6KWT2
	trXwlJR100exTaqUPEbgdkNBYrG+oav2b/AJuVXStmVkwZPevIt/g2PYXVMUDuH0
	1KKzX6CgWLJYqiho/WcDsdiIgv3hKq17e3QDWkj2hDe1ODvhgter5gF9dLfrV0qg
	xjz62Mf9ZHwIZPrFbnYhQfluV+owrDEDaiCdMcF3Ka/1LLT62Qf6LciC0GwDzjjE
	+wu8faHHS2OBzOjxWhXAWndFTB/RczzVQDhjpiNgNBFHaAwaiirst4Schr34YuhJ
	ts6Mzqgu2q0PVsjMVkfAA==
X-ME-Sender: <xms:RlOcaHCBlMzs4ZCfbch3Laa1aAGXbLAtXGfhNEGgkc1x1aUI231zdA>
    <xme:RlOcaK4lho5wx-5ac5vJawImvirx4ianiO-MAaitzXiECs4QaKCFUzmvFq-f1OVwM
    8qhHMwla5QA8JQJi78>
X-ME-Received: <xmr:RlOcaMFv0pfYAfCtfPxhMerrN7asCtMZrSfoQeU7_VdBRw2z8kMHC0SAFtjdwjvWunVZKhtWP1q2ZNubA7eFlA8TeOCu7vkMug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgt
    hhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqd
    hmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhu
    ihhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslh
    hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdguuhhfrhgv
    shhnvgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehtohhmihdrvhgrlhhkvg
    hinhgvnhesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgvhhguihdr
    ughjrghitheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehjohhnrghsse
    hkfihisghoohdrshgvpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhu
    nhhgrdgtohhm
X-ME-Proxy: <xmx:RlOcaFC9Z6IIYxdYqmnqtug1nouI31u4bLkKMp-bK2SjCVlv-PCNpg>
    <xmx:RlOcaBwBeqJ_8X5W3g9g20RVUEkJRgybMNEyCeWKWa0oifS-Qh2hcw>
    <xmx:RlOcaJ7kDxDj2w1PbjPr1ZWveYvkiCb4Tc9RDmt5i3PsaJj-4i9Rhg>
    <xmx:RlOcaCwet9qZ8O_GL3aua1JVjwmWRk5qWv70M4-Njbb_wqiigg6wkw>
    <xmx:R1OcaK8xYyTw5qFhz2ayK2SPa-hAly5nXPufr9lEAp2QIhgg00tHXx7u>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Aug 2025 04:56:38 -0400 (EDT)
Date: Wed, 13 Aug 2025 10:56:35 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: Re: [PATCH v2 45/72] media: v4l2-common: Add legacy camera sensor
 clock helper
Message-ID: <20250813085635.GB1127470@ragnatech.se>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-46-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812214620.30425-46-laurent.pinchart@ideasonboard.com>

Hi Laurent,

Thanks for your work.

On 2025-08-13 00:45:53 +0300, Laurent Pinchart wrote:
> The recently introduced devm_v4l2_sensor_clk_get() helper aims at
> simplifying sensor drivers by centralizing clock handling code, as well
> as reducing cargo-cult and deprecated behaviour.
> 
> A set of drivers implement external clock handling in a non-standard
> way. This can't be changed as there is a high risk of breaking existing
> platforms, but keeping the code as-is creates a risk of new drivers
> copying deprecated behaviour.
> 
> To fix this, introduce a new devm_v4l2_sensor_clk_get_legacy() helper
> and use it in those driver. Compared to devm_v4l2_sensor_clk_get(), the
> new helper takes the "clock-frequency" property into account and sets
> the external clock rate on OF platforms, and adds the ability to specify
> a fixed default or fallback clock rate in case the "clock-frequency"
> property is not present.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Looks good to me, and I think it's a good idea to collect this in 
helpers instead of leaving it to drivers.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Fix error condition check when retrieving clock-frequency value
> - Fix typo
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++------
>  include/media/v4l2-common.h           | 41 ++++++++++++++++++++++++++-
>  2 files changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index a5334aa35992..dbeb2933f8e8 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -709,24 +709,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
>  
> -struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
> +				       bool legacy, bool fixed_rate,
> +				       unsigned long clk_rate)
>  {
> +	bool of_node = is_of_node(dev_fwnode(dev));
>  	const char *clk_id __free(kfree) = NULL;
>  	struct clk_hw *clk_hw;
>  	struct clk *clk;
> -	bool of_node;
> -	u32 rate;
> -	int ret;
> +	u32 rate = clk_rate;
> +	int ret = 0;
>  
>  	clk = devm_clk_get_optional(dev, id);
>  	if (IS_ERR(clk))
>  		return clk;
>  
> -	ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -	of_node = is_of_node(dev_fwnode(dev));
> +	/*
> +	 * If the caller didn't request a fixed rate, retrieve it from the
> +	 * clock-frequency property. -EINVAL indicates the property is absent,
> +	 * and is not a failure. Other errors, or success with a clock-frequency
> +	 * value of 0, are hard failures.
> +	 */
> +	if (!fixed_rate || !clk_rate) {
> +		ret = device_property_read_u32(dev, "clock-frequency", &rate);
> +		if ((ret && ret != -EINVAL) || (!ret && !rate))
> +			return ERR_PTR(-EINVAL);
> +	}
>  
>  	if (clk) {
> -		if (!ret && !of_node) {
> +		/*
> +		 * On non-OF platforms, or when legacy behaviour is requested,
> +		 * set the clock rate if a rate has been specified by the caller
> +		 * or by the clock-frequency property.
> +		 */
> +		if (rate && (!of_node || legacy)) {
>  			ret = clk_set_rate(clk, rate);
>  			if (ret) {
>  				dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -737,9 +753,14 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>  		return clk;
>  	}
>  
> -	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
> +	/*
> +	 * Register a dummy fixed clock on non-OF platforms or when legacy
> +	 * behaviour is requested. This required the common clock framework.
> +	 */
> +	if (!IS_ENABLED(CONFIG_COMMON_CLK) || (of_node && !legacy))
>  		return ERR_PTR(-ENOENT);
>  
> +	/* We need a rate to create a clock. */
>  	if (ret)
>  		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
>  
> @@ -756,4 +777,4 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>  
>  	return clk_hw->clk;
>  }
> -EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
> +EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 9d6c236e8f14..a21a5bc3784a 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -621,6 +621,10 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>  			     unsigned int num_of_driver_link_freqs,
>  			     unsigned long *bitmap);
>  
> +struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
> +				       bool legacy, bool fixed_rate,
> +				       unsigned long clk_rate);
> +
>  /**
>   * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
>   *	for a camera sensor.
> @@ -645,7 +649,42 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
>   *
>   * Returns a pointer to a struct clk on success or an error pointer on failure.
>   */
> -struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
> +static inline struct clk *
> +devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
> +{
> +	return __devm_v4l2_sensor_clk_get(dev, id, false, false, 0);
> +}
> +
> +/**
> + * devm_v4l2_sensor_clk_get_legacy - lookup and obtain a reference to a clock
> + *	producer for a camera sensor.
> + *
> + * @dev: device for v4l2 sensor clock "consumer"
> + * @id: clock consumer ID
> + * @fixed_rate: interpret the @clk_rate as a fixed rate or default rate
> + * @clk_rate: the clock rate
> + *
> + * This function behaves the same way as devm_v4l2_sensor_clk_get() except that
> + * it extends the behaviour on ACPI platforms to all platforms.
> + *
> + * The function also provides the ability to set the clock rate to a fixed
> + * frequency by setting @fixed_rate to true and specifying the fixed frequency
> + * in @clk_rate, or to use a default clock rate when the "clock-frequency"
> + * property is absent by setting @fixed_rate to false and specifying the default
> + * frequency in @clk_rate. Setting @fixed_rate to true and @clk_rate to 0 is an
> + * error.
> + *
> + * This function is meant to support legacy behaviour in existing drivers only.
> + * It must not be used in any new driver.
> + *
> + * Returns a pointer to a struct clk on success or an error pointer on failure.
> + */
> +static inline struct clk *
> +devm_v4l2_sensor_clk_get_legacy(struct device *dev, const char *id,
> +				bool fixed_rate, unsigned long clk_rate)
> +{
> +	return __devm_v4l2_sensor_clk_get(dev, id, true, fixed_rate, clk_rate);
> +}
>  
>  static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
>  {
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund


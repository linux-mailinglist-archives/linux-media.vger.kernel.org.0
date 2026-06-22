Return-Path: <linux-media+bounces-65353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cKZfEzcMOWq/lwcAu9opvQ
	(envelope-from <linux-media+bounces-65353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:19:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2626AEA2E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=uTagaKw7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65353-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65353-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2A63056FFC
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7983E3A5422;
	Mon, 22 Jun 2026 10:16:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5581B19F40B;
	Mon, 22 Jun 2026 10:16:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123410; cv=none; b=DR5S6T0Z+4mKU7Igc1vnMiN4/ylZWJZ54zd8G4wo1HW4Zntp1WxQehMHtH2BeE5PLuCExUDJvwfG8WGMNsec8mm5kJFramAKLpWbfwzIi0K3Yj8RXVDbi+iZ1xkIDcw9RymSF8XUduRzx3kiAFZQ2eI7M6UQQAu2cWyMzLt8Ch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123410; c=relaxed/simple;
	bh=J0BB5GhMc0V1NvM66DvEEh0l/1ueDUxLSg9wbpPlv3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjcoJ+k+yUN2WlntoRQe8EqCMEHe/1GxnMgdTBVNc0FothMPB5PNUoNKDX0Wlf/Ru4h66s+nfJlRMVge+ZYGpbLvw0EuRs7xTHxK9KHLdPRd9P3iVrXZe3HyFAN3JHXxyc/SCzICzWi0kWmf/MstrHZ7kmS67rkgtromV8a3Iqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uTagaKw7; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBFC2874;
	Mon, 22 Jun 2026 12:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782123370;
	bh=J0BB5GhMc0V1NvM66DvEEh0l/1ueDUxLSg9wbpPlv3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTagaKw7/8A5rrlK7YZAuvvcUGDw2F6DtrTqodxZubnPCnVSvQr8Oy6v0i455Cyyn
	 yFobZcecYUYJcvfygOVdCmLSxr5a/QxS5HXDCSfsPXFudRIyodWXq/mU9PAW14Pgsw
	 s54FF3xuE2oibuJOpBWgioylxLa7BzsRq8nKzcEg=
Date: Mon, 22 Jun 2026 12:16:44 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] media: i2c: vd55g1: Add support for vd55g4
Message-ID: <ajkKkSeDNoijIsub@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-4-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-vd55g4_and_fixes-v1-4-4f745a83b87e@foss.st.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65353-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F2626AEA2E

Hi Benjamin

On Tue, Apr 28, 2026 at 10:40:58AM +0200, Benjamin Mugnier wrote:
> vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
> RGB. Adapt the driver structure according to this new variant, and add
> its support.
>
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vd55g1.c | 110 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 74 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 2c962fcb41d2..9f62fc0428a1 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -29,11 +29,7 @@
>
>  /* Register Map */
>  #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
> -#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
> -#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
> -#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
> -#define VD55G1_REVISION_CCB				0x2020
> -#define VD55G1_REVISION_BAYER				0x3030
> +#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
>  #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
>  #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
>  #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
> @@ -138,8 +134,39 @@
>  #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>  #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
>
> -#define VD55G1_MODEL_ID_NAME(id) \
> -	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
> +enum vd55g1_model_id {
> +	VD55G1_MODEL_ID_2 = 0x53354731,
> +	VD55G1_MODEL_ID_3 = 0x53354733,
> +};
> +
> +enum vd55g1_color_version {
> +	VD55G1_COLOR_VERSION_MONO = 0x0,
> +	VD55G1_COLOR_VERSION_BAYER = 0x1,

nit: you don't need to initialize the enum members here

> +};
> +
> +struct vd55g1_version {
> +	char *name;
> +	enum vd55g1_model_id id;
> +	enum vd55g1_color_version color;
> +};
> +
> +static const struct vd55g1_version vd55g1_versions[] = {
> +	{
> +		.name  = "vd55g1",
> +		.id    = VD55G1_MODEL_ID_2,
> +		.color = VD55G1_COLOR_VERSION_MONO,
> +	},
> +	{
> +		.name  = "vd55g4",
> +		.id    = VD55G1_MODEL_ID_3,
> +		.color = VD55G1_COLOR_VERSION_MONO,
> +	},
> +	{
> +		.name  = "vd65g4",
> +		.id    = VD55G1_MODEL_ID_3,
> +		.color = VD55G1_COLOR_VERSION_BAYER,
> +	},
> +};
>
>  static const u8 vd55g1_patch_array[] = {
>  	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
> @@ -535,7 +562,7 @@ struct vd55g1_vblank_limits {
>
>  struct vd55g1 {
>  	struct device *dev;
> -	unsigned int id;
> +	const struct vd55g1_version *version;
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
> @@ -628,7 +655,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
>  {
>  	unsigned int i, j;
>
> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>  		return code;

As pointed out in the previous patch, you seem to have 2 mono formats.
Is this still ok ?

>
>  	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
> @@ -1183,8 +1210,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
>  	u64 patch;
>  	int ret = 0;
>
> -	/* vd55g1 needs a patch while vd65g4 does not */
> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
> +	/* Version 2 needs a patch while version 3 does not */
> +	if (sensor->version->id == VD55G1_MODEL_ID_2) {
>  		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
>  				   sizeof(vd55g1_patch_array),
>  				   vd55g1_patch_array, &ret);

You might want to consider renaming vd55g1_patch_array ?

> @@ -1256,7 +1283,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
>  	struct vd55g1 *sensor = to_vd55g1(sd);
>  	u32 base_code;
>
> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
>  		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
>  			return -EINVAL;
>  		base_code = vd55g1_mbus_formats_mono[code->index];
> @@ -1372,7 +1399,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>
> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>  	else
>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
> @@ -1659,38 +1686,48 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
>  	return ret;
>  }
>
> +static const struct vd55g1_version *
> +	vd55g1_get_version(enum vd55g1_model_id id,
> +			   enum vd55g1_color_version color)

Should you indent one tab left ?

> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {

You can declare i inside the for loop

> +		if (vd55g1_versions[i].id == id &&
> +		    vd55g1_versions[i].color == color)
> +			return &vd55g1_versions[i];
> +	}
> +
> +	return NULL;
> +}
> +
>  static int vd55g1_detect(struct vd55g1 *sensor)
>  {
> -	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
> -	u64 rev, id;
> -	int ret;
> +	const struct vd55g1_version *dt_version =
> +		device_get_match_data(sensor->dev);
> +	const struct vd55g1_version *version;
> +	u64 color, id;
> +	int ret = 0;
>
> -	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
> +	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
> +	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
>  	if (ret)
>  		return ret;
>
> -	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
> -		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
> -			 (u32)id);
> +	version = vd55g1_get_version(id, color);
> +	if (!version) {
> +		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
> +			 dt_version->name);
>  		return -ENODEV;
>  	}
> -	if (id != dt_id) {
> -		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
> -			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
> +	if (version->id != dt_version->id ||
> +	    version->color != dt_version->color) {
> +		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
> +			version->name, dt_version->name);
>  		return -ENODEV;
>  	}
> -	sensor->id = id;
>
> -	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
> -	if (ret)
> -		return ret;
> -
> -	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
> -	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
> -		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
> -			(u16)rev, VD55G1_MODEL_ID_NAME(id));
> -		return -ENODEV;
> -	}
> +	sensor->version = version;
>
>  	return 0;
>  }
> @@ -2048,8 +2085,9 @@ static void vd55g1_remove(struct i2c_client *client)
>  }
>
>  static const struct of_device_id vd55g1_dt_ids[] = {
> -	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
> -	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
> +	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
> +	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
> +	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
>  	{ /* sentinel */ }
>  };

All minors
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
>
> --
> 2.43.0
>
>


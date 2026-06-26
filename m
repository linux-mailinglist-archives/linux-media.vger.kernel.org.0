Return-Path: <linux-media+bounces-65692-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mkUJAEsxPmoHBQkAu9opvQ
	(envelope-from <linux-media+bounces-65692-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:59:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E576CB2E0
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:59:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=hEft3WdC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65692-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65692-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C499300889E
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 07:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0E73E44E4;
	Fri, 26 Jun 2026 07:58:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8424D2F7EF4;
	Fri, 26 Jun 2026 07:58:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460736; cv=none; b=R+ckE6MYzGiBCNc1HDn4XZx7Y+VttFwVtcoJUxTMToRcaoE4IpsfFsxvcI6K8u9hjWY99xGji790g4FE46l7mubfN9FiWkyW5MVHg0O8ZTCgafBklA0js8qSZBi+3bmeXgev3qPQic2vI56KLUvpgGrbYgxbds2p1sJn0eBe2qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460736; c=relaxed/simple;
	bh=UH14fvN8UKaofZyLqiMZ2A0E9yCSuZbf7bcMkyArlaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAOarQeZn8pHowXHhlewq/GKmwY7uw2vPo+s3ykaPVTOuwyRp4gUKIDFkGvhdRrzq3bXyu5bvYbRT9pFj4NWaFwoJTeW3r5BT+ZY9k4SDszViKor5Oee1GtlVaecvTFhOUL2es2rOVEH6/Nn9QCTs60qJ1g44+tb9jVx2s5O+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hEft3WdC; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6EB31E7;
	Fri, 26 Jun 2026 09:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782460691;
	bh=UH14fvN8UKaofZyLqiMZ2A0E9yCSuZbf7bcMkyArlaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hEft3WdCRkuYEGff0JiurC0IswICD76B/PxgNUcjZjAgy6Jt2w3RU8CULCuqtPop+
	 L8Xypo0TT4//jpe+zD8Daw0Pu01DTAyLjwIHQXlDlnKtvUXjTtmQ6mzbqKbUN0rBuD
	 zbK7tMOUySucOxmiLfeQqPn2v6qtdYa2C+VTJLAg=
Date: Fri, 26 Jun 2026 09:58:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] media: i2c: vd55g1: Add support for vd55g4
Message-ID: <aj4xDDy0UubUzCVx@zed>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-4-4f745a83b87e@foss.st.com>
 <ajkKkSeDNoijIsub@zed>
 <68d276f9-e688-4736-a296-f56c5aaa4b77@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68d276f9-e688-4736-a296-f56c5aaa4b77@foss.st.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65692-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:benjamin.mugnier@foss.st.com,m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,st.com:email,vger.kernel.org:from_smtp,zed:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50E576CB2E0

Hi Benjamin

On Thu, Jun 25, 2026 at 01:41:56PM +0200, Benjamin Mugnier wrote:
> Hi Jacopo,
>
> Le 22/06/2026 à 12:16, Jacopo Mondi a écrit :
> > Hi Benjamin
> >
> > On Tue, Apr 28, 2026 at 10:40:58AM +0200, Benjamin Mugnier wrote:
> >> vd55g4 is the same device as vd65g4 but outputs in monochrome instead of
> >> RGB. Adapt the driver structure according to this new variant, and add
> >> its support.
> >>
> >> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> >> ---
> >>  drivers/media/i2c/vd55g1.c | 110 ++++++++++++++++++++++++++++++---------------
> >>  1 file changed, 74 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> >> index 2c962fcb41d2..9f62fc0428a1 100644
> >> --- a/drivers/media/i2c/vd55g1.c
> >> +++ b/drivers/media/i2c/vd55g1.c
> >> @@ -29,11 +29,7 @@
> >>
> >>  /* Register Map */
> >>  #define VD55G1_REG_MODEL_ID				CCI_REG32_LE(0x0000)
> >> -#define VD55G1_MODEL_ID_VD55G1				0x53354731 /* Mono */
> >> -#define VD55G1_MODEL_ID_VD65G4				0x53354733 /* RGB */
> >> -#define VD55G1_REG_REVISION				CCI_REG16_LE(0x0004)
> >> -#define VD55G1_REVISION_CCB				0x2020
> >> -#define VD55G1_REVISION_BAYER				0x3030
> >> +#define VD55G1_REG_COLOR_VERSION			CCI_REG32_LE(0x0670)
> >>  #define VD55G1_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0012)
> >>  #define VD55G1_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
> >>  #define VD55G1_REG_SYSTEM_FSM				CCI_REG8(0x001c)
> >> @@ -138,8 +134,39 @@
> >>  #define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
> >>  #define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
> >>
> >> -#define VD55G1_MODEL_ID_NAME(id) \
> >> -	((id) == VD55G1_MODEL_ID_VD55G1 ? "vd55g1" : "vd65g4")
> >> +enum vd55g1_model_id {
> >> +	VD55G1_MODEL_ID_2 = 0x53354731,
> >> +	VD55G1_MODEL_ID_3 = 0x53354733,
> >> +};
> >> +
> >> +enum vd55g1_color_version {
> >> +	VD55G1_COLOR_VERSION_MONO = 0x0,
> >> +	VD55G1_COLOR_VERSION_BAYER = 0x1,
> >
> > nit: you don't need to initialize the enum members here
>
> Thank you, will do.
>
> >
> >> +};
> >> +
> >> +struct vd55g1_version {
> >> +	char *name;
> >> +	enum vd55g1_model_id id;
> >> +	enum vd55g1_color_version color;
> >> +};
> >> +
> >> +static const struct vd55g1_version vd55g1_versions[] = {
> >> +	{
> >> +		.name  = "vd55g1",
> >> +		.id    = VD55G1_MODEL_ID_2,
> >> +		.color = VD55G1_COLOR_VERSION_MONO,
> >> +	},
> >> +	{
> >> +		.name  = "vd55g4",
> >> +		.id    = VD55G1_MODEL_ID_3,
> >> +		.color = VD55G1_COLOR_VERSION_MONO,
> >> +	},
> >> +	{
> >> +		.name  = "vd65g4",
> >> +		.id    = VD55G1_MODEL_ID_3,
> >> +		.color = VD55G1_COLOR_VERSION_BAYER,
> >> +	},
> >> +};
> >>
> >>  static const u8 vd55g1_patch_array[] = {
> >>  	0x44, 0x03, 0x09, 0x02, 0xe6, 0x01, 0x42, 0x00, 0xea, 0x01, 0x42, 0x00,
> >> @@ -535,7 +562,7 @@ struct vd55g1_vblank_limits {
> >>
> >>  struct vd55g1 {
> >>  	struct device *dev;
> >> -	unsigned int id;
> >> +	const struct vd55g1_version *version;
> >>  	struct v4l2_subdev sd;
> >>  	struct media_pad pad;
> >>  	struct regulator_bulk_data supplies[ARRAY_SIZE(vd55g1_supply_name)];
> >> @@ -628,7 +655,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
> >>  {
> >>  	unsigned int i, j;
> >>
> >> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> >> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
> >>  		return code;
> >
> > As pointed out in the previous patch, you seem to have 2 mono formats.
> > Is this still ok ?
> >
> >>
> >>  	for (i = 0; i < ARRAY_SIZE(vd55g1_mbus_formats_bayer); i++) {
> >> @@ -1183,8 +1210,8 @@ static int vd55g1_patch(struct vd55g1 *sensor)
> >>  	u64 patch;
> >>  	int ret = 0;
> >>
> >> -	/* vd55g1 needs a patch while vd65g4 does not */
> >> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
> >> +	/* Version 2 needs a patch while version 3 does not */
> >> +	if (sensor->version->id == VD55G1_MODEL_ID_2) {
> >>  		vd55g1_write_array(sensor, VD55G1_REG_FWPATCH_START_ADDR,
> >>  				   sizeof(vd55g1_patch_array),
> >>  				   vd55g1_patch_array, &ret);
> >
> > You might want to consider renaming vd55g1_patch_array ?
>
> It doesn't really patch an array, it writes an array of values into

My only point here was that it has 'vd55g1' in the name.

> continuous i2c registers. Just like before converting to cci_write() I
> used to have a vd55g1_write() function to write a register, I derived a
> vd55g1_write_array() function. Here it happens to be a firmware patch,
> but it could be anything you want ;)
>
> >
> >> @@ -1256,7 +1283,7 @@ static int vd55g1_enum_mbus_code(struct v4l2_subdev *sd,
> >>  	struct vd55g1 *sensor = to_vd55g1(sd);
> >>  	u32 base_code;
> >>
> >> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1) {
> >> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER) {
> >>  		if (code->index >= ARRAY_SIZE(vd55g1_mbus_formats_mono))
> >>  			return -EINVAL;
> >>  		base_code = vd55g1_mbus_formats_mono[code->index];
> >> @@ -1372,7 +1399,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
> >>  	if (ret)
> >>  		return ret;
> >>
> >> -	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> >> +	if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
> >>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
> >>  	else
> >>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
> >> @@ -1659,38 +1686,48 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
> >>  	return ret;
> >>  }
> >>
> >> +static const struct vd55g1_version *
> >> +	vd55g1_get_version(enum vd55g1_model_id id,
> >> +			   enum vd55g1_color_version color)
> >
> > Should you indent one tab left ?
> >
>
> checkpatch.pl is fine with both. I can indent left, it looks cleaner.
>
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(vd55g1_versions); i++) {
> >
> > You can declare i inside the for loop
> >
>
> Yes, thank you.
>
> >> +		if (vd55g1_versions[i].id == id &&
> >> +		    vd55g1_versions[i].color == color)
> >> +			return &vd55g1_versions[i];
> >> +	}
> >> +
> >> +	return NULL;
> >> +}
> >> +
> >>  static int vd55g1_detect(struct vd55g1 *sensor)
> >>  {
> >> -	unsigned int dt_id = (uintptr_t)device_get_match_data(sensor->dev);
> >> -	u64 rev, id;
> >> -	int ret;
> >> +	const struct vd55g1_version *dt_version =
> >> +		device_get_match_data(sensor->dev);
> >> +	const struct vd55g1_version *version;
> >> +	u64 color, id;
> >> +	int ret = 0;
> >>
> >> -	ret = vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, NULL);
> >> +	vd55g1_read(sensor, VD55G1_REG_MODEL_ID, &id, &ret);
> >> +	vd55g1_read(sensor, VD55G1_REG_COLOR_VERSION, &color, &ret);
> >>  	if (ret)
> >>  		return ret;
> >>
> >> -	if (id != VD55G1_MODEL_ID_VD55G1 && id != VD55G1_MODEL_ID_VD65G4) {
> >> -		dev_warn(sensor->dev, "Unsupported sensor id 0x%x\n",
> >> -			 (u32)id);
> >> +	version = vd55g1_get_version(id, color);
> >> +	if (!version) {
> >> +		dev_warn(sensor->dev, "Unsupported sensor version, expected %s\n",
> >> +			 dt_version->name);
> >>  		return -ENODEV;
> >>  	}
> >> -	if (id != dt_id) {
> >> -		dev_err(sensor->dev, "Probed sensor %s and device tree definition (%s) mismatch",
> >> -			VD55G1_MODEL_ID_NAME(id), VD55G1_MODEL_ID_NAME(dt_id));
> >> +	if (version->id != dt_version->id ||
> >> +	    version->color != dt_version->color) {
> >> +		dev_err(sensor->dev, "Probed sensor version %s and device tree definition %s mismatch",
> >> +			version->name, dt_version->name);
> >>  		return -ENODEV;
> >>  	}
> >> -	sensor->id = id;
> >>
> >> -	ret = vd55g1_read(sensor, VD55G1_REG_REVISION, &rev, NULL);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >> -	if ((id == VD55G1_MODEL_ID_VD55G1 && rev != VD55G1_REVISION_CCB) &&
> >> -	    (id == VD55G1_MODEL_ID_VD65G4 && rev != VD55G1_REVISION_BAYER)) {
> >> -		dev_err(sensor->dev, "Unsupported sensor revision 0x%x for sensor %s\n",
> >> -			(u16)rev, VD55G1_MODEL_ID_NAME(id));
> >> -		return -ENODEV;
> >> -	}
> >> +	sensor->version = version;
> >>
> >>  	return 0;
> >>  }
> >> @@ -2048,8 +2085,9 @@ static void vd55g1_remove(struct i2c_client *client)
> >>  }
> >>
> >>  static const struct of_device_id vd55g1_dt_ids[] = {
> >> -	{ .compatible = "st,vd55g1", .data = (void *)VD55G1_MODEL_ID_VD55G1 },
> >> -	{ .compatible = "st,vd65g4", .data = (void *)VD55G1_MODEL_ID_VD65G4 },
> >> +	{ .compatible = "st,vd55g1", .data = (void *)&vd55g1_versions[0] },
> >> +	{ .compatible = "st,vd55g4", .data = (void *)&vd55g1_versions[1] },
> >> +	{ .compatible = "st,vd65g4", .data = (void *)&vd55g1_versions[2] },
> >>  	{ /* sentinel */ }
> >>  };
> >
> > All minors
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks
> >   j
> >
> >>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
> >>
> >> --
> >> 2.43.0
> >>
> >>
>
> --
> Regards,
> Benjamin
>


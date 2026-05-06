Return-Path: <linux-media+bounces-60538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJr5Kmj++mnjUwMAu9opvQ
	(envelope-from <linux-media+bounces-60538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:40:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 103514D7F85
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5754E30134BB
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADC13E1220;
	Wed,  6 May 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jlqkk+IT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689433ADAF
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056735; cv=none; b=Qs3caBr5PJQkGGCPhr4SpJMvTtboMm4dq0l2jQBZGZmvtj9NkHa5ndIc4mSr/f0liiCa8mMRhzFPZ88LTp/bk/X9oeI4RUYVqjiIj32t0ov2lo8k9Wv5+AW5UWn58eZopwzIvXT8Pf7lk557LujGdONqR0FB2ZdbDURC/pkaFKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056735; c=relaxed/simple;
	bh=/nxQM0zxMGOnsGfIE48WJ8vbx5lBX/MUIYCPpo9AnY0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aftp1C7BBx4nXFQKW/2rHE03QIto3bvud/HjBmbbG5dGoQUHIxqIdCSMOLjQdO3zavS0ipVA9KO7A0N/QIBundlzHwxhnTCJVG1CY0NtAHAW/bEIz2uK+UH25SB8tSr9qLNlh4ZHmz1XrB0C/71e36J4Per/5EYVWssVAkJuMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jlqkk+IT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26AC778E;
	Wed,  6 May 2026 10:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778056729;
	bh=/nxQM0zxMGOnsGfIE48WJ8vbx5lBX/MUIYCPpo9AnY0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jlqkk+ITa9apn3R+kfLINlTa+tLeVw/8G8xTFJw4FHx5yv2dQrL2VynaPf2IYVfKW
	 EEGShnDfbOp0RMb0Psc8LvGzeP0PHQOdZV3Y3WRkfVHjrLV77REhLY3/ClZmBXQCVn
	 Q8CDffKDuzRLhuyyP2QHPrq+hTQSy6lhMxrUN2Y4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260505223005.84162-2-miguel.vadillo@intel.com>
References: <20260505223005.84162-1-miguel.vadillo@intel.com> <20260505223005.84162-2-miguel.vadillo@intel.com>
Subject: Re: [PATCH 1/2] media: i2c: cvs: Add driver of Intel Computer Vision Sensing Controller(CVS)
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com, miguel.vadillo@intel.com
To: Miguel Vadillo <miguel.vadillo@intel.com>, linux-media@vger.kernel.org
Date: Wed, 06 May 2026 09:38:49 +0100
Message-ID: <177805672969.3225262.17973373065597618604@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: 103514D7F85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60538-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ping.linuxembedded.co.uk:mid]

Hi Miguel,



Quoting Miguel Vadillo (2026-05-05 23:30:04)
> Add driver for Intel Computer Vision Sensing (CVS) devices found on
> Intel Luna Lake (LNL), Panther Lake (PTL), and Arrow Lake (ARL)
> platforms.

I haven't heard of the CVS component yet.

The main thing I can determine is that it controls the privacy led for
the cameras in the pipeline automatically if there is a stream active?

What else does the CVS do ? I see there are 'firmwares' to load to the
devices, so it seems like a far more complex part that simply turning an
LED on and off...

Trimming below as I'm not specifically reviewing the driver here, but
reading this patch made me think about the other devices that are
essentially a media-bus pass through device (like other video
multiplexors).

<snip>


> +
> +/**
> + * cvs_csi_set_fmt - Negotiate pad format
> + * @sd: Sub-device
> + * @state: State
> + * @format: Desired / returned format
> + *
> + * Mirrors sink format onto source pad. Accepts many media bus codes, fa=
lling
> + * back to Y8 if unsupported. Normalizes field setting.
> + *
> + * Return: 0.
> + */
> +static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *state,
> +                          struct v4l2_subdev_format *format)
> +{
> +       struct v4l2_mbus_framefmt *src =3D
> +               v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SOURCE);
> +       struct v4l2_mbus_framefmt *sink =3D
> +               v4l2_subdev_state_get_format(state, ICVS_CSI_PAD_SINK);
> +
> +       if (format->pad =3D=3D ICVS_CSI_PAD_SOURCE) { /* source pad mirro=
rs sink */
> +               *src =3D *sink;
> +               return 0;
> +       }
> +
> +       v4l_bound_align_image(&format->format.width, 1, 65536, 0,
> +                             &format->format.height, 1, 65536, 0, 0);
> +
> +       switch (format->format.code) {
> +       /* Accept a large list; default fallback to Y8 */
> +       case MEDIA_BUS_FMT_RGB444_1X12:
> +       case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
> +       case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
> +       case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
> +       case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
> +       case MEDIA_BUS_FMT_RGB565_1X16:
> +       case MEDIA_BUS_FMT_BGR565_2X8_BE:
> +       case MEDIA_BUS_FMT_BGR565_2X8_LE:
> +       case MEDIA_BUS_FMT_RGB565_2X8_BE:
> +       case MEDIA_BUS_FMT_RGB565_2X8_LE:
> +       case MEDIA_BUS_FMT_RGB666_1X18:
> +       case MEDIA_BUS_FMT_RBG888_1X24:
> +       case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> +       case MEDIA_BUS_FMT_BGR888_1X24:
> +       case MEDIA_BUS_FMT_GBR888_1X24:
> +       case MEDIA_BUS_FMT_RGB888_1X24:
> +       case MEDIA_BUS_FMT_RGB888_2X12_BE:
> +       case MEDIA_BUS_FMT_RGB888_2X12_LE:
> +       case MEDIA_BUS_FMT_ARGB8888_1X32:
> +       case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
> +       case MEDIA_BUS_FMT_RGB101010_1X30:
> +       case MEDIA_BUS_FMT_RGB121212_1X36:
> +       case MEDIA_BUS_FMT_RGB161616_1X48:
> +       case MEDIA_BUS_FMT_Y8_1X8:
> +       case MEDIA_BUS_FMT_UV8_1X8:
> +       case MEDIA_BUS_FMT_UYVY8_1_5X8:
> +       case MEDIA_BUS_FMT_VYUY8_1_5X8:
> +       case MEDIA_BUS_FMT_YUYV8_1_5X8:
> +       case MEDIA_BUS_FMT_YVYU8_1_5X8:
> +       case MEDIA_BUS_FMT_UYVY8_2X8:
> +       case MEDIA_BUS_FMT_VYUY8_2X8:
> +       case MEDIA_BUS_FMT_YUYV8_2X8:
> +       case MEDIA_BUS_FMT_YVYU8_2X8:
> +       case MEDIA_BUS_FMT_Y10_1X10:
> +       case MEDIA_BUS_FMT_UYVY10_2X10:
> +       case MEDIA_BUS_FMT_VYUY10_2X10:
> +       case MEDIA_BUS_FMT_YUYV10_2X10:
> +       case MEDIA_BUS_FMT_YVYU10_2X10:
> +       case MEDIA_BUS_FMT_Y12_1X12:
> +       case MEDIA_BUS_FMT_UYVY12_2X12:
> +       case MEDIA_BUS_FMT_VYUY12_2X12:
> +       case MEDIA_BUS_FMT_YUYV12_2X12:
> +       case MEDIA_BUS_FMT_YVYU12_2X12:
> +       case MEDIA_BUS_FMT_UYVY8_1X16:
> +       case MEDIA_BUS_FMT_VYUY8_1X16:
> +       case MEDIA_BUS_FMT_YUYV8_1X16:
> +       case MEDIA_BUS_FMT_YVYU8_1X16:
> +       case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
> +       case MEDIA_BUS_FMT_UYVY10_1X20:
> +       case MEDIA_BUS_FMT_VYUY10_1X20:
> +       case MEDIA_BUS_FMT_YUYV10_1X20:
> +       case MEDIA_BUS_FMT_YVYU10_1X20:
> +       case MEDIA_BUS_FMT_VUY8_1X24:
> +       case MEDIA_BUS_FMT_YUV8_1X24:
> +       case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> +       case MEDIA_BUS_FMT_UYVY12_1X24:
> +       case MEDIA_BUS_FMT_VYUY12_1X24:
> +       case MEDIA_BUS_FMT_YUYV12_1X24:
> +       case MEDIA_BUS_FMT_YVYU12_1X24:
> +       case MEDIA_BUS_FMT_YUV10_1X30:
> +       case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> +       case MEDIA_BUS_FMT_AYUV8_1X32:
> +       case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> +       case MEDIA_BUS_FMT_YUV12_1X36:
> +       case MEDIA_BUS_FMT_YUV16_1X48:
> +       case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> +       case MEDIA_BUS_FMT_JPEG_1X8:
> +       case MEDIA_BUS_FMT_AHSV8888_1X32:
> +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> +       case MEDIA_BUS_FMT_SBGGR12_1X12:
> +       case MEDIA_BUS_FMT_SGBRG12_1X12:
> +       case MEDIA_BUS_FMT_SGRBG12_1X12:
> +       case MEDIA_BUS_FMT_SRGGB12_1X12:
> +       case MEDIA_BUS_FMT_SBGGR14_1X14:
> +       case MEDIA_BUS_FMT_SGBRG14_1X14:
> +       case MEDIA_BUS_FMT_SGRBG14_1X14:
> +       case MEDIA_BUS_FMT_SRGGB14_1X14:
> +       case MEDIA_BUS_FMT_SBGGR16_1X16:
> +       case MEDIA_BUS_FMT_SGBRG16_1X16:
> +       case MEDIA_BUS_FMT_SGRBG16_1X16:
> +       case MEDIA_BUS_FMT_SRGGB16_1X16:
> +               break;

I've seen this on other pass through devices, and I wonder if really
there's nothing to filter here - it could be anything. Or perhaps if we
did need to ensure the driver only supported a specific bus type - that
could be factored out.


> +       default:
> +               format->format.code =3D MEDIA_BUS_FMT_Y8_1X8;
> +               break;
> +       }
> +
> +       if (format->format.field =3D=3D V4L2_FIELD_ANY)
> +               format->format.field =3D V4L2_FIELD_NONE;
> +
> +       *sink =3D format->format;
> +       *src =3D *sink;
> +
> +       return 0;
> +}
> +
> +/**
> + * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
> + * @sd: Sub-device
> + * @pad: Pad index
> + * @cfg: Returned bus config
> + *
> + * Fills lane ordering and number of lanes; retrieves link frequency from
> + * remote entity.
> + *
> + * Return: 0 on success or negative errno.
> + */
> +static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int =
pad,
> +                                  struct v4l2_mbus_config *cfg)
> +{
> +       struct icvs *ctx =3D sd_to_csi(sd);
> +       s64 freq;
> +
> +       cfg->type =3D V4L2_MBUS_CSI2_DPHY;
> +       for (unsigned int i =3D 0; i < V4L2_MBUS_CSI2_MAX_DATA_LANES; i++)
> +               cfg->bus.mipi_csi2.data_lanes[i] =3D i + 1;
> +       cfg->bus.mipi_csi2.num_data_lanes =3D ctx->nr_of_lanes;
> +
> +       freq =3D v4l2_get_link_freq(ctx->remote, 0, 0);
> +       if (freq < 0)
> +               return -EINVAL;
> +
> +       ctx->link_freq =3D freq;
> +       cfg->link_freq =3D freq;
> +
> +       return 0;
> +}

So more of a question for linux-media community, I've seen this pattern
a couple of times - should or could we consider a way to factor out a
passthrough device which doesn't modify the stream(s) formats and is
simply representing almost a connector type ?

--
Kieran


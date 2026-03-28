Return-Path: <linux-media+bounces-57442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PQdFhHfx2kfeAUAu9opvQ
	(envelope-from <linux-media+bounces-57442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:00:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A934E9B5
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 15:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7102301C3F6
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885533921D6;
	Sat, 28 Mar 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/ywmdGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BA13AA2F;
	Sat, 28 Mar 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706389; cv=none; b=F5TEswicgAG8nAsmCEY2rM5LmwCR0ARAwf7AMU+rvVS19OiAyCSZOk9/6bzY1BszB3C6LMDESNTiAZMHdvGIFGrwioZJ+A2IaAWRJDnSSZ7jaqxxgA7XjvMOznctJ+mYaXIWOByBo4UquKAtPD4rdgTgphv7NqaQYT0vg+yOfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706389; c=relaxed/simple;
	bh=h/tKi6QrqOTDKr4SqP1BIjcSeikVfTPP+W8yGCH6ZKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5R+H+/npIqHM9JZs95yLUE4bAM9Zm6C4OErHRMI+BYCKRyfnmd5wG0htqOEIU/zXxN/A0yNphCvupAwDOiavd/Ib4oudWG0GBv1/m7/Nvl/NgFjl0dQMvCiu1ipK+2VfII/J974fuVukYkCgLCdU3GzJLiX2JdmyzneJY18p/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/ywmdGQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774706388; x=1806242388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h/tKi6QrqOTDKr4SqP1BIjcSeikVfTPP+W8yGCH6ZKg=;
  b=b/ywmdGQVk5+LK2ljewhfhadf3hB0rwkseFi8bIwd71B1RKdwFSbAzYX
   RL6v5yRuVgI0X9CCcZZiR/B4MaX/PBVNhdc1o/tDHbUuP4p7sCK4fMwFr
   1YWnylLGBhX7uQQSD1IHhe5ns2P8eSLJkjopoiysa23jheAqVq32J+Vxh
   mCHi5XTGBIavmeHY6zwslk4okiUg99Nh5x1VUrU7YVYycG53IGa0/Uuqk
   FnUsMaiSLS7lnwej9k6jhVNJN9WAdKhDN/t6pyZc0H6L3fWN0eL1E0nfA
   H2FZrZLVCkKNAaCx79t+RBgee1Z3G++l8zNLfCjGXgevM53CqSOPlqdOS
   Q==;
X-CSE-ConnectionGUID: Z/qEywF3TT2IqgR9DkVKLg==
X-CSE-MsgGUID: WutoUK08SPuk+O6MRSY28Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="74941681"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="74941681"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:59:47 -0700
X-CSE-ConnectionGUID: Xtwd/9HMSvafUDAoEddeDg==
X-CSE-MsgGUID: iTaJ75wkQcqbMOqqbZfwNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="230354890"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.251])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:59:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ECDAD121D3E;
	Sat, 28 Mar 2026 15:59:47 +0200 (EET)
Date: Sat, 28 Mar 2026 15:59:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] media: i2c: ov5645: Report streams using frame
 descriptors
Message-ID: <acfe0wCdyX20In8I@kekkonen.localdomain>
References: <20260328132902.776757-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328132902.776757-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57442-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,renesas.com:email,linuxtv.org:url]
X-Rspamd-Queue-Id: B77A934E9B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

Thanks for the patch.

On Sat, Mar 28, 2026 at 01:29:01PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v3 [0],
> - Added a macro for the source pad index.
> - Updated ov5645_init_state() to use the new macro.
> 
> [0] https://lore.kernel.org/all/20241018153230.235647-9-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Hi Laurent,
> 
> Ive restored your RB tag with the above changes. Please let me know if
> you have any further comments.
> Cheers,
> Prabhakar
> ---
>  drivers/media/i2c/ov5645.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index b10d408034a1..df9001fce44d 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -28,6 +28,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
> @@ -68,6 +69,8 @@ static const char * const ov5645_supply_name[] = {
>  
>  #define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
>  
> +#define OV5645_PAD_SOURCE	0
> +
>  struct reg_value {
>  	u16 reg;
>  	u8 val;
> @@ -817,6 +820,29 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
>  	.s_ctrl = ov5645_s_ctrl,
>  };
>  
> +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct v4l2_subdev_state *state;
> +	u32 code;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	code = v4l2_subdev_state_get_format(state, OV5645_PAD_SOURCE, 0)->code;
> +	v4l2_subdev_unlock_state(state);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	memset(fd->entry, 0, sizeof(fd->entry));
> +
> +	fd->entry[0].pixelcode = code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_YUV422_8B;

Instead of doing this, could you use my patch here
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=56eaab0eed55e5e777344e0b3973d8072786dd98>?

Every caller needs to be changed, too, but there are less than ten so
that's a non-issue.

> +
> +	return 0;
> +}
> +
>  static int ov5645_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state *sd_state,
>  				 struct v4l2_subdev_mbus_code_enum *code)

-- 
Regards,

Sakari Ailus


Return-Path: <linux-media+bounces-34731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91CAD8816
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAD603B9813
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 09:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C499B291C22;
	Fri, 13 Jun 2025 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZZse0Hg0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fArqI0AX"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0D24BD1A;
	Fri, 13 Jun 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749807515; cv=none; b=DbR8/mkoLpeB92QaLun6uHdbHspJGusnv+Fj3KcVm4jB75D+AZXfDLZq+gNjgat03ZGccbETlllLU/ZaRoArVjbe5S7zjacoacoq1msAGwBhiHb3QLZLKDK82qTTLpEgtYkUOiodMp/9BqQ5B1ZGOSVsGu6rY4IdL5dR3mWKDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749807515; c=relaxed/simple;
	bh=M1Vr+ubKjv19b1D/uzQHWx1CK+0qrQr9HQrsYqQCaNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEl47cxE2VQmY5ea+PXhxHsvX3Mh24/sXx3EQSoA4U/hZpif/r9mcgSCBJ7zG6/onnzkNBVHqX6OVX21wrpfjhVFPSvVdVluLeC+yZSOdzChBQXDSUq4h4qvrpZabD3DFKrbS+XudalGAXTFPYTNxw0CvNkYWx9K/30pXJhYoY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZZse0Hg0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fArqI0AX; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D20B21140150;
	Fri, 13 Jun 2025 05:38:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 05:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749807511;
	 x=1749893911; bh=Sv4mY3WkFQYLIZpKCvWR41O4FjcLEbQZQL+kVMWdgkg=; b=
	ZZse0Hg0sb4m4wVZJfSPFVXM1sdAUtUxZGeeZl+ldZO7QFfGU7uer/Zkx9H/Ux4A
	PEaqpKrBOnv6q1nJjL0jruCoRCJKvYVzpvOsN7u+wTJ68+9WNBRxMCwp2dbLa+jS
	t1jqG9TeU21AOlvDTjXXdqBz4aCxQFF0fxOlck3k09WgQzOQx7XPTQpryY0eglc/
	kC7EXST6K37RaB0xfldY/8P6yW/4o8xaj0NhzQ6A0xJhqYcTzEeb7TIzDo115KSi
	4TxiLNiOpjL20z6GjUztnbqy+5wP0SAPGchwJED2ia0sMyO/g49uQGkd/ODMwGlZ
	vEZK+5Cx7YZfsJZEZqrgPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749807511; x=
	1749893911; bh=Sv4mY3WkFQYLIZpKCvWR41O4FjcLEbQZQL+kVMWdgkg=; b=f
	ArqI0AXuhaXWac2Qj3byrpSfOMQ2ZawNfSySbfV49XPrcRsdXgkCRWwLKT8AnphY
	5bmMhC41hvSlJXX/7KwuusWjzrvcEw+iUlkER+c826bL6IZo9KOwez3cdMWb23Mf
	D48FidEmtBI3HBhXWEKUjTG17k4eb/BFPPqrVB1duGSvu1+1QPeHiATf2p1V/lNF
	fzfhd3b5CsVyBShwactF+7R3qlpEhDap6VA9/WMom7qppugZdA/gksTSy9BI6OD7
	9QsMKsVJmkc3LmC0cikFDQD2IbMUJxbitV38zTVASoxkfRVf8rhu7MCRhacasqIn
	0hCf24SdSJLQ59DxYRlXA==
X-ME-Sender: <xms:l_FLaOjRIqF1I1h_2YVMYgbg501CovqV2IN753OUNQINf3EiRh05Pw>
    <xme:l_FLaPDrP96_wvyUryq_7xUoUN9j3ly_jlHj0iazXsNmipOgD5m3g2nt2U6N-hUpY
    WEKsc4_furKYqjtyCE>
X-ME-Received: <xmr:l_FLaGFt0acvtU7f8Lyk-mrHFYJQFTySNxtpiUJ_B0u5g-4DrnhDZbhpfJ5JHhXDW5AwVslZgpYoLJ9GBUiGJIcQSCL_bDY0Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftd
    dvleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrd
    hsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprh
    gtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdp
    rhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtoh
    hmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:l_FLaHQkwNTVvYd8l7zmwe0kOTNvuOfebnSHVgHjnYATg9kydqPnkw>
    <xmx:l_FLaLyBw6W4AzaOcmXtKMjciFF-B7WojHezoTkakMrB-h2DwVNCDQ>
    <xmx:l_FLaF7BA10h9XVGWSbu0ABKChS1B27XAbIKDgqsJYc-jcBbby1uog>
    <xmx:l_FLaIxamTNIiQAV7gZbYFLa4n9FHqSlD2uUYb3wbyCB4h7S-F770g>
    <xmx:l_FLaDNNhXk7p1AYP69eBRxEylri2UooBqQkK38-UARbOqW_gjlb47I1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 05:38:31 -0400 (EDT)
Date: Fri, 13 Jun 2025 11:38:29 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 11/12] media: rcar-vin: Enable media-graph on Gen2
Message-ID: <20250613093829.GB1002387@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-12-niklas.soderlund+renesas@ragnatech.se>
 <20250612235319.GH10542@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612235319.GH10542@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your review. I know this patch must not have been fun to 
review, much appreciated.

On 2025-06-13 02:53:19 +0300, Laurent Pinchart wrote:

[snip]

> > @@ -290,17 +283,15 @@ static int rvin_group_notify_bound(struct 
> > v4l2_async_notifier *notifier,
> >  	guard(mutex)(&group->lock);
> >  
> >  	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
> 		struct rvin_dev *vin = &group->vin[i];
> 
> will simplify the code blow.

Create idea.

[snip]

> > @@ -971,7 +873,7 @@ static int __maybe_unused rvin_resume(struct 
> > device *dev)
> >  	 * as we don't know if and in which order the master VINs will
> >  	 * be resumed.
> >  	 */
> > -	if (vin->info->use_mc) {
> > +	if (vin->info->model == RCAR_GEN3) {
> 
> No need to do this for Gen4 ?

No. This section restores the routing for a set of VIN instances, a 
feature only available on Gen3. On Gen4 this functionality is moved to 
the Channel Selector ISP. That it previously was done on Gen4 was not 
intentional.

I think this is a good example on how organic grow of this driver have 
created a lot of unneeded complexity that needs to be resolved, see next 
comment.

[snip]

> > @@ -1319,21 +1209,27 @@ static int rcar_vin_probe(struct 
> > platform_device *pdev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	if (vin->info->use_isp) {
> > -		ret = rvin_isp_init(vin);
> > -	} else if (vin->info->use_mc) {
> > -		ret = rvin_csi2_init(vin);
> > +	switch (vin->info->model) {
> > +	case RCAR_GEN3:
> > +	case RCAR_GEN4:
> > +		if (vin->info->use_isp) {
> > +			ret = rvin_isp_init(vin);
> > +		} else {
> > +			ret = rvin_csi2_init(vin);
> >  
> > -		if (vin->info->scaler &&
> > -		    rvin_group_id_to_master(vin->id) == vin->id)
> > -			vin->scaler = vin->info->scaler;
> > -	} else {
> > -		ret = rvin_group_get(vin, NULL, NULL);
> > +			if (vin->info->scaler &&
> > +			    rvin_group_id_to_master(vin->id) == vin->id)
> > +				vin->scaler = vin->info->scaler;
> > +		}
> > +		break;
> > +	default:
> > +		ret = rvin_group_get(vin, rvin_parallel_setup_links, NULL);
> >  		if (!ret)
> >  			ret = rvin_group_notifier_init(vin, 0, 0);
> >  
> >  		if (vin->info->scaler)
> >  			vin->scaler = vin->info->scaler;
> 
> If I'm not mistaken there's one group per VIN on Gen2, right ? If so, I
> think you could move the
> 
> 		if (vin->info->scaler &&
> 		    rvin_group_id_to_master(vin->id) == vin->id)
> 			vin->scaler = vin->info->scaler;
> 
> code after the switch.

Yes and no. The function rvin_group_id_to_master() is purely a Gen3 
thing. To move the check outside the switch it would need to be made 
Gen2 aware. It can be kept in the Gen3+Gen4 code path as we know we 
don't have any scalers on Gen4 so vin->info->scaler will always be 
false.

As the previous comment hints at, this is a bit of an organic growth 
mess. In my ever growing todo file to clean up this driver I hope to 
rework the info structure to remove the remove the 
vin->info->{model,use_isp,nv12,raw10} flags and replace them with 
function pointers that do the right thing for each platform without 
these special cases sprinkled all over. Too much small issues have come 
up over the years using the current design.

For this reason I would like to keep this split in each case of the 
switch over extending the special case handling more in the helper 
functions.

[snip]

> > @@ -1011,11 +592,7 @@ static int rvin_open(struct file *file)
> >  	if (ret)
> >  		goto err_unlock;
> >  
> > -	if (vin->info->use_mc)
> > -		ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
> > -	else if (v4l2_fh_is_singular_file(file))
> > -		ret = rvin_power_parallel(vin, true);
> > -
> > +	ret = v4l2_pipeline_pm_get(&vin->vdev.entity);
> 
> Another item for your todo list, this is deprecated.

Ack, added to list. I hope I can get that list down to zero at some 
point! Getting this series done would be a good step as it's blocking 
many other smaller improvements. Hopefully we won't need another large 
series like this to move forward.

[snip]

> > @@ -1162,13 +721,8 @@ int rvin_v4l2_register(struct rvin_dev *vin)
> >  	vin->format.field = RVIN_DEFAULT_FIELD;
> >  	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
> >  
> > -	if (vin->info->use_mc) {
> > -		vdev->device_caps |= V4L2_CAP_IO_MC;
> > -		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
> > -	} else {
> > -		vdev->ioctl_ops = &rvin_ioctl_ops;
> > -		rvin_reset_format(vin);
> > -	}
> > +	vdev->device_caps |= V4L2_CAP_IO_MC;
> 
> You can combine this with the line that sets device_caps.
> 
> > +	vdev->ioctl_ops = &rvin_mc_ioctl_ops;
> 
> I would also move this above with the rest of the code that sets the
> vdev fields.

Great catch, thanks!

[snip]

-- 
Kind Regards,
Niklas Söderlund


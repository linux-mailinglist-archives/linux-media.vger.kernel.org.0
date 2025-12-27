Return-Path: <linux-media+bounces-49601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2ACDFE15
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 15:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 513523001617
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F5723815B;
	Sat, 27 Dec 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AonkSmGp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EDA17A31C
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766847320; cv=none; b=GLPe9HEYTms6n9/4MO+9AiLob48XfxUkIHIcOMqOUwfNlUdIMA6hXBs8kAkW91AtJqMFG6hDL/sHTnS/MAfdyLba0PjIA0+Z/BlOKPzxMLJgOtcSXTDYEAkQLyTUQrxb2nJeEexOPa9UsTx2L1HvlF90qRnlgXXz3C2RwTLNx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766847320; c=relaxed/simple;
	bh=hR349umQ+q8s41UU+mWuhCrU+wCYGFr3gMIDy7xn0xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ccv1L8Imo+HuCIgYuiqA9hJkGbDlQcZo3EW7C4/QG1/DdH9ZX+P+wQPZ0wGAJnCGximSDOmGo/kDk4rOIef5Mcw34b9LAqPa+NH/2Sfy85Z0s3wxyAfkz6r9BEzqtmUPvYoH8slmg2xCoSPNpyglojPkDu88AhRq/+f6KR7vF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AonkSmGp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9877524A;
	Sat, 27 Dec 2025 15:55:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766847301;
	bh=hR349umQ+q8s41UU+mWuhCrU+wCYGFr3gMIDy7xn0xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AonkSmGpx0/Mg7SoxmMWOBzDj9FiQYpQmzaI78J9n/yCNEroOra5/dHtjcc2NDZFn
	 tuiwfHoSjBqnCQG70mWhTfsrFMQ9cWDTiHxKQbRXujhHkBmNSpZdfbF0DQS9aus1CE
	 KPytHUqCTYTHj3mPWThAXwpWt4lDvVVe2pKpN6ZQ=
Date: Sat, 27 Dec 2025 16:54:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <20251227145458.GL4094@pendragon.ideasonboard.com>
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250629205626.68341-15-hansg@kernel.org>
 <20250702005323.GH17819@pendragon.ideasonboard.com>
 <ee136d75-16a3-4b30-a6e0-981f33494713@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee136d75-16a3-4b30-a6e0-981f33494713@kernel.org>

On Wed, Dec 24, 2025 at 01:12:28PM +0100, Hans de Goede wrote:
> On 2-Jul-25 02:53, Laurent Pinchart wrote:
> > On Sun, Jun 29, 2025 at 10:56:24PM +0200, Hans de Goede wrote:
> >> With IPU# bridges, endpoints may only be created when the IPU bridge is
> >> initialized. This may happen after the sensor driver's first probe().
> >>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >>  drivers/media/i2c/mt9m114.c | 11 +++++++----
> >>  1 file changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> >> index ec5e9ce24d1c..5e759a23e6cc 100644
> >> --- a/drivers/media/i2c/mt9m114.c
> >> +++ b/drivers/media/i2c/mt9m114.c
> >> @@ -2448,11 +2448,14 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
> >>  	struct fwnode_handle *ep;
> >>  	int ret;
> >>  
> >> +	/*
> >> +	 * Sometimes the fwnode graph is initialized by the bridge driver,
> >> +	 * wait for this.
> >> +	 */
> > 
> > I'm still not thrilled by this, but there's no real alternative for the
> > time being. Still, as Sakari mentioned, the IPU bridge code should at
> > some point be moved to the ACPI framework, so let's record here that the
> > sensor driver should then be updated:
> > 
> > 	/*
> > 	 * On ACPI systems the fwnode graph can be initialized by a bridge
> > 	 * driver, which may not have probed yet. Wait for this.
> > 	 *
> > 	 * TODO: Return an error once bridge driver code will have moved
> > 	 * to the ACPI core.
> > 	 */
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I wouldn't like to see this being replicated in lots of sensor drivers
> > though.
> 
> I understand. With the new __devm_v4l2_sensor_clk_get() helper we could
> do something like this:
> 
> From f7b13937af5f706bce3eed87c67a8f484f049c6a Mon Sep 17 00:00:00 2001
> From: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Date: Wed, 24 Dec 2025 13:04:09 +0100
> Subject: [PATCH] media: v4l2-common: sensor_clk_get(): Wait for endpoint
>  fwnode to show up
> 
> On ACPI systems the fwnode graph can be initialized by a bridge driver,
> which may not have probed yet.
> 
> Currently all sensor drivers which are used on ACPI platforms need to wait
> for this themselves.
> 
> Add a check for the endpoint fwnode being present to
> the devm_v4l2_sensor_clk_get() helper, this allows sensor drivers to drop
> the check for this themselves as long as they call the helper before doing
> any endpoint fwnode parsing.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e1113..b68b5567a508 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -743,11 +743,27 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  {
>  	bool of_node = is_of_node(dev_fwnode(dev));
>  	const char *clk_id __free(kfree) = NULL;
> +	struct fwnode_handle *ep;
>  	struct clk_hw *clk_hw;
>  	struct clk *clk;
>  	u32 rate = clk_rate;
>  	int ret = 0;
>  
> +	/*
> +	 * On ACPI systems the fwnode graph can be initialized by a bridge
> +	 * driver, which may not have probed yet. The bridge driver also sets
> +	 * the clock-frequency property which is used below. Wait for this.
> +	 *
> +	 * TODO: Return an error once bridge driver code will have moved
> +	 * to the ACPI core.
> +	 */
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
> +
> +	fwnode_handle_put(ep);
> +
>  	clk = devm_clk_get_optional(dev, id);
>  	if (IS_ERR(clk))
>  		return clk;
> and then in e.g. the mt9m114.c code move the devm_v4l2_sensor_clk_get()
> call to above mt9m114_parse_dt() and then the handling for this can be
> dropped from the mt9m114.c code (and the same for other sensor drivers
> with a similar check).
> 
> The downside of this is that it makes having an endpoint fwnode available
> mandatory for all sensor drivers which use the devm_v4l2_sensor_clk_get()
> helper, but AFAICT having an endpoint fwnode is mandatory for all sensor
> drivers anyways, so this should not be an issue ?

Yes I think that would work, and would avoid copying the hack in
multiple drivers. Sakari, is this OK with you ?

-- 
Regards,

Laurent Pinchart


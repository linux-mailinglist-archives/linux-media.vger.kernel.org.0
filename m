Return-Path: <linux-media+bounces-35706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F40AE54E2
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 00:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3910B168E7F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 22:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C77224B01;
	Mon, 23 Jun 2025 22:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J4Cgqrew"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0A222581;
	Mon, 23 Jun 2025 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716328; cv=none; b=lJjjSYdDTtR6kE/Chla0AqYxoR6KdfJnnKYiw8wt7bISb3CxWH8Ms6rbR09m6MpPNL+0uWmVAQaMLgJx9DffRe8F+MppDPqgUtjOkE2PK7MEKo3VQXS+7eM5f+QUCMuc3I065bjhHxh0vhs9D/FMdAex4uNr935BBPD4rXHb6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716328; c=relaxed/simple;
	bh=9FPGpwbHfMyRqznijKhX15NEtICMEc9YwN0cnoyLa9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv5XzNhboBCU5X8AyByI0NrKwscosxTtZhVZAtoHHm74yGdx5WJ3LwFI4Ty/obNytusoptsPSQY4ulo/2KBnedDN4mjhRDx7dF4GZ/6/bwScv7Er5YPZeLLF+U/zgeMZJx/F8lqKFCE+xGFVJsH2BnRkBALvcFgQGLopUu0y5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J4Cgqrew; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1E39B129;
	Tue, 24 Jun 2025 00:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750716307;
	bh=9FPGpwbHfMyRqznijKhX15NEtICMEc9YwN0cnoyLa9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4Cgqrew/OQcaM3HQQ2aDES/Ak9LhrumAiXHHanEFvnKiSqn9L/tTvaVvpiE3Ri7s
	 RCtUDPDIlXm7QnYY0saP1Lm/FDE44qshdzN1K6F1683h6ZQmY+uaPTz/CIN4koQgaa
	 lWBQXZvpgeZ4xsIQeK9Xnq0HB1s05NNhmdbLxfOI=
Date: Tue, 24 Jun 2025 01:05:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250623220503.GA15951@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>

(CC'ing Mehdi)

On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> >>> +static int ov05c10_probe(struct i2c_client *client)
> >>> +{
> >>> +     struct ov05c10 *ov05c10;
> >>> +     u32 clkfreq;
> >>> +     int ret;
> >>> +
> >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> >>> GFP_KERNEL);
> >>> +     if (!ov05c10)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> >>> +
> >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> >>> &clkfreq);
> >>> +     if (ret)
> >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> >>> +                                   "fail to get clock freq\n");
> >>
> >> Let's try to land
> >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> >> mehdi.djait@linux.intel.com/
> >> and replace the code above with devm_v4l2_sensor_clk_get().
> >>
> > Ok, we will verify on our side.
> 
> We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> support for software_node to make it work with this driver.

Why is that ?

> Please refer 
> the changes below and let us know if these should be submitted as a 
> separate patch.

Mehdi, do you have any comment ?

> ---
> @@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
> *dev, const char *id)
>          const char *clk_id __free(kfree) = NULL;
>          struct clk_hw *clk_hw;
>          struct clk *clk;
> -       bool acpi_node;
> +       bool is_node;
>          u32 rate;
>          int ret;
> 
>          clk = devm_clk_get_optional(dev, id);
>          ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -       acpi_node = is_acpi_node(dev_fwnode(dev));
> +       is_node = is_acpi_node(dev_fwnode(dev)) || 
> is_software_node(dev_fwnode(dev));
> 
>          if (clk) {
> -               if (!ret && acpi_node) {
> +               if (!ret && is_node) {
>                          ret = clk_set_rate(clk, rate);
>                          if (ret) {
>                                  dev_err(dev, "Failed to set clock rate: 
> %u\n",
> @@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
> *dev, const char *id)
>          if (ret)
>                  return ERR_PTR(ret);
> 
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
>                  return ERR_PTR(-ENOENT);
> 
>          if (!id) {
> ----

-- 
Regards,

Laurent Pinchart


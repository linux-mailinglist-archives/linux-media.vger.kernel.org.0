Return-Path: <linux-media+bounces-17769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA696F3E7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F837B256EB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 12:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C4A1CBEB5;
	Fri,  6 Sep 2024 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JwsSGJmE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FE22315;
	Fri,  6 Sep 2024 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725624028; cv=none; b=KmnDy0fXj4GGJeYFJs/ig973UXRkHn4wumwt+sa92CxaUIakldA2WFfcn/cThgzYLSZRew9b0R4LRGl6OsP5xv95cLZEZJ5DPHyTv43czsYte5MF79Qn281g//YaSbr4K54zw7I4G5Wh0Z9pk3tQrck/5FMfPcYg0Ipih8X0Zuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725624028; c=relaxed/simple;
	bh=EPPdr09l0IHVhL4ZJ1hXzyTk5R6I9ApVxjXg76OaYmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfCz57yAUO0c4OkzaVpZ6UNWzYMLG0veE1N5AzREpDZlscIqcGk5UREPxXF270gJfTOzi3uiXp2vO1TPMA533GFV49pAacrFDWp7K5T4y86q4aKVS4L3JvNoIhUnMzjd6Zf4ClwO/S4BAdynFHFz9ZJWu9+ljerMiJfzGqEU4rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JwsSGJmE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0B9A45B;
	Fri,  6 Sep 2024 13:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725623950;
	bh=EPPdr09l0IHVhL4ZJ1hXzyTk5R6I9ApVxjXg76OaYmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwsSGJmEWkeFL5sBWhKazDymChrZbYQtNWU4rE9lOHEmVkDuP6u3qw0RLKaOaoogY
	 N6T7s+gKhDKkS3cn2zQpQGUgaYLsi1WU1OK6UzjEQRaqbgnTXhJ6Lxe131mnzg0C2U
	 2GEeO/G0DFInig6hDVqIdG36i5QfhzwJKDZpwo9I=
Date: Fri, 6 Sep 2024 15:00:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH/RFC v2 1/9] media: dt-bindings: media: i2c: Add AR0144
 camera sensor
Message-ID: <20240906120022.GA13472@pendragon.ideasonboard.com>
References: <20240905225308.11267-1-laurent.pinchart@ideasonboard.com>
 <20240905225308.11267-2-laurent.pinchart@ideasonboard.com>
 <172558168914.3706824.15757823860738253407.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172558168914.3706824.15757823860738253407.robh@kernel.org>

On Thu, Sep 05, 2024 at 07:14:49PM -0500, Rob Herring (Arm) wrote:
> 
> On Fri, 06 Sep 2024 01:52:59 +0300, Laurent Pinchart wrote:
> > Add device tree binding for the onsemi AR0144 CMOS camera sensor. The
> > binding supports both the monochrome and color sensor versions.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Drop clock-names
> > - Rename vdd_io-supply to vddio supply
> > - Drop unnecessary |
> > ---
> >  .../bindings/media/i2c/onnn,ar0144.yaml       | 162 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0144.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/onnn,ar0144.example.dtb: camera@10: 'clock-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,ar0144.yaml#

My bad, I forgot to retest before sending v2 :( Sorry about that. It
will be fixed (and tested) in v3.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240905225308.11267-2-laurent.pinchart@ideasonboard.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

-- 
Regards,

Laurent Pinchart


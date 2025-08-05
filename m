Return-Path: <linux-media+bounces-38915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E70B1B220
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEBCC7A7364
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 10:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A936823B638;
	Tue,  5 Aug 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G+/2gxoL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E875F22DFB5;
	Tue,  5 Aug 2025 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754390388; cv=none; b=b9MYl+u92zSHYNV9nh9hZRWeHoBxuC+PgEI+yAd3MZ+XujBM90sOtx3b97l+eIvTnbGTXo2HkYDsiD/ReFtrgtCUIOHkzjmZ+kqoC4ul28iclkQEQkfS+XLuIS240beCrsOFfaGEZQ0igdXa3sPRJDtDEwz+eH/xpZ3QXEEsaoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754390388; c=relaxed/simple;
	bh=q+bRJ8NdvdagaxL6FGSeczl/EYgU6Uo6cdC7pcIs2LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH8NOHjLnpRQfnWqjwnpfJ8uLu4odm6/jaOyatYQJOrN1TW4RQKiyaNqhV278+LgH7v7/Kgm2JdJHuGkebcla83pJgtAJOSyvDZKk8SOkHBsyl+8IUtUrwE14chhVFHcSlTmr4xqEuE0LaD1RLsmTjQHQYpHKIUv0lin1WWyswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G+/2gxoL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7148E1775;
	Tue,  5 Aug 2025 12:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754390336;
	bh=q+bRJ8NdvdagaxL6FGSeczl/EYgU6Uo6cdC7pcIs2LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+/2gxoLViKOczs7WzdSlCxKoUSTdYpYavAH0jNwV5bANJH9Cx+LEnd0Y5309artn
	 TbrkaOeuCfwCIV+oYcz89VlhwpWbBlMaFwpQpC4ZMZZY5ZoI7XztsTsx3hFYYlhAg1
	 q3yltYNArOIj31VVeiLWCBXSIKh4DRx2HNjLtHtM=
Date: Tue, 5 Aug 2025 13:39:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
Message-ID: <20250805103930.GD24627@pendragon.ideasonboard.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
 <aIcZuj6wrekhaguE@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aIcZuj6wrekhaguE@kekkonen.localdomain>

On Mon, Jul 28, 2025 at 06:33:30AM +0000, Sakari Ailus wrote:
> On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
> > The helper functions is for configuring, starting and stop the MIPI PHY.
> > All configurations related to MIPI PHY configuration and calibration
> > parameters are encapsulated in two helper functions: start and stop
> > mipi phy.
> > 
> > Signed-off-by: Bin Du <Bin.Du@amd.com>
> > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > ---
> >  drivers/media/platform/amd/isp4/Makefile   |    1 +
> >  drivers/media/platform/amd/isp4/isp4_phy.c | 1547 ++++++++++++++++++++
> >  drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
> >  3 files changed, 1562 insertions(+)
> >  create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
> >  create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h

[snip]

> > diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
> > new file mode 100644
> > index 000000000000..8d31a21074bb
> > --- /dev/null
> > +++ b/drivers/media/platform/amd/isp4/isp4_phy.c
> > @@ -0,0 +1,1547 @@

[snip]

> > +union isp4phy_mipi_0 {
> > +	struct {
> > +		u32 shutdownz : 1;
> > +		u32 rstz : 1;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_1 {
> > +	struct {
> > +		u32 mode : 1;
> 
> Please pad these -- I don't think the ABI otherwise requires they're in a
> particular location of the container (u32).

Or better, ditch the structures, and use macros to define register
fields like all other drivers do.

> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_2 {
> > +	struct {
> > +		u32 rxdatawidthhs_0 : 2;
> > +		u32 rxdatawidthhs_1 : 2;
> > +		u32 rxdatawidthhs_2 : 2;
> > +		u32 rxdatawidthhs_3 : 2;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +struct isp4phy_mipi_3 {
> > +	u32 reserved;
> > +};
> > +
> > +union isp4phy_mipi_4 {
> > +	struct {
> > +		u32 enableclk : 1;
> > +		u32 enable_0 : 1;
> > +		u32 enable_1 : 1;
> > +		u32 enable_2 : 1;
> > +		u32 enable_3 : 1;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_5 {
> > +	struct {
> > +		u32 forcerxmode_0 : 1;
> > +		u32 forcerxmode_1 : 1;
> > +		u32 forcerxmode_2 : 1;
> > +		u32 forcerxmode_3 : 1;
> > +		u32 forcerxmode_clk : 1;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_6 {
> > +	struct {
> > +		u32 turndisable_0 : 1;
> > +		u32 turndisable_1 : 1;
> > +		u32 turndisable_2 : 1;
> > +		u32 turndisable_3 : 1;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_7 {
> > +	struct {
> > +		u32 ready : 1;
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_ind_idx {
> > +	struct {
> > +		u32 addr : 16;
> 
> u16 would seem appropriate here.
> 
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_ind_data {
> > +	struct {
> > +		u32 data : 16;
> 
> Ditto.
> 
> > +	} bit;
> > +	u32 value;
> > +};
> > +
> > +union isp4phy_mipi_ind_wack {
> > +	struct {
> > +		u32 ack : 1;
> > +		u32 pslverr : 1;
> > +	} bit;
> > +	u32 value;
> > +};

[snip]

-- 
Regards,

Laurent Pinchart


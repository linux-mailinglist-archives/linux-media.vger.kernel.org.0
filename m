Return-Path: <linux-media+bounces-21625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE219D3765
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 10:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4738E1F218F1
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 09:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C7C199943;
	Wed, 20 Nov 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZJGdzbPH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hVRiZxFV"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE422318;
	Wed, 20 Nov 2024 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096235; cv=none; b=g6rs84Z9K4F8znbinNqeSVhJ8159zumZvjCTJ1QCNsgtBzm0RIl9atxXeXOt+6kfgjl2dKJYpUNKANtbi48uqwMXsdWrrjMg2gHypQ5O9DavsEkdbr60D9HzS7bpXwuDWmiHoT0fwDNPbJEsRUS6H2IkILtkDOQuNcLxUccvw4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096235; c=relaxed/simple;
	bh=k2N1+XLcnmOO9ruI+qGkSywvd6M6sd4/ksbAJuygd3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBP+MbTMLJmsEr2ehgcndelrxHXq534BtJn9NXEzQsfissSzEp8bubsrDMczIiSqduFWpg4iHiuP7yVcCEQANqbJoDL4rY/XsJnd63zEt2PBxddNJjl3CD5/jLdTr4X8BATfNx1kHFbTpKBytRuIqMkSR8kAopMScSj1aXrvzcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZJGdzbPH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hVRiZxFV; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 4662111401D3;
	Wed, 20 Nov 2024 04:50:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 20 Nov 2024 04:50:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732096232;
	 x=1732182632; bh=0hwDk/Chmm0YRjrcTGG2Ps1/vvgSNGD7F9mzcNKvC1k=; b=
	ZJGdzbPHYUWEDHXig+2dHXnp3g1z4qJTVj7qUHrWKOvjVxRU6bMUOcsULAOiGH6l
	syDSFg8Ns669HPfgCdMPOnPwtXHrRWYnh3tMoTj0MVK4kxfxuE45VcruBfbkx7rr
	ynGn3sL5YM50H46pusgSF/1/ciSNT1MC/EfBKir1UhWTHZ3Z21sqfzVfN3nZ+zoq
	SSRvzpNJKeUyXrG9bxH+YAuOh9rHLY/uxrL/u0NvAz1mdVoMCVcdoBIiUk8Ehc5r
	3rQVOd5ngZJWL/AZF2M1zvGbF5A2/Wu1DH6UjAvpxgI47sVN8IoJojRtx+vWEM9u
	dmyZizaPiOdX5aWxAOQ8kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732096232; x=
	1732182632; bh=0hwDk/Chmm0YRjrcTGG2Ps1/vvgSNGD7F9mzcNKvC1k=; b=h
	VRiZxFVtCDTqCSnSEe9jjNvgwAeGyE6Ecl3KtyyOYKMhkOXAwofhiRuBFJ5Zp4kC
	n8qUN/iRP/qaa2YM6a2lQ53PsQ9nKapFZuF42R2xh3qUtcD8ONE9ftpr57swF1KB
	b4MxdkVdZr0wUBCpWhfon20gi5PN1RleG+bBLsbDDhsA9QdLJqwVDZorVJxt4UQQ
	D2mOntmUpiqmofzGYmUgEFSHC0hIBsT8WtJ3GIqdbxv84YTK9SaIRvzGVJimD4SL
	/GsyaTs1q+ykLAzZHZZQ3xEqtfjh2883FnnRIaqai5uPBoS9KUjVl/aB+xSdHXXw
	axIgdoNxOfPFgEbB/2ZPA==
X-ME-Sender: <xms:57A9Z4YZqAEmgWPIVi3rzpEK7cFjFt9ARC0SJepo-mPaFR90AysyVw>
    <xme:57A9ZzZe_77_zBeQeRTqpkg4jrL_BdG3MiZukDSHvkq7IED6s9ZfpPNQxNsTfFsSs
    rL9sII56-VvR9xCNI4>
X-ME-Received: <xmr:57A9Zy_5h2aadUBS1o6gT9tRgR9OZTa_dAe3Kx_rN69kpTxNm0Zoxr-kFnzoSc0mLYYSz82fSIuhLP2bqAdcyejTJktizMqZjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeggddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepfefhleelhfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvle
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
    dpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    rghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggv
    rhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnth
    drphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepug
    gvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:57A9Zyq__I_s_py98aLCQIgh7DkuTSzbTC6Khi4ixc3Czt-Z2k-QvQ>
    <xmx:57A9ZzrlWEUh97-AX8Ee13f1ztV8f22560sH_Rr10xWYfevOm7P0eQ>
    <xmx:57A9ZwRSKoMHpoe6tNQyhf2YCDhD3thFDrOuSMHsrcQA1qNNWA3NBw>
    <xmx:57A9ZzoVAmUizQaZGA_Qopulwy7B3eQo2rWunvrGneSJUVwWXeh4SQ>
    <xmx:6LA9Zwg6C3xAd9y6wOTBjlF3aOZFkEy3po87KElWDU6iIo030-1M9vHd>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Nov 2024 04:50:31 -0500 (EST)
Date: Wed, 20 Nov 2024 10:50:30 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <20241120095030.GT5315@ragnatech.se>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-3-niklas.soderlund+renesas@ragnatech.se>
 <Zz2Zgvjm21iv-qtc@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz2Zgvjm21iv-qtc@kekkonen.localdomain>

Hello Sakari,

On 2024-11-20 08:10:42 +0000, Sakari Ailus wrote:
> Hejssan,
> 
> On Tue, Nov 19, 2024 at 11:12:47PM +0100, Niklas Söderlund wrote:
> > Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> > line-orders order properties as defined in MIPI Discovery and
> > Configuration (DisCo) Specification for Imaging.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 56 ++++++++++++++++++++++++++-
> >  include/media/v4l2-mediabus.h         | 21 ++++++++++
> >  2 files changed, 76 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index f19c8adf2c61..b8b2b7fb685e 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -127,7 +127,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  {
> >  	struct v4l2_mbus_config_mipi_csi2 *bus = &vep->bus.mipi_csi2;
> >  	bool have_clk_lane = false, have_data_lanes = false,
> > -		have_lane_polarities = false;
> > +		have_lane_polarities = false, have_line_orders = false;
> >  	unsigned int flags = 0, lanes_used = 0;
> >  	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
> >  	u32 clock_lane = 0;
> > @@ -197,6 +197,17 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  		have_lane_polarities = true;
> >  	}
> >  
> > +	rval = fwnode_property_count_u32(fwnode, "line-orders");
> > +	if (rval > 0) {
> > +		if (rval != num_data_lanes) {
> > +			pr_warn("invalid number of line-orders entries (need %u, got %u)\n",
> > +				num_data_lanes, rval);
> > +			return -EINVAL;
> > +		}
> > +
> > +		have_line_orders = true;
> > +	}
> > +
> >  	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
> >  		clock_lane = v;
> >  		pr_debug("clock lane position %u\n", v);
> > @@ -250,6 +261,49 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  		} else {
> >  			pr_debug("no lane polarities defined, assuming not inverted\n");
> >  		}
> > +
> > +		if (have_line_orders) {
> > +			fwnode_property_read_u32_array(fwnode,
> > +						       "line-orders", array,
> > +						       num_data_lanes);
> > +
> > +			for (i = 0; i < num_data_lanes; i++) {
> > +				const char *order;
> > +
> > +				switch (array[i]) {
> > +				case 0:
> > +					order = "ABC";
> > +					break;
> > +				case 1:
> > +					order = "ACB";
> > +					break;
> > +				case 2:
> > +					order = "BAC";
> > +					break;
> > +				case 3:
> > +					order = "BCA";
> > +					break;
> > +				case 4:
> > +					order = "CAB";
> > +					break;
> > +				case 5:
> > +					order = "CBA";
> > +					break;
> 
> Please use an array instead.
> 
> > +				default:
> > +					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> > +						i, array[i]);
> > +					bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > +					continue;
> > +				}
> > +				bus->line_orders[i] = array[i];
> > +				pr_debug("lane %u line order %s", i, order);
> > +			}
> > +		} else {
> > +			for (i = 0; i < num_data_lanes; i++)
> > +				bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> 
> A few lines could be wrapped above.

I'm not sure I understand this comment. Do you mean I could loop over 
num_data_lanes and initialize all lines to ABC before checking 
have_line_orders and that way avoid having to loop here and set the 
default ABC if we are out-of bounds in the switch?

> 
> > +
> > +			pr_debug("no line orders defined, assuming ABC\n");
> > +		}
> >  	}
> >  
> >  	return 0;
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 5bce6e423e94..e7f019f68c8d 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -73,6 +73,24 @@
> >  
> >  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
> >  
> > +/**
> > + * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC (default)
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
> > + * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
> > + */
> > +enum v4l2_mbus_csi2_cphy_line_orders_type {
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
> > +	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
> > +};
> > +
> >  /**
> >   * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
> >   * @flags: media bus (V4L2_MBUS_*) flags
> > @@ -81,6 +99,8 @@
> >   * @num_data_lanes: number of data lanes
> >   * @lane_polarities: polarity of the lanes. The order is the same of
> >   *		   the physical lanes.
> > + * @line_orders: line order of the data lanes. The order is the same of the
> > + *		   physical lanes.
> >   */
> >  struct v4l2_mbus_config_mipi_csi2 {
> >  	unsigned int flags;
> > @@ -88,6 +108,7 @@ struct v4l2_mbus_config_mipi_csi2 {
> >  	unsigned char clock_lane;
> >  	unsigned char num_data_lanes;
> >  	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
> > +	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
> >  };
> >  
> >  /**
> 
> -- 
> Med vänliga hälsningar,
> 
> Sakari Ailus

-- 
Kind Regards,
Niklas Söderlund


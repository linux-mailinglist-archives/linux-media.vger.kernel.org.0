Return-Path: <linux-media+bounces-34803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980AAD9DE4
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E445C189BAA2
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295872E2EE9;
	Sat, 14 Jun 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AryAaJdT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CJFhq/2n"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52748462;
	Sat, 14 Jun 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749912920; cv=none; b=knSYnl5APd0mkPDId2Pv5OAMsAw9hda+v9s3+KVmWzid4jUlxcNyqFcXfgXQe1iB54q5YdB4Tek8EXm5tpVwpx5Vp65ZJhBYYsdeGLjPW6671/BmJ/611Veuz0SNtpNhy1gQ9NirEYH2GXQcsWTnqPhD88mYv9mMnT00JxJp65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749912920; c=relaxed/simple;
	bh=Qp74p+SlmuKAOb9W/HhxUQ4hHHGjZ2JrYkxUij0W0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv/Y7i76c4dg0bpYACscLG4+BFWnUaZJtpgq6/7SXWilSTwnKl9yUDgW3y3e86bP2fGclnjurSNlxdKxrXbuacVemM4uspqDIpYt4dl+dZMSKYxUAQlJqpOwFOvZUJGGi6ekhWWfMChnE8onB3gfA7hXdG1KzWTRrT3KBtYTJOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AryAaJdT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CJFhq/2n; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DFEAF1140126;
	Sat, 14 Jun 2025 10:55:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 14 Jun 2025 10:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749912915;
	 x=1749999315; bh=yBjzGYeqmAWTVucV5oukjT3lAnwl0N9qg1sCV0ktQGY=; b=
	AryAaJdTG8Xwgqjx9lgxj+2iq8FxdLXx7STb5khfzeZjKG8OkyxGmFvfCz7thTFB
	NNOt/eGWvmOXh11U/5luyFomjNj2N0+IUOyLuGCCuUinHGit6AK/lczADzDLNUMl
	/CNLEQwUZ0sMHa4mhQvC3Mwm0vNnVjkE91gvurvsJn950UFf522Xaf0EAweXtw7m
	vAJhRRju5FbGw8mVvKFnKOM6jwxbS+DvSyyN97NdsZELnTRR3pGMaNiIG3rdkuMg
	NbG9S6cJqf/e349hW6tWKDq9QT8Le6NU3S+oeZvvJYy1ur61nydqJms3wOXkSq5S
	dKDKkxSmc/sk7/V4CIioYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749912915; x=
	1749999315; bh=yBjzGYeqmAWTVucV5oukjT3lAnwl0N9qg1sCV0ktQGY=; b=C
	JFhq/2n4jsnxRh++NVBTckR3B8p8VNxc30CVClgF6++5uACQIa084C59a0MLjhBN
	vzHcCK0CyYj4bnhv+eQoXhEVTruUMBeRgJ22A9xo+9dtPiNqMEHrVmQ8G71cUJpX
	OLxvvoTfxOCFw8hsCyT+vab8HWmPWLUIjMxMI39Sn6pc42cvn0oCExsiO2S9Jxdb
	/4ecN/j0W7U+xhmC9Mee7InqVpjU2mvwmon5lRIrV5RifUwuUk5X4VzOjnTOp8G+
	E9CeH+JtQk7wdVD5Dvh9eMaX4OoA4792SWUPL0FTL5W/zFq0peEo6MKhSoma5Ths
	eAxn0iQqsvtlj0GRc7CtQ==
X-ME-Sender: <xms:U41NaPIl-cJVMDQ8mIl2nM9Q9IHdreZJrystL8rnT6dfUC4ptzHA3A>
    <xme:U41NaDKwOvtPAwe8pQl0k6nYQ4jVPKt1J_R7hyaPhxdYkHIwiIvQStBHQx5nQyd5D
    9NDqPWz42TKZ8_0piY>
X-ME-Received: <xmr:U41NaHtJwnODGSjs-iIWutn8q4-7K0ZcKqbD4oofeq9LKmiPYS39Qv_ai6YSIlmu5xVDmZs_n4BQg-gPzwc22DzLSdlL4T7GuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhht
    sehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjrggtohhpohdrmhhonh
    guihesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhm
    ohhnughiodhrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtth
    hopehkihgvrhgrnhdrsghinhhghhgrmhdorhgvnhgvshgrshesihguvggrshhonhgsohgr
    rhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:U41NaIY3BYQmTPx8BL2d-pvPkAsp_5aqROaBxfF7gfxOFqIPuaBrKw>
    <xmx:U41NaGbM5oW2RRQdv1t4CfEvSQoywbp0wWQV-CR9XsD_-MwSBPVzOw>
    <xmx:U41NaMBH18GxNVDlVNduhgjZpKGyq4F-M1IFvhs-r9jWxgnBHSyzKw>
    <xmx:U41NaEaevQoHS_LnD6TE-rbNoIfldaRu_D33mYsGb_Za-1QYrM86PQ>
    <xmx:U41NaMsJs8I_KElnKt1XHkiMHG2NGRFrXBBCFGU1_2u7rma8103lQW_m>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 10:55:15 -0400 (EDT)
Date: Sat, 14 Jun 2025 16:55:13 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v10] media: vsp1: Add VSPX support
Message-ID: <20250614145513.GA1432168@ragnatech.se>
References: <20250529-b4-vspx-v10-1-02a9cb000853@ideasonboard.com>
 <20250607143808.GF2780410@ragnatech.se>
 <4lnsdnsv5h2aza2bkup3bwgqwrlt3i4wtj3jkde24fqingnqlc@2drah4ntnrzz>
 <20250609144208.GJ2780410@ragnatech.se>
 <20250613002417.GJ10542@pendragon.ideasonboard.com>
 <20250613102745.GD1002387@ragnatech.se>
 <20250613193601.GA14438@pendragon.ideasonboard.com>
 <20250613204357.GA1100579@ragnatech.se>
 <20250614142547.GA3346@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250614142547.GA3346@pendragon.ideasonboard.com>

On 2025-06-14 17:25:47 +0300, Laurent Pinchart wrote:
> On Fri, Jun 13, 2025 at 10:43:57PM +0200, Niklas Söderlund wrote:
> > On 2025-06-13 22:36:01 +0300, Laurent Pinchart wrote:
> > > On Fri, Jun 13, 2025 at 12:27:45PM +0200, Niklas Söderlund wrote:
> > > > On 2025-06-13 03:24:17 +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 09, 2025 at 04:42:08PM +0200, Niklas Söderlund wrote:
> > > > > > On 2025-06-09 15:24:56 +0200, Jacopo Mondi wrote:
> > > > > > > On Sat, Jun 07, 2025 at 04:38:08PM +0200, Niklas Söderlund wrote:
> > > > > > > > On 2025-05-29 18:44:17 +0200, Jacopo Mondi wrote:
> > > > > > > > > Add support for VSPX, a specialized version of the VSP2 that
> > > > > > > > > transfers data to the ISP. The VSPX is composed of two RPF units
> > > > > > > > > to read data from external memory and an IIF instance that performs
> > > > > > > > > transfer towards the ISP.
> > > > > > > > >
> > > > > > > > > The VSPX is supported through a newly introduced vsp1_vspx.c file that
> > > > > > > > > exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> > > > > > > > > for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> > > > > > > > > interface, declared in include/media/vsp1.h for the ISP driver to
> > > > > > > > > control the VSPX operations.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > > > > 
> > > > > > > [snip]
> > > > > > > 
> > > > > > > > > +
> > > > > > > > > +	/* Configure WPF0 to enable RPF0 as source. */
> > > > > > > > > +	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
> > > > > > > > > +	vsp1_entity_configure_stream(&pipe->output->entity,
> > > > > > > > > +				     pipe->output->entity.state, pipe,
> > > > > > > > > +				     dl, dlb);
> > > > > > > > > +
> > > > > > > > > +	if (job->config.pairs) {
> > > > > > > > > +		/*
> > > > > > > > > +		 * Configure RPF0 for ConfigDMA data. Transfer the number of
> > > > > > > > > +		 * configuration pairs plus 2 words for the header.
> > > > > > > > > +		 */
> > > > > > > > > +		ret = vsp1_vspx_pipeline_configure(vsp1, job->config.mem,
> > > > > > > > > +						   V4L2_META_FMT_GENERIC_8,
> > > > > > > > > +						   job->config.pairs * 2 + 2, 1,
> > > > > > > > > +						   job->config.pairs * 2 + 2,
> > > > > > > > > +						   VSPX_IIF_SINK_PAD_CONFIG,
> > > > > > > > > +						   dl, dlb);
> > > > > > > >
> > > > > > > > I have run into a new "feature" of the ConfigDMA interface. It don't
> > > > > > > > seem to be to happy when feed too small config buffers. Feeding it
> > > > > > > > configuration data containing 16 or less pairs effects operation in bad
> > > > > > > > ways.
> > > > > > > >
> > > > > > > > Feeding it less then 16 pairs causes corruption of the image buffer
> > > > > > > > which follows the config buffer. Feeding it exactly 16 pairs freezes the
> > > > > > > > VSPX. While feeding it 17 or more pairs all seems to work perfectly. I'm
> > > > > > > > not sure why this is, maybe the minimum buffer constrains are kicking
> > > > > > > > in?
> > > > > > > >
> > > > > > > > This is not a blocker IMHO, we can pad the config buffer with dummy
> > > > > > > > writes or fallback to MMIO for small buffers. For now in the ISP driver
> > > > > > > > I opted for the later as this proves VSPX can function without config
> > > > > > > > DMA while also proving MMIO operation works. The later will become
> > > > > > > > important if we ever try to use the ISP in-line as that mode of
> > > > > > > > operation don't support Config DMA.
> > > > > > > >
> > > > > > > > Maybe a bounds check would be useful here so the VSPX refuses config
> > > > > > > > buffers that are too small?
> > > > > > > 
> > > > > > > The datasheet reports a minimum input size for the IIF of 128x32
> > > > > > > pixels.
> > > > > > > 
> > > > > > > Now, we know that the configDMA is a 1D buffer retroffitted to match a
> > > > > > > 2D API which expresses buffers size as WxH. We currently program an
> > > > > > > height of 1, so I'm not sure where those minimum in the datasheet come from.
> > > > > > > 
> > > > > > > Would padding the config with 0s work in your testing ?
> > > > > > 
> > > > > > I did test adding padding, but not with 0 but with dummy writes to RPP 
> > > > > > registers that had no effect. I'm a bit scared of adding random register 
> > > > > > writes such as writing 0 to address 0 to the config buffer.
> > > > > > 
> > > > > > But padding with basically nop writes worked.
> > > > > 
> > > > > The config buffer starts with the number of register/value pairs,
> > > > > followed by the pairs. Do you experience bad behaviour when the buffer
> > > > > is larger than 16 pairs but the number of pairs in the first field is
> > > > > smaller than 16 ?
> > > > 
> > > > As we don't know how many pairs are needed when we allocate the buffer 
> > > > the current design always allocates space for (1024 - 1) pairs [*].
> > > > 
> > > > For all tests done the buffer is always the same size. The difference is 
> > > > the number of pairs set in the header word, if set to a value bellow 
> > > > (bad image), equal (vsp freeze) or larger then 16 (good image).
> > > 
> > > Looking at the code I think there's another difference. The buffer size
> > > may always be the same, but the size transferred by the VSPX is equal to
> > > job->config.pairs * 2 + 2. What I'm wondering is if the hardware would
> > > misbehave if we always transferred at least 17 * 2 + 2 = 36 bytes, with
> > > the number of pairs in the header being smaller than 16.
> > 
> > That is indeed an interesting point. I did a quick experiment with 
> > transferring 36 and 64 bytes to the Config DMA using VSPX while the 
> > header pair count matching the needed number of actual pairs needed for 
> > the config operation. Unfortunately the result is the same. Having 16 or 
> > less pairs in the header word effects the output image as described 
> > before.
> > 
> > However we learnt that that using the VSPX to send a larger chunk of 
> > data then needed have no ill effect as long as the header word count is 
> > correct and less then the chunk sent. The blocks needing more then 16 
> > pairs to be configured worked as expected, while the one needing fewer 
> > pairs had an negative effect on the outputted image.
> 
> Thanks for testing. The ISP driver will need to pad the config data
> then, it shouldn't be difficult.

The padding is not difficult, finding a address and value that is always 
safe to writ to might be :-) My current solution fallback to MMIO if the 
buffer is less then 17 pairs. I figured that few register writes is 
on-pair with the amount of MMIO needed for the VSP to setup config DMA.  

And it helps prove we can use the ISP inline where config DMA is not 
possible at all using the same mechanics as config DMA.

> Could you please also report this issue
> to Renesas, to try and understand where it comes from ?

Will do.

> 
> > > > *: It do check for overflows and will not allow more then that to be 
> > > > written to the buffer and warns about it so we can increase it if we 
> > > > ever need to. But with current blocks enabled we have space to grow.  
> > > > This limit is also a purely internal thing not exposed to user-space.
> > > > 
> > > > > > > > > +		if (ret)
> > > > > > > > > +			goto error_put_dl;
> > > > > > > > > +
> > > > > > > > > +		second_dl = vsp1_dl_list_get(pipe->output->dlm);
> > > > > > > > > +		if (!second_dl) {
> > > > > > > > > +			ret = -ENOMEM;
> > > > > > > > > +			goto error_put_dl;
> > > > > > > > > +		}
> > > > > > > > > +
> > > > > > > > > +		dl = second_dl;
> > > > > > > > > +		dlb = vsp1_dl_list_get_body0(dl);
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	/* Configure RPF0 for RAW image transfer. */
> > > > > > > > > +	pix_mp = &job->img.fmt.fmt.pix_mp;
> > > > > > > >
> > > > > > > > I think adding a check on V4L2_TYPE_IS_MULTIPLANAR(job->img.fmt.type) or
> > > > > > > > something similar could be added here. When using this interface I once
> > > > > > > > waked into the trap of feeding it a non-planar confirmation which it
> > > > > > > > happy accepted.
> > > > > > > 
> > > > > > > This might be a good idea. We could also switch on (job->img.fmt.type)
> > > > > > > so that we can chose which member of the fmt union to use.
> > > > > > > 
> > > > > > > I recall initially I had a struct v4l2_pix_format_mplane, but the we
> > > > > > > decided to pass the whole struct v4l2_format. Do you remember why ?
> > > > > > 
> > > > > > We discussed it briefly and opted to go for the whole struct to make 
> > > > > > the API future proof IIRC.
> > > > > 
> > > > > I don't recall why. I don't mind much either way, but given that new
> > > > > drivers should always use the multi-planar API, maybe
> > > > > v4l2_pix_format_mplane is all we need ?
> > > > > 
> > > > > > > > These two small issues aside this iteration works perfectly, nice work!
> > > > > > > > My stress test can't provoke any issues and the algorithms I have
> > > > > > > > enabled on the ISP are happy and so are the libcamera pipeline and
> > > > > > > > output images.
> > > > > > > 
> > > > > > > That's very good news, looking forward to developments on the
> > > > > > > libcamera side then!
> > > > > > > 
> > > > > > > > > +	ret = vsp1_vspx_pipeline_configure(vsp1, job->img.mem,
> > > > > > > > > +					   pix_mp->pixelformat,
> > > > > > > > > +					   pix_mp->width, pix_mp->height,
> > > > > > > > > +					   pix_mp->plane_fmt[0].bytesperline,
> > > > > > > > > +					   VSPX_IIF_SINK_PAD_IMG, dl, dlb);
> > > > > > > > > +	if (ret)
> > > > > > > > > +		goto error_put_dl;
> > > > > > > > > +
> > > > > > > > > +	if (second_dl)
> > > > > > > > > +		vsp1_dl_list_add_chain(job->dl, second_dl);
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +
> > > > > > > > > +error_put_dl:
> > > > > > > > > +	if (second_dl)
> > > > > > > > > +		vsp1_dl_list_put(second_dl);
> > > > > > > > > +	vsp1_dl_list_put(job->dl);
> > > > > > > > > +	return ret;
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * vsp1_isp_job_run - Run a buffer transfer job
> > > > > > > > > + * @dev: The VSP1 struct device
> > > > > > > > > + * @job: The job to be run
> > > > > > > > > + *
> > > > > > > > > + * Run the display list contained in the job description provided by the caller.
> > > > > > > > > + * The job must have been prepared with a call to vsp1_isp_job_prepare() and
> > > > > > > > > + * the job's display list shall be valid.
> > > > > > > > > + *
> > > > > > > > > + * Return: %0 on success or a negative error code on failure
> > > > > > > > > + */
> > > > > > > > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job)
> > > > > > > > > +{
> > > > > > > > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > > > > > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > > > > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > > > > > > +	u32 value;
> > > > > > > > > +
> > > > > > > > > +	/* Make sure VSPX is not busy processing a frame. */
> > > > > > > > > +	value = vsp1_read(vsp1, VI6_CMD(0));
> > > > > > > > > +	if (value) {
> > > > > > > > > +		dev_err(vsp1->dev,
> > > > > > > > > +			"%s: Starting of WPF0 already reserved\n", __func__);
> > > > > > > > > +		return -EBUSY;
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	scoped_guard(spinlock_irqsave, &vspx_pipe->lock) {
> > > > > > > > > +		/*
> > > > > > > > > +		 * If a new job is scheduled when the VSPX is stopping, do
> > > > > > > > > +		 * not run it.
> > > > > > > > > +		 */
> > > > > > > > > +		if (!vspx_pipe->enabled)
> > > > > > > > > +			return 0;
> > > > > > > > > +
> > > > > > > > > +		vsp1_dl_list_commit(job->dl, 0);
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	scoped_guard(spinlock_irqsave, &pipe->irqlock) {
> > > > > > > > > +		vsp1_pipeline_run(pipe);
> > > > > > > > > +	}
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_run);
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * vsp1_isp_job_release - Release a non processed transfer job
> > > > > > > > > + * @dev: The VSP1 struct device
> > > > > > > > > + * @job: The job to release
> > > > > > > > > + *
> > > > > > > > > + * Release a job prepared by a call to vsp1_isp_job_prepare() and not yet
> > > > > > > > > + * run. All pending jobs shall be released after streaming has been stopped.
> > > > > > > > > + */
> > > > > > > > > +void vsp1_isp_job_release(struct device *dev,
> > > > > > > > > +			  struct vsp1_isp_job_desc *job)
> > > > > > > > > +{
> > > > > > > > > +	vsp1_dl_list_put(job->dl);
> > > > > > > > > +}
> > > > > > > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_release);
> > > > > > > > > +
> > > > > > > > > +/* -----------------------------------------------------------------------------
> > > > > > > > > + * Initialization and cleanup
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +int vsp1_vspx_init(struct vsp1_device *vsp1)
> > > > > > > > > +{
> > > > > > > > > +	struct vsp1_vspx_pipeline *vspx_pipe;
> > > > > > > > > +	struct vsp1_pipeline *pipe;
> > > > > > > > > +
> > > > > > > > > +	vsp1->vspx = devm_kzalloc(vsp1->dev, sizeof(*vsp1->vspx), GFP_KERNEL);
> > > > > > > > > +	if (!vsp1->vspx)
> > > > > > > > > +		return -ENOMEM;
> > > > > > > > > +
> > > > > > > > > +	vsp1->vspx->vsp1 = vsp1;
> > > > > > > > > +
> > > > > > > > > +	vspx_pipe = &vsp1->vspx->pipe;
> > > > > > > > > +	vspx_pipe->enabled = false;
> > > > > > > > > +
> > > > > > > > > +	pipe = &vspx_pipe->pipe;
> > > > > > > > > +
> > > > > > > > > +	vsp1_pipeline_init(pipe);
> > > > > > > > > +
> > > > > > > > > +	pipe->partitions = 1;
> > > > > > > > > +	pipe->part_table = &vspx_pipe->partition;
> > > > > > > > > +	pipe->interlaced = false;
> > > > > > > > > +	pipe->frame_end = vsp1_vspx_pipeline_frame_end;
> > > > > > > > > +
> > > > > > > > > +	spin_lock_init(&vspx_pipe->lock);
> > > > > > > > > +
> > > > > > > > > +	/*
> > > > > > > > > +	 * Initialize RPF0 as input for VSPX and use it unconditionally for
> > > > > > > > > +	 * now.
> > > > > > > > > +	 */
> > > > > > > > > +	pipe->inputs[0] = vsp1->rpf[0];
> > > > > > > > > +	pipe->inputs[0]->entity.pipe = pipe;
> > > > > > > > > +	pipe->inputs[0]->entity.sink = &vsp1->iif->entity;
> > > > > > > > > +	list_add_tail(&pipe->inputs[0]->entity.list_pipe, &pipe->entities);
> > > > > > > > > +
> > > > > > > > > +	pipe->iif = &vsp1->iif->entity;
> > > > > > > > > +	pipe->iif->pipe = pipe;
> > > > > > > > > +	pipe->iif->sink = &vsp1->wpf[0]->entity;
> > > > > > > > > +	pipe->iif->sink_pad = RWPF_PAD_SINK;
> > > > > > > > > +	list_add_tail(&pipe->iif->list_pipe, &pipe->entities);
> > > > > > > > > +
> > > > > > > > > +	pipe->output = vsp1->wpf[0];
> > > > > > > > > +	pipe->output->entity.pipe = pipe;
> > > > > > > > > +	list_add_tail(&pipe->output->entity.list_pipe, &pipe->entities);
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1)
> > > > > > > > > +{
> > > > > > > > > +}
> > > > > > > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.h b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > > > > > > > new file mode 100644
> > > > > > > > > index 000000000000..f871bf9e7dec
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.h
> > > > > > > > > @@ -0,0 +1,16 @@
> > > > > > > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > > > > > > +/*
> > > > > > > > > + * vsp1_vspx.h  --  R-Car Gen 4 VSPX
> > > > > > > > > + *
> > > > > > > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > > > > > > + * Copyright (C) 2025 Renesas Electronics Corporation
> > > > > > > > > + */
> > > > > > > > > +#ifndef __VSP1_VSPX_H__
> > > > > > > > > +#define __VSP1_VSPX_H__
> > > > > > > > > +
> > > > > > > > > +#include "vsp1.h"
> > > > > > > > > +
> > > > > > > > > +int vsp1_vspx_init(struct vsp1_device *vsp1);
> > > > > > > > > +void vsp1_vspx_cleanup(struct vsp1_device *vsp1);
> > > > > > > > > +
> > > > > > > > > +#endif /* __VSP1_VSPX_H__ */
> > > > > > > > > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > > > > > > > > index 4ea6352fd63f..5148c782580d 100644
> > > > > > > > > --- a/include/media/vsp1.h
> > > > > > > > > +++ b/include/media/vsp1.h
> > > > > > > > > @@ -15,6 +15,10 @@
> > > > > > > > >
> > > > > > > > >  struct device;
> > > > > > > > >
> > > > > > > > > +/* -----------------------------------------------------------------------------
> > > > > > > > > + * VSP1 DU interface
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > >  int vsp1_du_init(struct device *dev);
> > > > > > > > >
> > > > > > > > >  #define VSP1_DU_STATUS_COMPLETE		BIT(0)
> > > > > > > > > @@ -121,4 +125,84 @@ void vsp1_du_atomic_flush(struct device *dev, unsigned int pipe_index,
> > > > > > > > >  int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt);
> > > > > > > > >  void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt);
> > > > > > > > >
> > > > > > > > > +/* -----------------------------------------------------------------------------
> > > > > > > > > + * VSP1 ISP interface
> > > > > > > > > + */
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * struct vsp1_isp_buffer_desc - Describe a buffer allocated by VSPX
> > > > > > > > > + * @size: Byte size of the buffer allocated by VSPX
> > > > > > > > > + * @cpu_addr: CPU-mapped address of a buffer allocated by VSPX
> > > > > > > > > + * @dma_addr: bus address of a buffer allocated by VSPX
> > > > > > > > > + */
> > > > > > > > > +struct vsp1_isp_buffer_desc {
> > > > > > > > > +	size_t size;
> > > > > > > > > +	void *cpu_addr;
> > > > > > > > > +	dma_addr_t dma_addr;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * struct vsp1_isp_job_desc - Describe a VSPX buffer transfer request
> > > > > > > > > + * @config: ConfigDMA buffer descriptor
> > > > > > > > > + * @config.pairs: number of reg-value pairs in the ConfigDMA buffer
> > > > > > > > > + * @config.mem: bus address of the ConfigDMA buffer
> > > > > > > > > + * @img: RAW image buffer descriptor
> > > > > > > > > + * @img.fmt: RAW image format
> > > > > > > > > + * @img.mem: bus address of the RAW image buffer
> > > > > > > > > + * @dl: pointer to the display list populated by the VSPX driver in the
> > > > > > > > > + *      vsp1_isp_job_prepare() function
> > > > > > > > > + *
> > > > > > > > > + * Describe a transfer request for the VSPX to perform on behalf of the ISP.
> > > > > > > > > + * The job descriptor contains an optional ConfigDMA buffer and one RAW image
> > > > > > > > > + * buffer. Set config.pairs to 0 if no ConfigDMA buffer should be transferred.
> > > > > > > > > + *
> > > > > > > > > + * The ISP driver shall pass an instance this type to the vsp1_isp_job_prepare()
> > > > > > > > > + * function that will populate the display list pointer @dl using the @config
> > > > > > > > > + * and @img descriptors. When the job has to be run on the VSPX, the descriptor
> > > > > > > > > + * shall be passed to vsp1_isp_job_run() which consumes the display list.
> > > > > > > > > + *
> > > > > > > > > + * Job descriptors not yet run shall be released with a call to
> > > > > > > > > + * vsp1_isp_job_release() when stopping the streaming in order to properly
> > > > > > > > > + * release the resources acquired by vsp1_isp_job_prepare().
> > > > > > > > > + */
> > > > > > > > > +struct vsp1_dl_list;
> > > > > > > > > +struct vsp1_isp_job_desc {
> > > > > > > > > +	struct {
> > > > > > > > > +		unsigned int pairs;
> > > > > > > > > +		dma_addr_t mem;
> > > > > > > > > +	} config;
> > > > > > > > > +	struct {
> > > > > > > > > +		struct v4l2_format fmt;
> > > > > > > > > +		dma_addr_t mem;
> > > > > > > > > +	} img;
> > > > > > > > > +	struct vsp1_dl_list *dl;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +/**
> > > > > > > > > + * struct vsp1_vspx_frame_end - VSPX frame end callback data
> > > > > > > > > + * @vspx_frame_end: Frame end callback. Called after a transfer job has been
> > > > > > > > > + *		    completed. If the job includes both a ConfigDMA and a
> > > > > > > > > + *		    RAW image, the callback is called after both have been
> > > > > > > > > + *		    transferred
> > > > > > > > > + * @frame_end_data: Frame end callback data, passed to vspx_frame_end
> > > > > > > > > + */
> > > > > > > > > +struct vsp1_vspx_frame_end {
> > > > > > > > > +	void (*vspx_frame_end)(void *data);
> > > > > > > > > +	void *frame_end_data;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > > +int vsp1_isp_init(struct device *dev);
> > > > > > > > > +struct device *vsp1_isp_get_bus_master(struct device *dev);
> > > > > > > > > +int vsp1_isp_alloc_buffer(struct device *dev, size_t size,
> > > > > > > > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > > > > > > > +void vsp1_isp_free_buffer(struct device *dev,
> > > > > > > > > +			  struct vsp1_isp_buffer_desc *buffer_desc);
> > > > > > > > > +int vsp1_isp_start_streaming(struct device *dev,
> > > > > > > > > +			     struct vsp1_vspx_frame_end *frame_end);
> > > > > > > > > +void vsp1_isp_stop_streaming(struct device *dev);
> > > > > > > > > +int vsp1_isp_job_prepare(struct device *dev,
> > > > > > > > > +			 struct vsp1_isp_job_desc *job);
> > > > > > > > > +int vsp1_isp_job_run(struct device *dev, struct vsp1_isp_job_desc *job);
> > > > > > > > > +void vsp1_isp_job_release(struct device *dev,  struct vsp1_isp_job_desc *job);
> > > > > > > > > +
> > > > > > > > >  #endif /* __MEDIA_VSP1_H__ */
> > > > > > > > >
> > > > > > > > > ---
> > > > > > > > > base-commit: 1d41f477d6ff5f5eb0b78b37644ffac0785602c9
> > > > > > > > > change-id: 20250502-b4-vspx-90c815bff6dd
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund


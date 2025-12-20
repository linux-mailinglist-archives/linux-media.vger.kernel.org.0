Return-Path: <linux-media+bounces-49243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AACD33E4
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 17:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E1B9300E02F
	for <lists+linux-media@lfdr.de>; Sat, 20 Dec 2025 16:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EC22C21F9;
	Sat, 20 Dec 2025 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="owAoKP7j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Iwe9E1d6"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139377261C
	for <linux-media@vger.kernel.org>; Sat, 20 Dec 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249337; cv=none; b=NlrYP/AmbgYMDmBDeParX2jsateupHnokxieVdCHOcK5IB+wl9Gd9nXg+Hcq+eocQTp1nCiymFYqvkwmO2dBDU92Vcv17ddVhSy7O0OodHz61r/hlnX0oPZjrel503CX4puuo3lHTMJDXBWji9tBxqFZAI+htfpKcnAZRfzC/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249337; c=relaxed/simple;
	bh=7/cSBAYVV1agSiaDatXuYp7PTBfcouVx1GyrTJRY0Zw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QF9ONHxeIGSioe+AQXmpthpUZ85S2XufHCJpRyKq3st0A/W53BkQWek9ShBkeRVxHofI8kSvb/Z3P2YQOQM3XpR9lSCJVpk8Fez0nWbRRlWYik8BIos/EbcENit/Z0FBryKzhtnjo/miKGAWUuI4xNaGopzEbLUB0rytHS1HmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=owAoKP7j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Iwe9E1d6; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 534A27A00E7;
	Sat, 20 Dec 2025 11:48:50 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-05.internal (MEProxy); Sat, 20 Dec 2025 11:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1766249330; x=1766335730; bh=D9pG8buwRCScj6TxLVgjTBd++nPmrAvF
	XoCTsaZJYTQ=; b=owAoKP7jeOv1+9o6QglVG5teumwehcaAtShqxx/5ZcAagnaM
	tO3w9ijck3Cfdr0lTFRrJe4ADq0zBkUtjIYrQ65i20/ikHbwdEzDLML0V4xROrjO
	hgARhza4WxuY1YuFFiNsdwUFRZrdN0Lr973HWeKmUWBkvmlOF/pic+SwMuc8sJtr
	7eABwA5vqpfag316sJ7inVuTK8QTO0OuJ5kn1CnLGQjCYyLrgtvACV+S1tG917DC
	tTqk/4AXFMC4yTv8g3sFLOQjj84JWr3uPBXlwQv+WTmxY7p4DkV3pGlvyKdGfKBi
	Q5D/DDkNjHOPYwA5oulaeEPr2AOXglHIQ6UFDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766249330; x=
	1766335730; bh=D9pG8buwRCScj6TxLVgjTBd++nPmrAvFXoCTsaZJYTQ=; b=I
	we9E1d6dkmO9chEDuE2zaRQsH/W1Hwtd0xtFizCWV9kl8i2w+o6G2xmD/cn+8jEK
	dWBj8MOYUr8gbrmO+XLSWuT/ynKa0SjI11UGJGYZtxoGhpastH3dPogzOK302Qkv
	n8wDlKV6DJhZfvO1ZkReQsF43I/NSjkVmDrDh+mxeyK6JixeQfSVyOF/3wF5bbHq
	+NQTwvfDYwr/bGNz1HZX2h+woN5/NhFBJuZG0tMmKl9qTyTqZ5M8uXvUr4bHAARE
	0gFC0RnTxMvW1GWoruSoQZnyDetHcum41zcJ/gPOUX4WxHhz4qpyeCPNqf1QUhlU
	NfwV1GMj7LlCQum2CEbZQ==
X-ME-Sender: <xms:cdNGaXAsIKb6lX-EdoSWryZPcorbQapHFKmjC6CR6DHnOumAeejXUg>
    <xme:cdNGaYVfbpas9nEAfTWbvXrLbOzyG-9dIIQPKUPzK8xiC_ILPT8zC4GN25tuoL2WZ
    q6a7_gCvxc3V90v3ysjEjC6McIoXvQn5EfgA8zNcOwW4Duoi_tCzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehudejtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdghrghlthgv
    rhcuhggvrhhnvghrucfuvefjpffgkfffgfftfdcuoegtohhnthgrtghtsehstghhnhifrg
    hlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpeffkedtffefgeevudfghfeihfdtkeel
    gfelgfffudevgeetvedthffhveeigeefkeenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrd
    gvuhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    lhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:cdNGaQ3ch1Dg-9WtkuVtKexx2IP_-2gXH8LuhVvHLrGdmFIcpBiYNA>
    <xmx:cdNGaeyg-XIWMq0uWSmikZpxDODkPa3tiTy7n4p4Yj7RkIWdXO-zuQ>
    <xmx:cdNGaSvnMIXoMmC9jjoflQNQlo0xKkyF1QqivX2ubqX5IV0ixf9_Rg>
    <xmx:cdNGaQx_FO8ayZv5J2xAWJsGYJlfYNYAAagK3dfOm7NkDk_2SgHHnw>
    <xmx:ctNGaQ_93qhPVhyT0_qhSt7rBIhn_aXUmiSCoS3RqIijPkcLleO8g2Nm>
Feedback-ID: i455149b6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 572B21EA0066; Sat, 20 Dec 2025 11:48:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALMo3NTH8JG3
Date: Sat, 20 Dec 2025 18:48:24 +0200
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
To: "kernel test robot" <lkp@intel.com>, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>
Message-Id: <fd4b9d79-635e-4e43-b5ad-5b457216fb77@app.fastmail.com>
In-Reply-To: <202512202343.sZsxwdcf-lkp@intel.com>
References: <20251218-ov2732-driver-v1-1-0ceef92c4016@schnwalter.eu>
 <202512202343.sZsxwdcf-lkp@intel.com>
Subject: Re: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sat, Dec 20, 2025, at 17:57, kernel test robot wrote:
> Hi Walter,
>
> kernel test robot noticed the following build warnings:

FYI: All the warnings have been fixed in the latest version of the patch set.

>
> [auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]
>
> url:    
> https://github.com/intel-lab-lkp/linux/commits/Walter-Werner-SCHNEIDER/media-i2c-Add-ov2732-image-sensor-driver/20251218-062039
> base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
> patch link:    
> https://lore.kernel.org/r/20251218-ov2732-driver-v1-1-0ceef92c4016%40schnwalter.eu
> patch subject: [PATCH 1/2] media: i2c: Add ov2732 image sensor driver
> config: nios2-allmodconfig 
> (https://download.01.org/0day-ci/archive/20251220/202512202343.sZsxwdcf-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20251220/202512202343.sZsxwdcf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202512202343.sZsxwdcf-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/media/i2c/ov2732.c: In function 'ov2732_set_fmt':
>>> drivers/media/i2c/ov2732.c:282:13: warning: variable 'prev_line_len' set but not used [-Wunused-but-set-variable]
>      282 |         u32 prev_line_len;
>          |             ^~~~~~~~~~~~~
>
>
> vim +/prev_line_len +282 drivers/media/i2c/ov2732.c
>
>    274	
>    275	static int ov2732_set_fmt(struct v4l2_subdev *sd,
>    276				  struct v4l2_subdev_state *state,
>    277				  struct v4l2_subdev_format *fmt)
>    278	{
>    279		struct ov2732 *ov2732 = to_ov2732(sd);
>    280		const struct ov2732_mode *mode;
>    281		struct v4l2_mbus_framefmt *format;
>  > 282		u32 prev_line_len;
>    283		s64 vblank_def;
>    284	
>    285		format = v4l2_subdev_state_get_format(state, 0);
>    286		prev_line_len = format->width + ov2732->hblank->val;
>    287	
>    288		mode = v4l2_find_nearest_size(supported_modes,
>    289					      ARRAY_SIZE(supported_modes),
>    290					      width, height,
>    291					      fmt->format.width, fmt->format.height);
>    292	
>    293		fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
>    294		fmt->format.width = mode->width;
>    295		fmt->format.height = mode->height;
>    296		fmt->format.field = V4L2_FIELD_NONE;
>    297	
>    298		*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
>    299	
>    300		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>    301			vblank_def = mode->vts - mode->height;
>    302			__v4l2_ctrl_modify_range(ov2732->vblank,
>    303						 vblank_def,
>    304						 OV2732_VTS_MAX - mode->height,
>    305						 1, vblank_def);
>    306		}
>    307	
>    308		return 0;
>    309	}
>    310	
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


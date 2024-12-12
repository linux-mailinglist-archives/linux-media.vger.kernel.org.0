Return-Path: <linux-media+bounces-23279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F439EE394
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A68E286D1E
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D52620FAA7;
	Thu, 12 Dec 2024 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CPX/mSah";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1esnBfxa"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585B20ADFF;
	Thu, 12 Dec 2024 10:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997636; cv=none; b=RAu+KYLOs3wZ9Su2HXL0mAnunCZ8Z3yfnZaCmx8EZhkd9ClLI8HcqZpOowVJt8pV4yb5tMZL+DYJ7LFLGSWEcKdDV1Lhep0ZnHwOa/mLMKJxPBw6ai6nvnXMVhzvuTaRGGT8UfkqrkB83wBZXW+wCPwgQX3lB2/QfC8pJFwnNLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997636; c=relaxed/simple;
	bh=M9VrbnKEvDAIV9al6fI2QXKaUO6atGmp2JYF9fK7oLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyuO5p7TufVGXTkCq4zTx5qW9FAHJNXaW2Av41J9kdBqxLuf0ebEU/2LSgRVN91Gq4bpPO9oE8fFeSCuaWakrCCI5f35dUGs+ksxkshpxozHdhFsdnC36QybWvGg/LccJOGn+hUnp+4AIdHCqpImaL+KBKIl/o4udBf6/XiuXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CPX/mSah; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1esnBfxa; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DD7DC2540233;
	Thu, 12 Dec 2024 05:00:31 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 12 Dec 2024 05:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733997631;
	 x=1734084031; bh=82ny8HWGyeETqWuhdlFyRrim1Mu/kr+WNMTnCtjuXRs=; b=
	CPX/mSahpgCcOfKBoux0CaLhEds97KXWXAs0MLiRcLSQ+xCMxgz841EAkZQnCpai
	O3y7mvSjDk3zKfRDsQmeYnNEw56fxrdr1ZnV1iTX6keastZ/BFe1e0kTwMLM/1yV
	Pw22VYMubHI1Crh7Tfoyrh3Ej8c4oUnFI1cVrW9xSQ05e4N5Go7zaGQevDZoTTbn
	KTcPB3VAw59/tAZgYMCLYST/n3QBYqxACg+/77Ny3O5XOr1yj/gnt/B8TzKCgnyN
	QpUttPs02KdfopNA58PZTLdoLP4R6cy8mqWFU8m1HfxQW2nbvO/1XRXnzgPqdwvj
	xQcA6rkOtTZsWDXv2AuKxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733997631; x=
	1734084031; bh=82ny8HWGyeETqWuhdlFyRrim1Mu/kr+WNMTnCtjuXRs=; b=1
	esnBfxaXBQ5TySt6ZXoa/PCTBDy8HiIK4MHnhz6tzBamSWu41HUnJdHMcxd+XHJa
	qNvDLK7OXra4668y9veItZaje+GS73G2o4xWTe11bJs+uKW7fejqnhVjzKD/VbCX
	fp+g1d76q0nZXwU6IH8pT2SVjDUpmg33nDoWkYzyvd8U7NFa5/dRThBRbW8OSHFq
	w+fmKG/HNkJ6bjxX6CJfwbt8Iy9T8/YEh7+UvTZGXj6Pcm0+zoQGhF2cZXKQUTEp
	lEfLtwgm6xwlDtqvmW+UiYgZyfejt5c4r8sh1ItaC8XRlF+7fDfWbyffYn8OCXue
	NXfOCx0575hIgjgkTMqkQ==
X-ME-Sender: <xms:P7RaZ6rRwfDKTmEMuD1Gj4I3hRJUeKn09lRWeEr_Lla3Kw4KFgUTnw>
    <xme:P7RaZ4odk6FMp5tTbMZsUld6nZD4BkmUyOl1emV4I6JaZs08PbCpM0xyNst6-gVHR
    hp7kSTf1-2N9DNY9ps>
X-ME-Received: <xmr:P7RaZ_PnxdYmRRoPefim8oOhdGe3P8lgsz6m-y9FOprDpAIK0ffY1Nj0xcPYSN9u_okrVaddEkFV2a8zGlhSU6jbZ7jJML7Wqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddtkecutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:P7RaZ56AjxPOa8DKjMoIx6Hr6WGgiynOjgipJ8agdoK-4TWoV843Tw>
    <xmx:P7RaZ557kxNMOBomRHVpkzBG7TD0USn5wDkfwwt6yhBlViMVBjMgbg>
    <xmx:P7RaZ5gyalFAFXfV6Mdz146QT782-Tr9Hqlz3UPJx-014v8faURUAg>
    <xmx:P7RaZz6safopNW7O32xVIPO2CtzCpzUTrD9fePfJqZRA8c3mFc2rbQ>
    <xmx:P7RaZ2wxaPMni-HEnjdq2hUWuDjmO-h1SoICfDtZO3SoWn688Zaqp4qL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 05:00:30 -0500 (EST)
Date: Thu, 12 Dec 2024 11:00:28 +0100
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
Subject: Re: [PATCH v2 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <20241212100028.GA878403@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
 <Z1qP8uY72kw9uX2E@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1qP8uY72kw9uX2E@kekkonen.localdomain>

Hej Sakari,

Tack för att du tog dig tid och tittade på detta.

On 2024-12-12 07:25:38 +0000, Sakari Ailus wrote:
> > @@ -250,6 +261,36 @@ static int 
> > v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
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
> > +				static const char * const orders[] = {
> > +					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
> > +				};
> > +
> > +				if (array[i] > 5) {
> 
> 
> I'd use:
> 
> 				if (... >= ARRAY_SIZE(order)) {
> 
> I can do the change while applying...

Thanks and pleas do.

-- 
Kind Regards,
Niklas Söderlund


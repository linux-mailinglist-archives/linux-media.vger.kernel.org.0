Return-Path: <linux-media+bounces-60116-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDnUFpNq9GkfBQIAu9opvQ
	(envelope-from <linux-media+bounces-60116-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 10:55:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25104AB215
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 10:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 374713020EF0
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623FE36BCD7;
	Fri,  1 May 2026 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="u+nVpvZW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BxJJO4iR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D897262A;
	Fri,  1 May 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777625737; cv=none; b=HqdxMMK9PHlmO8S53i4oE1jnuCCnNtqjoUXODKzELRuyPoRlVn9OcjFFtMjzr55zMCa37hKTrlgncJnfwXnZtITLuM55vFoSldFD0Sa1I+hk4YZR/F5TJbEi/cNv1c7FyqjSklmG7MgwY+QrLiYrPKuFKiKRZCYuBsAH7L2u9Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777625737; c=relaxed/simple;
	bh=jjgVgfsGRlFt6MByy5weLedELochqtRaxOXUOSGW3Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYPpjg3g++RRNz0Fv2K8d31ze+P+F+5jwkY1K6BWmlvF9LmDAoVELXs6DBKJFvd8VKrdjNJEVaaOZVdNu7KhIEmhRhEIpl8WMW5kjkCyWwTuz8U47O4UUzFOb7FLCcJyTT7MhtRv/qdmcFMuCHzGw2koE7vONgzdaxQ43utktOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=u+nVpvZW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BxJJO4iR; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 533311D000E8;
	Fri,  1 May 2026 04:55:35 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 01 May 2026 04:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777625735;
	 x=1777712135; bh=thfUikj4LR8s6Yxv3vsEOlibMkyomJKBLuShmm3hxxg=; b=
	u+nVpvZWoyNYmBzEFlIHUUPDhAQJoxMr/k6nhFAUXfQv7dTJCeXbFXuR5JspBQQs
	jHwajeJyvvkU2BJSl+0NI+tA7CFQvUknMQ3X62P9649NRzEVNYch/SRgK8X07YCi
	zkJGhJrbALkvTaQi/GG/jLvHsz6j8WtpN8teXzjgE8QdAqdqImeeir2sQUwx/pKM
	tSTNzX79alaVGCSK4yZJK42dSlXO+d9wbuMNdj5DFMqpVSssnXTaSZP/7UuTRd68
	25njutUxorXdHsSwzo3BSdDz1X1c+v6lgrLHAN/pnq26vtvjefo95zo1vA8mkbLv
	LItMwbUqO8Jy85tzFj85eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777625735; x=
	1777712135; bh=thfUikj4LR8s6Yxv3vsEOlibMkyomJKBLuShmm3hxxg=; b=B
	xJJO4iRCrz0Nn9jubF6+8u2TMKEXjy0UouJ2s9C5OYiNMq04KnI4mlQFYT/iQ5KO
	FX3T7mclMmu3ntJn/Ufoai8iE5XKHBd438medczSO+5GyIsHcqhVLFBfR//DpJxb
	KSW5ce262SdYXRxV3wj8VVa6W41yDTX8A2OnzuDIKQNbcGXwxNtBw6i6NquLCOgy
	yvvVHLgCtknpgH3Hh3/mbmfjSrW9f4l5Eaa2jWUKvJzgv6zigN+nd4/GBALpd564
	kJoBJVXYc7as55hIaWUXHwZd6zZBG37XhKT70mpz6gqgS8EzvtcXMJ8p/t2qb/7d
	MYw5CJWM02bh3bMtPQ1uw==
X-ME-Sender: <xms:hmr0aWnBu4uTm7W5fJtDF1PDZ9vSmq5cEHK_Ay_xDuyDG1XWmxAZ2A>
    <xme:hmr0aZuCZoBC4CHm3Evy7BC-y_u80moK4UU-qSldtdBKmCGiYF0nM4fvmSlxtG_bT
    IIwWPd49aBkQC7LffQ1vapg6Ut5kJvVXjnVwS-11YmGU06KoUmaclxy>
X-ME-Received: <xmr:hmr0aRr5q2V3UEuiXcah8Yleimm7YMUKg1i2Uh4ltEV7RiRJJSwmJQzVqeSmU-oIoKu0Snc1giPqaX4Iwu5x-owbzfivDsytIqGZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekleejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepud
    dupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshes
    ghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghn
    vghsrghsrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgt
    hhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:hmr0affWL7kxI2tjQ5rTJmhEhBwKh3m3tDmeiWmL9EtgHwFuMceQUQ>
    <xmx:hmr0aZmqhfpm7cj2l0bkdlydhaJY_oJ3rYKYBW4Wk-FhO_PqzMuKdA>
    <xmx:hmr0aWZW6eex9PRhDGfsqDOMfyP24gLHtaGhRgHQqSdyygu818szRg>
    <xmx:hmr0ae4DjMJpBTetaaqw60d5mO6bs7qpA7UElWaKAJTCMDbDuh2HKg>
    <xmx:h2r0aSUvN0vEqgq_tjpLxe0BRlDX-2YQT1aSnuCPKzO0mX4oOcUIg0jB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 May 2026 04:55:34 -0400 (EDT)
Date: Fri, 1 May 2026 10:55:33 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v7 01/18] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Message-ID: <20260501085533.GE6708@ragnatech.se>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
 <20260410-rppx1-v7-1-43cfc6b44f1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410-rppx1-v7-1-43cfc6b44f1f@ideasonboard.com>
X-Rspamd-Queue-Id: C25104AB215
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,renesas.com,vger.kernel.org,ideasonboard.com,mailbox.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60116-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ragnatech.se:email,ragnatech.se:dkim,ragnatech.se:mid,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Jai,

Thanks for your patch.

On 2026-04-10 14:35:36 +0530, Jai Luthra wrote:
> Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
> parameters and statistics buffers. These formats are used by the driver
> to exchange ISP configuration and 3A statistics with userspace through
> the extensible parameters framework.
> 
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c32a4883521f34fb51eed13c71d76..cd3f4a86e27f22a0108ad2932cba755295af9a98 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
> +	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index eda4492e40dc14a90a230601d8e23b0e13845d34..1f78b5378b3bde31a5ec464a6a609fac94e6d0d6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -889,6 +889,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>  
> +/* Vendor specific - used for Dreamchip RPP-X1 ISP */
> +#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
> +#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund


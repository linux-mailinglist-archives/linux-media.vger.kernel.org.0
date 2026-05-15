Return-Path: <linux-media+bounces-61774-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK8lIj9mB2oF1wIAu9opvQ
	(envelope-from <linux-media+bounces-61774-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:30:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0665563B2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 20:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A231E310B8CE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 18:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC694F7991;
	Fri, 15 May 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DttSiaik";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I7C7GHoW"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D682B2B9A4;
	Fri, 15 May 2026 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869156; cv=none; b=ed0NS6LYWP07iyiPtzdajfeyqrTGzfzIufa9IobJ9FnW75hplfw7pm9VFlUfLHNQkhXY7CI7MMmNpGKbqvNQrOugxW808kXLTB47nWN+xISkp6h2n4aNkKn2kiMYL75I1P2So46G9KU2VWlbevFGTNUTQkMBh3juErxxtuOLgLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869156; c=relaxed/simple;
	bh=JdnR2y6Dcnab3hR/vrzvMXyp+pztGvFP395PwsyTjk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tY3Qnx7uAlRND+ZGdpwSeCxOKuxST0nj5L6m6VuWkAkam18kljurr7pzrUMJcehrSnCn/OQD+oYAeHEGpVb0SAMgaxHkrUZE+ZdU/tccW+LO0YhlYuCMIR/ulcMDjlq1fDreZUKQb/xNN6Uceps8/iTb07afQn+/p52biwYkgFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DttSiaik; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I7C7GHoW; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 280A4EC01B3;
	Fri, 15 May 2026 14:19:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 15 May 2026 14:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778869154;
	 x=1778955554; bh=Jls5UAEGPnkpg8auCxeJZxddID6wsoki0OiKRoRGciM=; b=
	DttSiaikV1e8HDJ8Nq0Be2NZZwj2hcbEVH/vbqEey0LOwuzv7V8oG8gALdS7TcIi
	1F6olb4LVvdJ3LSQfOIcDj//bGJdPcAbCKZZuw5OIwndMggsW47y0Uz45b7xKoIU
	8uU/pq7Mo3cVJWbOXuzA3qQQWUuodRcyMIul1r7Xe5f80uEIbi+C6ECt64fEb7NB
	BGJC8xCklouHEcVp+4NFMn6Nq6bg9Odkake2BXvQdvJx/CxK+di5wixHqrVHYf4q
	fSo7b3ig1yYpjWSWzIzcM+a+9XbEgHKjrrAoxu2v7vc45vO5rpbE/vhHHP6ffWkE
	owXCPoxCoYODFw718Rpklg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778869154; x=
	1778955554; bh=Jls5UAEGPnkpg8auCxeJZxddID6wsoki0OiKRoRGciM=; b=I
	7C7GHoWTlufdHZShW6JENec7DXm+czd6LqhnxBiee/2JnTwHG2/fuxmegO3caBx/
	qd3BaItFXM5bzL5M1ioGwJYaXhaRWZNcoAPe5E8iOYTjwWKmyqxOPYugvjcAoMs2
	o1g07SPboRbE3Cc/15VgSEznTFAd6PRrEFqNewYtoCY5nAWL8m6msmgs3U1EamWP
	Wtwfjf0A3JmGA2ceV7j6yK2mytK67YHnARtPyEI7Q3Iw737cinJl7YsRC02Oji0m
	OMp+Ua62Sk9FVGWInoVmPOAsztv9fSTgCtr4RB8FejHdHXyU/0eL2p7hAJT4kQP8
	RP0JwqXpgXyehI9Bq3GwA==
X-ME-Sender: <xms:oWMHaqLLwFgFVstEoqMMJ_12Bi6ov9gVIUVFmof9YJfCKbHhos5y7A>
    <xme:oWMHaqQRYWHhZDMS7XtYg-tQXYoYB0elTZVMzMK_Y6FsaU7aGWBtP-zs60XkBEDnM
    5B6RlDBlr0sA0E5iNZZ6uFiyyrvEcjp1RTwI4JiYY4BmPxMPYg9mw>
X-ME-Received: <xmr:oWMHaqPo9vAhbXirNstNB1cWb9om6Y-9grA8INxiity1ise8q3ro8WB7xFzrmYh3XMvYmD7JMpyyIXJHlQhipnVkxB5wy38RCVeM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeduuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheet
    heekkeegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtgho
    mhdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gurghnrdhstggrlhhlhiesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohep
    khgvkhgvrdhlihesrghmlhhoghhitgdrtghomhdprhgtphhtthhopegrnhhtohhinhgvrd
    gsohhuhigvrhesnhigphdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgesihgu
    vggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheprhhisggrlhgurgestghhrhhomh
    hiuhhmrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggv
    rghsohhnsghorghrugdrtghomhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslh
    hinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:oWMHavX90ZCCEVoykSZ8ckzSgk59o-pvQGoK50V2t3J9fWeCKFMrKw>
    <xmx:oWMHathgX2T5Evdkt6r6i_1VBC0uE9zbJs-8n372T3Gv2Fohz9WVew>
    <xmx:oWMHaojrK2qq4eS9oSUJNmQU0a5PI_R_aDklXtiofUHiHD0KsAp_Zg>
    <xmx:oWMHarGDmVTUarDc2_3iz1gbLk4L0MI7a4qMgdbffnX9mbupaE-XcQ>
    <xmx:omMHasmd8w5Bx5FW-SDybX0G0Lc-Zd9kpON2MJOT738hUVtbIUZbSm8p>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 May 2026 14:19:13 -0400 (EDT)
Date: Fri, 15 May 2026 20:19:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Antoine Bouyer <antoine.bouyer@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <20260515181912.GR332351@ragnatech.se>
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-2-e16f326b8dad@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-extensible-stats-v1-2-e16f326b8dad@ideasonboard.com>
X-Rspamd-Queue-Id: DF0665563B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61774-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,nxp.com:email]
X-Rspamd-Action: no action

Hello Antoine and Jacopo,

Thanks for your work.

On 2026-05-05 16:12:13 +0200, Jacopo Mondi wrote:
> From: Antoine Bouyer <antoine.bouyer@nxp.com>
> 
> Rework the userspace-api documentation of V4L2 ISP to support
> statistics.
> 
> Update all occurences of 'v4l2_isp_param' types to match the uAPI
> changes and add a section to document the statistics serialization
> format.
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> [Update on uAPI changes]
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/userspace-api/media/v4l/v4l2-isp.rst | 45 ++++++++++++++++------
>  1 file changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> index facf6dba1ca7..8a3f05b5e85f 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> @@ -18,22 +18,22 @@ single C structure that contains a header, followed by a binary buffer where
>  userspace programs a variable number of ISP configuration data block, one for
>  each supported ISP feature.
>  
> -The :c:type:`v4l2_isp_params_buffer` structure defines the buffer header which
> -is followed by a binary buffer of ISP configuration data. Userspace shall
> -correctly populate the buffer header with the generic parameters format version
> -and with the size (in bytes) of the binary data buffer where it will store the
> -ISP blocks configuration.
> -
> -Each *ISP configuration block* is preceded by an header implemented by the
> -:c:type:`v4l2_isp_params_block_header` structure, followed by the configuration
> +The :c:type:`v4l2_isp_buffer` structure defines the buffer header which is
> +followed by a binary buffer of ISP configuration data. Userspace shall correctly
> +populate the buffer header with the serialization format version and with the
> +size (in bytes) of the binary data buffer where it will store the ISP blocks
> +configuration.
> +
> +Each *ISP configuration block* is preceded by a header implemented by the
> +:c:type:`v4l2_isp_block_header` structure, followed by the configuration
>  parameters for that specific block, defined by the ISP driver specific data
>  types.
>  
>  Userspace applications are responsible for correctly populating each block's
>  header fields (type, flags and size) and the block-specific parameters.
>  
> -ISP block enabling, disabling and configuration
> ------------------------------------------------
> +ISP parameters block enabling, disabling and configuration
> +----------------------------------------------------------
>  
>  When userspace wants to configure and enable an ISP block it shall fully
>  populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> @@ -59,7 +59,30 @@ definition without invalidating the existing ones.
>  ISP statistics
>  ==============
>  
> -Support for generic statistics format is not yet implemented in Video4Linux2.
> +The generic ISP statistics format is identical to the generic ISP configuration
> +parameters format. It is realized by defining a C structure that contains a
> +header, followed by binary buffer where the ISP driver copies a variable number
> +of ISP statistics blocks.
> +
> +Extensible statistics buffers have :c:type:`v4l2_isp_buffer` header followed by
> +a binary buffer of ISP statistics data. ISP drivers populate the buffer header
> +with the serialization format version and with the size (in bytes) of the binary
> +data buffer where ISP statistics data are serialized. Applications shall
> +validate that the serialization format version matches the expected one and that
> +the buffer size doesn't exceed the maximum size for a statistics buffer as
> +declared by the driver's uAPI header.
> +
> +Each *ISP statistics block* is preceded by a header implemented by the
> +:c:type:`v4l2_isp_block_header` structure, followed by the statistics data for
> +that specific block. The driver might optionally report platform-specific flags
> +associated with each statistics block.
> +
> +Applications inspect the statistics block type as reported in the header and
> +validates the reported size matches the block's expected size before accessing
> +the ISP statistics data.
> +
> +Extension to the statistics format can be implemented by adding new blocks
> +definition without invalidating the existing ones.
>  
>  V4L2 ISP uAPI data types
>  ========================
> 
> -- 
> 2.53.0
> 

-- 
Kind Regards,
Niklas Söderlund


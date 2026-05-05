Return-Path: <linux-media+bounces-60335-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IrgC1uP+WlN9wIAu9opvQ
	(envelope-from <linux-media+bounces-60335-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:34:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C584C73B9
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35605301CFB0
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A618C3C1966;
	Tue,  5 May 2026 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLPOPueQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F3282F1F
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962831; cv=none; b=JKlhh5HLCxo7b7NRpO4f3cezbKYa6WrypK4rjZRCKXTCSadaj8euLfwQ7mOQTWd7avcNltSLY529DCTiGR55li39A6OY1SUOf0/q4C5lChHSL+2PorF1SUZBGCBDwIWi8f9DfPLL/5/jLr+GtkIks2T6FI4fpDOdcz6BwaxKWQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962831; c=relaxed/simple;
	bh=QPV+RLpgGZs7TEEIW8+YoXp/qWEO+LNijZEAnqFVbBc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eMmqvFpnA5u5iWWGVphGoLoxM1PUvnKAdF+7227b04f8GctbqrqNzvewHhcTS9s+YVnLc03m2hzTQ8FoYi04iv7BR2gFTJ6YLo9MYdfBx0q9jkv4/+9mOyxdwvqr/OS9UVHFXOtuHs3r7j5Mkirn4ts4Kq0liAAOta9CFjdYYho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLPOPueQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D95C2BCB4;
	Tue,  5 May 2026 06:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777962830;
	bh=QPV+RLpgGZs7TEEIW8+YoXp/qWEO+LNijZEAnqFVbBc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=JLPOPueQ4+86OSLfLkT/phB1T4R13otX/TIhH1MtBcj54oytiCC7liyMB7H37SLWg
	 93Re9a4jrREQpCWQ0GMDSeZPJE2Zw4BvIhbxuQxR/IpJR6XssaNObaHw8S3p1FTpSG
	 Q0G+T7pdeb6To+fgSMgS84GQopK0q7aRn4F0ySsJBmwZ43pImhyw/E//rSOy8bKAUj
	 EXFI4vm4twuF9znRHnasvknYhrv2UdQ1SRA4jfY/YyWWyzjlpNnQRRw93X8vrs5ypt
	 gHV6qJGTYE4P3nAv34w7I53luESsn/hbDXUfWu1Io0g0nz78O+SJTnbDnqfTQf2zdA
	 PNVuJ0kelGOsA==
Message-ID: <a5520b2c-b290-481d-a02c-36a2272bb41f@kernel.org>
Date: Tue, 5 May 2026 08:33:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 20/29] media: uapi: Bump the STREAMS bit a little
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Prabhakar
 <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-21-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260408153939.969381-21-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 84C584C73B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60335-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]

On 08/04/2026 17:39, Sakari Ailus wrote:
> Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
> libcamera with streams that has moved forward from the original libcamera
> implementation. The bit can presumably be taken into use but only after
> the other free bits.

The commit log must explain why this is safe to do. In this case because
v4l2_subdev_enable_streams_api is currently always false, which means
that this capability is always removed.

It's also not clear to me why this is important for libcamera. Since
the streams API is still disabled, any libcamera code depending on it
should be purely for testing, right?

Regardless, this uAPI change needs to be documented a lot better.

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/v4l2-subdev.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 2347e266cf75..6160c3e21436 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
>  /* The v4l2 sub-device video device node is registered in read-only mode. */
>  #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
>  
> +/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
> +/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
> +
>  /* The v4l2 sub-device supports routing and multiplexed streams. */
> -#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
> +#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
>  
>  /*
>   * Is the route active? An active route will start when streaming is enabled



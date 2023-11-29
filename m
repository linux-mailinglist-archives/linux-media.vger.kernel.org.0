Return-Path: <linux-media+bounces-1353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73207FD4D0
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 12:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6F7B2189E
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F681BDE1;
	Wed, 29 Nov 2023 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="M9e7ZGuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0291210DD;
	Wed, 29 Nov 2023 03:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701255696; x=1732791696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d/gFkPNfYqq0ZhlHY80Xn8zE1vltx+Kn8TG5aelRTQg=;
  b=M9e7ZGuJQj9sH5oKDyMkLIJ0i9RugmvTjpNT/ozhl3zn0kQYO3rn9Xx4
   jxMmAUS3tCxS7vSR+gEeWAQn/ZBAZ4iXyJdCfOP+L5PJ56k+Z84ldXR8O
   s65gSdTPgz4i7Wav3Bl9vpwBdvJKdlxiHZXWsLsiqir/Xp+OnTD0SDJHh
   2silq/6TjBm6Za7xXb2zW1G8ULmWk2617VI+qpQ36PYlBjIqdinWyCOb3
   Pv1LmpSVMtFOSosjfWwIweh7bVd0xuugiLsguAKVPftQJ1cxFYWKb20bl
   wUjy84LES+ixQR+sIZGcKs6RJiXiEOntZMhHv4BAyWOn/Mw4kE1rDcbWZ
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,235,1695679200"; 
   d="scan'208";a="34235422"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Nov 2023 12:01:34 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3D34B280075;
	Wed, 29 Nov 2023 12:01:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, Paul Elder <paul.elder@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, Paul Elder <paul.elder@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, "moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: rkisp1: debug: Count completed frame interrupts
Date: Wed, 29 Nov 2023 12:01:34 +0100
Message-ID: <12649569.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231129092956.250129-4-paul.elder@ideasonboard.com>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com> <20231129092956.250129-4-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Paul,

thanks for the patch.

Am Mittwoch, 29. November 2023, 10:29:56 CET schrieb Paul Elder:
> Add a counter to debugfs to count the number of frame-end interrupts.

This looks good to me.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
>  drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c  | 2 ++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 2 ++
>  3 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h index
> 1e7cea1bea5e..be69173958a4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -417,6 +417,7 @@ struct rkisp1_debug {
>  	unsigned long stats_error;
>  	unsigned long stop_timeout[2];
>  	unsigned long frame_drop[2];
> +	unsigned long complete_frames;
>  };
>=20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c index
> f66b9754472e..1b1edfd3ab6c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -232,6 +232,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			     &debug->frame_drop[RKISP1_MAINPATH]);
>  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
>  			     &debug->frame_drop[RKISP1_SELFPATH]);
> +	debugfs_create_ulong("complete_frames", 0444, debug->debugfs_dir,
> +			     &debug->complete_frames);
>  	debugfs_create_file("input_status", 0444, debug->debugfs_dir,=20
rkisp1,
>  			    &rkisp1_debug_input_status_fops);
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c index
> 64a956b9f2d0..06cdb4edf19c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -991,6 +991,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>  	if (status & RKISP1_CIF_ISP_FRAME) {
>  		u32 isp_ris;
>=20
> +		rkisp1->debug.complete_frames++;
> +
>  		/* New frame from the sensor received */
>  		isp_ris =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
>  		if (isp_ris & RKISP1_STATS_MEAS_MASK)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/




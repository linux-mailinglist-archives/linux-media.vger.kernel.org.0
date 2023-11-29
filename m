Return-Path: <linux-media+bounces-1384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936087FE0C2
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 21:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C761C20EA8
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 20:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FCF5EE88;
	Wed, 29 Nov 2023 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VL05jxid"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F80FD69;
	Wed, 29 Nov 2023 12:06:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F8556F0;
	Wed, 29 Nov 2023 21:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701288375;
	bh=pr+DI5rX3G04hdirVZl6BkJQ1CLmT65yZtHt6DXjLiQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VL05jxidfay1sFOSzYKbcy2FZEW1U8kscMsQ8whITFDm3SfVNs5cKFR7evcrNSPhR
	 ID63lSLDWx5GiIxP4UAeBXndZgTHzGth7c2fg1EKtEd+zDlMwV1zJWVD542Bw+TAXk
	 I1wr5C5rutATEIoNtXji7z4ziw6/lhFH/+D1DkT4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231129092956.250129-4-paul.elder@ideasonboard.com>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com> <20231129092956.250129-4-paul.elder@ideasonboard.com>
Subject: Re: [PATCH 3/3] media: rkisp1: debug: Count completed frame interrupts
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, Paul Elder <paul.elder@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Wed, 29 Nov 2023 20:06:48 +0000
Message-ID: <170128840893.3048548.12921821466589985052@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Paul Elder (2023-11-29 09:29:56)
> Add a counter to debugfs to count the number of frame-end interrupts.
>=20

And I alway like having counters for debug ... so I like this.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
>  drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c  | 2 ++
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 2 ++
>  3 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 1e7cea1bea5e..be69173958a4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -417,6 +417,7 @@ struct rkisp1_debug {
>         unsigned long stats_error;
>         unsigned long stop_timeout[2];
>         unsigned long frame_drop[2];
> +       unsigned long complete_frames;
>  };
> =20
>  /*
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index f66b9754472e..1b1edfd3ab6c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -232,6 +232,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>                              &debug->frame_drop[RKISP1_MAINPATH]);
>         debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
>                              &debug->frame_drop[RKISP1_SELFPATH]);
> +       debugfs_create_ulong("complete_frames", 0444, debug->debugfs_dir,
> +                            &debug->complete_frames);
>         debugfs_create_file("input_status", 0444, debug->debugfs_dir, rki=
sp1,
>                             &rkisp1_debug_input_status_fops);
> =20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 64a956b9f2d0..06cdb4edf19c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -991,6 +991,8 @@ irqreturn_t rkisp1_isp_isr(int irq, void *ctx)
>         if (status & RKISP1_CIF_ISP_FRAME) {
>                 u32 isp_ris;
> =20
> +               rkisp1->debug.complete_frames++;
> +
>                 /* New frame from the sensor received */
>                 isp_ris =3D rkisp1_read(rkisp1, RKISP1_CIF_ISP_RIS);
>                 if (isp_ris & RKISP1_STATS_MEAS_MASK)
> --=20
> 2.39.2
>


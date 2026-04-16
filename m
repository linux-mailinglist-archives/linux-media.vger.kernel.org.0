Return-Path: <linux-media+bounces-58945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDuxLkkh4WnMpQAAu9opvQ
	(envelope-from <linux-media+bounces-58945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:50:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECB4134CA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 19:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC5CD300462F
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 17:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86FDD22B584;
	Thu, 16 Apr 2026 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EF7LhrJy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06F209F43
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 17:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361785; cv=pass; b=Hes1wRfSHxuOPKcWEmoaBWahlRprrgog0nM1G4LQP/IuC55Zs1G88Ja7tQ7z2+Q04kHzzqpiCWVg1m47LMaInETuL7tqpR5jAirnedBwISKc3X67DvXljckWStOtYIT9zxw17Cdfg7Nu5em2IzRrbp7XMl0shSsaekoDp+p42/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361785; c=relaxed/simple;
	bh=N2l9XO6zlswJKBM2ahNi6lAm8gu1vKRNmeiU1ZIic4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngALNNalbzWhdnk1XCrCgP0u50SYSmEe/cn1xnyq6jH28Xs6U3mHsExPvHUI1ze2J/Gebyj9i06WrsMk3FnP4H1oNXyibuDkAIdYWSB46ufSAegpG4/g8zXgy1xsUxbgz1PeL+hc/KTn4yNtJubmPGDS+egzMDVgAMlcrxaM6PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EF7LhrJy; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488afb0427eso97635965e9.1
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 10:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776361781; cv=none;
        d=google.com; s=arc-20240605;
        b=a18d0RX+1JnsgWbK7ZNG2w2Lj6CC95hBYSbmC16bYUT0uGK2/SQ452F5EBjUv21N/f
         GfnjTo7HcVLX9u9vdxaAugt2kfhAEB/hNmLkgC3HRx4c9at7wOvck3kNpcZxpKYx5y3v
         /IALwrwid+0G+e4dRHEdqk4L74idwfc/xrS8Z5CtWdqKNwZFsvWb8tEh78Ult4FopnCK
         8w8sOZvdQLMUOzUjgMBQdjsqW9jPamXzg2gpPueXyFoN1EjAViAHBSxGWE/f/NmEoXCF
         aBUj0N4wYHPwTKwJ0IWMpgHeqQ3jxAjIC+e09T/GIMsYSGTNI7eMEamT/LWSVHGHual+
         6Llw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        fh=0NFDm7EQRRtVMVCgYG4YBmHKbhfykp6nE94rkJ9V2y0=;
        b=ec4LSZuYAZjGTyskstDS0gPwaNG2By/ifC9OY1AsXWpKE+berAN8IRIraHQ4urKkan
         TwCBJyN3FUphjaH2Sj3nCDc7Q+t4Lwf9LRFOoWvY4b7LEqsDwB/KRjKx+pGoQlfqJWHj
         6Z1MIk54HRmQmNErmiNVyccPNl/ZbuQamI7AWezW+3SYVHGkYqfpY9fWq0nkEYY5yD8Q
         ht4VIYNfl4/utaU+OXCSJURBWZnXJNTwMIWwcuShdhTJk1p+o0RCplXTiWoRgSEvR5+Z
         1pKv/eVwsuEFVtMaWEO1bJT/QQLfpqUVOKBrx42SgRvyNnLOuERuGDKCCnEOiGmSks0b
         1UzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776361781; x=1776966581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        b=EF7LhrJylm6XtH0+m7yUBrVN6a97aqgJFAfEsML7qg7FH3ueI230VEAy7oHyvLL7Cu
         VnmhGhbkTbACTrWacnQjJrg0vkuFkYVtxNc7wgZT+pssRVdAbxfJPmlSiPsor0lZgvI4
         mbAFBKDPLEbsRXPYQ0O1XR/8YjjugXBDfk/pUaacvXOOYS8r9YJmG6nvMlIxbywPjCq8
         oZrZNFXquDesx0RiAcjpxAsJXAbf1wP2yEpwMnm7y6MbO/kU3MazQqX9Sor2cI0S0QXn
         PtFVtvwS9hi1Q18pTkJsQRhqDOO3yt8zic0YsuQ7sD8ZKSkhAjMHxJtqQ5pFC8RycpbT
         6weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776361781; x=1776966581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6f0VpVSSDBwnxPWFKiYOeKieOB6Xa+l1ar0OTa34p8=;
        b=fXnFY8aEjK6xHxqUUbSKlopESUHGH3dCTJXChMFuw4+h/VLDSsh2hOvB9zP/GiF8us
         JtewOu4NpdbmjjpAwYppH9FiJniL+5U24nSaEAOVuxpCmI5HLUWYqqIK2T65ifj5QuSn
         OT1VkSa2U8oFGZjJuwdNfUGvfIEaWkgxOrfuKTjR3hdLsTFcWFgadrDXpMSVZn6RDBiL
         tpezDkuBnG42zm2Y/Ae4PTiVjezbVza30lZr2+fFY58suslHMGMz/3ZxSmgz0uNerwpl
         yDwzKXc948bIOqrNm1IbvykZMSH3D8ZdKNrVbOXpC8hMFW/v/vrMOyjZDXisZOc5CXam
         eigQ==
X-Gm-Message-State: AOJu0YzHuPsKUV+DqIVe+uqweJZEW2tHgaUq1A5s70tVTSrbU0msng32
	2z4A9+eNd+hWDpSjvWVfarAzFeTlnMCaXO6fv3H4B8w1z6RZUvzFupzxCnEKhqDTNJtkCGhFbXb
	9QgnhIek5MFzkXN5scaDNUCtmxSuCPuE=
X-Gm-Gg: AeBDiet9ioNPDFK9bdA0AYN1sWpGS8LDhi3Ztm8gKoZ9jTLL1gH3zs6zRNADNr5E0Tn
	TZAWkrcQ1mkZzoZGBK0BM0A5s3a0uaCRg4DNEqaPoP0M7uhZb2tQINGCbfwoOp0vDLFUwo/SGn+
	epSolRvrtLxGisKxNGu4YGmC0Olr+YIHWxRpSU10bD83gZ4pcQyPL1UOVxUSZx6bKkYobEbKXhY
	lMTBn1qpaCBugZq6I9YHFzwqFclo9c91Gwzgbm982eB3tp7pbA7jnHPZiJRcH6TiwGRyNx+kuGE
	KGQI9z4Hgfp+mbdndqYHkOqRvh8i/lVVK/3lConqEWgsH2IRbNZWC3BhGLA6cw9j7jqXOg3bqpn
	0MP6ZiEPPp4Cft3yOfZL7u2ZgXX+CI76gYuGg
X-Received: by 2002:a05:600c:8218:b0:488:a14d:3d81 with SMTP id
 5b1f17b1804b1-488d67c7034mr450974285e9.2.1776361780621; Thu, 16 Apr 2026
 10:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Apr 2026 18:49:14 +0100
X-Gm-Features: AQROBzCxpsL5kTxUeNnQCxkGGBdAiuMuBdZQoMRS7IDiOjMBaTiRtIu9DdGKUbM
Message-ID: <CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com>
Subject: Re: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58945-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ragnatech.se:email,ideasonboard.com:url,ideasonboard.com:email]
X-Rspamd-Queue-Id: ADECB4134CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thank you for the patch.

On Wed, Mar 18, 2026 at 11:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The format width and height is never propagated to the BRX source pad,
> leaving its initial configuration invalid. Propagate the whole format
> from the first sink pad to the source pad instead of only propagating
> the media bus code. This fixes compliance with the subdev format
> propagation rules.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_brx.c
> index dd651cef93e4..911359faa600 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subde=
v,
>                 compose->height =3D format->height;
>         }
>
> -       /* Propagate the format code to all pads. */
> +       /*
> +        * Propagate the format code to all pads, and the whole format to=
 the
> +        * source pad.
> +        */
>         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
>                 unsigned int i;
>
> -               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
> +               for (i =3D 0; i < brx->entity.source_pad; ++i) {
>                         format =3D v4l2_subdev_state_get_format(state, i)=
;
>                         format->code =3D fmt->format.code;
>                 }
> +
> +               format =3D v4l2_subdev_state_get_format(state, i);
> +               *format =3D fmt->format;
When running kms-test-plane-position.py (from [0]) on RZ/V2H EVK, Im
getting vblank timeouts as seen below:

[   51.295849] ------------[ cut here ]------------
[   51.300538] [CRTC:45:crtc-0] vblank wait timed out
[   51.305514] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1921 at
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c
[drm_kms_helper], CPU#1: python3/413
[   51.319577] Modules linked in: sha256 cfg80211 bluetooth
ecdh_generic kpp ecc rfkill snd_soc_hdmi_codec snd_soc_core
snd_pcm_dmaengine snd_pcm snd_timer snd soundcore rzg2l_du_drm
spi_rpc_if drm_client_lib vsp1 rzg2l_cru videobuf2_vmalloc
drm_dma_helper videobuf2_dma_contig videobuf2_memops rcar_fcp
rzg2l_csi2 videobuf2_v4l2 renesas_usbhs rzg2l_mipi_dsi ov5645
videobuf2_common adv7511 v4l2_cci phy_rzg3e_usb3 panfrost v4l2_fwnode
reset_rzv2h_usb2phy v4l2_async drm_display_helper drm_shmem_helper
videodev rtc_isl1208 cec gpu_sched rtc_renesas_rtca3 mc
display_connector drm_kms_helper renesas_rpc_if drm fuse backlight
[   51.374382] CPU: 1 UID: 0 PID: 413 Comm: python3 Not tainted
7.0.0-next-20260415-00258-gf9ef0131676a-dirty #340 PREEMPT
[   51.385280] Hardware name: Renesas RZ/V2H EVK Board based on
r9a09g057h44 (DT)
[   51.392521] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   51.399505] pc :
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
[   51.407624] lr :
drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
[   51.415739] sp : ffff800083dbb9d0
[   51.419067] x29: ffff800083dbba00 x28: 000000000000000a x27: 00000000000=
005c5
[   51.426237] x26: 0000000000000000 x25: ffff0000ca4c0888 x24: 00000000000=
00001
[   51.433406] x23: 0000000000000001 x22: 0000000000000000 x21: 00000000000=
00000
[   51.440575] x20: ffff0000c7cb4980 x19: ffff0000c325e618 x18: 00000000000=
0000a
[   51.447743] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000=
00000
[   51.454911] x14: 0000000000000000 x13: ffff8000818c3ca0 x12: 00000000000=
001fc
[   51.462079] x11: ffff0000c0fcd360 x10: ffff8000832bd200 x9 : ffff8000818=
c3ca0
[   51.469248] x8 : 3fffffffffffefff x7 : ffff80008191bca0 x6 : 00000000000=
00000
[   51.476416] x5 : ffff0003fdf93088 x4 : 0000000000000001 x3 : 00000000000=
00000
[   51.483584] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000cc1=
9af40
[   51.490753] Call trace:
[   51.493212]  drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c
[drm_kms_helper] (P)
[   51.501336]  drm_atomic_helper_commit_tail_rpm+0xbc/0xd8 [drm_kms_helper=
]
[   51.508237]  commit_tail+0xa4/0x1a4 [drm_kms_helper]
[   51.513313]  drm_atomic_helper_commit+0x178/0x194 [drm_kms_helper]
[   51.519605]  drm_atomic_commit+0x8c/0xd0 [drm]
[   51.524307]  drm_mode_atomic_ioctl+0xac8/0xe00 [drm]
[   51.529523]  drm_ioctl_kernel+0xc0/0x128 [drm]
[   51.534217]  drm_ioctl+0x354/0x4c0 [drm]
[   51.538389]  __arm64_sys_ioctl+0xa4/0xf4
[   51.542342]  invoke_syscall.constprop.0+0x40/0x108
[   51.547161]  el0_svc_common.constprop.0+0xb8/0xd8
[   51.551892]  do_el0_svc+0x1c/0x28
[   51.555229]  el0_svc+0x38/0x140
[   51.558397]  el0t_64_sync_handler+0xa0/0xe4
[   51.562603]  el0t_64_sync+0x198/0x19c
[   51.566286] ---[ end trace 0000000000000000 ]---
[   64.735886] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
[   64.742630] rzg2l-du 16460000.display: [drm] *ERROR*
[CRTC:45:crtc-0] commit wait timed out
[   74.975884] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
[   74.982639] rzg2l-du 16460000.display: [drm] *ERROR*
[PLANE:40:plane-1] commit wait timed out
[   75.999845] ------------[ cut here ]------------

Reverting this patch fixes the issue, but compliance might fail. On
V2H media device is not registered for VSP.

[0] https://git.ideasonboard.com/renesas/kms-tests/src/branch/master/tests

Cheers,
Prabhakar


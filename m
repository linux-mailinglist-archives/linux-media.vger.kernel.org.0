Return-Path: <linux-media+bounces-59184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMm2EoO95mlG0QEAu9opvQ
	(envelope-from <linux-media+bounces-59184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 01:57:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A0435028
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 01:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3BE830146BA
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 23:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B4C3D1CA5;
	Mon, 20 Apr 2026 23:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Eue2LcnH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491DC393DE6;
	Mon, 20 Apr 2026 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776729468; cv=none; b=ZlnAe+h8kWPDhpBcFugGISqe44Cc8+VHNUDEA9L91D1X0i6AMpneM2bVdzK1GcNWmSQkPtdxQhY8aL3mgIRQ/CZlzA3y7S5g38q7dV/ZjXQYLeczFPWcX22fnL3+hVRJxFZ3lOlxcgHleJBXL2BeQ9nwVkwGrAAFV/WpzVHITDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776729468; c=relaxed/simple;
	bh=W4P40brhDWvlFoMSRZqCEHOe8ip3yCTHhgXisxd8Q2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeRvcH8BsZj9vBHQDxTqI/gQFOsQXWOusmNvIcU8qltrfh/ruH17BqxwGB9+I/NnAsyaRQYo7xkZH8DQwLiJT4l4VTXjOa4QN2kNCPgBNnvIG8rnW/iYaZJOnuGPvX3m6kbhJ53JrKSfbqEkuEBKdUOZBFaNZSdiBC+/+e5bTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Eue2LcnH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D3DAA6DC;
	Tue, 21 Apr 2026 01:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776729367;
	bh=W4P40brhDWvlFoMSRZqCEHOe8ip3yCTHhgXisxd8Q2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eue2LcnH1fDQg5b6lqnP93Md8CioNxXk3gG80Twr00xJxjgzjIWDAOiU7CK1rQl8u
	 re5BDa8yh7IryYSxodheNoLiQKnJekozNft6wlS8g8tZ2hf+SoQCL5noMmOdxrDSBP
	 K4KSVDQkyzr468r+qaloYUQeglAobcVVNwl4+BjM=
Date: Tue, 21 Apr 2026 02:57:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format
 propagation
Message-ID: <20260420235742.GA2315844@killaraus.ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
 <CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com>
 <20260416211139.GC1824072@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416211139.GC1824072@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59184-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 073A0435028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 12:11:41AM +0300, Laurent Pinchart wrote:
> On Thu, Apr 16, 2026 at 06:49:14PM +0100, Lad, Prabhakar wrote:
> > On Wed, Mar 18, 2026 at 11:59 PM Laurent Pinchart wrote:
> > >
> > > The format width and height is never propagated to the BRX source pad,
> > > leaving its initial configuration invalid. Propagate the whole format
> > > from the first sink pad to the source pad instead of only propagating
> > > the media bus code. This fixes compliance with the subdev format
> > > propagation rules.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > index dd651cef93e4..911359faa600 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> > > @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
> > >                 compose->height = format->height;
> > >         }
> > >
> > > -       /* Propagate the format code to all pads. */
> > > +       /*
> > > +        * Propagate the format code to all pads, and the whole format to the
> > > +        * source pad.
> > > +        */
> > >         if (fmt->pad == BRX_PAD_SINK(0)) {
> > >                 unsigned int i;
> > >
> > > -               for (i = 0; i <= brx->entity.source_pad; ++i) {
> > > +               for (i = 0; i < brx->entity.source_pad; ++i) {
> > >                         format = v4l2_subdev_state_get_format(state, i);
> > >                         format->code = fmt->format.code;
> > >                 }
> > > +
> > > +               format = v4l2_subdev_state_get_format(state, i);
> > > +               *format = fmt->format;
> > 
> > When running kms-test-plane-position.py (from [0]) on RZ/V2H EVK, Im
> > getting vblank timeouts as seen below:
> 
> Oops :-/
> 
> I'm run the KMS tests on a R-Car board when I submitted the series. I'll
> test again tomorrow.

I have been able to reproduce an issue with the same test script. It
doesn't result in a vblank wait timeout, but in display output
corruption. I'll investigate and fix it, and hopefully the fix will also
address your issue.

> > [   51.295849] ------------[ cut here ]------------
> > [   51.300538] [CRTC:45:crtc-0] vblank wait timed out
> > [   51.305514] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1921 at drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper], CPU#1: python3/413
> > [   51.319577] Modules linked in: sha256 cfg80211 bluetooth ecdh_generic kpp ecc rfkill snd_soc_hdmi_codec snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd soundcore rzg2l_du_drm spi_rpc_if drm_client_lib vsp1 rzg2l_cru videobuf2_vmalloc drm_dma_helper videobuf2_dma_contig videobuf2_memops rcar_fcp rzg2l_csi2 videobuf2_v4l2 renesas_usbhs rzg2l_mipi_dsi ov5645 videobuf2_common adv7511 v4l2_cci phy_rzg3e_usb3 panfrost v4l2_fwnode reset_rzv2h_usb2phy v4l2_async drm_display_helper drm_shmem_helper videodev rtc_isl1208 cec gpu_sched rtc_renesas_rtca3 mc display_connector drm_kms_helper renesas_rpc_if drm fuse backlight
> > [   51.374382] CPU: 1 UID: 0 PID: 413 Comm: python3 Not tainted 7.0.0-next-20260415-00258-gf9ef0131676a-dirty #340 PREEMPT
> > [   51.385280] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (DT)
> > [   51.392521] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [   51.399505] pc : drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
> > [   51.407624] lr : drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper]
> > [   51.415739] sp : ffff800083dbb9d0
> > [   51.419067] x29: ffff800083dbba00 x28: 000000000000000a x27: 00000000000005c5
> > [   51.426237] x26: 0000000000000000 x25: ffff0000ca4c0888 x24: 0000000000000001
> > [   51.433406] x23: 0000000000000001 x22: 0000000000000000 x21: 0000000000000000
> > [   51.440575] x20: ffff0000c7cb4980 x19: ffff0000c325e618 x18: 000000000000000a
> > [   51.447743] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > [   51.454911] x14: 0000000000000000 x13: ffff8000818c3ca0 x12: 00000000000001fc
> > [   51.462079] x11: ffff0000c0fcd360 x10: ffff8000832bd200 x9 : ffff8000818c3ca0
> > [   51.469248] x8 : 3fffffffffffefff x7 : ffff80008191bca0 x6 : 0000000000000000
> > [   51.476416] x5 : ffff0003fdf93088 x4 : 0000000000000001 x3 : 0000000000000000
> > [   51.483584] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000cc19af40
> > [   51.490753] Call trace:
> > [   51.493212]  drm_atomic_helper_wait_for_vblanks.part.0+0x248/0x27c [drm_kms_helper] (P)
> > [   51.501336]  drm_atomic_helper_commit_tail_rpm+0xbc/0xd8 [drm_kms_helper]
> > [   51.508237]  commit_tail+0xa4/0x1a4 [drm_kms_helper]
> > [   51.513313]  drm_atomic_helper_commit+0x178/0x194 [drm_kms_helper]
> > [   51.519605]  drm_atomic_commit+0x8c/0xd0 [drm]
> > [   51.524307]  drm_mode_atomic_ioctl+0xac8/0xe00 [drm]
> > [   51.529523]  drm_ioctl_kernel+0xc0/0x128 [drm]
> > [   51.534217]  drm_ioctl+0x354/0x4c0 [drm]
> > [   51.538389]  __arm64_sys_ioctl+0xa4/0xf4
> > [   51.542342]  invoke_syscall.constprop.0+0x40/0x108
> > [   51.547161]  el0_svc_common.constprop.0+0xb8/0xd8
> > [   51.551892]  do_el0_svc+0x1c/0x28
> > [   51.555229]  el0_svc+0x38/0x140
> > [   51.558397]  el0t_64_sync_handler+0xa0/0xe4
> > [   51.562603]  el0t_64_sync+0x198/0x19c
> > [   51.566286] ---[ end trace 0000000000000000 ]---
> > [   64.735886] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
> > [   64.742630] rzg2l-du 16460000.display: [drm] *ERROR* [CRTC:45:crtc-0] commit wait timed out
> > [   74.975884] rzg2l-du 16460000.display: [drm] *ERROR* flip_done timed out
> > [   74.982639] rzg2l-du 16460000.display: [drm] *ERROR* [PLANE:40:plane-1] commit wait timed out
> > [   75.999845] ------------[ cut here ]------------
> > 
> > Reverting this patch fixes the issue, but compliance might fail. On
> > V2H media device is not registered for VSP.
> > 
> > [0] https://git.ideasonboard.com/renesas/kms-tests/src/branch/master/tests

-- 
Regards,

Laurent Pinchart


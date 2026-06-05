Return-Path: <linux-media+bounces-63981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CbujCrpMI2qIoQEAu9opvQ
	(envelope-from <linux-media+bounces-63981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:24:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C164B9FB
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:24:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N7hadlv8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63981-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63981-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6865C30323B2
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 22:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340E03947AB;
	Fri,  5 Jun 2026 22:20:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269C282F1A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698053; cv=none; b=PY7NscFxV1pLseLc3KuePHaWW7xpBUFcyR9teA8fGPM9NAfTb5up2vf5Nmp5ewkweX0FAFiW85X+u/U1uZRxo2mU90mFYsP/ZLS6STgXrzbqEOKF9AYItF2UO4uUOI5CHw8vIf5E99E/gmOL+fc0gJc5PDgiAP0V1/7XaU+FLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698053; c=relaxed/simple;
	bh=hUX47/vd81Hn3F7CGApSzzkzxQj9GtWgcq+ixJ5SnWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DadcZiHVmG+ufBsrVWu1SGBmRFp7ReG+NIeMLhET6XZp4xCV6IeQX0UgFc9YOA/zChmmC6Yl/qjZu1tYks+loVTXb1DQA7WGlzbhbQiSAuTiP5YvAI4F2ONk4pL123o+Df75wOSbNDRm9/UShAPIcPymcuEmU/NCzK4eGQBC28w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7hadlv8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAAD1F00893;
	Fri,  5 Jun 2026 22:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698052;
	bh=YawAfIM7oh8jhrMm9sBgOzfR/u1AbZlm2iGMac7oUAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N7hadlv8Q8WAQEelx4V/MOpyRSo0+vPPavDC5jWcHN+KcWCvEFdnmHjTn7K72Orw1
	 aomjU/f03VZjfYUx/GZRRXizV0qbQozopRvXgOqBhgusgWb+M/3p+tqv3iL68AYtnr
	 Rm0fDHX7U34SdfH5wm1ScYgG6XRdVvCkGm3yUqdUaK3yIxJlsGulm+zngu8lnjdPKw
	 It6jgu7V6D+r7nGx9+MKGK2/blY/VpH8q6GZlPQSHNveWuW26fzLKmw4mQA/7/wbPq
	 /P8He9jdjJ39BEtM7/eIUfeCO9DkMIO2HvYDaQe/H0pMqbl9N/+OtLbtOHXrVWxsD7
	 A0Kp3rpsmflPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/17] media: rockchip: rga: zero cmdbuf in shared code
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-1-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-1-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:20:51 +0000
Message-Id: <20260605222052.2AAAD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63981-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E6C164B9FB

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent lockless modification of f->crop and ctx->cmdbuf_dirty =
in vidioc_s_selection races with device_run.
--

commit d338e595cb9fb0b46d00f7fc398fe05c4adbac84
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: zero cmdbuf in shared code

This commit centralizes the zeroing of the command buffer into the shared r=
ga
code instead of individual implementations. It also uses the cmdbuf_size me=
mber
for the memset operation.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb863..bd0afd33affe4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -41,6 +41,7 @@ static void device_run(void *prv)
>  	spin_lock_irqsave(&rga->ctrl_lock, flags);
>  	if (ctx->cmdbuf_dirty) {
>  		ctx->cmdbuf_dirty =3D false;
> +		memset(ctx->cmdbuf_virt, 0, rga->hw->cmdbuf_size);
>  		rga->hw->setup_cmdbuf(ctx);

[Severity: High]
This is a pre-existing issue, but can the lockless modification of f->crop
and ctx->cmdbuf_dirty in vidioc_s_selection race with this execution of
device_run?

In vidioc_s_selection, the crop dimensions and dirty flag are updated witho=
ut
acquiring the rga->ctrl_lock spinlock:

drivers/media/platform/rockchip/rga/rga.c:vidioc_s_selection() {
    ...
    f->crop =3D s->r;
    ctx->cmdbuf_dirty =3D true;
    ...
}

Because vidioc_s_selection runs with only rga->mutex held and allows
modifications while streaming, it can execute concurrently with the v4l2_m2m
worker thread running device_run.

Since vidioc_s_selection does not acquire rga->ctrl_lock, hardware
configuration functions like rga_cmd_set_dst_info can read a torn f->crop=20
state during rga->hw->setup_cmdbuf:

drivers/media/platform/rockchip/rga/rga-hw.c:rga_cmd_set_dst_info() {
    ...
    dst_h =3D ctx->out.crop.height;
    dst_w =3D ctx->out.crop.width;
    dst_x =3D ctx->out.crop.left;
    dst_y =3D ctx->out.crop.top;
    ...
    corner_addrs =3D rga_get_corner_addrs(&ctx->out, addrs, dst_x, dst_y,
                                        dst_w, dst_h);
    ...
}

If a torn read mixes an old, large left and top offset with a new, large
width and height, it bypasses the validation done in vidioc_s_selection.

Does this cause rga_get_corner_addrs to calculate out-of-bounds DMA base
addresses, resulting in the RGA hardware performing out-of-bounds DMA writes
past the allocated video buffers?

>  	}
>  	spin_unlock_irqrestore(&rga->ctrl_lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D1


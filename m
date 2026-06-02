Return-Path: <linux-media+bounces-63409-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D4moNPQBH2q2cwAAu9opvQ
	(envelope-from <linux-media+bounces-63409-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:16:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153E63021F
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 18:16:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jU1mAjqI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63409-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63409-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD1A3076095
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 16:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8933F39C7;
	Tue,  2 Jun 2026 16:08:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472753F39DE
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 16:08:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416495; cv=none; b=Z7oPGwN+eBNdmPTB9XzRtyts5bnAbD91v3hrSRLlw0Z65/VcN7UlqxQ3g4kMY6YpujLPqvAdK5XFx3Tt/Zm5be23aobg9qITZD87KcayCtQhqYPzUjDbx2OJKm1DZaxhzlRqIvQ9NFNe6Ah8IQL3qQj0n5cmB99DtW1GuFTY1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416495; c=relaxed/simple;
	bh=V0tIGs+PgGYp+yMy6NuRufDQxMOM+ypKsw8aumzjWZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ej6EcLBR54QHhr3UWB8VakI0ei6Qj+4Dhp99l7YQ59KpqKy6vdtesTpuGvIoiMvCZ9XeHkEE80Oh54L3EUYqD++OV0RCAyEMct8tiKUAEsi1+FI+2FJVNR5ozjrEQLi6LcHGBIwvUlrgM6NoCqmzSI3jQeK1afzOcrMEJ3+ep2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU1mAjqI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29621F00893;
	Tue,  2 Jun 2026 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416493;
	bh=pVmcWqfX64ADXk+Y3xqz9r7DYv7c5OQolgY1KjekT4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jU1mAjqIrL9FqpleVgnn1GSDlzdOZ4wK2+xn6Ij5d4DzDO7WiJ6Es9k29c6pPRvWP
	 bbMiQyJIqCzjOscEyFY/8CByOeNERjprWA6h0+20fA8yAO5ciD89Tg2iTWennih8Jh
	 1MM8xO6wEcRFZwQcCcak2VGJrxjnh1T1tX5PYGUoTRd11Sc3Tkd49e/4xgsn5he+ib
	 RO+4jsQIKmf0aII4GyJlcyDi0oO3jdO1oO5A+yhYNUFQhsRgDCibgihlTbk0oxGfLy
	 xrciHuo1Egq3VNNcIR8jQHYeg4gS862xmaLof3oO6sr7zQYA/ssEmVsJEEUJHOp8D4
	 9hcHzNKbvJtOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: usb: as102: initialize mutexes before
 registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joel Peech" <linux@jrpmail.ca>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602155529.4097328-1-linux@jrpmail.ca>
References: <20260602155529.4097328-1-linux@jrpmail.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 16:08:13 +0000
Message-Id: <20260602160813.B29621F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63409-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@jrpmail.ca,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,appspotmail.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jrpmail.ca:email,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3153E63021F

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `as102_start_stream()` fails, `as102_dev->streaming` is left in=
cremented, permanently breaking the hardware streaming state.
--

commit 2c8befce227c56474dec3c665bf27984a30ca17a
Author: Joel Peech <linux@jrpmail.ca>

media: usb: as102: initialize mutexes before registration

This commit moves the initialization of bus_adap.lock and as102_dev->sem
to occur before registering DVB demux and frontend objects. This prevents
callbacks from using these mutexes before they are initialized, resolving
a lockdep warning.

Reported-by: syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D3825a6102073c418fe41
Link: https://lore.kernel.org/r/tencent_F063E97E23B8C4431762377E26CC336AE30=
5@qq.com

> diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as10=
2/as102_drv.c
> index 6b1d3528a0a7f..60827acd73f87 100644
> --- a/drivers/media/usb/as102/as102_drv.c
> +++ b/drivers/media/usb/as102/as102_drv.c
> @@ -296,6 +296,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
>  		return ret;
>  	}
> =20
> +	/* init bus mutex for token locking */
> +	mutex_init(&as102_dev->bus_adap.lock);
> +
> +	/* init start / stop stream mutex */
> +	mutex_init(&as102_dev->sem);
> +
>  	as102_dev->dvb_dmx.priv =3D as102_dev;
>  	as102_dev->dvb_dmx.filternum =3D pid_filtering ? 16 : 256;

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this error handling leave the hardwa=
re
stream state permanently desynchronized?

Looking at as102_dvb_dmx_start_feed() which takes this newly initialized
mutex, the streaming counter is incremented unconditionally before attempti=
ng
to start the stream:

drivers/media/usb/as102/as102_drv.c:as102_dvb_dmx_start_feed() {
        ...
        if (as102_dev->streaming++ =3D=3D 0)
                ret =3D as102_start_stream(as102_dev);

        mutex_unlock(&as102_dev->sem);
        return ret;
}

If as102_start_stream() fails, it returns an error directly while leaving
the streaming counter incremented.

The DVB core handles the feed creation failure by aborting, which means it
will not call stop_feed() during cleanup. Because the streaming counter
remains greater than zero, subsequent calls to start a feed will skip
as102_start_stream() entirely.

Does this counter need to be decremented when as102_start_stream() returns
an error to ensure the device can recover from stream start failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602155529.4097=
328-1-linux@jrpmail.ca?part=3D1


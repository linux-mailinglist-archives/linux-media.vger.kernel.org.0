Return-Path: <linux-media+bounces-62613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKNJFy1HEGryVgYAu9opvQ
	(envelope-from <linux-media+bounces-62613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:08:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F23515B38EF
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 078CD3036431
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7267C37F735;
	Fri, 22 May 2026 12:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hQLcA1R4"
X-Original-To: linux-media@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E312349CE4;
	Fri, 22 May 2026 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451385; cv=none; b=f2pgIoXigG+W89HfLELYWJIoa6YAXPnC6K0D+2n7RcoatGPYZcDFEzBAwyfgwrJImXXw6T6/OWlX4dArjsjD6Dq0lwLMSdRkLnrISSjTZEJ9INK1z4QKS0ucYvyIBKhG7KaJoAWBFHLdYcgKrouaAekZ7WAieYKC09Flc2umXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451385; c=relaxed/simple;
	bh=mtP6eQwIAC+5sOyhuqR1fcwb/5Uotac7KXM+4LolK0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnBFdFesHq2PNgP7R4ps72rmlClEVtYN/44Vu8P4H8zchfZQvnMkkvXHy3T2f7/4jcSbeHWIbVNUj73ktsQ32vFHY2nfsHkBjdTE87IugxbKlE4HfIZJKMCYLVX3+qu1m6qJfE4cXZLvBlcUb/vA0DOT9CLiif8rOjTEdN+LP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hQLcA1R4; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=npoaRceVSKcBIA7XnqArtD5X9kOzz4sAZEkny7h7tJ4=; b=hQLcA1R414V+btOIJDOD+tGBES
	uDEs/ZrExwzWFrdgA2r4itlz8ocKj3qVx/Px03FRFevQRRMraNv3f7W2bvjBN5kFIOJGeb8k7IBXZ
	6LsHV3nrbRV68SeA96efVg2L53IrdTQBf+ImquXkal8G8iu4FOBfNKYxhu7b5kXN5A4k6B/EG2y0j
	A2SlkcEx8m3sDfRMwjkN7Q/kmEW5OifhXxKxD9djBPHAr4PZ3yNKA/6oGESvfHi4Gm9OmH4ztnnRQ
	29d2UdC5J1Q//bqZXoOXiBdQk8M5YpAoUZEm98OEJBD/d6E0QF0umpnWhFoj8xl6vPFKe6cX/3cY2
	L34qoIfQ==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQOag-000FcQ-0J;
	Fri, 22 May 2026 14:02:58 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQOae-000ErM-1x;
	Fri, 22 May 2026 14:02:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Riesch <michael.riesch@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <frank.li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for i.MX93
Date: Fri, 22 May 2026 14:02:56 +0200
Message-ID: <118820958.nniJfEyVGO@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <AS8PR04MB9080844E610F8E8012647B39FA0F2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References:
 <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
 <3606153.44csPzL39Z@steina-w>
 <AS8PR04MB9080844E610F8E8012647B39FA0F2@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28008/Fri May 22 08:24:46 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62613-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,tq-group.com:url,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: F23515B38EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Freitag, 22. Mai 2026, 03:58:56 CEST schrieb G.N. Zhou (OSS):
> > > Thanks for testing. Regarding the lane stop state error on i.MX93 with
> > imx327:
> > >
> > > This error indicates the CSI-2 lanes are not in LP-11 (stop) state
> > > when expected. Please check:
> > >
> > > 1) Verify the sensor PHY is in LP-11 state before returning from the =
sensor's
> > >    s_stream(1) call. The CSI-2 receiver expects lanes to be in stop s=
tate
> > >    initially.
> >=20
> > Well, this might be tricky as I don't have D-PHY capable scopes.
> > I can successfully use this sensor on a imx8mp, so I am expecting this =
to be
> > okay.
> >=20
> > > 2) Check if the imx327 driver has a delay between starting the stream=
 and
> > >    returning from s_stream(). If the sensor transitions PHY out of LP=
=2D11
> > >    state during this delay, the CSI driver's lane state check will fa=
il
> > >    when it runs later. The sensor should remain in LP-11 until the CSI
> > >    controller completes its initialization.
> >=20
> > In imx290_set_stream() and subsequently imx290_start_streaming() setting
> > IMX290_XMSTA starts the stream. I expect this is the point when the sen=
sors
> > switches from LP-11 to HS. But again, I can't verify.
>=20
> As mentioned in #2, I reviewed drivers/media/i2c/imx290.c and identified =
a 30ms
> delay that appears to be the root cause of this issue.
>=20
> The problem occurs because:
>=20
> The sensor exits LP-11 state and transitions to HS mode after IMX290_XMST=
A is written
> The 30ms delay in s_stream() causes the function to return late
> By the time the CSI controller performs its lane state check, the sensor =
has already switched
> from LP-11 to HS mode, causing the check to fail=E3=80=82

This sounds wrong, see below.

>=20
> Proposed fix:
>=20
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 21cbc81cb2ed..519aa336249a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1059,7 +1059,6 @@ static int imx290_start_streaming(struct imx290 *im=
x290,
> =20
>         cci_write(imx290->regmap, IMX290_STANDBY, 0x00, &ret);
> =20
> -       msleep(30);
> =20
>         /* Start streaming */
>         return cci_write(imx290->regmap, IMX290_XMSTA, 0x00, &ret);
>=20
> Removing this delay allows s_stream() to return immediately, giving the C=
SI controller
> time to complete its initialization before the sensor transitions PHY sta=
te.
>=20
> Could you test this patch and confirm if it resolves the lane state check=
 failure?

Removing these 30ms does not fix the problem. Actually the delay change is
hardly measurable, as the i2c transfer take much more time. I added a messa=
ge
for start/exit of imx290_enable_streams(). Just the transfers take >600ms.

=2D-8<--
[   40.507273] plane 0: bytesperline=3D3840 sizeimage=3D4147200
[   40.512628] mxc-isi 4ae40000.isi: validating link "crossbar":2 -> "mxc_i=
si.0":0
[   40.519945] mxc-isi 4ae40000.isi: validating stream "crossbar":2:0 -> "m=
xc_isi.0":0:0
[   40.527789] mxc-isi 4ae40000.isi: validating link "dw-mipi-csi2rx 4ae000=
00.mipi-csi":1 -> "crossbar":0
[   40.537105] mxc-isi 4ae40000.isi: validating stream "dw-mipi-csi2rx 4ae0=
0000.mipi-csi":1:0 -> "crossbar":0:0
[   40.546940] mxc-isi 4ae40000.isi: validating link "imx327 4-001a":0 -> "=
dw-mipi-csi2rx 4ae00000.mipi-csi":0
[   40.556680] mxc-isi 4ae40000.isi: validating stream "imx327 4-001a":0:0 =
=2D> "dw-mipi-csi2rx 4ae00000.mipi-csi":0:0
[   40.573332] mxc-isi 4ae40000.isi: enable streams "crossbar":2/0x1
[   40.579446] mxc-isi 4ae40000.isi: collect_streams: "crossbar":2: found 0=
x1 enabled 0x0
[   40.587373] imx290 4-001a: Frame descriptor on pad 0, type CSI-2
[   40.593390] imx290 4-001a:   stream 0, code 0x300f, length 0, flags 0x00=
00, vc 0, dt 0x2b
[   40.601489] dw-mipi-csi2rx 4ae00000.mipi-csi: Frame descriptor on pad 1,=
 type CSI-2
[   40.609147] dw-mipi-csi2rx 4ae00000.mipi-csi:        stream 0, code 0x30=
0f, length 0, flags 0x0000, vc 0, dt 0x2b
[   40.618894] mxc-isi 4ae40000.isi: enable streams "dw-mipi-csi2rx 4ae0000=
0.mipi-csi":1/0x1
[   40.627082] dw-mipi-csi2rx 4ae00000.mipi-csi: collect_streams: "dw-mipi-=
csi2rx 4ae00000.mipi-csi":1: found 0x1 enabled 0x0
[   40.638184] mxc-isi 4ae40000.isi: enable streams "imx327 4-001a":0/0x1
[   40.644728] imx290 4-001a: collect_streams: sub-device "imx327 4-001a" d=
oes not support streams
[   40.653431] imx290 4-001a: imx290_enable_streams start
[   41.294967] imx290 4-001a: imx290_enable_streams exit
[   41.301064] dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop stat=
e: 0x0, expected 0x10003
[   41.309884] mxc-isi 4ae40000.isi: disable streams "imx327 4-001a":0/0x1
[   41.316534] imx290 4-001a: collect_streams: sub-device "imx327 4-001a" d=
oes not support streams
[   41.361401] mxc-isi 4ae40000.isi: enable streams 1:0x1 failed: -110
[   41.367690] mxc-isi 4ae40000.isi: failed to enable streams 0x1 on 'dw-mi=
pi-csi2rx 4ae00000.mipi-csi':1: -110
[   41.379854] mxc-isi 4ae40000.isi: enable streams 2:0x1 failed: -110
[   41.387325] mxc-isi 4ae40000.isi: Failed to enable pipe 0
[   41.399231] video0: VIDIOC_STREAMON: error -110: type=3Dvid-cap-mplane
[   41.408340] videodev: v4l2_release: video0: release
=2D-8<--

Given this I would ague the CSI host initialization order is wrong. The
documentation for enable_streams states:
> The struct v4l2_subdev_pad_ops->enable_streams() and struct
> v4l2_subdev_pad_ops->disable_streams() callbacks are used by the receiver=
 driver
> to control the transmitter driver's streaming state.

So IMHO calling enable_streams it is expected the sensors switched to
HS mode. Unfortunately even checking PHY stopstate before enabling the subd=
ev
streams does not fix this error message.
There is still=20
> dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop state: 0x0, expec=
ted 0x10003

I also noticed that before the s_stream call (imx290_set_stream) call the
device is powered down. That might explaing that reversing the order will
not help.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/




Return-Path: <linux-media+bounces-15352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCE93CD90
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 07:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0461E1C21991
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 05:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6F739AD5;
	Fri, 26 Jul 2024 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brettrd.com header.i=@brettrd.com header.b="F1dzoOTc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975054204D
	for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 05:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721971496; cv=none; b=ApHemTjv3uQNJkLzvSTm0iiMXB+ZbULOODX4CP9z6ZokMMldIgV8FOy5jxcNSm7lA6C3kwjYqOOB/eCKG5y/cI52RFxP93yRkLJqW1gq7o9oixwwXuE2OzNVj0lC7rHnf86tJ+VKHTLjwIdzsDwxGC25Ua+WSkWmlqakSheUoJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721971496; c=relaxed/simple;
	bh=xXsGy4tbcO45kXAA9UCgPWxiDFrFycznyO0Z8VFPbVg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHmr3SucVH24t06sWF33FjavHYpGKM9ciR2/v0LtdphEUdUwZNCxvc3vQN1cr2jauT91IAdEL7Jt1c4o1qC3XQVP/jzFFvAPGsFUg4V7QVS0mM/59vc4K9cRRdFkFsHYzSFsS5UUWoOMVUxP8DxpP4QFQy53znD2Qn6CHwyh7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brettrd.com; spf=pass smtp.mailfrom=brettrd.com; dkim=pass (2048-bit key) header.d=brettrd.com header.i=@brettrd.com header.b=F1dzoOTc; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=brettrd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brettrd.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brettrd.com;
	s=protonmail2; t=1721971485; x=1722230685;
	bh=xXsGy4tbcO45kXAA9UCgPWxiDFrFycznyO0Z8VFPbVg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F1dzoOTch9ECr4wHsFJynHY/MjBPCBxYbAFBnLe9WPA6zuMkMmpn4jUt/q/YKGAHT
	 v2szvjMWsq4BzQ/JvsHLbsh+TwVjHDQGvVDz9iju+WXKQjiEs/JRZzm2FIm0DtZxfK
	 UxpIPR6ypnvpFFaIx+JTqvW/kN8jPqh+LWFxWc+ClubEnChbLzV55f6uo5Opv7lJHx
	 3txC3tdF7BkqNhnbUmsqNCl9j2gLcOMOwK4OyF5NxDrleskncK31IHyhvxZ2vn7nDT
	 pS4oaqWjlYMwtpE0mS1f7BYSkTIx9yKxhxhqn+hXypjeR0fbqmvvP5zjQcN0YJLTeB
	 494EeaJoH9Epg==
Date: Fri, 26 Jul 2024 05:24:41 +0000
To: Ricardo Ribalda <ribalda@chromium.org>
From: BrettRD <brett@brettrd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: new UVC thermal camera vid:pid and quirk
Message-ID: <QZMkPVqtorkeIbj5BHOKAfQE7IJHh6Shg3K9xKeg4d6t4wPI7o94SkiH7znorWctNAqQ4Pr4jZhq6nPQjAk0GprUjcYqknpmVXwne8-H094=@brettrd.com>
In-Reply-To: <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com>
References: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com> <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com>
Feedback-ID: 43762550:user:proton
X-Pm-Message-ID: 51da9e6ec5f0f3bccd95da8036cc32fc3ed0dcde
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_GL241rKmIqx0fHqVSoA0gZGLZ3AZlf6Y3QLisut7KtM"

This is a multi-part message in MIME format.

--b1_GL241rKmIqx0fHqVSoA0gZGLZ3AZlf6Y3QLisut7KtM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Monday, July 22nd, 2024 at 6:15 PM, Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>=20
> Hi BrettRD
>=20
> Thanks for your report.
>=20
> Do you want to give it a try at sending a patch for the device?
>=20
> It looks something like this:
> https://lore.kernel.org/linux-media/20221101-easycam-v3-1-2c9881a7a4f7@ch=
romium.org/
=20
I'd love to, I'm still reading up on how to build modules under Debian
A first attempt is attached, I'll send it standalone once I've tested it.

> Make sure the vid:pids are alphabetically ordered.

Thanks! I wouldn't have noticed that, the struct is inserted in vid:pid ord=
er
=20
> Regards!
>=20
> On Fri, 19 Jul 2024 at 07:55, BrettRD brett@brettrd.com wrote:
>=20
> > Hello,
> >=20
> > I have a device not listed among the UVC supported devices, '2bdf:0102 =
HIK Camera', It's sold as a "mini640" thermal camera.
> >=20
> > It needs the quirk 'UVC_QUIRK_PROBE_MINMAX' before it runs happily unde=
r gstreamer using v4l2src, no errors for all reported resolutions.
> >=20
> > Attached is the libusb output from it, and the v4l2_compliance report g=
enerated without the quirk applied. (with quirk=3D2 it reports no failures)
> >=20
> > Thanks for a great driver and documentation
> > Brett
>=20
> --
> Ricardo Ribalda

Cheers,
Brett
--b1_GL241rKmIqx0fHqVSoA0gZGLZ3AZlf6Y3QLisut7KtM
Content-Type: text/x-patch; name=0001-media-uvcvideo-Add-quirk-for-Mini640-Thermal-Camera.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0001-media-uvcvideo-Add-quirk-for-Mini640-Thermal-Camera.patch

RnJvbSAyYzYwMjk4MmM5OGY0OGYwNmVjOWM2MTA2NTA2ZjZlODEyMGVlODg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmV0dCBEb3duaW5nIDxicmV0dEBicmV0dHJkLmNvbT4KRGF0
ZTogRnJpLCAyNiBKdWwgMjAyNCAxNToxNjoxMSArMTAwMApTdWJqZWN0OiBbUEFUQ0ggMS8xXSBt
ZWRpYTogdXZjdmlkZW86IEFkZCBxdWlyayBmb3IgTWluaTY0MCBUaGVybWFsIENhbWVyYQoKVGhl
IHRoZXJtYWwgY2FtZXJhICIyYmRmOjAxMDIgSElLIENhbWVyYSIgc29sZCBhcyBhICJNaW5pNjQw
Igpsb25nLXdhdmUgaW5mcmFyZWQgY2FtZXJhIGNyYXNoZXMgQ2hlZXNlIGFuZCBlcnJvcnMgdW5k
ZXIgZ3N0cmVhbWVyJ3MKdjRsMnNyYyBtaXNzaW5nIGJvdGggVFJZX0ZNVCBhbmQgVklESU9DX1Nf
Rk1UCgpVc2luZyB0aGUgcXVpcmsgVVZDX1FVSVJLX1BST0JFX01JTk1BWCB5aWVsZHMgYSBjbGVh
biB2NGwyLWNvbXBsaWFuY2UgcmVwb3J0CmFuZCBhbGxvd3Mgc3RyZWFtaW5nIGF0IGFsbCBzdXBw
b3J0ZWQgcmVzb2x1dGlvbnMgdW5kZXIgZ3N0cmVhbWVyCgpTaWduZWQtb2ZmLWJ5OiBCcmV0dCBE
b3duaW5nIDxicmV0dEBicmV0dHJkLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlhL3VzYi91dmMvdXZj
X2RyaXZlci5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jIGIvZHJpdmVy
cy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYwppbmRleCBmMGZlYmRjMDhjMmQuLjU0MjBlNzRk
ODY2NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS91c2IvdXZjL3V2Y19kcml2ZXIuYworKysg
Yi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX2RyaXZlci5jCkBAIC0yOTkxLDYgKzI5OTEsMTUg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIHV2Y19pZHNbXSA9IHsKIAkgIC5i
SW50ZXJmYWNlU3ViQ2xhc3MJPSAxLAogCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsCiAJICAu
ZHJpdmVyX2luZm8JCT0gVVZDX0lORk9fUVVJUksoVVZDX1FVSVJLX0ZPUkNFX0JQUCkgfSwKKwkv
KiBISUsgQ2FtZXJhIChNaW5pNjQwIFRoZXJtYWwgQ2FtZXJhKSAqLworCXsgLm1hdGNoX2ZsYWdz
CQk9IFVTQl9ERVZJQ0VfSURfTUFUQ0hfREVWSUNFCisJCQkJfCBVU0JfREVWSUNFX0lEX01BVENI
X0lOVF9JTkZPLAorCSAgLmlkVmVuZG9yCQk9IDB4MmJkZiwKKwkgIC5pZFByb2R1Y3QJCT0gMHgw
MTAyLAorCSAgLmJJbnRlcmZhY2VDbGFzcwk9IFVTQl9DTEFTU19WSURFTywKKwkgIC5iSW50ZXJm
YWNlU3ViQ2xhc3MJPSAxLAorCSAgLmJJbnRlcmZhY2VQcm90b2NvbAk9IDAsCisJICAuZHJpdmVy
X2luZm8JCT0gVVZDX0lORk9fUVVJUksoVVZDX1FVSVJLX1BST0JFX01JTk1BWCkgfSwKIAkvKiBJ
bnN0YTM2MCBMaW5rICovCiAJeyAubWF0Y2hfZmxhZ3MJCT0gVVNCX0RFVklDRV9JRF9NQVRDSF9E
RVZJQ0UKIAkJCQl8IFVTQl9ERVZJQ0VfSURfTUFUQ0hfSU5UX0lORk8sCi0tIAoyLjM5LjIKCg==

--b1_GL241rKmIqx0fHqVSoA0gZGLZ3AZlf6Y3QLisut7KtM--



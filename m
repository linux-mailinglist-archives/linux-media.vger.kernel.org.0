Return-Path: <linux-media+bounces-68-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1567E849E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE331B20C91
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 20:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148EC3C08B;
	Fri, 10 Nov 2023 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF602230F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 20:46:25 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D4C1BDD;
	Fri, 10 Nov 2023 12:46:23 -0800 (PST)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 3EE0266073EF;
	Fri, 10 Nov 2023 20:46:22 +0000 (GMT)
From: "Daniel Almeida" <daniel.almeida@collabora.com>
In-Reply-To: <20231030193406.70126-3-detlev.casanova@collabora.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 10 Nov 2023 20:46:21 +0000
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, "Mauro Carvalho Chehab" <mchehab@kernel.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6093-654e9680-3-67fa3a80@264835418>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/2] =?utf-8?q?doc=3A?==?utf-8?q?_visl=3A?= Add 
 AV1 support
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable

Hi Detlev,

This does not apply anymore (media=5Ftree/master -> 2e6bf8ce2af120df033=
fee1ec42f5e78596f5c44)

As for the changes,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

> Add AV1 information in visl documentation.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/admin-guide/media/visl.rst | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/admin-guide/media/visl.rst b/Documentation=
/admin-guide/media/visl.rst
> index 7d2dc78341c9..64229857c17c 100644
> --- a/Documentation/admin-guide/media/visl.rst
> +++ b/Documentation/admin-guide/media/visl.rst
> @@ -71,6 +71,7 @@ The following codecs are supported:
>  - VP9
>  - H.264
>  - HEVC
> +- AV1
> =20
>  visl trace events
>  -----------------
> @@ -79,6 +80,7 @@ The trace events are defined on a per-codec basis, =
e.g.:
>  .. code-block:: bash
> =20
>          $ ls /sys/kernel/debug/tracing/events/ | grep visl
> +        visl=5Fav1=5Fcontrols
>          visl=5Ffwht=5Fcontrols
>          visl=5Fh264=5Fcontrols
>          visl=5Fhevc=5Fcontrols
> --=20
> 2.41.0
>



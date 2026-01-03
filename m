Return-Path: <linux-media+bounces-49860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5DCF055A
	for <lists+linux-media@lfdr.de>; Sat, 03 Jan 2026 21:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFCC3301AE17
	for <lists+linux-media@lfdr.de>; Sat,  3 Jan 2026 20:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470A2280338;
	Sat,  3 Jan 2026 20:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Ug+sPEiv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yoOz5K7a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40210279DB3;
	Sat,  3 Jan 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767471032; cv=none; b=LxCusGI08dlHQqr+OBmTfIfa/a0ZhDVBuSrySuUP2mOw4wbuL2irNme67vX0VTVZ6lYTsT9pB9kJ4Td09PHwnaPVg7KXUgLI6rjxBsNGu+133GOoQ9432AmgNsGLg0M90YhNdzhz0ee172fcVNsxi1ZtBCcwS9rVn2fgq5AggSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767471032; c=relaxed/simple;
	bh=uBvDhbCKfl7OzlDG2c0fLSFsPJpvUvRChMJH7EhMizY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zji7PXQTtRi3i2x0/1/lriQ09nEG0zvErL9Wh3S2aeBT5ESHDIGDv0tv43yWv1uTQPCFDZhAb1Y62CpIUjF80aPjlpbV/C70LZj8gthMHaZjQ0hRcUmqvFNiLJ3G2MEpG7gzganOC4oMn356EoRHsZsCcivbkPQbSwo02fNhi6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Ug+sPEiv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yoOz5K7a; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1767471012; bh=5zS3GPiKua9VdhT2Gn8Zsd5
	LMSooy+BVRaJpFgfl9+s=; b=Ug+sPEiv9fSbDr87P8hJArBBffoTyyAcUfBNo/Ua3aCZeaT0zF
	s76+y9MITczt+7iH4r+EZdi3m0K/CudH6e4S6eEHmLL1qKgQEuYw3a5A6qFLTad3TcTcQ7LUzGn
	eKp73i5k9OsZFgeymMCi0Tkel/t/G1sRfBkIFTOOpVX0SfUMokPBZZsCs3xPkL7/jsEPaM3eEBB
	io3tmYBwFrTrclzgKH8k6xbCf7nKoDaUzECv58tVU3m7A6rj7+McsURPwOjT10bapi+u9M0+Npw
	QkGaTK6aqbHj1FIo9EpH7p22AIpjDT8jrzQ4KIBTL5FATo2I+LQE+ZDmdfbzHcF42CQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1767471012; bh=5zS3GPiKua9VdhT2Gn8Zsd5
	LMSooy+BVRaJpFgfl9+s=; b=yoOz5K7aGnqDoUVzRKr4ISO6kGNEoGw44bcvAnrcVyvZwo1fhW
	sUKTfXr4iB40CXJsjmzv8Bwfyl34/1X0QABA==;
From: Dang Huynh <dang.huynh@mainlining.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Olivier =?UTF-8?B?Q3LDqnRl?= <olivier.crete@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
Subject:
 Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the VDPU346
 variant
Date: Sat, 03 Jan 2026 20:10:08 +0000
Message-ID: <8993014.lOV4Wx5bFT@melttower>
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Christian,

On Friday, December 26, 2025 11:31:37=E2=80=AFAM Coordinated Universal Time=
 Christian=20
Hewitt wrote:
> This series depends upon Detlev Casanova's current v7 series for VDPU381 =
and
> VDPU383 support [0]. It adds support for the VDPU346 IP block used for
> H264, HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears
> to be a close relation to VDPU381 used with RK3588, except with a single
> core, output limited to 4K, and minor feature differences, e.g. HEVC level
> 5.1 on VDPU346 vs 6.1 on VDPU381. To handle differences we declare a new
> compatible.
>=20
> The device-tree changes are derived from prior-art in Detlev's patches for
> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
> from Piotr Oniszczuk and Diederik de Haas.
>=20
> The register differences between VDPU346 and VDPU381 appear to be minimal=
 so
> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fil=
es
> to avoid duplicating code. There is some evidence of buffer size changes =
in
> testing which still need to be explored. If further register analysis nee=
ds
> separate files for VDPU346 the refactoring will be beyond my current n00b
> coding skills and I will either need some coaching or would be happy to
> pass the series over to a more experienced developer.
>=20
> NB: Testing with the v1 series showed lower mbps bitrate performance. This
> appears to be resolved though it's unclear to me whether this results from
> kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2=
].
> However with my current Linux 6.19-rc2 test branch [3] I'm now able to pl=
ay
> Jellyfish H264 and HEVC test media over 100mbps.
>=20
> Changes since v1:
> - Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
> - Adapt to variant/capability changes in Detlev's v7 series
> - Add bindings ack from Rob
> - Add rkvdec ack from Nicolas
> - Rebase against Linux 6.19-rc2
>=20
> [0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D10=
34794
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot=
/d
> ts/rockchip/rk356x.dtsi#L1539 [2]
> https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3 [3]
> https://github.com/chewitt/linux/commits/rockchip-6.19.y
>=20
> Christian Hewitt (3):
>   media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
>   media: rkvdec: Add support for the VDPU346 variant
>   arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>=20
>  .../bindings/media/rockchip,vdec.yaml         |   2 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>  3 files changed, 154 insertions(+)

I tested this patch series on my RK3566 board with my own test videos and B=
BB=20
(1080p60 and 4k30) using mpv with [1] patchset.

The command I used was:
`mpv --vo=3Ddmabuf-wayland --hwdec=3Dv4l2request input_file.mp4`

Both H264 and HEVC plays with minor framedrops (which to me isn't noticeabl=
e).

You can add my Tested-by:
Tested-by: Dang Huynh <dang.huynh@mainlining.org>

[1]: https://github.com/mpv-player/mpv/pull/14690

Best regards,
Dang




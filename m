Return-Path: <linux-media+bounces-42132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC2B50509
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 20:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A25B4E82C9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD41A35A2A1;
	Tue,  9 Sep 2025 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="OHLp3LY4"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50E2F4A;
	Tue,  9 Sep 2025 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441551; cv=pass; b=JpDNnL0SY7w3p5yyIbKYySU0A40ko5+6PpCpClBdU/njTM8t4wrqGjiRYMQTFgvtlv1G9lyKNs7O9pICNekDdnx7y0Dts6PaunzNmuxjBGf9O7O/lNrBFzh5eWXmWCBecVelcgXIv5rDIWO46Bzr/v6+7CV+ca/WetnkKCFs40A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441551; c=relaxed/simple;
	bh=xw1VozNTXZeKHQ32RyTRNg3FJMwm5JzEWF0aJ3O7dpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrdXyS3k3vi1O5IRvVPYgfwHFO3/EdjJD6g9NpGfSa09BYA8fywM3DTghZ1ZzteVrea53/R4BEv4X44x3K0xnRibXmGjFeYKbJk/k2evW1iBPDvA9j2tLuPrO/g83xeOFJhmu679YpoMbm3Kqd8vMDtyGQ0wgdSJdWREBDQh2C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=OHLp3LY4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757441534; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dpWZIOl8dyjvJh9h0GaO1SAsHbFVE+aSzW4HKscO1Itt2Z9O7+WZJ9CU8lLCmYduzHBUkP0hbslavy8KZnSb1sqGXc3DNEkxV5XFSl5b+M2ywb7d7zKoJKjdHyqQqbvlaxOm3rETlR31BrrJ7tERg1EVVzqkM7NNYWb4ho1FgjI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757441534; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+bs1oCfGjUtq4+1LMDaU5y3FUODLG1LyIqxGrH1KllA=; 
	b=f1eLvuAju5hiW6BdKolKA4RxmHePTZcYtoadgrtlpDiTwcE0MGUbHCQJHTiJYYwzK3I1gm1d0PIyexC6zbTb6v4/ReT4x5/HTLmEbGYD+ciS5MjN7s7zaScn7baFv0VU84En6jjL49nsmMpqewUdCFSNEYFM0gYAsEIWVQP9su8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757441534;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+bs1oCfGjUtq4+1LMDaU5y3FUODLG1LyIqxGrH1KllA=;
	b=OHLp3LY4YgktcbFiB2HD/QgV7NIaVWPaqI7FsKeSEZcMRf7QnX8SH+CYEsE1yTKb
	kdkF2iqIUafDk2Yvijwof3AEUGZMtu5EuOZ7WLI6NDjtHRzdrGgIdCiOkjQZrqIl08Y
	QV5V4p7TB0wnDhDHQo6mClBPnSVXlO5Xz7v3EoIE=
Received: by mx.zohomail.com with SMTPS id 17574415308701019.2683300901098;
	Tue, 9 Sep 2025 11:12:10 -0700 (PDT)
Message-ID: <b1d79707-59b2-4dc0-9d15-49b5ec43364d@collabora.com>
Date: Tue, 9 Sep 2025 14:12:09 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] media: rkvdec: Add HEVC backend
To: Jonas Karlman <jonas@kwiboo.se>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250905161942.3759717-1-jonas@kwiboo.se>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20250905161942.3759717-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jonas,

On 9/5/25 12:19, Jonas Karlman wrote:
> This series add a HEVC backend to the Rockchip Video Decoder driver.
>
> With the dependent H.264 High 10 and 4:2:2 profile support series
> finally merged there is finally time to send a v2 with minor changes and
> a suggested code style fix of this series. v1 of this series has been
> fully functional up until recent unstaging of the rkvdec driver.
>
> A version of this HEVC backend has been in use by the LibreELEC distro
> for the past 5+ years [1]. It was initially created based on a copy of
> the H264 backend, unstable HEVC uAPI controls and a cabac table + scaling
> matrix functions shamelessly copied 1:1 from the Rockchip mpp library.
>
> It has since then been extended to use the stable HEVC uAPI controls and
> improved opon e.g. to include support for rk3288 and fix decoding issues
> by Alex Bee and Nicolas Dufresne.
>
> The version submitted in this series is based on the code currently used
> by the LibreELEC distro, excluding hard/soft reset, and with cabac table
> and scaling matrix functions picked from Sebastian Fricke prior series
> to add a HEVC backend [2].
>
> Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for making
> this series possible!
>
> Patch 1 add the new HEVC backend.
> Patch 2-3 add variants support to the driver.
> Patch 4 add support for a rk3288 variant.
> Patch 5 add a rk3328 variant to work around hw quirks.
> Patch 6-7 add device tree node for rk3288.
>
> This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
>
>    v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
>    ...
>    Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0
>
>    Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>    ...
>    Ran 137/147 tests successfully
>
>    Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>    ...
>    Ran 9/9 tests successfully
>
> And on a TinkerBoard (RK3288):
>
>    v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
>    ...
>    Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0
>
>    Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4l2request
>    ...
>    Ran 137/147 tests successfully
>
>    Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4l2request
>    ...
>    Ran 9/9 tests successfully
>
> The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been showing
> a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request.
>
> Full summary of fluster run can be found at [3].
>
> Please note that there is a known issue with concurrent decoding,
> decoding errors in one decode session may affect a separate session.
> The only known mitigation to this is to pause decoding for some time
> and/or do a full HW reset, something to handle in future series.
I also tested on Rock Pi 4 SE (but with Gstreamer instead of FFmpeg) and 
can
confirm the same results, so, for the whole series:

Tested-by: Detlev Casanova <detlev.casanova@collabora.com> # RK3399

Best regards,

Detlev

> Changes in v3:
> - Change to use file_to_rkvdec_ctx()
> - Rename assemble_hw_rps to assemble_sw_rps
> - Use a reference to rkvdec_variant instead of copying capabilities and
>    quirks to rkvdec_dev
> - Add num_regs field to rkvdec_variant, currently not used for anything
> - Add and use rkvdec_quirks_disable_qos() helper to apply qos quirk
> - Collect t-b and r-b tags
> Link to v2: https://lore.kernel.org/linux-media/20250810212454.3237486-1-jonas@kwiboo.se
>
> Changes in v2:
> - Rabase after h264 high10/422 merge and unstaging of rkvdec driver
> - Use new_value in transpose_and_flatten_matrices()
> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> - Adjust code style in rkvdec_enum_coded_fmt_desc()
> - Collect a-b tag
> - Drop merged vdec node reg size patches
> Link to v1: https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kwiboo.se
>
> [1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
> [2] https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com/
> [3] https://gist.github.com/Kwiboo/0ea22df1c9c3f3a48479d3f7ec28169d
>
> Alex Bee (4):
>    media: rkvdec: Add variants support
>    media: rkvdec: Add RK3288 variant
>    media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
>    ARM: dts: rockchip: Add vdec node for RK3288
>
> Jonas Karlman (3):
>    media: rkvdec: Add HEVC backend
>    media: rkvdec: Implement capability filtering
>    media: dt-bindings: rockchip,vdec: Add RK3288 compatible
>
>   .../bindings/media/rockchip,vdec.yaml         |    1 +
>   arch/arm/boot/dts/rockchip/rk3288.dtsi        |   17 +-
>   .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>   .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>   .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  820 ++++++++
>   .../platform/rockchip/rkvdec/rkvdec-regs.h    |    4 +
>   .../platform/rockchip/rkvdec/rkvdec-vp9.c     |    4 +
>   .../media/platform/rockchip/rkvdec/rkvdec.c   |  198 +-
>   .../media/platform/rockchip/rkvdec/rkvdec.h   |   17 +
>   9 files changed, 2890 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c
>   create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>


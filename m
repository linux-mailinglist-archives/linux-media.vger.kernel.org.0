Return-Path: <linux-media+bounces-28434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBFA67B50
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 18:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB1642149A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 17:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC0B212B23;
	Tue, 18 Mar 2025 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b="GK9xVhLr"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20C1917FB;
	Tue, 18 Mar 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320070; cv=pass; b=l/NcBkltuNxOyatUqW4lj6Z4S99xlzS18gG+auS0/Jd81UJsFD9qWuxI6llFIRHzBbZf8/4XujWLI+falvx6nDj6ttLZhq2zXrMo5G/CtuqxAXjDscbuYmDSDdqKP5eAN2TNRDprSusBOINXeI3ylheUAL+fOoENHY9Ygr7pZDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320070; c=relaxed/simple;
	bh=UWjOkFeGjQm+LX70w9yFiZMd25NMeipaL6tDGXBhnJM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=T5w/4r5+jS3NXdSfg1dl5KLtyvtKRO5fnx8UlnyFLVMOGhjM7vyF2C7HDiBlxx9RQT5vADbLTdwm4PTxaecPDr5Kh2uT8mkpyeGPFJjX/TcrxqXik9f3iW45RK3VKY2rfLkoWn39gHBKdjJxwuvqBYO/cbiV7a/jVw9zI4z3FRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=shreeya.patel@collabora.com header.b=GK9xVhLr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1742320040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZUI7VTvWrHV1ge5QxUKg7jLA24lS3xKQLLsTR+cszhPNkADjf50CEOp6mcpnBngORgib39Ch3jWYF5izBmniMK6Zx2CsTvwisEyrmBPVFBttDjpcWHUF7pEDlhi8TMFWqNUXrdIFVmIGjsp2yQ6fkDXdsbBuN87nc83GhKnGuZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742320040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8PT3IpB2/LOiozh6p1ULOoH2S1XclfQa8VO/KYFkLiI=; 
	b=DOOBfLxLLeZOAsJRVOZxecRieMHe/+gqiRUPJ0OW9jVAd9lAQrU0oPELLPOq7bLolvADGzrsaVvKJg/YILTeiAyi03/PFHvVTbITfdsURHKxVRQ0rtxBHD1FM3lzSnRmZW0fo8U9gDG10E7OvWSk13i2q+88NPpz5sht1JO8stI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=shreeya.patel@collabora.com;
	dmarc=pass header.from=<shreeya.patel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742320040;
	s=zohomail; d=collabora.com; i=shreeya.patel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8PT3IpB2/LOiozh6p1ULOoH2S1XclfQa8VO/KYFkLiI=;
	b=GK9xVhLrmZ+RlMVzef2rEy8Us2nxLiODb3V9R6P4kc7lbaxnT18WYMoWsaKZzVBS
	WVPjlaWqtq6g06qBsQPxlCXtF4gEBhdB7ul4YgzF4dC38wPX19JTtbg9QDQkdjdySvE
	qkMfjf0KkhYv5CdoRGA0zCVgzmM8sPolg4yn+bKk=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1742320038090674.9001947899728; Tue, 18 Mar 2025 10:47:18 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:17:18 +0530
From: Shreeya Patel <shreeya.patel@collabora.com>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: "Dingxian Wen" <shawn.wen@rock-chips.com>,
	"Dmitry Osipenko" <dmitry.osipenko@collabora.com>,
	"Hans Verkuil" <hverkuil@xs4all.nl>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Heiko Stuebner" <heiko@sntech.de>,
	"linux-media" <linux-media@vger.kernel.org>,
	"kernel" <kernel@collabora.com>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <195aa5df0ad.1177aac592665581.1522789073273936352@collabora.com>
In-Reply-To: <fa5622428f071a20ca5df96218aedc84fb7edc1a.1742306464.git.geert+renesas@glider.be>
References: <fa5622428f071a20ca5df96218aedc84fb7edc1a.1742306464.git.geert+renesas@glider.be>
Subject: Re: [PATCH] media: platform: synopsys: VIDEO_SYNOPSYS_HDMIRX should
 depend on ARCH_ROCKCHIP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

 ---- On Tue, 18 Mar 2025 19:33:27 +0530  Geert Uytterhoeven <geert+renesas@glider.be> wrote --- 
 > For now, the Synopsys HDMI HDMI RX Controller is only supported on
 > Rockchip RK3588 SoCs.  Hence add a dependency on ARCH_ROCKCHIP, to
 > prevent asking the user about this driver when configuring a kernel
 > without Rockchip SoC support.
 > 
 > Fixes: 7b59b132ad4398f9 ("media: platform: synopsys: Add support for HDMI input driver")
 > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
 > ---

Thanks for the patch Geert

Reviewed-by: Shreeya Patel <shreeya.patel@collabora.com>


 >  drivers/media/platform/synopsys/hdmirx/Kconfig | 1 +
 >  1 file changed, 1 insertion(+)
 > 
 > diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/media/platform/synopsys/hdmirx/Kconfig
 > index 27e6706f84a37375..4321f985f6320611 100644
 > --- a/drivers/media/platform/synopsys/hdmirx/Kconfig
 > +++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
 > @@ -2,6 +2,7 @@
 >  
 >  config VIDEO_SYNOPSYS_HDMIRX
 >      tristate "Synopsys DesignWare HDMI Receiver driver"
 > +    depends on ARCH_ROCKCHIP || COMPILE_TEST
 >      depends on VIDEO_DEV
 >      select MEDIA_CONTROLLER
 >      select VIDEO_V4L2_SUBDEV_API
 > -- 
 > 2.43.0
 > 
 > 



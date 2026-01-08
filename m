Return-Path: <linux-media+bounces-50255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDED066D0
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 23:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD61301D5FE
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 22:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4320327BE4;
	Thu,  8 Jan 2026 22:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IP90tNMa"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C642FF169;
	Thu,  8 Jan 2026 22:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767911260; cv=pass; b=feXwR30jfkdQcGnsfiW1+SdWvbZRpJNMdm6sOBUet5RR6I5toCNYsPi9lCB/yMFEEXGJwvoP7GG2EpJJUI5+K+FO5lZKqPNuisd+kyAzXDT+1OyVsTJdrpOaLGhNpLjJ6dXIaOW1q3aQfoJ7Dm6stD6tvwy6xs2iBzL3/q7utFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767911260; c=relaxed/simple;
	bh=QhN/BHm/Ax5VZSAm+ZkgNbkfXDZ4xGF/Laj6LsUsTnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grTzty+ihkU4rIEEIVEvbYySP5grtfH6LPTfmouaqE7qdPaYKD3Sm/RYfLiLisANbZ8ztHVUtpQ4Emurh0SPuGmnNNY0TvWAVppde+76tVMwY3ZXonEnMVBIw5TpS4QMV4HrD2X8VpeMWJlbx2ufejJMhKFwQpTYZQfwyyNBjbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=IP90tNMa; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767911227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VNTNWPYOKHpVduYg+I9fZGkiF0jZOomYEFEk8IiRnIO3h/IzBH5oL/CVTuQJaEKEoxGN4+fRPiccd7PLvazU57ZADFpOUkFya+TshgpBkWaO+JC7gNPxLkGTA76ZJZpZi+6Z1qJQsYGIkLUO77KmyApGcK1mYe4FTFxD15OXNQo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767911227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/2sJs1M5dbZanY7CNtplDKqUEuHj9nm8fPuIlqAweNM=; 
	b=mM6XNi5BR+Ej0BxlYrZJE6ZWXqIaQPtZowHkOL2J6sGvp32nc+WpTFZ/sNIYI9plWgwkrmBCKCNLvl+zG3pk4Blt4Ea0HydUse6uLyP6PsUFqn58M1HoxrdIV+dOV5w4iUR+RJbu3taYZYTTsZEj6aeyk6Lj2DBfI5ajbsBLLQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767911227;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/2sJs1M5dbZanY7CNtplDKqUEuHj9nm8fPuIlqAweNM=;
	b=IP90tNMakwDoziG4RBYibguWV81pZ79FZA9ClsRCWp8smDZdqxPnYrBqg10hb8Qc
	MCvGL3J8c4XgHhM5fYduo3LUC7PDntiD45iXfC/LOsLxUolZTWLqvVg8Ki323zyqgdh
	b73rmWAiCCrAyKpNeqrxBXMnPuZlldkIGopT+CiY=
Received: by mx.zohomail.com with SMTPS id 1767911225587728.7839339366315;
	Thu, 8 Jan 2026 14:27:05 -0800 (PST)
Message-ID: <5137a45b-00c0-41be-94af-81cbcdda6418@collabora.com>
Date: Fri, 9 Jan 2026 01:27:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: support use with sleeping GPIOs
To: Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Aishwarya.TCV@arm.com, Robin.Murphy@arm.com,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260108-media-synopsys-hdmirx-fix-gpio-cansleep-v1-1-3570518d8bab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/8/26 23:08, Mark Brown wrote:
> The recent change in 20cf2aed89ac (gpio: rockchip: mark the GPIO
> controller as sleeping) to mark the rockchip GPIO driver as sleeping has
> started triggering the warning at drivers/gpio/gpiolib.c:3523 indicating
> that a sleepable GPIO was called via the non-sleeping APIs on the Rock 5B:
> 
> <4>[   14.699308] Call trace:
> <4>[   14.699545]  gpiod_get_value+0x90/0x98 (P)
> <4>[   14.699928]  tx_5v_power_present+0x44/0xd0 [synopsys_hdmirx]
> <4>[   14.700446]  hdmirx_delayed_work_hotplug+0x34/0x128 [synopsys_hdmirx]
> <4>[   14.701031]  process_one_work+0x14c/0x28c
> <4>[   14.701405]  worker_thread+0x184/0x300
> <4>[   14.701756]  kthread+0x11c/0x128
> <4>[   14.702065]  ret_from_fork+0x10/0x20
> 
> Currently the active use of the GPIO is all done from process context so
> can be simply converted to use gpiod_get_value_cansleep(). There is one use
> of the GPIO from hard interrupt context but this is only done so the status
> can be displayed in a debug print so can simply be deleted without any
> functional effect.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index c3007e09bc9f..1eaa25efee21 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -230,7 +230,7 @@ static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
>  
>  	for (i = 0; i < 10; i++) {
>  		usleep_range(1000, 1100);
> -		val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
> +		val = gpiod_get_value_cansleep(hdmirx_dev->detect_5v_gpio);
>  		if (val > 0)
>  			cnt++;
>  		if (cnt >= detection_threshold)
> @@ -2204,10 +2204,6 @@ static void hdmirx_delayed_work_res_change(struct work_struct *work)
>  static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
>  {
>  	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
> -	u32 val;
> -
> -	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
> -	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
>  
>  	queue_delayed_work(system_unbound_wq,
>  			   &hdmirx_dev->delayed_work_hotplug,
> 
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260108-media-synopsys-hdmirx-fix-gpio-cansleep-d9c8b526cabe
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


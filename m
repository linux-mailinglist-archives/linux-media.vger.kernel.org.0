Return-Path: <linux-media+bounces-24321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C0BA038C4
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 08:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C48B1640B8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 07:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117CA1DF27A;
	Tue,  7 Jan 2025 07:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="I11xgHOo"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D784C9D;
	Tue,  7 Jan 2025 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736234910; cv=pass; b=dHAx1GP4BpgnqtmhEqwATAnIsraoxeT5x3zZsmEm0xRz0xFgc9hSvEM5csRYJOH127knJVIzXX/wC7dnN73/TIRRpHeKCLfK9SnGBUp3R1zixmNf/giIFXCPOQSoJNYqwORoSGyseZs9QM6zz9niVfEwwkHNu/5mHirI/x2UJtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736234910; c=relaxed/simple;
	bh=ZjfsctGRj7JLYAlcs8F3LbxuckyzVEDF0M3T7hqgIOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh+C5v+1rlwKJzorjOP+a33mWuEtl25uGlOWJbAiE9U0dtWTjrGcpokh27D+kALm/LdbHqcVnjl/qydGTKMDNg6FOBLO1ovw6o+YG/6iAoR/l8+e8zIs/321L5ksl4wiZ8FhivtCJ6HmysltKis3Q4PHTR51Kx1/QQsQA2eZ/gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=I11xgHOo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1736234855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QXWTIpWVqxpOeg1IeOEIr6JsM+7G3I65kYd3BuGPw2DaD4EBqDAtPCzUiPfbVAb5ZnLza8qKVd+gZshlXHdLYwhz4624P1TCtV0CiQpC4zsTLQQnbxKL7+mEcQVs6bm2xs9m4Fr2nWEjimsTGpEkW7s6PZI77e1CgBXTy5dtLl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736234855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fyjpROUPKqz0yOrw3lpCO0/rz2teNQQiUnOciqqXxZA=; 
	b=a644ozs87rf4CXJ3UrMuY7xEojRKhvbFWTnYevaNZcKizu4ZfTgHqzi7MxSBmyP657wJtPgR03IGkX8VHn1OjXaF9Wc9xBk5fC4w23kCGSpeUnG1fPMAY7eDBxaUPVuhYzO59d+bjwUNJJwG/EfF7NVPYyuM7Z0e4xbDJBDjjfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736234855;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fyjpROUPKqz0yOrw3lpCO0/rz2teNQQiUnOciqqXxZA=;
	b=I11xgHOoNC2rhJ7Jol1KFQIBNVrUn1IQUZyRgQ466AtyWmW+9w3Tyo69badWKgvt
	WXAiBUUyomoo7Mj9jzemsOZyqHtZZnLWVg5DlYg+T31CZubU/TvCcyGMZcm2TohcslA
	87cJKZguiA+tVchZMuuZHi9Ye15hzkkWu7o6KOig=
Received: by mx.zohomail.com with SMTPS id 1736234853465966.2061584357726;
	Mon, 6 Jan 2025 23:27:33 -0800 (PST)
Message-ID: <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Date: Tue, 7 Jan 2025 10:27:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 1/7/25 03:08, Tim Surber wrote:
> Hi Dmitry,
> 
> that was my fault, my build script did not copy over the new ATF properly.
> 
> Now it works, I will update with test results with many different
> resolutions/formats here soon.

Thanks for the quick update, please post the results once ready.

-- 
Best regards,
Dmitry


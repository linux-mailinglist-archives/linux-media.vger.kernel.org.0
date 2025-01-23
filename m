Return-Path: <linux-media+bounces-25198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC8A1A2D8
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 12:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2403A355B
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 11:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E711920E6FC;
	Thu, 23 Jan 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="kavhcopT"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD32145A16;
	Thu, 23 Jan 2025 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631371; cv=pass; b=cVZATUCLxq2JmJEwGrvecojacf9iZu8cNVGgVSBJRIdzuNffDCMOPJkR6uuSlwHwXxxZ1ged3BHLSVZq6p2WVQTaG6RmFShSjy0wW+wkLObLyKbqpH9XBODdwYuYGMO3+wozRNx3eu6jGCSQI2AyXTpB4N3xnbXlGRbMDjJUKTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631371; c=relaxed/simple;
	bh=jVOr9SNQmPlWwygMvJvKOtQWwb+Pp03Gj2qwRMh5Bdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rknv4sUPWQzpxDrW4yleu+nfuoVyRpfoYB7VxeC508QPm3AWRTqEascQ0ty2Nau/Vm4WqUS8NKM5jcOjxaYbdUInzfk293fbXGtzHf8zesSJc/pP4e1jIIeXvMdhR9+CLbL+9kpGeA3i/hjY6ZMjze/IDvAaLEvm/g/qqpgzSlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=kavhcopT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1737631315; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YJvbM80sjDBPxamcQuyjR3dNW+7oLsMfUeBei18ZkmKSPDyjB/LnjOJnpsUd++rOGTaBmvhrXfMvYnLZ7ZQ14loAU08vUW+mr5At6X67ddGJL7f9TUSOxjPa351iMJ8lOfqzJ2z9CRGNw1T59x4TF6I5V0TruGPCI9hBPzVkWdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737631315; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RBk1ZeqWqkMzfPZglCYiALSDfj+N6We/OCFK6kR7Aow=; 
	b=KbEWVc44sdtoTblvZY5FvIo48Pop0pU4E2E9l8ReZuKYY8ZSu3t86p9bRCnXu+13uGn2N8zmnDqTAC5BA3IjZm2lxC6Ig8anzOGPR5opO0tQWNRyz5U6pDcBJN7HAAjbeuWKbCYt86/lwnZNNCay0wE81gpFFryZgJc1XZdzgAs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737631315;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RBk1ZeqWqkMzfPZglCYiALSDfj+N6We/OCFK6kR7Aow=;
	b=kavhcopT+pSgJHgsA8KeuFJKKPZ8n1ybvrL0ZnhZbJ4DJD4pzRIiEo5h9Ct6KCiN
	wKUm9yMbK4KrTPLz77O+/CR6ReUDYpAToxGE42yK8fEVcDpFTBSVE93YsOuebK4ykdS
	/xki0nFO3PSsetB1ymR3bRkLzUp3Mn0DQbAZI0HE=
Received: by mx.zohomail.com with SMTPS id 17376313084433.398115110351114;
	Thu, 23 Jan 2025 03:21:48 -0800 (PST)
Message-ID: <67fcd668-dff4-4dda-bc65-27f13293680f@collabora.com>
Date: Thu, 23 Jan 2025 14:21:42 +0300
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
 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
 <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
 <bed5f370-113f-4109-b8f4-870dd15e93ce@timsurber.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <bed5f370-113f-4109-b8f4-870dd15e93ce@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 1/19/25 05:14, Tim Surber wrote:
> Hi Dmitry,
> 
> I enabled the debug output and ran some tests again.
...
> 
> Observe the reported fps of 86 in the above log file. Also gstreamer
> reports a framerate of 214072/2475 - also around 86.
> 
> I could sometimes also create the "Device wants 1 planes" using RGB -
> replugging fixed it, but could never fix it in YUV444.
> 
> Next week I have time for more testing.

Thanks for the testing! Could you please try to test YUV using a
downstream driver stack? If it will work, then please post the
downstream kernel log. Will be interesting to compare the timing values.

-- 
Best regards,
Dmitry


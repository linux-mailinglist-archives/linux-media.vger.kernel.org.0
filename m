Return-Path: <linux-media+bounces-18481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB94983A3E
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CA3A283087
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 22:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BE3126BE8;
	Mon, 23 Sep 2024 22:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="dz4+1e7/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B31884E14;
	Mon, 23 Sep 2024 22:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727131027; cv=pass; b=Qk+OtDvU4m2TDSQtZZIjcFC/g0YPLNPhNvkfCJQPV7v4/nDsvF7NNXsyE9K0h0yWi5CVaq7iKtvJd8II3vbQZiOk2RnAa/E3EIIIrjkZTPIi5UB5e6+YZC368ndkxOoz/jMX7MQqouX4e+oaKLlFpjmeLwqJ5x9M4W3/UMBkrrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727131027; c=relaxed/simple;
	bh=u0mvGAUsuusyPrkhDzUdEAF0FETvghc3W7PmEUB5JWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU94lMrpv957eFGW38zshligKjVKibDyQSoRNKi9NN6t5D87WtyFB7zdNajcyQuruHHJXA2hnHNGkH2vscKGy9Eb/un6INNpLnD8XNJjckUSYSzaoQs2M6wgUS/Ou7Q7ANedIRH5c3Yu59tjGCaiUnYmX4IsDqWLI7kRKqS4BAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=dz4+1e7/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727130994; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=etfvqn6nE9bSw12FIbfJjgCORXBDGGvV9maXWJaQnkhh0rxOqHDnHlz7YIqv4BYx7SoLUvprqJVEcqHmzlYTkjJDJ+yUP208bEq/Kuvqt5+V7HxY+7KXSEGcNGRtfX2l3fsAlfyJ0PqnO0UpzLDWbSsRY6mUoAsfS6I1hiABPrQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727130994; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+t7REgL0vRbD5ozbKxnGHX+D3ka+R93Qijxfle7UDkw=; 
	b=caAMCQASvh6dv59R7g9ZGrEmIYXI4sXujsjyPHqcmiT1F8cQr3uPVKefSzqrcbFD5kjc8FmeRvMhlqCVfD5L3imxGm9MZoOfgjWPVXI1otXetnaa+V9Kto7NFzzI7VcuRUj/SfewxIapq7Yb+LUiEfiQWdSJIRqthqp4mdfXRfM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727130994;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+t7REgL0vRbD5ozbKxnGHX+D3ka+R93Qijxfle7UDkw=;
	b=dz4+1e7/rELveWVtwg4DVhx47h7EuwGhj6wtaSdKerqaaZFFwgcgicUrFHJtGFrN
	iUeAOyKrKgGoYWl+8U5FsfXsVwWlWAST8tkJPRcAIMaiSUFqKe7SBOT+SX6yB6LNNMw
	qamG/u3aI9vslBmysAeaBAe2+ochwSJFpcC5UBX4=
Received: by mx.zohomail.com with SMTPS id 1727130994054161.20850860095402;
	Mon, 23 Sep 2024 15:36:34 -0700 (PDT)
Message-ID: <40099a01-cac2-4b65-bb96-3dfdb106a4eb@collabora.com>
Date: Tue, 24 Sep 2024 01:36:27 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: platform: synopsys: Add support for hdmi
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <20240719124032.26852-5-shreeya.patel@collabora.com>
 <c5b9be4d-16ee-45f7-b980-d2e0e4b3ef23@xs4all.nl>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <c5b9be4d-16ee-45f7-b980-d2e0e4b3ef23@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/23/24 11:48, Hans Verkuil wrote:
>> +	val = hdmirx_readl(hdmirx_dev, DMA_STATUS11);
>> +	field_type = (val & HDMIRX_TYPE_MASK) >> 7;
>> +	hdmirx_get_pix_fmt(hdmirx_dev);
> Hold on, this changes the pixel format based on the detected video format.
> Does that mean this hardware does not have a colorspace conversion block?
> All the HDMI receiver hardware I have seen always had a CSC matrix and
> could convert between 4:4:4, 4:2:2 and 4:2:0.

TRM doesn't mention that CSC is supported.

-- 
Best regards,
Dmitry



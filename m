Return-Path: <linux-media+bounces-26460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D6A3DA84
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DD717FEED
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 12:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C681F754C;
	Thu, 20 Feb 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RoeWHZCO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD91F3FED;
	Thu, 20 Feb 2025 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056070; cv=pass; b=ZMw7h7R5WtJ32f74Yz3YAdIaeTdFcucd3VuusLKg9bFmXsoQc0msldusDWunZoFCL3IG8qocJKazKXJZ1/UQkZrTAnAWUQinyerkzCk9UwWIctEc66bqw5yXOVPff4D8+PKxt+qzzSRbWrghnj7ExPl+y32KkQ6LWLmoFSOOojU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056070; c=relaxed/simple;
	bh=J5CvJDQHpOwgRWbALGcQjiRqOO0Zlzbce36pyVTD7xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZLz/meK4jKiiWL/DvIRTav6hHkdHZT3v9dd9gOJwnEDuTDmJMvq8GFZHtbB3FKuhF6QhohEYDqjpbBNmB3KWd6z/uhbSxmnmTmy/R7zXRQLj7wplNi/snjCvOK9iN0e0Q8mQKxDENnDW1UxuHg4nmOT8PzUuV/lYkNd5d7/l7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=RoeWHZCO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740055996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R/qQr7wWyrdtX7UBgfy9V3OpdGNSna/00YuGzPVDeycnnG+3IIHgvZ9MtC0mqCetl/Qwhpx15Uc8EnFyE0nySqceeKstXDdDP6UvCwRxxpXu+paluaPOpgz2mcb+oW5nv9XbnVVfjJfKVQ8I7M7g6XaQKmFPlYqbENfMwt07UXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740055996; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f67Esv9H1xTt8XSor73BkW+OmrH1KkQDE3TlbweM+xI=; 
	b=UQRVSWrrO99KOa93GwcGWfosO0X7fYAfOyxCM8btbeB88kGwggiKsQT+zimYi4sXr30G431vC7N6BP4KGgCcu79fqgAN/MGJtORIaCvx9A/wmYNZZR/VkZSlg5GbeVJca9keMpaWYK2C/T8y43lY0XzQrWPoaddT8Ax8yGJ68+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740055996;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f67Esv9H1xTt8XSor73BkW+OmrH1KkQDE3TlbweM+xI=;
	b=RoeWHZCO2jmELKTJCR9BEryn4grgVyBkwSjDGE1Wp3ZsgYq7iEV+8MA1M+v07m6+
	gUPpj2i6ZVVVCcJqAEGL/qVFzdedCT+sqM+ZqVKxpZntGGekJBBAz2/4a/ZOoAPJ406
	kXXE1vKmqGb/rqVDZ7ITFQqXuoeV5S/b/xio4VD4=
Received: by mx.zohomail.com with SMTPS id 1740055994655425.8638948132052;
	Thu, 20 Feb 2025 04:53:14 -0800 (PST)
Message-ID: <e3c9d3b4-cf78-473e-8520-79dbf932fbe1@collabora.com>
Date: Thu, 20 Feb 2025 15:53:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
 <20250218184439.28648-5-dmitry.osipenko@collabora.com>
 <f32a0011-1653-48dd-9061-047f9009310b@xs4all.nl>
 <3fcdbd35-9ff2-4159-8076-98eefd6ed8c7@collabora.com>
 <f188dd6f-c98e-4a70-a1f0-3d205b924b78@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <f188dd6f-c98e-4a70-a1f0-3d205b924b78@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/20/25 10:03, Hans Verkuil wrote:
>> Good catch. Hardware supports 4 EDID blocks, will change in v8.
> Ah, good. Make sure you test this, both writing 4 blocks to it and read it
> from a transmitter. With v4l2-ctl --set-edid type=displayport-with-cta861
> sets 3 blocks, and type=hdmi-4k-600mhz-with-displayid sets 4 blocks. So test
> with both variants.

Tested it yesterday with reading 4 blocks from transmitter, worked fine.

The HPD change also works well with the preliminary testing.

-- 
Best regards,
Dmitry


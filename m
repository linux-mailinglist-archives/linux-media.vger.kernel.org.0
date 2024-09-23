Return-Path: <linux-media+bounces-18479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F89839E2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 01:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A8582824D2
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 22:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846D4126BE2;
	Mon, 23 Sep 2024 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="H9W4lYj9"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A22942A;
	Mon, 23 Sep 2024 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727130328; cv=pass; b=A/c1W0uRXy1kdV1Z1J74GAnou0yPBvD+DOTp15534vCF2McoWlJvAqMButKOEXypwduSvujrPD1c29nEgYPlaobTqnsYbsMuoR2gWg0raJk93QThBzaDH5BEYp8PbfeygzkQ+PJ47DMk5TpM921U/yBF4dmqSc9t4TPGKhXlsEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727130328; c=relaxed/simple;
	bh=Er1R3DujufWyloaeYQ8YJUJhozPPJ77kf3f9khDSoWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hn4irSHxpIpnIJXQu3wdCVhDpQRG7CBLHM9lEzsP6DGt4SE/XuNAWBrQnnaC151ONxB/SKJqgEIUxkwsb6hDw6UgpLWYjD3Mt5Xy0V4kw9SCktnsiH6uOaI2c5M7VL9QH+AfgXSx4udhPGA7xmC5vbk2+jgZC+LDxhSZBZoqgYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=H9W4lYj9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727130273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YfYNJdMgp/y1uP6d8OafGpncvOgQDBktKmhw/iFx6zKap/RvxnMc38P54Qum1I6bBqHHU38aERxlvKhWiiCz0nQkP8aNQeoAHMSczYlVplQVY3nlWFF3TWVtcsQ/ncNbtmESt46WJNEzNICkwsR0k6YX5/5axbj35HW8q4FTols=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727130273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1r2+YqfMcD9QvzdF/0v6a42z5qBEA9M5RklZEc7Zddk=; 
	b=NwJ16BUcMQ8fcywQ6N0XX9ONOjdjym4UIzG9ftA1QF/wvRuF2msBg0lfyWcKZQ4w9FMvjA8YnMiostY/mDOO/q90qNebvQ4lb9ibsRE4aoUKMirGghqH4m3Gqp4G6pO9GxpyXzBDxlxfLxhtslsclGixh8mnruP3D2gjWU080GE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727130273;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1r2+YqfMcD9QvzdF/0v6a42z5qBEA9M5RklZEc7Zddk=;
	b=H9W4lYj923wdFyT39nL9dzqsqpqPxWLufsdajfpDh5o/hv1Y/M3ScXCk/pfSE3vf
	nrmGXPIyz3e80r4VwzM3SmykO1RW3K59gs6JCnx4czERQPPAER+H0O2CopPn+BFGK6t
	P9eT+VuS96oN+OW/6+pttPe8tNXhlXq8fUGJJf5c=
Received: by mx.zohomail.com with SMTPS id 1727130270973625.9553539455802;
	Mon, 23 Sep 2024 15:24:30 -0700 (PDT)
Message-ID: <8239ae11-12a7-49fd-b78e-c906f3a468de@collabora.com>
Date: Tue, 24 Sep 2024 01:24:24 +0300
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
>> +static u8 edid_init_data_340M[] = {
> This should be under #ifdef CONFIG_HDMIRX_LOAD_DEFAULT_EDID, since there is
> no point to have this if you are not using it.

No need to use #ifdef since EDID array will be compiled out at a build
time. Kernel doesn't support old compilers that can't eliminate dead code.

#ifdef makes code less readable and adds requirement to build-test all
variants with/without the #ifdef, we don't want either of these.

-- 
Best regards,
Dmitry



Return-Path: <linux-media+bounces-36612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EEAF5E7B
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 18:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8B31C443A0
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25342F85F1;
	Wed,  2 Jul 2025 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="HD3tDuV/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195272F85F3
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473420; cv=pass; b=cKeiEIgG7eUPxe5FJwTC8pVIE8hyOb/eOfWAuB4fI3EMDuywwTdJd3IdNAuga27Gir9SVsAONKThDikjDMv/5ogQJ613OqsYzIOkSBw+sg6M+rOAZnkXSLsyq1P/8YCrEuciQIEEE0JbM7iGaunnqNWF+73PEJNVxQGsBYqbFCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473420; c=relaxed/simple;
	bh=967WHWnnEQSjZbNad6Y6ZVrvgSbBg8K1fm8v/TFTXxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orjcL+ORVU/0P9OE1d8Zm2jAXEcsq69WM66d8xgTqIR6Qoy0cZFwUM2xWqjxxBiHX9v3NrWKFwXr9YlCzM0KrrxBDsvXmMgzku3WP7wZQGYfZzWS8GZCVlfthgNZOlbLxpxoFnXjpyb2r7AUGdwPRbwYr5b4bKPP7IZXoNnR1Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=HD3tDuV/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1751473405; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qgy8SlrLUZcY8bDjqaWeBvIzarkkBriLjTWRbS7mAomIoAgvyxrLseyUskZigCpkCuE+IVqJI5KVWpXIjhf7E6/Kqyy4j/rEndE1EkqN88bAreOiiaY/0j5DoreGuVt1QkqYooKELz9Zt60JctPDcbOdwuzZ54QQzu2TFGhdfsg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751473405; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6JuaEf63GHcOqFuGH4DGpOblWu37TdQKYL5FNC7G8ug=; 
	b=CLG8uDW4nDnhKWJ+U+n64AuP8iipgwpL9aVIY3VMhlZvVvn67FvXW7lHFNhE/Yc0vQZcYCQTFbSFtInePuTgPXacKkdMACBqF0lKT1evwwWtNjcoMf2NorbpzQyjizL95OpuFCgUVpN0ITc1DmkLX1lrnkVYpTXuHyNbUtUi0ts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751473405;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6JuaEf63GHcOqFuGH4DGpOblWu37TdQKYL5FNC7G8ug=;
	b=HD3tDuV/5YUgNIkW8RlHNfgXw/EBP03+4CCcClirmHJ33LNNzCU7xFEZNoCizaVS
	PzjeDYnJh5PKwGuIHnvv4A0uDFmTfcfXX+idQcc5+WKpBPUyXpzxJconXz6SCR8sFzs
	qbwAJrlyR69yNYgC8Ep1Vp5/BrBw+GkDIo6XeiMQ=
Received: by mx.zohomail.com with SMTPS id 1751473402587173.86132718630392;
	Wed, 2 Jul 2025 09:23:22 -0700 (PDT)
Message-ID: <05493457-1c5a-4298-9fcf-8129b3ba4555@collabora.com>
Date: Wed, 2 Jul 2025 19:23:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "signal is not locked" with HDMI RX driver on RK3588
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <aGKFhDmBwYp5KV3k@mail-itl> <aGKXr0Z96zGU74q6@mail-itl>
 <qazkvgdtozck65s2lstvxfwplhlvf3ynm5z6c6gdpgaytja7v4@f5gsnd7urzp6>
 <aGRtTghd0MDOv01x@mail-itl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <aGRtTghd0MDOv01x@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

...
> That was it, thanks! Not it just works!
> 
> Is it possible for the driver to detect this situation and either
> adjust, or at least print some more helpful message? I would have never
> guessed to look there based on the existing symptoms...

Hi, glad it works. Potentially should be possible to detect and print a
msg. There should've been timeout errors on a driver probe with a wrong FW.

-- 
Best regards,
Dmitry


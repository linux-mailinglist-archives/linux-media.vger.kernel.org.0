Return-Path: <linux-media+bounces-31627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E335CAA7674
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4088F1C0425E
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345AF258CE1;
	Fri,  2 May 2025 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JsZFhV8j"
X-Original-To: linux-media@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D6426AD9;
	Fri,  2 May 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201051; cv=none; b=E6xAKAf5ZMy105htFHoOUpOihBxWr/RrtR6BFBAeCivDpQ0jtK6lw5q2C2oXEHMnJzoYfRwpqmSDBdacdZsL639aAbcDdGPMmbLqix6I0JD6HrfLtFVW+HjAAddi07MAleS4djqjAqKYOwrIZoLw4cVxnHALjJiH42cjkYHk0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201051; c=relaxed/simple;
	bh=uHBbvdhVZEuV/ehXAoQOuP+mnHCJrgkdC3/IAZ1c7fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSLv7JUdYht3ipkEpEsy+3AlR2/1dQozoiCY+ICi/McFTpf0m2h3UboFfewdMZ2m4K6TzJo7kG87xSPRYTGuHPljTJeq4HMqMBazz8Yf+qQHlpqlxOjDLkGkCJWE4LkeZjNg+x4c3xH7WcoaluTFgF/eZ1GsVGqOq2Id7AIG9hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JsZFhV8j; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=77t87rE0+Ie/XOv1QrJlACmGkOIthRco+3O3xhyV8iE=; b=JsZFhV8j/YfgQJyEiHmt/UjETm
	13jmvuyG8AFsMfsbqorL7m3wpda5+otymSvyk+p0Frq6+IOGPJcDaUDvXJBSzmyNi7694XRNBYPR9
	CtkZC1/TDTabiqNT55T/gWUYsB3wBv+Bmo4J2x86zgfHeMZSaxJO6XtS8Rd/3d+34+aK2Uv6wb3q1
	piSXZx5MX3E3KXZ/0ewXMLSUPoLtdcNZuClTItm0j4oDStiJ3q20JRKRfn3trVSGKtxfpJd/CGio7
	xJdJ9eghN1MVeI+PK1ep19Ka2tC16w5c7oKCy7B8zRCAsONjxe3AdadzOARCykn9eCKL5qvpt0p6y
	um0hb+7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsdk-000000051JO-39jB;
	Fri, 02 May 2025 15:49:28 +0000
Date: Fri, 2 May 2025 16:49:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Message-ID: <aBTpiMIevmAmp5vr@casper.infradead.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502100049.1746335-10-jens.wiklander@linaro.org>

On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> Export the two functions cma_alloc() and cma_release().

Why?  This is clearly part of a larger series, but you've given those of
us who are subscribed to linux-mm absolutely no information about why
you want to do this.


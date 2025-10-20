Return-Path: <linux-media+bounces-44984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9ABEFAF1
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62CD13493D0
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D842DBF69;
	Mon, 20 Oct 2025 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P+lTRvxE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B641AF0AF
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945659; cv=none; b=DaPmsRh+TvCxDECmUTZZ9MeoqjnfbUxhtvn6TL7AOFjaYVZ3Jhc/oYQWBFeUHohVUFi7/wBN9CQ9g6LJWGwGpRd4tWDk2Y7dPx43rgI6inuqzpcu/IN0yulkhSrUSQ3fbvV0EnHO7CKs10ltvyvkPSIKXyDbjcs57Us66c8E19c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945659; c=relaxed/simple;
	bh=Wlc9i48wbTK+xDL32vSFbsdMWj5vR2h0m2lMN4Nw0y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Ni5O15Mpsp5PKfif4QxVlh9XiYNhCRFfW/ee5gsddG5P53I/0dq2GhgatSkof51Fql3VVt7tVhuRhUKEXNC30/qBqKPZmgdNMVCqkxF6p1vHJ+GQPACIk6xG6KgcJH31RKeTpK/UYGzrkvuKbrqH1c09iTaPbBbOnbKR5By5WyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=P+lTRvxE; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251020073409euoutp014be3240005b1aa23a6b9f0d94dcde97f~wIr0VSnEA1706317063euoutp01t
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:34:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020073409euoutp014be3240005b1aa23a6b9f0d94dcde97f~wIr0VSnEA1706317063euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760945649;
	bh=5jPe1TQ+RTWIFGnSXXnbJc2Zb5Jf83DVrW561/+LfIc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=P+lTRvxELWeJLOXzGL/y1DV6KLek7L5rBwePdZV0FsJElZxA3PC5vSPCdRVWEvhW7
	 f895KSgpS+nf2B1CiGw5D5MEuVP6ZKV0NZFB6i5AdWYlsA5q1iEXiu5MnRZZbsm+FJ
	 CSvB6uGuwHRy3mx9rSoHYE52V2HLyulHwvZ0RrXw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020073409eucas1p1efafedfbe9cb2fb2a4cf4c774843aa9a~wIr0C-OLs1383513835eucas1p1J;
	Mon, 20 Oct 2025 07:34:09 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251020073409eusmtip1585557832218c8bf9795f009574a46a4~wIrznbpty0533405334eusmtip1L;
	Mon, 20 Oct 2025 07:34:08 +0000 (GMT)
Message-ID: <84133573-986d-4cc8-8147-246f0da34640@samsung.com>
Date: Mon, 20 Oct 2025 09:34:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: videobuf2: forbid create_bufs/remove_bufs when
 legacy fileio is active
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans
	Verkuil <hverkuil@kernel.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251020073409eucas1p1efafedfbe9cb2fb2a4cf4c774843aa9a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
X-EPHeader: CA
X-CMS-RootMailID: 20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d
References: <CGME20251016111208eucas1p24cd8cc1e952a8cdf73fbadea704b499d@eucas1p2.samsung.com>
	<20251016111154.993949-1-m.szyprowski@samsung.com>
	<36cfec0a-3717-4b0e-adc0-6887e6b58f44@collabora.com>

On 20.10.2025 09:11, Benjamin Gaignard wrote:
>
> Le 16/10/2025 à 13:11, Marek Szyprowski a écrit :
>> create_bufs and remove_bufs ioctl calls manipulate queue internal buffer
>> list, potentially overwriting some pointers used by the legacy fileio
>> access mode. Simply forbid those calls when fileio is active to protect
>> internal queue state between subsequent read/write calls.
>
> Hi Marek,
>
> I may be wrong but using fileio API and create/remove API at the same 
> time
> sound incorrect from application point of view, right ? If that not the
> case maybe we should also add a test in v4l2-compliance.

Definitely that's incorrect and v4l2-core must forbid such calls. The 
standard reqbufs/qbuf/dqbuf API is also forbidden. Extending 
v4l2-compliance tools is probably a good idea. I also wonder if its a 
good time to add a kernel option to completely disable legacy fileio 
access mode, as it is not really needed for most of the systems nowadays.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



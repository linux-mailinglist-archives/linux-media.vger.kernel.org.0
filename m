Return-Path: <linux-media+bounces-12533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88698FB6A8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 17:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71E7D280F38
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 15:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAE21420C9;
	Tue,  4 Jun 2024 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B0V77K2m"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03F214374C
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513806; cv=none; b=qKlc29RG8ZA+/xWD7vkmMFk1oheSgL+p/1GT7jDnoI1diwj8EgjBYsnkKtYjNx4fhK8eh7WSqihisx/3gf9ccTC8JtZNHJtlMl/zMDFf17mtEjFYivxzQuk5CYljLIBje/ZeFTq2dxoau9doL/ItY6t3NSRk+vPYqbA4abR1s5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513806; c=relaxed/simple;
	bh=0wjpesqaw4Z77maUPAeq6MLUlGmhAe3sgjygvPF/LW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RNb1Y8VzZqlkcX1lzavJaEzwLqT6GZ+4A4fT3Ua3/jT7L4t8rtUwngYLvhcW/aMEDIAQTkqYKl/LVZz48pLxI92quvgGZZ9iCnQhnhvJXvFUHu0aQORgdOsUkjZLX6x1R2Fu4UC11+GcpDCkEqoN7o0TzIlyXJjiuH91CEm6b7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B0V77K2m; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454FA0UR039631;
	Tue, 4 Jun 2024 10:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717513800;
	bh=ITES4K3gQT42LEcGcGvfilhXaG/tNMfWK78/31jIi/0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=B0V77K2mdlHjt2pyoJN7KuNp9vP4eoSFryj5+fVsr9vFwJqzm/MLpRPsXY5FsEgF8
	 kclWbeHi97skH9NoCke6UTPFx2YkXkDE1VBDi/z2kDOwDsNXdBYrip3kRO2Chv1gs3
	 RufXk51GJH5/7ixPt0IVr9eGpXYEHTe9X7v/gHbQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454FA0wR066780
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 10:10:00 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 10:10:00 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 10:10:00 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454F9wGA095185;
	Tue, 4 Jun 2024 10:09:59 -0500
Message-ID: <d574d8e4-0bff-69aa-a4c8-305b5418defa@ti.com>
Date: Tue, 4 Jun 2024 20:39:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL FOR 6.9] Imagination E5010 JPEG encoder
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>
References: <20240309151528.ayphvdpnj2crvycv@basti-XPS-13-9310>
 <a6652d2e-8fb7-4532-bb98-62c22aeec07c@xs4all.nl>
 <c8b0fec1-db0c-445d-a60b-e1d33bf4cc46@xs4all.nl>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <c8b0fec1-db0c-445d-a60b-e1d33bf4cc46@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Hans, Sebastian,

On 18/03/24 20:11, Hans Verkuil wrote:
> On 18/03/2024 2:43 pm, Hans Verkuil wrote:
>> On 09/03/2024 4:15 pm, Sebastian Fricke wrote:

[...]

>> The other two patches are OK, but since a v7 is needed anyway, I'll
>> add a few comments to patch 3/3 as well.
> 
> Actually, patch 3/3 has some issues as well, esp. regarding the selection
> API.
> 
> Note that I recommend that you test the selection API before posting a
> v7, since it is clear that it has never been used since it currently
> always returns -EINVAL.
> 
> Regards,
> 
> 	Hans

Just wanted to check if the latest series [1] looks ok to pull in as I had
fixed the cropping related issues and implemented API to export reference JPEG
tables as part of v4l2-jpeg.c itself as suggested by Hans along with
kernel-doc upgrades.

There has been no major changes in v4l2-jpeg or jpeg driver (e5010-jpeg-enc)
related code since last 3 revisions as no comments were received, so just
wanted to get your opinion on this.

[1]: https://lore.kernel.org/all/20240604105402.2258395-1-devarsht@ti.com/#r

Regards
Devarsh


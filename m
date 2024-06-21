Return-Path: <linux-media+bounces-13902-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA7911F62
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 10:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6221C22796
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 08:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE6816DEA8;
	Fri, 21 Jun 2024 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZaUs2T40"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F3B16D9D9;
	Fri, 21 Jun 2024 08:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718959956; cv=none; b=VYhrKAtLV61m9VEnA8AEtHTldLnUUNYw+NbgaOocUOE+Mbm/FB3Dh3tNChsKwPeh0M67Rk9Nk86s04gwnXj8KJCwNNrEsawV/Wo39FlpDc6iz5PHv/I9ywunKbXvU4M76gix+1KleVTZQoLpTFOoYQQg+jYY/EePwB5WSH5mVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718959956; c=relaxed/simple;
	bh=XUPgZRc7Ta7oH6EIynHqMqYwufey9HztEnlLZxu2Awg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FV4aTRppspwnPSC6rbvce4coCSFEFRuNcML5aQhi/lTJ2siqYwG65LtF8xU6kzYCMdcb+1VwL/6Uzz8mAohIcP0MuTehFM1t8wMKudu7zb917T7E2uaWlE8sbXmlsdXc7z/R7oNYjmeSVPyNzs1yVR2oGuLmOdwhAi9YNTTSlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZaUs2T40; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45L8qCKE118153;
	Fri, 21 Jun 2024 03:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718959932;
	bh=rN5v7uY3PMeSoDtnJhh+lfEw9upw15azmYDqHH25tlc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZaUs2T40xblbdrl2+6VOwYPMZQ0ZarbL+O6qzXg//4X2m6ywSlP4KSHght68NyFku
	 eUW1My81+ynUel0VYiAnq0Ew8+8gZoAPu1Z81IDzEqZ9/ccHtvLa7iAOAx+aRRaMPc
	 yy1vkcXIx720cC6GCR1Ki3SzUbf4THQgyy0pnQ2w=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45L8qCJJ066492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 03:52:12 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 03:52:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 03:52:11 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45L8q6BR044615;
	Fri, 21 Jun 2024 03:52:06 -0500
Message-ID: <02462e7e-bd55-2374-10e2-240e9d94c5db@ti.com>
Date: Fri, 21 Jun 2024 14:22:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 03/13] media: v4l2-jpeg: Export reference quantization
 and huffman tables
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
        Markus Elfring
	<Markus.Elfring@web.de>
References: <20240607131900.3535250-1-devarsht@ti.com>
 <20240607132831.3551333-1-devarsht@ti.com>
 <59866428-342b-4ba4-a7c7-2df1477aa7e6@xs4all.nl>
 <e948cea7-d5c7-a7e6-d921-ad7c2f93cd5a@ti.com>
 <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <904289bb-96a0-4a0d-9046-96acd8843b98@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sebastian,

On 20/06/24 12:32, Hans Verkuil wrote:
> On 19/06/2024 16:19, Devarsh Thakkar wrote:
[..]
> I've reviewed v14 3/6, so Sebastian when Sebastian posts a new PR I can process
> it.
> 
> Ignore any reviews by Markus Elfring, he's a troll.
> 

Just wanted to check if we are good w.r.t V14 [1] and it's possible for you to
create a PR with V14 as discussed above?

[1]: https://lore.kernel.org/all/20240618193651.2771478-1-devarsht@ti.com/

Regards
Devarsh


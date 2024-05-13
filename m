Return-Path: <linux-media+bounces-11407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5052D8C4159
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C292281817
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006C81509B6;
	Mon, 13 May 2024 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A6ajshkX"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40573502;
	Mon, 13 May 2024 13:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715605492; cv=none; b=Q0vlPuBGCK31OGIlxrsPLmful05OqcYgGFrt7Lkdo3VIgpr5ZOqHdKwNpyakqbQFiRt20B7Pq48II2U27pBgr0nJc2nK8nE5Y5fIBvlV3xHzUB/R5d+SGU3YmpnimAsJHJkcg2pYtphlrjL/5XUtOdrylLRbjBPhMzFb6VGFUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715605492; c=relaxed/simple;
	bh=7UCTCALAcwJZy/zFSv4mMa5RQSyTJwukKVfzBqwvx10=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BfAGmSqvDMzou9C6PPP0x0xBajIS+SVL303BCHjxETvdgOs9Y+PlvK3mWQ3/duSTovi7PrIv0A0bfmOGS3nomz5xmQ+uD4iQbVH2Xbvx5HuPP202AyFILQNJDuQ6ItsnwrkQQ8D8BJF7JJjqLWbaHmZmzZHyxNrykRfi5L9KzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A6ajshkX; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44DD4SOU117576;
	Mon, 13 May 2024 08:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715605468;
	bh=ev5eSmS3thwVNeY1xnA3bMkVddacaqfahgCUWZ2n/54=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A6ajshkXex93BSA4K+rTjGlUXN0Qz4i7jsHMGlobqLBPTGOKa6SsZNPI/O/cvwrDJ
	 xwy3fMkUbZ+cdlksV1YqmU+o/+1eXGoQSqnK9RCYTm/oBdBlNYH5DNOTNdRqEagbcq
	 EeF2Ss9vU5dWYQaS9n9L4T0Ljz7dAjqKw8yby9Uc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44DD4S44061240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 May 2024 08:04:28 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 May 2024 08:04:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 May 2024 08:04:27 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44DD4Kf9109966;
	Mon, 13 May 2024 08:04:20 -0500
Message-ID: <d63ae19c-9316-3a4c-e9ed-1672ace068b6@ti.com>
Date: Mon, 13 May 2024 18:34:19 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
        <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
 <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
 <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
 <ZkIG0-01pz632l4R@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZkIG0-01pz632l4R@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

On 13/05/24 17:55, Andy Shevchenko wrote:
> On Mon, May 13, 2024 at 04:55:58PM +0530, Devarsh Thakkar wrote:
>> On 13/05/24 14:29, Andy Shevchenko wrote:
>>> On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
>>>> On 10/05/24 20:45, Jani Nikula wrote:
> 
> [...]
> - align naming (with the existing round*() macros)

I think round_closest_up/round_closest_down align already and inspired by the
existing naming convention used for round*() and DIV_ROUND_CLOSEST() macros in
math.h as explained below (copied from my previous reply [1])

"Coming back to naming, this is as per existing convention used for naming
round_up, round_down (notice the `_` being used for macros working with pow of
2) and DIV_ROUND_CLOSEST (notice the work `closest` used to specify the answer
 to be nearest to specified value)"

But do let me know if you have any other suggestions for naming?

> - add examples into commit message of the math.h patch

Agreed
> - add test cases (you need to create lib/math_kunit.c for that)
Agreed.
> - elaborate in the commit message of the IPU3 change what you posted above
>   (some kind of a summary)
Agreed.


[1]: https://lore.kernel.org/all/ZkIG0-01pz632l4R@smile.fi.intel.com/

Regards
Devarsh


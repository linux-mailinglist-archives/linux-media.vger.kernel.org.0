Return-Path: <linux-media+bounces-13930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E742C912559
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 14:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B10F283A4F
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209EC152E04;
	Fri, 21 Jun 2024 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Otn3IBKR"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C51514F3;
	Fri, 21 Jun 2024 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973139; cv=none; b=Pr0lFPtRKNxpFL29qLBxd/hg/L9OXF+nHo2iZFj5GhEBnT7GDZQBE35qx4KF/RZXk0OeEN9J1ZwZIeyeOYOZ7KNyKDmUxMrF5eIjGgB+vzAAS+ZUN/4oqcLB5lD2yWrmJx/j9zyh+2WPMxkwq8E2E4S0mqd9Nv5129pJYZGgbmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973139; c=relaxed/simple;
	bh=V44OKae8BKk0nDRrIxC+yaM61dIqQKFep4kq4C25E9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h2NGmyV6ScbmloFE5eb4uHUaDHOv5tQosURjYz6JNsCJLLP5Wgmy4XYDaISij9IA4p8c/vE87eLwiJLpeaV/SAnJa6L+3HpdPhVJOfwWQYnE/1Ek/aYlWOEc0ft2GKMN+OfYx7Zpa78y+291umARsLH/Cvkrd5C3RR25BU76k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Otn3IBKR; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LCW5mB119829;
	Fri, 21 Jun 2024 07:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718973125;
	bh=p6/zGIGi3elNgmwAGdH3xR/gSEWIHPKZHo0vK5pmIiY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Otn3IBKRT4V13UUwWYxu6UHN1xhZuv36VfqtenQLHD0RibyNippWi5hPFg3DUIQUw
	 t34ve61B6j7v5EhWyLazdOGhfO/Yac0EJhVgofhQf7CJmgz72KY7opmssBGapaocIx
	 5k5eC23vAXy6C4LUMpTy0IjzoO/nNq6UaOLh3O5o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LCW5Sa054652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 07:32:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 07:32:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 07:32:04 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LCW08m079412;
	Fri, 21 Jun 2024 07:32:01 -0500
Message-ID: <147fddd4-0f73-0546-b73e-d8e2326bfb2a@ti.com>
Date: Fri, 21 Jun 2024 18:01:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "jackson.lee"
	<jackson.lee@chipsnmedia.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
        Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Aradhya <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Nicolas,

On 20/06/24 23:02, Nicolas Dufresne wrote:
> Le jeudi 20 juin 2024 à 19:50 +0530, Devarsh Thakkar a écrit :
[..]
 > Imagine that userspace is going gapless playback, if you have a lets say
30ms on
> forced suspend cycle due to close/open of the decoder instance, it won't
> actually endup gapless. The delay will ensure that we only suspend when needed.
> 

Shouldn't the applications doing gapless playback avoid frequent open/close of
the decoder instance too as it will add up re-instantiation (initializing hw,
allocating buffers) and cleanup (de-initialization and freeing up of buffers)
delay for each open/close respectively ? Even in case of scenario where
resolution of next stream is different than previous, I guess the application
can still hold up the file handle and do the necessary setup (stream
off/stream on/REQBUFS etc) required for re-initialization ?

Regards
Devarsh


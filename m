Return-Path: <linux-media+bounces-28841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B0A72DB3
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE070169849
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384C920E6E5;
	Thu, 27 Mar 2025 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bMNlag4u"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED820C032;
	Thu, 27 Mar 2025 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743071089; cv=none; b=aSUMUy9sXbnx1jERpULnJQVJXSjEkxJVhG3JEgARvmbkTC+WxstlPw1BEWc2PQv/cvWzJsW0SqPK2L1pwIkqKi8vO6IZq+Ijo8urE8E/K2IGQ4N9pCLALQblKM4ARDNiVQefy5FsLBHsAqQkLJmJUAKeBP7BKyqs/sJUPwBLi9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743071089; c=relaxed/simple;
	bh=DsbXRcE3uB6DKz7Gg8lLqtEEX0d/S4O49cHK6BSoJQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aJst25Go+W2K2GQ/szvK1Dhdf1YM1ogdiRPxqCDiZlQ15HiJl2rmd9g4KdWrD1L1oIabCpeBhKtX4IEivY3TEGVC5TJjNnzA1LCJPNXRA8YDEPBTSRTzC2sucUgB+k7Z/aExYxJKqAkEYhCPQ58O2Ku4iPgJtJw37gVB+EYqnNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bMNlag4u; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RAONwW1826231
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 05:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743071063;
	bh=bPUPV905JI+jJQdIhqTPvxK0yMjk04lBg/pPQomUnNY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bMNlag4uzNuZZGlj7Vlox1efNwTAH6MaqEfDP6epYJvVuq/OEC/NWz4FbRL2+L+5D
	 kmwryIlUN2A7n+29qXhQuuJiaxBHaMOozsS3jb5Gq3d+3QOjvIiX+kaDzQMEeO87v1
	 CLRJ3w4PjJkbFpoFzDJCnocH+pUiXVC4qH69RGL0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RAON4k117628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 05:24:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 05:24:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 05:24:22 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RAOJS6011061;
	Thu, 27 Mar 2025 05:24:19 -0500
Message-ID: <d60edfe6-a1c9-4e2c-8bc0-d2a3120d1605@ti.com>
Date: Thu, 27 Mar 2025 15:54:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
To: Jai Luthra <jai.luthra@ideasonboard.com>,
        Jai Luthra
	<jai.luthra@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans
 Verkuil <hverkuil@xs4all.nl>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
CC: Rishikesh Donadkar <r-donadkar@ti.com>,
        Vaishnav Achath
	<vaishnav.a@ti.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
 <20250324-probe_fixes-v1-4-5cd5b9e1cfac@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250324-probe_fixes-v1-4-5cd5b9e1cfac@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 24/03/25 17:31, Jai Luthra wrote:
> Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
> Cadence CSI2RX maps port numbers and pad indices 1:1.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 4d64df829e7585b6e305651f3ff9bdd008508ec5..b489967563cde96ac109c44a665b30e573125721 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -477,6 +477,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
>   
>   static const struct media_entity_operations csi2rx_media_ops = {
>   	.link_validate = v4l2_subdev_link_validate,
> +	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
>   };
>   
>   static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
> 


Return-Path: <linux-media+bounces-8864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A589D1E9
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 07:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EDA01F223AF
	for <lists+linux-media@lfdr.de>; Tue,  9 Apr 2024 05:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDCC657D4;
	Tue,  9 Apr 2024 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="IAFTK/4q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta10.mxroute.com (mail-108-mta10.mxroute.com [136.175.108.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7A56742
	for <linux-media@vger.kernel.org>; Tue,  9 Apr 2024 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712640511; cv=none; b=QKG6ntkbYErhHSEwxqXk3yxBk3+C3LAFdCR0TR1ddQqlxj17q9S0JYns4UhfFmshx0bFW++tOfPPrSUui+AzXVy/9NSn/AQlk3DrrY/5PMTlIrzo0uf8gO4OkOte3knWG+f6/qp2lGz1KkTv1eZPZpHqC7/Yr14MH8A6DNe2R28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712640511; c=relaxed/simple;
	bh=8c0Qz860G3WkAb0AcWN5WjJC35eH3MG32MPUl0qvQRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWlaIx/3cTSq7H2wsGRx499Q4J5piMMQChukQp5MsoUu/YltcYx9IY4O/hQ/AiX7qdRZhERCrdKWgVwYh4g+758pDGn+Z1dGRoRIM0CAe8NwhF1Hbn+1vl8isNKDPz/OlIA+s02CNPrAPVO39ObzwNkw86DnchqDfd8fZQajNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=IAFTK/4q; arc=none smtp.client-ip=136.175.108.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta10.mxroute.com (ZoneMTA) with ESMTPSA id 18ec14f805f0003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Apr 2024 05:23:16 +0000
X-Zone-Loop: c6a5f987e73b180bea968f37b464d7c471eae104802a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E4MKkW6f1nSRZdtxgNHT1iqRYe28mUV0vTu6PYIA7AU=; b=IAFTK/4qWYzi0uoH+gzXRH277M
	szUC1vHKbVHJD93VaP8lYVj7chkg2INkU9P3Twn8j5bvPr5tLsgB39GExHcDqmi5eL/twM0E7zQAa
	vOEsfdAFAlJGt2o5IfIXHXi6t9iN4G4MYhCNas1emwK2+Yl7qHV746HCf8kvAUg1/FLR0v7UsAqdv
	S577OjtwYuYwhlvxIoQkcQfdV1Ti5wFJ8aj3UEsBF8dn6r810HgKxE9nepl3ikqGR528RMTdRVm1P
	M06VNj0ujBzCTMxqBnKEzgIJoc+oiTKaSkde7FVqhN0G7cKnNmG92NeiBkXxdTYlinJQ52sai+WA1
	/QtIQjyQ==;
Message-ID: <11326ea0-51fb-445c-bae3-f16c40af87a3@luigi311.com>
Date: Mon, 8 Apr 2024 23:23:12 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/25] media: i2c: imx258: Add get_selection for pixel
 array information
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-12-git@luigi311.com> <Zg2kHYc6kdiZEAFD@duo.ucw.cz>
Content-Language: en-US
From: Luis Garcia <git@luigi311.com>
In-Reply-To: <Zg2kHYc6kdiZEAFD@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 4/3/24 12:46, Pavel Machek wrote:
> Hi!
> 
>> Libcamera requires the cropping information for each mode, so
>> add this information to the driver.
> 
>> @@ -116,6 +124,9 @@ struct imx258_mode {
>>  	u32 link_freq_index;
>>  	/* Default register values */
>>  	struct imx258_reg_list reg_list;
>> +
>> +	/* Analog crop rectangle. */
> 
> No need for "." at the end, as it is not above.
> 
>> +	struct v4l2_rect crop;
>>  };
> 
> If the crop is same in all modes, should we have it in common place?
> 
> Best regards,
> 								Pavel

I gave this a try similar to what was done on imx219 but its having
issues and makes a bunch of changes to the following patches so we
might need to hold off on that change for now.


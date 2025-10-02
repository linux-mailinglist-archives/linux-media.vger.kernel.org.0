Return-Path: <linux-media+bounces-43647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B21ABB4110
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63403B757C
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103D331196B;
	Thu,  2 Oct 2025 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Eq3CemXE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5273279DD3;
	Thu,  2 Oct 2025 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759412199; cv=pass; b=R5NAZQlQs/ZRAZGjIQ3t4wdgOq3GVT2FWCN6LhGpTVMQxnm9zlsG5Qunos6Mq6KW2xS2yXCB7j/woea29nicdS7L7psKTE2REO7SS++/L0PESiG9+v6hsr74Cf7XQxiz7hdguDhjNYqmkq2uXFmrooD8XqSDH6A+yyyLfvJ3Rgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759412199; c=relaxed/simple;
	bh=ulNeW/tfFAp3cya83JiFVTYb9ntDnFuCCL0T5uhRick=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVsNxmSSrQybwsqq5M/wiazees010EIPDcxSVFtp8wnCuFyMKGSxtB+foCYah9DLQEIT1M78Z8dg/CE7c4C8xQFv8agnxAHBgkMmiV8ZoI6FdS8L4hy16q9IxWd27TrMACANhmYXIY9hf4z6njIwQBkAkFUpgPYD3nxNThwKtDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Eq3CemXE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759412170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kqUIds6O1TiQ+WdAH9jvW7Z64Jr2CMZV/pido18x7cmJSd5Zm5552ediXflMgRoySHIoIFz7YRLb2yfD1QUWZ989nhTKFNZuk8+u/sCtGFvxTTrPm8ikKnT99U5Fq6bCIpwhFBUzTaurQ50sft0plSGf3vlwx4tzefu+XSmrs9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759412170; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dtSH7DMz3FFMPjGi9FtB/ixalkTfGUEAj0h124xRoog=; 
	b=SzB44dS1gjxhZmpYJ4t+HTI6leH/9Z77F4ZLH8V7N8lsDMcwsArR7PohkJ6o4pRj307dl6A/CyoFFEGcu8YcruFIhRs9mgoUfhzvDMcGjhkOBezHNcZS8lVyycldLUf8djHgZHSrugdmLRTIG0hwcppGuogHKwsEL8+/tnwBEbI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759412170;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dtSH7DMz3FFMPjGi9FtB/ixalkTfGUEAj0h124xRoog=;
	b=Eq3CemXEpZVjh8awik3RWGFgcivKMwIT7ghfdMMVIiiR7JeKYPfwQKVflZXET/X3
	xNckTwiwvc0Oj+LSPN678eKF+qkDFCKn91hA55ugIKJ21E7okQJHgIHV1exRC1k2UMK
	2CbVS4P9eSmRyrADSB+K25GQNx8PnNutCoyrQ9Sw=
Received: by mx.zohomail.com with SMTPS id 1759412168085227.19275215267555;
	Thu, 2 Oct 2025 06:36:08 -0700 (PDT)
Message-ID: <bb66bc81-2b20-48bb-87bd-6c34b35f4cd8@collabora.com>
Date: Thu, 2 Oct 2025 16:36:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: synopsys: hdmirx: Detect broken interrupt
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, jose.abreu@synopsys.com,
 nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com, kernel@collabora.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251001175044.502393-1-dmitry.osipenko@collabora.com>
 <do3p4ncc6issxwqam3oeo54xtoi6jvw7maeprdbfkdn3b3aabr@ilwktxqyf4ap>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <do3p4ncc6issxwqam3oeo54xtoi6jvw7maeprdbfkdn3b3aabr@ilwktxqyf4ap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 10/2/25 16:18, Sebastian Reichel wrote:
>> +	*val = status & PHYCREG_CR_PARA_RD_DATA_MASK;
>> +
>> +	return 0;
>> +}
> Do you expect this to be used in other places in the driver? In that
> case there should probably be some locking, since the hardware interface
> obviously cannot handle concurrency. Otherwise maybe add a comment,
> that the function may not be called if concurrency is possible?

Don't expect this function to be used in other places and haven't added
locking on purpose to keep the code cleaner. Will add the comment.

Thanks for all suggestions.

-- 
Best regards,
Dmitry


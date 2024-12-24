Return-Path: <linux-media+bounces-24034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B1B9FBD76
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 13:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1FC16615C
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B2D1D63DC;
	Tue, 24 Dec 2024 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="NFw8nGV4"
X-Original-To: linux-media@vger.kernel.org
Received: from pv50p00im-ztdg10021201.me.com (pv50p00im-ztdg10021201.me.com [17.58.6.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C594B1BC9E6
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735043829; cv=none; b=QpytKgEUy3v00PH7LuXR5RwnPz1RSDuwznTgPlsKvYalJC0Q8B5iu7fhCiwHevu+/MsbgRw+1fCVQnpZKVU9VKJfitptiWDOqx7ZOTXIfqdXMqOvgbNTiRKMjiIZP5D4pBRebSBUQHEWcrcNbLHBS+X83ds22jR5H3RQIRzoFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735043829; c=relaxed/simple;
	bh=Y2aWjrUlygVLOASMCiCstQK+MExRxhb4eTy19Yziwd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGSeCOrvMHx8dYG61uMrYhQEdFBM2litqG8jDcG9aiYJQ6TTJ+l0I5GSXQ6DcHdU6M+zguxbedId/kP8Jvgyh+L1hMKAxr1PItuJ3iaoPKtSY8tBWALPukXOQhXCv5xsH+G9cuGnYFehUjZmsl8b8C8fOcxPm8uEa5GNIAa0RJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=NFw8nGV4; arc=none smtp.client-ip=17.58.6.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735043825;
	bh=Gc2WCxVDa+xL90LnfPEoTmxwnPsFBGQJFu6/HAU7lKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=NFw8nGV4mMSulnri61yzK+qJGcy9/Ch+dsuJHrKfVwVsiimtCnAG3h8rFHRxp+Uyz
	 upQRA6wkcAq6UoCdHY35JVRQ8fAMwi0fFRWx45ifLIDKIpYYNfnCXbGxhfEOaQYXsR
	 1vp17v6CL5aedV5Ya9jk+HyrT7k0UWB64khbCMphdv/pxVqrNG01HpV70G71hkXLci
	 t2DsBn5eAui7bmqHM/lylU/XqVzY8Fkjio57aPrnWpZ6YDIPQmlxL9eysloKkBj+Wn
	 CHNdKt4EUe+nfzoaAy+0w9w20JbbblWFRe+AQzyMxBHNEYMWVIIso0RplKSOHi0f8w
	 fzQi63k6MyURg==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021201.me.com (Postfix) with ESMTPSA id 14C393118B4A;
	Tue, 24 Dec 2024 12:36:26 +0000 (UTC)
Message-ID: <b69310bb-0e95-4706-a43d-569e4a1b104e@icloud.com>
Date: Tue, 24 Dec 2024 20:36:04 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: fsl-mc: Constify fsl_mc_device_match()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-3-583cc60329df@quicinc.com>
 <20241223202635.00005a0a@huawei.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241223202635.00005a0a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/24 04:26, Jonathan Cameron wrote:
> On Wed, 11 Dec 2024 08:08:05 +0800
> Zijun Hu <zijun_hu@icloud.com> wrote:
> 
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> fsl_mc_device_match() does not modify caller's inputs.
>>
>> Constify it by simply changing its parameter types to const pointer.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> Similar to previous patch, I'd say why you are making this change.
> There are may places in the kernel where pointers are constant but
> not marked so. Why does this one matter?  
> 

thank you for code review.
make sense.
will correct comment message for this and previous patch in v5.

> With that info added
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>



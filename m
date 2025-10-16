Return-Path: <linux-media+bounces-44702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57ABE2B76
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 12:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA4A4547EE5
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 10:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66B032862D;
	Thu, 16 Oct 2025 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SE/hmiK2"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120232860C;
	Thu, 16 Oct 2025 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609484; cv=none; b=VBf4z9qBp/HhavOkiAbSapQRjEpa+ENr6vAp0hDbw4S8QBhC6oTCQLiT/KLyB9H3H8PvdkixZ4VQ0DM6tJB/nPKAcYw3OxscvVxa7nOUkeVtqAjR3DlQcOeTRaLte3WT1A3UMn8wI2lnEF/6R6DljVP8+VPTMUsbKE4AGDnfgYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609484; c=relaxed/simple;
	bh=k2NpyI9RmFby/yaqAAqwGJeOocMBe7R2rRobxSohU14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVKJAFCBZ1JECJfre4hiGxaafQLyWmBZT/vbe6l+FDbI7GUOlVd8YlEacwANO5tdIcB7w8kx8Zb8PZThPWuQvTHJT0Cw1CIgbwuevQNm3UclC1AeDQIUWvLKt5dfOoofzs246X/KgrpI7w21kmk/MoyxotJvwkNlmXcVwet87kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SE/hmiK2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cnNyY5TKcz9tfn;
	Thu, 16 Oct 2025 12:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760609477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/tOjK6pACwAgNC2kmOtml/HInlThyeM9X9FND8NF44=;
	b=SE/hmiK2ZWwrXfDW5vM1H5yLCRlREMu6lhTShQr/X4/KzvN4Yi2H8KAX8zpyqNIdAkpg3h
	1u6RNFxp0v25XF/YtCqnkL2R3vo0m2nzfpWVlCO8PlTT8zfXYtKAFC5120bF37N6ZA4Y72
	3m1Yw9D41WaBREoR2YnqOC3hzkBHtQ+CL2yNaqKe5cD8OLTH5Qmnx96zZMBqM4JfM+O5aY
	HXkgjHY0UZ4jQ4hQoo8u0cN1Hn5OQsSzL5G0Jrw7LdyZbxf9pM5lnwzLPkgfSCGI3eNL8+
	KnCuqoO6iCPaXXYB6W/vME9lETfq5psX6LLzyJb8xU7m1Pjp5ZhWCecdO6Dn5Q==
Message-ID: <cd2764e1-b966-4f00-82a2-4e6f65605523@mailbox.org>
Date: Thu, 16 Oct 2025 12:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [EXT] Re: [PATCH v2 0/8] Add support for Wave6 video codec driver
To: Nas Chung <nas.chung@chipsnmedia.com>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, "jackson.lee"
 <jackson.lee@chipsnmedia.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <f03d0ae0-d28b-4b06-8f63-9d06f15c0522@mailbox.org>
 <fcfa00b5ae102d76b02ce1667d27822e6d2c3c81.camel@ndufresne.ca>
 <472aac3c-9d3e-4892-8d6c-665fa6793464@mailbox.org>
 <59e87d8e346bb16b225382b9a4500e1b16bbf776.camel@ndufresne.ca>
 <PAXPR04MB825499BA447B4000AB8329A6E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
 <2c431e9a-9e2f-4583-bf03-142b56439a47@mailbox.org>
 <SL2P216MB12469FADA7A4A6872D1C5D05FBE8A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <efa2f3e6-fa36-48a3-a85a-68c7c1335ba5@mailbox.org>
 <SL2P216MB1246CB5B9EA0A6A63236FE19FBE9A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SL2P216MB1246CB5B9EA0A6A63236FE19FBE9A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 15deb012ddd5bedb724
X-MBO-RS-META: kuc5pb669abqccebs9xefxjoenf5gw49

On 10/16/25 6:01 AM, Nas Chung wrote:

Hello Nas,

>>>>> Would you please share the stream to me? I want to test this
>> resolution-
>>>> change case too.
>>>> How can we proceed with the wave6 driver upstreaming ?
>>>
>>> Patch v3 was posted before you replied to v2. I plan to post v4
>>> shortly and will include your Tested-by tag.
>>
>> Can you please put me on CC with this email address ?
> 
> Sure, I’ll add you to CC on future revisions.
Thank you


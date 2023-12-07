Return-Path: <linux-media+bounces-1799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20B80835B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 09:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC301C21CC2
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 08:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357DF15AF4;
	Thu,  7 Dec 2023 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ssr8Lzq5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FAA126
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 00:41:47 -0800 (PST)
Received: from [192.168.1.105] (unknown [103.251.226.79])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25C39674;
	Thu,  7 Dec 2023 09:41:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701938465;
	bh=93l+9CL07fUHXweF9htomsrCAQvCW+NUdbeYY60Y0hU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ssr8Lzq59teWKgbWcSKaCTt5hKewYBK/knFCQmPXH/+fSwmPFw+uoIcOMuEJ/wvyo
	 hx8lmXjN/qFPjXdHgqHkUJWcW5m7Be49qtUn6VESn/hKESZh7VLDZfKSnzzoIy6F4o
	 TmmVZInywWis1Ho7gZalFYWt3LzoKlJ6mClEhkl8=
Message-ID: <855cd4ee-86db-ca46-ce91-17303941ff82@ideasonboard.com>
Date: Thu, 7 Dec 2023 14:11:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/4] staging: vc04_services: Drop vchiq_log_error() in
 favour of dev_err
To: Stefan Wahren <wahrenst@gmx.net>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-2-umang.jain@ideasonboard.com>
 <d6bf7115-dd15-43a0-b45a-41fc778ff160@gmx.net>
 <6a8566c0-bd26-4ec1-9f7d-d58bbed8411c@ideasonboard.com>
 <3920385c-3c10-471a-ba82-8e48ba34f6a5@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <3920385c-3c10-471a-ba82-8e48ba34f6a5@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan

On 12/7/23 3:04 AM, Stefan Wahren wrote:
> Hi Umang,
>
> Am 06.12.23 um 06:27 schrieb Umang Jain:
>> Hi Stefan
>>
>> On 12/6/23 1:02 AM, Stefan Wahren wrote:
>>> Hi Umang,
>>>
>>> Am 05.12.23 um 09:41 schrieb Umang Jain:
>>>> Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the 
>>>> usage
>>>> of dev_err() directly.
>>> sorry, i missed to review the last change. So the change won't be that
>>> trivial.
>>
>> All the changes you said are valid and I have taken a note of it.
>>
>> However, I think it would best that if we can address them in a
>> separate series on top of this (and I will do it). It would seem to be
>> streamlined on top of this.
> i would address the comments as separate patches and then finally
> convert the trivial rest with such a patch within one series. This
> avoids unnecessary changes and reviewes. But that's just my opinion.
>

Series is merged by Greg KH (Thank you).

Do you have more comments on 3/4 and 4/4 or are they waiting on your 
review queue. Let me know so that I can prepare a follow up series in 
-one- go.

thanks!
> Best regards



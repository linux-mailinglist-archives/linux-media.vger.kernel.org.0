Return-Path: <linux-media+bounces-20617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA829B72A8
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 03:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E0928627B
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 02:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BD012B169;
	Thu, 31 Oct 2024 02:55:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6D28FD;
	Thu, 31 Oct 2024 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730343342; cv=none; b=mG0eHlcx1+SokYjdNKRjbjROg+dikZOpC+BrYETzA24RI0/wEk+VEbor4+zUUviiGyWgXuqUNNw4pDMP+sMSgzGtGO+O9fDLpD6WS6TOd2YA/qMNV1alo4XRn3TsdvYrwSe0gMF62+wMQrHE3x3TZcWPpz/vJlWqF+8bSbNrxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730343342; c=relaxed/simple;
	bh=V1ru9kbpWbdYQLQJ6nQHcjECAv1prCmomVFeX3cp9LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QRLThexzMhU0qnIaTn2I2BI/oMab7iSnBYjsjupTkZuO/HuZGIQ03Kyvs1r26/magvmK7w+8oVzBWlaacg7oHF5PlBxDF8EHxWld2orFqwJPX00DoEb9/x2ci9iM1XNZ51JAYvQzPRzwE0GrZbuMG5AIjvcTnsDeTH6HLWTMvxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Xf7rz421Jz4f3lWD;
	Thu, 31 Oct 2024 10:55:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 236DC1A018D;
	Thu, 31 Oct 2024 10:55:34 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP3 (Coremail) with SMTP id _Ch0CgAHmMSk8SJnEbekAQ--.51106S2;
	Thu, 31 Oct 2024 10:55:34 +0800 (CST)
Message-ID: <65b9f7d8-e245-4788-8f21-ae143b6ce6a2@huaweicloud.com>
Date: Thu, 31 Oct 2024 10:55:32 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: gspca: ov534-ov772x: Fix off-by-one error in
 set_frame_rate()
To: Jinjie Ruan <ruanjinjie@huawei.com>, hverkuil@xs4all.nl,
 mchehab@kernel.org, moinejf@free.fr, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241028080256.3537188-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20241028080256.3537188-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgAHmMSk8SJnEbekAQ--.51106S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF47CFW3tF47WF4fJr17trb_yoWDtrXEk3
	ykJr12934Dtr1SyF15t3y8ZFyj9ay7WF4kWF1Fqw1fXa9rJwn3AFWq9wn5W3ZrW3WagFZ7
	A3s8XFnFv3ZrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jjVbkUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2024/10/28 16:02, Jinjie Ruan wrote:
> In set_frame_rate(), select a rate in rate_0 or rate_1 by checking
> sd->frame_rate >= r->fps in a loop, but the loop condition terminates when
> the index reaches zero, which fails to check the last elememt in rate_0 or
> rate_1.
> 
> Check for >= 0 so that the last one in rate_0 or rate_1 is also checked.
> 
> Fixes: 189d92af707e ("V4L/DVB (13422): gspca - ov534: ov772x changes from Richard Kaswy.")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/usb/gspca/ov534.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
> index 8b6a57f170d0..bdff64a29a33 100644
> --- a/drivers/media/usb/gspca/ov534.c
> +++ b/drivers/media/usb/gspca/ov534.c
> @@ -847,7 +847,7 @@ static void set_frame_rate(struct gspca_dev *gspca_dev)
>  		r = rate_1;
>  		i = ARRAY_SIZE(rate_1);
>  	}
> -	while (--i > 0) {
> +	while (--i >= 0) {
>  		if (sd->frame_rate >= r->fps)
>  			break;
>  		r++;

It looks fine to me.

Thanks,
Ridong



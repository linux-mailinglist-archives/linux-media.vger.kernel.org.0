Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37AD2CA5E8
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 15:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391613AbgLAOjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 09:39:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40354 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391368AbgLAOjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 09:39:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1E32E1F44B45
Subject: Re: [PATCH] media: rockchip: rkisp1: remove some dead code
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <X8TrSj3PbqVtN5XQ@mwanda>
 <a6d9660f-84ec-317d-c3aa-9b3bda595d49@collabora.com>
 <20201201142754.GI2767@kadam>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <cedd1dd1-36c5-ff63-4092-e5f6b40e6286@collabora.com>
Date:   Tue, 1 Dec 2020 11:38:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201142754.GI2767@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On 12/1/20 11:27 AM, Dan Carpenter wrote:
> On Mon, Nov 30, 2020 at 11:20:05AM -0300, Helen Koike wrote:
>> Hi Dan,
>>
>> Thank you for your patch.
>>
>> On 11/30/20 9:53 AM, Dan Carpenter wrote:
>>> The debugfs_create_dir() function never returns NULLs.  It's not supposed
>>> to checked for errors in the normal case and there is no need to check
>>> in this function so let's just delete this dead code.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>> index 9af137e4967f..68da1eed753d 100644
>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
>>> @@ -430,10 +430,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>>>  	struct rkisp1_debug *debug = &rkisp1->debug;
>>>  
>>>  	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
>>> -	if (!debug->debugfs_dir) {
>>> -		dev_dbg(rkisp1->dev, "failed to create debugfs directory\n");
>>> -		return;
>>> -	}
>>
>> I was taking a look at the debugfs_create_dir() code, and I saw it can
>> return ERR_PTR(), so ideally we should check for errors with IS_ERR() / PTR_ERR().
> 
> Debugfs functions aren't meant to be error checked in the normal case.
> There are some drivers which dereference the dentry pointer so those
> need to check it but that's not very common and isn't the case here.

right, I just saw the functions in inode.c already checks the parent with
IS_ERR(). the debugfs_create_*() function calls start_creating() which
already checks the parent.

ok, fair enough, I'll ack v2.

Regards,
Helen

> 
> I'm really sure this must be documented somewhere but I can't find it
> at all.  :P  But look at commit 057e212eae72 ("media: usb: uvc: no need
> to check return value of debugfs_create functions") for example.
> 
> regards,
> dan carpenter
> 

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B0CCE741
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbfJGPTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:19:39 -0400
Received: from mx1.riseup.net ([198.252.153.129]:37102 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727589AbfJGPTj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 11:19:39 -0400
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 46n40B1fMKzFbVf;
        Mon,  7 Oct 2019 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1570461578; bh=B/wjUazqCOSjbEbddfs83rC4QMZYfe6E9mjutAgJbTw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SNYlfR67zrjSwWfDNagWhNpxLUuE/cTL+DCPqTqBi2KH3yYZcvpvtHiwDDYnWco06
         bvH4yt688AfPguCMWO19d9cbVT6wucesA2r6dfkYIbEgrKzH6IV7SLB5p8BR265xIm
         5SG8lS7hr+2oZncM3H3XjhuIzve34rnInNwpA3Q0=
X-Riseup-User-ID: 01931AB61FBB974FA3DBE2730C8CD81BFFB103CBB3E31D7C10E68AB6336803B7
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by capuchin.riseup.net (Postfix) with ESMTPSA id 46n3zz2mt8z8tqM;
        Mon,  7 Oct 2019 08:19:26 -0700 (PDT)
Subject: Re: [Lkcamp] [RFC PATCH] media: vimc: vimc_pix_map_fmt_info() can be
 static
To:     Helen Koike <helen.koike@collabora.com>,
        kbuild test robot <lkp@intel.com>,
        "Carlos E. C. Barbosa" <climacobarbosacee@gmail.com>
Cc:     linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
        kbuild-all@01.org, Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20191005211136.552305-1-carlosecb@tutanota.com>
 <20191006002805.i2gbquub7egjczhx@332d0cec05f4>
 <28ba4406-c231-e589-2eeb-bca5da5d3245@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeida@riseup.net>
Autocrypt: addr=andrealmeida@riseup.net; keydata=
 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 mNGb
Message-ID: <28f23bab-4284-cb45-579f-32fd6b78c3e1@riseup.net>
Date:   Mon, 7 Oct 2019 12:18:04 -0300
MIME-Version: 1.0
In-Reply-To: <28ba4406-c231-e589-2eeb-bca5da5d3245@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 10/5/19 10:36 PM, Helen Koike wrote:
> Hi Carlos,
>
> On 10/5/19 9:28 PM, kbuild test robot wrote:
>> Fixes: 4d124d159dff ("media: vimc: get pixformat info from v4l2_format_info to avoid code repetition")
> Usually, the Fixes flag is used for something that is already accepted in mainline.
> If you want to fix anything in the previous version of the patch you sent, you should update the last patch
> and re-send it as a new version, i.e. [PATCH v2], adding a change log just after the 3 dashes to explain
> what you changed.

The author of this commit is the "kbuild test robot" rather than Carlos,
it was generated automatically to fix a warning the robot found at
Carlos commit :)

> Check this example:
>
> https://www.spinics.net/lists/linux-media/msg158251.html
>
> Let me know if you need help!
> And thanks for working on this :)
> Helen
>
>> Signed-off-by: kbuild test robot <lkp@intel.com>
>> ---
>>  vimc-common.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>> index 9ea698810e1a1..c37442aba70b1 100644
>> --- a/drivers/media/platform/vimc/vimc-common.c
>> +++ b/drivers/media/platform/vimc/vimc-common.c
>> @@ -118,7 +118,7 @@ static struct vimc_pix_map_fmt vimc_pix_map_fmt_list[] = {
>>  	},
>>  };
>>  
>> -struct vimc_pix_map vimc_pix_map_fmt_info(struct vimc_pix_map_fmt *vfmt)
>> +static struct vimc_pix_map vimc_pix_map_fmt_info(struct vimc_pix_map_fmt *vfmt)
>>  {
>>  
>>  	struct vimc_pix_map vpix = {
>>
> _______________________________________________
> Lkcamp mailing list
> Lkcamp@lists.libreplanetbr.org
> https://lists.libreplanetbr.org/mailman/listinfo/lkcamp

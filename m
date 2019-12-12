Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F18E11CC49
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 12:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbfLLLeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 06:34:05 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54363 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729014AbfLLLeF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 06:34:05 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fMjIiZATUGyJwfMjJixvan; Thu, 12 Dec 2019 12:34:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576150442; bh=OKCpeFi5DoqJE6NWtMpQWIWKvSSGpGz8TupfDamuRC0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QQm1tvnXMaB8eQETcibkZHG7cfU5QXrNBF/Q0VRxwwq8FBPNFHPt+dbW1AL0ycKoB
         +zdJ4rnY7wYgb3lk4KIBiMaCnIWwvC98bay09Gsldwar8O0UbaB6Iyn5noITuYjs8h
         lnsC9fT7v8MP9QDCvDthuXoT0+SJlHHPUfWwxk+qQFBi+K6oAoM06f/wy0LSBoAeLk
         CqJqA7JNziaiXfN4hB7wL0ZvefHZeK8HiTSt3gfGXXSwDDQ3WrXbdxRRK84fPx/eSD
         yQYEs3E4lX4SdN8otglq5jvNvNxsqSY+1Cw0bghqACVNtwDz5K9sy+FLDMxxyNn2OU
         GMZfvnqogyfGQ==
Subject: Re: [PATCH] media: imx7-mipi-csis: Add the missed
 v4l2_async_notifier_cleanup in remove
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Chuhong Yuan <hslester96@gmail.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
References: <20191209085828.16183-1-hslester96@gmail.com>
 <20191211105908.dw4lnuble3ejlnil@arch-thunder.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5013c486-3713-6e40-49a1-2fe452ba254f@xs4all.nl>
Date:   Thu, 12 Dec 2019 12:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191211105908.dw4lnuble3ejlnil@arch-thunder.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKETIfBTI/Tow7zgY3i+e6lZwyq1XB1sOoDGL8WE5K6A7cM4MbKL9xtk6FSy+6hw3TL/fvtm1yzilRaba0DZeD7w7P4Kc3Zs1u1f2esQgam74drqWtoK
 KiuoQjq2rRiEH8UYJ54YWrx/9ExmJC/5pkAOY2pfs7sKtEvOKUsTQpvI1QF4QPf9fkGRvvLogtojkUxleao9rKMmO1lbK0O2JHpyTAEDBGWh12vzRsstU8YV
 azp2JXso9caELQQRsQYLVUa39eRzOR060Tzucn4GWvPTPhWdewD7IkSzB21EHyPyxRlWh2SwqtL5ZzKlonq/+XyUs/UUvbbCBl6P/n26Dt51PRL6kd76U16L
 OgwaEtNoijOrKalJdxgfFNZed9tWyeRWC/UwFnIwwvo5t++uaNSjgOF77f4+HP2DwivU+1Nc4Ge7mP+DTHHReA8cX7CwKOAu64tAQnRP10VY63mGitE1MuDK
 Ug7OJrn/4AaDINufittAK/Nf+trKMTrGkeqbX5sAAnDycM1u7p8jqT87DrSbV/Z8Zf5FfqpFxHLQotMFGLL5fdJ58WP6tfKFsQcXJ9gcMDy/s6wUDQH5J93h
 bNinzyLZUbqSYJ9aXSUcxM4a3LY1RATlOkQuHt5o5cAPW9XWxN7PGzh0vEa/eV325orLMRjZaylWOYBQ4S9iEPsRJ8rxmV8/3tXIFQIDJTFCtgUHyvDXWu9A
 FclNahOMPGQ=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Steve, Philipp,

I'd like one (or both) of you to look over this first.

It looks as if the subdev_notifier field of struct csi_state is never used,
except by the existing v4l2_async_notifier_unregister() call.

If I am right, then the real issue is that that field should be removed.

Regards,

	Hans


On 12/11/19 11:59 AM, Rui Miguel Silva wrote:
> Hi Chuhong,
> Thanks for the patch.
> 
> On Mon, Dec 09, 2019 at 04:58:28PM +0800, Chuhong Yuan wrote:
>> All drivers in imx call v4l2_async_notifier_cleanup() after unregistering
>> the notifier except this driver.
>> This should be a miss and we need to add the call to fix it.
>>
>> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> 
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> ------
> Cheers,
>      Rui
>> ---
>>  drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
>> index 99166afca071..2bfa85bb84e7 100644
>> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
>> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
>> @@ -1105,6 +1105,7 @@ static int mipi_csis_remove(struct platform_device *pdev)
>>  	mipi_csis_debugfs_exit(state);
>>  	v4l2_async_unregister_subdev(&state->mipi_sd);
>>  	v4l2_async_notifier_unregister(&state->subdev_notifier);
>> +	v4l2_async_notifier_cleanup(&state->subdev_notifier);
>>  
>>  	pm_runtime_disable(&pdev->dev);
>>  	mipi_csis_pm_suspend(&pdev->dev, true);
>> -- 
>> 2.24.0
>>


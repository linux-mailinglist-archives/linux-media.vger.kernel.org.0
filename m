Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF30268671
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 09:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgINHs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 03:48:27 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53667 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726154AbgINHsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 03:48:23 -0400
Received: from [78.134.51.148] (port=41466 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kHjDi-0007bu-2M; Mon, 14 Sep 2020 09:48:14 +0200
Subject: Re: [PATCH] media: imx274: add support for sensor mode6, 1280x540
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200909105328.92598-1-eugen.hristev@microchip.com>
 <20200911214441.GG834@valkosipuli.retiisi.org.uk>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <de057619-f314-58d8-2000-aad0cd052bba@lucaceresoli.net>
Date:   Mon, 14 Sep 2020 09:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911214441.GG834@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/09/20 23:44, Sakari Ailus wrote:
> Hi Eugen,
> 
> Thanks for the patch.
> 
> On Wed, Sep 09, 2020 at 01:53:28PM +0300, Eugen Hristev wrote:
>> Add support for the mode 6 for the sensor, this mode uses
>> 3/8 subsampling and 3 horizontal binning.
>> Aspect ratio is changed.
>> Split the bin_ratio variable into two parts, one for
>> width and one for height, as the ratio is no longer preserved
>> when doing subsampling in this mode.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
>> ---
>>  drivers/media/i2c/imx274.c | 89 +++++++++++++++++++++++++++++++-------
>>  1 file changed, 73 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
>> index e6aa9f32b6a8..5adb11f036e2 100644
>> --- a/drivers/media/i2c/imx274.c
>> +++ b/drivers/media/i2c/imx274.c
>> @@ -147,8 +147,9 @@ static const struct regmap_config imx274_regmap_config = {
>>  
>>  enum imx274_binning {
>>  	IMX274_BINNING_OFF,
>> -	IMX274_BINNING_2_1,
>> -	IMX274_BINNING_3_1,
>> +	IMX274_BINNING_2_2,
>> +	IMX274_BINNING_3_3,
>> +	IMX274_BINNING_4_3,
> 
> This enum is unused (apart from the useless use of the first value). Please
> remove it (may be a new patch).

I agree.

[...]

>> @@ -454,7 +498,8 @@ static const struct imx274_mode imx274_modes[] = {
>>  	},
>>  	{
>>  		/* mode 3, 1080p */
>> -		.bin_ratio = 2,
>> +		.wbin_ratio = 2, /* 1620 */

s/1620/1920/

[...]

>> @@ -906,14 +963,14 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>>  		}
>>  	}
>>  
>> -	*width = cur_crop->width / best_mode->bin_ratio;
>> -	*height = cur_crop->height / best_mode->bin_ratio;
>> +	*width = cur_crop->width / best_mode->wbin_ratio;
>> +	*height = cur_crop->height / best_mode->hbin_ratio;
>>  
>>  	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>>  		imx274->mode = best_mode;
>>  
>> -	dev_dbg(dev, "%s: selected %u:1 binning\n",
>> -		__func__, best_mode->bin_ratio);
>> +	dev_dbg(dev, "%s: selected %u:%u binning\n",
> 
> I think the earlier message suggested it was ratio. How about "x"
> instead of a colon?
> 
> Apart from these looks good to me.

LGTM too.

-- 
Luca

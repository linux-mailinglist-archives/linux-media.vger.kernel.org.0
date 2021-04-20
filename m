Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE123659F8
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhDTN1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 09:27:00 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51975 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230479AbhDTN07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 09:26:59 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id YqOVlY6oT8K3KYqOZlznDf; Tue, 20 Apr 2021 15:26:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618925187; bh=50zN6jHkPuxp9L3ujyX5x9OPv5AguVws8p9ZJjv94uE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bZjKvnrCl5IcPPunwd2kjHL/ymYberZ92eiIsNmtfxMa/zHp4+rh+bRsUhq8VBqt/
         MN7hGMT9FgSC6Xzy5q5lp/Vcx/sgdOXEhopUiKnyGx/dCTdkbN/4orjGBVu9AAEFJW
         iDNypSJXqUAQbWFI7brukNzBlGubTumjRSIFrdB82x7htbKVkMkY4nkjzhe83uKwM1
         dVZGtAXKcXJXBbZsfM2m67IjDOHG99k9JJ//16XdhdA+CgpRHs1fcZ52slW1eQXdcK
         02RJMBIAnz4GR0UmyJ70A3cnl7+szvaICGdkyCuI9WLbrCtsqxyRITEdrmZ641fGgB
         m0bt1oKatexhg==
Subject: Re: [PATCH 5/6] staging: media: atomisp: fix CamelCase variable
 naming
To:     Fabio Aiuto <fabioaiuto83@gmail.com>,
        Deepak R Varma <mh12gx2825@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <cover.1618859059.git.drv@mailo.com>
 <17478627f128cdafed389b64ecf389d319295dd4.1618859059.git.drv@mailo.com>
 <20210420083902.GB1411@agape.jhs>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7f678812-29d3-5f14-c8de-ea2d97861973@xs4all.nl>
Date:   Tue, 20 Apr 2021 15:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210420083902.GB1411@agape.jhs>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGwSi1uTK6RqZ5fdE3zUIGapjb9gu7G8wIHdOvB6tf9S34sjU+VM4iFGJZu+DHJbhI+Vs11G3euX+wWUPS4n3Aqe26MBfzxDEobncoX3ltjcd/DzyXSs
 BiZw9NMuxU3vIfW4d5kQnAm7YbP097SDrzECZDNhDTzIKqPk2mVg6DBg84EB6IeER2ObT4LDV0lHfMQN0eom02QBlvWoFiJwS0lDQCCgmGxHsp7SxCctQTn4
 bAE/uvlI02sRaMJfgu+CKMQlvdLSbhe/c54ebZT7/PO6R5iPHavyjxPs3aN0kox1gbWxxit3XO98h1pDaj3cUrha0yDn3P6dPxS9d6bVGeukGOBGWdKWUDdy
 copcLoXoD/DABApWWSVRRm3T7LBe/fnfCDwge8yRk3LVzQ0zVTOoW3D9qADSsZDQWmDigs2ScIMgI7lcbWfdXq5gy2XdwuCYNBO4n8QaxTFyJK96cUA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2021 10:39, Fabio Aiuto wrote:
> Hi,
> 
> On Tue, Apr 20, 2021 at 12:45:57AM +0530, Deepak R Varma wrote:
>> Mixed case variable names are discouraged and they result in checkpatch
>> script "Avoid CamelCase" warnings. Replace such CamelCase variable names
>> by lower case strings according to the coding style guidelines.
>>
>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>> ---
>>  .../media/atomisp/i2c/atomisp-mt9m114.c       | 62 +++++++++----------
>>  1 file changed, 31 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> index 160bb58ce708..e63906a69e30 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
>> @@ -999,10 +999,10 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
>>  	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
>>  	int ret = 0;
>>  	unsigned int coarse_integration = 0;
>> -	unsigned int FLines = 0;
>> -	unsigned int FrameLengthLines = 0; /* ExposureTime.FrameLengthLines; */
>> -	unsigned int AnalogGain, DigitalGain;
>> -	u32 AnalogGainToWrite = 0;
>> +	unsigned int f_lines = 0;
>> +	unsigned int frame_len_lines = 0; /* ExposureTime.FrameLengthLines; */
>> +	unsigned int analog_gain, digital_gain;
>> +	u32 analog_gain_to_write = 0;
>>
> 
> this patch is made of multiple logical changes, i.e. more than one
> variable at a time are renamed. Maybe this should be split in
> one patch per variable name.

I'm OK with this, it's pretty readable and obvious what is going on.

Regards,

	Hans

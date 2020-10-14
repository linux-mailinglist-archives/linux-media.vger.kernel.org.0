Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B36E28DA55
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 09:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgJNHPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 03:15:00 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55726 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgJNHO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 03:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1602659693; x=1605251693;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rqxdSHcFf8lHYa3InJJDqQ9oyq71E3A/0dQIVgjykVQ=;
        b=Fu9GgYPE8g3fMLW8RSsTmisu9uHKmOwfQCKOg2EqOdcNkdfVT/cFH8r7eQpYbh72
        4YbFjfg2Zaf1PU0GfQ2v+wnzh8BqovPJTkDOxFEnSZFZJ3MV1b+23KcmVYLJvcv3
        EQ2kqkyoaLHiRxldYM65semGxEtFHZhsFS+WJKVUgMM=;
X-AuditID: c39127d2-269ff70000001c25-a5-5f86a56d9b0a
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0B.7D.07205.D65A68F5; Wed, 14 Oct 2020 09:14:53 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020101409145357-603813 ;
          Wed, 14 Oct 2020 09:14:53 +0200 
Subject: Re: [PATCH v2 5/5] media: mt9p031: Fix corrupted frame after
 restarting stream
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dirk Bender <d.bender@phytec.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-5-s.riedmueller@phytec.de>
 <20201002000549.GK3722@pendragon.ideasonboard.com>
 <3c8853a6-de34-014d-d10a-d6a55083c4bf@phytec.de>
 <20201005130831.GR3931@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <b479cfef-6342-107a-1dcf-1b7b32872de0@phytec.de>
Date:   Wed, 14 Oct 2020 09:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005130831.GR3931@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.10.2020 09:14:53,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 14.10.2020 09:14:53
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHLMWRmVeSWpSXmKPExsWyRoCBSzd3aVu8wfq52hadE5ewW1zeNYfN
        omfDVlaLZZv+MFl82vKNyYHVY3bHTFaPTas62TzmnQz0+LxJLoAlissmJTUnsyy1SN8ugSuj
        7eAe1oInahU7JsxjaWBcIt/FyMkhIWAi8fbeSaYuRi4OIYFtjBLnj95mhnDOMErc//WRsYuR
        g0NYIFLizSMXkAYRAQuJ3kXTGUFqmAV2MEpsWHMLqqGPSWLKkv9MIFVsAk4Si893sIHYvAI2
        EjeXgRRxcrAIqEpMnbKVCWSoKNDQnTssIUoEJU7OfMICEuYUsJc4ciIa4rgrjBL3FodB2EIS
        pxefBZvCLGAmMW/zQyhbXOLWk/lMELa2xLKFr5knMArNQjJ1FpKWWUhaZiFpWcDIsopRKDcz
        OTu1KDNbryCjsiQ1WS8ldRMjMA4OT1S/tIOxb47HIUYmDsZDjBIczEoivK+k2+KFeFMSK6tS
        i/Lji0pzUosPMUpzsCiJ827gLQkTEkhPLEnNTk0tSC2CyTJxcEo1MNammvK9bWpb9FY5k/39
        o1nX+yRMmJSF/ZW/MLCVsYtMOdZlHlk/4bn+zZ+5c/98uq6TuviHcN+urKYTHTPNo/sb0i/1
        5RwVONq8olr8isuze2UtX1lXRCuG7bhsJsL4X13b/9bVoNeX4w9v4j+Ue+E5a9tt2Q0rD/Gd
        P1ZcmGj1jVXzp1fvBCWW4oxEQy3mouJEALW8jwhxAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 05.10.20 15:08, Laurent Pinchart wrote:
> Hi Stefan,
>=20
> On Mon, Oct 05, 2020 at 11:28:21AM +0200, Stefan Riedm=C3=BCller wrote:
>> On 02.10.20 02:05, Laurent Pinchart wrote:
>>> On Wed, Sep 30, 2020 at 12:51:33PM +0200, Stefan Riedmueller wrote:
>>>> From: Dirk Bender <d.bender@phytec.de>
>>>>
>>>> To prevent corrupted frames after starting and stopping the sensor it's
>>>
>>> s/it's/its/
>>
>> thanks, I'll fix that.
>>
>>>> datasheet specifies a specific pause sequence to follow:
>>>>
>>>> Stopping:
>>>> 	Set Pause=5FRestart Bit -> Set Restart Bit -> Set Chip=5FEnable Off
>>>>
>>>> Restarting:
>>>> 	Set Chip=5FEnable On -> Clear Pause=5FRestart Bit
>>>>
>>>> The Restart Bit is cleared automatically and must not be cleared
>>>> manually as this would cause undefined behavior.
>>>>
>>>> Signed-off-by: Dirk Bender <d.bender@phytec.de>
>>>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>>>> ---
>>>> No changes in v2
>>>> ---
>>>>    drivers/media/i2c/mt9p031.c | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>>>> index d10457361e6c..d59f66e3dcf3 100644
>>>> --- a/drivers/media/i2c/mt9p031.c
>>>> +++ b/drivers/media/i2c/mt9p031.c
>>>> @@ -80,6 +80,8 @@
>>>>    #define		MT9P031=5FPIXEL=5FCLOCK=5FSHIFT(n)		((n) << 8)
>>>>    #define		MT9P031=5FPIXEL=5FCLOCK=5FDIVIDE(n)		((n) << 0)
>>>>    #define MT9P031=5FFRAME=5FRESTART				0x0b
>>>> +#define		MT9P031=5FFRAME=5FRESTART=5FSET		(1 << 0)
>>>> +#define		MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET		(1 << 1)
>>>
>>> The fields are named Restart and Pause=5FRestart, I would drop =5FSET. =
Could
>>> you also sort them from MSB to LSB as for the other registers ? Using
>>> BIT() would be good too, although this could be done as an additional
>>> patch to convert all the existing macros.
>>
>> I'll do that. Also I will rename the register to MT9P031=5FRESTART and t=
he
>> bits to MT9P031=5FFRAME=5FRESTART and MT9P031=5FFRAME=5FPAUSE=5FRESTART.
>>
>>>>    #define MT9P031=5FSHUTTER=5FDELAY				0x0c
>>>>    #define MT9P031=5FRST					0x0d
>>>>    #define		MT9P031=5FRST=5FENABLE			1
>>>> @@ -483,9 +485,25 @@ static int mt9p031=5Fset=5Fparams(struct mt9p031 =
*mt9p031)
>>>>    static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsubdev *subdev, int e=
nable)
>>>>    {
>>>>    	struct mt9p031 *mt9p031 =3D to=5Fmt9p031(subdev);
>>>> +	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(subdev);
>>>> +	int val;
>>>>    	int ret;
>>>>   =20
>>>>    	if (!enable) {
>>>> +		val =3D mt9p031=5Fread(client, MT9P031=5FFRAME=5FRESTART);
>>>
>>> Do you need to read the register ? Can't you write
>>> MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET and then MT9P031=5FFRAME=5FPAUS=
E=5FRESTART=5FSET
>>> | MT9P031=5FFRAME=5FRESTART=5FSET ? And actually, can't we just write b=
oth
>>> bits in one go, do we need two writes ?
>>
>> I think you're right we don't necessarily need to read the registers. The
>> only other bit is not used by the driver.
>>
>> But I think we do need two separate writes, at least that is what the
>> datasheet states.
>>
>> So I would drop the read but keep both write, ok?
>=20
> That's fine with me if required, although I don't see where this is
> indicated in the datasheet, but I may have missed it.

It's in "Standby and Chip Enable". There is a Sequence for entering soft=20
standby with two separate writes:

REG =3D 0x0B, 0x0002
REG =3D 0x0B, 0x0003

Regards,
Stefan

>=20
>>>> +
>>>> +		/* enable pause restart */
>>>> +		val |=3D MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET;
>>>> +		ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>> +		/* enable restart + keep pause restart set */
>>>> +		val |=3D MT9P031=5FFRAME=5FRESTART=5FSET;
>>>> +		ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +
>>>>    		/* Stop sensor readout */
>>>>    		ret =3D mt9p031=5Fset=5Foutput=5Fcontrol(mt9p031,
>>>>    						 MT9P031=5FOUTPUT=5FCONTROL=5FCEN, 0);
>>>> @@ -505,6 +523,13 @@ static int mt9p031=5Fs=5Fstream(struct v4l2=5Fsub=
dev *subdev, int enable)
>>>>    	if (ret < 0)
>>>>    		return ret;
>>>>   =20
>>>> +	val =3D mt9p031=5Fread(client, MT9P031=5FFRAME=5FRESTART);
>>>> +	/* disable reset + pause restart */
>>>> +	val &=3D ~MT9P031=5FFRAME=5FPAUSE=5FRESTART=5FSET;
>>>
>>> Same here, I think you can simply write MT9P031=5FFRAME=5FPAUSE=5FRESTA=
RT=5FSET.
>>
>> I'll drop the read here as well. But I need to make sure, that the Resta=
rt
>> Bit is not cleared manually here.
>>
>>>> +	ret =3D mt9p031=5Fwrite(client, MT9P031=5FFRAME=5FRESTART, val);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>>    	return mt9p031=5Fpll=5Fenable(mt9p031);
>>>>    }
>>>>   =20
>=20

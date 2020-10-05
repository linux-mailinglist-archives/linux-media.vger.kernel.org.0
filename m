Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDA8283340
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 11:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgJEJcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 05:32:01 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46650 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJEJcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 05:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601890319; x=1604482319;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1FWyO26EtRcjGFr49qBWhvPfN3oYaEOEA6/etTa35cc=;
        b=IXH+CjX0vXv7ZfwdgrkFIwqhRGNyYjmw+69ZFt30AL26WSrW23Q7XHK+jfZEM202
        VSO6Y+CpWPJu7oShj9DIekGZWAcgdvzhN19Q8NTJA008QUxb0md5zT7z4VabediA
        r3q8o22bcYE1rDPjbbLC85WNXUe+efqJQyV8ciVmB2w=;
X-AuditID: c39127d2-269ff70000001c25-8c-5f7ae80f711d
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 41.7A.07205.F08EA7F5; Mon,  5 Oct 2020 11:31:59 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100511315922-551541 ;
          Mon, 5 Oct 2020 11:31:59 +0200 
Subject: Re: [PATCH v2 1/5] media: mt9p031: Add support for 8 bit and 10 bit
 formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>,
        Jan Luebbe <jlu@pengutronix.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930114231.GH5689@pendragon.ideasonboard.com>
 <eacb7df5-bc68-3047-b893-4c1ba4975278@phytec.de>
 <20201001235336.GI3722@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <d372da06-301b-c51f-d164-444cb6e341a5@phytec.de>
Date:   Mon, 5 Oct 2020 11:31:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001235336.GI3722@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:31:59,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:31:59
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWyRoCBS5f/RVW8wb6fohZf58xjteicuITd
        4vKuOWwWPRu2slos2/SHyeLTlm9MDmwesztmsnpsWtXJ5jHvZKBH/18Dj8+b5AJYo7hsUlJz
        MstSi/TtErgyzjV8YC1otKw4dkWxgfGJXhcjJ4eEgInEwav9rF2MXBxCAtsYJW4sXcAC4Zxm
        lHjW/IKpi5GDQ1ggTGL3C0GQBhEBC4neRdMZQWqYBW4xSvy5sQ6qG8jp2n+GBaSKTcBJYvH5
        DjYQm1fARmL6jH52EJtFQEVi58HZ7CBDRQUiJXbusIQoEZQ4OfMJC0iYU8Beom+1CshICYEr
        jBIrL5xghLhUSOL04rPMIDazgJnEvM0PoWxxiVtP5jNB2NoSyxa+Zp7AKDQLydhZSFpmIWmZ
        haRlASPLKkah3Mzk7NSizGy9gozKktRkvZTUTYzAyDg8Uf3SDsa+OR6HGJk4GA8xSnAwK4nw
        6oVVxAvxpiRWVqUW5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLglGpgzDo2
        5+zfJofKisIPUnZV3F258tc+dPcmqZW7X5+h6duXeu7jf4lzX3rnqVxsTj20dVI9V4J50sS7
        dn/SxMMtc++rbDqYqz9VL+Dsiq1skTP/mP79GyLneOOr1HVb9dnNX7m+XeZyO8GqcHff70cW
        T9Tfyl07+TKCrfX1E8ZMz4ofoseWLz48Q4mlOCPRUIu5qDgRAAiRaxl6AgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 02.10.20 01:53, Laurent Pinchart wrote:
> Hi Stefan,
>=20
> On Thu, Oct 01, 2020 at 11:07:00AM +0200, Stefan Riedm=C3=BCller wrote:
>> On 30.09.20 13:42, Laurent Pinchart wrote:
>>> On Wed, Sep 30, 2020 at 12:51:29PM +0200, Stefan Riedmueller wrote:
>>>> From: Christian Hemp <c.hemp@phytec.de>
>>>>
>>>> Aside from 12 bit monochrome or color format the sensor implicitly
>>>> supports 10 and 8 bit formats as well by simply dropping the
>>>> corresponding LSBs.
>>>
>>> That's not how it should work though. If you set the format on
>>> MEDIA=5FBUS=5FFMT=5FSGRBG8=5F1X8 through the pipeline for instance, you=
 will end
>>> up capturing the 8 LSB, not the 8 MSB.
>>>
>>> What's your use case for this ?
>>
>> I use this sensor in combination with an i.MX 6 and i.MX 6UL. When the
>> sensor is connected with 12 bit (or 10 bit on the i.MX 6UL) and I set
>> MEDIA=5FBUS=5FFMT=5FSGRBG8=5F1X8 through the pipeline the CSI interface =
drops the
>> unused 4 LSB (or 2 LSB on the i.MX 6UL) so I get the 8 MSB from my 12 bit
>> sensor.
>=20
> Is that the PIXEL=5FBIT bit in CSI=5FCSICR1 for the i.MX6UL ? If so I thi=
nk
> this should be handled in the imx7-media-csi driver. You could set the
> format to MEDIA=5FBUS=5FFMT=5FSGRBG10=5F1X10 on the sink pad of the CSI a=
nd to
> MEDIA=5FBUS=5FFMT=5FSGRBG8=5F1X8 on the source pad to configure this. I d=
on't
> think the sensor driver should be involved, otherwise we'd have to patch
> all sensor drivers. From a sensor point of view, it outputs 12-bit
> Bayer, not 8-bit.

Ah, I had it wrong. What you say makes total sense. I will take another loo=
k=20
at it and also try to work your suggestion from below in.

Thanks,
Stefan

>=20
> Now there's a caveat. When used with the i.MX6UL, I assume you connected
> D[11:2] of the sensor to D[9:0] of the i.MX6UL, right ? The i.MX6UL
> doesn't support 12-bit inputs, so it should accept
> MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12 on its sink pad. In this case, as D[1:=
0] of
> the sensor are left unconnected, I think you should set data-shift to 2
> and bus-width to 10 in DT on the sensor side. The MT9P031 driver should
> parse that, and output MEDIA=5FBUS=5FFMT=5FSGRBG10=5F1X10 instead of
> MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12 in that case.
>=20
>> Does this clarify things? Maybe the description in the commit message is=
 not
>> accurate enough or did I get something wrong?
>>
>>>> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
>>>> [jlu@pengutronix.de: simplified by dropping v4l2=5Fcolorspace handling]
>>>> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
>>>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>>>> ---
>>>> Changes in v2:
>>>>    - Use unsigned int for num=5Ffmts and loop variable in find=5Fdataf=
mt
>>>>    - Remove superfluous const qualifier from find=5Fdatafmt
>>>> ---
>>>>    drivers/media/i2c/mt9p031.c | 50 +++++++++++++++++++++++++++++-----=
---
>>>>    1 file changed, 40 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>>>> index dc23b9ed510a..2e6671ef877c 100644
>>>> --- a/drivers/media/i2c/mt9p031.c
>>>> +++ b/drivers/media/i2c/mt9p031.c
>>>> @@ -116,6 +116,18 @@ enum mt9p031=5Fmodel {
>>>>    	MT9P031=5FMODEL=5FMONOCHROME,
>>>>    };
>>>>   =20
>>>> +static const u32 mt9p031=5Fcolor=5Ffmts[] =3D {
>>>> +	MEDIA=5FBUS=5FFMT=5FSGRBG8=5F1X8,
>>>> +	MEDIA=5FBUS=5FFMT=5FSGRBG10=5F1X10,
>>>> +	MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12,
>>>> +};
>>>> +
>>>> +static const u32 mt9p031=5Fmonochrome=5Ffmts[] =3D {
>>>> +	MEDIA=5FBUS=5FFMT=5FY8=5F1X8,
>>>> +	MEDIA=5FBUS=5FFMT=5FY10=5F1X10,
>>>> +	MEDIA=5FBUS=5FFMT=5FY12=5F1X12,
>>>> +};
>>>> +
>>>>    struct mt9p031 {
>>>>    	struct v4l2=5Fsubdev subdev;
>>>>    	struct media=5Fpad pad;
>>>> @@ -138,6 +150,9 @@ struct mt9p031 {
>>>>    	struct v4l2=5Fctrl *blc=5Fauto;
>>>>    	struct v4l2=5Fctrl *blc=5Foffset;
>>>>   =20
>>>> +	const u32 *fmts;
>>>> +	unsigned int num=5Ffmts;
>>>> +
>>>>    	/* Registers cache */
>>>>    	u16 output=5Fcontrol;
>>>>    	u16 mode2;
>>>> @@ -148,6 +163,17 @@ static struct mt9p031 *to=5Fmt9p031(struct v4l2=
=5Fsubdev *sd)
>>>>    	return container=5Fof(sd, struct mt9p031, subdev);
>>>>    }
>>>>   =20
>>>> +static u32 mt9p031=5Ffind=5Fdatafmt(struct mt9p031 *mt9p031, u32 code)
>>>> +{
>>>> +	unsigned int i;
>>>> +
>>>> +	for (i =3D 0; i < mt9p031->num=5Ffmts; i++)
>>>> +		if (mt9p031->fmts[i] =3D=3D code)
>>>> +			return mt9p031->fmts[i];
>>>> +
>>>> +	return mt9p031->fmts[mt9p031->num=5Ffmts-1];
>>>> +}
>>>> +
>>>>    static int mt9p031=5Fread(struct i2c=5Fclient *client, u8 reg)
>>>>    {
>>>>    	return i2c=5Fsmbus=5Fread=5Fword=5Fswapped(client, reg);
>>>> @@ -476,10 +502,11 @@ static int mt9p031=5Fenum=5Fmbus=5Fcode(struct v=
4l2=5Fsubdev *subdev,
>>>>    {
>>>>    	struct mt9p031 *mt9p031 =3D to=5Fmt9p031(subdev);
>>>>   =20
>>>> -	if (code->pad || code->index)
>>>> +	if (code->pad || code->index >=3D mt9p031->num=5Ffmts)
>>>>    		return -EINVAL;
>>>>   =20
>>>> -	code->code =3D mt9p031->format.code;
>>>> +	code->code =3D mt9p031->fmts[code->index];
>>>> +
>>>>    	return 0;
>>>>    }
>>>>   =20
>>>> @@ -573,6 +600,8 @@ static int mt9p031=5Fset=5Fformat(struct v4l2=5Fsu=
bdev *subdev,
>>>>    	=5F=5Fformat->width =3D =5F=5Fcrop->width / hratio;
>>>>    	=5F=5Fformat->height =3D =5F=5Fcrop->height / vratio;
>>>>   =20
>>>> +	=5F=5Fformat->code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, format->for=
mat.code);
>>>> +
>>>>    	format->format =3D *=5F=5Fformat;
>>>>   =20
>>>>    	return 0;
>>>> @@ -951,10 +980,7 @@ static int mt9p031=5Fopen(struct v4l2=5Fsubdev *s=
ubdev, struct v4l2=5Fsubdev=5Ffh *fh)
>>>>   =20
>>>>    	format =3D v4l2=5Fsubdev=5Fget=5Ftry=5Fformat(subdev, fh->pad, 0);
>>>>   =20
>>>> -	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME)
>>>> -		format->code =3D MEDIA=5FBUS=5FFMT=5FY12=5F1X12;
>>>> -	else
>>>> -		format->code =3D MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12;
>>>> +	format->code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, 0);
>>>>   =20
>>>>    	format->width =3D MT9P031=5FWINDOW=5FWIDTH=5FDEF;
>>>>    	format->height =3D MT9P031=5FWINDOW=5FHEIGHT=5FDEF;
>>>> @@ -1121,10 +1147,14 @@ static int mt9p031=5Fprobe(struct i2c=5Fclient=
 *client,
>>>>    	mt9p031->crop.left =3D MT9P031=5FCOLUMN=5FSTART=5FDEF;
>>>>    	mt9p031->crop.top =3D MT9P031=5FROW=5FSTART=5FDEF;
>>>>   =20
>>>> -	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME)
>>>> -		mt9p031->format.code =3D MEDIA=5FBUS=5FFMT=5FY12=5F1X12;
>>>> -	else
>>>> -		mt9p031->format.code =3D MEDIA=5FBUS=5FFMT=5FSGRBG12=5F1X12;
>>>> +	if (mt9p031->model =3D=3D MT9P031=5FMODEL=5FMONOCHROME) {
>>>> +		mt9p031->fmts =3D mt9p031=5Fmonochrome=5Ffmts;
>>>> +		mt9p031->num=5Ffmts =3D ARRAY=5FSIZE(mt9p031=5Fmonochrome=5Ffmts);
>>>> +	} else {
>>>> +		mt9p031->fmts =3D mt9p031=5Fcolor=5Ffmts;
>>>> +		mt9p031->num=5Ffmts =3D ARRAY=5FSIZE(mt9p031=5Fcolor=5Ffmts);
>>>> +	}
>>>> +	mt9p031->format.code =3D mt9p031=5Ffind=5Fdatafmt(mt9p031, 0);
>>>>   =20
>>>>    	mt9p031->format.width =3D MT9P031=5FWINDOW=5FWIDTH=5FDEF;
>>>>    	mt9p031->format.height =3D MT9P031=5FWINDOW=5FHEIGHT=5FDEF;
>=20

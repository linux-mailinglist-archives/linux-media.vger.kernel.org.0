Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFC228335C
	for <lists+linux-media@lfdr.de>; Mon,  5 Oct 2020 11:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgJEJdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 05:33:02 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46672 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgJEJdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Oct 2020 05:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601890380; x=1604482380;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3g9qJ3jB6lFu8Y8mWj71/itdfPcgvmUT15aqWIiynjo=;
        b=gL14o5csde3K9dUaVdR4M1vPewOJaiB0p3pKLHAVg0Hs4LButVYhzsfawHGaZ1/1
        LDLMOBddueOwYHFKUTONI4Y2Y7/xAAuCykXoN1qVHt/rdXhk0LcxjmO5O9Y4u7aT
        ll6LuJLZAEPdRhjqABEkGm6F+3hYtiHufNfKJrK5yf0=;
X-AuditID: c39127d2-253ff70000001c25-93-5f7ae84cff5b
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 62.7A.07205.C48EA7F5; Mon,  5 Oct 2020 11:33:00 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020100511330012-551545 ;
          Mon, 5 Oct 2020 11:33:00 +0200 
Subject: Re: [PATCH v2 3/5] media: mt9p031: Implement [gs]_register debug
 calls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-3-s.riedmueller@phytec.de>
 <20200930113831.GG5689@pendragon.ideasonboard.com>
 <289d5897-424f-326f-0bc1-c9a1b79284c3@phytec.de>
 <20201002000642.GL3722@pendragon.ideasonboard.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <18667602-f5b6-afa3-0c99-558299c4efb9@phytec.de>
Date:   Mon, 5 Oct 2020 11:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002000642.GL3722@pendragon.ideasonboard.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:33:00,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 05.10.2020 11:33:00
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWyRoCBS9fnRVW8wfWfvBZ7j11gseicuITd
        4vKuOWwWPRu2slos2/SHyeLTlm9MDmwesztmsnpsWtXJ5jHvZKDHipX/mTw+b5ILYI3isklJ
        zcksSy3St0vgyrh39g5bwUTpivt73jI1MHaLdTFyckgImEjc+LSVtYuRi0NIYBujxO6F71hA
        EkICpxkleuaXgNjCAoESG8/eZAexRQQsJHoXTWcEaWAWOM4ocXHRMqjuPiaJU+d3MoFUsQk4
        SSw+38EGYvMK2EjsbFvPDGKzCKhITO19AdTNwSEqECmxc4clRImgxMmZT8AWcwrYS0xefZEF
        ZKaEwBVGiTPnl7NAnCokcXrxWbA5zAJmEvM2P4SyxSVuPZnPBGFrSyxb+Jp5AqPQLCRzZyFp
        mYWkZRaSlgWMLKsYhXIzk7NTizKz9QoyKktSk/VSUjcxAuPj8ET1SzsY++Z4HGJk4mA8xCjB
        wawkwqsXVhEvxJuSWFmVWpQfX1Sak1p8iFGag0VJnHcDb0mYkEB6YklqdmpqQWoRTJaJg1Oq
        gTFV+4bn+4N3VX6rFJe90KjO/KcWYCRwIVxp2xzxjuemMpbLpwTMjtwY223jvPKX7JNSHr4f
        LTl5rZ1Vl2ZsK1u2Udp4gcnli6vEG/coGDHe8vIzfuG4bRfT/yPvSix2+D7a1PzjRNkE7rNB
        niyKNye/DQq3mMgZUHnvz/RNZgqqbBe1z/K3NSuxFGckGmoxFxUnAgBjrjn5fQIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 02.10.20 02:06, Laurent Pinchart wrote:
> Hi Stefan,
>=20
> On Thu, Oct 01, 2020 at 10:56:24AM +0200, Stefan Riedm=C3=BCller wrote:
>> On 30.09.20 13:38, Laurent Pinchart wrote:
>>> On Wed, Sep 30, 2020 at 12:51:31PM +0200, Stefan Riedmueller wrote:
>>>> From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>>>
>>>> Implement g=5Fregister and s=5Fregister v4l2=5Fsubdev=5Fcore=5Fops to =
access
>>>> camera register directly from userspace for debug purposes.
>>>
>>> As the name of the operations imply, this is meant for debug purpose
>>> only. They are however prone to be abused to configure the sensor from
>>> userspace in production, which isn't a direction we want to take.
>>> What's your use case for this ?  I'd rather drop this patch and see the
>>> driver extended with support for more controls if needed
>>
>> thanks for your feedback.
>>
>> I get your point. I myself solely use these operations for debugging
>> purposes but I'm aware that others like to abuse them.
>>
>> I thought I send it anyway since for me the DEBUG config is enough to
>> signalize that these operations are not to be used with a productive sys=
tem.
>> But I'm OK with dropping this patch if you think it might send the wrong=
 signal.
>=20
> I'd rather avoid this patch due to the risk of abuse if it's OK with
> you.

Yes, that's fine. I will drop it in v3.

Regards,
Stefan

>=20
>>>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>>>> ---
>>>> No changes in v2
>>>> ---
>>>>    drivers/media/i2c/mt9p031.c | 28 ++++++++++++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>>>> index b4c042f418c1..de36025260a8 100644
>>>> --- a/drivers/media/i2c/mt9p031.c
>>>> +++ b/drivers/media/i2c/mt9p031.c
>>>> @@ -703,6 +703,30 @@ static int mt9p031=5Frestore=5Fblc(struct mt9p031=
 *mt9p031)
>>>>    	return 0;
>>>>    }
>>>>   =20
>>>> +#ifdef CONFIG=5FVIDEO=5FADV=5FDEBUG
>>>> +static int mt9p031=5Fg=5Fregister(struct v4l2=5Fsubdev *sd,
>>>> +			      struct v4l2=5Fdbg=5Fregister *reg)
>>>> +{
>>>> +	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(sd);
>>>> +	int ret;
>>>> +
>>>> +	ret =3D mt9p031=5Fread(client, reg->reg);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	reg->val =3D ret;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int mt9p031=5Fs=5Fregister(struct v4l2=5Fsubdev *sd,
>>>> +			      struct v4l2=5Fdbg=5Fregister const *reg)
>>>> +{
>>>> +	struct i2c=5Fclient *client =3D v4l2=5Fget=5Fsubdevdata(sd);
>>>> +
>>>> +	return mt9p031=5Fwrite(client, reg->reg, reg->val);
>>>> +}
>>>> +#endif
>>>> +
>>>>    static int mt9p031=5Fs=5Fctrl(struct v4l2=5Fctrl *ctrl)
>>>>    {
>>>>    	struct mt9p031 *mt9p031 =3D
>>>> @@ -1000,6 +1024,10 @@ static int mt9p031=5Fclose(struct v4l2=5Fsubdev=
 *subdev, struct v4l2=5Fsubdev=5Ffh *fh)
>>>>   =20
>>>>    static const struct v4l2=5Fsubdev=5Fcore=5Fops mt9p031=5Fsubdev=5Fc=
ore=5Fops =3D {
>>>>    	.s=5Fpower        =3D mt9p031=5Fset=5Fpower,
>>>> +#ifdef CONFIG=5FVIDEO=5FADV=5FDEBUG
>>>> +	.s=5Fregister	=3D mt9p031=5Fs=5Fregister,
>>>> +	.g=5Fregister	=3D mt9p031=5Fg=5Fregister,
>>>> +#endif
>>>>    };
>>>>   =20
>>>>    static const struct v4l2=5Fsubdev=5Fvideo=5Fops mt9p031=5Fsubdev=5F=
video=5Fops =3D {
>=20

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A85268B2FB
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 01:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjBFAG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Feb 2023 19:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBFAG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Feb 2023 19:06:56 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3B316AF8
        for <linux-media@vger.kernel.org>; Sun,  5 Feb 2023 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1675642007;
        bh=RlfdyTegzFw0hlgdhIXFBIsxjhz5qJC5KyxyZD7cYHk=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hM7Ia7vTRB5ZKII+226nAYq3NxkFFuFwh1nPFygg8vi/roeT8/KJMiA8psoFP1279
         HsdlR8lUF1drT8PZ9T/vJVVKh/5aCinYEwemW0VpHCKFj3nhoeTDOJNOYnAdi3fyXv
         trJJb/AgqsWKMSF6R+vSuHmmbVH9ACQgfVDjkqTFEXJeyuuCji+i9ILC2quWELJKM8
         iYLbvDxz+D/3o7M0rKpjbb7+pROzFWv7rHs8Z1SSpY2Lf3pb0CTLiTQr4pHh62EOdY
         ZmSPo0WTkEZhtVY9/RCCuHYcjHEEQpVKUeaTwhd9oSejtMKbf9iP3ONmMQRsPSW0ki
         hIFHPwsoutmng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.191.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1pE3Xa38Q5-00OYe6; Mon, 06
 Feb 2023 01:06:47 +0100
Message-ID: <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
Date:   Mon, 6 Feb 2023 01:06:47 +0100
MIME-Version: 1.0
Subject: Re: Future of the SAA7146 drivers
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
 <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
Content-Language: en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PneBhAoUnGaQZcRE+gK6P5QK3OPxEmXjEY+FE0yQ0my4hUL5wZy
 EiE31ur6CwojqJIuLov3J5OvBuJPKHjJ0THnlrd6kGvEsQUp0BtClZZA9zarGIf5+rB3lVz
 DQyj+l6AVIalFjE1yRwOXa0jKA1DbT6IbSX8as5n7T1NxVE9i8TcuJxsPC+3fFwuiXcKOhb
 CjNtBzr4A7c574aHqv/0A==
UI-OutboundReport: notjunk:1;M01:P0:dSXmyLJOT/k=;Qarvhwm2rP48JSZpnaCdzuExYOc
 NZWIYuvywjND/3MaZnNYqyIkqJWhh21B8qWikG6nkipMF/SzpeCxYeI1po+HMH6YAi1MUPpgI
 DtosXBCazWRDmZYWKKbq9EDr4mmoatuHvxcWdI2p5vpo6V8arVTY2yC88CfvyRkuohcFRlyfz
 HvJhZFDoRX86W8+bUzS6zBcbEQ9qEfRlUUGvc9I6byi6mOVizsxLO99XHThaBMg0H/1K0ZCt+
 CD6Sh/mteMv0MbwK/BKsu30RC7n4Q14vERUe1PbED/cf7oR092MhJ6tHZvzy2HodQ7BbjX+jK
 7SmIxiyoHjHTg0xMGwVF1pWLLCE2QY7UvkYUqqHapvyiPRV+geWa27PTtdOLj3vr92CdVEWZ+
 MBLC/iAWJjsVmwFRStxYZvQgR5cI1PWp5s4GEZ6KGPgdHeBXhCLYGOkzZVe12rXUuiWRjVtRc
 e6ZOy9rnt5F6dfOLEYjzPLhHTJKBcYnM0KXdS38SQ4fFerUXwx5sxw6tyjqYXEPS8y6hqdDic
 QPxfsJAaDmsjd4OQv1oZSKput29fSZ731/5BAVUfQLDoSrElaZFbiZjfVzFwh1HPKZHyJ8m5e
 tzDHJdcEo3DllThcUv0wJZecOrfYYrPTZEq21y5+32eHo8Mkoh/cKCZZRaiITJ2upx7fCKYiJ
 K1tJ1RgOHEioo1xSFbLSjShTA2vU0u7bhfFXeoblttELPd+uv4f/5pBGI8qLFUOIjyDHrqeye
 gRub2k8ahoAaTN5vwShSCSstg4i5ZOPe+A9HhVKVSQ2La6tSrNMjYp4IH8fs1UD9CH+DgPTJn
 4U4F74+aWl/2TQMHUWRtdR/6kCyXP04xcQFlHyuD1q02fs9ymkS4g2L+3Ksk4av2qblWw4Xrf
 N9+UwVmZogOoj1JSw+fQB18UZYO1eCQeuoQLFoXMwOMTlpKDdOFSjZzlOqPhHL63hCBseEPa8
 EZ26Qg==
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 03/02/23 09:50, Hans Verkuil wrote:
> On 03/02/2023 01:58, Stefan Herdler wrote:
>> Hi Hans,
>>
>> It's me again, sorry.
>>
>> S=C3=B6ren wrote to me that he dislikes the idea of driver specific
>> headerfile and will refuse to maintain the driver if there is any chang=
e.
>>
>> I can't tell more, I'm just the messenger, sorry.
>
> No problem, I think we'll just leave it as-is.
>
> The reality is that 1) there are very few developers with in-depth DVB
> knowledge in the media subsystem, and 2) they don't have time.

S=C3=B6rens "no changes" means absolutely no changes.
That includes filenames, position, basically everything.

His main concern is that distributions may packages if build brakes.
I wasn't aware of that since Friday. (Poor communication, sorry.)

This concern is not completely unjustified.
Especially if it happens without notice and no update is available.

The download links of the vdr-plugin seems to be broken, which might be
fatal in this case.
It happened this summer when vdr switched from FTP to GIT. I suppose it
was inadvertently and can be fixed quickly.
I'll take care of it, a missing source isn't good anyway.

Until today I wasn't aware of that either.
I focused on the kernel and used a local copy so far.

>
> Also, the DVB drivers that are in the kernel seem to be doing fine:
> bug reports are rare. This videobuf issue is the first in years that
> cropped up and this too is really only analog video as well, it's just
> that it affects DVB boards as well since the same driver is used.
>
> The av7110 has always been an unusual card and some API decisions were
> made in the past that do not fit well into our current ideas how this
> should work. But frankly, I personally have no interest in getting
> involved in that 'fight'.

Me neither.
But it looks like I already managed to get between the lines :-(.
>
> BTW, I looked at your av7110api.diff patch and that is a good first step=
.
> I do thing that the existing video.h/audio.h/osd.h should be replaced
> with versions that just include av7110.h,

For clarification:
I mentioned the API-conversion under the impression the av7110 driver is
almost already gone and that it might be the only chance to save it.
I do not really want this conversion, I still prefer to avoid it.
But if the choice is between driver removal and API-conversion, I'll
take the latter.

Please inform us early, if Linux-Media decides the API-conversion is
necessary and has to be done.
I guess it takes at least 1/2 year to distribute the updates.
Unfortunately, S=C3=B6ren most likely won't be "in the boat" anymore, in t=
his
case. But that is his own decision.



Anyhow, this is topic for later, as you wrote recently.
First thing to do is the videobuf conversion.

In the next weeks I'll be busy with other things and probably don't find
much time for this hobby.
But other modifications to the driver doesn't make much sense while
videobuf conversion is in progress anyway.

Please cc me if you're done with videobuf conversion. I might overlook
it otherwise.
I'll take a look at the compliance-tool then and try to fix as much I can.

> with a big fat notice that
> these APIs are now av7110 specific
Don't worry there are only the 2 fullfeatured-cards using this API and
just because of historical reasons. The driver of the "new"
HD-fullfeatured-card dates back to 2008 (*).
Meanwhile here have been written several specific output-device-plugins
for vdr using V4L-API, vaapi, vdpau, ...
There are no plans to use this part of the DVB-API ever again.

(* The driver is out-of-tree and doesn't count. It is just about the date.=
)
  (as they have almost always been in
> practice).
>
> Regards,
>
> 	Hans
>
>>

Regards,

Stefan

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA7D693B02
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 00:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjBLXKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 18:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBLXKm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 18:10:42 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C98D52E
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
        s=s31663417; t=1676243430;
        bh=tt9P75lyaUs01CXoXhHjMWZTvA4hLM+PfBC2fvl8VuQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=JGsCDuXxmJ41FHtNZ1HZvFw3NjMczqpRKGW+uiOzraPwp0dp5PextymjSatfC0vbb
         m0HSnWxeCMkHK+XY7/09gvaxMZCIIPwJTVtUcRsiG43RWdKOAuH9BVVim9zxai81pY
         Txm6MV0bevBWPSafPya09AOBo9ijfG2NfCemhD5udfP5o4Jnyuwgu2mLQkjtHX/d3O
         l7nnZ8ECsh84svVN2dL3sMCwx1qecMshingyvyOFGuU19H5BT8ZnYYFApKBfy1TG8E
         gjQUV7+XP5BsWDfUqFgP5HLIBM6+/dUmYlsDUEr395IWcSWXW+bFnmCn8eg0fCu+Ug
         QrXZhx7tTUHzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([213.232.103.227]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNct-1ovrA23IpL-00hrvq; Mon, 13
 Feb 2023 00:10:29 +0100
Message-ID: <99397771-409b-e487-e429-d5c9feb82209@nurfuerspam.de>
Date:   Mon, 13 Feb 2023 00:10:29 +0100
MIME-Version: 1.0
Subject: Re: Future of the SAA7146 drivers
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
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
 <026b1342-2b0f-f61d-ea33-63f3992d1473@nurfuerspam.de>
 <20230208100847.3ec87576@coco.lan>
Content-Language: en-US
From:   Stefan Herdler <herdler@nurfuerspam.de>
In-Reply-To: <20230208100847.3ec87576@coco.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:50bZpFrnHq38x2iA7DkP9CIsnu6Z4DBkfHYUHtKktQmNgS1p9a2
 X092QKUR4YezxoxycpMBvLYar00HWBzw2bi7gLDsp34T3dv2FYH6L7CTI05wY0VAVYMIlSt
 4xYAsn65ybY+rQVRDFFIgSjgnyttR4YfAgol2G9SSRvyS8wdOotDyADKdzIc3us6rndv1FD
 OyXqWQjDMBP4mYYlQ+ZlQ==
UI-OutboundReport: notjunk:1;M01:P0:PAlB7WUdwl8=;nJjS9tfrxQQ6rQcgGFy0ZzZH4b4
 gjEgb4LfWQfqQVlPTCkGvS/8i2eJSUlBgMlshsGpw6X7RMgYuhXxQA8/KFqnw/4LRoMD+Hxy2
 g7dSPwbbifI9/ue1DFqQeh4IY7y5/wNyEknhXU6sTkeKqQ/Fi2mUX1UMvT2hJGpC8TyVJi1Bj
 fUdJltpT8U0suZ+RVM1XI2MEMVPi2l/f3p9n9n9MywjLqpwJG7A/X/ZV079KDyYvC6Cw53RWh
 2vCHP6y9HUanRolZMO6vnBGEoc8i0vU7W6N8GHQDrx5x345sRtZR65+1lwpyoDhD2KqJ1mq0C
 QZVzH2zgBB6QvtsuO9ITvcxI4sAIrIfUGVin4sVaT5la7zgQfHfiSrygwjiDkzOnVrUUOeEgS
 o1mR2QT3NgmGjqskT+SFrnTHmMKPa0b47bIOod/b19bDDmAxCM2nCtCPGTk//dn2c8wmO6NvA
 rN01c6TCMGTfeC+tEZb0s5o05tyh40iZ4QdOAbS/wn+46tBB85XN5yZ9r+gn77kq+wEKVIDQ6
 gFPKy2k93JmSrxg2pF/ytzyXIZmpLSq/zzCWaCX5Na0WAEAsQTZ3LuEJBrHr80U4QC7VhtdSH
 P2Nt7MeO8cA2EbGHKmZJs7UZiLuQQ8KWlhyBfNSVQXNbIwCJKatpSBI52ozlMesJxHuQtCERj
 59gX3OxRnDEhxGboVzSBFVu3U8FsRSSqZU1OKvronLxjKZlhA+qYyt+kZb9glueJQA6bawTYl
 ks6lQxLR1Td7+W1cszr9AGAxzRVB6Gbi9jael+HbYknVEHTLBCA4LrxsgIank7qxjEsMkOMf+
 cZcMdONrqQvBA8WNTR1v3wZ6pW3N5VTbWG2bR3lADKL7de6yTYnxFbrDEEZ7PA0AiTUBNaQAx
 wuSu6M7YV3zN+icML0QtEw6irJHWMds0C4m4AjL1DmvXCO6IGXgfTfxii2s7cvO2tW6tSILVN
 u70BYkO7ocE7SY3Ljg0QMmikfXs=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_ABUSE_SURBL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/02/23 10:08, Mauro Carvalho Chehab wrote:

[...]

>>> with a big fat notice that
>>> these APIs are now av7110 specific
>> Don't worry there are only the 2 fullfeatured-cards using this API and
>> just because of historical reasons. The driver of the "new"
>> HD-fullfeatured-card dates back to 2008 (*).
>> Meanwhile here have been written several specific output-device-plugins
>> for vdr using V4L-API, vaapi, vdpau, ...
>> There are no plans to use this part of the DVB-API ever again.
>
> Ok. If that's the case, maybe we can just keep the api without changes.
>
> Yet, in order to move av7110 out of staging, we should finish documentin=
g
> the API (or drop the unused/undocumented parts of it).

Hi Mauro,
that sounds like a good plan to me.

Documentation is a solvable problem. At least for the parts used by the
full-featured-cards.
The VDR-plugin-API is pretty well documented (1) and the output-plugin
for the full-featured-cards push most commands right trough.

It is still a laborious task to crosscheck the documents, but most
information should be already there.
I think I'll get it done, but it my take a while depending on my other
duties.


Documenting the "unused" parts could be difficult.
There is no helpful documentation about the "enigma2" receivers. At
least I haven't found some.
This receivers are also not completely open source. The the drivers seem
to be binary only.
The only things I know for sure are: The OSD-part of the DVB-API isn't
used (2) and the audio- and video-part are used (3).
I manged to find the file where the headers are included (4), but there
is no documentation either.


I think I'll start with the used parts and see how far I come.
I'll mail again when I'm done, probably in 2 or 3 weeks.


Thanks and Regards

Stefan


>
>> (* The driver is out-of-tree and doesn't count. It is just about the da=
te.)
>>    (as they have almost always been in
>>> practice).
>
> Thanks,
> Mauro

1.  http://git.tvdr.de/?p=3Dvdr.git;a=3Dblob;f=3Ddevice.h

2.  https://en.wikipedia.org/wiki/Enigma_(DVB)#Technical_realization
     "direct access to framebuffer"

3.
https://github.com/OpenPLi/openpli-oe-core/blob/10e1dd6b0109ce787dbae20427=
5659778119eafb/meta-openpli/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders/audio_video_ioctl.patch

4.  https://github.com/openatv/enigma2/blob/master/lib/dvb/decoder.cpp

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28FD755951
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 04:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbjGQCF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jul 2023 22:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjGQCF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jul 2023 22:05:28 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C944F9B
        for <linux-media@vger.kernel.org>; Sun, 16 Jul 2023 19:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
 s=s31663417; t=1689559511; x=1690164311; i=herdler@nurfuerspam.de;
 bh=Kb82KV5lTg8m8QoVc1gILeLjYFEsKRsN5m2rGmHJGjk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=N/TtVvfyemv+rXO2G0fjCM3UZ/GxdNgAK2DGS4OihtZcj1yJaRHG3lfRrfawRibfhiDIALN
 Tkf6a/+UVE1MnwUJ+cKehh+N+ek1iS4+TNQU5YukLcUE0xw4Vis4ZNGhY+cwyYCoyBZFsJiMh
 zKRhAZ/4x+9IqXO4veY0fNcCN48E4mCjcBYT0fe5w85eoaApWhW27OXO49R6Z/KGeFhzfIiUj
 pUwqRk9kucDYBsq3Cj2ufJBZKL/naE/9S54pwnS7oTWsf6tlj6M0obdZjyPrRVSxsuFWgtPkE
 o8QPtnLMA6OribmDAhOEarSA8h/eTDHm0/kQ7hoouDkiBkKVabaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([217.113.179.15]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1q2jDe1mfV-00sQ8A; Mon, 17
 Jul 2023 04:05:11 +0200
From:   Stefan Herdler <herdler@nurfuerspam.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
Subject: [PATCH v3 0/6] Legacy DVB API: completion of documentation
Date:   Mon, 17 Jul 2023 04:04:40 +0200
Message-Id: <20230717020446.28877-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230327192826.65ae299d@sal.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Jlv80+TUTQkli00geyV4Lnux5lARPqxdRe5neLsDo1lX1jTtwa
 yKdro+pGX3etQW6aTrVsmE+mQKqZEymt/WXvGz932WAQh5uIgKoZ0EUtqa+dBngNHlFkxP8
 QbKeyyZM7vpiF1eVHBXClmJ7q3uHoMumEeB/T8U5dCHE+2u3I2LTwuFRsTvPZVgd1KuJs6G
 emVuzxEesdajYakgVeBeA==
UI-OutboundReport: notjunk:1;M01:P0:b+sbG6KBl0Q=;DrQLCD8aJrSqlxJ6i57i0hIjRe+
 2bSKOmVBAG4ZK5cK6BNaphIdtcy53bVNS5UyAHfPQPbekeHCCC90jJA816e/CkJTWmxXaKo/u
 m6H9bDH6R+8Dri0NQqFKO1FGKxz5PQrrAHuIEERp2P/7/YPhymstXoygi6ufU9hfSneujcioJ
 7tZvRn4/ZRFEragspIVNiBxRVLbXNslMaLt5GBDu34nxijLwmVkL0n11UHH8BETV/ID8/Sj38
 nARP/HnHfEYNr+HSURrKvymISKwjZFg+UaCfFgE8Ji9mJaYhUMKwlHXuMY0mErqYYzuZjTneA
 s8SR9i1XX1qnJQepaubIxHCiXspwEPiY88njH3AN7vuisu8DXkflIpoqYWPKWcXFuZpHzzVcS
 +0DxcpiksKsiI4u7qMRCqHQiL/8UJGnFDlxK86oRE2hDAFAP+bAVYmepQQwSH2DKb3FctQELT
 YNIo6Ke5uHtkAwyQEpDgWaJYpuJTIApMJWoeD1jk8eLPqQsIvLw04skOqeduerXSJiLZ0kVHd
 MSVcgvpenh9Q5oM+tqftsziL+D+6kqkwx4o5aq6lG8yeuH9+ILNdEWaRNBV9Cj3c1oaZKTgxy
 JVbsh8b8UNVQRUJjQZO5mkK0o7JCq7VkSl7goCaDDazqNffgdypq1r/Uz14z/PWMTVIqRbJUh
 UzZSdcU2hTQyrotycH90DUHWOZRoC2YL40TBOLCZ/NFb5Wy+mGqxS8x2wDQssQ+Ja/HaJGXsU
 22S8xgAtL1RO5xU8E6Rqd4ev8UyXYmng0f5UrBsTvwDNkNMPsjuZtoDGKZUI/gLuY20AVPxsm
 Chhh1Y87Gjz39I8a2GB/rDocv1dnUu0vRjrmdas+LTaDglRtItlDzDQQUsr7oUsgfN0dJpKQu
 YH1PlVz+r+w/117JxZsxhdU1Wz+2ixr83XgtYBYIJ84s+PbteSak/mvRh/nPzBpgCMmdpBhs0
 4ksXYA==
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_ABUSE_SURBL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v2:
* Split the patch into a patch series.
* Incorporate the changes requested.
* Style updates to better match the existing documentation.
* And a lot of small fixes.


Hi Mauro,

it took a little longer then expected, but I didn't had much time in spare
for this. I'm pretty much occupied by other things at the moment.
The winter season would be better for things like this, but I try to
finish it as quick as possible.

I went through your mail point by point and I'm confident, that I was able
to sort out your questions now. At least I don't see anything that need to
be improved anymore.
The work has been done in a lot of small blocks over a pretty long period
after my daily work, mostly late at night. Despite double checking
everything, I maybe still have missed something. I hope it is not too
much.

For usage it has been checked against the known projects using the DVB
decoder APIs:
* The AV7110 kernel driver.
* The out of tree driver for the HD full featured cards.[1]
* The "Enigma2" sources from openatv team.[2]
  (The drivers of the boxes are binary only.)

Possibly unused items have been listed in the comment of the patches.
Please take this lists with a pinch of salt. With the number of items
checked, it is pretty easy to miss an occurrence or have a false positive.
Although I've done my best, there is still the chance that I've missed an
use case.

I tried to complete the documentation of this unused definition too.
Most information had been collect anyway and writing it down wasn't that
much of effort.

Removing the definition and documentation later at once is always an
option.
I would prefer to do it this way, if something has to be removed.
It is easier to revert the change in case of a regression.
If necessary I can provide the patches too.

Regards
Stefan

[1: https://github.com/s-moch/linux-saa716x]
[2: https://github.com/openatv/enigma2/tree/master]



Stefan Herdler (6):
  Add documentation for legacy DVB decoder API
  Add documentation for osd.h
  Add documentation for audio.h (data types)
  Add documentation for audio.h (function calls)
  Add documentation for video.h (data types)
  Add documentation for video.h (function calls)

 .../media/dvb/legacy_dvb_apis.rst             |    1 +
 .../media/dvb/legacy_dvb_audio.rst            | 1642 +++++++++++
 .../media/dvb/legacy_dvb_decoder_api.rst      |   61 +
 .../media/dvb/legacy_dvb_osd.rst              |  883 ++++++
 .../media/dvb/legacy_dvb_video.rst            | 2430 +++++++++++++++++
 5 files changed, 5017 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_audio=
.rst
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_decod=
er_api.rst
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_osd.r=
st
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_video=
.rst

=2D-
2.34.0


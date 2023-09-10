Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E032F799DD9
	for <lists+linux-media@lfdr.de>; Sun, 10 Sep 2023 13:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346636AbjIJLTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Sep 2023 07:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbjIJLTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Sep 2023 07:19:40 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06CACD1
        for <linux-media@vger.kernel.org>; Sun, 10 Sep 2023 04:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694344772; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lPNryd9jTR2vYhp/eON7kKBOu+DImVUxW2FOmkc3PHjOzc8Bn9CY7ME/5waHY1nT/V
    JAdr+EXcScv5pLKfgQRGJhq6emBbNUTxFihIgOz94/vtyG16B1/k543DYQX7ZbDWNF4B
    VnhwFEfWWpWY1GZTbG1Q1GwlVMx/yJasEEwB2ynFPg3+abhCN4wPwtae42vjHJ6In38C
    6SXGPzZk0Z9stlezAbU85pCuLYdCc7C2PdP4mB4ExQJ0Jg2/LFxb0LC5yQr7sd04EXil
    kNxZvplAJr8j1M1eqG8MwlbJWJf2eXpKrGH+ra9xyF9xSX+TA7MCnxpdQbUUeAEp7xqs
    WAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1694344772;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=5VOr/e+jMf+qV8BS+BY3JYEJ4hm9HIaYlNydQEMLrrk=;
    b=c0ijWr5g28kUdQTf49lIoRgKEygW3SjELeXRajKRHbKQhQ0hYUHiTZrXVLW2geQEN1
    GuZy258ayvNwcPOGXHRiKggbkmnxmK/sMgZyaZMTfw7YgNennmJut7M99Q8innh4Zz8I
    /lcTeC+hHz2etSuqWWIbKuxbO/EyskIOtmA3XXllrSv9N5q2urqvVO6jFMoLpMfuMKgu
    ZxY988Wb1zRfxGnO0CIPjNhKhuJRoUkj/klvh8kquFX5k6QOUKsH5GdKLG94AoMAR/kn
    UNVOyr2MOEczfR63gpbEInzTklhEp58/PHA5qjSGKCqrqnjpK5IjXUR2UXmTIMcARtVh
    fRZg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1694344771;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=5VOr/e+jMf+qV8BS+BY3JYEJ4hm9HIaYlNydQEMLrrk=;
    b=r4sgtZ07lU6dkmh6tITS9Rjo7/bRQiOwPFeOoiaQ7drFBofJqU5rzMo/BmhtFenlEb
    FRH5b5/iksB6a9bCc7sVGi5+cD9ofuMbjBESZsD+b+JoRnZeT4LrB0pAUTGQfczJeXuL
    fQrPbtRHTgAZAlUuFRWAeWCEfsmYy0v8wzamsmKe1AjUdAsIB+d7FW4cQDyww3X+FRhO
    ZgldvrWzjqfA3SeyVBYZ1yh9aUPbArRfs1iZPD1rkPnFDsdt+0mrsIpe4uUeYa/dq33W
    FWgofucbXvsrrDWJRBrmkxpKVZ6+t8KHuxB1ydGY7qOORLkj4oCzjPPhM85wzj877VOc
    7GxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1694344771;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=5VOr/e+jMf+qV8BS+BY3JYEJ4hm9HIaYlNydQEMLrrk=;
    b=v/8GOmHwx8U+In+hirN0BG93b89JZZPu7YUsL6JIRyKDjXmpIHEIdfj5gVDiFa7Zx3
    uUHZx+pmQctGyzzrYBCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiAuoB3khqHkGFYks0P7Zd2B6G6"
Received: from [IPV6:2a02:8109:8980:4474:ec4e:f60b:a20:ff01]
    by smtp.strato.de (RZmta 49.8.2 AUTH)
    with ESMTPSA id 3b5276z8ABJVf4B
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 10 Sep 2023 13:19:31 +0200 (CEST)
Message-ID: <56c8ab9a-9084-40ad-be52-5394708e6755@xenosoft.de>
Date:   Sun, 10 Sep 2023 13:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To:     linux-media@vger.kernel.org,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [BTTV] [FSL P50x0] [PASEMI] TV Time doesn't work anymore after
 dropping the overlay support
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10 September 2023 at 04:33 am, Deborah Brouwer wrote:
 >
 > This is not debug code.  I made the change to fix the latency and
 > frame drop issues
 > that were otherwise occurring with vb2; as I said in the cover letter 
to v3:
 >
 > "- remove the last four lines in interlaced,
 > sequential top/bottom, and alternating buffers
 > to prevent long latency and frame drops
 > (this is instead of just enabling the existing
 > VCR hack by default);"
 > 
https://lore.kernel.org/linux-media/cover.1689379982.git.deborah.brouwer@collabora.com/
 >
 > However, if your testing shows that it isn't needed, then it would be
 > fine to remove this
 > code and just let the user enable the "vcr hack" as needed. This was
 > my original approach
 > in v2, but I thought you had said at the time that you were seeing
 > massive framedrops in v2?
 >
 > I didn't notice this green line before because I was testing in qv4l2
 > with the default
 > Pixel Format  : 'BGR3' (24-bit BGR 8-8-8) whereas tvtime is using
 > YUYV' (YUYV 4:2:2)
 >
 > One fix that worked for me was to adjust the "OverScan" configuration 
in tvtime
 > so that it is at least 3.5.  The /etc/tvtime/tvtime.xml configuration
 > file recommends
 > even higher at 8.0.  Christian, please try adjusting the overscan
 > value to see if
 > that is a possible solution as well.
 >
 > Thanks,
 > Deb

Hi Deb,

It works! :-)

I adjusted the OverScan configuration to 3.5 today (.tvtime/tvtime.xml) 
and this solved this issue.

Thanks a lot!

Cheers,
Christian

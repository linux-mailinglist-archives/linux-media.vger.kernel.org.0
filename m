Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D75F246609
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 14:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHQMJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 08:09:21 -0400
Received: from mout.gmx.net ([212.227.15.19]:45513 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbgHQMJQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 08:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597666155;
        bh=E6gPfsMeWh/59BUD3qndcR+UaHfmY2EKPeqOtHZFAFs=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=EHDvp+je29jsQrBeEi5W4dEyBGJKW+MdJo5GlOKHzDesqHrRZwa4Upw9XyXb+44rQ
         6bkzUq8/JAyrZfWsx8qF0tVVj3jrU3nJlnX/o+hGIwKIIA7ImGC0t4ca5wRYcQmDZa
         9iqMosMQANzXc9sNDgT67JtY6BQ5YlS6kXoSbKmw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.22] ([146.60.138.235]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1ksS9646SU-00zExJ; Mon, 17
 Aug 2020 14:09:15 +0200
To:     linux-media@vger.kernel.org
From:   Stefan Witzel <s.witzel@gmx.de>
Subject: Enforcing color profile
Autocrypt: addr=s.witzel@gmx.de; keydata=
 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
Message-ID: <7486393e-56b5-e460-b542-02c72525139b@gmx.de>
Date:   Mon, 17 Aug 2020 14:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:EnyRoH1dPjn+B++gR45/1majbOhmDQMAJu2T/Gc7NN4VYfOWzfN
 hwn6n2bEys/ueKr9nYeTvSBZaC1zBovqFoFjiBdY6QL1QjzWsQbHGcxLwymNa2VRUFZqRoh
 uLcZOUT7hnR43HGsJT9wK6HcAvzFgrc5eQc1cvdPvj66wsC1Ga38aUaRVlWYtVgH5/G5S3f
 2gEeA6eZqpJUM0bZQuFZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9P/Ank0gUGQ=:zTPHFKsjs9nXnvQhNJhESR
 q7bfCc/rVWNILqeMOWcZSz7QyPvEiqu767r8kDTeIDq+B/CEY8Cb1uLIgcKv0+0Ns8ooNvaO9
 nx4rzSWh7HAX+XcyTGAvn72yVscZoHDIx5BaMaj6a8p5LeH7VegVJtMO2OJMEIGlwycU133vT
 3fmK7aKo3Qo9fDX0TwMdjtx+ZuV5pHuPhdl/7GUXkCViBay46mxYkG6VmDltgzY/MMmV74yVk
 Vh+piv0oW1y7R+3f93nCGW1ZcRqB5dnIV1kI7xQTfAKqQpwOlSWWSHKFpnf/Q0AtlPQ/6i4ag
 NNkn4U+vV7T6oLXYveB3Nx1so3IDON0bK8YyY8MR0q3FrDB9j+rf7vkVA0QGoAkFQnxVgyIxH
 2bK4iWBqP3IzJifpRSNMbKLa2ak6g8ncYdt9tSctUdbWGlvnfzip+i7oJyYfuNCT/h1L+NicT
 HX74ZSZ8zyZPGKKSz7BM2FzHcTZnrMWQswdFwmpVSCK+972x0ejC12w5Q9A6ubKUfXy94Hk5C
 t6OT2SgOR/+htwrTU2fdOCBsvaKBKo55/NZ+np0Y5e6EQwlsjJ1hOJqOYP7eSmLouzDTZjMIC
 cpckZFAx65Vorm+1M8igzyk6n9lbzcbtTSsK8bhm6GmE9uIdl585IHARnbt4cP/awc/PXnBRa
 QD2ArzoNTLejS4lOGNcbDOwIyWjGn37LlcG1XnGYhQl64sme9hQ4xvqhfpWjjoD5RnDieNUyF
 MspjLTWWKDzuybMovLTDkvkm6Q7jth/dPItQfMgyT0ykgOq0ee+Ea1A1L1Qmqs3tEB2SCfAZk
 t7hLk1yJHzBsmNeC6kfKSTXs5oTyY/P31VD+LnljFzNqdfojnD7Mqj/12CMlY2alnIA0h68VH
 jXzk6m28RRkBHLbvu9wtSJJ+X9tuPfbWCAKHv7IBkHVJ/SdC492NDy+6qT6xNSYUiuekEdDgt
 8AIRuaj/eZebAESvJdu63UqxXMnDhRVTI1FE/3QdeQvM6ALJcjpKeZOc+koKR+06RdJ4fkai6
 4+hGETiBl66iGPrj0LY0DXkUY0Dt7dj4HRcdydOJnhR4iAcbG+edTQN52SfOxhlJn7pDmQSu7
 J3ONh/oTHCjUxXYU+I9N8idQRJU+uzHB/WSZZnVx3N56UraTvjx6UYE33hNY0T/cNwRj98AR+
 C8fFlXXORSKF8Kcchuo3FgsfWjpjl45bsBgHX9Pa2fHo4G5WSt9R0phbroaaNx090Sbzvx/sK
 8WeqP6EnJKXgk67af
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I am not a V4L developer so if this is not the right place to bring up
the issue please tell me who to contact instead.
The page [1] documents a problem with a particular device "Elgato Cam
Link 4K" which provides various format options among which most software
does not consciously pick the one which it implicitly expects leading to
problems. There is a software workaround, transcoding and looping
through a virtual device and a hardware fix flashing the problematic
profiles away.
However it appears to me that the most satisfactory solution is hinted
at in the sentence

> I couldn't find any option in V4L to force selection of 'YUYV 4:2:2', so instead

So my question is: what changes would be necessary to allow v4l2-ctl to
enforce a particular format and who would be the right person to ask to
make such changes?

Best regards,
Stefan


[1] https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/

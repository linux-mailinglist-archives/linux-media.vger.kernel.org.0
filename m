Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D486B5AA23
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 12:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfF2K2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 06:28:09 -0400
Received: from mout.gmx.net ([212.227.15.19]:60245 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfF2K2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 06:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561804068;
        bh=oj3lEsqwlc9HMeW13jPftORYX0fnnx2+Twl0l4AuHFg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=k37CiEiIHlkwg16x0k1F2sU04Pyc1H3qvzTUnNl7VyWNF9VpunMr0FJXWk4O332Bl
         CZzX22P8lodyJjI70cSPCiPsRrh5HIjnls1EoNVCmNoSdc+fG7FaWizYedzlYz9aAM
         D2gKjBKjKj8uIZKmsjfYtDAaMUx59+UV4OohJ4Mw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.111]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1iAhyj2EQX-00f7nI; Sat, 29
 Jun 2019 12:27:48 +0200
Subject: Re: [PATCH 00/31] staging: bcm2835-camera: Improvements
To:     Dave Stevenson <dave.stevenson@raspberrypi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <f4492041-2587-eedb-8ae5-ae610e90fde2@xs4all.nl>
 <24265b85-a12a-7a46-91d1-f20f5a133f8b@gmx.net>
 <CAAoAYcM6-xBEZfzpxchwh5z21HbFbu57a=7PZNoLB5J2vef7QA@mail.gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <3be8db2a-6960-b31f-3b3b-78b45733fe01@gmx.net>
Date:   Sat, 29 Jun 2019 12:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAAoAYcM6-xBEZfzpxchwh5z21HbFbu57a=7PZNoLB5J2vef7QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:tdZvR7djPZcMZsZiH/C0lwP5pmG3QD72btjtp68x/Mn05o6Lxkr
 PV09oeH3/aNorWGsaQS/jmu72Fb8p2eX+FVR0gz/L0RQ2cN3xk9rE6cADdT+hVCeFQEhPt3
 FDKqljmC4cPUeL0b9JOGHH9OFG1eHjEh+FqjqBzkbRKBnxqncVLDzkDUs/7sG3754oo+hJn
 oB0IHloM/YrIK6VsF/0uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PbD8h4eg1NM=:LibZowrsleCCevBF3eSeT7
 fbw1yjpxCxyTw5NefTa3oJBwCBxwj+xhm1b0B5vK0iY95xdY016j6lxgD1xl+7EsZl5CVss3Q
 GGAY/x6qJwQwarmexLcszUBZaSNhhRBPob2s+taDzfov9OKAFokOdepuem7BjIF5vwzUXIxBq
 6QUzy5Qke7+Da3W1NYKmoidxmjzZZrc26HWbeY8n3RLx0CZdzONQCofUCO/ABE/rpGkHQuh7W
 r3tnLTZopwwis981n9wA0ypzicLM4+xdK/jt0QW+a0vCSJCgq/3MNkAAOxzvd/4bm3pGmz/Dk
 E/Ie1rMH5hEvg/dbKwvk5Bzmb3vG6JxY6wwt0e3D2evA5vXNYHkGoIe7OIMIzJO+OuZsC0DZH
 rgz/r+r+PSde7pqI+SebKGeQKRJb5n9HDrFAbvIk2y1ZxAqi39hBZ2vaqDUAVy/XPq2lfGoeI
 pVUK9KkLCdg+Y7Z6VTv9EkIF6u6vyQxZoOKVdxszfg+l29fUMAfmQnKej85dEgnptHUkaPUQy
 NkJjF1PA65jOw1fyXELtTtWHf/xxmYREXMXRqfDJV8VZOk8toB1/3Gur3TdY+Iyh18/srY5HT
 bvQtl+z9AMX7PAcFLHkJs0h80qls5JzlkYUkyzYOtPOWKGZN62KUMlOV5Lq6rV3U0KROK9NAz
 fDfBxsBHMus0Rm3pKE7ez98cPxEPIc5w5Dmye8ZBzJszG4cdMbJJcOi17vTN64VdlxBSCzkS0
 U8clGuwRU58x14H6T7FgHWTmgjTnkfs0Ck2KOAwgFa992DDIPxDYdlO3sIPEyzRnpBUfNBobS
 ECchz4k1URDmIKrXcRRqwwnuwoNS3kNl2CVpAHSyitXweOVsJyDAcW+xtDE030Gsc6Ox9z7Zg
 XgNX9n40FWJKdOun0ZqPPIhun0CfrPRc33VPFhaf+3Nou7fDKUig5b2o0INBP0o842hhvnN36
 YVntu1fd3fCVq9poZJU6RuR/Z9M7HyHNB6Hbsblkfhi4Cv+HbuqQHDhEykPQH3NRs2RV+lZPG
 /ZeRY27JjYv+zIDe8aTxTv9VV7MpIWMAW54ep+V/ktB5cgR3jZ85iY2C0e2QPdbrzsGJmgtlM
 1KGhogxMLUMfW4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Am 28.06.19 um 19:29 schrieb Dave Stevenson:
> Hi Stefan
>
> Could you try running
> v4l2-ctl -v width=3D640,height=3D480,pixelformat=3DYU12
> before running v4l2-compliance? The default format is JPEG, and I just
> wonder if there is an issue lurking in the compression side.

yes, this is much better:

Streaming ioctls:
=C2=A0=C2=A0=C2=A0 test read/write: OK
=C2=A0=C2=A0=C2=A0 test blocking wait: OK
=C2=A0=C2=A0=C2=A0 test MMAP (no poll): OK
=C2=A0=C2=A0=C2=A0 test MMAP (select): OK
=C2=A0=C2=A0=C2=A0 test MMAP (epoll): OK
=C2=A0=C2=A0=C2=A0 test USERPTR (no poll): OK
=C2=A0=C2=A0=C2=A0 test USERPTR (select): OK
=C2=A0=C2=A0=C2=A0 test DMABUF (no poll): OK (Not Supported)
=C2=A0=C2=A0=C2=A0 test DMABUF (select): OK (Not Supported)

Total for bm2835 mmal device /dev/video0: 53, Succeeded: 53, Failed: 0,
Warnings: 0

> I'll get a Pi3 mainline build going when I get a chance.
>

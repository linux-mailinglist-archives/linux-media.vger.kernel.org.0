Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70A22EBCE1
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 11:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbhAFK7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 05:59:13 -0500
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:38223 "EHLO
        2.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbhAFK7N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 05:59:13 -0500
X-Greylist: delayed 7805 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 05:59:12 EST
Received: from player731.ha.ovh.net (unknown [10.108.42.228])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 8A7391F3994
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:30:00 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-215-46.w86-243.abo.wanadoo.fr [86.243.176.46])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player731.ha.ovh.net (Postfix) with ESMTPSA id 9AC8C1989445D;
        Wed,  6 Jan 2021 08:29:51 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-106R0069a15d81f-91ea-4d59-a361-0fc6ed66905c,
                    2877095AE5B00A1DD94A508FAF09BB9C3E952DE9) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.176.46
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Julien Boibessot <julien.boibessot@armadeus.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
 <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
 <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
 <d89a5263-6806-4290-4c24-b433a0b8fdeb@armadeus.com>
 <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
From:   =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <7b099949-607e-2357-1035-9da92db634ea@armadeus.com>
Date:   Wed, 6 Jan 2021 09:30:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BvOH=wTxRufzGMSB+uwzzN_MpgbWvWvL6awdew6DjeOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8432990305012306974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurogsrghsthhivghnpgfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeftdejudffgeefvdegfeffhffgffejjeefveehkefghfekhffgteejgfeludduudenucfkpheptddrtddrtddrtddpkeeirddvgeefrddujeeirdegieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 1/5/21 2:19 PM, Fabio Estevam wrote:
> Hi Sébastien,
> 
> On Tue, Jan 5, 2021 at 6:49 AM Sébastien Szymanski
> <sebastien.szymanski@armadeus.com> wrote:
> 
>> I used the following gstreamer pipeline to stream on the framebuffer:
>>
>> gst-launch-1.0 v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
> 
> Thanks, this helps and now the pipeline starts and I do see the camera
> image on the LCD.
> 
> I switched to the same 5.4 you used just to make sure we are in the
> same codebase.
> 
> I am getting the wrong colors though. The captured image is too pinky.
> 
> Do you get the correct colors on your test?

Yes, the colors are correct on my test.

Regards,

> 
> Also, I had to describe like the polarities like this:
> 
> hsync-active = <0>;
> vsync-active = <1>;
> pclk-sample = <0>;
> 
> because if I used the same polarities from your patch, then the
> pipeline does not start.
> 
> Thanks for your help!
> 


-- 
Sébastien Szymanski, Armadeus Systems
Software engineer

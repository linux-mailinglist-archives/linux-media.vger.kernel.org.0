Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB64A57E26
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfF0IUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:20:31 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59343 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726431AbfF0IUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:20:30 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gPdphdu0gF85OgPdshnIMW; Thu, 27 Jun 2019 10:20:29 +0200
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
To:     Florian Echtler <floe@butterbrot.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
 <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <238edc67-1d4b-205a-64ce-2bef711bf43f@xs4all.nl>
Date:   Thu, 27 Jun 2019 10:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBhv30ChIJznEVfvLVZSqvpWBlM91noXEhTz3QZvF8okLWEMuzfmlZxY4e1aI9Je9jqih+Kf70NrjyHLlUydPAG+2gV1H2Cda/Xg9yXEawAX8Oifi2Th
 /Zd9Wp+e9rZEy07Iiz4s/iTSr0Vyu9y2u36UXsdyZTKydnxcC9ozTaBCIzmtepxd1vHx4QDpN9Zqs4kuSOb7jkg+Bvba/+swucDlGlK47JFLkLpc4ZmPn4zH
 UjR2Yq30acEfkOyAm1324RNP925CvmXzmAdLD74ME9TLjnu5pbOTPC0eKiR+EuuY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/27/19 10:12 AM, Florian Echtler wrote:
> On 26.06.19 11:52, Hans Verkuil wrote:
>> This driver set the colorspace to SRGB, but that makes no sense for
>> a touchscreen. Use RAW instead. This also ensures consistency with the
>> v4l_pix_format_touch() call that's used in v4l2-ioctl.c.
> 
> One question for clarification: this will only affect userspace applications
> which explicitly request a certain colorspace, correct?

You can't request a colorspace from userspace. The driver sets it.

In this case is it inconsistent anyway since VIDIOC_S_FMT will return RAW
(due to the v4l_pix_format_touch() call), but G/TRY_FMT will return SRGB
from the driver. TRY_FMT should return RAW as well, but it didn't call
v4l_pix_format_touch(), for which I posted a separate patch fixing that.

Regards,

	Hans

> 
> Best regards, Florian
> 


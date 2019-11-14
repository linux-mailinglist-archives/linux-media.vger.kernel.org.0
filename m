Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7F9FC0AD
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 08:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfKNHXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 02:23:06 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41887 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbfKNHXF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 02:23:05 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id V9Sti8HvZ5b4MV9Swimr8r; Thu, 14 Nov 2019 08:23:03 +0100
Subject: Re: [PATCH v11 00/11] Rockchip ISP Driver
To:     Greg KH <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com
References: <20191114051242.14651-1-helen.koike@collabora.com>
 <20191114051722.GA316916@kroah.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <835e058f-59b7-32e8-8fc9-d5adeacfe021@xs4all.nl>
Date:   Thu, 14 Nov 2019 08:22:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191114051722.GA316916@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI3GlCbcBMayGg/klLN5FyDQG84A1RgsYbiEg9uA16/LV3+EqUHoZg0tkqv+XfUdnHqxFiujQbQ3G/7OMMMBGzw4rF20cRBB+tz3F9fKOOkErIqHV6i6
 IMFdoCJqMAeHc77G7PaZnfkTSShQb8FatH40pGaAi/dC2hng91vpPBiAb9fqhw6y7lKdgizL2QxfkUJ64CpDS1x6hFRHSL9wnHwNBByAQ8/4dkkELjHN/tGP
 GLdSnRlmXkuMGD9fLZlIXBnH9+GCd2pPTsQ+MNVhlhyUXi0/CWwonLvGaP4E+YBi4JOE+c+WhXTLnxpntEcPaYgJNnmDpbk1/8OqCcpj+1KLKQNMn6Ova8fj
 v9HyC6NRGhhkNsO/XU1saX5MGI7d6/bas0eoPLrvWaDZBTNHiS3G1Mhcob8OT53AvayR3qy/gp/IsEve37TEoSBk0mFKjApoBzo1iII0/wdzZ5GH1LAb/+bu
 tfCk7F/wJ4hWfkl0wFHrzbqB19tloyGLaEHvvPczy7pjtQmTHjuzoUPXqmE7pjuJrajn0HAZx39iL8FaYybg9RZaMzieMtN/0QGyijGMHCbKPMyK3jqOCsaI
 TW7IxyDQKF0g69q06Ma2EkTyugMAaAbGO5cjR+aVfl1Yh9lXaB4NEMGY95NjtG0WiJbcTnjfZqbyGQVmd5R+HTql0+bJ0Ouh5BHW61q/ZQcHkvTn49aOBQOe
 mQNcIxFIjSAbc1CHhU9D5clOmVN+7f3gh/fTdD5QnVEMFkoPz0wz5x48cXdDkT+UKhpmC6yBD3TN3hAHjWJ4qa51RBgQkw1sQbbxb9USb3pAiUs8Jrc2YLT/
 nIyAGiRYzG25zrsWVpQMrCBj28xKKSqSJA8tTCSsK2ff6e1qQshIjF27mSYYLUQXtYCBioMfAFgOb/t45L7hhqQcg3VgJm0NoAgpbg5+4Pt2PycBnCVkiqRh
 sIrsqA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/14/19 6:17 AM, Greg KH wrote:
> On Thu, Nov 14, 2019 at 02:12:31AM -0300, Helen Koike wrote:
>> Hello,
>>
>> This series adds the Rockchip Image Signal Processing Unit v1 driver to
>> staging.
>>
>> The main reason to be in staging is that people are already using it from the
>> mailing list (including libcamera), and having it in mainline makes the workflow
>> easier. Also, it is easier for other people to contribute back (with code
>> or testing the driver).
>>
>> We plan to actively work on this driver to get it our of staging.
>>
>> This patchset is also available at:
>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v11
>>
>> Libcamera patched to work with this version:
>> https://gitlab.collabora.com/koike/libcamera
>> (also sent to the mailing list)
>>
>> The major difference in v11 are:
>> - Fixed compiling warnings found with W=1
>> - Fixed checkpatch errors
>> - Add clock-names values in dt-bindings
>>
>> This series only touches MAINTAINERS file and drivers/staging/
> 
> Looks sane, but as this is drivers/staging/media I am guessing this will
> go through the media kernel tree, not my staging tree, right?

Right, I'll take care of this.

Regards,

	Hans

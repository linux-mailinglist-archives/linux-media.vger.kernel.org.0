Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8701C20ACD6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgFZHOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:14:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40817 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbgFZHOG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:14:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oiYbjZvtMxmkVoiYejgf3s; Fri, 26 Jun 2020 09:14:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593155645; bh=ALgC5LF1ZBOSYoUAPeuVMeJgOp5RlMABWQUXSLKG8FQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lLnUiyTxeD41mLZAN0eFPyby1ffl0Dl3BG6CwZJL2MtKWMpOMo1M9wusukMjCHs/x
         TUsgsehxpXU47jrxtYOrG59cnmsZFuRGFL4Ta6l+8V/7MQi0FNGvzlVlFsD/seTTvb
         9PVn5nz26oFSDYlLl0NVBjsj1G6KxHBXpUgvjAqsr4g/WcTVO3dwmLmSKTXiHJB5QT
         g0rkhpPVfwhI0OIcArpWMVkS2LLj89YlBzQaaM6zrDsfVTK1dnN29xF9gyoph5DnFv
         VFJRehZ9iEh1Y0Nqqv7DXb7g5tLDm45X7IgTpJsXGjBLS6sDkd4GJAI8Kq8PMZVurL
         0BGOz33gsPdGA==
Subject: Re: [RFC v4 4/8] v4l2: add support for colorspace conversion API
 (CSC) for video capture and subdevices
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de, Hans Verkuil <hans.verkuil@cisco.com>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-5-dafna.hirschfeld@collabora.com>
 <510295b3-39f2-dd23-6aa0-be838c731cef@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <85deadf2-d82e-8926-3304-7d5faf316d18@xs4all.nl>
Date:   Fri, 26 Jun 2020 09:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <510295b3-39f2-dd23-6aa0-be838c731cef@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIJP7S4gUehMrwh1mG6B0qxsOtZelzWR9NILBiIUlEltCtJE1C4B4fLWou+CDSelgcEXEL7W87/MtO4MUMLjPp1uE3yAOZe8X/4Xblxz3tlanv3tHhnY
 igYDCXToSwV+QoA37zj6sInsAG75/ewBHfMHKrT5F8APO7uZIrr2+1AwhnTk8MOsrc0sIZQrwi2vvk0UnHfrZ/tog+0TM09b7DcAWdmqTNbCdhldT5JbZMqg
 VhrZzb+zUemt4NRnS6YWUVJ34K9b0nsVdwagKEsKL5eQoMbLRnxouvIoznTh5Xx4ijOX77GBeX1jaU53O41Y4Lqn1ZM3bs6Vuxm1s7SisyOiMD8pTdtWWYY5
 dh7X9DwLfRoYw3FZ0/KptfxRqhOF7+f5GluA0Qs722zgJoZmCYwBMGQuIqPOjAGuX2PItvzfmuNRmu0OQo9cz+aBrzUQZk/QEfAM4KOYshJ9w8XqNUgQmrYf
 z1oY2CKfcLn1QYFKVNwVEqjfwQEmYK+KdaaO2/VUZZ0vIBNvjvBAJyDc0ky94iDMXVMrhiLz8ckj31uGwJP0Zra2ZFTNtgMZ+3iobT3IaPnws/ufSHCIFfG3
 0LVym7v0lWqxMJ+xphx9NJvI8EM5+9tnkXHZXBdm/LDgOVProjVqUku4x55/m4NO0wSPgpbavVq7uhFpL/zhYucY
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/06/2020 01:29, Helen Koike wrote:
> 
> 
> On 6/5/20 2:26 PM, Dafna Hirschfeld wrote:

<snip>

>>  /*
>>   *	F O R M A T   E N U M E R A T I O N
>> @@ -792,6 +793,9 @@ struct v4l2_fmtdesc {
>>  #define V4L2_FMT_FLAG_EMULATED			0x0002
>>  #define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM	0x0004
>>  #define V4L2_FMT_FLAG_DYN_RESOLUTION		0x0008
>> +#define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0010
>> +#define V4L2_FMT_FLAG_CSC_HSV_ENC		0x0010
> 
> Shouldn't those have different values? Or is this intentional?

It's intentional, but it would probably be better to write this as:

#define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0010
#define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC

That makes it explicit that HSV_ENC is an alias for YCBCR_ENC.

Regards,

	Hans

> 
> Regards,
> Helen
> 
>> +#define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0020
>>  
>>  	/* Frame Size and frame rate enumeration */
>>  /*
>>


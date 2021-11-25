Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481CB45D683
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 09:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344142AbhKYI5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 03:57:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237791AbhKYIzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 03:55:45 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D60C06175A;
        Thu, 25 Nov 2021 00:44:52 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qAN3m651R1HGJqAN7m2pWs; Thu, 25 Nov 2021 09:44:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637829889; bh=lwsKr77FArwR6lJ1Nnqu0OKRhMTMQX8pT5I1Nx81v/s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=F/0MRKaEesAd9gfaojnhRm3o9PuqQiF385eoewyExkM77AIQ0kJ1fxT1Sgp8r8sCC
         z2qrxOf1F9SSvJs6Nt2qvnPmEAEJJLpnm54JBGm1gwpQs4oloo+v+bby/Edw46Jo6c
         WiUTgErNDxWeYIa3OYFqXsIlzZWvgGUxygioayI+YfEcQK7mhhXeNCkBj9sF4PyKyq
         xDuEEO5OLMyLKG69FHiOvNty0h0jWMhYB9Tp9ia7eWJOOeBC6z9qccZFkCHA+NfkaP
         J+ZbXbHnfYm3JkqQiMKR1TwznO+2Za0TfI3Iuyr6jeOV2M+z0QtUmFcrQrT0j5Fg/m
         xv1Qux7+cIngA==
Subject: Re: [PATCH] media: hantro: Hook up RK3399 JPEG encoder output
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211119074654.470729-1-wenst@chromium.org>
 <5d23258a954eb0076cacf89d6c88b5e6ef13695f.camel@ndufresne.ca>
 <CAGXv+5Gf-gsB7JXnLiZF_R=0RdxXS7CDZaFftyZ+aESXLXy1Ew@mail.gmail.com>
 <85e9830ff0c2ed5eb77ce52ec7fde82a08368a2a.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <41d75ec1-b3b6-b991-33f0-7188869eb59c@xs4all.nl>
Date:   Thu, 25 Nov 2021 09:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <85e9830ff0c2ed5eb77ce52ec7fde82a08368a2a.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPq/gDjwsOnpUfhjx4+PkATU+2KVcCHyUa6STjsIrmw7KiLNj2dEomLAQHepTcySgRGrW2QQip808Mr1BCj42l/U1wt2H/qSUJ72BX2QU97vUbjMYZfJ
 xTBW+Cwz59QoWW+Ke0I94s56cuO1qcXD2z1LO0KJy4cinnN1pTb+0Zn8T9rwmWDc7A44IJhmnPRsIhBA/88fZhLHu2pX/5JoD2GFetvrZHL2fFBYyOikF3+f
 RAtNrcjNab/cdNiHaV4jAgQHYaLHEiHAaqWUqPjCbKfDkZsp5QTrms3I8MAqd4g6yyJYg9e5Kyb0XyIIJVJ0pi5LYlqnlcYl3HfYWqOMm0IgM/07INsysi5H
 HaGdxZryUPVdm2QaIbUjXtAZJHwB1c/IRoVGep1sQIt1DKze+MIfq35rMDY6AUTTsJFG8Rp0lKQhjdchDwyjHsdWCwaB5YLQgA0/e0mygZklIBacwDP43hSM
 IJzl8TtIgm8M8z3MvyTbhLb+nDxhSbfkYQlHn/PtxFLiMGhjFaekjUy2DL0UT6B63jWJ1f+8sdN8P4yp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/11/2021 20:39, Nicolas Dufresne wrote:
> Le lundi 22 novembre 2021 à 11:57 +0800, Chen-Yu Tsai a écrit :
>> On Sat, Nov 20, 2021 at 12:00 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>>
>>> Le vendredi 19 novembre 2021 à 15:46 +0800, Chen-Yu Tsai a écrit :
>>>> The JPEG encoder found in the Hantro H1 encoder block only produces a
>>>> raw entropy-encoded scan. The driver is responsible for building a JPEG
>>>> compliant bitstream and placing the entropy-encoded scan in it. Right
>>>> now the driver uses a bounce buffer for the hardware to output the raw
>>>> scan to.
>>>>
>>>> In commit e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG
>>>> codec_ops.done"), the code that copies the raw scan from the bounce
>>>> buffer to the capture buffer was moved, but was only hooked up for the
>>>> Hantro H1 (then RK3288) variant. The RK3399 variant was broken,
>>>> producing a JPEG bitstream without the scan, and the capture buffer's
>>>> .bytesused field unset.
>>>>
>>>> Fix this by duplicating the code that is executed when the JPEG encoder
>>>> finishes encoding a frame. As the encoded length is read back from
>>>> hardware, and the variants having different register layouts, the
>>>> code is duplicated rather than shared.
>>>>
>>>> Fixes: e765dba11ec2 ("hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done")
>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>> ---
>>>> This was developed on the downstream ChromeOS 5.10 kernel (with a hack
>>>> for .data_offset) and tested with ChromeOS's jpeg_encode_accelerator_unittest
>>>> patched to accept non-JFIF JPEG streams (https://crrev.com/c/3291480).
>>>>
>>>> This was then forward-ported to mainline (name and filename changes) and
>>>> compile tested only.
>>>
>>> Tested with GStreamer on top of 5.16-rc1 from media_stage.git. Not perfect but
>>> at least the the output it valid. Test command was:
>>>
>>>   gst-launch-1.0 videotestsrc num-buffers=2 ! v4l2jpegenc ! filesink
>>> location=test.jpg
>>>
>>> Notice that I encode two frames, it seems like the draining flow is broken in
>>> this driver. GStreamer will queue the frame and issue CMD_START immediately, the
>>> driver will skip the encode, leaving me with an empty file.
>>
>> The hantro driver doesn't implement ENC_CMD, which IIRC is used for the
>> draining flow. I guess that's something to fix, since the mem2mem stateful
>> encoder spec seems to require it. Or does that spec not apply to the JPEG
>> encoders?
> 
> I'm pretty sure its required. But this isn't a regression from this patch.

I don't think it is required for JPEG encoders today. Each frame is independent of
any other, so it behaves just like a m2m scaler for example.

It doesn't hurt to support it, but it shouldn't be necessary for jpeg codecs.

If there is a reason why this is needed, then it would likely also be needed for
m2m devices like scalers.

Regards,

	Hans

> 
>>
>>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>
>> Thanks!
>>
>> ChenYu
> 


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C17B392B98
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 12:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhE0KUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 06:20:30 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:35769 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235950AbhE0KU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 06:20:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mD6BlbPpwVN4kmD6FlO1xo; Thu, 27 May 2021 12:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622110727; bh=KNWWA82qUSy1xiTuG0/8hVCUU5W3Fq/syTGpha8Cf48=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mn5Hx7q/qWovu2/xOnkV/23MyoRANWn8+TWZAo0ZG6R/zpsNFYNbJvelBJfLWruxU
         6VraQCP20KEzYYLSpts/cPYu2xEvGP0xzE+1Xk+CjDOdlM7Q57akHfNZYsZlUOMaGM
         GryawyP4Qv4Vmaw46cWFGrmWbRqPkvSPGp45EdwBvTmowi4PnrbE0vdeBPn0xEFPVG
         msaEs6KsWRMwED0/sqHDBXY1B0Odv++LRpOEM5tYICL4+Vnwh6YACq2WFgqdsJ3Umt
         krtqCrqWcl6bNmvrEbSiXjzG/3AM6LgAN+M/8LZEpSYBoKCa/WzWS2dHkfXNpkG4fx
         JmhvaKameB1xw==
Subject: Re: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
 <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <7d485a28-c03d-ec54-7a83-022074a0c042@xs4all.nl>
Date:   Thu, 27 May 2021 12:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF8ObVOe5CFcHYEYJI5BnewapCDUt0Gb70yZ7sURsUGzZi8ZtDPd/2nb7zld91u62w3KHwBI5f9eU7LDCg6iF3BIKDCCfpqDs+whhBCqNl5Mqi5T8IDr
 CYGwhgaZYLavPQUb63Jbvz56GeI2mdOfkO4nPD2nQnUIoI7Y+1Zh5HJH3Rgc6+Chps8Acx9IcBSPe0itnwazBPL9b7/RI2uyBmvwHFEvolJNtrFrVG2F60UC
 CuYCOq3jAiOvwF6SJ2+krmTkz4dqnQ46ZJZLzmcPnppzvl2PXJzSDDUkCnj8Jir16xogjf3ruaDEHjiBfROwqcQSq/hbRdrdC3XfKAJ9PpTFdi8dwpzh3mjC
 dueAiaKQf2f3Ubfr37MYwLFfVt+vA/wzr0pYSg88otKVd+rStPiQGtxUcZXZUN019BL7hVpdV83LQl6Y2zXFisBv8rlnWQRfK0arCaPvyj1guzNzKFFBJcL0
 j4Stmsmkhqv/t0UnOtOrvbwOO2VvzUpDKNLPCYgH0wMTpw7Cd+Y6XC5+m7A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/05/2021 12:10, Alexandre Courbot wrote:
> On Thu, May 27, 2021 at 5:08 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Alexandre,
>>
>> On 19/05/2021 16:29, Alexandre Courbot wrote:
>>> This series adds support for the stateless API into mtk-vcodec, by first
>>> separating the stateful ops into their own source file, and introducing
>>> a new set of ops suitable for stateless decoding. As such, support for
>>> stateful decoders should remain completely unaffected.
>>>
>>> This series has been tested with both MT8183 and MT8173. Decoding was
>>> working for both chips, and in the case of MT8173 no regression has been
>>> spotted.
>>>
>>> Patches 1-5 fix a few compliance issues with the decoder and encoder, most
>>> notably by adding support for the START and STOP command for the latter. These
>>> patches were last in the previous series but have been moved to the beginning so
>>> they can be applied sooner.
>>>
>>> Patches 6-9 separates the "stateful" part of the driver into its own file and
>>> add support for the new firmware and pixel format used by MT8183.
>>>
>>> Patches 10-14 add support for H.264 stateless decoding and MT8183.
>>>
>>> Changes since v4:
>>> * Moved compliance fix patches to the head of the series.
>>> * Select MEDIA_CONTROLLER_REQUEST_API.
>>> * Properly capitalize MM21's format description string.
>>> * Reorganize stateless code as suggested by Hans.
>>> * Fix compilation errors when DEBUG is defined.
>>> * Merge double-free fixup patch into the patch that introduced the issue (was
>>>   a separate patch coming right after the one introducing the issue).
>>>
>>> Changes since v3:
>>> * Stop checking that controls are set for every request.
>>> * Add V4L2_CID_STATELESS_H264_START_CODE control.
>>> * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
>>>   nal_ref_idc field instead.
>>> * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
>>> * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
>>>
>>> Changes since v2:
>>> * Add follow-up patches fixing support for START/STOP commands for the
>>>   encoder, and stateful decoder.
>>>
>>> Alexandre Courbot (8):
>>>   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
>>>   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
>>>   media: mtk-vcodec: make flush buffer reusable by encoder
>>>   media: mtk-vcodec: venc: support START and STOP commands
>>>   media: mtk-vcodec: vdec: handle firmware version field
>>>   media: mtk-vcodec: support version 2 of decoder firmware ABI
>>>   media: add Mediatek's MM21 format
>>>   dt-bindings: media: document mediatek,mt8183-vcodec-dec
>>>
>>> Hirokazu Honda (1):
>>>   media: mtk-vcodec: vdec: Support H264 profile control
>>>
>>> Yunfei Dong (5):
>>>   media: mtk-vcodec: vdec: move stateful ops into their own file
>>>   media: mtk-vcodec: vdec: support stateless API
>>>   media: mtk-vcodec: vdec: support stateless H.264 decoding
>>>   media: mtk-vcodec: vdec: add media device if using stateless api
>>>   media: mtk-vcodec: enable MT8183 decoder
>>
>> Running scripts/checkpatch.pl --strict over this patch series gives
>> a lot of warnings and checks. A lot of these look like they are easy
>> to fix and reasonable.
> 
> Apologies, I forgot to use --strict. It's not pretty indeed. I've
> fixed most of the problems reported ; a few are more tricky or would
> require extra cleanup patches like converting e.g. uint32_t to u32
> when adding a member to a struct, which would make sense if we convert
> all members of the struct (or better, the whole driver) separately.
> Hopefully these can be overlooked for the time being.

Fair enough, just mention that in the cover letter.

Regards,

	Hans

> 


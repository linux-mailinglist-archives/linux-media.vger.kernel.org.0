Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DB64312F5
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhJRJOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 05:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhJRJOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 05:14:43 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32308C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 02:12:31 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cOgymtfTxk3b0cOh1mh8K1; Mon, 18 Oct 2021 11:12:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634548347; bh=J6XLdymtG12DEbeBBHOtCtlxbQ9ASidv0t4nvmcdhJs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r65v/QGs3LbKdQubxaxF+yohbLzwqL2k6mTUK61tL5O4TY6X6ipesnP84W5BrMcLB
         a8V0nCK/0YL/eviwL3dMU5czn4pQUMVEQChsfhWLM3cPcz0h/JfUJnmK7j8d79n9/R
         dDFaU2f2ZTaN1DbPs+xmR4nQJC1xX29FWrMvES12QKT2ZYlHMy3e2I9cKgsrfSYPK8
         pnNcpdUNLUB7GwH4wTaCOji9b8B4sRuNs0lLX5dxt7RfEp5k+qlcgEkRyvV7+onjP6
         0yhhzv0Tq9bOBx7lpJ+maKG8cJMKFsCADDtomG+Fp9tRzZWFWK1bpIhK5J8P0GdgnL
         W0KI9HnDDgOSQ==
Subject: Re: [GIT PULL FOR v5.16] Allegro fixes/enhancements
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>
References: <710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl>
 <20211018094032.40f7c656@sal.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bacaa955-498c-a608-fdeb-d683f7d8b95e@xs4all.nl>
Date:   Mon, 18 Oct 2021 11:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211018094032.40f7c656@sal.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfChDZVYMawOHYAr+042K7tKRA9uNvowt6q6Xb3DidzF9kYqUiXqXhazmrtyhsHynjWXdsriQF2fFSGKnT88xHJjs8Qk0rWetwzAMpio2yXnyFestGYea
 DJ75u0uiAj2nLt3acDUrr/aaRc2T0o5b66JATNXMrtOmahXE72yoT7UyEcPCEhYU6VzzXoL49Zg16LSwEodsnOItIFjviKDS9kMDZo2zsAP5rjgOJlb7qudq
 sE4iUVIXu8ReK+tNCZ4+4QeZC/5CNBkgA4MGxSEZJFo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 18/10/2021 10:40, Mauro Carvalho Chehab wrote:
> Em Mon, 11 Oct 2021 10:49:14 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> 
>> The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:
>>
>>   media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16i
>>
>> for you to fetch changes up to 8f472ea73758255b366fae57bde772396231efcd:
>>
>>   media: allegro: write vui parameters for HEVC (2021-10-11 10:18:33 +0200)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Michael Tretter (13):
>>       media: allegro: ignore interrupt if mailbox is not initialized
>>       media: allegro: fix module removal if initialization failed
>>       media: allegro: lookup VCU settings
>>       media: allegro: add pm_runtime support
>>       media: allegro: add encoder buffer support
>>       media: allegro: add control to disable encoder buffer
>>       media: allegro: fix row and column in response message
>>       media: allegro: remove external QP table
>>       media: allegro: correctly scale the bit rate in SPS
>>       media: allegro: extract nal value lookup functions to header
>>       media: allegro: write correct colorspace into SPS
>>       media: allegro: nal-hevc: implement generator for vui
>>       media: allegro: write vui parameters for HEVC
> 
> Jenkins is reporting compilation breakage when -Werror is turned on:
> 
> patches/0010-media-allegro-extract-nal-value-lookup-functions-to-.patch:
> 
>     allyesconfig: return code #512:
> 	In file included from ../drivers/media/platform/allegro-dvt/nal-hevc.c:24:
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:416:30: error: ‘enum v4l2_quantization’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:417:40: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:419:14: error: ‘enum v4l2_xfer_func’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:418:49: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:421:10: error: ‘enum v4l2_ycbcr_encoding’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
> 	../drivers/media/platform/allegro-dvt/nal-hevc.h:420:38: error: ‘enum v4l2_colorspace’ declared inside parameter list will not be visible
> 
> Are there any missing include?

Ah, the next two patches add the necessary videodev2.h includes. I've fixed up the
patch series to add videodev2.h to this patch instead of later patches, and will
post a new PR soon.

Michael, no need for you to do anything.

Regards,

	Hans

> 
> Regards,
> Mauro
> 


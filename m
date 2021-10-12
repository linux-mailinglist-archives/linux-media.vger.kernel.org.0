Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF4E429F03
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 09:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbhJLHyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 03:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhJLHyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 03:54:11 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE42C061745;
        Tue, 12 Oct 2021 00:52:09 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aCZvm6HUsk3b0aCZymPQIT; Tue, 12 Oct 2021 09:52:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634025127; bh=fB0mX+jO/wJroKIPf/dNUY8QG1hbkg4tnVhjqpLVEDw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GaNB9PMph/qLqpy+3Bim56IfagCbJNnAVJRQp847QjwDfViHD+NyE/lfvwZgsXi4S
         MlW7wn66qHGLe3TawAafM83Uu8oLU0st4OCdyxCVjRtlMGIcvRuedLLnZ4eb8kBw7t
         G4L4AfTy6s61QqwzRRSwSmm4sEVb58C197sw8SR/Smktw2mDaWnB6yzsQbZ2hnu8Dj
         XR3KuBLDqpgHWfuMT7Q5Y36lL7xIKeCmH7lYYeFTCztpoZQrg7mPLMW+I8Dk+2iVU+
         3OGzMgK/C3LwUOb9F4CYnOZgK4PVPmJ1hXS020RB8gZ2j5Ub9WHWOYFqZUD/ebTrQ1
         VbehxGd9m2jwA==
Subject: Re: [PATCH] media: videobuf2: always set buffer vb2 pointer
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210928034634.333785-1-senozhatsky@chromium.org>
 <CAAFQd5DLiW23a0U_JjnpvoYmpcbiKbStq7=w=7KvbDP7zLvBaA@mail.gmail.com>
 <YWTrb0ZXv1HRmtfZ@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <bbc4477c-b075-aecb-64a3-23c6e0f4cdf3@xs4all.nl>
Date:   Tue, 12 Oct 2021 09:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWTrb0ZXv1HRmtfZ@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLt3k3yW+iO597e6rXS1gsZJ1kGYec8vijN5F2PMSuSHTle4RLZBfNAcakp/5pqW46Fk/S0FWKHgl4Grm13EUsqijv/uNAXoyNyOdQflGU8Hb9OrIKqT
 KlWYWHA3CKb6H8/esH2E0skE39MobpYgzcCFAmpd7abXaS0qbb8IuX2pq6EIhk0ZLR4XeXSWWuGrOApFhjAKBOU6sQsRia9bOERiBNylxCOvIcZd1/4o8A82
 JeLD5uf8nGlLO2Isjmi2AoqakW0k8p5HQ6wOR2Mk9EN+vGhdiLqLHo/i9Z/27VidULMrLCCHCXTtRcbtGlfSJfxbvLOAvoA008rcHUKe+Et1xFIkTylFiGa4
 r2mmH7dSBtEZ0OhoMVDXd4gJ6Np4lWMj7hrzevl3vF3WeFGcDJ73SLMWNmV21dNKqZt1O89E
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2021 03:57, Sergey Senozhatsky wrote:
> On (21/10/05 18:57), Tomasz Figa wrote:
>>
>> On Tue, Sep 28, 2021 at 12:46 PM Sergey Senozhatsky
>> <senozhatsky@chromium.org> wrote:
>>>
>>> We need to always link allocated vb2_dc_buf back to vb2_buffer because
>>> we dereference vb2 in prepare() and finish() callbacks.
>>>
>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>> ---
>>>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>
>> Acked-by: Tomasz Figa <tfiga@chromium.org>
> 
> Hans, can you please pick up this patch?
> 

Yes, it's already part of my upcoming pull request.

	Hans

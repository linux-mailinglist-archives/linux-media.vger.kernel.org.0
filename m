Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA38266A78
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 23:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgIKV5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 17:57:18 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53013 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725911AbgIKV4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 17:56:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Gr1xkiMxaTSPzGr1yktTIn; Fri, 11 Sep 2020 23:56:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599861390; bh=u8Fb9Lnr1VIHhEqDH/wt8Pcw1YI+u4oRhXMGJKDEeiA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nRr41xfkV8sIMfeJKulFv+gSB9X+PUvHEBj9F9K0za/qtGXEWUicm7PFC1sOwgs8f
         hgFQNrLQ39e+Pp05FOJTou4iRXZOTab8nSCHy4lYo+/Fd6Y6fEQ5BxU7fI4V/n6iQI
         3yQS7RTcHZ3csdlFOjl8QwbvvhpPLeVEI3MourQMNWCtRGcxyMrF4SiTtSL8nfmJ9E
         odTSM0Vz0AR7VI77mfVgV6CsnT8h+9APsCZtHBqtobdW6lX425RzwxZCyqvNMmon5a
         h2q8ZoMq6xoJFqV4qluv+pJjObu/eRBXxdM7jy3ekpDNjYzgm8tGQp6cNtgvuMPE2L
         KiUkawjVX9lUg==
Subject: Re: edid-decode: Incorrect decoding of CTA extension if it does not
 contain padding bytes
To:     Pavel Kuzmin <kuzkin@gmail.com>, linux-media@vger.kernel.org
References: <CAG+qv4KcntqO7sxfeF+bv594RbSjVQ9RMG8pLgncgkEXtxjmDg@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <228a8021-9ab5-2719-1190-cb1611f1c052@xs4all.nl>
Date:   Fri, 11 Sep 2020 23:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG+qv4KcntqO7sxfeF+bv594RbSjVQ9RMG8pLgncgkEXtxjmDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNzcItWy+mCt8drn7ClC/tdfst7KdUjRwBvA/0KAXa/3ULUZj7jJ0R0JBq7XWZ3c4W6Q/E3ARu7HhK4jbXv3EAFm99BCT++8P8hqI47LGgtngzlzCdzO
 jakDSjnHupuO8TiOrIxGiHOndaqh/fGamicXyBdg4KguCwPmBo4XrtBxKxQeAMunEXFKoaNdWcdCA0i2dp49GoaBQkveco0xRWnBxie+1QKXW7Y2XVtn3Nld
 18x6sq7AbzKzmuh8YMos3JzfIPijgpAotIykLioRpQ0HvXzWpMGPnywlsP8316Vx1rRuaNBznpXLjFaa2ZZAiQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On 11/09/2020 20:27, Pavel Kuzmin wrote:
> Hello
> 
> 
> If in the EDID CTA extension the last 18 byte DTD block ends
> immediately before the checksum byte (no padding bytes) then the last
> DTD block is not processed and a failure is displayed "Padding:
> CTA-861 padding contains non-zero bytes."

Thanks for reporting this, nice catch!

It was caused by an off-by-one check and this is now fixed.

Regards,

	Hans

> 
> e.g. https://github.com/linuxhw/EDID/blob/master/Digital/Acer/ACR0549/42BFE4422CEF
> 
> 
> Regards,
> Pavel
> 


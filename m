Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD2138456
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 08:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfFGGe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 02:34:29 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53797 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726248AbfFGGe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 02:34:29 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Z8SFh9gcP3qlsZ8SIhqgCu; Fri, 07 Jun 2019 08:34:27 +0200
Subject: Re: [PATCH] media: vb2-dc: skip CPU sync in map/unmap dma_buf
To:     Tomasz Figa <tfiga@chromium.org>,
        Lucas Stach <l.stach@pengutronix.de>
Cc:     Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sasha Hauer <kernel@pengutronix.de>,
        patchwork-lst@pengutronix.de
References: <20190228071943.13072-1-l.stach@pengutronix.de>
 <e0f69333-76e2-f336-a557-b591bb786605@xs4all.nl>
 <CAHD77H=RB9eXdsbvTr_B2ekZR6F-OCJG1wg1umHgY5Ta9KJrYw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6ac05ac2-d852-0382-707b-bc0acb1ab582@xs4all.nl>
Date:   Fri, 7 Jun 2019 08:34:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHD77H=RB9eXdsbvTr_B2ekZR6F-OCJG1wg1umHgY5Ta9KJrYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIwLsr4i9RihJgtsnSFbpq03cfBEwEDDjLtV1zhsiqzCeJ8XAUEimgU+QkN9KiNYU5GocTckYcJfjTBbUkf4a3xodWINkjjo6F78iip4kiBCmSJ2hgVk
 tupOgVHXTBN/waWQVA1MGfdMaB028fxR2KA9R0WAqWclEOdbcShI9epruBGZMfaG/It5afPQqg4CTYLWASzKpJxdybMG0E/3XfF01xlIWlsxXMAbbaWywe4x
 oIk442HAMZLKJ0U61+qoAY6Ag3pwd2G0/tCy+JgPVZmD7JE3UTMpQh+bhmlmeEIY9Xw+iY2nOoDBJs5cbzHbSRwlFOWBYR+C38ojS/OGE/uk9dNsyKDCBvXL
 8nORkDusACDbgfgSyOSA/VVleFtp2NWdSolsXsqTXyJKy3PvA5S3vRq60hxbBUFSwpi7zdTojD1SmCDTuUT9ZlxwTU8+9w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/7/19 6:32 AM, Tomasz Figa wrote:
> Hi Hans, Lucas,
> 
> On Fri, May 3, 2019 at 9:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Lucas,
>>
>> As you mentioned there hasn't been any further review comments, so
>> it is fair not to postpone this.
>>
> 
> Sorry for being late to the party. I didn't notice this patch before.
> (Perhaps it could be worth adding me as a reviewer to the MAINTAINERS
> entries for these parts of the media subsystem?)

Post a patch for that. I'd like to have more reviewers for patches in
this area since it is not really my area of expertise.

Regards,

	Hans

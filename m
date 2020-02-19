Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11E7163EF5
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgBSIZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:25:35 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55283 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726001AbgBSIZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:25:35 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KfhjzHQMP9a94KfkjnNci; Wed, 19 Feb 2020 09:25:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582100733; bh=lUfUKWe2Bfb5gG+/BpstAHDP/koJsEO/B2fHNDWqcwk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EjuFXbBv826Dc3lPLJk/1sxIR9LPn/85xPLT0VGdUpindqovQD37MQbGUz60XPuF0
         1DN+ccN7xj8uytEXAbZUpg1JSpgyMwFptPs3gU+V+7HM/Mdhwf2NresdteyrsSG00C
         uOKhdlmRdAD2yIZiNtYR8xgLGtyNmBUDmIZ0KjpCx0aBxlMVqyjsQhIV+HzOBe6Vj1
         mDrVg3Ja9XkDSk8PutYIbWE39kBENVeBBn5hPQ9eaGUdfqRftPPUy4zUYg4QoBac0+
         B1+/A+8Pjk/KD9jnCmF9iItc8411PK0LoBlD0BkU8EnD64C/7TF2bhbvbaat0kJhW2
         C+HGIXBpzjTjw==
Subject: Re: [RFC][PATCHv2 02/12] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-3-senozhatsky@chromium.org>
 <be430540-4b8e-6b44-1eee-9d7291a365be@xs4all.nl>
 <20200219081340.GA122464@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2b1d9855-48dd-ecfe-7a7c-5998f76c3cd8@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:25:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219081340.GA122464@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPaMWB+gyd/iGbZ87NIpSQdHLRgYTF64QoSpcEusuJlAEEkiXMJp/ztxCKVPthP2mIGqQqB7X/kxumB4M+pkAxgbQLygyGMuG8aOAHkLy7Hl1xf2+bnH
 crAE548JR4mgOrlh3NjbNkVPaayoZp+3TJjy6VhA+N1T+CRTNKDZkZ7lRFjb8Nb8IbcnMuwX3qHjvtKic0l19+2tBN3udGHl/0vBAIosk6xNCak784tdXK08
 oDiuYvhy4JsBhhPVyxwsnL22cFWaBAVPacsPZiTrjZJMdJ/yLNclaS1ysYJx4opAgUOywfrRlcrx2XQqtOZLn95FyrYN8QXbtNgul/Dwtc9wcH3753WBM0vt
 fbNs5XXqG6lcljJLonT5xJ7kwWUbg/z1y1WiO51bhe6vAlicMeq+jwb3A3hdi+nbQwNT/7OiUvqleR8811vg7ZneFP8GTsx90Dq1/XmzSfY1AGkaQcLNZnUA
 mnRJfQYMHux0/yq+SqZZBrb1raVD6lBUF0URh3tgAYsDrYc+NiKiykz30+ndL/IdXQjFuw6woVasjBzK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/19/20 9:13 AM, Sergey Senozhatsky wrote:
> On (20/02/19 09:07), Hans Verkuil wrote:
> [..]
>>> +static void set_buffer_cache_hints(struct vb2_queue *q,
>>> +				   struct vb2_buffer *vb,
>>> +				   struct v4l2_buffer *b)
>>> +{
>>> +	/*
>>> +	 * DMA exporter should take care of cache syncs, so we can avoid
>>> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
>>> +	 * we always need ->prepare() or/and ->finish() cache sync.
>>> +	 */
>>> +	if (q->memory == VB2_MEMORY_DMABUF) {
>>> +		vb->need_cache_sync_on_finish = 0;
>>> +		vb->need_cache_sync_on_prepare = 0;
>>> +		return;
>>> +	}
>>> +
>>> +	if (!q->allow_cache_hints)
>>> +		return;
>>> +
>>> +	vb->need_cache_sync_on_prepare = 1;
>>
>> This needs a comment explaining why prepare is set to 1 by default. I remember
>> we discussed this earlier, and the conclusion of that discussion needs to be
>> documented here in a comment.
> 
> Please ignore this patch. There is a follow up which sets _both_
> flags by default. The purpose is to preserve the existing behaviour,
> we can do all sorts of incremental changes (clear flags in more cases,
> etc.) later on. Do you want me to document this in the code?

Yes please!

Regards,

	Hans

> 
> 	-ss
> 


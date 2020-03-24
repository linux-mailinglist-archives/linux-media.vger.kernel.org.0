Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6848190C16
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 12:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbgCXLNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 07:13:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47872 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgCXLNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 07:13:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 2759B29684B
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        kernel@pengutronix.de, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH 2/2] media: coda: be more flexible wrt jpeg dimensions
In-Reply-To: <20200324092131.GB12488@pengutronix.de>
References: <20200323130937.3666244-1-adrian.ratiu@collabora.com>
 <20200323130937.3666244-3-adrian.ratiu@collabora.com>
 <20200324092131.GB12488@pengutronix.de>
Date:   Tue, 24 Mar 2020 13:14:37 +0200
Message-ID: <875zeugg2q.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 24 Mar 2020, Philipp Zabel <pza@pengutronix.de> wrote:
> Hi Adrian, 
> 
> On Mon, Mar 23, 2020 at 03:09:37PM +0200, Adrian Ratiu wrote: 
>> Don't require jpeg dimensions to exactly match format 
>> dimensions, so we are able to decode and display a wider range 
>> jpegs instead of outright rejecting the ones which don't match. 
> 
> I don't think this is right. If userspace feeds us an 
> incomatible JPEG we should probably stop decoding and send a 
> source change event instead [1]. 

Please ignore this second patch as it abuses the spec as Ezequiel
mentioned in the other reply. The correct approach would be to
do a format renegotiation in userspace so the test can be passed.

I will send an updated v2 of the huffman table patch based on
your feedback.

Thank you,
Adrian

>
> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/uapi/v4l/dev-decoder.html#dynamic-resolution-change
>
> regards
> Philipp

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207C445A18E
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbhKWLix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:38:53 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:59872 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229899AbhKWLiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:38:52 -0500
Received: from [79.2.93.196] (port=37768 helo=[192.168.101.88])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mpU5O-0009bC-Tj; Tue, 23 Nov 2021 12:35:42 +0100
Subject: Re: [PATCH 1/2] media: i2c: imx274: simplify probe function by adding
 local variable dev
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, linux-kernel@vger.kernel.org
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
 <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <4be771a0-9e77-64fd-031c-242dd4598996@lucaceresoli.net>
Date:   Tue, 23 Nov 2021 12:35:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 23/11/21 12:25, Sakari Ailus wrote:
> Hi Eugen,
> 
> On Tue, Nov 23, 2021 at 01:15:20PM +0200, Eugen Hristev wrote:
>> Simplify probe function by adding a local variable dev instead of using
>> &client->dev all the time.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> It's not really wrong to do this, but is it useful?
It is of course a matter of personal taste, but I also prefer a short
name in cases such as this where the same member is accessed a lot of
times. To me it makes code simpler to read and even to write.

> You can't even unwrap a single line, the lines are just made a little bit
> shorter.

Let's be fair, he did unwrap 4. :)

As said, it is a matter of taste so I'll be OK it this patch is dropped.
But since I like it and it looks correct:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca

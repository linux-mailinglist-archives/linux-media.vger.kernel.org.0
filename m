Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F05A1B0971
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgDTMf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:35:29 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:44189 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbgDTMf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:35:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QVdyj1DbK7xncQVe1jHL0m; Mon, 20 Apr 2020 14:35:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587386126; bh=TYQaLelNi9MWGfI9Z7M5ED5ZfZMCmcNT26bG27WSM5Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hMC5fPtHNQejw/terlclkS13nA0iINFrrlBCmAyb8OMK7lbBOU1tCm/rzu/z92RQ6
         LbJZOHr/wFBMV0x4mBT6uTjFoPMEz3AiVYHml5E2GrCbrK716QaggrWiG4iWTztYbJ
         yG91ETfzpinJu1bppeD46qxb2pOBhOf0GxYcoLwXIKu0DCbc2/cA58sPN0pTa1vZNv
         0riT3wzID4N8Gza+H8XsqL8Yz6J4AFzfEigCjWj95BXImRyXX1NJhFnY5TmnM1jhyE
         UMiyESgfeuZL9GkkR3i7O/M5ErM0k2Dq8eOkaDKVadTJc7gtORZFDAAXpGYD6h2hEK
         ZGUQkGHsFxL5w==
Subject: Re: How about a v4l-utils-1.20 release?
To:     Sean Young <sean@mess.org>, Gregor Jasny <gjasny@googlemail.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
 <20200420121942.GA22485@gofer.mess.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f37d4c89-73cb-6efb-ce6b-21a6ae89c559@xs4all.nl>
Date:   Mon, 20 Apr 2020 14:35:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200420121942.GA22485@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKWU3hbY0xBPB++4ZMKWPHneHZA1ijf+wyvaLFYKn4GhVPPMt9qNYEAv8kUu+ghRwe1rpQTid2WBTUYxCcKTwKmHAoZFP63c9kaWiCUtnR9btffDWASn
 9XdlWRmQX4cQzjmhE1PRjb65y9alfhXhIPauGni2qGQyrx/qQcyvtBXfR8heY6Dv8wh86nrE+0GApOEDudtyTHps7VA73JmgAZPfPSl97vmBf6b6gPyvMlAN
 idlsesN4w+6qARsVNannS0PMLEaWTzbZw30L1rwA05iIPmEdyRI4FO/kWtleYdvfmzs9MrYCK4EzWt7/efJiaCJXbfo4aDV3y59xp+RMCnk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 14:19, Sean Young wrote:
> Hi Gregor,
> 
> On Mon, Apr 20, 2020 at 02:05:07PM +0200, Gregor Jasny wrote:
>> Hello,
>>
>> It's been a while since we released v4l-utils 1.18. How about a 1.20
>> release?
>>
>> Do you have anything that should go in before?
> 
> There is nothing from me. There are few patches on the list from Rosen Penev,
> cleaning up various stuff found with clang.

Ah yes, let me look at those first. I'll do that today.

> 
> Otherwise I guess there is the meson build system, but I don't know how far
> out that is.

That needs more work.

Regards,

	Hans

> 
> Thanks,
> 
> Sean
> 


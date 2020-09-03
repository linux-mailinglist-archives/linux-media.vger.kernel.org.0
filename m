Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F93925C949
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 21:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgICTSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 15:18:43 -0400
Received: from 7of9.connected.by.freedominter.net ([185.238.129.13]:35108 "EHLO
        7of9.schinagl.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgICTSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 15:18:43 -0400
X-Greylist: delayed 454 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Sep 2020 15:18:42 EDT
Received: from [10.2.11.237] (unknown [10.2.11.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by 7of9.schinagl.nl (Postfix) with ESMTPSA id 3D384163C09B;
        Thu,  3 Sep 2020 21:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
        t=1599160267; bh=D5bS28e+uHTMepUEQKRsQHgyZc0r6JGjL6zlPZRzsFU=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Cu7WOjZo5AxnBbDPoaSt7XJ8NZff+2syCUZ1rvB4lOwoTbsUW2cvFIh/wzsrWbvpG
         4z/Ae87eKJGw7easJSzitla0bti/9IhPXoQGyxkMJXbAIQiuHuQL2eKFymELVQwrF/
         fEPE8AFJqSdSWFM+Sy0QqnigO8X/+2DYlpLuH3S0=
Subject: Re: dtv-scan-tables maintenance
To:     Simon Liddicott <simon@liddicott.com>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <CALuNSF479bQ0wPZbX_aK_j1JRuuwLhT=96ou420Wwdi2v1zR3Q@mail.gmail.com>
From:   Olliver Schinagl <oliver@schinagl.nl>
Message-ID: <38ae4b3c-1295-94ad-7ca0-d4b2dd31aa0f@schinagl.nl>
Date:   Thu, 3 Sep 2020 21:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALuNSF479bQ0wPZbX_aK_j1JRuuwLhT=96ou420Wwdi2v1zR3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I've noticed that a lot of these patches 'dissapear' or end up only on 
the list; and thus get lost.

Having them on github was nice for a while as it lowered the barrier for 
contributions, but those contributions where often of very poor quality 
and I had to spend significant time fixing those up. Also the 
acquisition a few years ago made me remove the github mirror.

I do have a gitlab copy, but from an exposure and contribution ease that 
may not work too well, but it could be worth a shot.

Olliver

On 04-08-2020 16:05, Simon Liddicott wrote:
> Hi
> 
> Who is maintaining the dtv-scan-tables tree?
> 
> There are a few outstanding patches.
> 
> Thanks,
> 
> Simon.
> 

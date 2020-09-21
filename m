Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9652733A7
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 22:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgIUUio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 16:38:44 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52128 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726451AbgIUUio (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 16:38:44 -0400
X-Greylist: delayed 1114 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 16:38:43 EDT
Received: from [78.134.51.148] (port=43940 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kKSIA-0008Sc-U6; Mon, 21 Sep 2020 22:20:07 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 2/3] media: docs: v4l2-subdev: move "Subdev registration"
 to a subsection
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200904215141.20862-1-luca@lucaceresoli.net>
 <20200904215141.20862-2-luca@lucaceresoli.net>
 <20200915134519.5u3vedcyek5ivvjq@uno.localdomain>
Message-ID: <7aac5e6c-b925-c878-3a24-c2715a814476@lucaceresoli.net>
Date:   Mon, 21 Sep 2020 22:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915134519.5u3vedcyek5ivvjq@uno.localdomain>
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

Hi Jacopo,

On 15/09/20 15:45, Jacopo Mondi wrote:
> Hi Luca,
> 
> On Fri, Sep 04, 2020 at 11:51:40PM +0200, Luca Ceresoli wrote:
>> The subdev registration topic is pretty lengthy, and takes more than
>> half of the "V4L2 sub-devices" section. Help readers in finding their
>> way through the document by dedicating a subsection to
>> "Subdev registration".
>>
>> Each of the two registration methods takes many paragraphs, but since
>> adding a subsubsection would be overkill, just emphasize them in bold.
> 
> I see bold being used mostly for C symbols names, I don't know if
> that's a kind of convention or not.
> 
> I would not mind a subsection to be honest...
> I think the patch is good and I'll provide a tag, maybe others can
> provide opinions too!

I'd say it's a matter of taste, so I'll keep the patch as is unless
there are more votes for changing it.

> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks,
-- 
Luca

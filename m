Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72732276E3D
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 12:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgIXKJ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 06:09:29 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:39229 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726597AbgIXKJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 06:09:29 -0400
Received: from [77.244.183.192] (port=62008 helo=[192.168.178.24])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kLOBp-000GrA-Jp; Thu, 24 Sep 2020 12:09:25 +0200
Subject: Re: [PATCH v6 2/3] media: i2c: imx274: Remove stop stream i2c writes
 during remove
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
 <d6be54a7-76b8-4206-0d76-6f93ec545e72@lucaceresoli.net>
 <20200922084746.GA8644@valkosipuli.retiisi.org.uk>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <b243afda-b00f-4c0e-2eea-cc5d03cbebe7@lucaceresoli.net>
Date:   Thu, 24 Sep 2020 12:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922084746.GA8644@valkosipuli.retiisi.org.uk>
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

On 22/09/20 10:47, Sakari Ailus wrote:
> Hi Luca,
> 
> On Tue, Sep 22, 2020 at 10:09:33AM +0200, Luca Ceresoli wrote:
>> Hi,
>>
>> On 21/09/20 23:39, Sowjanya Komatineni wrote:
>>> Sensor should already be in standby during remove and there is no
>>> need to configure sensor registers for stream stop.
>>
>> I beg your pardon for the newbie question: does the V4L2 framework
>> guarantee that the stream is stopped (.s_stream(..., 0)) before removing
>> the driver?
> 
> It doesn't. That's however one of the lesser concerns, and I don't think
> it'd help if drivers tried to prepare for that.

Thanks for the clarification.

I've been working with hardware where the sensor is always powered. In
this case, and with this patch applied, the sensor would keep producing
frames after driver removal. This looks wrong, unless I'm overlooking
something.

BTW at first sight it looks like the framework should take care of
stopping the stream before removal, not the individual drivers, but
maybe there are good reasons this is not done?

-- 
Luca

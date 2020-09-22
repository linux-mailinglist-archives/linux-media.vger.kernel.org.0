Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7328273CF9
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 10:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgIVIJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 04:09:39 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55952 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726489AbgIVIJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 04:09:39 -0400
X-Greylist: delayed 380 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 04:09:38 EDT
Received: from [77.244.183.192] (port=61948 helo=[192.168.178.24])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1kKdMl-0005k7-KL; Tue, 22 Sep 2020 10:09:35 +0200
Subject: Re: [PATCH v6 2/3] media: i2c: imx274: Remove stop stream i2c writes
 during remove
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <d6be54a7-76b8-4206-0d76-6f93ec545e72@lucaceresoli.net>
Date:   Tue, 22 Sep 2020 10:09:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
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

On 21/09/20 23:39, Sowjanya Komatineni wrote:
> Sensor should already be in standby during remove and there is no
> need to configure sensor registers for stream stop.

I beg your pardon for the newbie question: does the V4L2 framework
guarantee that the stream is stopped (.s_stream(..., 0)) before removing
the driver?

Thanks,
-- 
Luca

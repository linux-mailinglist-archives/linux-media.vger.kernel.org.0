Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E441E9AA1
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2020 23:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgEaV4x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 31 May 2020 17:56:53 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:35994 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727084AbgEaV4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 17:56:53 -0400
Received: from [88.147.21.212] (port=45656 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jfVwn-00EHeG-1E; Sun, 31 May 2020 23:56:49 +0200
Subject: Re: IMX274 driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        hverkuil-cisco@xs4all.nl, Frank Chen <frankc@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
References: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <afd8fdb8-e359-5aee-ba3e-54a5217b2aee@lucaceresoli.net>
Date:   Sun, 31 May 2020 23:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On 29/05/20 04:07, Sowjanya Komatineni wrote:
> Hi Luca,
> 
> Quick question regarding IMX274 driver that was up streamed by you.

Well, to be fair I only added cropping and made some improvements.

> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274
> datasheet and register mode table for Y_OUT_SIZE where it includes 6
> ignored area of effective pixels + 8 effective margin for color
> processing pixels.
> 
> So, Y_OUT_SIZE register value = height + 14
> 
> But somehow with this we are not seeing full frame on CSI.
> 
> In our internal NVIDIA IMX274 driver, we are programming Y_OUT_SIZE to
> exact height  Y_OUT_SIZE = height
> 
> So for debug, followed the same and updated upstream IMX274 driver to
> program Y_OUT_SIZE = crop.height locally and I see all resolutions
> working fine with this.
> 
> Checking with Sony on whats causing sensor not to send full frame when
> Y_OUT_SIZE is set to height + 14.
> 
> But thought to check with you in parallel if there are any known issues

That's strange. Unfortunately I'm not using imx274 anymore since a long
time and don't remember the details, but definitely I did test it and if
there had been 14 missing lines I'm pretty sure I would have noticed.

I'll see if I can remember anything useful, and in case I'll update you.
I would be glad if you can update me on any findings too, maybe they
will help in understanding the problem better.

Regards,
-- 
Luca


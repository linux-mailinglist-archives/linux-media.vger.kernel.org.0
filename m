Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B87D36BC0C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 01:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234820AbhDZXag (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 19:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbhDZXaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 19:30:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AFAC061574;
        Mon, 26 Apr 2021 16:29:53 -0700 (PDT)
Received: from [IPv6:2804:14d:72b1:a2ff:e1:848c:62d:7304] (unknown [IPv6:2804:14d:72b1:a2ff:e1:848c:62d:7304])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 77E751F42341;
        Tue, 27 Apr 2021 00:29:49 +0100 (BST)
Subject: Re: [PATCH v6 00/10] MPEG-2 stateless API cleanup and destaging
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
References: <20210426033522.69395-1-ezequiel@collabora.com>
From:   Daniel Almeida <daniel.almeida@collabora.com>
Message-ID: <3bbb3836-802c-5535-005e-5079e8de064e@collabora.com>
Date:   Mon, 26 Apr 2021 20:29:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel, thanks for all your hard work on this!

On 26/04/2021 00:35, Ezequiel Garcia wrote:
 > Hi everyone,
 >
 > Here's another round addressing Hans' feedback. More details
 > about this can be found in the previous cover letter [1]:
 >
 > [1] 
https://lore.kernel.org/linux-media/20210403180756.175881-11-ezequiel@collabora.com/T/
 >
 > The documentation looks good, and so does pahole,
 > but it's really easy to miss some detail in this series,
 > so we'd appreciate if more people could take a look.
 >
 > v6:
 > * Reorder patch "media: controls: Log MPEG-2 stateless control in 
.std_log"
 >    to avoid a new compile warning.
 > * Remove "reserved" field in mpeg2 sequence control, noted by Hans.
 > * Reorder "flags" field in mpeg2 picture control, noted by Hans.
 > * Typos and comments fixes, noted by Hans.
 >

I tested this series on rk3399 (rockpi4) + upcoming gstreamer v4l2 
stateless mpeg2 decoder and it works just fine.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>


-- thanks
-- Daniel

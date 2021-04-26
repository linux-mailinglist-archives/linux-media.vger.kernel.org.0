Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C4836BA1B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 21:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbhDZThB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 15:37:01 -0400
Received: from mailoutvs34.siol.net ([185.57.226.225]:57444 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236653AbhDZTg7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 15:36:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id BD72A5247E7;
        Mon, 26 Apr 2021 21:36:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mA7bw3r2-FhM; Mon, 26 Apr 2021 21:36:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 7AC7F52490C;
        Mon, 26 Apr 2021 21:36:13 +0200 (CEST)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net [86.58.17.133])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id A65CF5247E7;
        Mon, 26 Apr 2021 21:36:12 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v6 00/10] MPEG-2 stateless API cleanup and destaging
Date:   Mon, 26 Apr 2021 21:36:12 +0200
Message-ID: <1760824.zsKnh077Cu@kista>
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
References: <20210426033522.69395-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne ponedeljek, 26. april 2021 ob 05:35:12 CEST je Ezequiel Garcia napisal(a):
> Hi everyone,
> 
> Here's another round addressing Hans' feedback. More details
> about this can be found in the previous cover letter [1]:
> 
> [1] https://lore.kernel.org/linux-media/20210403180756.175881-11-ezequiel@collabora.com/T/
> 
> The documentation looks good, and so does pahole,
> but it's really easy to miss some detail in this series,
> so we'd appreciate if more people could take a look.
> 
> v6: 
> * Reorder patch "media: controls: Log MPEG-2 stateless control in .std_log"
>   to avoid a new compile warning.
> * Remove "reserved" field in mpeg2 sequence control, noted by Hans.
> * Reorder "flags" field in mpeg2 picture control, noted by Hans.
> * Typos and comments fixes, noted by Hans.

Thanks for working on this! I tested everything with Cedrus and FFmpeg and it 
works without a problem. So, whole series is:

Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



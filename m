Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EECA89FAB
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbfHLN2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:28:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57144 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHLN2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:28:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 97A362834A8
Message-ID: <6c78d1343b92e08c92e568a9e349fe22ac2f4aed.camel@collabora.com>
Subject: Re: [PATCH 1/7] media: cedrus: Disable engine after each slice
 decoding
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     paul.kocialkowski@bootlin.com, wens@csie.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 10:28:11 -0300
In-Reply-To: <20190603113827.2nmm5wkycf44aqox@flea>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
         <20190530211516.1891-2-jernej.skrabec@siol.net>
         <20190603113827.2nmm5wkycf44aqox@flea>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Mon, 2019-06-03 at 13:38 +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2019 at 11:15:10PM +0200, Jernej Skrabec wrote:
> > libvdpau-sunxi always disables engine after each decoded slice.
> > Do same in Cedrus driver.
> > 
> > Presumably this also lowers power consumption which is always nice.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Is it fixing anything though?
> 
> I indeed saw that cedar did disable it everytime, but I couldn't find
> a reason why.
> 
> Also, the power management improvement would need to be measured, it
> can even create the opposite situation where the device will draw more
> current from being woken up than if it had just remained disabled.
> 

While reviewing this, I'm noticing that cedrus_engine_disable can
be marked for static storage (with or without this patch).

Regards,
Eze


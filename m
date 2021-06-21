Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E4D3AE1BF
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 04:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhFUC7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 22:59:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41612 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhFUC7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 22:59:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 496B21F40112
Message-ID: <62c3e6bccfb3d8c0ef6190861a8608abff34e885.camel@collabora.com>
Subject: Re: [PATCH 0/5] Rockchip PX30 RGA and VPU support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alex Bee <knaerzche@gmail.com>, Chris Healy <cphealy@gmail.com>
Date:   Sun, 20 Jun 2021 23:57:14 -0300
In-Reply-To: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Thu, 2021-01-07 at 14:40 +0100, Paul Kocialkowski wrote:
> This series adds the required bits for RGA and VPU support on the
> Rockchip PX30 SoC.
> 

Do you plan to resend this series?

Alex recently renamed [1] things so some tweaking will be needed,
but it shouldn't be complicated.

[1] https://lore.kernel.org/linux-media/20210614213215.99389-1-knaerzche@gmail.com/

It would be great to have support RK3326 and PX30 :)

Kindly,
Ezequiel




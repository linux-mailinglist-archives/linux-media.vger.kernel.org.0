Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4502C19C6E9
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 18:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389828AbgDBQRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 12:17:41 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44592 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389458AbgDBQRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 12:17:41 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1C581297DC9
Message-ID: <a86bfa69fef8eee428d7c89b1d4fe99728af2ab7.camel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: phy-rockchip-dphy-rx0: move
 rockchip dphy rx0 bindings out of staging
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Helen Koike <helen.koike@collabora.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        mark.rutland@arm.com, karthik.poduval@gmail.com
Date:   Thu, 02 Apr 2020 13:17:27 -0300
In-Reply-To: <20200402000234.226466-2-helen.koike@collabora.com>
References: <20200402000234.226466-1-helen.koike@collabora.com>
         <20200402000234.226466-2-helen.koike@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(+Kishon)

Hi Helen,

I was wondering if we couldn't also move the phy driver out of staging.

Thanks,
Ezequiel
 
On Wed, 2020-04-01 at 21:02 -0300, Helen Koike wrote:
> Move phy-rockchip-dphy-rx0 bindings to Documentation/devicetree/bindings/phy
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>  .../devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml           | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {drivers/staging/media/phy-rockchip-dphy-rx0/Documentation => Documentation}/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml (100%)
> 
> diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> b/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> similarity index 100%
> rename from drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
> rename to Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml



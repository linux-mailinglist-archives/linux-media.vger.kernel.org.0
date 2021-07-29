Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA17C3DA3C9
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhG2NT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:19:26 -0400
Received: from gloria.sntech.de ([185.11.138.130]:57668 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237339AbhG2NTZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:19:25 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m95wW-0003Jt-Is; Thu, 29 Jul 2021 15:19:20 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        maccraft123mc@gmail.com, Chris Healy <cphealy@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: rockchip: Add VPU support for the PX30
Date:   Thu, 29 Jul 2021 15:19:16 +0200
Message-Id: <162755606327.1705274.1593160960961175960.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210728230040.17368-1-ezequiel@collabora.com>
References: <20210728230040.17368-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Jul 2021 20:00:40 -0300, Ezequiel Garcia wrote:
> The PX30 has a VPU (both decoder and encoder) with a dedicated IOMMU.
> Describe these two entities in device-tree.

Applied, thanks!

[1/1] arm64: dts: rockchip: Add VPU support for the PX30
      commit: 10c68d1788eb29b69b96b5da12c673576922a267

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

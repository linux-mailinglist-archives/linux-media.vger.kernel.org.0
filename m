Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518FC1C3550
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgEDJLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:11:39 -0400
Received: from gloria.sntech.de ([185.11.138.130]:48100 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgEDJLj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:11:39 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jVX8R-0006h9-UZ; Mon, 04 May 2020 11:11:35 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node
Date:   Mon, 04 May 2020 11:11:35 +0200
Message-ID: <11946028.XlPCth9lLn@diego>
In-Reply-To: <20200403221345.16702-6-ezequiel@collabora.com>
References: <20200403221345.16702-1-ezequiel@collabora.com> <20200403221345.16702-6-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Samstag, 4. April 2020, 00:13:45 CEST schrieb Ezequiel Garcia:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> RK3399 has a Video decoder, define the node in the dtsi. We also add
> the missing power-domain in mmu node and enable the block.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

applied for 5.8

Thanks
Heiko



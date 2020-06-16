Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119601FB390
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgFPOIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 10:08:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729166AbgFPOIH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 10:08:07 -0400
Received: from dragon (unknown [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15A1B206F1;
        Tue, 16 Jun 2020 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592316487;
        bh=HuY/87CaF8AeD8BH0mPr92C5TXRll8MzAwelqfSk1Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=siBei0M9PKRGAqikqBMBF815zsjFDm2SU6JRBoBaX3vmEeJm/pOsag4oj6RdDmOVt
         0HjJx6PA1QNUnuVnXOx4eeLROKQbYkR43nEL2MUXypEwV4J6wKdPsgC1TE9yZ+Ux8J
         g0sjd8YrXG4Vxm/igyis3zYTPy2ZDwuSzLoSVGzY=
Date:   Tue, 16 Jun 2020 22:07:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: imx8mq: enable Hantro G1/G2 VPU
Message-ID: <20200616140747.GA24521@dragon>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
 <20200320131256.23294-4-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320131256.23294-4-p.zabel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 20, 2020 at 02:12:55PM +0100, Philipp Zabel wrote:
> Add the i.MX8MQ VPU module which comprises Hantro G1 and G2 video
> decoder cores and a reset/control block.
> 
> Hook up the bus clock to the VPU power domain to enable handshakes, and
> configure the core clocks to 600 MHz and the bus clock to 800 MHz by
> default.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Applied, thanks.

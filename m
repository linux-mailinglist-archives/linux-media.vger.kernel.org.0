Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC11191E08
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfHSHjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:39:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfHSHjC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:39:02 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFC272184D;
        Mon, 19 Aug 2019 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566200341;
        bh=rrlGxLwD24pbPAWMAYLMfKb9jCofaz3kzP33VDcGfuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rowz5XfLc4FWdlA1ScNEAQYEWicKr270PcCqlq5wC3pxj56lmuLvfcttVw99iMImK
         b6zASiu/SyveubCvzvsLjFohvgzTevGQdrArGZSYiRdDIw6C7AooZYmSr6MRMKmtlQ
         8GeRfgdZjfmlWKCSe+F5nronj/AHQM/ZLiSDLWso=
Date:   Mon, 19 Aug 2019 09:38:48 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     =?iso-8859-1?Q?S=E9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6ul: Add csi node
Message-ID: <20190819073847.GB5999@X250>
References: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190731163257.32448-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 31, 2019 at 06:32:57PM +0200, Sébastien Szymanski wrote:
> Add csi node for i.MX6UL SoC.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Applied, thanks.

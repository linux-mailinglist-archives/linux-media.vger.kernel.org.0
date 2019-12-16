Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF7C91200C6
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 10:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfLPJPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 04:15:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:33818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726903AbfLPJPy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 04:15:54 -0500
Received: from X250 (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE279207FF;
        Mon, 16 Dec 2019 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576487754;
        bh=NS6Ab2pqm6RV26LWudEoqa3Yy/7f6aMKLnkcfmDyJoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tk+zfwb764W1ygiYrhMntBTPaSNwClYvqXYHyU9MelUCJaJjvcXSmbYZaeNeWs0zQ
         MaMOYX+TSMRX6JUFbCql8mTqkOrijFd9NHUXjKh6x/he92KcDh/U3PUEQNQdxJh2Ji
         iwUvgb2EV0qcQLl+8nSxSUTfchMbDeLOW4Vh9h+8=
Date:   Mon, 16 Dec 2019 17:15:39 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
        robh+dt@kernel.org, paul.kocialkowski@bootlin.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com,
        robert.chiras@nxp.com, laurentiu.palcu@nxp.com,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com
Subject: Re: [PATCH 2/5] firmware: imx: scu-pd: Add power domains for imx-jpeg
Message-ID: <20191216091529.GA23796@X250>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
 <1573053633-21437-3-git-send-email-mirela.rabulea@nxp.com>
 <64ac7dca-9834-6a33-aa3e-9b7e2156dedc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ac7dca-9834-6a33-aa3e-9b7e2156dedc@xs4all.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Dec 13, 2019 at 10:49:03AM +0100, Hans Verkuil wrote:
> On 11/6/19 4:20 PM, Mirela Rabulea wrote:
> > The power domains are for imx8qxp/imx8qm JPEG encoder & decoder.
> > Each has 4 slots and a wrapper.
> > 
> > Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Shawn, Daniel, can I have an Ack from you? It probably makes sense that
> this patch gets merged via the media subsystem.

I do not see a hard compile time dependency here. In that case, I prefer
to still merge it through my tree to avoid possible conflicts.

Shawn

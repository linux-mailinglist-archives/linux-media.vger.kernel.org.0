Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6662B9CDB
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 22:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgKSVTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 16:19:25 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55156 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgKSVTY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 16:19:24 -0500
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 18C1A3A90F0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 21:11:03 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DBFC4E0006;
        Thu, 19 Nov 2020 21:10:39 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Richard Weinberger <richard@nod.at>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 07/23] mtd: spi-nor: hisi-sfc: Demote non-conformant kernel-doc
Date:   Thu, 19 Nov 2020 22:10:38 +0100
Message-Id: <20201119211038.26454-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-8-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d0992b41e3b5d9bb279355fcb14bf6a985d7f2fb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-11-09 at 18:21:50 UTC, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'np' not described in 'hisi_spi_nor_register'
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c:328: warning: Function parameter or member 'host' not described in 'hisi_spi_nor_register'
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

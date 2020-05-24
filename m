Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435FB1E01EE
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387829AbgEXTRF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:17:05 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38969 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbgEXTRF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:17:05 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 29EA3240002;
        Sun, 24 May 2020 19:16:59 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date:   Sun, 24 May 2020 21:16:58 +0200
Message-Id: <20200524191658.29742-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512082451.771212-1-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dcb351c03f2fa6a599de1061b174167e03ee312b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-05-12 at 08:24:51 UTC, =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= wrote:
> The current code checks that the whole OOB area is erased.
> This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
> fail due to the usable OOB bytes not being 0xff.
> Correct this by only checking that data and ECC bytes aren't 0xff.
> 
> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

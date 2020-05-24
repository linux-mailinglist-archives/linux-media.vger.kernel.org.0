Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A801E01F0
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbgEXTRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:17:14 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:36423 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387744AbgEXTRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:17:14 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AA8A9FF803;
        Sun, 24 May 2020 19:17:10 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date:   Sun, 24 May 2020 21:17:09 +0200
Message-Id: <20200524191709.29417-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512075733.745374-3-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: d00358d7a1c50718232799e1ee10955bcd73795a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-05-12 at 07:57:33 UTC, =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= wrote:
> The current code generates 8 oob sections:
> S1	1-5
> ECC	6-8
> S2	9-15
> S3	16-21
> ECC	22-24
> S4	25-31
> S5	32-37
> ECC	38-40
> S6	41-47
> S7	48-53
> ECC	54-56
> S8	57-63
> 
> Change it by merging continuous sections:
> S1	1-5
> ECC	6-8
> S2	9-21
> ECC	22-24
> S3	25-37
> ECC	38-40
> S4	41-53
> ECC	54-56
> S5	57-63
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

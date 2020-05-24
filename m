Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A986B1E025F
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbgEXT0B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:26:01 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58451 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388365AbgEXT0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:26:00 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id F4107240002;
        Sun, 24 May 2020 19:25:56 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date:   Sun, 24 May 2020 21:25:50 +0200
Message-Id: <20200524192550.4559-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522121524.4161539-5-noltari@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 191dd7b0d8899e3fc0c4c6627a244a5fad8f2cfb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-05-22 at 12:15:23 UTC, =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= wrote:
> Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compatible
> strings to support brcmnand controllers v2.1 and v2.2.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

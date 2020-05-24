Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8371E027E
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388062AbgEXT1p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sun, 24 May 2020 15:27:45 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:53403 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387982AbgEXT1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:27:45 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1F098240003;
        Sun, 24 May 2020 19:27:41 +0000 (UTC)
Date:   Sun, 24 May 2020 21:27:40 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2
 support
Message-ID: <20200524212740.08c2810f@xps13>
In-Reply-To: <20200524192550.4559-1-miquel.raynal@bootlin.com>
References: <20200522121524.4161539-5-noltari@gmail.com>
        <20200524192550.4559-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Sun, 24 May 2020
21:25:50 +0200:

> On Fri, 2020-05-22 at 12:15:23 UTC, =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= wrote:
> > Added brcm,brcmnand-v2.1 and brcm,brcmnand-v2.2 as possible compatible
> > strings to support brcmnand controllers v2.1 and v2.2.
> > 
> > Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

FYI I updated the commit log:
s/dt: bindings:/dt-bindings: mtd:/
s/Added/Add/

Thanks,
Miquèl

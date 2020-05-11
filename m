Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D0B1CE1DC
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 19:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgEKRkW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 May 2020 13:40:22 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52433 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729658AbgEKRkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 13:40:22 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2CF3A200003;
        Mon, 11 May 2020 17:40:19 +0000 (UTC)
Date:   Mon, 11 May 2020 19:40:17 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Cc:     computersforpeace@gmail.com, kdasu.kdev@gmail.com, richard@nod.at,
        vigneshr@ti.com, sumit.semwal@linaro.org,
        linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/3] nand: brcmnand: rename v4 registers
Message-ID: <20200511194017.313c2881@xps13>
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Álvaro,

Álvaro Fernández Rojas <noltari@gmail.com> wrote on Sun, 10 May 2020
17:14:04 +0200:

> These registers are also used on v3.3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---

BTW, all your titles should start with "mtd: rawnand: brcmnand: "

Thanks,
Miquèl

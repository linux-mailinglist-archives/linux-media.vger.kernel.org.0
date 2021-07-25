Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF75B3D4C71
	for <lists+linux-media@lfdr.de>; Sun, 25 Jul 2021 08:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhGYF7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jul 2021 01:59:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhGYF7s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jul 2021 01:59:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B19DD608FE;
        Sun, 25 Jul 2021 06:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627195219;
        bh=OwGTaFDFrjidOs3L9+pS5jm4ED5BS4+FMWyoDZH657o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y37Ya1Var41r5KlsN0PXt5TY7QHFfkahYvdidxxvO08hin1y5sPUzZ7SuRNtjmz6a
         TbHJDknj4f0PFuoAhfO8l1pulMNz95KW1UQPAzZmiR8OPc6soq+dXd9hNdiTCRoZ/B
         1jAtgG9vi/nT8eBC0gN5rfR2Jbva7RNRAw85iij8=
Date:   Sun, 25 Jul 2021 08:40:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: stkwebcam: update the reference count of the usb
 device structure
Message-ID: <YP0HTqZIh73YBR6f@kroah.com>
References: <20210724195831.GA509821@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724195831.GA509821@pc>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 24, 2021 at 08:58:31PM +0100, Salah Triki wrote:
> Use usb_get_dev() and usb_put_dev() in order to update the reference
> count of the usb device structure.

Why?

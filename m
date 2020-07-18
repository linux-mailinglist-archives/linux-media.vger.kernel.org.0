Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDF7224920
	for <lists+linux-media@lfdr.de>; Sat, 18 Jul 2020 07:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGRFyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jul 2020 01:54:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgGRFyM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jul 2020 01:54:12 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0139207FB;
        Sat, 18 Jul 2020 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595051652;
        bh=7tj0coF0LM+/VMFkugJPQNZQ4IPbTxLOCHXhOrSJqAY=;
        h=Date:From:Cc:Subject:In-Reply-To:References:From;
        b=DMAsgOdbE5S+/snFh2fLr9vtfPqyP/vp0lnwJW1CI2VHKury2pA4DUzMmnHeDDWJ3
         WVxj32rIi08omQDlDtE5PuS1Cx4+3fw0xRU3eV76cWasmwj+YwF/+GUC5FnSJuIxSZ
         t6hOLOuQWHuG3NUYgp7Mw4My71LeguU2aBTrbnrY=
Date:   Sat, 18 Jul 2020 07:54:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 1/3] media: rkvdec: Fix H264 scaling list order
Message-ID: <20200718075407.765551bb@coco.lan>
In-Reply-To: <2630e1bb0948c3134c6f22ad275ae27cc6023532.1595048742.git.mchehab+huawei@kernel.org>
References: <2630e1bb0948c3134c6f22ad275ae27cc6023532.1595048742.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 18 Jul 2020 07:05:54 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> From: Jonas Karlman <jonas@kwiboo.se>
> 
> The Rockchip Video Decoder driver is expecting that the values in a
> scaling list are in zig-zag order and applies the inverse scanning process
> to get the values in matrix order.
> 
> Commit 0b0393d59eb4 ("media: uapi: h264: clarify expected
> scaling_list_4x4/8x8 order") clarified that the values in the scaling list
> should already be in matrix order.
> 
> Fix this by removing the reordering and change to use two memcpy.

Please ignore this one. This patch is already merged, and it is
not related to the 2 atomisp patches on this short series.

Thanks,
Mauro

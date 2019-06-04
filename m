Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA1753456C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfFDLav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbfFDLav (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:30:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9530C24BDC;
        Tue,  4 Jun 2019 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559647851;
        bh=BABEmEyvyc0NzAlG1uEwpJ1teQrAL2899GTNBrnmIMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xdTaFrNzQw9V5OdgWcYOlLkuPu0NgSt7kyoWe3mxIfqZ0rO4xOzvIoPaNG44rIOuu
         0sfI10K02oYUKgiUakupATly+kbTC3qCbgPkAidQdaMUL7kRwIequ65Q7Eu67ZWHmv
         mdsv/e3Jb4vMRuZFCQSkpexz6UPpDlfwo1OYWp2E=
Date:   Tue, 4 Jun 2019 13:30:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 6/7] vc04_services/bcm2835-camera: set device_caps in
 struct video_device
Message-ID: <20190604113048.GA18535@kroah.com>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <20190604111958.22331-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604111958.22331-7-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 04, 2019 at 01:19:57PM +0200, Hans Verkuil wrote:
> Instead of filling in the struct v4l2_capability device_caps
> field, fill in the struct video_device device_caps field.
> 
> That way the V4L2 core knows what the capabilities of the
> video device are.
> 
> But this only really works if all drivers use this, so convert
> this driver accordingly.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Eric Anholt <eric@anholt.net>
> ---
>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

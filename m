Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCB282E3EF9
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 15:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505208AbgL1Oew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 09:34:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392119AbgL1Oev (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 09:34:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C39A320715;
        Mon, 28 Dec 2020 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609166051;
        bh=Q2sffWSCYlkXCObWDTQgapWTS0t1wRl+tsshIhwh96Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z94vcM4env7W1XQoOLx+hiBwkNtrxEYyt9axQms2jSxVzlg+8peuE5NdL1ktNXdyq
         1KfxmIPSU08pMWROn3XWCeEbLjSbTrIVCD7T8MQkWtpc59RHhDF2/kzUg08Y7N3C+u
         hvZG/J2MkPNRhVZhy296TjEDhDdmOiwtdpWNWYFk=
Date:   Mon, 28 Dec 2020 15:24:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org,
        Georgi Bakalski <georgi.bakalski@gmail.com>
Subject: Re: [PATCH 1/2] media: ir_toy: add another IR Droid device
Message-ID: <X+nqiJlqn2EuXGkA@kroah.com>
References: <20201227134502.4548-1-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201227134502.4548-1-sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 27, 2020 at 01:45:01PM +0000, Sean Young wrote:
> This device is also supported.
> 
> Tested-by: Georgi Bakalski <georgi.bakalski@gmail.com>
> Reported-by: Georgi Bakalski <georgi.bakalski@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/ir_toy.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

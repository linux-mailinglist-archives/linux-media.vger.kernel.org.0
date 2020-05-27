Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA46F1E3ECC
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 12:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgE0KRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 06:17:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbgE0KRD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 06:17:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EA042088E;
        Wed, 27 May 2020 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590574623;
        bh=tpWfArgC5M8fG6+LXN28JJdWpgfFpPdct50z7c3a42I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pVx46B/5kqpTeKW1Q4WcSXNQ4rKXySxHOGacOZlxq2c3o+j8aWgG1lbUbsA7eNAI6
         THgxvqnLTZiEAcIgYTyU5wZSRrR9kloTTksg+5QfiW/DIZ+T+Ea98X5be25zdzliSy
         jnz8a9SSQjCVGqTfJRutS2rd4YHqkigRJakXNTx0=
Date:   Wed, 27 May 2020 12:17:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2 1/3] media: rc: add support for Infrared Toy and IR
 Droid devices
Message-ID: <20200527101700.GD281913@kroah.com>
References: <20200527094107.11936-1-sean@mess.org>
 <20200527094107.11936-2-sean@mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527094107.11936-2-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 27, 2020 at 10:41:05AM +0100, Sean Young wrote:
> http://dangerousprototypes.com/docs/USB_Infrared_Toy
> https://www.irdroid.com/irdroid-usb-ir-transceiver/
> 
> Signed-off-by: Sean Young <sean@mess.org>

Looks sane, nice job.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

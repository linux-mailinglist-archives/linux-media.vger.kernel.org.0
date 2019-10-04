Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 517E2CBAA2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387661AbfJDMjW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:39:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387470AbfJDMjW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 08:39:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37A0020862;
        Fri,  4 Oct 2019 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570192761;
        bh=/chgh7CD6MpVtxpw2jOJKhYNbEzRWQ2EuZ8BmClXP6M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c11apdBcMGzA6IEVKiRrqsITfUVyZ4138Xu4iyWYgHxIo+XKJoC3VelDlmpWVGba6
         KvNP/uC7GylLq0J7NS1IkmT8QYZ5dh5+Hm1aXkHX0Xuk3+Gcom3QnPZ0GqJ23O2aMs
         h8IlNSEtp1YJL13rXLLeKutCv6nrYrufk+pyfsxU=
Date:   Fri, 4 Oct 2019 14:39:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pete Zaitcev <zaitcev@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] USB: fix runtime PM after driver unbind
Message-ID: <20191004123915.GA555726@kroah.com>
References: <20191001084908.2003-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001084908.2003-1-johan@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 01, 2019 at 10:49:04AM +0200, Johan Hovold wrote:
> A recent change in USB core broke runtime-PM after driver unbind in
> several drivers (when counting all USB serial drivers). Specifically,
> drivers which took care not modify the runtime-PM usage counter after
> their disconnect callback had returned, would now fail to be suspended
> when a driver is later bound.
> 
> Greg, feel free to pick these up directly. The media patch has been
> acked by Mauro.

All now applied, thanks.

greg k-h

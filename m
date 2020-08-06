Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6D023E0EF
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 20:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgHFSjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 14:39:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:32860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729885AbgHFSjT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 14:39:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6438221E3;
        Thu,  6 Aug 2020 18:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596739159;
        bh=ZrgeGz2eQCzY3et54NjiihndUZVStwHlqyFDNY4ncaU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJteJ4kYFz3S0hlJGMQXf/Ngjd7dsaLoheNZVjaSkDcbqYZTuH3mZqbQZQvuLX3Tx
         CPyXdm9BlKeFgU8cBxqfyKY/glgT1TlxF/XnfXmThAxzlnSwjXjQr90O2dNlKjpSHH
         nzoSmKUv6q4c9v1jEY/bI9801Infb1Xdoj+LD5gI=
Date:   Thu, 6 Aug 2020 20:39:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     andy.shevchenko@gmail.com, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v6] staging: atomisp: move null check to earlier point
Message-ID: <20200806183933.GA2939128@kroah.com>
References: <20200731083856.GF3703480@smile.fi.intel.com>
 <20200801220101.2783-1-cengiz@kernel.wtf>
 <173c50d7bb0.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173c50d7bb0.2bfa.85c738e3968116fc5c0dc2de74002084@kernel.wtf>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 06, 2020 at 09:34:22PM +0300, Cengiz Can wrote:
> Hello Andy,
> 
> Can I get some feedback on v6 please?


It's been 4 days, in the middle of a merge window, please give people a
chance to catch up on other things...

and do not top post please.

thanks,

greg k-h

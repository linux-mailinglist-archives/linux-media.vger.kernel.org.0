Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B341AEA82
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 09:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgDRHhX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 03:37:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:40834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgDRHhX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 03:37:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54978214D8;
        Sat, 18 Apr 2020 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587195442;
        bh=iAPUXTKI3a4Lf919uOzpA7MzDqimctNSK52EDg5FgPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WM0zWNRuWlPf4DLSvnGUmf+9//jgLQY689H0uzjPNPP4hJpNp8ieYEUEhuiuylV6j
         Ow2WpVrnjrDjq2TsJfS6nIuDYViR2PElqgwfvlD3BmCAFV3NQXoYT1ywHQJ++3hkli
         TMcsG4MC/2+8A5iS8dCZBWCrHhggd7tXpSIgxEj4=
Date:   Sat, 18 Apr 2020 09:37:19 +0200
From:   'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
To:     Sunyoung Kang <sy0816.kang@samsung.com>
Cc:     mchehab@kernel.org, 'Hans Verkuil' <hverkuil-cisco@xs4all.nl>,
        'Arnd Bergmann' <arnd@arndb.de>,
        'Thomas Gleixner' <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Message-ID: <20200418073719.GA2410414@kroah.com>
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
 <20200417024543.66785-1-sy0816.kang@samsung.com>
 <20200417083506.GB141762@kroah.com>
 <145301d6152f$6d5b6240$481226c0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <145301d6152f$6d5b6240$481226c0$@samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 18, 2020 at 12:14:09PM +0900, Sunyoung Kang wrote:
> Exynos video codec driver uses reserved2 value. How will reserved2 be used
> for future use?

No driver should be using the "reserved" fields, as they are "reserved"
by the api for future expansion of it.  They are not driver-specific
fields to be used that way at all.

thanks,

greg k-h

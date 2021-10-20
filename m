Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBFD43456A
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 08:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJTGu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 02:50:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhJTGu5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 02:50:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6B38610CB;
        Wed, 20 Oct 2021 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634712523;
        bh=MNfb1++EYpc9JxhagAgZLPvO4LJwE7gvMKEM/LbN6i8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u9MygGq8/TTQ25w1YPANrQUCmrRNQPVHQg08ROhbft6I7cd09LGuGuUN98+XgSbKb
         d39fbfycs9YExiWCN8xM36SsKNUnooDMyWASm/LDXcuBVan2sJscq7bIsDtLA7IZi6
         DgRpJzAhq7bokFh/ZcgXXwuodBZewVva2VZgCEXmEl/8ZAW0ocmhHcEbf9ubbbZXjl
         5w3u3xWZ8gw4x+9axAoO4/fOp5SFOX/VZGVXuGt3llQZgaXXLzv9JeCNIVLmhUVcNT
         t0IaQpOs+mV2sVqVeRaxo7GlQOmaO7G83cdd04v0JP1gp3HgI6ytQ2JiteEJXhMmWI
         byVHMk1rJlw3Q==
Date:   Wed, 20 Oct 2021 07:48:36 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [BUG 0/5] bug reports for atomisp to make it work
Message-ID: <20211020074836.42476792@sal.lan>
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 18 Oct 2021 01:23:31 +0900
Tsuchiya Yuto <kitakar@gmail.com> escreveu:

> Hi all,
> 
> These mails contain RFC patches, which are almost bug report and some
> are just bug report, for atomisp to work (again). Tested on Microsoft
> Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with v5.15-rc5.
> Both are Cherry Trail (ISP2401) devices.

Before start looking at the patches, let me check if I got it right:

Should this series be applied after the series you sent earlier[1]?

[1] The series which starts with this one:
	 [PATCH 00/17] various fixes for atomisp to make it work


Regards,
Mauro

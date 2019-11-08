Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1CC5F44BC
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 11:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbfKHKiM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 05:38:12 -0500
Received: from gofer.mess.org ([88.97.38.141]:54465 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbfKHKiM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 05:38:12 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9D5F5C64B1; Fri,  8 Nov 2019 10:38:10 +0000 (GMT)
Date:   Fri, 8 Nov 2019 10:38:10 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        Jan Pieter van Woerkom <jp@jpvw.nl>,
        Colin Ian King <colin.king@canonical.com>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [GIT PULL FOR v5.5] DVB/RC fixes
Message-ID: <20191108103810.GA14205@gofer.mess.org>
References: <20191108103520.GA13952@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108103520.GA13952@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 08, 2019 at 10:35:20AM +0000, Sean Young wrote:
> Hi Mauro,
> 
> This includes flexcop fixes which I had failed to pick up and the rc keymap
> for the Beelink GS1.
> 
> Thanks
> Sean
> 
> The following changes since commit 25a55a70307da947c04b6b8d27a6bc51b0dc569a:
> 
>   media: v4l2-device.h: fix typo: putss -> puts (2019-11-08 07:44:17 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/syoung/media_tree.git for-v5.5iv

The pull request should have been from the signed tag, not the branch.

I'll send a new pull request, sorry.

Sean

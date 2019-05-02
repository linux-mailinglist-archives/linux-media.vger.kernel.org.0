Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E281C12062
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 18:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfEBQjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 12:39:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbfEBQjK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 12:39:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79DA720651;
        Thu,  2 May 2019 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556815150;
        bh=gDPHbxt9LVMK97B1ZrH7kdXOc8HPO6c4G8WTx15fEc4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=140yulC8DoadNyUZ55ayejb1130wdBTw4D4+IfUpMQyEniosXTdV1uwLZ5z/ezqbc
         kCooq5wv7R8fe1Y8i714S8VgLKGRANs7Fy89FW2dzlhDU+rpO20wdeZ41ET5bd/PsJ
         piHve0dSw8BVyFfDIjaUL2P5vN4iJeXt2eQBUjsI=
Date:   Thu, 2 May 2019 18:39:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org,
        syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com,
        syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
Subject: Re: [PATCH] media: pvrusb2: use a different format for warnings
Message-ID: <20190502163907.GA14995@kroah.com>
References: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 02, 2019 at 06:09:26PM +0200, Andrey Konovalov wrote:
> When the pvrusb2 driver detects that there's something wrong with the
> device, it prints a warning message. Right now those message are
> printed in two different formats:
> 
> 1. ***WARNING*** message here
> 2. WARNING: message here
> 
> There's an issue with the second format. Syzkaller recognizes it as a
> message produced by a WARN_ON(), which is used to indicate a bug in the
> kernel. However pvrusb2 prints those warnings to indicate an issue with
> the device, not the bug in the kernel.
> 
> This patch changes the pvrusb2 driver to consistently use the first
> warning message format. This will unblock syzkaller testing of this
> driver.
> 
> Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

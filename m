Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6405F5C0
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 11:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfGDJg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 05:36:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:44576 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727256AbfGDJg3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jul 2019 05:36:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A9ED8AC9A;
        Thu,  4 Jul 2019 09:36:27 +0000 (UTC)
Message-ID: <1562232986.5819.50.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in cpia2_usb_disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     keescook@chromium.org, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, mchehab@kernel.org,
        tglx@linutronix.de, sakari.ailus@linux.intel.com,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        syzbot <syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Thu, 04 Jul 2019 11:36:26 +0200
In-Reply-To: <20190703171008.GA10080@gmail.com>
References: <0000000000006d7e14058cbc6545@google.com>
         <1562139729.5819.28.camel@suse.com> <20190703171008.GA10080@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 03.07.2019, 10:10 -0700 schrieb Eric Biggers:
> 
> Who are you talking to?  If you want syzbot to test your patch, follow the
> directions at https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches

Thanks. I am trying this out now.

	Regards
		Oliver


Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61429170A6
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2019 08:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfEHGBL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 May 2019 02:01:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37910 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfEHGBL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 May 2019 02:01:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id u21so7247431lja.5;
        Tue, 07 May 2019 23:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sYD9+E/4/XoUDaRkYMUADiIJQQKhTQMiegLZBQCWdeQ=;
        b=hxY9fMHp5/rO6PgFm+bLLhTEJOZlhH1uCpxVDBas08tJaNItd4/1FPBKSKnUS/FBO8
         rYnpART9cui/8qLC2osCdKiAoSQNUCC0FoUjgqDwWxljnwNDKag3nkJ4PsTkaTxEaW7U
         9Pna8VtvTdaQXWo4ori8YpSrCafUSasXaVCqeVqUb+a4V1x65bqh13DjKIW0b491zihI
         UYMP+F7LQmiicUObYe6LSdCmo8DcnzIqeGwUZyfHqyMfZ9DWlcuYXfXOj9Ku982S+328
         9bHUtOMcnXyMc1bKrqtL2pytaV2LMOQeoCiUdcmv57Lo1Pd/iEjyoivToQyg/LbaY36E
         LJTQ==
X-Gm-Message-State: APjAAAWuPwkRUlh5gZp0n800tNC0GUNiQ4NxoX/VG/jh0cUx8EcmuwFj
        4muNXwxpp9VDKpxcQFl/XJ0=
X-Google-Smtp-Source: APXvYqza0CZWlPSgLA7IgDuZhwVWblmudSgskyaj5E9KRpc6lD0fHoYM8Xp/sc1DRW72zYxmU4OrRw==
X-Received: by 2002:a2e:8583:: with SMTP id b3mr15414491lji.136.1557295269233;
        Tue, 07 May 2019 23:01:09 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id f12sm3783105lfk.6.2019.05.07.23.01.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 23:01:08 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hOFdc-0004Ox-3H; Wed, 08 May 2019 08:01:08 +0200
Date:   Wed, 8 May 2019 08:01:08 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     mchehab@kernel.org, andreyknvl@google.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com, wen.yang99@zte.com.cn
Subject: Re: [PATCH] media: usb: siano: Fix general protection fault in smsusb
Message-ID: <20190508060108.GC29016@localhost>
References: <0000000000004a08f805883ead54@google.com>
 <Pine.LNX.4.44L0.1905071237310.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1905071237310.1632-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 07, 2019 at 12:39:47PM -0400, Alan Stern wrote:
> The syzkaller USB fuzzer found a general-protection-fault bug in the
> smsusb part of the Siano DVB driver.  The fault occurs during probe
> because the driver assumes without checking that the device has both
> IN and OUT endpoints and the IN endpoint is ep1.
> 
> By slightly rearranging the driver's initialization code, we can make
> the appropriate checks early on and thus avoid the problem.  If the
> expected endpoints aren't present, the new code safely returns -ENODEV
> from the probe routine.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+53f029db71c19a47325a@syzkaller.appspotmail.com
> CC: <stable@vger.kernel.org>

Reviewed-by: Johan Hovold <johan@kernel.org>

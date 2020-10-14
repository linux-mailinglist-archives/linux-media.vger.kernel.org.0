Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F64428E32B
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgJNPVp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgJNPVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:21:45 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F0BC061755;
        Wed, 14 Oct 2020 08:21:44 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VrLQW+SuMKNB7Na2eNnHXPq8gFvVVyLEvmFOOqqYUHY=;
        b=vHInMllQpsfJE/tP7k2yvdsOXBcICl/zIEJdebwIQkAIpZzymjh6johak1zSwFpYmbD+Jf
        PMz4oxQKdZ/sM0ugOHkzsab7vErwYFtfXRCjvMheEBCLY8FmttHtWiaH056a+1HG0RlIKs
        cJYK7SHGDxDrsq2vBb2lJ0961ZvOduhTwN5+cT4QAK3FiyrDJc3Ak/u/7CNczEXo9dcmr1
        a09BulmFMNdDKV4F02AAvbwoP/qtO8fxgX63MgsiOUC0hq3HjzPWR4/QB7bl4hu5ta8Rcx
        RerFKH2bLBIuRKel/ZjrpM3eG4LW9PQZ3zcX4GbX3W4M6tTxoj5bBaWxZFcRHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VrLQW+SuMKNB7Na2eNnHXPq8gFvVVyLEvmFOOqqYUHY=;
        b=Noa2vkyER+3wwL3RorSIKnSvDvfW6+8jXvARwESGZ3F0BF/xsdQmB8PZmZnK7RyGlVmPJc
        Jj5ErBEfv7f9IKDQ==
To:     kernel test robot <lkp@intel.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kbuild-all@lists.01.org, Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org
Subject: Re: [patch 4/4] media: cx231xx: Consolidate dmesg output
In-Reply-To: <202010142250.7T8Tm5kT-lkp@intel.com>
References: <20201013143731.974452990@linutronix.de> <202010142250.7T8Tm5kT-lkp@intel.com>
Date:   Wed, 14 Oct 2020 17:21:43 +0200
Message-ID: <87o8l4bzp4.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14 2020 at 22:36, kernel test robot wrote:
>    drivers/media/usb/cx231xx/cx231xx-vbi.c: In function 'cx231xx_init_vbi_isoc':
>>> drivers/media/usb/cx231xx/cx231xx-vbi.c:411:5: warning: format '%s' expects a matching 'char *' argument [-Wformat=]
>      411 |     "unable to allocate %i bytes for transfer buffer %i%s\n",

Duh.

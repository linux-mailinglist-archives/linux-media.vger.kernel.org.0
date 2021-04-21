Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645B93673F6
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 22:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243585AbhDUUEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 16:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242586AbhDUUEo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 16:04:44 -0400
X-Greylist: delayed 150 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 21 Apr 2021 13:04:11 PDT
Received: from resqmta-ch2-02v.sys.comcast.net (resqmta-ch2-02v.sys.comcast.net [IPv6:2001:558:fe21:29:69:252:207:34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D15BC06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 13:04:10 -0700 (PDT)
Received: from resomta-ch2-14v.sys.comcast.net ([69.252.207.110])
        by resqmta-ch2-02v.sys.comcast.net with ESMTP
        id ZH8FliPf2GhhbZJ2Ul3nqJ; Wed, 21 Apr 2021 20:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1619035294;
        bh=R1eFT3TbHQ79N9iJILMUWKZQIx+Os6QTVe+069RWyZg=;
        h=Received:Received:Message-ID:Subject:From:Reply-To:To:Date:
         Content-Type:Mime-Version;
        b=HQz+SfCr6bkrvdxPt9euxHDr7SK1PrekkhsGohSyoVZCP9cA61Ly0RUnNjFRRkOPF
         ktMjZSKgBbnUDKyjVLnfWUFn30NNaI7dEZYT3eQTv2HzhrM7lewaxhYw8swlPjjJ4q
         lWYdkmTlUfxqy9L2Jcgeh/VOfSkJtoZO0ZKltrpOQTG3KKPwqwkHx9mnk7wE3sKi0Z
         0lvuBy488FOiMoqWqY/7WYsiHa1xq6tc6DchSovdIVEJbWwcMzAO6Y9FiMnIKyHdty
         srPUOXKaiQB4SoeFoEKGZnpc5hUlUrGvSEQBJ5AlaVa8YpTfsUY5tmxNZqMIPd/gDE
         DLZPaaxK/JRNw==
Received: from li-e3e0f04c-3231-11b2-a85c-e8fd2d0337e5.ibm.com
 ([IPv6:2601:782:500:1996:b82d:9bb8:4e2d:9685])
        by resomta-ch2-14v.sys.comcast.net with ESMTPA
        id ZJ2Hl65QrUKvVZJ2TlCHWr; Wed, 21 Apr 2021 20:01:34 +0000
X-Xfinity-VMeta: sc=0.00;st=legit
Message-ID: <ad6e8f222e17a64474b5742a0843661048b6e6e3.camel@comcast.net>
Subject: Logitech BRIO Ultra HD Web Cam Support
From:   Joseph Noonan <jgnoonan@comcast.net>
Reply-To: jgnoonan@comcast.net
To:     linux-media@vger.kernel.org
Date:   Wed, 21 Apr 2021 16:01:21 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following Logitech device does not appear in the list:

Bus 002
Device 002: ID 046d:085e Logitech, Inc. 
Bus 001 Device 003: ID 046d:0ab7 Logitech, Inc.

I presume one is the camera and one is the integrated microphone.
Is this device going to be supported in the future?

Regards

Joe Noonan
jgnoonan@us.ibm.com


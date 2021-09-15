Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF1F40CA7E
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 18:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhIOQlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhIOQlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 12:41:22 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24ACC061574;
        Wed, 15 Sep 2021 09:40:03 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9CAF4C63A9; Wed, 15 Sep 2021 17:40:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1631724001; bh=IABfhztGnlMXEpsxQ8v8A8fnBNDV0RiYcWT+0iLBunM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YQWDQbcXIwUcRTKBnNaeKY7Ecsb+XVDNlE8p6thv3jpib8s1h5WwxaNpll/wjDUSE
         1qcOxWZh+hNye5YjGETQ5sbR/tY3dq+OGMAgDv56xnYv6Nk1VowQGcEy6L4IOmvHBJ
         Sfwk20ghziigp2RPQ79ngPw6vDNcbCcNAe1xDErUz18w0VPNLMbbd2QkudS2CQaRFB
         QN3dh73mLveDsdSAsxIsm7iFy+HbimA6juBlKrA2W+PkUtSakTZkq1tuQSYtIxQDq1
         NVjO02vcNdP5I8A/++wu5vcDNQA3iag5BQZE1N0ccmzaWlEsGZotivwKRY67ZNblMP
         4vOTdJKbvnrrQ==
Date:   Wed, 15 Sep 2021 17:40:01 +0100
From:   Sean Young <sean@mess.org>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] media: mxl111sf: change mutex_init() location
Message-ID: <20210915164001.GA18319@gofer.mess.org>
References: <20210819103859.17498-1-paskripkin@gmail.com>
 <20210819104221.27122-1-paskripkin@gmail.com>
 <c1c0d250-afa1-254e-421a-d35790688c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1c0d250-afa1-254e-421a-d35790688c60@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 12, 2021 at 06:49:52PM +0300, Pavel Skripkin wrote:
> On 8/19/21 13:42, Pavel Skripkin wrote:
> > Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
> > mutex. The problem was in wrong mutex_init() location.
> > 
> > Previous mutex_init(&state->msg_lock) call was in ->init() function, but
> > dvb_usbv2_init() has this order of calls:
> > 
> > 	dvb_usbv2_init()
> > 	  dvb_usbv2_adapter_init()
> > 	    dvb_usbv2_adapter_frontend_init()
> > 	      props->frontend_attach()
> > 
> > 	  props->init()
> > 
> > Since mxl111sf_* devices call mxl111sf_ctrl_msg() in ->frontend_attach()
> > internally we need to initialize state->msg_lock before
> > frontend_attach(). To achieve it, ->probe() call added to all mxl111sf_*
> > devices, which will simply initiaize mutex.
> > 
> > Reported-and-tested-by: syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
> > Fixes: 8572211842af ("[media] mxl111sf: convert to new DVB USB")
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Hi, Sean!
> 
> Did you have a chance to review this patch? Thank you :)

Sorry during the merge window (from -rc6 to -rc1) I don't tend to look
at patches. Looks good to me, I'll merge it.

Thanks

Sean

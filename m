Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E807D023
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 23:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbfGaVcw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 17:32:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39262 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfGaVcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 17:32:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so31089209pls.6;
        Wed, 31 Jul 2019 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=N9gPxJSS+drGx3gkBDyyqIUQ628VPY96K/YYURGM20I=;
        b=YNHkNtgBwrh6nbpMkE8s3S3DSkUREUY/zJ2lSMLIGS/mcdDXEu61HGn0u5lfYe3SdE
         6Go5On1veg0XK8WJi7hoYXZsPxNh6JX/ZFzk1LCQZezGU+hn7E8ciqMiM9d7WnhBcwQj
         nDiRLpMV4Zq/V35AdaeT1sCJXmtALheS2q/h34dZDk1FD0d4udGXjbhjiVXFkebOUkwp
         tC/WiopiafnP5mBCYfGZRFa6iihOMplq97v1Opz9zqHRdPf67wWlmGbpxJxtNgt7Te6H
         GmKh7Hrtxj49Gps3mFuGfssRxNEXAT2EnQFktBFA4a51QQRptYLap9SIcJAHb3vhMmkb
         WHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=N9gPxJSS+drGx3gkBDyyqIUQ628VPY96K/YYURGM20I=;
        b=XBc3O3OuayndMfKq5gw+uarNizVhl3NSbYQ7w/sJuCnzJgv9JAOtKyHcdyNXN17hUQ
         opaxwjTkHYw+/1mPxTuwq5LNRC3z22IfCCtkO0DBuohV6yCue4NNR9ozenOd7YT4xoyI
         qromiBcEnEJPp/aVlVO0ls0oBgAbuFJCFpa3RpJU51MDUKF3amUMGefcWPGfYsRpE4Ke
         ObeKXjdorMRCkhDvtjefK1IQOkMSFEwHs+ZPS4R2lo/ObZMM1mpS1nlMgNSRBlyTG78h
         3az5yw/GHZ2qD0hyR576MTvws+r9cNiqcJ9hQ57dANT+vLlFz2eLD6wEc2iKinaJasOi
         QN/A==
X-Gm-Message-State: APjAAAUrKYtNfp3gzm5FU1GmjYh5tIs00EW/7NXnau2D2J+NFUHivT2R
        CAn+e+UC02v2JNtxP9bfPSpp/J0XgBY=
X-Google-Smtp-Source: APXvYqwtPtb7EptjDKSGnhnZQetheDAKXUj8SLRER2Ll27IMu2RKc7zxzE2dlBUODNwFvzF3lXVDfA==
X-Received: by 2002:a17:902:6b85:: with SMTP id p5mr118280098plk.225.1564608771566;
        Wed, 31 Jul 2019 14:32:51 -0700 (PDT)
Received: from [192.168.1.4] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id i7sm2309345pjk.24.2019.07.31.14.32.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 14:32:50 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@exun.local>
Date:   Wed, 31 Jul 2019 14:32:46 -0700 (PDT)
To:     Hans Verkuil <hverkuil@xs4all.nl>
cc:     Mark Balantzyan <mbalant3@gmail.com>,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media input infrastructure:tw686x: Fix of possibleinconsistent
 memory deallocation and/or race condition by implementation of custom
 video_device_release function in tw686x driver
In-Reply-To: <40d14e23-636e-ed8a-6608-99427f5b8169@xs4all.nl>
Message-ID: <alpine.OSX.2.21.1907311431410.3567@exun.local>
References: <alpine.DEB.2.21.1907291256080.16959@mbalantz-desktop> <40d14e23-636e-ed8a-6608-99427f5b8169@xs4all.nl>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, all,

Sorry for the poor patching, I am a student and as you may tell still new 
to this system. At the time of the patching, I wasn't fully informed of 
all the requirements that go into such things, and am still learning.

Would it be alright if I submit a report instead? In order to, I am 
(still, sorry) trying to understand the issue at hand. How in fact may the 
release() callback be overridden (by a tw686x-specific function) to free 
the dma memory and call video_device_release()? To my understanding at the 
time, this was merely a re-implementation of video_device_release with 
said requirements and subtraction of extra features from 
tw686x_video_free()..

 	This release() callback is called by the V4L2 framework when the last user
 	of the device closes its filehandle, so that's a good point to free all
 	the memory. Doing it earlier (as the current code does) runs the risk that someone might
 	still access that memory, and you don't want that.

Yes, I definitely don't want that. :)

Thank you,
Mark

